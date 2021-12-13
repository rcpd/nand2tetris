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

# compiled library functions header (kind, type, params)
sys_func = {
    "Math": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
             "abs": {"kind": "func", "type": "int", "args": ("int",), "len": 1},
             "multiply": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "divide": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "min": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "max": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "sqrt": {"kind": "func", "type": "int", "args": ("int",), "len": 1}},
    "Memory": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
               "peek:": {"kind": "func", "type": "int", "args": ("int", ), "len": 1},
               "poke:": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "alloc:": {"kind": "func", "type": "Array", "args": ("int",), "len": 1},
               "deAlloc:": {"kind": "func", "type": "void", "args": ("Array",), "len": 1}},
    "String": {"new": {"kind": "const", "type": "String", "args": ("int",), "len": 1},
               "dispose": {"kind": "method", "type": "void", "args": (), "len": 0},
               "length": {"kind": "method", "type": "int", "args": (), "len": 0},
               "charAt": {"kind": "method", "type": "int", "args": ("int",), "len": 1},
               "setCharAt": {"kind": "method", "type": "void", "args": ("int", "char"), "len": 2},
               "appendChar": {"kind": "method", "type": "String", "args": ("char",), "len": 1},
               "eraselastChar": {"kind": "method", "type": "void", "args": (), "len": 0},
               "intValue": {"kind": "method", "type": "int", "args": ("int",), "len": 1},
               "setInt": {"kind": "method", "type": "void", "args": ("int",), "len": 1},
               "backSpace": {"kind": "func", "type": "char", "args": (), "len": 0},
               "doubleQuote": {"kind": "func", "type": "char", "args": (), "len": 0},
               "newLine": {"kind": "func", "type": "char", "args": (), "len": 0}},
    "Array": {"new:": {"kind": "const", "type": "Array", "args": ("int",), "len": 1},
              "dispose:": {"kind": "method", "type": "void", "args": (), "len": 0}},
    "Output": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
               "moveCursor:": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "printChar:": {"kind": "func", "type": "void", "args": ("char",), "len": 1},
               "printString:": {"kind": "func", "type": "void", "args": ("String",), "len": 1},
               "printInt:": {"kind": "func", "type": "void", "args": ("int",), "len": 1},
               "println:": {"kind": "func", "type": "void", "args": (), "len": 0},
               "backSpace:": {"kind": "func", "type": "void", "args": (), "len": 0}},
    "Screen": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
               "clearScreen:": {"kind": "func", "type": "void", "args": (), "len": 0},
               "setColor:": {"kind": "func", "type": "void", "args": ("boolean", ), "len": 1},
               "drawPixel:": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "drawLine:": {"kind": "func", "type": "void", "args": ("int", "int", "int", "int"), "len": 4},
               "drawRectangle:": {"kind": "func", "type": "void", "args": ("int", "int", "int", "int"), "len": 4},
               "drawCirlce:": {"kind": "func", "type": "void", "args": ("int", "int", "int"), "len": 3}},
    "Keyboard": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
                 "keyPressed:": {"kind": "func", "type": "char", "args": (), "len": 0},
                 "readChar:": {"kind": "func", "type": "char", "args": (), "len": 0},
                 "readLine:": {"kind": "func", "type": "String", "args": ("String",), "len": 1},
                 "readInt:": {"kind": "func", "type": "int", "args": ("String",), "len": 1},
                 },
    "Sys": {"init:": {"kind": "func", "type": "void", "args": (), "len": 0},
            "halt:": {"kind": "func", "type": "void", "args": (), "len": 0},
            "error:": {"kind": "func", "type": "void", "args": ("int",), "len": 1},
            "wait:": {"kind": "func", "type": "void", "args": ("int",), "len": 1}},
    }

# primitives & keywords
# class, constructor, method, function
# int, boolean, char, void
# var, static, field
# let, do, if, else, while, return
# true, false, null, this

# var: defined as an argument or locally, scoped to the function/method
# static: single global reference shared amongst all instances of a class
# field: unique to a specific instantiation of a class object
# method: operates on a specific instantiation of a class object
# function: global to all instantiations of the class (a constructor is a function)

types = ['int', 'boolean', 'char', 'void']


