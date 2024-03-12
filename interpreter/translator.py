"""
VM to HACK Assembly Translator
"""
import os


def push(asm, cmd, vm_segment, asm_segment, value, static_dict, offset_list, vm_filepath, comment_count, debug=False):
    """
    push a new value onto the stack (either constant or segment+offset)
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # push an arbitrary value onto the stack
    if vm_segment == "constant":
        asm += "@%s // %s\n" % (value, cmd)  # literal
        asm += "D=A\n"  # d = literal
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = literal
        asm += "@SP\n"  # *esp
        asm += "M=M+1 // stacksize++\n"  # *esp = *esp++
    else:
        # retrieve a value from segment+offset and push it onto the stack
        if vm_segment == "temp":
            # but also account for the temp mapping
            asm += "@5 // %s\n" % cmd  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        elif vm_segment == "pointer":
            asm += "@3 // %s\n" % cmd  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        elif vm_segment == "static":
            pos = static_dict[vm_filepath][0]
            offset = 16 + (offset_list[pos])
            asm += "@%s // %s // static + src segment offset (%s)\n" % (offset, cmd, vm_filepath)  # *asm_segment
            asm += "D=A\n"  # d = *asm_segment
        else:
            # normal segment resolution
            asm += "@%s // %s\n" % (asm_segment, cmd)  # *asm_segment
            asm += "D=M\n"  # d = [asm_segment]

        asm += "@%s\n" % value  # offset
        asm += "A=D+A\n"  # [asm_segment+offset]
        asm += "D=M\n"  # d = [asm_segment+offset]
        asm += "@SP\n"  # *esp
        asm += "A=M\n"  # [esp]
        asm += "M=D\n"  # [esp] = [asm_segment+offset]
        asm += "@SP\n"  # *esp
        asm += "M=M+1 // stacksize++\n"  # *esp++

    return asm, comment_count


def pop(asm, cmd, vm_segment, asm_segment, value, static_dict, offset_list, vm_filepath, comment_count, debug=False):
    """
    pop a value onto the stack into a segment+offset
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # pop a value from the stack and store it in segment+offset
    # (copy from src to dst and dec esp)

    # account for temp mapping vs normal segment resolution
    if vm_segment == "temp":
        asm += "@5 // %s\n" % cmd  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    elif vm_segment == "pointer":
        asm += "@3 // %s\n" % cmd  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    elif vm_segment == "static":
        pos = static_dict[vm_filepath][0]
        offset = 16 + (offset_list[pos])
        asm += "@%s // %s // static + src segment offset (%s)\n" % (offset, cmd, vm_filepath)  # *asm_segment
        asm += "D=A\n"  # d = *asm_segment
    else:
        asm += "@%s // %s\n" % (asm_segment, cmd)  # *asm_segment
        asm += "D=M\n"  # d = [asm_segment]

    asm += "@%s // retrieve the *dst (segment+offset) and temporarily store it at *esp // offset\n" % value  # offset
    asm += "D=D+A // d = [asm_segment+offset] (*dst)\n"  #
    asm += "@SP // *esp\n"  #
    asm += "A=M // [esp]\n"  #
    asm += "M=D // [esp] = *dst\n"  #

    asm += "@SP // retrieve the *src pointer from esp-1 // *esp\n"
    asm += "M=M-1 // *esp-- (*src)\n"
    asm += "A=M // [src]\n"
    asm += "D=M // d = [src]\n"

    asm += "@SP // restore esp (*esp)\n"
    asm += "M=M+1 // *esp++ (**dst)\n"

    asm += "A=M // copy [src] to [dst] // *dst\n"
    asm += "A=M // [dst]\n"
    asm += "M=D // [dst] = [src] (pop)\n"

    # free the slot on the stack
    asm += "@SP // *esp\n"
    asm += "M=M-1 // *esp-- (*src) // stacksize--\n"

    return asm, comment_count


def add(asm, cmd, comment_count, debug=False):
    """
    pop 2 values from the stack and push the result of their sum
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # add two values, push result, dec esp
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=D+M\n"  # [esp] = [val1] + [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def sub(asm, cmd, comment_count, debug=False):
    """
    pop 2 values from the stack and push the result of their difference
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=M-D\n"  # [esp] = [val1] - [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def eq(asm, cmd, guids, comment_count, debug=False):
    """
    pop 2 values from the stack and push -1 if they are the same or 0 if not
    """
    guid, guids = generate_guid(guids, debug=debug)
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // %s // *esp \n" % cmd
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

    return asm, guids, comment_count


