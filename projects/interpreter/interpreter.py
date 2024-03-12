
import assembler

def run(input_file, debug=False):
    global hw
    # TODO: (week 6) all files parsed
    # TODO: (week 7-8) asm parsed
    # TODO: (week 7-8) integrate VM translator >> parse the tst/out/cmp scripts
    # TODO: (future) write a HDL module for interpreter?

    # initialize hardware
    ram = [0] * 32768
    hw = {
        "RAM": ram,
        "ROM": {},
        "A": 100,
        "D": 200,
        "M": 300,
        "PC": 0,
    }

    if debug:
        print('\n%s: Running' % input_file)
    address_labels = {
        # alternate notation
        "R0": 0,  # SP
        "R1": 1,  # LCL
        "R2": 2,  # ARG
        "R3": 3,  # THIS
        "R4": 4,  # THAT
        "R5": 5,  # TEMP
        "R6": 6,  # TEMP
        "R7": 7,  # TEMP
        "R8": 8,  # TEMP
        "R9": 9,  # TEMP
        "R10": 10,  # TEMP
        "R11": 11,  # TEMP
        "R12": 12,  # TEMP
        "BASE": 15,  # R15 (statics assigned at BASE+X)

        # VM symbols
        "SP": 0,  # segmented by function (saved)
        "LCL": 1,  # segmented by function (saved)
        "ARG": 2,  # segmented by function (saved)
        "THIS": 3,  # segmented by function (saved)
        "THAT": 4,  # segmented by function (saved)
        "TEMP": 5,  # 5-12 incl (volatile)
        "R13": 13,  # general purpose (volatile)
        "R14": 14,  # general purpose (volatile)
        "R15": 15,  # general purpose (volatile)
        "STATIC": 16,  # 16-255 incl (segmented by VM source file)
        "STACK": 256,  # 256-2047 incl (persistent)

        # OO symbols
        "HEAP": 2048,  # 2048-16383 incl (persistent)
        "IO": 16384,  # 16384-24576 incl (persistent)
        "SCREEN": 16384,  # 16384-24575 incl (persistent)
        "KBD": 24576,
        "UNUSED": 24577,  # 24577-32767 incl
    }

    with open(input_file, "r") as asm_file:
        asm_content = asm_file.readlines()

    # symbol & formatting pre-processing
    line = 0
    debug_asm = []
    raw_asm = []
    symbol = False
    for debug_cmd in asm_content:  # some lines get parsed out so don't use enumerate here
        debug_cmd = debug_cmd.strip()  # remove indentation / trailing whitespace
        if debug_cmd == "":
            continue  # empty line
        elif debug_cmd[0] == "/":
            continue  # skip comment lines entirely

        raw_cmd = debug_cmd.split(" //")[0].strip()  # drop comments and strip

        # translate symbols to line numbers (addresses)
        if raw_cmd[0] == "(":
            label_val = raw_cmd[1:-1]  # parse label name i.e. (LABEL)
            symbol = label_val  # store the parsed label name
            if label_val not in address_labels:
                address_labels[label_val] = line  # store line (address) for label in dict
            continue  # symbols are parsed out / don't increment line numbers
        else:
            # if a symbol was parsed on previous line append it to this debug line and reset the flag
            if symbol:
                debug_cmd += " // (%s)" % symbol
                symbol = False
            line += 1

        debug_asm.append(debug_cmd)  # preserve comments
        raw_asm.append(raw_cmd)  # code only

    hw["ROM"] = {"raw": raw_asm, "debug": debug_asm}

    # runtime parsing
    cycle = 0
    max_cycles = 100
    while cycle < max_cycles and hw["PC"] < len(hw["ROM"]["raw"]):
        raw_cmd = hw["ROM"]["raw"][hw["PC"]]
        debug_cmd = hw["ROM"]["debug"][hw["PC"]]

        if debug:
            print(hw["PC"], raw_cmd, "---", debug_cmd)

        if raw_cmd[0] == "(":
            raise RuntimeError("Symbols should already be parsed out!")

        # @address assignment
        elif raw_cmd[0] == "@":
            raw_cmd = raw_cmd.split(" //")[0].strip()  # drop everything after inline comment
            # assign @statics as they are encountered
            if not raw_cmd[1].isnumeric():
                temp_label = raw_cmd[1:]
                if temp_label not in address_labels:
                    address_labels["BASE"] += 1  # if not, increment to next slot on the heap and assign it
                    if address_labels["BASE"] >= 255:
                        raise RuntimeError("Statics were about to overflow into the stack!")
                    address_labels[temp_label] = address_labels["BASE"]
                address = address_labels[temp_label]
            else:
                address = int(raw_cmd[1:])

            # process raw_cmd
            hw["A"] = address  # set A register to @address
            hw["M"] = hw["RAM"][address]  # set M register to value of @address held in RAM
            hw["PC"] += 1  # advance to next instruction

        # register assignment X[YZ]=<eval>
        elif "=" in raw_cmd:
            if raw_cmd[1] == "=":  # X=X
                dst = raw_cmd[0]
                eval_cmd = raw_cmd[2:]
            elif raw_cmd[2] == "=":  # XY=X
                dst = raw_cmd[:2]
                eval_cmd = raw_cmd[3:]
            elif raw_cmd[3] == "=":  # XYZ=X
                dst = raw_cmd[:3]
                eval_cmd = raw_cmd[4:]
            else:
                raise RuntimeError("Unexpected command: %s %s %s %s" % (hw["PC"], raw_cmd, "---", debug_cmd))

            # deref the real register values for the eval
            raw_eval_cmd = eval_cmd.replace("A", str(hw["A"])) \
                .replace("D", str(hw["D"])).replace("M", str(hw["M"])) \
                .replace("!", "~")  # python bitwise NOT is ~

            # X=Y, where X=A,D,M and Y=0,1,-1,A,D,M
            # X=Y<OP>Z, where X=A,D,M and Y/Z=0,1,-1,A,D,M and OP=+,-,|,&
            if any(x in eval_cmd for x in ["+", "-", "0", "1", "|", "&", "!", "A", "D", "M"]):
                eval_result = eval(raw_eval_cmd)
                if debug:
                    print("EVAL: %s=%s (%s)" % (dst, raw_eval_cmd, eval_result))
                # for each destination assign the result
                for register in dst:
                    # deref the real register values for the destination
                    deref_reg = register.replace("A", str(hw["A"]))\
                        .replace("D", str(hw["D"])).replace("M", str(hw["M"]))
                    hw[deref_reg] = eval_result

                hw["PC"] += 1  # advance to next instruction
            else:
                raise RuntimeError("Unexpected command: %s %s %s %s" % (hw["PC"], raw_cmd, "---", debug_cmd))

        # jumps
        elif raw_cmd[1] == ";":
            jump = False
            if raw_cmd == "0;JMP":
                jump = True
            elif raw_cmd == "D;JGT":
                if hw["D"] > 0:
                    jump = True
            elif raw_cmd == "D;JGE":
                if hw["D"] >= 0:
                    jump = True
            elif raw_cmd == "D;JEQ":
                if hw["D"] == 0:
                    jump = True
            elif raw_cmd == "D;JNE":
                if hw["D"] != 0:
                    jump = True
            elif raw_cmd == "D;JLT":
                if hw["D"] < 0:
                    jump = True
            elif raw_cmd == "D;JLE":
                if hw["D"] <= 0:
                    jump = True
            else:
                raise RuntimeError("Unexpected jump command: %s %s %s %s" % (hw["PC"], raw_cmd, "---", debug_cmd))

            if jump:
                hw["PC"] = hw["A"]  # execute the jump
            else:
                hw["PC"] += 1  # fall through to next instruction

        else:
            raise RuntimeError("Unexpected command: %s %s %s %s" % (hw["PC"], raw_cmd, "---", debug_cmd))

        cycle += 1  # always advance clock cycle

    if hw["PC"] == len(hw["ROM"]["raw"]):
        if debug:
            print("EOF reached: %s" % input_file)
    elif cycle == max_cycles:
        if debug:
            print("Cycle limit reached: %s" % input_file)
    else:
        raise RuntimeError("Unexpected exit")


