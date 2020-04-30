"""
VM to HACK Assembly Translator
"""
import random
import os

'''
address_labels = {
    "SP": 0,  # segmented by function
    "LCL": 1,  # segmented by function
    "ARG": 2,  # segmented by function
    "THIS": 3,  # segmented by function
    "THAT": 4,  # segmented by function
    "TEMP": 5,  # 5-12 incl (volatile)
    "R13": 13,  # volatile?
    "R14": 14,  # volatile?
    "R15": 15,  # volatile?
    "STATIC": 16,  # 16-255 incl (segmented by source)
    "STACK": 256,  # 256-2047 incl (persistent)
    "HEAP: 2048,  # 2048-16383 incl (persistent)
    "IO": 16384,  # 16384-24576 incl (persistent)
    "UNUSED": 24577,  # 24577-32767 incl
}
'''

comment_count = -1
guids = []
local_dict = {}
static_dict = {}
offset_list = []


def push(cmd, vm_segment, asm_segment, value):
    """
    push a new value onto the stack (either constant or segment+offset)
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # push an arbitrary value onto the stack
    if vm_segment == "constant":
        asm += "@%s\n" % value  # literal
        asm += "D=A\n"  # d = literal
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = literal
        asm += "@SP\n"  # *esp
        asm += "M=M+1\n"  # *esp = *esp++
    else:
        # retrieve a value from segment+offset and push it onto the stack
        if vm_segment == "temp":
            # but also account for the temp mapping
            asm += "@5\n"  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        elif vm_segment == "pointer":
            asm += "@3\n"  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        elif vm_segment == "static":
            pos = static_dict[test_file][0]
            offset = 16 + (offset_list[pos])
            asm += "@%s // static + src segment offset (%s)\n" % (offset, test_file)  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        else:
            # normal segment resolution
            asm += "@%s\n" % asm_segment  # *asm_segment
            asm += "D=M\n"  # d = [asm_segment]

        asm += "@%s\n" % value  # offset
        asm += "A=D+A\n"  # [asm_segment+offset]
        asm += "D=M\n"  # d = [asm_segment+offset]
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = [asm_segment+offset]
        asm += "@SP\n"  # *esp
        asm += "M=M+1\n"  # *esp++

    return asm


def pop(cmd, vm_segment, asm_segment, value):
    """
    pop a value onto the stack into a segment+offset
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # pop a value from the stack and store it in segment+offset
    # (copy from src to dst and dec esp)

    # account for temp mapping vs normal segment resolution
    if vm_segment == "temp":
        asm += "@5\n"  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    elif vm_segment == "pointer":
        asm += "@3\n"  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    elif vm_segment == "static":
        pos = static_dict[test_file][0]
        offset = 16 + (offset_list[pos])
        asm += "@%s // static + src segment offset (%s)\n" % (offset, test_file)  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    else:
        asm += "@%s\n" % asm_segment  # *asm_segment
        asm += "D=M\n"  # d = [asm_segment]

    # retrieve the *dst (segment+offset) and temporarily store it at *esp
    asm += "@%s\n" % value  # offset
    asm += "D=D+A\n"  # d = [asm_segment+offset] // *dst
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

    return asm


def add(cmd):
    """
    pop 2 values from the stack and push the result of their sum
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

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

    return asm


def sub(cmd):
    """
    pop 2 values from the stack and push the result of their difference
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

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

    return asm


def eq(cmd):
    """
    pop 2 values from the stack and push -1 if they are the same or 0 if not
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    guid = generate_guid()
    
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

    return asm


def generate_guid():
    global comment_count
    global static_dict
    global offset_list
    global test_file
    global guids

    # generate a guid
    guid = str(random.random())[2:6]
    guids.append(guid)
    while guid in guids:
        guid = str(random.random())[2:6]
    return guid


def lt(cmd):
    """
    pop 2 values from the stack and push -1 if val1 < val2 or 0 if not
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    guid = generate_guid()

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

    return asm


def gt(cmd):
    """
    pop 2 values from the stack and push -1 if val1 > val2 or 0 if not
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    guid = generate_guid()

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

    return asm


def _and(cmd):
    """
    pop 2 values from the stack, push the AND result
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

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

    return asm


