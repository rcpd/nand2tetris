"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.
"""

import xml.etree.ElementTree as ET


operators = ["+", "-", "*", "/", "&", "|", "<", ">", "~", "="]
op_map = {"+": "add", "-": "sub", "*": "call Math.multiply 2", "/": "call Math.divide 2", "&": "and", "|": "or",
          "~": "not", "<": "lt", ">": "gt", "=": "eq"}  # Math.multiply/divide = non-void return (no pop)


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


# def check_non_void(call):
#     """
#     Check against list of known external API calls with non-void returns
#     """
#     non_void = [
#         "Array.new",
#         "Keyboard.keyPressed",
#         "Keyboard.readChar",
#         "Keyboard.readLine",
#         "Keyboard.readInt",
#         "Math.abs",
#         "Math.multiply",
#         "Math.divide",
#         "Math.sqrt",
#         "Math.max",
#         "Math.min",
#         "Memory.peek",
#         "Memory.alloc",
#         "Output.getMap",
#         "String.new",
#         "String.length",
#         "String.charAt",
#         "String.appendChar",
#         "String.intValue",
#         "String.newLine",
#         "String.backSpace",
#         "String.doubleQuote",
#     ]
#     if call in non_void:
#         return True


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
        if "count" in labels[label_type]:
            # inc total for next instance
            labels[label_type]["count"] += 1
            # set instance to most recently opened
            labels[label_type]["instance"].append(labels[label_type]["count"])
    else:
        # initialize count and instance
        labels[label_type] = {"count": 0, "instance": [0]}
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
        if input_list[j-2][1] in ("function", "method", "constructor"):
            if input_list[j][1] not in class_dict[class_name]:
                class_dict[class_name][input_list[j][1]] = {"kind": input_list[j-2][1], "type": input_list[j-1][1],
                                                            "args": {}, "index_dict": {}, "label_dict": {}}
            if input_list[j-2][1] == "method":
                # assign space for the implicit "this" argument for class methods
                class_dict[class_name][func_name]["index_dict"]["argument"] = 0
                class_dict[class_name][func_name]["args"]["this"] = \
                    {"kind": "argument", "type": "this", "index": 0}

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
                raise RuntimeError(input_list[j+1][1])
        else:
            raise RuntimeError(input_list[j-2][1])

    else:
        if input_list[j-2][1] in ("method", "function"):
            if "local" in class_dict[class_name][input_list[i][1]]["index_dict"]:
                num_vars = class_dict[class_name][input_list[i][1]]["index_dict"]["local"]+1
            else:
                num_vars = 0
        elif input_list[j-2][1] == "constructor":
            if "field" in class_dict[class_name]["index_dict"]:
                num_vars = class_dict[class_name]["index_dict"]["field"]+1
            else:
                num_vars = 0
        else:
            raise RuntimeError(input_list[j-2][1])

        store_pcode(pcode, "\nfunction %s.%s %s" % (class_name, input_list[i][1], num_vars))

        if input_list[j-2][1] == "constructor":
            # allocate space on heap
            store_pcode(pcode, "push constant %s" % num_vars)
            store_pcode(pcode, "call Memory.alloc 1 // allocate object + params on heap")  # non-void return (no pop)
            store_pcode(pcode, "pop pointer 0 // update 'this' to heap address")

        elif input_list[j-2][1] == "method":
            # move pointer to current object (implicit "this" argument)
            store_pcode(pcode, "push argument 0")
            store_pcode(pcode, "pop pointer 0 // update 'this' to object for method call")

    return pcode, class_dict, func_name


