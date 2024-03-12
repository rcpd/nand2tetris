"""
VM to HACK Assembly Translator
"""
import random

'''
address_labels = {
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
    "TEMP": 5,  # 5-12 incl
    "R13": 13,
    "R14": 14,
    "R15": 15,
    "STATIC": 16,  # 16-255 incl
    "STACK": 256,  # 256-2047 incl
}

prologue = "// *SP=0, SP=5, SP[0]=20, SP++, SP[1]=30, SP++\n"
prologue += "@5\n"
prologue += "D=A\n"
prologue += "@0\n"
prologue += "M=D\n"
prologue += "@20\n"
prologue += "D=A\n"
prologue += "@5\n"
prologue += "M=D\n"
prologue += "@0\n"
prologue += "M=M+1\n"
prologue += "@30\n"
prologue += "D=A\n"
prologue += "@6\n"
prologue += "M=D\n"
prologue += "@0\n"
prologue += "M=M+1\n"
prologue += "// *LCL=1, LCL=10\n"
prologue += "@10\n"
prologue += "D=A\n"
prologue += "@1\n"
prologue += "M=D\n"
prologue += "// new code (ROM-20)\n"
'''

prologue = ""
comment_count = 0
guids = []

def push(cmd, segment, label, value, test_file):
    """
    push a new value onto the stack (either constant or segment+offset)
    """
    global comment_count
    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # push an arbitrary value onto the stack
    if segment == "constant":
        asm += "@%s\n" % value  # literal
        asm += "D=A\n"  # d = literal
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = literal
        asm += "@SP\n"  # *esp
        asm += "M=M+1\n"  # *esp = *esp++
    else:
        # retrieve a value from label+offset and push it onto the stack
        if segment == "temp":
            # but also account for the temp mapping
            asm += "@5\n"  # *label
            asm += "D=A\n"  # d = *label
        elif segment == "pointer":
            asm += "@3\n"  # *label
            asm += "D=A\n"  # d = *label
        elif segment == "static":
            asm += "@16\n"  # *label
            asm += "D=A\n"  # d = *label
        else:
            # normal label resolution
            asm += "@%s\n" % label  # *label
            asm += "D=M\n"  # d = [label]

        asm += "@%s\n" % value  # offset
        asm += "A=D+A\n"  # [label+offset]
        asm += "D=M\n"  # d = [label+offset]
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = [label+offset]
        asm += "@SP\n"  # *esp
        asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue+asm)


def pop(cmd, segment, label, value, test_file):
    """
    pop a value onto the stack into a segment+offset
    """
    global comment_count
    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # pop a value from the stack and store it in segment+offset
    # (copy from src to dst and dec esp)

    # account for temp mapping vs normal label resolution
    if segment == "temp":
        asm += "@5\n"  # *label
        asm += "D=A\n"  # d = *label
    elif segment == "pointer":
        asm += "@3\n"  # *label
        asm += "D=A\n"  # d = *label
    elif segment == "static":
        asm += "@16\n"  # *label
        asm += "D=A\n"  # d = *label
    else:
        asm += "@%s\n" % label  # *label
        asm += "D=M\n"  # d = [label]

    # retrieve the *dst (label+offset) and temporarily store it at *esp
    asm += "@%s\n" % value  # offset
    asm += "D=D+A\n"  # d = [label+offset] // *dst
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = *dst

    # retrieve the *src pointer from esp-1
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *src
    asm += "A=M\n"  # [src]
    asm += "D=M\n"  # d = [src]

    # restore esp
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++ // **dst

    # copy [src] to [dst]
    asm += "A=M\n"  # *dst
    asm += "A=M\n"  # [dst]
    asm += "M=D\n"  # [dst] = [src]

    # free the slot on the stack
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *src

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue+asm)


def add(cmd, test_file):
    """
    pop 2 values from the stack and push the result of their sum
    """

    global comment_count
    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # add two values, push result, dec esp
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=D+M\n"  # [esp] = [val1] + [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue+asm)