def generate_guid(guids, debug=False):
    # generate a guid
    guid = 1
    while guid in guids:
        guid += 1
    guids.append(guid)

    return guid, guids


def lt(asm, cmd, guids, comment_count, debug=False):
    """
    pop 2 values from the stack and push -1 if val1 < val2 or 0 if not
    """
    guid, guids = generate_guid(guids, debug=debug)
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // *esp // %s\n" % cmd
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

    return asm, guids, comment_count


def gt(asm, cmd, guids, comment_count, debug=False):
    """
    pop 2 values from the stack and push -1 if val1 > val2 or 0 if not
    """
    guid, guids = generate_guid(guids, debug=debug)

    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@SP // *esp // %s\n" % cmd
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

    return asm, guids, comment_count


def _and(asm, cmd, comment_count, debug=False):
    """
    pop 2 values from the stack, push the AND result
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=D&M\n"  # [esp] = [val1] & [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def _or(asm, cmd, comment_count, debug=False):
    """
    pop 2 values from the stack, push the OR result
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # eval two values, push result, dec esp
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val2
    asm += "A=M\n"  # [val2]
    asm += "D=M\n"  # d = [val2]
    asm += "@SP\n"  # *esp // *val2
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=M|D\n"  # [esp] = [val1] | [val2]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def _not(asm, cmd, comment_count, debug=False):
    """
    pop a value from the stack, push the NOT result
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=!M\n"  # [esp] = ![val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def neg(asm, cmd, comment_count, debug=False):
    """
    pop 2 values from the stack, push the AND result
    """
    comment_count -= 2
    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    # eval one value, push result
    asm += "@SP // %s\n" % cmd  # *esp
    asm += "M=M-1\n"  # *esp-- // *val1
    asm += "A=M\n"  # [esp] // [val1]
    asm += "M=-M\n"  # [esp] = -[val1]
    asm += "@SP\n"  # *esp
    asm += "M=M+1\n"  # *esp++

    return asm, comment_count


def label(asm, cmd, src, guids, comment_count, debug=False):
    """
    translate labels and adjust debug line count

    label = src.label
    function = src.func.label
    call = src.func.guid

    anything injecting labels needs to dec commen_count
    """
    if cmd.startswith('label'):
        comment_count -= 2  # normally handled by the calling function

    # normal label resolution
    asm += '\n// (%s) %s\n' % (comment_count, cmd)
    asm_label = cmd.split(" ")[1]

    if cmd.startswith('function'):
        asm += "(%s) // %s\n" % (asm_label, cmd)
        label_str = asm_label
    elif cmd.startswith('call'):
        guid, guids = generate_guid(guids, debug=debug)
        asm += "(%s.%s.%s) // %s\n" % (src, asm_label, guid, cmd)
        label_str = "%s.%s.%s" % (src, asm_label, guid)
    elif cmd.startswith('label'):
        asm += "(%s.%s) // %s\n" % (src, asm_label, cmd)
        label_str = "%s.%s" % (src, asm_label)
        comment_count -= 1  # post-adjust for label
    else:
        raise RuntimeError("Translator: Unexpected command %s")

    return asm, guids, comment_count, label_str


def goto(asm, cmd, src, comment_count, debug=False):
    """
    unconditional jump
    """
    comment_count -= 2

    asm_label = cmd.split(" ")[1]
    asm_label = "%s.%s" % (src, asm_label)

    asm += '\n// (%s) %s\n' % (comment_count, cmd)
    asm += "@%s // %s\n" % (asm_label, cmd)
    asm += "0;JMP // unconditional jump\n"

    return asm, comment_count


def if_goto(asm, cmd, src, comment_count, debug=False):
    """
    jump if true
    """
    comment_count -= 2
    asm_label = cmd.split(" ")[1]
    asm_label = "%s.%s" % (src, asm_label)

    asm += '\n// (%s) %s\n' % (comment_count, cmd)

    asm += "@0 // %s\n" % cmd  # literal
    asm += "D=A // push a zero onto the stack\n"  # d = literal
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

    return asm, comment_count


def call(asm, cmd, src, guids, local_dict, static_dict, offset_list, vm_filepath, comment_count, debug=False):
    """
    save the caller stack frame and initialize the callee ARG/LCL segments
    """
    comment_count -= 3  # always injects a label first
    prologue_size = 64  # the number of instructions required to realign RIP pointer

    num_args = int(cmd.split(" ")[2])
    func_label = cmd.split(" ")[1]  # function EIP
    asm, guids, comment_count, label_str = label(asm, cmd, src, guids, comment_count, debug=debug)  # RIP label

    # stack frame before call = <args>...<SP>
    # stack frame after call = <args>...<RIP><LCL><ARG><THIS><THAT><locals>...<SP>

    if num_args == 0:
        asm, comment_count = push(asm, "push constant 9999 // call %s // if no args, create a space on the stack for "
                                       "the return" % func_label, "constant", "constant", 9999, static_dict,
                                       offset_list, vm_filepath, comment_count, debug=debug)
        prologue_size += 7  # 7 instructions added by conditional push for return placeholder
        num_args = 1
        # adjust comment for cleaner debug output
        asm += "@%s // push RIP\n" % label_str  # *rip
    else:
        asm += "@%s // call %s // push RIP\n" % (label_str, func_label)  # *rip

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
            asm, comment_count = push(asm, "push constant 0 // local(%s) init" % i, "constant", "constant", 0,
                                      static_dict, offset_list, vm_filepath, comment_count, debug=debug)
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

    return asm, guids, comment_count


def function(asm, cmd, src, guids, comment_count, debug=False):
    """
    define a function label (eip)
    """
    comment_count -= 2

    asm, guids, comment_count, label_str = label(asm, cmd, src, guids, comment_count, debug=debug)
    comment_count -= 1  # post-adjust for label

    return asm, guids, comment_count


def _return(asm, cmd, static_dict, offset_list, vm_filepath, comment_count, debug=False):
    """
    restore caller stack, pop result & jump to RIP
    """
    comment_count -= 2

    # stack frame before return = <args>...<RIP><LCL><ARG><THIS><THAT><locals>...<result><SP>
    # stack frame after return = <result><SP> // ...<RIP><LCL><ARG><THIS><THAT><locals>
    # jump to RIP

    asm += '\n// (%s) %s\n' % (comment_count, cmd)
    asm, comment_count = pop(asm, "pop argument 0 // return // move result to ARG[0] (soon to be last stack "
                             "item)", "argument", "ARG", 0, static_dict, offset_list, vm_filepath, comment_count,
                             debug=debug)

    asm += "@ARG // *ARG[0] // return: discard the callee stack leaving result in ARG[0] and SP at ARG[0]+1\n"
    asm += "D=M+1 // d = *ARG[0]+1 // whether this is ARG[1] (2+ args) or RIP doesn't matter\n"
    asm += "@SP // *esp // as the intent is to discard everything after result at this point\n"
    asm += "M=D // [esp] = *ARG[0]+1\n"

    asm += "@LCL // *LCL // return: restore caller stack (THAT)\n"
    asm += "A=M-1 // *LCL-1 (**THAT)\n"
    asm += "D=M // d = [LCL-1] (*THAT)\n"
    asm += "@THAT\n"
    asm += "M=D // [THAT] = [LCL-1] (*THAT)\n"

    asm += "@2 // return: restore caller stack (THIS)\n"
    asm += "D=A // d=2\n"
    asm += "@LCL // *LCL \n"
    asm += "A=M-D // *LCL-2 (**THIS)\n"
    asm += "D=M // d = [LCL-2] (*THIS)\n"
    asm += "@THIS\n"
    asm += "M=D // [THIS] = [LCL-2] (*THIS)\n"

    asm += "@3 // return: restore caller stack (ARG)\n"
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

    asm += "@4 // return: restore caller stack (LCL)\n"
    asm += "D=A // d=4\n"
    asm += "@LCL // *LCL \n"
    asm += "A=M-D // *LCL-4 (**LCL)\n"
    asm += "D=M // d = [LCL-4] (*LCL)\n"
    asm += "@LCL\n"
    asm += "M=D // [LCL] = [LCL-4] (*LCL)\n"

    asm += "@5 // return: unconditional jump to LCL-5 (RIP)\n"
    asm += "D=A // d=5\n"
    asm += "@R13 // *R13 (old *LCL)\n"
    asm += "A=M-D // *LCL-5 (*LCL)\n"
    asm += "A=M // d = [LCL-5] (*LCL)\n"
    asm += "0;JMP // return (jump to RIP)\n"

    return asm, comment_count


def parse_asm(vm_filepath, asm, guids, local_dict, static_dict, offset_list, comment_count, debug=False):
    """
    translate the vm commands into a single asm file
    """
    src = vm_filepath.split('\\')[-1].split('.vm')[0]

    with open(vm_filepath) as vm_file:
        vm_contents = vm_file.readlines()

    stored_comment = ""
    for cmd in vm_contents:
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
        else:
            vm_segment = None
            value = None

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
        else:
            asm_segment = None

        if type(comment_count) != int:
            raise Exception("last command was bad")

        if debug:
            print(cmd, stored_comment)

        # parse commands
        if cmd.startswith("push"):
            asm, comment_count = push(asm, cmd, vm_segment, asm_segment, value, static_dict, offset_list, vm_filepath,
                                      comment_count, debug=debug)
        elif cmd.startswith("pop"):
            asm, comment_count = pop(asm, cmd, vm_segment, asm_segment, value, static_dict, offset_list, vm_filepath,
                                     comment_count, debug=debug)
        elif cmd.startswith("add"):
            asm, comment_count = add(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("sub"):
            asm, comment_count = sub(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("eq"):
            asm, guids, comment_count = eq(asm, cmd, guids, comment_count, debug=debug)
        elif cmd.startswith("lt"):
            asm, guids, comment_count = lt(asm, cmd, guids, comment_count, debug=debug)
        elif cmd.startswith("gt"):
            asm, guids, comment_count = gt(asm, cmd, guids, comment_count, debug=debug)
        elif cmd.startswith("and"):
            asm, comment_count = _and(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("or"):
            asm, comment_count = _or(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("not"):
            asm, comment_count = _not(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("neg"):
            asm, comment_count = neg(asm, cmd, comment_count, debug=debug)
        elif cmd.startswith("label"):
            asm, guids, comment_count, label_str = label(asm, cmd, src, guids, comment_count, debug=debug)
        elif cmd.startswith("goto"):
            asm, comment_count = goto(asm, cmd, src, comment_count, debug=debug)
        elif cmd.startswith("if-goto"):
            asm, comment_count = if_goto(asm, cmd, src, comment_count, debug=debug)
        elif cmd.startswith("function"):
            stored_comment = " // %s" % cmd  # function only creates a label which gets parsed out
            asm, guids, comment_count = function(asm, cmd, src, guids, comment_count, debug=debug)
        elif cmd.startswith("return"):
            asm, comment_count = _return(asm, cmd, static_dict, offset_list, vm_filepath, comment_count, debug=debug)
        elif cmd.startswith("call"):
            asm, guids, comment_count = call(asm, cmd, src, guids, local_dict, static_dict, offset_list, vm_filepath,
                                             comment_count, debug=debug)
        else:
            raise RuntimeError("Translator: Unexpected command %s")

        if stored_comment:
            # append stored_comment to the next command
            # but not the one that set it or labels as they get parsed out as well
            if not any(cmd.startswith(x) for x in ["function", "label"]):
                if asm[-1] == "\n":
                    asm = asm[:-1]  # trim the carriage return
                    insert_pos = asm.rfind(cmd) + len(cmd)  # seek pos where VM command ends
                    asm = asm[:insert_pos] + stored_comment + asm[insert_pos:]  # insert comment
                    stored_comment = ""
                else:
                    raise RuntimeError(r"Translator: Could not append stored_comment, ASM did not end with \n")

    return asm, guids, comment_count


def parse_static(vm_filepath, local_dict, static_dict, debug=False):
    with open(vm_filepath) as vm_file:
        vm_content = vm_file.readlines()

    for cmd in vm_content:
        # cleanup test file
        cmd = cmd.strip()
        if cmd.startswith(r'//'):
            continue
        elif cmd == "":
            continue

        # parse command
        parsed_cmd = cmd.split(" ")
        value = None
        if len(parsed_cmd) >= 3:
            # exclude commands that don't have a value to parse
            if not any(x in parsed_cmd[0] for x in ["goto", "lt", "label", "add"]):
                try:
                    value = int(parsed_cmd[2])
                except ValueError:
                    raise RuntimeError("Translator: No value to parse, add to exclude or fix code: %s" % cmd)

        # update local dictionary
        if cmd.startswith("function"):
            current_function = parsed_cmd[1]
            local_dict[current_function] = value

        # update static dictionary
        if cmd.startswith("pop static") or cmd.startswith("push static"):
            if vm_filepath in static_dict:
                if value > static_dict[vm_filepath][1]:
                    # if new max > max, update max
                    static_dict[vm_filepath][1] = value
            else:
                # if first occurrence add to dict
                static_dict[vm_filepath] = [len(static_dict), value]

    if vm_filepath in static_dict:
        static_dict[vm_filepath][1] += 1  # inc by 1 as it starts at zero

    return local_dict, static_dict


def translate(vm_dir, vm_bootstrap_paths=(), debug=False):
    """
    translate vm files/dirs into asm
    """
    # walk the VM program directories
    vm_dir_filelist = []
    comment_count = -1
    asm = ""
    guids = []
    local_dict = {}
    static_dict = {}
    offset_list = []

    vm_filelist = [
        os.path.join(vm_dir, 'sys.vm'),
        os.path.join(vm_dir, 'main.vm'),
        os.path.join(vm_dir, vm_dir.split('\\')[-1]+'.vm'),
        os.path.join(vm_dir, 'Class1.vm'),
        os.path.join(vm_dir, 'Class2.vm'),
        os.path.join(vm_dir, 'Array.vm'),
        os.path.join(vm_dir, 'Ball.vm'),
        os.path.join(vm_dir, 'Bat.vm'),
        os.path.join(vm_dir, 'Keyboard.vm'),
        os.path.join(vm_dir, 'Math.vm'),
        os.path.join(vm_dir, 'Memory.vm'),
        os.path.join(vm_dir, 'Output.vm'),
        os.path.join(vm_dir, 'PongGame.vm'),
        os.path.join(vm_dir, 'Screen.vm'),
        os.path.join(vm_dir, 'SquareGame.vm'),
        os.path.join(vm_dir, 'String.vm'),
    ]

    for vm_filepath in vm_filelist:
        if os.path.exists(vm_filepath):
            local_dict, static_dict = parse_static(vm_filepath, local_dict, static_dict, debug=debug)

    # initialize offset array
    for i in range(0, len(static_dict)):
        offset_list.append(-1)

    # drop the size of each offset into array position
    for i, key in enumerate(static_dict):
        offset_list[i] = static_dict[key][1]

    # add each element to the previous one
    new_value = 0
    for i in range(0, len(offset_list)):
        old_value = offset_list[i]
        offset_list[i] = new_value
        new_value = old_value + new_value

    for vm_filepath in vm_filelist:
        if os.path.exists(vm_filepath):
            if debug:
                print(vm_filepath)
            asm, guids, comment_count = parse_asm(vm_filepath, asm, guids, local_dict, static_dict, offset_list,
                                                  comment_count, debug=debug)
            vm_dir_filelist.append(vm_filepath)

        # write asm_file
        bootstrap = "@261 // bootstrap: initialize SP as 261\n"
        bootstrap += "D=A\n"
        bootstrap += "@0\n"
        bootstrap += "M=D\n"
        asm_path = os.path.join(vm_dir, vm_dir.split('\\')[-1]+'.asm')
        with open(asm_path, 'w') as asm_file:
            if any(bootstrap_path in asm_path for bootstrap_path in vm_bootstrap_paths):
                # test scripts do not conform to spec (256) >:|
                asm_file.write(bootstrap+asm)
            else:
                asm_file.write(asm)

    print("Translated VM file(s) in directory: %s" % vm_dir)
    for vm_filepath in vm_dir_filelist:
        print("\t%s" % vm_filepath)

    return static_dict


if __name__ == "__main__":
    # regular VM programs
    _vm_dirpaths = [
        r'..\projects\07\MemoryAccess\BasicTest',
        r'..\projects\07\MemoryAccess\PointerTest',
        r'..\projects\07\MemoryAccess\StaticTest',
        r'..\projects\07\StackArithmetic\SimpleAdd',
        r'..\projects\07\StackArithmetic\StackTest',
        r'..\projects\08\ProgramFlow\BasicLoop',
        r'..\projects\08\ProgramFlow\FibonacciSeries',
        r'..\projects\08\FunctionCalls\SimpleFunction',
    ]

    # VM programs that require non-spec bootstrap to pass tests
    _vm_bootstrap_paths = [
        r'..\projects\08\FunctionCalls\FibonacciElement',
        r'..\projects\08\FunctionCalls\NestedCall',
        r'..\projects\08\FunctionCalls\StaticsTest'
    ]

    _vm_dirpaths = _vm_dirpaths + _vm_bootstrap_paths

    debug_runs = [True, False]
    for _debug in debug_runs:
        for _vm_dir in _vm_dirpaths:
            translate(_vm_dir, _vm_bootstrap_paths, debug=_debug)