def compile_vardec(pcode, input_list, i, class_dict, class_name, func_name, pre=False):
    """
    input_list[i][0] == "keyword" and input_list[i][1] in ("var", "field", "static"):
    """
    if input_list[i+1][0] in ("keyword", "identifier") and input_list[i+2][0] == "identifier":
        j = i
        while input_list[j+2][1] != ";":
            # var <type> <name> // var <type> <name>, <name>, ...

            # skip to next var
            if input_list[j+2][1] == ",":
                j += 1
                continue

            if pre:
                # build the symbol table (no compilation yet)
                if input_list[i][1] == "var":
                    # update func/local index
                    if "local" not in class_dict[class_name][func_name]["index_dict"]:
                        class_dict[class_name][func_name]["index_dict"]["local"] = 0
                    else:
                        class_dict[class_name][func_name]["index_dict"]["local"] += 1

                    # add var to func/args
                    if input_list[j+2][1] not in class_dict[class_name][func_name]["args"]:
                        class_dict[class_name][func_name]["args"][input_list[j+2][1]] = \
                            {"kind": "local", "type": input_list[i+1][1],
                             "index": class_dict[class_name][func_name]["index_dict"]["local"]}

                elif input_list[i][1] in ("field", "static"):
                    # update class/<field/static> index
                    # FIXME: field and possibly other segments were over-counted
                    if input_list[i][1] not in class_dict[class_name]["index_dict"]:
                        class_dict[class_name]["index_dict"][input_list[i][1]] = 0
                    else:
                        class_dict[class_name]["index_dict"][input_list[i][1]] += 1

                    # add var to class/args
                    if input_list[j+2][1] not in class_dict[class_name]["args"]:
                        class_dict[class_name]["args"][input_list[j+2][1]] = \
                            {"kind": input_list[i][1], "type": input_list[j+1][1],
                             "index": class_dict[class_name]["index_dict"][input_list[i][1]]}
                else:
                    raise RuntimeError(input_list[i][1])

            else:
                # compile the declaration
                if input_list[i][1] == "var":
                    store_pcode(pcode, "// var %s %s (local %s)" %
                                (input_list[i+1][1], input_list[j+2][1],
                                 class_dict[class_name][func_name]["args"][input_list[j+2][1]]["index"]))
                elif input_list[i][1] in ("field", "static"):
                    store_pcode(pcode, "// %s %s (%s %s)" %
                                (input_list[j+2][1], input_list[i+1][1], input_list[j+2][1],
                                 class_dict[class_name]["args"][input_list[j][1]]["index"]))
                else:
                    raise RuntimeError(input_list[i][1])

            j += 1

    else:
        raise RuntimeError(input_list[i+1])

    return pcode, class_dict


def compile_expression(pcode, input_list, i, class_dict, class_name, func_name, sub=False, proc=None):
    """
    Notes:
    - recursing on "," flips the push order (not easily reversed)
    - recursing on ")" processes values outside brackets first
    - passing over ")" means brackets always first which disrupts param order
    """

    if not sub:
        proc = []
    sub_xps = []

    # always try to parse first
    cmd, proc, i = compile_sub_expression(pcode, input_list, i, class_dict, class_name, func_name, sub=True,
                                          proc=proc)
    sub_xps.append(cmd)

    while input_list[i][1] not in (";", "{", "="):
        # recurse until all brackets unpacked (if any)
        cmd, proc, i = compile_sub_expression(sub_xps, input_list, i, class_dict, class_name, func_name,
                                              sub=True, proc=proc)
        sub_xps.append(cmd)
        i += 1

    for sub_xp in sub_xps:
        for cmd in sub_xp:
            store_pcode(pcode, cmd)

    return pcode, proc