def sub(cmd, test_file):
    """
    pop 2 values from the stack and push the result of their difference
    """
    global comment_count
    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=M-D\n"  # [esp] = [val1] - [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def eq(cmd, test_file):
    """
    pop 2 values from the stack and push -1 if they are the same or 0 if not
    """
    global comment_count
    global guids
    
    # generate a guid
    guid = str(random.random())[2:6]
    guids.append(guid)
    while guid in guids:
        guid = str(random.random())[2:6]
    
    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // *esp\n"
    asm += "M=M-1 // *esp-- (*val2)\n"
    asm += "A=M // [val2]\n"
    asm += "D=M // d = [val2]\n"
    asm += "@SP // *esp (*val2)\n"
    asm += "M=M-1 // *esp-- (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "D=M-D // d = [val1] - [val2]\n"

    asm += "@EQ_TRUE_%s\n" % guid
    asm += "D;JEQ\n"
    comment_count -= 1
    asm += "(EQ_FALSE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A // d = false\n"
    asm += "@EQ_END_%s\n" % guid
    asm += "0;JMP\n"

    comment_count -= 1
    asm += "(EQ_TRUE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A\n"
    asm += "D=D-1 // d = -1 (true)\n"

    comment_count -= 1
    asm += "(EQ_END_%s)\n" % guid
    asm += "@SP // *esp (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "M=D // [esp] = eq result\n"

    asm += "@SP // *esp\n"
    asm += "M=M+1 // *esp++\n"

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def lt(cmd, test_file):
    """
    pop 2 values from the stack and push -1 if val1 < val2 or 0 if not
    """
    global comment_count
    global guids

    # generate a guid
    guid = str(random.random())[2:6]
    guids.append(guid)
    while guid in guids:
        guid = str(random.random())[2:6]

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // *esp\n"
    asm += "M=M-1 // *esp-- (*val2)\n"
    asm += "A=M // [val2]\n"
    asm += "D=M // d = [val2]\n"
    asm += "@SP // *esp (*val2)\n"
    asm += "M=M-1 // *esp-- (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "D=M-D // d = [val1] - [val2]\n"

    asm += "@JLT_TRUE_%s\n" % guid
    asm += "D;JLT\n"
    comment_count -= 1
    asm += "(JLT_FALSE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A // d = false\n"
    asm += "@JLT_END_%s\n" % guid
    asm += "0;JMP\n"

    comment_count -= 1
    asm += "(JLT_TRUE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A\n"
    asm += "D=D-1 // d = -1 (true)\n"

    comment_count -= 1
    asm += "(JLT_END_%s)\n" % guid
    asm += "@SP // *esp (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "M=D // [esp] = eq result\n"

    asm += "@SP // *esp\n"
    asm += "M=M+1 // *esp++\n"

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def gt(cmd, test_file):
    """
    pop 2 values from the stack and push -1 if val1 > val2 or 0 if not
    """
    global comment_count
    global guids

    # generate a guid
    guid = str(random.random())[2:6]
    guids.append(guid)
    while guid in guids:
        guid = str(random.random())[2:6]

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // *esp\n"
    asm += "M=M-1 // *esp-- (*val2)\n"
    asm += "A=M // [val2]\n"
    asm += "D=M // d = [val2]\n"
    asm += "@SP // *esp (*val2)\n"
    asm += "M=M-1 // *esp-- (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "D=M-D // d = [val1] - [val2]\n"

    asm += "@JGT_TRUE_%s\n" % guid
    asm += "D;JGT\n"
    comment_count -= 1
    asm += "(JGT_FALSE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A // d = false\n"
    asm += "@JGT_END_%s\n" % guid
    asm += "0;JMP\n"

    comment_count -= 1
    asm += "(JGT_TRUE_%s)\n" % guid
    asm += "@0\n"
    asm += "D=A\n"
    asm += "D=D-1 // d = -1 (true)\n"

    comment_count -= 1
    asm += "(JGT_END_%s)\n" % guid
    asm += "@SP // *esp (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "M=D // [esp] = eq result\n"

    asm += "@SP // *esp\n"
    asm += "M=M+1 // *esp++\n"

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def _and(cmd, test_file):
    """
    pop 2 values from the stack, push the AND result
    """
    global comment_count
    global guids

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=M&D\n"  # [esp] = [val1] & [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def _or(cmd, test_file):
    """
    pop 2 values from the stack, push the OR result
    """
    global comment_count
    global guids

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=M|D\n"  # [esp] = [val1] | [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def _not(cmd, test_file):
    """
    pop a value from the stack, push the NOT result
    """
    global comment_count
    global guids

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=!M\n"  # [esp] = ![val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def neg(cmd, test_file):
    """
    pop 2 values from the stack, push the AND result
    """
    global comment_count
    global guids

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=-M\n"  # [esp] = -[val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    # print(asm+'\n'.replace("@SP","@0").replace("@LCL","@1"))  # debug only
    with open(r'%s.asm' % test_file, 'a') as asm_file:
        asm_file.write(prologue + asm)


def main():
    global comment_count

    test_files = [
        r'MemoryAccess\BasicTest\BasicTest',
        r'MemoryAccess\PointerTest\PointerTest',
        r'MemoryAccess\StaticTest\StaticTest',
        r'StackArithmetic\SimpleAdd\SimpleAdd',
        r'StackArithmetic\StackTest\StackTest'
    ]
    
    for test_file in test_files:
        comment_count = -1
        # initialize
        with open(r'%s.asm' % test_file, 'w') as asm_file:
            asm_file.write("")
    
        with open(r'%s.vm' % test_file) as vm_file:
            for cmd in vm_file:
                # cleanup test file
                cmd = cmd.strip()
                if cmd.startswith(r'//'):
                    continue
                elif cmd == "":
                    continue
    
                # if cmd.startswith("push") or cmd.startswith("pop"):
                # parse command
                parsed_cmd = cmd.split(" ")
                if len(parsed_cmd) == 3:
                    segment = parsed_cmd[1]
                    value = parsed_cmd[2]
    
                # map asm to HACK globals
                if segment == "local":
                    label = "LCL"
                elif segment == "constant":
                    label = value
                elif segment == "this":
                    label = "THIS"
                elif segment == "that":
                    label = "THAT"
                elif segment == "argument":
                    label = "ARG"
                elif segment == "temp":
                    label = "TEMP"
    
                print(cmd)
    
                # check commands
                if cmd.startswith("push"):
                    push(cmd, segment, label, value, test_file)
                elif cmd.startswith("pop"):
                    pop(cmd, segment, label, value, test_file)
                elif cmd == "add":
                    add(cmd, test_file)
                elif cmd == "sub":
                    sub(cmd, test_file)
                elif cmd == "eq":
                    eq(cmd, test_file)
                elif cmd == "lt":
                    lt(cmd, test_file)
                elif cmd == "gt":
                    gt(cmd, test_file)
                elif cmd == "and":
                    _and(cmd, test_file)
                elif cmd == "or":
                    _or(cmd, test_file)
                elif cmd == "not":
                    _not(cmd, test_file)
                elif cmd == "neg":
                    neg(cmd, test_file)


if __name__ == "__main__":
    main()





