"""
Compile a JACK program into a VM program (pcode) from the token stream initially generated
by tokenizer/analyzer.
"""

import os
import xml.etree.ElementTree as Et

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

types = ['int', 'boolean', 'char', 'void']
objects = ['Math', 'Memory', 'String', 'Array', 'Output', 'Screen', 'Keyboard', 'Sys']
kinds = ['class', 'constructor', 'method', 'function', 'static', 'field', 'var']

debug = False


def find_parent(tree, node):
    """
    Draw a map of the tree and yield the parent from node
    """
    parent_map = {child: parent for parent in tree.iter() for child in parent}
    return parent_map[node]


def store_pcode(pcode, cmd):
    """
    optionally dynamically print the pcode with additional debug information, store for later file output
    """
    global debug

    if debug:
        # TODO: for performance reasons this should not be persistent not called every time
        count = 0
        for p in pcode:
            if not p.startswith("//"):
                count += 1

        if not cmd.strip().startswith("//"):
            count += 1
            print("PCODE(%s): %s" % (count, cmd.strip()))
        else:
            print("PCODE(%s): %s" % (len(str(count))*"-", cmd.strip()))

    # overwrite at end if successful
    # don't append empty debug "write" calls
    pcode.append(cmd.strip()+"\n")

    return pcode


def compile_class(pcode, class_name, class_dict):
    """
    update the class_dict during pre-scan, emit pcode when declaration encountered
    """
    if not class_name:
        raise RuntimeError("illegal class name: '%s'" % class_name)

    # define class_name and initialize symbol table
    if class_name not in class_dict:
        class_dict[class_name] = {"args": {}, "index_dict": {}}
    else:
        # don't emit pcode on pre-scan
        pcode = store_pcode(pcode, "// class %s" % class_name)

    return pcode, class_dict


def compile_function(pcode, func_name, func_type, func_kind, class_dict, class_name):
    """
    update the class_dict during pre-scan, emit pcode when declaration encountered
    """
    if not func_name:
        raise RuntimeError("illegal function name: '%s'" % func_name)
    if func_name == class_name:
        raise RuntimeError("illegal function name: '%s'" % func_name)
    if not func_type:
        raise RuntimeError("illegal function type: '%s'" % func_type)
    if not func_kind:
        raise RuntimeError("illegal function kind: '%s'" % func_kind)
    if func_kind not in ("function", "method", "constructor"):
        raise RuntimeError("illegal function kind: '%s'" % func_kind)

    # define function symbol
    prescan = False
    if func_kind == 'constructor':
        func_type = class_name
    if func_name not in class_dict[class_name]:
        class_dict[class_name][func_name] = {"kind": func_kind, "type": func_type,
                                             "args": {}, "index_dict": {}, "label_dict": {}}
        prescan = True

    if func_kind == "method":
        # assign space for the implicit "this" argument for class methods
        class_dict[class_name][func_name]["index_dict"]["argument"] = 0
        class_dict[class_name][func_name]["args"]["this"] = \
            {"kind": "argument", "type": class_name, "index": 0}

    # don't emit pcode on pre-scan
    if not prescan:
        # num_vars = locals i.e. the space required on stack frame
        # num_members = field i.e. how much space required on heap for alloc call
        num_vars = num_members = 0
        if "local" in class_dict[class_name][func_name]["index_dict"]:
            num_vars = class_dict[class_name][func_name]["index_dict"]["local"] + 1

        for arg in class_dict[class_name]['args']:
            if class_dict[class_name]['args'][arg]['kind'] == 'field':
                num_members += 1

        pcode = store_pcode(pcode, "\nfunction %s.%s %s // %s" % (class_name, func_name, num_vars, func_kind))

        if func_kind == "constructor":
            # allocate space on heap
            pcode = store_pcode(pcode, "push constant %s" % num_members)
            # non-void return (no pop)
            pcode = store_pcode(pcode, "call Memory.alloc 1 // allocate object + params on heap")
            pcode = store_pcode(pcode, "pop pointer 0 // *this = &<heap>")

        elif func_kind == "method":
            # move pointer to current object (implicit "this" argument)
            pcode = store_pcode(pcode, "\npush argument 0 // &this")
            pcode = store_pcode(pcode, "pop pointer 0 // *this =")

        elif func_kind == 'function':
            pass

        else:
            raise RuntimeError("Unexpected function kind '%s'")

    return pcode, class_dict


# TODO: mandatory kwargs are not clearly identifiable
def compile_statement(pcode=None, statement=None, class_dict=None, class_name=None, func_name=None, call_class=None,
                      call_func=None, var_type=None, var_name=None, num_args=0, exp_buffer=[], var_scope=None,
                      if_count=0, while_count=0, lhs_array=False, var_kind=None, prescan=False):
    """
    provides a common interface to the statement compilers
    must passthrough at least statement + return args + inner call args i.e.
    compile_statement(pcode=pcode, statement=statement, class_dict=class_dict, num_args=num_args,
                      while_count=while_count, if_count=if_count, exp_buffer=exp_buffer)
    """

    if statement == "do":
        pass

    elif statement == "let":
        exp_buffer, class_dict, lhs_array = \
            compile_assignment(class_dict=class_dict, class_name=class_name, func_name=func_name, var_name=var_name,
                               exp_buffer=exp_buffer, lhs_array=lhs_array, var_scope=var_scope)

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

    elif statement == "class_var":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                           func_name=func_name, var_kind=var_kind, var_type=var_type, var_name=var_name,
                                           prescan=prescan)

    elif statement == "param":
        # update class/func dict
        pcode, class_dict = compile_vardec(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                           func_name=func_name, var_kind='argument', var_type=var_type,
                                           var_name=var_name, prescan=prescan)

    else:
        raise RuntimeError("Unexpected statement type '%s'" % statement)

    return pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array