def compile_sub_expression(sub_xps, input_list, i, class_dict, class_name, func_name, sub=False, proc=None):
    cmd = []
    # process expression
    while input_list[i][1] not in ("(", ")", ",", ";", "{", "["):
        if i in proc:
            return cmd, proc, i

        k = 0
        # parse x <op> y expressions
        if input_list[i][0] == "integerConstant":
            cmd.append("push constant %s" % input_list[i][1])
            proc.append(i)
            k += 1

        elif input_list[i][0] == "identifier":
            try:
                var = class_dict[class_name][func_name]["args"][input_list[i][1]]
            except KeyError:
                var = class_dict[class_name]["args"][input_list[i][1]]

            if var["kind"] == "field":
                if input_list[i+1][1] == "[":
                    cmd.append("push %s %s // %s (array)" % ("this", var["index"], input_list[i][1]))
                else:
                    cmd.append("push %s %s // %s" % ("this", var["index"], input_list[i][1]))
            else:
                if input_list[i+1][1] == "[":
                    cmd.append("push %s %s // %s (array)" % (var["kind"], var["index"], input_list[i][1]))
                else:
                    cmd.append("push %s %s // %s" % (var["kind"], var["index"], input_list[i][1]))
            proc.append(i)
            k += 1

            if input_list[i+1][1] == "[":
                # array[x] // where x is expression and array is already pushed
                j = i+2  # move over bracket
                sub_cmd = []
                while input_list[j][1] != "]":
                    # get expression result for []
                    _cmd, proc, j = compile_sub_expression(sub_xps, input_list, j, class_dict, class_name,
                                                           func_name, sub=True, proc=proc)
                    j += 1
                    for _c in _cmd:
                        sub_cmd.append(_c)  # preserve sub-sub commands
                for c in sub_cmd:
                    cmd.append(c)  # roll sub-sub back into sub

        elif input_list[i][1] == "]":
            # add base + offset
            cmd.append("add // offset = array + [index]")
            cmd.append("pop pointer 1 // *that = array[index]")
            cmd.append("push that 0 // array[index]")
            proc.append(i)
            return cmd, proc, i

        elif input_list[i][1] in operators:
            j = None
            if input_list[i+1][1] == "(":
                j = i+2  # move over bracket
                sub_cmd = []
                while input_list[j][1] != ")":
                    # get expression result then parse operator
                    _cmd, proc, j = compile_sub_expression(sub_xps, input_list, j, class_dict, class_name,
                                                           func_name, sub=True, proc=proc)
                    j += 1
                    for _c in _cmd:
                        sub_cmd.append(_c)  # preserve sub-sub commands
                for c in sub_cmd:
                    cmd.append(c)  # roll sub-sub back into sub

            elif input_list[i+1][0] == "integerConstant":
                cmd.append("push constant %s" % input_list[i+1][1])
                proc.append(i+1)
                k += 2

            elif input_list[i+1][0] == "identifier":
                try:
                    var = class_dict[class_name][func_name]["args"][input_list[i+1][1]]
                except KeyError:
                    var = class_dict[class_name]["args"][input_list[i+1][1]]
                if var["kind"] == "field":
                    cmd.append("push %s %s // %s" % ("this", var["index"], input_list[i+1][1]))
                else:
                    cmd.append("push %s %s // %s" % (var["kind"], var["index"], input_list[i+1][1]))
                proc.append(i+1)
                k += 2

            if input_list[i][1] == "-":
                cmd.append("neg")  # comes after the value being neg'd
                proc.append(i)
                if input_list[i-1][1] not in (",", "("):
                    cmd.append("add")  # x-y == -y+x
            else:
                cmd.append("%s" % op_map[input_list[i][1]])  # parse op
                proc.append(i)

            if input_list[i+1][1] == "(":
                i = j  # return to pos where sub-sub processed

        elif input_list[i][0] == "keyword" and input_list[i][1] == "this":
            cmd.append("push pointer 0 // this")
            k += 1
        elif input_list[i][0] == "keyword" and input_list[i][1] in ("true", "false"):
            if input_list[i][1] == "true":
                cmd.append("push constant 1")
                cmd.append("neg // true")
            else:
                cmd.append("push constant 0 // false")
            k += 1
        elif input_list[i][0] == "stringConstant":
            raise NotImplementedError()
        else:
            raise RuntimeError(input_list[i])

        i += k

    return cmd, proc, i


