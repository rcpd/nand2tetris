"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.

class_dict = {"class_name": {"arg_list": [], "func_name": {"type": "func", "kind": "void",
"arg_list": []}, "index_dict": {"local", 0}}}}
arg_list: [{"name": "var_name": "type": "int", "kind": "local", "index": 0}}]

"""

import os
import xml.etree.ElementTree as ET

from xml.dom import minidom


operators = ["+", "-", "*", "/", "&", "|", "<", ">", "~"]
op_map = {"+": "add", "-": "sub", "*": "call Math.multiply 2", "/": "call Math.divide 2", "&": "and", "|": "or",
          "~": "not", "<": "lt", ">": "gt"}


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


def store_pcode(pcode, cmd, debug=True):
    if debug:
        print(cmd)
    pcode.append(cmd+"\n")
    return pcode


def compile_class(pcode, input_list, i, class_dict, pre=False):
    """
    input_list[i][0] == "keyword" and input_list[i][1] == "class"
    input_list[j][0] == "identifier"
    """
    # define class_name and initialize symbol table
    class_name = input_list[i][1]
    if class_name not in class_dict:
        class_dict[class_name] = {"arg_list": []}

    if not pre:
        store_pcode(pcode, "// class %s" % class_name)
    return pcode, class_dict, class_name


def compile_function(pcode, input_list, i, class_dict, class_name, pre=False):
    """
    # parent.tag == "class"
    # input_list[i][0] == "keyword" and input_list[i][1] in ("function", "method", "constructor")
    # if input_list[j][0] == "keyword" and input_list[j+1][0] == "identifier":
    """
    func_name = input_list[i][1]
    # define function symbol
    if input_list[i-2][1] in ("function", "method"):
        class_dict[class_name][input_list[i][1]] = {"type": input_list[i-2][1], "kind": input_list[i-1][1],
                                                    "arg_list": [], "index_dict": {}}
        # define function arguments
        if input_list[i+1][1] == "(":
            if input_list[i+2][1] != ")":
                pass  # TODO: process function arguments
        else:
            raise RuntimeError

    elif input_list[i-2][1] == "constructor":
        pass
    elif input_list[i-1][1] == ".":
        if func_name not in class_dict[class_name]:
            class_dict[class_name][func_name] = {"type": "", "kind": "", "arg_list": [], "index_dict": {}}
    else:
        raise RuntimeError

    if not pre:
        store_pcode(pcode, "%s %s.%s %s" % (input_list[i-2][1], class_name, input_list[i][1],
                                             len(class_dict[class_name][input_list[i][1]]["arg_list"])))
    return pcode, class_dict, func_name


def compile_classvardec(pcode, input_list, i, class_dict):
    # TODO
    return pcode, class_dict


def compile_vardec(pcode, input_list, i, class_dict, class_name, func_name):
    """
    input_list[i][0] == "keyword" and input_list[i][1] == "var":
    """
    if input_list[i+1][0] == "keyword" and input_list[i+2][0] == "identifier":
        # var <type> <name>
        store_pcode(pcode, "// var %s %s (local)" % (input_list[i+1][1], input_list[i+2][1]))

        # update func/kind index
        if input_list[i+1][1] not in class_dict[class_name][func_name]["index_dict"]:
            class_dict[class_name][func_name]["index_dict"]["local"] = 0
        else:
            class_dict[class_name][func_name]["index_dict"]["local"] += 1

        # add var to func_dict
        class_dict[class_name][func_name]["arg_list"].append(
            {"name": input_list[i+2][1], "kind": input_list[i+1][1], "index":
                class_dict[class_name][func_name]["index_dict"]["local"]})
    else:
        raise RuntimeError(input_list[i+1])

    return pcode, class_dict


def compile_expression(pcode, input_list, i):
    j = i  # i = opening symbol, j = closing symbol
    while input_list[j][1] != ";":
        # recurse until all brackets unpacked
        if input_list[j][1] == "(" and input_list[j+1][1] != ")":
            pcode, compile_expression(pcode, input_list, j+1)
        j += 1
    
    # process expression
    while input_list[i][1] not in ("(", ")"):
        inc = 0
        # parse x <op> y expressions
        if input_list[i][0] == "integerConstant":  # TODO: or identifier?
            store_pcode(pcode, "push constant %s" % input_list[i][1])  # parse x
            inc += 1
            if input_list[i+1][1] in operators:
                if input_list[i+2][0] == "integerConstant":  # TODO: or identifier?
                    store_pcode(pcode, "push constant %s" % input_list[i+2][1])  # parse y
                    inc += 1
                elif input_list[i+2][1] == "(":
                    pass
                else:
                    raise RuntimeError(input_list[i])
                store_pcode(pcode, "%s" % op_map[input_list[i+1][1]])  # parse op
                inc += 1
        elif input_list[i][1] == ",":  # TODO: check push order
            inc += 1
        elif input_list[i][1] == "-" and input_list[i+1][0] == "integerConstant":
            store_pcode(pcode, "push constant %s" % input_list[i+1][1])
            store_pcode(pcode, "neg")
            inc += 2
        else:
            raise RuntimeError(input_list[i])
        i += inc
    return pcode


def compile_statement(pcode, input_list, i, class_dict, class_name):
    """
    input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return")
    """
    if input_list[i][1] == "do":
        while input_list[i][1] != ";":
            if input_list[i][0] == "identifier":
                # call
                if input_list[i+1][1] == "." and input_list[i+2][0] == "identifier"\
                        and input_list[i+3][1] == "(":
                    if input_list[i+4][1] != ")":
                        pcode = compile_expression(pcode, input_list, i+4)
                    num_args = len(class_dict[input_list[i][1]][input_list[i+2][1]]["arg_list"])
                    store_pcode(pcode, "call %s.%s %s" % (input_list[i][1], input_list[i+2][1], num_args))
            i += 1
    elif input_list[i][1] == "return":
        store_pcode(pcode, "return")
    else:
        raise RuntimeError(input_list[i])
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
        print("\nParsing: %s" % filepath)
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
        class_dict = {
            "Output": {"arg_list": [],  # TODO: look this up
                       "printInt": {"type": "function", "kind": "void", "arg_list": ["i"], "index_dict": {}}}}

        # pre-process stream for class/function definitions
        for i, token in enumerate(input_list):
            if token[0] == "keyword":
                if token[1] == "class" and input_list[i+1][0] == "identifier":
                    pcode, class_dict, class_name = compile_class(pcode, input_list, i+1, class_dict, pre=True)
                elif token[1] in ("function", "method") and input_list[i+2][0] == "identifier":
                    pcode, class_dict, func_name = compile_function(pcode, input_list, i+2, class_dict, class_name, pre=True)

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

                # open varDec
                elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                    # insert new parent and current token as child
                    parent = ET.SubElement(parent, "varDec")
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    pcode, class_dict = compile_vardec(pcode, input_list, i, class_dict, class_name, func_name)

                # close statements/whileStatement/subroutineBody/subroutineDec }
                elif parent.tag in ("statements", "whileStatement", "ifStatement", "subroutineBody") \
                        and input_list[i][0] == "symbol" and input_list[i][1] == "}":

                    if parent.tag == "statements":
                        # close parent and insert current token
                        parent = find_parent(output_root, parent)
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                    if parent.tag == "ifStatement":
                        # don't close if } followed by else
                        if not (input_list[j][0] == "keyword" and input_list[j][1] == "else"):
                            parent = find_parent(output_root, parent)

                    if parent.tag == "whileStatement":
                        # close parent
                        parent = find_parent(output_root, parent)

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

                        # pcode = compile_expression(pcode, input_list, i)

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

                    # pcode = compile_expression(pcode, input_list, i)

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

                    pcode, class_dict = compile_statement(pcode, input_list, i, class_dict, class_name)

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