def compile_assignment(class_dict, class_name, func_name, var_name, exp_buffer, lhs_array, var_scope):
    """
    compile the assignment component of a statement
    store pcode in exp_buffer so its emitted when expression is closed
    """
    if var_scope not in ('local', 'member'):
        raise RuntimeError("Unexpected scope '%s'" % var_scope)

    if not lhs_array:
        # typical assignment
        if var_scope == 'local':
            exp_buffer.append("pop %s %s // %s =" % (class_dict[class_name][func_name]['args'][var_name]['kind'],
                                                     class_dict[class_name][func_name]['args'][var_name]['index'],
                                                     var_name))
        elif var_scope == 'member':
            if class_dict[class_name]['args'][var_name]['kind'] == 'static':
                exp_buffer.append("pop static %s // %s =" % (class_dict[class_name]['args'][var_name]['index'],
                                                             var_name))

            elif class_dict[class_name]['args'][var_name]['kind'] == 'field':
                exp_buffer.append("pop this %s // %s =" % (class_dict[class_name]['args'][var_name]['index'],
                                                           var_name))
            else:
                raise RuntimeError("unexpected kind: '%s'" % class_dict[class_name]['args'][var_name]['kind'])

    else:
        # assignment to an array var (constructor or overwriting the pointer)
        # this is speculative and will be reversed if next symbol is [
        # (i.e. assignment was intended for array content not array itself)
        exp_buffer.append("pop %s %s // %s = (*array var)"
                          % (class_dict[class_name][func_name]['args'][var_name]['kind'],
                             class_dict[class_name][func_name]['args'][var_name]['index'], var_name))

    if var_scope == 'local':
        class_dict[class_name][func_name]['args'][var_name]['initialized'] = True
    elif var_scope == 'member':
        class_dict[class_name]['args'][var_name]['initialized'] = True

    return exp_buffer, class_dict, lhs_array


def compile_vardec(pcode, class_dict, class_name, func_name, var_kind, var_type, var_name, prescan=False):
    """
    add var to the class dict, print a comment in pcode
    """
    if not var_name:
        raise RuntimeError("illegal var name: '%s'" % var_name)
    if not var_type:
        raise RuntimeError("illegal var type: '%s'" % var_type)
    if not var_kind:
        raise RuntimeError("illegal var kind: '%s'" % var_kind)

    # don't emit pcode during pre-scan
    # class fields / statics
    if var_kind in ('field', 'static'):
        if var_name not in class_dict[class_name]['args']:
            if var_kind not in class_dict[class_name]['index_dict']:
                index = 0
            else:
                index = class_dict[class_name]['index_dict'][var_kind] + 1

            class_dict[class_name]['args'][var_name] = {'kind': var_kind, 'type': var_type, 'index': index,
                                                        'initialized': False}
            class_dict[class_name]['index_dict'][var_kind] = index
        # else: already processed

    # function locals
    elif func_name and var_name not in class_dict[class_name][func_name]['args']:
        if var_kind not in class_dict[class_name][func_name]['index_dict']:
            index = 0
        else:
            index = class_dict[class_name][func_name]['index_dict'][var_kind] + 1

        class_dict[class_name][func_name]['args'][var_name] = {'kind': var_kind, 'type': var_type, 'index': index,
                                                               'initialized': False}
        class_dict[class_name][func_name]['index_dict'][var_kind] = index

    # debug info only
    elif not prescan:
        if not var_type:
            raise RuntimeError("unexpected var_type '%s' (%s.%s.%s)" % (var_type, class_name, func_name, var_name))
        if var_type == var_name:
            raise RuntimeError("unexpected var_name '%s' (%s.%s.%s)" % (var_type, class_name, func_name, var_name))

        if var_kind == 'local':
            pcode = store_pcode(pcode, "// var %s %s (%s %s)" %
                                (var_type, var_name,  var_kind,
                                 class_dict[class_name][func_name]['args'][var_name]['index']))

        elif var_kind == 'argument':
            pcode = store_pcode(pcode, "// param %s %s (%s %s)" %
                                (var_type, var_name, var_kind,
                                 class_dict[class_name][func_name]['args'][var_name]['index']))

        elif var_kind in ('field', 'static'):
            pcode = store_pcode(pcode, "// %s %s %s (%s %s)" %
                                (var_kind, var_type, var_name, var_kind,
                                 class_dict[class_name]['args'][var_name]['index']))

        elif var_kind is not None:
            raise RuntimeError("unexpected var_kind '%s'" % var_kind)

    return pcode, class_dict


def compile_constant(pcode, constant, exp_buffer=None):
    """
    emit pcode when constant encountered
    """
    if not constant:
        raise RuntimeError("illegal constant: '%s'" % constant)

    if type(exp_buffer) is list:
        exp_buffer.append("push constant %s" % constant)
        return exp_buffer

    else:
        pcode = store_pcode(pcode, "\npush constant %s" % constant)
        return pcode