def compile_statement(pcode, input_list, i, class_dict, class_name, func_name):
    """
    input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return")
    """
    if input_list[i][1] == "do":
        pcode, class_dict = compile_sub_statement(pcode, input_list, i+1, class_dict, class_name, func_name, "do")

    elif input_list[i][1] == "let":
        # search statement for arrays as var or term (but not nested in expressions)
        j = i+2
        count = 0
        equals = None
        while input_list[j][1] != ";":
            if input_list[j][1] == "=":
                equals = j  # store equal position
            if input_list[j][1] == "[":
                count += 1
                while input_list[j][1] != "]":
                    j += 1  # skip expressions
            else:
                j += 1

        if count == 1:
            if input_list[i+1][0] == "identifier" and input_list[i+2][1] == "[":
                # let arr[x] = y
                try:
                    var = class_dict[class_name][func_name]["args"][input_list[i+1][1]]
                except KeyError:
                    var = class_dict[class_name]["args"][input_list[i+1][1]]
                if var["kind"] == "field":
                    store_pcode(pcode, "push %s %s // %s (array)" % ("this", var["index"], input_list[i+1][1]))
                else:
                    store_pcode(pcode, "push %s %s // %s (array)" % (var["kind"], var["index"], input_list[i+1][1]))

                pcode, proc = compile_expression(pcode, input_list, i+3, class_dict, class_name, func_name)
                # TODO: temp should be tracked by compiler
                store_pcode(pcode, "pop temp 0 // discard expression push")
                store_pcode(pcode, "\n// result")
                pcode, proc = compile_expression(pcode, input_list, equals+1, class_dict, class_name, func_name)
                store_pcode(pcode, "pop that 0 // array[index] = result\n")
                return pcode, class_dict
            # else: fall through to var=x case

        elif count >= 2:
            # array to array or multi-array assignment
            raise NotImplementedError()

        # let <var> = x;
        if input_list[i+2][1] == "=":
            # handle right side of assignment first (result)
            pcode, class_dict = compile_sub_statement(pcode, input_list, i+3, class_dict, class_name, func_name, "let")

            # handle assignment of the result
            if input_list[i+1][0] == "identifier":
                try:
                    var = class_dict[class_name][func_name]["args"][input_list[i+1][1]]
                except KeyError:
                    var = class_dict[class_name]["args"][input_list[i+1][1]]
                if var["kind"] != "field":
                    store_pcode(pcode, "pop %s %s // %s =" % (var["kind"], var["index"], input_list[i+1][1]))
                else:
                    store_pcode(pcode, "pop %s %s // %s =" % ("this", var["index"], input_list[i+1][1]))
            else:
                raise RuntimeError(input_list[i+1])
        else:
            raise RuntimeError(count, input_list[i+2])

    elif input_list[i][1] == "return":
        if input_list[i+1][1] != ";":
            if class_dict[class_name][func_name]["type"] != "void":
                # parse the return value
                pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
            else:
                raise RuntimeError(class_dict[class_name][func_name]["type"])
        else:
            if class_dict[class_name][func_name]["type"] == "void":
                store_pcode(pcode, "push constant 0 // void return")
            else:
                raise RuntimeError(class_dict[class_name][func_name]["type"])
        store_pcode(pcode, "return")

    elif input_list[i][1] == "while":
        # open while statement
        class_dict, while_index = label_index(class_dict, class_name, func_name, "while")
        store_pcode(pcode, "\nlabel WHILE_TEST_%s_%s // test while <expression>" % (func_name, while_index["count"]))
        pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
        store_pcode(pcode, "\nif-goto WHILE_TRUE_%s_%s // jump to start while (true)" % (func_name, while_index["count"]))
        store_pcode(pcode, "goto WHILE_FALSE_%s_%s // jump to exit while (false)" % (func_name, while_index["count"]))
        store_pcode(pcode, "\nlabel WHILE_TRUE_%s_%s // start while" % (func_name, while_index["count"]))
    elif input_list[i][1] == "if":
        # open if statement
        class_dict, if_index = label_index(class_dict, class_name, func_name, "if")
        store_pcode(pcode, "\n// if <expression>")
        pcode, proc = compile_expression(pcode, input_list, i+1, class_dict, class_name, func_name)
        store_pcode(pcode, "\nif-goto IF_%s_%s // jump to start if (true)" % (func_name, if_index["count"]))
        store_pcode(pcode, "goto ELSE_%s_%s // jump to else/end (false)" % (func_name, if_index["count"]))
        store_pcode(pcode, "\nlabel IF_%s_%s // start if (true)" % (func_name, if_index["count"]))
    else:
        raise RuntimeError(input_list[i])
    return pcode, class_dict


