"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.
"""
import xml.etree.ElementTree as Et
import traceback

op_map = {"+": "add", "-": "sub", "*": "call Math.multiply 2", "/": "call Math.divide 2", "&": "and", "|": "or",
          "~": "not", "<": "lt", ">": "gt", "=": "eq"}  # Math.multiply/divide = non-void return (no pop)

char_map = {
        " ": 32, "!": 33, '"': 34, '#': 35, '$': 36, '%': 37, '&': 38, "'": 39, "(": 40, ")": 41, "*": 42, "+": 43,
        ",": 44, "-": 45, ".": 46, "/": 47, "0": 48, "1": 49, "2": 50, "3": 51, "4": 52, "5": 53, "6": 54, "7": 55,
        "8": 56, "9": 57, ":": 58, ";": 59, "<": 60, "=": 61, ">": 62, "?": 63, "@": 64, "A": 65, "B": 66, "C": 67,
        "D": 68, "E": 69, "F": 70, "G": 71, "H": 72, "I": 73, "J": 74, "K": 75, "L": 76, "M": 77, "N": 78, "O": 79,
        "P": 80, "Q": 81, "R": 82, "S": 83, "T": 84, "U": 85, "V": 86, "W": 87, "X": 88, "Y": 89, "Z": 90, "[": 91,
        "\\": 92, "]": 93, "^": 94, "_": 95, "`": 96, "a": 97, "b": 98, "c": 99, "d": 100, "e": 101, "f": 102, "g": 103,
        "h": 104, "i": 105, "j": 106, "k": 107, "l": 108, "m": 109, "n": 110, "o": 111, "p": 112, "q": 113, "r": 114,
        "s": 115, "t": 116, "u": 117, "v": 118, "w": 119, "x": 120, "y": 121, "z": 122, "{": 123, "|": 124, "}": 125,
        "~": 126, "newline": 128, "backspace": 129, "left_arrow": 130, "up_arrow": 131, "right_arrow": 133, "home": 134,
        "end": 135, "page_up": 136, "page_down": 137, "insert": 138, "delete": 139, "esc": 140, "f1": 141, "f2": 142,
        "f3": 143, "f4": 144, "f5": 145, "f6": 146, "f7": 147, "f8": 148, "f9": 149, "f10": 150, "f11": 151, "f12": 152
    }

# compiled library functions
sys_func = {
    "Memory": {"peek": 1, "poke": 2, "alloc": 1, "dealloc": 1}
}


def store_pcode(pcode, cmd, debug=True):
    """
    TODO: docstring
    """
    if debug:
        if cmd.strip() != "":
            print("PCODE: %s" % cmd.strip())

    # overwrite at end if successful
    # don't append empty debug "write" calls
    pcode.append(cmd.strip()+"\n")

    return pcode


def compile_class(pcode, class_name, class_dict):
    """
    TODO: docstring
    """
    # define class_name and initialize symbol table
    if class_name not in class_dict:
        class_dict[class_name] = {"args": {}, "index_dict": {}}
    else:
        # don't emit pcode on pre-scan
        store_pcode(pcode, "// class %s" % class_name)

    return pcode, class_dict


def compile_function(pcode, func_name, func_type, func_kind, class_dict, class_name):
    """
    TODO: docstring
    """
    # FIXME: num_vars is wrong
    # define function symbol
    prescan = False
    if func_kind in ("function", "method", "constructor"):
        if func_name not in class_dict[class_name]:
            class_dict[class_name][func_name] = {"kind": func_kind, "type": func_type,
                                                 "args": {}, "index_dict": {}, "label_dict": {}}
            prescan = True
        if func_kind == "method":
            # assign space for the implicit "this" argument for class methods
            class_dict[class_name][func_name]["index_dict"]["argument"] = 0
            class_dict[class_name][func_name]["args"]["this"] = \
                {"kind": "argument", "type": "this", "index": 0}
        '''
        # update func/arg index
        if "argument" not in class_dict[class_name][func_name]["index_dict"]:
            class_dict[class_name][func_name]["index_dict"]["argument"] = 0
        else:
            class_dict[class_name][func_name]["index_dict"]["argument"] += 1

        class_dict[class_name][func_name]["args"][input_list[j+3][1]] = \
            {"kind": "argument", "type": input_list[j+2][1],
             "index": class_dict[class_name][func_name]["index_dict"]["argument"]}
        '''

    if func_kind in ("method", "function"):
        if "local" in class_dict[class_name][func_name]["index_dict"]:
            num_vars = class_dict[class_name][func_name]["index_dict"]["local"]+1
        else:
            num_vars = 0
    elif func_kind == "constructor":
        if "field" in class_dict[class_name]["index_dict"]:
            num_vars = class_dict[class_name]["index_dict"]["field"]+1
        else:
            num_vars = 0
    else:
        raise RuntimeError(func_kind)

    # don't emit pcode on pre-scan
    if not prescan:
        store_pcode(pcode, "\nfunction %s.%s %s" % (class_name, func_name, num_vars))

        if func_kind == "constructor":
            # allocate space on heap
            store_pcode(pcode, "push constant %s" % num_vars)
            store_pcode(pcode, "call Memory.alloc 1 // allocate object + params on heap")  # non-void return (no pop)
            store_pcode(pcode, "pop pointer 0 // update 'this' to heap address")

        elif func_kind == "method":
            # move pointer to current object (implicit "this" argument)
            # TODO: doesn't seem to be used?
            # store_pcode(pcode, "push argument 0")
            # store_pcode(pcode, "pop pointer 0 // update 'this' to object for method call")
            pass

    return pcode, class_dict


def compile_statement(pcode, statement, class_dict, class_name, func_name, call_class, call_func,
                      var_type, var_name, num_args, exp_buffer):
    """
    TODO: docstring
    """
    if statement == "do":
        pcode = compile_call(pcode, call_class, call_func, num_args, statement)
        num_args = 0

    elif statement == "let":
        exp_buffer.append(compile_lhs_statement(class_dict, class_name, func_name, var_name))

    elif statement == "return":
        # looks up func type (affects return behaviour)
        pcode = compile_return(pcode, class_dict, class_name, func_name)

    elif statement == "while":
        raise NotImplementedError

    elif statement == "if":
        raise NotImplementedError

    elif statement == "var":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode, class_dict, class_name, func_name, var_type, var_name)

    else:
        raise RuntimeError("Unexpected statement type '%s'" % statement)

    return pcode, class_dict, num_args, exp_buffer


def compile_lhs_statement(class_dict, class_name, func_name, var_name):
    lhs_kind = class_dict[class_name][func_name]['args'][var_name]['kind']
    lhs_index = class_dict[class_name][func_name]['args'][var_name]['index']
    return "pop %s %s // %s" % (lhs_kind, lhs_index, var_name)


def compile_vardec(pcode, class_dict, class_name, func_name, var_type, var_name):
    """
    add var to the class dict, print a comment in pcode
    """
    # don't emit pcode during pre-scan
    if var_name not in class_dict[class_name][func_name]['args']:
        if "local" not in class_dict[class_name][func_name]['index_dict']:
            index = 0
        else:
            index = class_dict[class_name][func_name]['index_dict']['local'] + 1

        class_dict[class_name][func_name]['args'][var_name] = {'kind': 'local', 'type': var_type, 'index': index}
        class_dict[class_name][func_name]['index_dict']['local'] = index
    else:
        store_pcode(pcode, "// var %s %s (local %s)" %
                    (var_type, var_name,  class_dict[class_name][func_name]['args'][var_name]['index']))

    return pcode, class_dict


def compile_constant(pcode, constant):
    """
    TODO: docstring
    """
    store_pcode(pcode, "\npush constant %s" % constant)
    return pcode


def compile_call(pcode, call_class, call_func, num_args, statement):
    """
    TODO: docstring
    """
    store_pcode(pcode, "\ncall %s.%s %s" % (call_class, call_func, num_args))
    if statement == 'do':
        store_pcode(pcode, "\npop temp 0 // discard return on do call")
    return pcode


def compile_return(pcode, class_dict, class_name, func_name):
    """
    TODO: docstring
    """
    if class_dict[class_name][func_name]["type"] == "void":
        store_pcode(pcode, "push constant 0 // void return")
    else:
        raise RuntimeError(class_dict[class_name][func_name]["type"])
    store_pcode(pcode, "\nreturn")
    return pcode


def compile_literal(pcode, code):
    """
    TODO: docstring
    """
    store_pcode(pcode, "\n%s" % code)
    return pcode


def main(filepath, debug=False):
    """
    TODO: docstring
    """
    pcode = []
    try:
        print("\nParsing: %s" % filepath)
        tree = Et.parse(filepath.replace(".jack", "_out.xml"))

        # persist through loop scope
        parent = 'class'
        exp_buffer = []
        class_dict = {}
        num_args = 0
        class_name = func_kind = call_class = call_func = statement = func_name = keyword = _type = identifier = ''
        func_type = symbol = lhs_var_name = rhs_parent = rhs_child = ''

        # pre-process tree for function vars
        for elem in tree.iter():
            elem.tag = (elem.tag or '').strip()
            elem.text = (elem.text or '').strip()
            # skip rootnode
            if elem.tag == 'class':
                continue

            if elem:  # has children
                parent = elem.tag
                keyword = _type = ''  # reset tag context on depth change

            if elem.tag == 'keyword':
                if not keyword:
                    keyword = elem.text  # preserved for later
                elif not _type:
                    _type = elem.text  # preserved for later

            if elem.tag == 'identifier':
                identifier = elem.text
                if keyword == 'class':
                    class_name = identifier  # preserved for later
                    func_kind = 'method'  # preserved for later
                    pcode, class_dict = compile_class(pcode, class_name, class_dict)

                elif keyword == 'function':
                    func_name = identifier  # preserved for later
                    if not func_kind:
                        raise RuntimeError("undefined function kind for '%s.%s'" % (class_name, func_name))
                    pcode, class_dict = compile_function(pcode, func_name, _type, func_kind, class_dict, class_name)

                elif keyword == 'var':
                    pcode, class_dict, num_args, exp_buffer = \
                        compile_statement(pcode, 'var', class_dict, class_name, func_name,
                                          None, None, _type, identifier, num_args, exp_buffer)

        # persist through loop scope
        parent = 'class'
        exp_buffer = []
        num_args = 0
        class_name = func_kind = call_class = call_func = statement = func_name = keyword = _type = identifier = ''
        func_type = symbol = lhs_var_name = rhs_parent = rhs_child = ''

        # dump tree
        for elem in tree.iter():
            elem.tag = (elem.tag or '').strip()
            elem.text = (elem.text or '').strip()
            # skip rootnode
            if elem.tag == 'class':
                continue

            # debug
            # if elem.tag == 'subroutineBody':
            #     print("break")
            # print("TOKEN:", elem.tag, elem.text, parent)

            if elem:  # has children
                parent = elem.tag
                # reset tag context on depth change
                # exlcusion: class_name, func_kind, call_class, call_func, statement, func_name, lhs_var_name
                keyword = _type = identifier = func_type = symbol = ''

            if elem.tag == 'keyword':
                if not keyword:
                    keyword = elem.text  # preserved for later
                elif not _type:
                    _type = elem.text  # preserved for later
                else:
                    raise RuntimeError("unexpected keywords '%s' '%s' '%s'" % (keyword, _type, elem.text))

            elif elem.tag == 'identifier':
                if keyword or statement:
                    identifier = elem.text
                    if keyword == 'class':
                        class_name = identifier  # preserved for later
                        func_kind = 'method'  # preserved for later
                        pcode, class_dict = compile_class(pcode, class_name, class_dict)

                    elif keyword == 'function':
                        func_name = identifier  # preserved for later
                        if not func_kind:
                            raise RuntimeError("undefined function kind for %s.%s" % (class_name, func_name))
                        pcode, class_dict = compile_function(pcode, func_name, _type, func_kind, class_dict, class_name)

                    elif keyword == 'var':
                        pcode, class_dict, num_args, exp_buffer = \
                            compile_statement(pcode, statement, class_dict, class_name, func_name,
                                              None, None, _type, identifier, num_args, exp_buffer)

                    elif keyword == 'do' or statement == 'do':
                        # "do" compilation is deferred until ";"
                        if not call_class:
                            call_class = identifier  # preserved for later
                        elif not call_func:
                            call_func = identifier  # preserved for later
                        elif identifier in class_dict[class_name][func_name]['args']:
                            exp_buffer.append("push %s %s // %s" %
                                              (class_dict[class_name][func_name]['args'][identifier]['kind'],
                                               class_dict[class_name][func_name]['args'][identifier]['index'],
                                               identifier))
                    elif statement == 'let':
                        if not lhs_var_name:
                            lhs_var_name = identifier  # preserved for later
                            pcode, class_dict, num_args, exp_buffer = \
                                compile_statement(pcode, statement, class_dict, class_name, func_name,
                                                  call_class, call_func, _type, identifier, num_args, exp_buffer)
                        elif not rhs_parent:
                            rhs_parent = identifier  # preserved for later
                        else:
                            rhs_child = identifier  # preserved for later

                    else:
                        raise RuntimeError("unexpected keyword '%s' for identifier '%s'" % (keyword, elem.text))

                else:
                    raise RuntimeError("no keyword defined for '%s'" % elem.text)

            elif elem.tag == 'symbol':
                symbol = elem.text
                if symbol in "{}.=,":
                    pass
                elif symbol == "(":
                    # compile call
                    if statement == "let" and rhs_parent and rhs_child:
                        num_params = None
                        if rhs_parent in sys_func:
                            if rhs_child in sys_func[rhs_parent]:
                                num_params = sys_func[rhs_parent][rhs_child]
                        if not num_params:
                            raise NotImplementedError

                        exp_buffer.append("call %s.%s %s" % (rhs_parent, rhs_child, num_params))
                        rhs_parent = rhs_child = ''
                elif symbol == ")":
                    if exp_buffer:
                        pcode = compile_literal(pcode, exp_buffer.pop())
                elif symbol in op_map:
                    if symbol == "-" and parent == "term":
                        exp_buffer.append("neg")  # not "sub"
                    else:
                        exp_buffer.append(op_map[symbol])
                elif symbol == ';':
                    if statement == 'do':
                        pcode, class_dict, num_args, exp_buffer = \
                            compile_statement(pcode, statement, class_dict, None, None,
                                              call_class, call_func, None, None, num_args, exp_buffer)
                        call_class = call_func = ''
                    elif statement == 'return':
                        pcode, class_dict, num_args, exp_buffer = \
                            compile_statement(pcode, statement, class_dict, class_name, func_name,
                                              None, None, None, None, num_args, exp_buffer)

                    while exp_buffer:
                        pcode = store_pcode(pcode, exp_buffer.pop())

                else:
                    raise RuntimeError("unexpected symbol '%s'" % elem.text)

            elif elem.tag == 'integerConstant':
                pcode = compile_constant(pcode, elem.text)

            elif elem.tag == 'varDec':
                statement = 'var'
            elif elem.tag == 'doStatement':
                statement = 'do'
            elif elem.tag == 'letStatement':
                statement = 'let'
            elif elem.tag == 'returnStatement':
                statement = 'return'
            elif elem.tag == 'expressionList':
                if statement == 'do':
                    children = list(elem)
                    for c_elem in children:
                        if c_elem.tag == 'expression':
                            num_args += 1

            # ignore the tags only used for grouping
            elif elem.tag in ('subroutineDec', 'subroutineBody', 'parameterList', 'statements', 'expression', 'term'):
                pass

            else:
                raise RuntimeError("unparsed tag '%s'" % elem.tag)

    except Exception:
        # capture whatever pcode was processed so far
        print("\n", traceback.format_exc())
        return pcode

    return pcode


if __name__ == '__main__':
    jack_filepaths = [
        r"..\11\Seven\Main.jack",
        r"..\11\ConvertToBin\Main.jack",
    ]

    # matched to course compiler
    strict_matches = [
        r"..\11\Seven\Main.vm",
        # r"..\11\ConvertToBin\Main.jack"  # matches up to let (nyi) + num_vars for main
    ]

    for _filepath in jack_filepaths:
        pcode = main(_filepath, debug=False)

        # strip debug for result comparison
        with open(_filepath.replace(".jack", "_out.vm"), "w") as f:
            print("Writing: %s" % _filepath)
            for line in pcode:
                comment = line.find("//")
                if line.startswith("//"):
                    continue
                elif comment:
                    f.write(line[:comment].strip() + "\n")
                else:
                    f.write(line + "\n")

    # enforce matching for known samples
    for match in strict_matches:
        with open(match) as org_file:
            with open(match.replace(".vm", "_out.vm")) as cur_file:
                if org_file.read() != cur_file.read():
                    raise RuntimeError("Strict file did not match: %s" % match)

    # TODO: arg(s) [psuedo vardec] in function declaration (parameterList)
