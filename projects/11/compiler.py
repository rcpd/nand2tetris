"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.
"""

import xml.etree.ElementTree as ET


operators = ["+", "-", "*", "/", "&", "|", "<", ">", "~", "="]
op_map = {"+": "add", "-": "sub", "*": "call Math.multiply 2", "/": "call Math.divide 2", "&": "and", "|": "or",
          "~": "not", "<": "lt", ">": "gt", "=": "eq"}


def find_parent(tree, node):
    """
    Draw a map of the tree and yield the parent from node
    """
    parent_map = {c: p for p in tree.iter() for c in p}
    return parent_map[node]


def find_ancestor(tree, node, ancestors):
    """
    Draw a map of the tree and yield the parent from node until ancestor is found
    """
    if node.tag not in ancestors:
        parent_map = {c: p for p in tree.iter() for c in p}
        while parent_map[node].tag not in ancestors:
            node = parent_map[node]
    return node


def store_pcode(pcode, cmd, write=None, debug=True):
    if debug:
        if cmd.strip() != "":
            print(cmd)

    if write:
        # debug/wip write
        with open(write.replace(".jack", ".vm"), "w") as pcode_file:
            pcode_file.writelines(pcode)
    else:
        # overwrite at end if successful
        # don't append empty debug "write" calls
        pcode.append(cmd+"\n")

    return pcode


def label_index(class_dict, class_name, func_name, label_type):
    labels = class_dict[class_name][func_name]["label_dict"]
    if label_type in labels:
        labels[label_type] += 1
    else:
        labels[label_type] = 0
    class_dict[class_name][func_name]["label_dict"] = labels
    return class_dict, labels[label_type]


def compile_class(pcode, input_list, i, class_dict, pre=False):
    """
    input_list[i][0] == "keyword" and input_list[i][1] == "class"
    input_list[j][0] == "identifier"
    """
    # define class_name and initialize symbol table
    class_name = input_list[i][1]
    if pre:
        if class_name not in class_dict:
            class_dict[class_name] = {"args": {}, "index_dict": {}}
    else:
        store_pcode(pcode, "// class %s" % class_name)

    return pcode, class_dict, class_name


def compile_function(pcode, input_list, i, class_dict, class_name, pre=False):
    """
    # parent.tag == "class"
    # input_list[i][0] == "keyword" and input_list[i][1] in ("function", "method", "constructor")
    # if input_list[j][0] == "keyword" and input_list[j+1][0] == "identifier":
    """
    func_name = input_list[i][1]
    j = i
    if pre:
        # define function symbol
        if input_list[j-2][1] in ("function", "method"):
            if input_list[j][1] not in class_dict[class_name]:
                class_dict[class_name][input_list[j][1]] = {"kind": input_list[j-2][1], "type": input_list[j-1][1],
                                                            "args": {}, "index_dict": {}, "label_dict": {}}
            # define function arguments
            if input_list[j+1][1] == "(":
                while input_list[j+2][1] != ")":
                    if input_list[j+2][1] == ",":
                        j += 1
                        continue
                    if input_list[j+2][0] == "keyword" and input_list[j+3][0] == "identifier":
                        # update func/arg index
                        if "argument" not in class_dict[class_name][func_name]["index_dict"]:
                            class_dict[class_name][func_name]["index_dict"]["argument"] = 0
                        else:
                            class_dict[class_name][func_name]["index_dict"]["argument"] += 1

                        class_dict[class_name][func_name]["args"][input_list[j+3][1]] = \
                            {"kind": "argument", "type": input_list[j+2][1],
                             "index": class_dict[class_name][func_name]["index_dict"]["argument"]}
                        j += 2
            else:
                raise RuntimeError

        elif input_list[i-2][1] == "constructor":
            pass
        else:
            raise RuntimeError

    if not pre:
        if "local" in class_dict[class_name][input_list[i][1]]["index_dict"]:
            store_pcode(pcode, "\n%s %s.%s %s" % (input_list[i-2][1], class_name, input_list[i][1],
                                                  class_dict[class_name][input_list[i][1]]["index_dict"]["local"]+1))
        else:
            store_pcode(pcode, "\n%s %s.%s %s" % (input_list[i-2][1], class_name, input_list[i][1], 0))
    return pcode, class_dict, func_name


# def compile_classvardec(pcode, input_list, i, class_dict):
#     return pcode, class_dict


def compile_vardec(pcode, input_list, i, class_dict, class_name, func_name, pre=False):
    """
    input_list[i][0] == "keyword" and input_list[i][1] == "var":
    """
    if input_list[i+1][0] == "keyword" and input_list[i+2][0] == "identifier":
        j = i
        while input_list[j+2][1] != ";":
            # var <type> <name> // var <type> <name>, <name>, ...

            # skip to next var
            if input_list[j+2][1] == ",":
                j += 1
                continue

            # update func/local index
            if pre:
                if "local" not in class_dict[class_name][func_name]["index_dict"]:
                    class_dict[class_name][func_name]["index_dict"]["local"] = 0
                else:
                    class_dict[class_name][func_name]["index_dict"]["local"] += 1

                # add var to func/args
                class_dict[class_name][func_name]["args"][input_list[j+2][1]] = \
                    {"kind": "local", "type": input_list[i+1][1],
                     "index": class_dict[class_name][func_name]["index_dict"]["local"]}

            if not pre:
                store_pcode(pcode, "// var %s %s (local %s)" %
                            (input_list[i+1][1], input_list[j+2][1],
                             class_dict[class_name][func_name]["args"][input_list[j+2][1]]["index"]))

            j += 1

    else:
        raise RuntimeError(input_list[i+1])

    return pcode, class_dict


def compile_expression(pcode, input_list, i, class_dict, class_name, func_name, sub=False, proc=None):
    if not sub:
        proc = []
    j = i  # i = start pos, j = search pos
    # recurse until all brackets unpacked
    while input_list[j][1] not in (";", "{"):
        if input_list[j][1] == "(" and input_list[j+1][1] != ")":
            pcode, proc = compile_expression(pcode, input_list, j+1, class_dict, class_name, func_name, sub=True,
                                             proc=proc)
        j += 1

    # process expression
    while input_list[i][1] not in (")", ";", "{"):
        if i in proc:
            return pcode, proc

        k = 0
        # parse x <op> y expressions
        if input_list[i][0] == "integerConstant":
            store_pcode(pcode, "push constant %s" % input_list[i][1])
            proc.append(i)
            k += 1
        elif input_list[i][0] == "identifier":
            var = class_dict[class_name][func_name]["args"][input_list[i][1]]
            store_pcode(pcode, "push %s %s // %s" % (var["kind"], var["index"], input_list[i][1]))
            proc.append(i)
            k += 1
        elif input_list[i][1] in operators:
            if input_list[i+1][0] == "integerConstant":
                store_pcode(pcode, "push constant %s" % input_list[i+1][1])
                proc.append(i+1)
                k += 1
            elif input_list[i+1][0] == "identifier":
                var = class_dict[class_name][func_name]["args"][input_list[i+1][1]]
                store_pcode(pcode, "push %s %s // %s" % (var["kind"], var["index"], input_list[i+1][1]))
                proc.append(i+1)
                k += 1

            if input_list[i][1] == "-":
                store_pcode(pcode, "neg")  # comes after the value being neg'd
                proc.append(i)
                k += 1

                if input_list[i-1][1] not in (",", "("):
                    store_pcode(pcode, "add")  # x-y == -y+x

            else:
                store_pcode(pcode, "%s" % op_map[input_list[i][1]])  # parse op
                proc.append(i)
                k += 1
        elif input_list[i][1] == "(":
            if sub and k == 0:
                # if "(" returned on first pos seek past previous expression
                while input_list[i+k][1] != ")":
                    k += 1  # lands on ")"
                k += 1  # step into next expression
            else:
                return pcode, proc  # else terminate current level of recursion
        elif input_list[i][1] == ",":
            k += 1
        else:
            raise RuntimeError(input_list[i])

        i += k

    return pcode, proc


def compile_statement(pcode, input_list, i, class_dict, class_name, func_name):
    """
    input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return")
    """
    if input_list[i][1] == "do":
        pcode, class_dict = compile_sub_statement(pcode, input_list, i+1, class_dict, class_name, func_name)
    elif input_list[i][1] == "let":
        # let <var> = x;
        if input_list[i+2][1] == "=":
            # handle right side of assignment first
            pcode, class_dict = compile_sub_statement(pcode, input_list, i+3, class_dict, class_name, func_name)

            if input_list[i+1][0] == "identifier":
                # pop result into destination segment
                var = class_dict[class_name][func_name]["args"][input_list[i+1][1]]
                store_pcode(pcode, "pop %s %s // %s" % (var["kind"], var["index"], input_list[i+1][1]))
            else:
                raise RuntimeError(input_list[i+1])
        else:
            raise RuntimeError(input_list[i+2])

    elif input_list[i][1] == "return":
        if input_list[i+1][1] != ";":
            pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
        store_pcode(pcode, "return")
    elif input_list[i][1] == "while":
        class_dict, while_index = label_index(class_dict, class_name, func_name, "while")
        store_pcode(pcode, "\nlabel WHILE_TEST_%s_%s // while <expression>" % (func_name, while_index))
        pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
        store_pcode(pcode, "\nif-goto WHILE_TRUE_%s_%s // enter while" % (func_name, while_index))
        store_pcode(pcode, "goto WHILE_FALSE_%s_%s // exit while" % (func_name, while_index))
        store_pcode(pcode, "label WHILE_TRUE_%s_%s // start while" % (func_name, while_index))
    elif input_list[i][1] == "if":
        class_dict, if_index = label_index(class_dict, class_name, func_name, "if")
        store_pcode(pcode, "\n// if <expression>")
        pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
        store_pcode(pcode, "\nif-goto IF_%s_%s // enter if" % (func_name, if_index))
        store_pcode(pcode, "goto ELSE_%s_%s // exit if or enter else" % (func_name, if_index))
        store_pcode(pcode, "label IF_%s_%s // start if" % (func_name, if_index))
    else:
        raise RuntimeError(input_list[i])
    return pcode, class_dict


def compile_sub_statement(pcode, input_list, i, class_dict, class_name, func_name):
    """
    Compile common components of statements
    """
    j = i
    while input_list[j][1] != ";":
        if input_list[j][0] == "identifier":
            # call
            if input_list[j+1][1] == "." and input_list[j+2][0] == "identifier" and input_list[j+3][1] == "(":
                if input_list[j+4][1] != ")":
                    # parse function params
                    pcode, proc = compile_expression(pcode, input_list, j+4, class_dict, class_name, func_name)

                # count params for call
                k = j+4
                num_params = 0
                if input_list[k][1] != ")":
                    num_params = 1
                while input_list[k][1] != ";":
                    if input_list[k][1] == ",":
                        num_params += 1
                    k += 1

                # compile call
                store_pcode(pcode, "call %s.%s %s" % (input_list[j][1], input_list[j+2][1], num_params))
                return pcode, class_dict
            else:
                pcode, proc = compile_expression(pcode, input_list, j, class_dict, class_name, func_name)
                return pcode, class_dict

        elif input_list[j][0] == "keyword" and input_list[j][1] in ("true", "false"):
            if input_list[j][1] == "true":
                store_pcode(pcode, "push constant 1")
                store_pcode(pcode, "neg")
            else:
                store_pcode(pcode, "push constant 0")
        else:
            raise RuntimeError(input_list[j])
        j += 1
    return pcode, class_dict


def main(debug=False):
    jack_filepaths = [
        # r"..\09\Average\Main.jack",
        # r"..\09\Fraction\Main.jack",
        # r"..\09\Fraction\Fraction.jack",
        # r"..\09\HelloWorld\Main.jack",
        # r"..\09\List\Main.jack",
        # r"..\09\List\List.jack",
        # r"..\09\Square\Main.jack",
        # r"..\09\Square\Square.jack",
        # r"..\09\Square\SquareGame.jack",
        # r"..\10\ArrayTest\Main.jack",
        # r"..\10\ExpressionLessSquare\Main.jack",
        # r"..\10\ExpressionLessSquare\Square.jack",
        # r"..\10\ExpressionLessSquare\SquareGame.jack",
        # r"..\10\Square\Main.jack",
        # r"..\10\Square\Square.jack",
        # r"..\10\Square\SquareGame.jack",

        r"..\11\Seven\Main.jack",
        r"..\11\ConvertToBin\Main.jack",
    ]

    for filepath in jack_filepaths:
        print("Parsing: %s" % filepath)
        input_tree = ET.parse(filepath.replace(".jack", "T_out.xml"))
        input_root = input_tree.getroot()
        output_root = ET.Element("class")
        input_list = []
        pcode = []

        # read the token XML into something else more easily traversed
        for input_child in input_root:
            if input_child.tag == "tokens":
                continue
            element = input_child.text.strip()
            input_list.append((input_child.tag, element))

        # process the token stream
        parent = output_root

        class_name = None
        func_name = None
        class_dict = {}

        # pre-process stream for class/function definitions
        for i, token in enumerate(input_list):
            if token[0] == "keyword":
                if token[1] == "class" and input_list[i+1][0] == "identifier":
                    pcode, class_dict, class_name = compile_class(pcode, input_list, i+1, class_dict, pre=True)
                    store_pcode(pcode, "", write=filepath)
                elif token[1] in ("function", "method") and input_list[i+2][0] == "identifier":
                    pcode, class_dict, func_name = \
                        compile_function(pcode, input_list, i+2, class_dict, class_name, pre=True)
                    store_pcode(pcode, "", write=filepath)
                elif token[1] == "var" and input_list[i+1][0] == "keyword":
                    pcode, class_dict = compile_vardec(pcode, input_list, i, class_dict, class_name, func_name,
                                                       pre=True)
                    store_pcode(pcode, "", write=filepath)

        for i, input_tuple in enumerate(input_list):
            j = i+1  # next token

            if debug:
                store_pcode(pcode, "// line: %s %s" % (input_tuple[0], input_tuple[1]))

            # process tokens
            try:
                # close decs/expressions/statements ;
                # varDec/classVarDec, term/expression, letStatement/doStatement/returnStatement
                if input_list[i][0] == "symbol" and input_list[i][1] == ";":
                    if parent.tag in ("term", "expression"):
                        # close parent until all desired tags closed
                        for tag in ("term", "expression"):
                            if tag == parent.tag:
                                parent = find_parent(output_root, parent)

                        # insert current token
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                        # if required close letStatement/doStatement after ;
                        if parent.tag in ("letStatement", "doStatement", "returnStatement"):
                            parent = find_parent(output_root, parent)

                    elif parent.tag in ("varDec", "classVarDec", "doStatement", "returnStatement"):
                        # insert current token and update parent
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]
                        parent = find_parent(output_root, parent)

                # open class definition: class className {
                elif input_list[i][0] == "keyword" and input_list[i][1] == "class":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if input_list[j][0] == "identifier":
                        pcode, class_dict, class_name = compile_class(pcode, input_list, j, class_dict)
                        store_pcode(pcode, "", write=filepath)
                    else:
                        raise RuntimeError()

                # open subroutineDec
                elif parent.tag == "class" and input_list[i][0] == "keyword" \
                        and input_list[i][1] in ("function", "method", "constructor"):
                    # insert new parent and current token as child
                    parent = ET.SubElement(parent, "subroutineDec")
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if input_list[j][0] == "keyword" and input_list[j+1][0] == "identifier":
                        pcode, class_dict, func_name = compile_function(pcode, input_list, j+1, class_dict, class_name)
                        store_pcode(pcode, "", write=filepath)

                # open classVarDec
                elif parent.tag == "class" and input_list[i][0] == "keyword" \
                        and input_list[i][1] not in ("function", "method", "constructor"):
                    # only process if there are elements to add
                    if not (input_list[j][0] == "keyword" and input_list[j][1] in
                            ("function", "method", "constructor")):
                        # insert new parent and current token as child
                        parent = ET.SubElement(parent, "classVarDec")
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                        # pcode, class_dict = compile_classvardec(pcode, input_list, i, class_dict)
                        # store_pcode(pcode, "", write=filepath)

                # open varDec
                elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                    # insert new parent and current token as child
                    parent = ET.SubElement(parent, "varDec")
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    pcode, class_dict = compile_vardec(pcode, input_list, i, class_dict, class_name, func_name)
                    store_pcode(pcode, "", write=filepath)

                # close statements/whileStatement/subroutineBody/subroutineDec }
                elif parent.tag in ("statements", "whileStatement", "ifStatement", "subroutineBody") \
                        and input_list[i][0] == "symbol" and input_list[i][1] == "}":

                    if parent.tag == "statements":
                        # close parent and insert current token
                        parent = find_parent(output_root, parent)
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                    if parent.tag == "ifStatement":
                        # don't close ifStatement if } followed by else
                        if_index = class_dict[class_name][func_name]["label_dict"]["if"]
                        if input_list[j][0] == "keyword" and input_list[j][1] == "else":
                            store_pcode(pcode, "\ngoto IF_END_%s_%s // jump over else" % (func_name, if_index))
                            store_pcode(pcode, "\nlabel ELSE_%s_%s // else" % (func_name, if_index))
                        else:
                            parent = find_parent(output_root, parent)
                            store_pcode(pcode, "label IF_END_%s_%s // exit if" % (func_name, if_index))
                            class_dict[class_name][func_name]["label_dict"]["if"] -= 1

                    if parent.tag == "whileStatement":
                        # close parent
                        parent = find_parent(output_root, parent)
                        while_index = class_dict[class_name][func_name]["label_dict"]["while"]
                        store_pcode(pcode, "\ngoto WHILE_TEST_%s_%s // loop or exit" % (func_name, while_index))
                        store_pcode(pcode, "label WHILE_FALSE_%s_%s // exit while\n" % (func_name, while_index))
                        class_dict[class_name][func_name]["label_dict"]["while"] -= 1

                    if parent.tag == "subroutineBody":
                        # close parent(s)
                        parent = find_parent(output_root, parent)
                        parent = find_parent(output_root, parent)  # subroutineDec

                # close expression (nested in term)
                elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i][1] in "]" \
                        and find_parent(output_root, find_parent(output_root, parent)).tag == "term":
                    # close parent until all tags closed
                    for tag in ("term", "expression", "expressionList"):
                        if tag == parent.tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close term/expression/expressionList ) or ]
                elif parent.tag in ("term", "expression", "expressionList") \
                        and input_list[i][0] == "symbol" and input_list[i][1] in (")", "]"):
                    # close parent until all tags closed
                    for tag in ("term", "expression", "expressionList"):
                        while tag == parent.tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close term: symbols except "." and "("
                elif parent.tag == "term" and input_list[i][0] == "symbol" \
                        and input_list[i][1] not in (".", "(", "[", ","):
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close/open term/expression: ,
                elif parent.tag == "term" and input_tuple == ("symbol", ","):
                    # close parents and insert current token
                    parent = find_parent(output_root, parent)
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new tokens and update parents
                    parent = ET.SubElement(parent, "expression")
                    parent = ET.SubElement(parent, "term")

                # open expression/expressionList
                elif (input_list[i][0] == "symbol" and input_list[i][1] == "=") \
                    or (parent.tag in ("expression", "term", "letStatement", "whileStatement", "doStatement",
                        "ifStatement") and input_list[i][0] == "symbol" and input_list[i][1] in ("(", "[")):

                    if parent.tag != "expression":
                        # insert current token
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                        # pcode, proc = compile_expression(pcode, input_list, i, class_dict, class_name, func_name)
                        # store_pcode(pcode, "", write=filepath)

                        if parent.tag not in ("letStatement", "whileStatement", "ifStatement") \
                                and input_list[i][1] != "[":
                            # test if already part of expressionList
                            # term > expression > expressionList
                            if parent.tag == "term":
                                grandparent = find_parent(output_root, parent)
                                if grandparent.tag == "expression":
                                    great_grandparent = find_parent(output_root, grandparent)
                                    if great_grandparent.tag == "expressionList":
                                        # insert new token and update parent
                                        parent = ET.SubElement(parent, "expression")
                                        continue

                            parent = ET.SubElement(parent, "expressionList")

                        # insert new token and update parent
                        parent = ET.SubElement(parent, "expression")
                    else:
                        # insert new parent and current token as child
                        parent = ET.SubElement(parent, "term")
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                        # insert new token and update parent
                        parent = ET.SubElement(parent, "expression")

                # open expression (return)
                elif parent.tag == "returnStatement" and input_tuple != ("keyword", "return"):
                    # insert new tokens and update parents with current token as child
                    parent = ET.SubElement(parent, "expression")
                    parent = ET.SubElement(parent, "term")
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # pcode, proc = compile_expression(pcode, input_list, i, class_dict, class_name, func_name)
                    # store_pcode(pcode, "", write=filepath)

                # open term / nested term
                elif parent.tag == "expression":
                    # insert new parent and current token as child
                    parent = ET.SubElement(parent, "term")
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if input_list[i][0] == "symbol" and input_list[i][1] in operators:
                        # insert new token and update parent
                        parent = ET.SubElement(parent, "term")

                # open statements (letStatement/doStatement/whileStatement/ifStatement)
                elif input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return"):
                    # if required insert statements & update parent
                    if parent.tag != "statements":
                        # insert new token and update parent
                        parent = ET.SubElement(parent, "statements")

                    # insert new token and update parent
                    parent = ET.SubElement(parent, input_list[i][1]+"Statement")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    pcode, class_dict = compile_statement(pcode, input_list, i, class_dict, class_name, func_name)
                    store_pcode(pcode, "", write=filepath)

                # close parameterList
                elif parent.tag == "parameterList" and input_list[i][0] == "symbol" and input_list[i][1] == ")":
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "subroutineBody")

                # open parameterList
                elif parent.tag == "subroutineDec" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "parameterList")

                # insert current token
                else:
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

            except IndexError:
                if j == len(input_list):
                    pass  # can't eval look-ahead rules from last token
                else:
                    raise

        # write output
        output_filepath = filepath.replace(".jack", ".vm")
        print("Writing: %s" % output_filepath)

        with open(output_filepath, "w") as output_file:
            output_file.writelines(pcode)


if __name__ == '__main__':
    main(debug=False)