def compile_sub_statement(pcode, input_list, i, class_dict, class_name, func_name, statement):
    """
    Compile common components of statements
    """
    j = i
    while input_list[j][1] != ";":
        # handle array, call, expression, constant
        if input_list[j][0] == "identifier":
            # handle array, call, expression
            if input_list[j+1][1] == "[":
                # array // arr[x]
                try:
                    var = class_dict[class_name][func_name]["args"][input_list[j][1]]
                except KeyError:
                    var = class_dict[class_name]["args"][input_list[j][1]]
                if var["kind"] == "field":
                    store_pcode(pcode, "push %s %s // %s (array)" % ("this", var["index"], input_list[j][1]))
                else:
                    store_pcode(pcode, "push %s %s // %s (array)" % (var["kind"], var["index"], input_list[j][1]))

                pcode, proc = compile_expression(pcode, input_list, j+2, class_dict, class_name, func_name)
                return pcode, class_dict

            else:
                # handle call // identify "do class.func();" or "do func();"
                class_call = (input_list[j+1][1] == "." and input_list[j+2][0] == "identifier" and
                              input_list[j+3][1] == "(")
                local_call = False
                if not class_call and input_list[j][1] in class_dict[class_name]:
                    local_call = True
                if class_call or input_list[j+1][1] == "(":
                    # determine parent of callee function
                    var = None
                    call_obj = None
                    if local_call:
                        var = class_dict[class_name][input_list[j][1]]
                    if class_call:
                        call_obj = input_list[j][1] + "." + input_list[j+2][1]
                        if input_list[j][1] in class_dict[class_name][func_name]["args"]:  # local obj
                            var = class_dict[class_name][func_name]["args"][input_list[j][1]]
                        elif input_list[j][1] in class_dict[class_name]["args"]:  # class attr obj
                            var = class_dict[class_name]["args"][input_list[j][1]]
                        elif input_list[j+2][1] in class_dict[class_name]:  # class func
                            var = class_dict[class_name][input_list[j+2][1]]
                        else:
                            store_pcode(pcode, "// external call %s" % call_obj)

                    if var is not None:
                        # push implicit "this" argument for class methods
                        if var["kind"] == "field":
                            # FIXME: should not assume callee is method when pushing this
                            store_pcode(pcode, "push %s %s // %s (this)" % ("this", var["index"], input_list[j][1]))
                        elif var["kind"] == "method":
                            store_pcode(pcode, "push pointer 0 // %s (this)" % class_name)
                        elif var["kind"] in ("function", "constructor"):
                            store_pcode(pcode, "// function call %s" % call_obj)
                        else:
                            store_pcode(pcode, "push %s %s // %s (this)" % (var["kind"], var["index"],
                                                                            input_list[j][1]))
                    if class_call and input_list[j+4][1] != ")":
                        pcode, proc = compile_expression(pcode, input_list, j+4, class_dict, class_name, func_name)

                    else:
                        if input_list[j+2][1] != ")":
                            pcode, proc = compile_expression(pcode, input_list, j+4, class_dict, class_name, func_name)

                    # count params for call
                    if class_call:
                        k = j+4
                    else:
                        k = j+2
                    num_params = 0
                    if input_list[k][1] != ")":
                        num_params = 1
                    while input_list[k][1] != ";":
                        if input_list[k][1] == ",":
                            num_params += 1
                        k += 1

                    # compile call
                    if class_call:
                        # lookup class for object (func table > class table > assume external)
                        try:
                            class_obj = class_dict[class_name][func_name]["args"][input_list[j][1]]["type"]
                            # FIXME: might be function but might not be in dict
                            # TODO: need to roll all files into pre-scan
                            num_params += 1  # inc for implicit this
                        except KeyError:
                            try:
                                class_obj = class_dict[class_name]["args"][input_list[j][1]]["type"]
                                # FIXME: might be function but might not be in dict
                                # TODO: need to roll all files into pre-scan
                                num_params += 1  # inc for implicit this
                            except KeyError:
                                class_obj = input_list[j][1]  # external must be function

                        store_pcode(pcode, "call %s.%s %s" % (class_obj, input_list[j+2][1], num_params))
                        if statement == "do":
                            # TODO: temp should be tracked by compiler
                            store_pcode(pcode, "pop temp 0 // discard return on do call")
                    else:
                        # convert local calls to be fully qualified to current class scope
                        # FIXME: should check callee is method before inc params
                        store_pcode(pcode, "call %s.%s %s" % (class_name, input_list[j][1], num_params+1))
                        if statement == "do":
                            # TODO: temp should be tracked by compiler
                            store_pcode(pcode, "pop temp 0 // discard return on do call")
                    return pcode, class_dict

                else:
                    # if not array or call pass to expression handler
                    pcode, proc = compile_expression(pcode, input_list, j, class_dict, class_name, func_name)
                    return pcode, class_dict

        # handle constants (true/false/integer)
        elif input_list[j][0] == "keyword" and input_list[j][1] in ("true", "false"):
            if input_list[j][1] == "true":
                store_pcode(pcode, "push constant 1")
                store_pcode(pcode, "neg // true")
            else:
                store_pcode(pcode, "push constant 0 // false")
        elif input_list[j][0] == "integerConstant":
            store_pcode(pcode, "push constant %s" % input_list[j][1])

        else:
            raise RuntimeError(input_list[j])
        j += 1
    return pcode, class_dict


