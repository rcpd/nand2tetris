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
    "Math": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
             "abs": {"kind": "func", "type": "int", "args": ("int",), "len": 1},
             "multiply": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "divide": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "min": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "max": {"kind": "func", "type": "int", "args": ("int", "int"), "len": 2},
             "sqrt": {"kind": "func", "type": "int", "args": ("int",), "len": 1}},
    "Memory": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
               "peek": {"kind": "func", "type": "int", "args": ("int", ), "len": 1},
               "poke": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "alloc": {"kind": "func", "type": "Array", "args": ("int",), "len": 1},
               "deAlloc": {"kind": "func", "type": "void", "args": ("Array",), "len": 1}},
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
    "Array": {"new": {"kind": "const", "type": "Array", "args": ("int",), "len": 1},
              "dispose": {"kind": "method", "type": "void", "args": (), "len": 0}},
    "Output": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
               "moveCursor": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "printChar": {"kind": "func", "type": "void", "args": ("char",), "len": 1},
               "printString": {"kind": "func", "type": "void", "args": ("String",), "len": 1},
               "printInt": {"kind": "func", "type": "void", "args": ("int",), "len": 1},
               "println": {"kind": "func", "type": "void", "args": (), "len": 0},
               "backSpace": {"kind": "func", "type": "void", "args": (), "len": 0}},
    "Screen": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
               "clearScreen": {"kind": "func", "type": "void", "args": (), "len": 0},
               "setColor": {"kind": "func", "type": "void", "args": ("boolean", ), "len": 1},
               "drawPixel": {"kind": "func", "type": "void", "args": ("int", "int"), "len": 2},
               "drawLine": {"kind": "func", "type": "void", "args": ("int", "int", "int", "int"), "len": 4},
               "drawRectangle": {"kind": "func", "type": "void", "args": ("int", "int", "int", "int"), "len": 4},
               "drawCirlce": {"kind": "func", "type": "void", "args": ("int", "int", "int"), "len": 3}},
    "Keyboard": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
                 "keyPressed": {"kind": "func", "type": "char", "args": (), "len": 0},
                 "readChar": {"kind": "func", "type": "char", "args": (), "len": 0},
                 "readLine": {"kind": "func", "type": "String", "args": ("String",), "len": 1},
                 "readInt": {"kind": "func", "type": "int", "args": ("String",), "len": 1},
                 },
    "Sys": {"init": {"kind": "func", "type": "void", "args": (), "len": 0},
            "halt": {"kind": "func", "type": "void", "args": (), "len": 0},
            "error": {"kind": "func", "type": "void", "args": ("int",), "len": 1},
            "wait": {"kind": "func", "type": "void", "args": ("int",), "len": 1}},
    }

# primitives & keywords
# class, constructor, method, function
# int, boolean, char, void, Array
# var, static, field
# let, do, if, else, while, return
# true, false, null, this

# var: defined as an parameter or locally, scoped to the function/method
# static: single global reference shared amongst all instances of a class
# field: unique to a specific instantiation of a class object
# method: operates on a specific instantiation of a class object
# function: global to all instantiations of the class (a constructor is a function)

types = ['int', 'boolean', 'char', 'void', 'Array']


def find_parent(tree, node):
    """
    Draw a map of the tree and yield the parent from node
    """
    parent_map = {child: parent for parent in tree.iter() for child in parent}
    return parent_map[node]


def store_pcode(pcode, cmd, debug=True):
    """
    optionally dynamically print the pcode with additional debug information, store for later file output
    """

    if debug:
        if cmd.strip() not in ("", "// (", "// )"):
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
            store_pcode(pcode, "\n// param this argument 0")
            store_pcode(pcode, "push argument 0")
            store_pcode(pcode, "pop pointer 0 // update 'this' to object for method call")

    return pcode, class_dict