# TODO: remove num_params, num_args
def compile_call(pcode, call_class, call_func, num_args, statement, class_name, exp_buffer=None, class_dict=None,
                 qualified=False):
    """
    emit pcode when call encountered, discard return on do call
    """
    if not call_class:
        raise RuntimeError("illegal class: '%s'" % call_class)
    if not call_func:
        raise RuntimeError("illegal callee: '%s'" % call_func)

    # count arguments
    num_args = 0
    if call_class in sys_func:
        num_args = sys_func[call_class][call_func]['len']

    elif call_class in class_dict:
        for arg in class_dict[call_class][call_func]['args']:
            if class_dict[call_class][call_func]['args'][arg]['kind'] == 'argument':
                num_args += 1

        if class_dict[call_class][call_func]['type'] == 'method':
            num_args += 1  # this

    if type(exp_buffer) is list:
        if statement == 'do' and not exp_buffer:
            # except when call is part of expression
            exp_buffer.append("pop temp 0 // discard return on do call")

        if qualified:
            exp_buffer.append("call %s.%s %s // qualified" % (call_class, call_func, num_args))
        else:
            exp_buffer.append("call %s.%s %s // unqualified" % (call_class, call_func, num_args))

        return exp_buffer

    else:
        raise NotImplementedError


def compile_return(pcode, class_dict, class_name, func_name):
    """
    emit pcode when return encountered
    return expression will compile without extra handling
    """

    if class_dict[class_name][func_name]["type"] == "void":
        pcode = store_pcode(pcode, "push constant 0 // void return")
    pcode = store_pcode(pcode, "\nreturn")
    return pcode


def compile_literal(pcode, code, exp_buffer=None):
    """
    emit pcode when literal encountered
    """
    if not code:
        raise RuntimeError("illegal literal: '%s'" % code)

    if type(exp_buffer) is list:
        exp_buffer.append(code)
        return exp_buffer
    else:
        pcode = store_pcode(pcode, "\n%s" % code)
        return pcode


def compile_boolean(pcode, value, exp_buffer=None):
    """
    store pcode in exp_buffer so its emitted when expression is closed
    """
    if value not in ('true', 'false'):
        raise RuntimeError("illegal boolean value '%s'" % value)

    if type(exp_buffer) is list:
        if value == "true":
            # this is in reverse due to how exp_buffer is unpacked
            exp_buffer.append("not // true (2/2)")
            exp_buffer.append("push constant 0 // true (1/2)")
        elif value == "false":
            exp_buffer.append("push constant 0 // false")
        return exp_buffer

    else:
        if value == "true":
            pcode = store_pcode(pcode, "\npush constant 0 // true (1/2)")
            pcode = store_pcode(pcode, "\nnot // true (2/2)")
        elif value == "false":
            pcode = store_pcode(pcode, "\npush constant 0 // false")
        return pcode


def compile_while(pcode, while_count):
    """
    emit pcode when while encountered
    """
    pcode = store_pcode(pcode, "\nlabel WHILE_EXP%s // begin while expression" % while_count)
    return pcode, while_count


def compile_var(pcode, class_dict, class_name, func_name, var_name, var_scope, exp_buffer=None, array=False):
    """
    emit pcode when while encountered
    """
    if var_scope not in ('local', 'member'):
        raise RuntimeError("Unexpected scope '%s'" % var_scope)

    if var_scope == 'local':
        if not class_dict[class_name][func_name]['args'][var_name]['type']:
            raise RuntimeError("illegal type '%s'" % class_dict[class_name][func_name]['args'][var_name]['type'])
        if not class_dict[class_name][func_name]['args'][var_name]['kind']:
            raise RuntimeError("illegal kind '%s'" % class_dict[class_name][func_name]['args'][var_name]['kind'])

    elif var_scope == 'member':
        if not class_dict[class_name]['args'][var_name]['type']:
            raise RuntimeError("illegal type '%s'" % class_dict[class_name]['args'][var_name]['type'])
        if not class_dict[class_name]['args'][var_name]['kind']:
            raise RuntimeError("illegal kind '%s'" % class_dict[class_name]['args'][var_name]['kind'])

    if type(exp_buffer) is list:
        if var_scope == 'local':
            exp_buffer.append("push %s %s // %s" %
                              (class_dict[class_name][func_name]['args'][var_name]['kind'],
                               class_dict[class_name][func_name]['args'][var_name]['index'], var_name))
            if array:
                exp_buffer[-1] = exp_buffer[-1] + " (*array var)"
                
            return exp_buffer

        elif var_scope == 'member':
            if class_dict[class_name]['args'][var_name]['kind'] == 'static':
                exp_buffer.append("push static %s // %s" %
                                  (class_dict[class_name]['args'][var_name]['index'], var_name))

            elif class_dict[class_name]['args'][var_name]['kind'] == 'field':
                exp_buffer.append("push this %s // %s" %
                                  (class_dict[class_name]['args'][var_name]['index'], var_name))
            else:
                raise RuntimeError("unexpected kind: '%s'" % class_dict[class_name]['args'][var_name]['kind'])

            if array:
                exp_buffer[-1] = exp_buffer[-1] + " (*array var)"
                
            return exp_buffer

    else:
        if var_scope == 'local':
            pcode = store_pcode(pcode, "\npush %s %s // %s" %
                                (class_dict[class_name][func_name]['args'][var_name]['kind'],
                                 class_dict[class_name][func_name]['args'][var_name]['index'], var_name))
            if array:
                pcode[-1].append(" (*array var)")
                
            return pcode

        elif var_scope == 'member':
            if class_dict[class_name]['args'][var_name]['kind'] == 'static':
                pcode = store_pcode(pcode, "\npush static %s // %s" %
                                    (class_dict[class_name]['args'][var_name]['index'], var_name))

            elif class_dict[class_name]['args'][var_name]['kind'] == 'field':
                pcode = store_pcode(pcode, "\npush this %s // %s" %
                                    (class_dict[class_name]['args'][var_name]['index'], var_name))
            else:
                raise RuntimeError("unexpected kind: '%s'" % class_dict[class_name]['args'][var_name]['kind'])

            if array:
                pcode[-1].append(" (*array var)")
            
            return pcode