def _or(cmd):
    """
    pop 2 values from the stack, push the OR result
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

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

    return asm


def _not(cmd):
    """
    pop a value from the stack, push the NOT result
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=!M\n"  # [esp] = ![val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm


def neg(cmd):
    """
    pop 2 values from the stack, push the AND result
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2
    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP\n"  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=-M\n"  # [esp] = -[val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm


def label(cmd, src):
    """
    translate labels and adjust debug line count

    label = src.label
    function = src.func.label
    call = src.func.guid

    anything injecting labels needs to dec commen_count
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    if cmd.startswith('label'):
        comment_count -= 2  # normally handled by the calling function

    # normal label resolution
    asm = '\n// (%s) %s\n' % (comment_count, cmd)
    asm_label = cmd.split(" ")[1]

    if cmd.startswith('function'):
        asm += "(%s)\n" % asm_label
    elif cmd.startswith('call'):
        asm += "(%s.%s.%s)\n" % (src, asm_label, generate_guid())
    elif cmd.startswith('label'):
        asm += "(%s.%s)\n" % (src, asm_label)
        comment_count -= 1  # post-adjust for label

    return asm


def goto(cmd, src):
    """
    unconditional jump
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2

    asm_label = cmd.split(" ")[1]
    asm_label = "%s.%s" % (src, asm_label)

    asm = '\n// (%s) %s\n' % (comment_count, cmd)
    asm += "@%s\n" % asm_label
    asm += "0;JMP // unconditional jump\n"

    return asm


def if_goto(cmd, src):
    """
    jump if true
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2

    asm_label = cmd.split(" ")[1]
    asm_label = "%s.%s" % (src, asm_label)

    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@0 // push a zero onto the stack\n"  # literal
    asm += "D=A\n"  # d = literal
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = literal
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    asm += "@SP // *esp // compare val1 (if-goto conditional) with val2 (zero)\n"
    asm += "M=M-1 // *esp-- (*val2)\n"
    asm += "A=M // [val2]\n"
    asm += "D=M // d = [val2]\n"
    asm += "@SP // *esp (*val2)\n"
    asm += "M=M-1 // *esp-- (*val1)\n"
    asm += "A=M // [esp] ([val1])\n"
    asm += "D=M-D // d = [val1] - [val2] // leave esp here (pop equivalent)\n"

    asm += "@%s\n" % asm_label
    asm += "D;JNE // jump if not zero\n"  # true = -1 on VM eval so hopefully this is alright

    return asm