# TODO: return args are not optional / this seems unnecessary
def compile_statement(pcode=None, statement=None, class_dict=None, class_name=None, func_name=None, call_class=None,
                      call_func=None, var_type=None, var_name=None, num_args=0, exp_buffer=[],
                      if_count=0, while_count=0, prescan=False):
    """
    provides a common interface to the statement compilers
    must passthrough at least statement + return args + inner call args i.e.
    compile_statement(pcode=pcode, statement=statement, class_dict=class_dict, num_args=num_args,
                      while_count=while_count, if_count=if_count, exp_buffer=exp_buffer)
    """

    if statement == "do":
        pcode = compile_call(pcode=pcode, call_class=call_class, call_func=call_func, num_args=num_args,
                             statement=statement)
        num_args = 0

    elif statement == "let":
        exp_buffer = compile_assignment(class_dict=class_dict, class_name=class_name, func_name=func_name,
                                        var_name=var_name, exp_buffer=exp_buffer)

    elif statement == "return":
        # looks up func type (affects return behaviour)
        pcode = compile_return(pcode=pcode, class_dict=class_dict, class_name=class_name, func_name=func_name)

    elif statement == "while":
        pcode, while_count = compile_while(pcode=pcode, while_count=while_count)

    elif statement == "if":
        pass

    elif statement == "var":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                           func_name=func_name, var_kind='local', var_type=var_type, var_name=var_name,
                                           prescan=prescan)

    elif statement == "param":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                           func_name=func_name, var_kind='argument', var_type=var_type,
                                           var_name=var_name, prescan=prescan)

    else:
        raise RuntimeError("Unexpected statement type '%s'" % statement)

    return pcode, class_dict, num_args, while_count, if_count, exp_buffer