def compile_string(pcode, string):
    pcode = store_pcode(pcode, "push constant %s // strlen" % len(string))
    pcode = store_pcode(pcode, "call String.new 1 // \"%s\"" % string)
    for c, char in enumerate(string):
        pcode = compile_char(pcode, char)
        pcode = store_pcode(pcode, "call String.appendChar 2")
    return pcode


def compile_char(pcode, char):
    global char_map
    pcode = store_pcode(pcode, "push constant %s // '%s' (char)" % (char_map[char], char))
    return pcode


def expression_handler(pcode, statement, exp_buffer, class_dict=None, identifier=None, class_name=None, func_name=None,
                       parent_obj=None, child_func=None, symbol=None, keyword=None):
    """
    expressions call the buffered version of compile functions so they are parsed first in, last out
    expressions are found in let (rhs), array indexes, if/while conditions and optionally as return values
    """
    num_params = 0

    if symbol:
        if symbol in ("(", "["):
            pcode = store_pcode(pcode, "// %s" % symbol)

            # on unqualified class method call inject implicit this param before others
            if exp_buffer and exp_buffer[-1].startswith("call") and exp_buffer[-1].endswith("// unqualified"):
                call_class, call_func = exp_buffer[-1].split()[1].split('.')

                if call_class in sys_func:
                    if sys_func[call_class][call_func]['kind'] == 'method':
                        store_pcode(pcode, "push pointer 0 // this")

                elif call_class in class_dict:
                    if class_dict[call_class][call_func]['kind'] == 'method':
                        store_pcode(pcode, "push pointer 0 // this")
                else:
                    raise RuntimeError("class not found: '%s'" % call_class)

            exp_buffer.append("// %s" % symbol)  # inject expression marker into buffer

        elif symbol == ")":
            # process everything up to & including the last expression opening from buffer
            pcode, exp_buffer = pop_buffer(pcode, exp_buffer, stop_at="// (", pop_incl=True)
            pcode = store_pcode(pcode, "// %s" % symbol)

            # pop the call only when all expressions following it exhausted
            if exp_buffer and exp_buffer[-1].startswith("call"):
                pcode = store_pcode(pcode, exp_buffer.pop())

        elif symbol == "]":
            # process everything up to & including the last expression opening from buffer
            pcode, exp_buffer = pop_buffer(pcode, exp_buffer, stop_at="// [", pop_incl=True)
            pcode = store_pcode(pcode, "// %s" % symbol)
            pcode = store_pcode(pcode, exp_buffer.pop())  # pop the array var as well

        elif symbol == ",":
            # process everything up to but not including the last expression opening from buffer
            pcode, exp_buffer = pop_buffer(pcode, exp_buffer, stop_at="// (")  # i.e. expression was not bracketed

    elif identifier:
        # identify array var
        array = False
        if func_name and identifier in class_dict[class_name][func_name]['args']:
            if class_dict[class_name][func_name]['args'][identifier]['type'] == 'Array':
                array = True
        elif identifier in class_dict[class_name]['args']:
            if class_dict[class_name]['args'][identifier]['type'] == 'Array':
                array = True

        # attempt to lookup class/func attributes (2 passes)
        if not array and not parent_obj:
            if identifier in sys_func or identifier in class_dict:
                parent_obj = identifier

            elif func_name and identifier in class_dict[class_name][func_name]['args']:
                if class_dict[class_name][func_name]['args'][identifier]['type'] in objects:
                    parent_obj = class_dict[class_name][func_name]['args'][identifier]['type']

            elif identifier in class_dict[class_name]['args']:
                if class_dict[class_name]['args'][identifier]['type'] in objects:
                    parent_obj = class_dict[class_name]['args'][identifier]['type']

        elif not array and parent_obj and not child_func:
            if parent_obj in sys_func:
                if identifier in sys_func[parent_obj]:
                    child_func = identifier
            else:
                if identifier in class_dict[parent_obj]:
                    child_func = identifier

        # if parent/child pair found assume call & compile
        if not array and parent_obj and child_func:
            exp_buffer = compile_call(pcode, parent_obj, child_func, num_params, statement, class_name=class_name,
                                      exp_buffer=exp_buffer, class_dict=class_dict, qualified=True)
            parent_obj = child_func = ''

        # compile unqualified function call
        elif not array and identifier in class_dict[class_name]:
            exp_buffer = compile_call(pcode, class_name, identifier, num_params, statement, class_name=class_name,
                                      exp_buffer=exp_buffer, class_dict=class_dict, qualified=False)
            parent_obj = child_func = ''

        # compile as regular var (local)
        elif identifier in class_dict[class_name][func_name]['args']:
            if array:
                # if var is array compile to buffer
                exp_buffer = compile_var(pcode, class_dict, class_name, func_name, identifier, 'local',
                                         exp_buffer=exp_buffer, array=array)
            else:
                # otherwise if var found compile directly (not buffer)
                pcode = compile_var(pcode, class_dict, class_name, func_name, identifier, 'local')

        # compile as regular var (member)
        elif identifier in class_dict[class_name]['args']:
            if array:
                # if var is array compile to buffer
                exp_buffer = compile_var(pcode, class_dict, class_name, func_name, identifier, 'member',
                                         exp_buffer=exp_buffer, array=array)
            else:
                # otherwise if var found compile directly (not buffer)
                pcode = compile_var(pcode, class_dict, class_name, func_name, identifier, 'member')

        else:
            if identifier != parent_obj:  # ignore first instance of parent_obj (first pass)
                raise RuntimeError("unexpected identifier: %s" % identifier)

    elif keyword == 'this':
        pcode = store_pcode(pcode, "push pointer 0 // this")

    elif keyword == 'null':
        pcode = store_pcode(pcode, "push constant 0 // null")

    return pcode, exp_buffer, parent_obj, child_func