def main(filepath, debug=False):
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
            elif token[1] in ("function", "method", "constructor") and input_list[i+2][0] == "identifier":
                pcode, class_dict, func_name = \
                    compile_function(pcode, input_list, i+2, class_dict, class_name, pre=True)
                store_pcode(pcode, "", write=filepath)
            elif token[1] in ("var", "field", "static") and input_list[i][0] == "keyword":
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
                    raise RuntimeError(input_list[j][0])

            # open subroutineDec
            elif parent.tag == "class" and input_list[i][0] == "keyword" \
                    and input_list[i][1] in ("function", "method", "constructor"):
                # insert new parent and current token as child
                parent = ET.SubElement(parent, "subroutineDec")
                child = ET.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

                if input_list[j][0] in ("keyword", "identifier") and input_list[j+1][0] == "identifier":
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

                    pcode, class_dict = compile_vardec(pcode, input_list, i, class_dict, class_name, func_name,
                                                       pre=True)
                    store_pcode(pcode, "", write=filepath)

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
                        # open else statement
                        class_dict[class_name][func_name]["label_dict"]["else"] = if_index
                        store_pcode(pcode, "goto IF_END_%s_%s // jump over else (true)" %
                                    (func_name, if_index["instance"][-1]))
                        store_pcode(pcode, "\nlabel ELSE_%s_%s // start else (false)" %
                                    (func_name, if_index["instance"][-1]))
                    else:
                        # close else statement (implied)
                        parent = find_parent(output_root, parent)
                        if "else" not in class_dict[class_name][func_name]["label_dict"]:
                            store_pcode(pcode, "\nlabel ELSE_%s_%s // else" % (func_name, if_index["instance"][-1]))

                        # close if statement
                        store_pcode(pcode, "label IF_END_%s_%s // exit if\n" % (func_name, if_index["instance"][-1]))
                        class_dict[class_name][func_name]["label_dict"]["if"]["instance"].pop()

                if parent.tag == "whileStatement":
                    # close parent
                    parent = find_parent(output_root, parent)
                    while_index = class_dict[class_name][func_name]["label_dict"]["while"]["instance"][-1]
                    store_pcode(pcode, "goto WHILE_TEST_%s_%s // loop or exit" % (func_name, while_index))
                    store_pcode(pcode, "label WHILE_FALSE_%s_%s // exit while\n" % (func_name, while_index))
                    class_dict[class_name][func_name]["label_dict"]["while"]["instance"].pop()

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

    # post-run index error checking
    for class_name in class_dict:
        index_fields = 0
        index_statics = 0
        arg_fields = 0
        arg_statics = 0
        if "field" in class_dict[class_name]["index_dict"]:
            index_fields = class_dict[class_name]["index_dict"]["field"]+1
        if "static" in class_dict[class_name]["index_dict"]:
            index_statics = class_dict[class_name]["index_dict"]["static"]+1
        for var in class_dict[class_name]["args"]:
            if class_dict[class_name]["args"][var]["kind"] == "field":
                arg_fields += 1
            elif class_dict[class_name]["args"][var]["kind"] == "static":
                arg_fields += 1
            else:
                raise RuntimeError(class_dict[class_name]["args"][var]["kind"])

        if index_fields != arg_fields or index_statics != arg_statics:
            print("\nIndex Count Mismatch Exception Dump")
            import pprint
            pprint.pprint(class_dict[class_name]["index_dict"])
            pprint.pprint(class_dict[class_name]["args"])
            # raise RuntimeError(class_name, index_fields, arg_fields)  # TODO: enable

        for func_name in class_dict[class_name]:
            if "kind" not in class_dict[class_name][func_name]:
                continue
            if class_dict[class_name][func_name]["kind"] not in ("function", "method", "constructor"):
                raise RuntimeError("Unexpected kind")

            index_local = 0
            index_argument = 0
            arg_local = 0
            arg_argument = 0
            for var in class_dict[class_name][func_name]["args"]:
                if class_dict[class_name][func_name]["args"][var]["kind"] == "local":
                    arg_local += 1
                elif class_dict[class_name][func_name]["args"][var]["kind"] == "argument":
                    arg_argument += 1
                else:
                    raise RuntimeError("Unexpected kind")

            if "local" in class_dict[class_name][func_name]["index_dict"]:
                index_local = class_dict[class_name][func_name]["index_dict"]["local"]+1
            if "argument" in class_dict[class_name][func_name]["index_dict"]:
                index_argument = class_dict[class_name][func_name]["index_dict"]["argument"]+1

            if index_local != arg_local or index_argument != arg_argument:
                print("\nIndex Count Mismatch Exception Dump")
                import pprint
                pprint.pprint(class_dict[class_name][func_name]["index_dict"])
                pprint.pprint(class_dict[class_name][func_name]["args"])
                # raise RuntimeError(class_name, index_fields, arg_fields)  # TODO: enable

    # write output
    output_filepath = filepath.replace(".jack", ".vm")
    print("Writing: %s" % output_filepath)

    with open(output_filepath, "w") as output_file:
        output_file.writelines(pcode)


if __name__ == '__main__':
    jack_filepaths = [
        # TODO: integration test
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

        r"..\11\Seven\Main.jack",  # compiled / tested
        r"..\11\ConvertToBin\Main.jack",  # compiled / tested
        r"..\11\Square\Main.jack",  # compiled / tested
        r"..\11\Square\Square.jack",  # compiled / tested
        r"..\11\Square\SquareGame.jack",  # compiled / tested
        r"..\11\Average\Main.jack",  # partially compiled/tested
    ]

    for _filepath in jack_filepaths:
        main(_filepath, debug=False)
