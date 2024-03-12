"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.
"""

import xml.etree.ElementTree as ET

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


def store_pcode(pcode, cmd, write=None, strip=False, debug=True):
    if debug:
        if cmd.strip() != "":
            print("PCODE: %s" % cmd.strip())

    if write:
        # debug/wip write
        with open(write.replace(".jack", ".vm"), "w") as pcode_file:
            pcode_file.writelines(pcode)
    else:
        # overwrite at end if successful
        # don't append empty debug "write" calls
        if strip:
            pcode.append(cmd.strip())
        else:
            pcode.append(cmd+"\n")

    return pcode


def compile_class(pcode, class_name, class_dict):
    """
    """
    # define class_name and initialize symbol table
    if class_name not in class_dict:
        class_dict[class_name] = {"args": {}, "index_dict": {}}
    # store_pcode(pcode, "// class %s" % class_name)

    return pcode, class_dict


def compile_function(pcode, func_name, func_type, func_kind, class_dict, class_name):
    """
    """
    # define function symbol
    if func_kind in ("function", "method", "constructor"):
        if func_name not in class_dict[class_name]:
            class_dict[class_name][func_name] = {"kind": func_kind, "type": func_type,
                                                 "args": {}, "index_dict": {}, "label_dict": {}}
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


def compile_vardec(pcode, class_dict, class_name, func_name, var_type, var_name):
    """
    add var to the class dict, print a comment in pcode
    """
    if "local" not in class_dict[class_name][func_name]['index_dict']:
        index = 0
    else:
        index = class_dict[class_name][func_name]['index_dict']['local'] + 1

    class_dict[class_name][func_name]['args'][var_name] = {'kind': 'local', 'type': var_type, 'index': index}
    class_dict[class_name][func_name]['index_dict']['local'] = index
    store_pcode(pcode, "// var %s %s (local %s)" % (var_type, var_name, index))

    return pcode, class_dict


def compile_constant(pcode, constant):
    store_pcode(pcode, "\npush %s" % constant)
    return pcode


def compile_call(pcode, call_class, call_func, num_args, statement):
    store_pcode(pcode, "\ncall %s.%s %s" % (call_class, call_func, num_args))
    if statement == 'do':
        store_pcode(pcode, "\npop temp 0 // discard return on do call")
    return pcode


def compile_return(pcode, class_dict, class_name, func_name):
    if class_dict[class_name][func_name]["type"] == "void":
        store_pcode(pcode, "push constant 0 // void return")
    else:
        raise RuntimeError(class_dict[class_name][func_name]["type"])
    store_pcode(pcode, "\nreturn")
    return pcode


def compile_literal(pcode, code):
    store_pcode(pcode, "\n%s" % code)
    return pcode


def main(filepath, debug=False):
    print("Parsing: %s" % filepath)
    tree = ET.parse(filepath.replace(".jack", "_out.xml"))

    # persist through loop scope
    parent = 'class'
    pcode = []
    exp_buffer = []
    class_dict = {}
    num_args = 0
    class_name = func_kind = call_class = call_func = statement = func_name = ''
    keyword = _type = identifier = func_type = symbol = ''

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
            # reset tag context on depth change (possibly this can be controlled by function scoping?)
            # exlcusion: class_name, func_kind, call_class, call_func, statement, func_name
            keyword = _type = identifier = func_type = symbol = ''

        if elem.tag == 'keyword':
            if not keyword:
                keyword = elem.text
            elif not _type:
                _type = elem.text
            else:
                raise RuntimeError("unexpected keywords %s %s %s" % (keyword, _type, elem.text))
            
        elif elem.tag == 'identifier':
            if keyword:
                identifier = elem.text
                if keyword == 'class':
                    class_name = identifier
                    func_kind = 'method'
                    pcode, class_dict = compile_class(pcode, class_name, class_dict)

                elif keyword == 'function':
                    func_type = _type
                    func_name = identifier
                    if not func_kind:
                        raise RuntimeError("undefined function kind for %s.%s" % (class_name, func_name))
                    pcode, class_dict = compile_function(pcode, func_name, func_type, func_kind, class_dict, class_name)

                elif keyword == 'var':
                    var_type = _type
                    var_name = identifier
                    pcode, class_dict = compile_vardec(pcode, class_dict, class_name, func_name, var_type, var_name)

                elif keyword == 'do':
                    if not call_class:
                        call_class = identifier
                    else:
                        call_func = identifier
                else:
                    raise RuntimeError("unexpected keyword %s for identifier %s" % (keyword, elem.text))
            else:
                raise RuntimeError("no keyword defined for %s" % elem.text)

        elif elem.tag == 'symbol':
            symbol = elem.text
            if symbol in "{}.":
                pass
            elif symbol == "(":
                # TODO: call expression handler
                pass
            elif symbol == ")":
                if exp_buffer:
                    pcode = compile_literal(pcode, exp_buffer.pop())
            elif symbol in op_map:
                if symbol == "-" and parent == "term":
                    exp_buffer.append("neg")  # not "sub"
                else:
                    exp_buffer.append(op_map[symbol])
            elif symbol == ',':
                pass
            elif symbol == ';':
                # process the original statement
                if statement == 'do':
                    pcode = compile_call(pcode, call_class, call_func, num_args, 'do')  # TODO: num_args
                    num_args = 0
                elif statement == 'return':
                    pcode = compile_return(pcode, class_dict, class_name, func_name)
                else:
                    RuntimeError("unexpected statement type %s" % statement)
            else:
                raise RuntimeError("unexpected symbol %s" % elem.text)

        elif elem.tag == 'integerConstant':
            pcode = compile_constant(pcode, elem.text)

        elif elem.tag == 'doStatement':
            statement = 'do'
        elif elem.tag == 'returnStatement':
            statement = 'return'
        elif elem.tag == 'expressionList':
            if statement == 'do':
                children = list(elem)
                for c_elem in children:
                    if c_elem.tag == 'expression':
                        num_args += 1

        elif elem.tag in ('subroutineDec', 'subroutineBody', 'parameterList', 'statements', 'expression', 'term',
                          'varDec'):
            pass

        else:
            raise RuntimeError("unparsed tag %s" % elem.tag)


if __name__ == '__main__':
    jack_filepaths = [
        # r"..\11\Seven\Main.jack",  # matched to course compiler
        r"..\11\ConvertToBin\Main.jack",
    ]

    for _filepath in jack_filepaths:
        main(_filepath, debug=False)