def pop_buffer(pcode, exp_buffer, stop_at=None, pop_incl=False):
    """
    selectively or entirely process the expression buffer
    """
    if stop_at and exp_buffer:
        if stop_at not in exp_buffer:
            raise RuntimeError("stop_value '%s' was not found in exp_buffer")

        while exp_buffer[-1] != stop_at:
            pcode = store_pcode(pcode, exp_buffer.pop())

        if pop_incl:
            exp_buffer.pop()  # already printed
    else:
        while exp_buffer:
            store_pcode(pcode, exp_buffer.pop())
    return pcode, exp_buffer


def main(filepath, file_list):
    """
    main engine:
        - parse the AST
        - prescan the AST for class/function declarations
        - tag metadata as tokens are parsed
        -- tag scope is defined by tree depth, some need to be carried forward, others cleared on depth change
        - call compile functions once enough information is parsed
    """
    global debug
    pcode = []
    class_dict = {}

    # persist through loop scope
    # pre-process tree for class/function/var decs (all related files)
    for pre_file in file_list:
        class_name = statement = func_name = func_kind = keyword = var_type = func_type = ''

        print("Pre-scan: %s" % pre_file)
        tree = Et.parse(pre_file.replace(".jack", "_out.xml"))

        for elem in tree.iter():
            elem.tag = (elem.tag or '')
            elem.text = (elem.text or '')[1:-1]  # strip outermost padding

            # skip rootnode
            if elem.tag == 'class':
                continue

            if elem:  # has children
                keyword = var_type = func_type = ''  # reset tag context on depth change

            if elem.tag == 'keyword':
                if not keyword:
                    keyword = elem.text  # preserved for later
                elif not var_type:
                    var_type = elem.text  # preserved for later

                # set on first instance
                if elem.text in ('function', 'method', 'constructor'):
                    func_kind = elem.text

                # multiple token scope
                if keyword in ('function', 'method', 'constructor'):
                    if not func_type:
                        # type could be keyword or identifier
                        if var_type and (var_type in types or var_type in objects):
                            func_type = var_type
                            continue
                        # else: type wasn't a keyword

            elif elem.tag == 'identifier':
                identifier = elem.text

                if keyword == 'class':
                    class_name = identifier  # preserved for later
                    pcode, class_dict = compile_class(pcode, class_name, class_dict)

                elif keyword in ('function', 'method', 'constructor'):
                    # type could be keyword or identifier
                    if not func_type:
                        if identifier in types or identifier in objects:
                            func_type = identifier
                            continue
                        else:
                            raise RuntimeError("unexpected type '%s'" % identifier)

                    elif identifier not in types and identifier not in objects:
                        func_name = identifier
                        pcode, class_dict = compile_function(pcode, func_name, func_type, func_kind, class_dict,
                                                             class_name)
                    else:
                        raise RuntimeError("illegal identifier '%s'" % identifier)

                elif statement in ('var', 'param', 'class_var'):
                    # external or built-in types
                    if identifier in types or identifier in objects:
                        var_type = identifier
                        continue  # process on next loop

                    # param in function declaration
                    elif keyword in types or keyword in objects:
                        var_type = keyword

                    # local var passed as param
                    elif func_name and (identifier in class_dict[class_name][func_name]['args']
                                        or identifier in class_dict[class_name]['args']):
                        continue  # already processed

                    if not var_type:
                        raise RuntimeError()

                    # no if_count, while_count, exp_buffer during pre_scan
                    if keyword in ('field', 'static'):
                        pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_type=var_type,
                                              var_name=identifier, var_kind=keyword, prescan=True)
                    else:
                        pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_type=var_type,
                                              var_name=identifier, prescan=True)

            elif elem.tag == 'classVarDec':
                statement = 'class_var'
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
    if_list = []
    while_list = []
    end_block = False
    num_args = while_count = if_count = 0
    class_name = statement = func_name = func_type = keyword = var_type = var_kind = identifier = ''
    lhs_var_name = lhs_array = parent_obj = child_func = func_kind = ''

    # walk AST
    print("Parsing AST: %s" % filepath)
    if debug:
        print()  # formatting

    tree = Et.parse(filepath.replace(".jack", "_out.xml"))
    for elem in tree.iter():
        elem.tag = (elem.tag or '')
        elem.text = (elem.text or '')[1:-1]  # strip outermost padding

        # skip rootnode
        if elem.tag == 'class':
            continue

        if lhs_array:
            if not elem.text == '[':
                lhs_array = None  # None signifies lhs_array was true but now compiled/consumed

        # if stand-alone var array buffered in a non-assignment statement process it now
        # TODO: this is probably a bit fragile
        if statement != 'let' and elem.text != '[' and exp_buffer and exp_buffer[-1].endswith("(*array var)"):
            pcode = store_pcode(pcode, exp_buffer.pop())

        if end_block:
            if block:
                # TODO: compile_end_block
                # if-without-else
                if elem.tag not in ('keyword', 'term') and elem.text != 'else' and block[-1] == 'if':
                    pcode = store_pcode(pcode, "\nlabel IF_FALSE%s // end if_block" % (if_list[-1]))
                    pcode = store_pcode(pcode, "// popping '%s' from block" % block.pop())
                    pcode = store_pcode(pcode, "// popping '%s' from if_list" % if_list.pop())

                # other statement blocks
                elif block[-1] == 'else':
                    pcode = store_pcode(pcode, "\nlabel IF_END%s // end if_block" % (if_list[-1]))
                    pcode = store_pcode(pcode, "// popping '%s' from block" % block.pop())
                    pcode = store_pcode(pcode, "// popping '%s' from if_list" % if_list.pop())

                elif block[-1] == 'if':
                    pcode = store_pcode(pcode, "\ngoto IF_END%s // end if_true_block" % (if_list[-1]))
                    pcode = store_pcode(pcode, "// popping '%s' from block" % block.pop())

                elif block[-1] == 'while':
                    pcode = store_pcode(pcode, "\ngoto WHILE_EXP%s // loop to start of while_block" %
                                        (while_list[-1]))
                    pcode = store_pcode(pcode, "\nlabel WHILE_END%s // end while_block" % (while_list[-1]))
                    pcode = store_pcode(pcode, "// popping '%s' from block" % block.pop())
                    pcode = store_pcode(pcode, "// popping '%s' from while_list" % while_list.pop())

                else:
                    raise RuntimeError("unexpected block '%s'" % block[-1])

            end_block = False

        # has children
        if elem:
            # reset select tag contexts on depth change
            keyword = var_type = var_kind = identifier = ''

        # set keyword flag (single depth)
        if elem.tag == 'keyword':
            if elem.text in ('true', 'false'):
                exp_buffer = compile_boolean(pcode, elem.text, exp_buffer)
                continue

            elif elem.text in ('this', 'null'):
                pcode, exp_buffer, parent_obj, child_func = \
                    expression_handler(pcode, statement, exp_buffer, parent_obj=parent_obj, child_func=child_func,
                                       keyword=elem.text)
                continue

            elif elem.text == 'if':
                statement = 'if'  # TODO: missing some ifStatement(s) in AST

            elif elem.text == 'let':
                statement = 'let'

            elif elem.text == 'return':  # TODO: return has classVarDec as parent in PongGame.moveBall ?
                statement = 'return'

            # set on first instance only
            if elem.text in ('function', 'method', 'constructor'):
                func_kind = elem.text
                while_count = if_count = 0
                if while_list or if_list:
                    raise RuntimeError("while (%s) or if (%s) list was not empty" % (while_list, if_list))

            if not keyword:
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
                elif keyword in ('function', 'constructor', 'method'):
                    if identifier in objects or identifier in types:
                        continue  # identifier was object type not function name
                    else:
                        func_name = identifier  # sometimes needs to overwrite the previous function

                    if not func_type:
                        if keyword == 'constructor':
                            func_type = class_name
                        else:
                            func_type = class_dict[class_name][func_name]['type']

                    pcode, class_dict = compile_function(pcode, func_name, func_type, func_kind, class_dict,
                                                         class_name)

                # var declaration (local or function parameter)
                elif statement in ('var', 'param', 'class_var'):
                    # catch param case where type is only keyword (not a vardec so not in pre-scan)
                    if not var_type:
                        if func_name and identifier in class_dict[class_name][func_name]['args']:
                            var_type = class_dict[class_name][func_name]['args'][identifier]['type']
                            var_kind = class_dict[class_name][func_name]['args'][identifier]['kind']

                        elif identifier in class_dict[class_name]['args']:
                            var_type = class_dict[class_name]['args'][identifier]['type']
                            var_kind = class_dict[class_name]['args'][identifier]['kind']
                        # else: probably an object type and not a var (caught below)

                    if not var_type:
                        # built-in or external types
                        if identifier in types or identifier in objects:
                            var_type = identifier
                            continue  # process on next loop
                        else:
                            raise RuntimeError("No type found for '%s'" % identifier)

                    if keyword in ('field', 'static'):
                        pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_type=var_type,
                                              var_name=identifier, while_count=while_count, if_count=if_count,
                                              var_kind=keyword)
                    else:
                        if not var_kind and var_type in kinds:
                            var_kind = var_type

                        pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_type=var_type,
                                              var_name=identifier, while_count=while_count, if_count=if_count,
                                              var_kind=var_kind)

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
                        # preserved for later
                        lhs_var_name = identifier
                        if lhs_var_name in class_dict[class_name][func_name]['args']:
                            var_scope = 'local'
                            if class_dict[class_name][func_name]['args'][lhs_var_name]['type'] == 'Array':
                                # None signifies lhs_array was true but already compiled/consumed
                                if lhs_array is not None:
                                    lhs_array = True

                        elif lhs_var_name in class_dict[class_name]['args']:
                            var_scope = 'member'
                            if class_dict[class_name]['args'][lhs_var_name]['type'] == 'Array':
                                # None signifies lhs_array was true but already compiled/consumed
                                if lhs_array is not None:
                                    lhs_array = True
                        else:
                            raise RuntimeError("var not found: %s" % lhs_var_name)

                        pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                            compile_statement(pcode=pcode, statement=statement, class_dict=class_dict,
                                              class_name=class_name, func_name=func_name, var_name=identifier,
                                              exp_buffer=exp_buffer, while_count=while_count, if_count=if_count,
                                              lhs_array=lhs_array, var_scope=var_scope)
                    else:
                        pcode, exp_buffer, parent_obj, child_func = \
                            expression_handler(pcode, statement, exp_buffer, class_dict=class_dict,
                                               identifier=identifier, class_name=class_name, func_name=func_name,
                                               parent_obj=parent_obj, child_func=child_func)

                # buffer while/if expressions
                elif statement in ('while', 'if', 'return'):
                    pcode, exp_buffer, parent_obj, child_func = \
                        expression_handler(pcode, statement, exp_buffer, class_dict=class_dict,
                                           identifier=identifier, class_name=class_name, func_name=func_name,
                                           parent_obj=parent_obj, child_func=child_func)
                else:
                    raise RuntimeError("unexpected keyword/statement '%s'/'%s' for identifier '%s'" %
                                       (keyword, statement, elem.text))
            else:
                raise RuntimeError("no keyword or statement defined for '%s'" % elem.text)

        elif elem.tag == 'symbol':
            # TODO: compile_symbol
            symbol = elem.text.strip()

            if symbol in ".":
                pass
            elif symbol == "=" and statement == 'let':
                pass  # ignore first '=' in let statement (expressions will have different parent)
            elif symbol == "{":
                if exp_buffer:
                    raise RuntimeError("unparsed expressions still in buffer: %s" % exp_buffer)

                # TODO: compile_start_block
                elif keyword == 'else':  # no explicit statement type for else
                    block.append(keyword)
                    # close the latest if_true block but don't dec/pop until IF_END
                    pcode = store_pcode(pcode, "\nlabel IF_FALSE%s // begin if_false_block" % (if_list[-1]))

                elif statement == 'if':
                    block.append(statement)
                    if_list.append(if_count)
                    pcode = store_pcode(pcode, "\nif-goto IF_TRUE%s // end if expression / if_true_jump" % if_count)
                    pcode = store_pcode(pcode, "\ngoto IF_FALSE%s // if_false_jump" % if_count)
                    pcode = store_pcode(pcode, "\nlabel IF_TRUE%s // begin if_true_block" % if_count)
                    if_count += 1

                elif statement == 'while':
                    block.append(statement)
                    while_list.append(while_count)
                    pcode = store_pcode(pcode, "\nnot // end while expression / while_jump (1/2)")
                    pcode = store_pcode(pcode, "\nif-goto WHILE_END%s // while_jump (2/2) [break loop if not]" %
                                        while_count)
                    while_count += 1

                elif statement == 'param':
                    pass

                elif keyword not in ('class', 'function') and not if_list:
                    raise RuntimeError("unexpected '{' (statement '%s', keyword '%s')" % (statement, keyword))

            elif symbol == "}":
                end_block = True  # compilation triggered on next token due to if-no-else case

            elif symbol == "[":
                if lhs_array:
                    # array[index] (content) assignment
                    exp_buffer.pop()  # remove the previous entry which assumed assignment to array var
                    exp_buffer.append("pop that 0 // **array[index] = result")
                    exp_buffer.append("push temp 0 // restore result")
                    exp_buffer.append("pop pointer 1 // that = *array[index]")
                    exp_buffer.append("pop temp 0 // save result (rhs/call/expression)")
                    exp_buffer.append("push %s %s // %s (*array var)" %
                                      (class_dict[class_name][func_name]['args'][identifier]['kind'],
                                       class_dict[class_name][func_name]['args'][identifier]['index'], identifier))
                    lhs_array = None  # None signifies lhs_array was true but now compiled/consumed

                # mark the start of a new expression
                pcode, exp_buffer, parent_obj, child_func = \
                    expression_handler(pcode, statement, exp_buffer, class_dict=class_dict, identifier=identifier,
                                       class_name=class_name, func_name=func_name, symbol=symbol)

            elif symbol == "]":
                # pop the last buffered expression (including the brackets)
                pcode, exp_buffer, parent_obj, child_func = \
                    expression_handler(pcode, statement, exp_buffer, class_dict=class_dict, identifier=identifier,
                                       class_name=class_name, func_name=func_name, symbol=symbol)

                pcode = store_pcode(pcode, "add // *array var + [index]")

                # if part of an expression deref the array[index] immediately
                if not lhs_array and not find_parent(tree, elem).tag == "letStatement":
                    pcode = store_pcode(pcode, "pop pointer 1 // *that =")
                    pcode = store_pcode(pcode, "push that 0 // **that (array[index])")

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
                pcode, exp_buffer = pop_buffer(pcode, exp_buffer)  # empty the buffer

                if statement == 'return':
                    pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                        compile_statement(pcode=pcode, class_dict=class_dict, class_name=class_name,
                                          func_name=func_name, statement=statement, while_count=while_count,
                                          if_count=if_count)

                if exp_buffer:
                    raise RuntimeError("unparsed expressions still in buffer: %s" % exp_buffer)

                statement = lhs_var_name = lhs_array = ''

            elif symbol in op_map:
                if symbol == "-" and find_parent(tree, elem).tag == "term":
                    exp_buffer.append("neg")  # not "sub"
                else:
                    exp_buffer.append(op_map[symbol])

            else:
                raise RuntimeError("unexpected symbol '%s'" % elem.text)

        elif elem.tag == 'integerConstant':
            pcode = compile_constant(pcode, elem.text)

        elif elem.tag == 'stringConstant':
            pcode = compile_string(pcode, elem.text)

        elif elem.tag == 'ifStatement':
            statement = 'if'
            pcode = store_pcode(pcode, "\n// begin if expression")
        elif elem.tag == 'whileStatement':
            statement = 'while'
            pcode, class_dict, num_args, while_count, if_count, exp_buffer, lhs_array = \
                compile_statement(pcode=pcode, statement=statement, class_dict=class_dict, num_args=num_args,
                                  while_count=while_count, if_count=if_count, exp_buffer=exp_buffer,
                                  class_name=class_name)
        elif elem.tag == 'varDec':
            statement = 'var'
        elif elem.tag == 'classVarDec':
            statement = 'class_var'
        elif elem.tag == 'parameterList':
            statement = 'param'
        elif elem.tag == 'doStatement':
            statement = 'do'
        elif elem.tag == 'letStatement':
            statement = 'let'
        elif elem.tag == 'returnStatement':
            statement = 'return'
        elif elem.tag == 'expressionList':
            pass

        # ignore the tags only used for grouping
        elif elem.tag in ('subroutineDec', 'subroutineBody', 'statements', 'expression', 'term'):
            pass

        else:
            raise RuntimeError("unparsed tag '%s'" % elem.tag)

    return pcode