def call(cmd, src):
    """
    save the caller stack frame and initialize the callee ARG/LCL segments
    """
    global comment_count
    global local_dict
    global static_dict
    global offset_list
    global test_file

    comment_count -= 3  # always injects a label first
    prologue_size = 64  # the number of instructions required to realign RIP pointer

    num_args = int(cmd.split(" ")[2])
    func_label = cmd.split(" ")[1]  # function EIP
    asm = label(cmd, src)  # generate function RIP label
    rip_label = asm.strip().split("\n")[-1].split("(")[-1].split(")")[0]

    # stack frame before call = <args>...<SP>
    # stack frame after call = <args>...<RIP><LCL><ARG><THIS><THAT><locals>...<SP>

    if num_args == 0:
        asm += push("push constant 9999 // if no args, create a space on the stack for the return",
                    "constant", "constant", 9999)
        prologue_size += 7  # 7 instructions added by conditional push for return placeholder
        num_args = 1

    asm += "@%s // create the RIP pointer and push it to the stack\n" % rip_label  # *rip
    asm += "D=A\n"  # d = [rip]
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = [rip]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    asm += "@LCL // capture the LCL pointer and push it to the stack\n"  # **lcl
    asm += "D=M\n"  # d = *lcl
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = *lcl
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    asm += "@ARG // capture the ARG pointer and push it to the stack\n"  # *arg
    asm += "D=M\n"  # d = *arg
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = *arg
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    asm += "@THIS // capture the THIS pointer and push it to the stack\n"  # *this
    asm += "D=M\n"  # d = *this
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = *this
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    asm += "@THAT // capture the THAT pointer and push it to the stack\n"  # *that
    asm += "D=M\n"  # d = *that
    asm += "@SP\n"  # *esp
    asm += "A=M\n"  # [esp]
    asm += "M=D\n"  # [esp] = *that
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp = *esp++

    current_function = cmd.split(" ")[1]
    if current_function in local_dict:
        num_locals = local_dict[current_function]
        for i in range(0, num_locals):
            asm += push("push constant 0 // local(%s) init" % i, "constant", "constant", 0)
            prologue_size += 7
    else:
        num_locals = 0

    asm += "@%s // increment RIP (SP-5+num_locals) by prologue_size " \
           "(all the instructions added by call)\n" % (5+num_locals)
    asm += "D=A // d = 5+num_locals\n"
    asm += "@SP // **esp\n"
    asm += "M=M-D // *esp = *esp-(5+num_locals) (*rip)\n"
    asm += "@%s // prologue_size\n" % prologue_size
    asm += "D=A // d = prologue_size\n"
    asm += "@SP // **esp (**rip)\n"
    asm += "A=M // *rip\n"
    asm += "M=M+D // *rip = *rip+prologue_size\n"
    asm += "@%s // 5+num_locals\n" % (5+num_locals)
    asm += "D=A // d = 5+num_locals\n"
    asm += "@SP // **esp\n"
    asm += "M=M+D // *esp = *esp+(5+num_locals)\n"

    asm += "@%s // (5+num_locals) // initialize ARG segment for callee\n" % (5+num_locals)
    asm += "D=A // d = (5+num_locals)\n"
    asm += "@SP // *esp (bottom of stack)\n"
    asm += "D=M-D // d = [esp]-5-num_locals (*RIP) \n"
    asm += "@%s // parse num_args from call <label> <num_args>\n" % num_args
    asm += "D=D-A // d = [esp]-5-[num_args] // (*RIP-num_args = *arg1)\n"
    asm += "@ARG // *ARG\n"
    asm += "M=D // [ARG] = [esp-5-num_args] // [ARG]=*arg1)\n"

    asm += "@%s // (num_locals) // initialize callee LCL (same as SP if none) \n" % num_locals
    asm += "D=A // d = num_locals\n"
    asm += "@SP // (SP currently at bottom of stack frame)\n"
    asm += "D=M-D // d = [SP]-num_locals ([LCL])\n"
    asm += "@LCL // *LCL\n"
    asm += "M=D // [LCL] = *SP-num_locals ([LCL])\n"

    asm += "@%s // *func (parsed from call <label> <num_args>)\n" % func_label
    asm += "0;JMP // jump into EIP (*func)\n"

    return asm