if __name__ == '__main__':
    file_list = [
        "../06/add/add.asm",
        "../06/max/max.asm",
        "../06/max/maxL.asm",
        "../06/pong/pong.asm",
        "../06/pong/pongL.asm",
        "../06/rect/rect.asm",
        "../06/rect/rectL.asm",
        "../07/MemoryAccess/BasicTest/BasicTest.asm",
        "../07/MemoryAccess/PointerTest/PointerTest.asm",
        "../07/MemoryAccess/StaticTest/StaticTest.asm",
        "../07/StackArithmetic/SimpleAdd/SimpleAdd.asm",
        "../07/StackArithmetic/StackTest/StackTest.asm",
        "../08/FunctionCalls/FibonacciElement/FibonacciElement.asm",
        "../08/FunctionCalls/NestedCall/NestedCall.asm",
        "../08/FunctionCalls/SimpleFunction/SimpleFunction.asm",
        "../08/FunctionCalls/StaticsTest/StaticsTest.asm",
        "../08/ProgramFlow/BasicLoop/BasicLoop.asm",
        "../08/ProgramFlow/FibonacciSeries/FibonacciSeries.asm",
    ]
    for input_file in file_list:
        assembler.assemble(input_file, debug=True)
        run(input_file, debug=True)
        assembler.assemble(input_file, debug=False)
        run(input_file, debug=False)