def _compile(jack_filepaths, strict_matches):
    """
    loop across multiple files:
        - update the object list
        - call the main engine
        - write pcode to output file
        - where possible, enforce match to course compiled programs
    """
    global debug

    for file_list in jack_filepaths:
        # check external modules at runtime
        for _filepath in file_list:
            if os.path.basename(_filepath).replace(".jack", "") not in objects:
                objects.append(os.path.basename(_filepath).replace(".jack", ""))

        for _filepath in file_list:
            pcode = main(_filepath, file_list)

            # strip debug for result comparison
            with open(_filepath.replace(".jack", "_out.vm"), "w") as f:
                if debug:
                    print()  # formatting

                print("Compiling: %s" % _filepath.replace(".jack", "_out.vm"))
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
                    raise RuntimeError("%s mismatch after line %s/%s" % (wip, index, strict_matches[match]))

    if debug:
        print("\nAll compilation results match solution!")


if __name__ == '__main__':
    jack_filepaths = [
        # TODO: projects 1-11 accounted for, included in interpreter/tokenizer/analyzer
        [r"..\projects\09\Average\Main.jack"],
        [r"..\projects\09\Fraction\Main.jack",
         r"..\projects\09\Fraction\Fraction.jack"],
        [r"..\projects\09\HelloWorld\Main.jack"],
        [r"..\projects\09\List\Main.jack",
         r"..\projects\09\List\List.jack"],
        [r"..\projects\09\Square\Main.jack",
         r"..\projects\09\Square\Square.jack",
         r"..\projects\09\Square\SquareGame.jack"],
        [r"..\projects\10\ArrayTest\Main.jack"],
        # [r"..\projects\10\ExpressionLessSquare\Main.jack",  # nonsense code that shouldn't compile or run
        #  r"..\projects\10\ExpressionLessSquare\Square.jack",
        #  r"..\projects\10\ExpressionLessSquare\SquareGame.jack"],
        [r"..\projects\10\Square\Main.jack",
         r"..\projects\10\Square\Square.jack",
         r"..\projects\10\Square\SquareGame.jack"],
        [r"..\projects\11\Average\Main.jack"],
        [r"..\projects\11\ComplexArrays\Main.jack"],
        [r"..\projects\11\ConvertToBin\Main.jack"],
        [r"..\projects\11\Pong\Ball.jack",
         r"..\projects\11\Pong\Bat.jack",
         r"..\projects\11\Pong\Main.jack",
         r"..\projects\11\Pong\PongGame.jack"],
        [r"..\projects\11\Seven\Main.jack"],
        [r"..\projects\11\Square\Main.jack",
         r"..\projects\11\Square\Square.jack",
         r"..\projects\11\Square\SquareGame.jack"],
    ]

    # matched to course compiler
    strict_matches = {
        # all
        r"..\projects\09\Average\Main.vm": 149,
        r"..\projects\11\Seven\Main.vm": 10,
        r"..\projects\11\ConvertToBin\Main.vm": 109,
        r"..\projects\09\Fraction\Main.vm": 18,
        r"..\projects\09\Fraction\Fraction.vm": 116,
        r"..\projects\09\HelloWorld\Main.vm": 33,
        r"..\projects\09\List\Main.vm": 19,
        r"..\projects\09\List\List.vm": 65,
        r"..\projects\09\Square\Main.vm": 11,
        r"..\projects\09\Square\Square.vm": 304,
        r"..\projects\09\Square\SquareGame.vm": 179,
        r"..\projects\10\ArrayTest\Main.vm": 183,
        r"..\projects\11\Pong\Bat.vm": 207,
        r"..\projects\11\Pong\Ball.vm": 444,
        r"..\projects\11\Pong\Main.vm": 13,
        r"..\projects\11\Pong\PongGame.vm": 318,
        r"..\projects\11\ComplexArrays\Main.vm": 702,
    }

    debug = True  # default True if run from main, otherwise False if called externally
    _compile(jack_filepaths, strict_matches)