def function(cmd, src):
    """
    define a function label (eip)
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2

    asm = label(cmd, src)
    comment_count -= 1  # post-adjust for label

    return asm


def _return(cmd, src):
    """
    restore caller stack, pop result & jump to RIP
    """
    global comment_count
    global static_dict
    global offset_list
    global test_file

    comment_count -= 2

    # stack frame before return = <args>...<RIP><LCL><ARG><THIS><THAT><locals>...<result><SP>
    # stack frame after return = <result><SP> // ...<RIP><LCL><ARG><THIS><THAT><locals>
    # jump to RIP

    asm = '\n// (%s) %s\n' % (comment_count, cmd)

    asm += pop("pop argument 0 // function return: move result to ARG[0] (soon to be last stack item)",
               "argument", "ARG", 0)

    asm += "@ARG // *ARG[0] // function return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1\n"
    asm += "D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter\n"
    asm += "@SP // *esp // as the intent is to discard everything after result at this point\n"
    asm += "M=D // [esp] = *ARG[0]+1\n"

    asm += "@LCL // *LCL // function return: restore caller stack (THAT)\n"
    asm += "A=M-1 // *LCL-1 (**THAT)\n"
    asm += "D=M // d = [LCL-1] (*THAT)\n"
    asm += "@THAT\n"
    asm += "M=D // [THAT] = [LCL-1] (*THAT)\n"

    asm += "@2 // function return: restore caller stack (THIS)\n"
    asm += "D=A // d=2\n"
    asm += "@LCL // *LCL \n"
    asm += "A=M-D // *LCL-2 (**THIS)\n"
    asm += "D=M // d = [LCL-2] (*THIS)\n"
    asm += "@THIS\n"
    asm += "M=D // [THIS] = [LCL-2] (*THIS)\n"

    asm += "@3 // function return: restore caller stack (ARG)\n"
    asm += "D=A // d=3\n"
    asm += "@LCL // *LCL \n"
    asm += "A=M-D // *LCL-3 (**ARG)\n"
    asm += "D=M // d = [LCL-3] (*ARG)\n"
    asm += "@ARG\n"
    asm += "M=D // [ARG] = [LCL-3] (*ARG)\n"

    asm += "@LCL // *LCL // before restoring LCL, save it at R13\n"
    asm += "D=M // d = [LCL]\n"
    asm += "@R13 // *R13\n"
    asm += "M=D // [R13] = [LCL]\n"

    asm += "@4 // function return: restore caller stack (LCL)\n"
    asm += "D=A // d=4\n"
    asm += "@LCL // *LCL \n"
    asm += "A=M-D // *LCL-4 (**LCL)\n"
    asm += "D=M // d = [LCL-4] (*LCL)\n"
    asm += "@LCL\n"
    asm += "M=D // [LCL] = [LCL-4] (*LCL)\n"

    asm += "@5 // unconditional jump to LCL-5 (RIP)\n"
    asm += "D=A // d=5\n"
    asm += "@R13 // *R13 (old *LCL)\n"
    asm += "A=M-D // *LCL-5 (*LCL)\n"
    asm += "A=M // d = [LCL-5] (*LCL)\n"
    asm += "0;JMP // return (jump to RIP)\n"

    return asm


def parse_asm(test_file, asm=""):
    """
    translate the vm commands into a single asm file
    """
    global comment_count
    global static_dict
    global offset_list

    src = test_file.split('\\')[-1].split('.vm')[0]

    with open(test_file) as vm_file:
        for cmd in vm_file:
            # cleanup test file
            cmd = cmd.strip()
            if cmd.startswith(r'//'):
                continue
            elif cmd == "":
                continue

            # parse command
            parsed_cmd = cmd.split(" ")
            if len(parsed_cmd) >= 3:
                vm_segment = parsed_cmd[1]
                value = parsed_cmd[2]

            # map asm to HACK globals
            if vm_segment == "local":
                asm_segment = "LCL"
            elif vm_segment == "constant":
                asm_segment = value
            elif vm_segment == "this":
                asm_segment = "THIS"
            elif vm_segment == "that":
                asm_segment = "THAT"
            elif vm_segment == "argument":
                asm_segment = "ARG"
            elif vm_segment == "temp":
                asm_segment = "TEMP"

            # print(cmd)

            # parse commands
            if cmd.startswith("push"):
                asm += push(cmd, vm_segment, asm_segment, value)
            elif cmd.startswith("pop"):
                asm += pop(cmd, vm_segment, asm_segment, value)
            elif cmd.startswith("add"):
                asm += add(cmd)
            elif cmd.startswith("sub"):
                asm += sub(cmd)
            elif cmd.startswith("eq"):
                asm += eq(cmd)
            elif cmd.startswith("lt"):
                asm += lt(cmd)
            elif cmd.startswith("gt"):
                asm += gt(cmd)
            elif cmd.startswith("and"):
                asm += _and(cmd)
            elif cmd.startswith("or"):
                asm += _or(cmd)
            elif cmd.startswith("not"):
                asm += _not(cmd)
            elif cmd.startswith("neg"):
                asm += neg(cmd)
            elif cmd.startswith("label"):
                asm += label(cmd, src)
            elif cmd.startswith("goto"):
                asm += goto(cmd, src)
            elif cmd.startswith("if-goto"):
                asm += if_goto(cmd, src)
            elif cmd.startswith("function"):
                asm += function(cmd, src)
            elif cmd.startswith("return"):
                asm += _return(cmd, src)
            elif cmd.startswith("call"):
                asm += call(cmd, src)

    return asm


def parse_static(test_file):
    global comment_count
    global local_dict
    global static_dict
    global offset_list

    with open(test_file) as vm_file:
        for cmd in vm_file:
            # cleanup test file
            cmd = cmd.strip()
            if cmd.startswith(r'//'):
                continue
            elif cmd == "":
                continue

            # parse command
            parsed_cmd = cmd.split(" ")
            if len(parsed_cmd) >= 3:
                vm_segment = parsed_cmd[1]
                try:
                    value = int(parsed_cmd[2])
                except ValueError:
                    print("Warning: Value not parsed: %s" % cmd)

            # update local dictionary
            if cmd.startswith("function"):
                current_function = cmd.split(" ")[1]
            if cmd.startswith("pop local") or cmd.startswith("push local"):
                if current_function in local_dict:
                    if value > local_dict[current_function]:
                        # if new max > max, update max
                        local_dict[current_function] = value
                else:
                    # if first occurrence add to dict
                    local_dict[current_function] = value

            # update static dictionary
            if cmd.startswith("pop static") or cmd.startswith("push static"):
                if test_file in static_dict:
                    if value > static_dict[test_file][1]:
                        # if new max > max, update max
                        static_dict[test_file][1] = value
                else:
                    # if first occurrence add to dict
                    static_dict[test_file] = [len(static_dict), value]

        for func in local_dict:
            local_dict[func] += 1  # inc by 1 as it starts at zero
        if test_file in static_dict:
            static_dict[test_file][1] += 1  # inc by 1 as it starts at zero

def main():
    """
    parse all the vm files/dirs
    """
    global comment_count
    global offset_list
    global static_dict
    global test_file

    test_files = [
        r'ProgramFlow\BasicLoop\BasicLoop.vm',
        r'ProgramFlow\FibonacciSeries\FibonacciSeries.vm',
        r'FunctionCalls\SimpleFunction\SimpleFunction.vm',
    ]

    test_dirs = [
        r'FunctionCalls\FibonacciElement',
        r'FunctionCalls\NestedCall',
        r'FunctionCalls\StaticsTest'
    ]

    # parse the regular tests
    for test_file in test_files:
        comment_count = -1
        print(test_file)
        asm = parse_asm(test_file)
        with open(test_file.replace('.vm', '.asm'), 'w') as asm_file:
            asm_file.write(asm)

    # parse the multi-file tests
    for test_dir in test_dirs:
        comment_count = -1
        asm = ""

        test_files = [
            os.path.join(test_dir, 'sys.vm'),
            os.path.join(test_dir, 'main.vm'),
            os.path.join(test_dir, test_dir.split('\\')[-1]+'.vm'),
            os.path.join(test_dir, 'Class1.vm'),
            os.path.join(test_dir, 'Class2.vm'),
        ]
        
        for test_file in test_files:
            if os.path.exists(test_file):
                parse_static(test_file)

        # initialize offset array
        offset_list = []
        for i in range(0, len(static_dict)):
            offset_list.append(-1)

        # drop the size of each offset into array position
        for i, key in enumerate(static_dict):
            offset_list[i] = static_dict[key][1]

        # add each element to the previous one
        old_value = new_value = 0
        for i in range(0, len(offset_list)):
            old_value = offset_list[i]
            offset_list[i] = new_value
            new_value = old_value + new_value

        for test_file in test_files:
            if os.path.exists(test_file):
                print(test_file)
                asm += parse_asm(test_file)
                
        # write asm_file
        asm_path = os.path.join(test_dir, test_dir.split('\\')[-1]+'.asm')
        with open(asm_path, 'w') as asm_file:
            bootstrap = "@261 // bootstrap: initialize SP as 261\n"  # test scripts do not conform to spec (256) >:|
            bootstrap += "D=A\n"
            bootstrap += "@0\n"
            bootstrap += "M=D\n"
            asm_file.write(bootstrap+asm)


if __name__ == "__main__":
    main()