def store_pcode(pcode, cmd, debug=True):
    """
    optionally dynamically print the pcode with additional debug information, store for later file output
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
    update the class_dict during pre-scan, emit pcode when declaration encountered
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
    update the class_dict during pre-scan, emit pcode when declaration encountered
    """

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
        store_pcode(pcode, "\n// param this argument 0")

        if func_kind == "constructor":
            # allocate space on heap
            store_pcode(pcode, "push constant %s" % num_vars)
            store_pcode(pcode, "call Memory.alloc 1 // allocate object + params on heap")  # non-void return (no pop)
            store_pcode(pcode, "pop pointer 0 // update 'this' to heap address")

        elif func_kind == "method":
            # move pointer to current object (implicit "this" argument)
            store_pcode(pcode, "push argument 0")
            store_pcode(pcode, "pop pointer 0 // update 'this' to object for method call")

    return pcode, class_dict


def compile_statement(pcode, statement, class_dict, class_name, func_name, call_class, call_func,
                      var_type, var_name, num_args, exp_buffer, prescan=False):
    """
    provides a common interface to the statement compilers
    """

    if statement == "do":
        pcode = compile_call(pcode, call_class, call_func, num_args, statement)
        num_args = 0

    elif statement == "let":
        exp_buffer = compile_lhs_statement(class_dict, class_name, func_name, var_name, exp_buffer)

    elif statement == "return":
        # looks up func type (affects return behaviour)
        pcode = compile_return(pcode, class_dict, class_name, func_name)

    elif statement == "while":
        raise NotImplementedError

    elif statement == "if":
        raise NotImplementedError

    elif statement == "var":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode, class_dict, class_name, func_name, 'local', var_type, var_name,
                                           prescan=prescan)

    elif statement == "param":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode, class_dict, class_name, func_name, 'argument', var_type, var_name,
                                           prescan=prescan)

    else:
        raise RuntimeError("Unexpected statement type '%s'" % statement)

    return pcode, class_dict, num_args, exp_buffer


def compile_lhs_statement(class_dict, class_name, func_name, var_name, exp_buffer):
    """
    compile the assignment component of a statement
    store pcode in exp_buffer so its emitted when expression is closed
    """

    exp_buffer.append("pop %s %s // %s" % (class_dict[class_name][func_name]['args'][var_name]['kind'],
                                           class_dict[class_name][func_name]['args'][var_name]['index'],
                                           var_name))
    return exp_buffer


def compile_vardec(pcode, class_dict, class_name, func_name, var_kind, var_type, var_name, prescan=False):
    """
    add var to the class dict, print a comment in pcode
    """

    # don't emit pcode during pre-scan
    if var_name not in class_dict[class_name][func_name]['args']:
        if var_kind not in class_dict[class_name][func_name]['index_dict']:
            index = 0
        else:
            index = class_dict[class_name][func_name]['index_dict'][var_kind] + 1

        class_dict[class_name][func_name]['args'][var_name] = {'kind': var_kind, 'type': var_type, 'index': index}
        class_dict[class_name][func_name]['index_dict'][var_kind] = index

    elif not prescan:
        if var_kind == 'local':
            store_pcode(pcode, "// var %s %s (%s %s)" %
                        (var_type, var_name,  var_kind, class_dict[class_name][func_name]['args'][var_name]['index']))
        elif var_kind == 'argument':
            store_pcode(pcode, "// param %s %s (%s %s)" %
                        (var_type, var_name, var_kind, class_dict[class_name][func_name]['args'][var_name]['index']))
        else:
            raise RuntimeError("unexpected var_kind '%s'" % var_kind)

    return pcode, class_dict


def compile_constant(pcode, constant):
    """
    emit pcode when constant encountered
    """

    store_pcode(pcode, "\npush constant %s" % constant)
    return pcode


def compile_call(pcode, call_class, call_func, num_args, statement):
    """
    emit pcode when call encountered, discard return on do call
    """

    store_pcode(pcode, "\ncall %s.%s %s" % (call_class, call_func, num_args))
    if statement == 'do':
        store_pcode(pcode, "\npop temp 0 // discard return on do call")
    return pcode


def compile_return(pcode, class_dict, class_name, func_name):
    """
    emit pcode when return encountered, push null for void functions
    """

    if class_dict[class_name][func_name]["type"] == "void":
        store_pcode(pcode, "push constant 0 // void return")
    else:
        raise RuntimeError(class_dict[class_name][func_name]["type"])
    store_pcode(pcode, "\nreturn")
    return pcode