def compile_assignment(class_dict, class_name, func_name, var_name, exp_buffer):
    """
    compile the assignment component of a statement
    store pcode in exp_buffer so its emitted when expression is closed
    """

    exp_buffer.append("pop %s %s // = %s" % (class_dict[class_name][func_name]['args'][var_name]['kind'],
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
        if not var_type:
            raise RuntimeError("unexpected var_type '%s' (%s.%s.%s)" % (var_type, class_name, func_name, var_name))
        if var_type == var_name:
            raise RuntimeError("unexpected var_name '%s' (%s.%s.%s)" % (var_type, class_name, func_name, var_name))

        if var_kind == 'local':
            store_pcode(pcode, "// var %s %s (%s %s)" %
                        (var_type, var_name,  var_kind, class_dict[class_name][func_name]['args'][var_name]['index']))
        elif var_kind == 'argument':
            store_pcode(pcode, "// param %s %s (%s %s)" %
                        (var_type, var_name, var_kind, class_dict[class_name][func_name]['args'][var_name]['index']))
        else:
            raise RuntimeError("unexpected var_kind '%s'" % var_kind)

    return pcode, class_dict


def compile_constant(pcode, constant, exp_buffer=None):
    """
    emit pcode when constant encountered
    """

    if type(exp_buffer) is list:
        exp_buffer.append("push constant %s" % constant)
        return exp_buffer
    else:
        store_pcode(pcode, "\npush constant %s" % constant)
        return pcode


def compile_call(pcode, call_class, call_func, num_args, statement, exp_buffer=None):
    """
    emit pcode when call encountered, discard return on do call
    """
    if type(exp_buffer) is list:
        if statement == 'do':
            exp_buffer.append("pop temp 0 // discard return on do call")
        exp_buffer.append("call %s.%s %s" % (call_class, call_func, num_args))
        return exp_buffer
    else:
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
    elif class_dict[class_name][func_name]["type"] == "int":
        pass
    else:
        raise NotImplementedError(class_dict[class_name][func_name]["type"])
    store_pcode(pcode, "\nreturn")
    return pcode


def compile_literal(pcode, code, exp_buffer=None):
    """
    emit pcode when literal encountered
    """

    if type(exp_buffer) is list:
        exp_buffer.append(code)
        return exp_buffer
    else:
        store_pcode(pcode, "\n%s" % code)
        return pcode


def compile_boolean(pcode, value, exp_buffer=None):
    """
    store pcode in exp_buffer so its emitted when expression is closed
    """

    if type(exp_buffer) is list:
        if value == "true":
            # this is in reverse due to how exp_buffer is unpacked
            exp_buffer.append("not // true (2/2)")
            exp_buffer.append("push constant 0 // true (1/2)")
        elif value == "false":
            exp_buffer.append("push constant 0 // false")
        else:
            raise RuntimeError("unexpected boolean value '%s'" % value)
        return exp_buffer
    else:
        if value == "true":
            store_pcode(pcode, "\npush constant 0 // true (1/2)")
            store_pcode(pcode, "\nnot // true (2/2)")
        elif value == "false":
            store_pcode(pcode, "\npush constant 0 // false")
        else:
            raise RuntimeError("unexpected boolean value '%s'" % value)
        return pcode


def compile_while(pcode, while_count):
    """
    emit pcode when while encountered
    """

    store_pcode(pcode, "\nlabel WHILE_EXP%s // begin while expression" % while_count)
    return pcode, while_count


def compile_var(pcode, class_dict, class_name, func_name, var_name, exp_buffer=None):
    """
    emit pcode when while encountered
    """
    # TODO: var vs array handling
    if type(exp_buffer) is list:
        exp_buffer.append("push %s %s // %s" %
                          (class_dict[class_name][func_name]['args'][var_name]['kind'],
                           class_dict[class_name][func_name]['args'][var_name]['index'], var_name))
        return exp_buffer
    else:
        store_pcode(pcode, "\npush %s %s // %s" %
                    (class_dict[class_name][func_name]['args'][var_name]['kind'],
                     class_dict[class_name][func_name]['args'][var_name]['index'], var_name))
        return pcode


def expression_handler(pcode, statement, exp_buffer, class_dict=None, identifier=None, class_name=None, func_name=None,
                       parent_obj=None, child_func=None, symbol=None):
    """
    expressions call the buffered version of compile functions so they are parsed first in, last out
    expressions are found in let (rhs), array indexes, if/while conditions and optionally as return values
    """
    num_params = 0

    if symbol:
        if symbol == "(":
            exp_buffer.append("// (")  # inject expression marker into buffer

        elif symbol == ")":
            # process everything up to & including the last expression opening from buffer
            pcode = pop_buffer(pcode, exp_buffer, stop_at="// (", pop_incl=True)

        elif symbol == ",":
            # process everything up to but not including the last expression opening from buffer
            pcode = pop_buffer(pcode, exp_buffer, stop_at="// (")  # i.e. expression was not bracketed

    elif identifier:
        # attempt to lookup class/func attributes (2 passes)
        if not parent_obj:
            if identifier in sys_func or identifier in class_dict:
                parent_obj = identifier

        elif not child_func:
            if parent_obj in sys_func:
                if identifier in sys_func[parent_obj]:
                    child_func = identifier
                if child_func:
                    num_params = sys_func[parent_obj][child_func]['len']
            else:
                if identifier in class_dict[parent_obj]:
                    child_func = identifier
                    if child_func:
                        for arg in class_dict[parent_obj][child_func]['args']:
                            if class_dict[parent_obj][child_func]['args'][arg]['kind'] == 'argument':
                                num_params += 1

        # if parent/child pair found assume call & compile directly
        if parent_obj and child_func:
            exp_buffer = compile_call(pcode, parent_obj, child_func, num_params, statement, exp_buffer=exp_buffer)
            parent_obj = child_func = ''

        # if var found compile directly (not buffer)
        elif identifier in class_dict[class_name][func_name]['args']:
            pcode = compile_var(pcode, class_dict, class_name, func_name, identifier)

    return pcode, exp_buffer, parent_obj, child_func


def pop_buffer(pcode, exp_buffer, stop_at=None, pop_incl=False):
    """
    selectively or entirely process the expression buffer
    """
    if stop_at and exp_buffer:
        while exp_buffer[-1] != stop_at:
            store_pcode(pcode, exp_buffer.pop())
        if pop_incl:
            store_pcode(pcode, exp_buffer.pop())
    else:
        while exp_buffer:
            store_pcode(pcode, exp_buffer.pop())
    return pcode


def main(filepath):
    """
    main engine:
        - parse the AST
        - prescan the AST for class/function declarations
        - tag metadata as tokens are parsed
        -- tag scope is defined by tree depth, some need to be carried forward, others cleared on depth change
        - call compile functions once enough information is parsed
    """

    pcode = []
    try:
        print("Parsing: %s" % filepath)
        tree = Et.parse(filepath.replace(".jack", "_out.xml"))

        # persist through loop scope
        class_dict = {}
        class_name = statement = func_name = keyword = var_type = ''

        # pre-process tree for class/function/var decs
        for elem in tree.iter():
            elem.tag = (elem.tag or '').strip()
            elem.text = (elem.text or '').strip()
            # skip rootnode
            if elem.tag == 'class':
                continue

            if elem:  # has children
                keyword = var_type = ''  # reset tag context on depth change

            if elem.tag == 'keyword':
                if not keyword:
                    keyword = elem.text  # preserved for later
                elif not var_type:
                    var_type = elem.text  # preserved for later

            elif elem.tag == 'identifier':
                identifier = elem.text

                if keyword == 'class':
                    class_name = identifier  # preserved for later
                    pcode, class_dict = compile_class(pcode, class_name, class_dict)

                elif keyword == 'function':
                    func_name = identifier  # preserved for later
                    func_kind = keyword  # preserved for later
                    if not func_kind:
                        raise RuntimeError("undefined function kind for '%s.%s'" % (class_name, func_name))
                    pcode, class_dict = compile_function(pcode, func_name, var_type, func_kind, class_dict, class_name)

                elif statement in ('var', 'param'):
                    if not var_type:
                        # param in function declaration
                        if keyword in types:
                            var_type = keyword

                        # local var passed as param
                        elif identifier in class_dict[class_name][func_name]['args']:
                            continue  # already processed

                        # built-in types like 'Array'
                        elif identifier in types:
                            if identifier != 'Array':
                                raise RuntimeError()  # debug
                            var_type = identifier
                            continue  # process on next loop

                        if not var_type:
                            raise RuntimeError()

                    pcode, class_dict, num_args, while_count, if_count, exp_buffer = \
                        compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                          class_name=class_name, func_name=func_name, var_type=var_type,
                                          var_name=identifier, prescan=True)

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
        exp_buffer = []
        block = []
        num_args = while_count = if_count = 0
        class_name = statement = func_name = keyword = var_type = identifier = ''
        lhs_var_name = parent_obj = child_func = ''

        # walk AST
        for elem in tree.iter():
            elem.tag = (elem.tag or '').strip()
            elem.text = (elem.text or '').strip()
            # skip rootnode
            if elem.tag == 'class':
                continue

            # has children
            if elem:
                # reset select tag contexts on depth change
                keyword = var_type = identifier = ''

            # set keyword flag (single depth)
            if elem.tag == 'keyword':
                if elem.text in ('true', 'false'):
                    exp_buffer = compile_boolean(pcode, elem.text, exp_buffer)
                elif not keyword:
                    keyword = elem.text  # preserved for later
                elif not var_type:
                    var_type = elem.text  # preserved for later
                else:
                    raise RuntimeError("unexpected keywords '%s' '%s' '%s'" % (keyword, var_type, elem.text))

            elif elem.tag == 'identifier':
                if keyword or statement:
                    identifier = elem.text

                    # class declaration
                    if keyword == 'class':
                        class_name = identifier  # preserved for later
                        pcode, class_dict = compile_class(pcode, class_name, class_dict)

                    # function declaration
                    elif keyword == 'function':
                        func_name = identifier  # preserved for later
                        func_kind = 'function'  # preserved for later
                        if not func_kind:
                            raise RuntimeError("undefined function kind for %s.%s" % (class_name, func_name))
                        pcode, class_dict = compile_function(pcode, func_name, var_type, func_kind, class_dict,
                                                             class_name)

                    # var declaration (local or function parameter)
                    elif statement in ('var', 'param'):
                        # catch param case where type is only keyword (not a vardec so not in pre-scan)
                        if not var_type:
                            try:
                                var_type = class_dict[class_name][func_name]['args'][identifier]['type']
                            except KeyError:
                                pass

                        if not var_type:
                            # built-in library types like 'Array'
                            if identifier in types:
                                var_type = identifier
                                continue  # process on next loop
                            else:
                                raise RuntimeError("No type found for '%s'" % identifier)

                        pcode, class_dict, num_args, while_count, if_count, exp_buffer = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_type=var_type,
                                              var_name=identifier, while_count=while_count, if_count=if_count)
                        keyword = var_type = ''

                    # collect class/func for call, compile when paired
                    elif statement == 'do':
                        # TODO: move out of expression handler
                        pcode, exp_buffer, parent_obj, child_func = \
                                expression_handler(pcode, statement, exp_buffer, class_dict=class_dict,
                                                   identifier=identifier, class_name=class_name, func_name=func_name,
                                                   parent_obj=parent_obj, child_func=child_func)

                    # buffer assignee compilation first, then buffer any remaining expressions
                    elif statement == 'let':
                        if not lhs_var_name:
                            lhs_var_name = identifier  # preserved for later
                            pcode, class_dict, num_args, while_count, if_count, exp_buffer = \
                                compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                                  class_name=class_name, func_name=func_name, var_name=identifier,
                                                  exp_buffer=exp_buffer, while_count=while_count, if_count=if_count)
                        else:
                            pcode, exp_buffer, parent_obj, child_func = \
                                expression_handler(pcode, statement, exp_buffer, class_dict=class_dict,
                                                   identifier=identifier, class_name=class_name, func_name=func_name,
                                                   parent_obj=parent_obj, child_func=child_func)

                    # buffer while/if expressions
                    elif statement in ('while', 'if', 'return'):
                        pcode, exp_buffer, parent_obj, child_func = \
                            expression_handler(pcode, statement, exp_buffer, class_dict=class_dict,
                                               identifier=identifier, class_name=class_name, func_name=func_name)
                    else:
                        raise RuntimeError("unexpected keyword/statement '%s'/'%s' for identifier '%s'" %
                                           (keyword, statement, elem.text))
                else:
                    raise RuntimeError("no keyword or statement defined for '%s'" % elem.text)

            elif elem.tag == 'symbol':
                # TODO: compile_symbol
                symbol = elem.text.strip()

                # debug
                # if symbol in (r"(){},") or symbol in op_map:
                #     print("PCODE: // '%s'" % symbol)

                if symbol in ".":
                    pass
                elif symbol == "=" and find_parent(tree, elem).tag == 'letStatement':
                    pass  # ignore first '=' in let statement (expressions will have different parent)
                elif symbol == "{":
                    if exp_buffer:
                        raise RuntimeError("unparsed expressions still in buffer: %s" % exp_buffer)

                    elif keyword == 'else':  # no explicit statement type for else
                        # TODO: compile_else_start
                        block.append(keyword)
                        # close the latest if_true block (-1) but don't dec until IF_END
                        store_pcode(pcode, "\nlabel IF_FALSE%s // begin if_false_block" % (if_count-1))

                    elif statement == 'if':
                        # TODO: compile_if_start
                        block.append(statement)
                        store_pcode(pcode, "\nif-goto IF_TRUE%s // end if expression / if_true_jump" % if_count)
                        store_pcode(pcode, "\ngoto IF_FALSE%s // if_false_jump" % if_count)
                        store_pcode(pcode, "\nlabel IF_TRUE%s // begin if_true_block" % if_count)
                        if_count += 1  # inc now so any nested if are correct

                    elif statement == 'while':
                        # TODO: compile_while_goto
                        block.append(statement)
                        store_pcode(pcode, "\nnot // end while expression / while_jump (1/2)")
                        store_pcode(pcode, "\nif-goto WHILE_END%s // while_jump (2/2) [break loop if not]" %
                                    while_count)
                        while_count += 1

                    elif statement == 'param':
                        pass
                    elif keyword not in ('class', 'function'):
                        raise RuntimeError("unexpected '{' (statement '%s', keyword '%s')" % (statement, keyword))

                elif symbol == "}":
                    if block:
                        if block[-1] == 'else':
                            # TODO: compile_else_end
                            store_pcode(pcode, "\nlabel IF_END%s // end if_block" % (if_count-1))
                            block.pop()
                            # FIXME: how to handle if-without-else ?
                            if_count -= 1

                        elif block[-1] == 'if':
                            store_pcode(pcode, "\ngoto IF_END%s // end if_true_block" % (if_count-1))
                            block.pop()

                        elif block[-1] == 'while':
                            # TODO: compile_while_end
                            store_pcode(pcode, "\ngoto WHILE_EXP%s // loop to start of while_block" % (while_count-1))
                            store_pcode(pcode, "\nlabel WHILE_END%s // end while_block" % (while_count-1))
                            block.pop()
                            while_count -= 1
                        else:
                            raise RuntimeError("unexpected block '%s'" % block[-1])

                elif symbol == "(":
                    # mark the start of a new expression
                    pcode, exp_buffer, parent_obj, child_func = \
                        expression_handler(pcode, statement, exp_buffer, class_dict=class_dict, identifier=identifier,
                                           class_name=class_name, func_name=func_name, symbol=symbol)

                elif symbol == ")":
                    # pop the last buffered expression (including the brackets)
                    pcode, exp_buffer, parent_obj, child_func = \
                        expression_handler(pcode, statement, exp_buffer, class_dict=class_dict, identifier=identifier,
                                           class_name=class_name, func_name=func_name, symbol=symbol)

                elif symbol == ',':
                    # pop any buffered expressions up to but not including the next opening bracket
                    pcode, exp_buffer, parent_obj, child_func = \
                        expression_handler(pcode, statement, exp_buffer, class_dict=class_dict, identifier=identifier,
                                           class_name=class_name, func_name=func_name, symbol=symbol)

                elif symbol == ';':
                    pcode = pop_buffer(pcode, exp_buffer)  # empty the buffer

                    if statement == 'return':
                        pcode, class_dict, num_args, while_count, if_count, exp_buffer = \
                            compile_statement(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                              func_name=func_name, statement=statement, while_count=while_count,
                                              if_count=if_count)

                    if exp_buffer:
                        raise RuntimeError("unparsed expressions still in buffer: %s" % exp_buffer)

                    lhs_var_name = ''

                elif symbol in op_map:
                    if symbol == "-" and find_parent(tree, elem).tag == "term":
                        exp_buffer.append("neg")  # not "sub"
                    else:
                        exp_buffer.append(op_map[symbol])

                else:
                    raise RuntimeError("unexpected symbol '%s'" % elem.text)

            elif elem.tag == 'integerConstant':
                pcode = compile_constant(pcode, elem.text)

            elif elem.tag == 'ifStatement':
                statement = 'if'
                # TODO: compile_if_statement
                store_pcode(pcode, "\n// begin if expression")
            elif elem.tag == 'whileStatement':
                statement = 'while'
                pcode, class_dict, num_args, while_count, if_count, exp_buffer = \
                    compile_statement(pcode=pcode, statement=statement, class_dict=class_dict, num_args=num_args,
                                      while_count=while_count, if_count=if_count, exp_buffer=exp_buffer)
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
        r"..\11\Average\Main.jack",
    ]

    # matched to course compiler
    strict_matches = {
        r"..\11\Seven\Main.vm": 10,  # all
        r"..\11\ConvertToBin\Main.vm": 114,  # all
        # r"..\11\Average\Main.jack": 0,  # wip
    }

    for _filepath in jack_filepaths:
        pcode = main(_filepath)

        # strip debug for result comparison
        with open(_filepath.replace(".jack", "_out.vm"), "w") as f:
            print("Writing: %s\n" % _filepath)
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
        wip = match.replace(".vm", "_out.vm")
        with open(match) as org_file:
            with open(wip) as cur_file:
                for index, (solution, current) in enumerate(zip(org_file, cur_file)):
                    if solution != current:
                        break
                index += 1
                if strict_matches[match] and index < strict_matches[match]:
                    print("%s mismatch after line %s/%s" % (wip, index, strict_matches[match]))
                else:
                    print("%s matches for %s/%s lines captured" % (wip, index, strict_matches[match]))
    # TODO: stringConstant (Average)