def compile_literal(pcode, code):
    """
    emit pcode when literal encountered
    """

    store_pcode(pcode, "\n%s" % code)
    return pcode


def compile_boolean(value, exp_buffer):
    """
    store pcode in exp_buffer so its emitted when expression is closed
    """

    if value == "true":
        # this is in reverse due to how exp_buffer is unpacked
        exp_buffer.append("not // true (2/2)")
        exp_buffer.append("push constant 0 // true (1/2)")
    elif value == "false":
        exp_buffer.append("push constant 0 // false")
    else:
        raise RuntimeError("unexpected boolean value '%s'" % value)

    return exp_buffer


def main(filepath, debug=False):
    """
    main engine:
        - parse the AST
        - prescan the AST for class/function declarations
        - tag metadata as tokens are parsed
        - compile once enough information is parsed
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

            elif elem.tag == 'identifier':
                identifier = elem.text

                # # debug
                # if identifier == 'loop':
                #     print('bp')

                if keyword == 'class':
                    class_name = identifier  # preserved for later
                    func_kind = 'method'  # preserved for later
                    pcode, class_dict = compile_class(pcode, class_name, class_dict)

                elif keyword == 'function':
                    func_name = identifier  # preserved for later
                    if not func_kind:
                        raise RuntimeError("undefined function kind for '%s.%s'" % (class_name, func_name))
                    pcode, class_dict = compile_function(pcode, func_name, _type, func_kind, class_dict, class_name)

                elif statement in ('var', 'param'):
                    pcode, class_dict, num_args, exp_buffer = \
                        compile_statement(pcode, statement, class_dict, class_name, func_name, None, None, _type,
                                          identifier, num_args, exp_buffer, prescan=True)

            elif elem.tag == 'varDec':
                statement = 'var'
            elif elem.tag == 'parameterList':
                statement = 'param'
            elif elem.tag == 'doStatement':
                statement = 'do'
            elif elem.tag == 'letStatement':
                statement = 'let'
            elif elem.tag == 'returnStatement':
                statement = 'return'

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

            if elem:  # has children
                parent = elem.tag
                # reset tag context on depth change
                # exlcusion: class_name, func_kind, call_class, call_func, statement, func_name, lhs_var_name
                keyword = _type = identifier = func_type = symbol = ''

            if elem.tag == 'keyword':
                if elem.text in ('true', 'false'):
                    exp_buffer = compile_boolean(elem.text, exp_buffer)
                elif not keyword:
                    keyword = elem.text  # preserved for later
                elif not _type:
                    _type = elem.text  # preserved for later
                else:
                    raise RuntimeError("unexpected keywords '%s' '%s' '%s'" % (keyword, _type, elem.text))

            elif elem.tag == 'identifier':
                # debug
                # if elem.text == 'loop':
                #     print('bp')

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

                    elif statement in ('var', 'param'):
                        # catch param case where type is only keyword
                        if not _type and keyword in types:
                            _type = keyword
                        pcode, class_dict, num_args, exp_buffer = \
                            compile_statement(pcode, statement, class_dict, class_name, func_name,
                                              None, None, _type, identifier, num_args, exp_buffer)

                    elif statement == 'do':
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
                    raise RuntimeError("no keyword or statement defined for '%s'" % elem.text)

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

                    lhs_var_name = rhs_parent = rhs_child = ''

                else:
                    raise RuntimeError("unexpected symbol '%s'" % elem.text)

            elif elem.tag == 'integerConstant':
                pcode = compile_constant(pcode, elem.text)

            elif elem.tag == 'varDec':
                statement = 'var'
            elif elem.tag == 'parameterList':
                statement = 'param'
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
            elif elem.tag in ('subroutineDec', 'subroutineBody', 'statements', 'expression', 'term'):
                pass

            else:
                raise RuntimeError("unparsed tag '%s'" % elem.tag)

    except Exception:
        # capture whatever pcode was processed so far
        print("\n", traceback.format_exc())
        return pcode

    return pcode


if __name__ == '__main__':
    """
    loop across multiple files:
        - call the main engine
        - write pcode to output file (however much was processed)
        - where possible, enforce match to course compiled programs
    """

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

    # TODO: while
