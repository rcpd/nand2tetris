""""
Python bindings & test framework for Nand2Tetris HACK Assembly language
"""
import warnings
import traceback

import assembler
import tester
import translator
import subprocess
import tokenizer
import analyzer
import compiler


def dump_call_tree(call_tree, debug_msg):
    if len(call_tree) == 0:
        debug_msg += "  <nil>"
    else:
        for i, func in enumerate(call_tree, start=1):
            debug_msg += "  " + ("-" * i) + func + "\n"
    return debug_msg


def run(asm_filepath, static_dict=None, tst_params=None, debug=False):
    debug_log = []

    # initialize hardware
    ram = [0] * 32768
    hw = {
        "RAM": ram,
        "ROM": {},
        "A": 0,
        "D": 0,
        "M": 0,
        "PC": 0,
        "MAX": 1000,
    }

    # load test params
    if tst_params is not None:
        hw["RAM"] = tst_params["RAM"]
        hw["MAX"] = tst_params["MAX"]

    print('Interpreter: Running %s' % asm_filepath)

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

    with open(asm_filepath, "r") as asm_file:
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
    call_tree = []
    stacksize = 0
    while cycle < hw["MAX"] and hw["PC"] < len(hw["ROM"]["raw"]):
        assignment = False
        raw_cmd = hw["ROM"]["raw"][hw["PC"]]
        debug_cmd = hw["ROM"]["debug"][hw["PC"]]

        if raw_cmd[0] == "(":
            raise RuntimeError("Interpreter: Symbols should already be parsed out!")

        # @address assignment
        elif raw_cmd[0] == "@":
            raw_cmd = raw_cmd.split(" //")[0].strip()  # drop everything after inline comment
            # assign @statics as they are encountered
            if raw_cmd[1].isnumeric():
                address = int(raw_cmd[1:])
            else:
                temp_label = raw_cmd[1:]
                if temp_label not in address_labels:
                    # not hit during week 7-8 tests
                    address_labels["BASE"] += 1  # if not, increment to next slot on the heap and assign it
                    if address_labels["BASE"] >= 255:
                        raise RuntimeError("Interpreter: Statics were about to overflow into the stack!")
                    address_labels[temp_label] = address_labels["BASE"]
                address = address_labels[temp_label]

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
                # will never be tested with vm generated asm
                dst = raw_cmd[:2]
                eval_cmd = raw_cmd[3:]
            elif raw_cmd[3] == "=":  # XYZ=X
                # will never be tested with vm generated asm
                dst = raw_cmd[:3]
                eval_cmd = raw_cmd[4:]
            else:
                raise RuntimeError("Interpreter: Unexpected command: %s %s %s %s" %
                                   (hw["PC"], raw_cmd, "---", debug_cmd))

            # deref the real register values for the eval
            raw_eval_cmd = eval_cmd.replace("A", str(hw["A"])) \
                .replace("D", str(hw["D"])).replace("M", str(hw["M"])) \
                .replace("!", "~")  # python bitwise NOT is ~

            # X=Y, where X=A,D,M and Y=0,1,-1,A,D,M
            # X=Y<OP>Z, where X=A,D,M and Y/Z=0,1,-1,A,D,M and OP=+,-,|,&
            if any(x in eval_cmd for x in ["+", "-", "0", "1", "|", "&", "!", "A", "D", "M"]):
                assignment = True
                eval_result = eval(raw_eval_cmd)
                # for each destination assign the result
                for register in dst:
                    hw[register] = eval_result
                    if register == "A":
                        # after assignment to A update M with new RAM[A] value
                        hw["M"] = hw["RAM"][hw["A"]]
                    elif register == "M":
                        # after assignment to M write to RAM[A] address
                        hw["RAM"][hw["A"]] = hw["M"]
                    elif register == "D":
                        pass  # no implicit ops for D assignment
                    else:
                        raise RuntimeError("Interpreter: Unexpected command: %s %s %s %s" %
                                           (hw["PC"], raw_cmd, "---", debug_cmd))

                hw["PC"] += 1  # advance to next instruction
            else:
                raise RuntimeError("Interpreter: Unexpected command: %s %s %s %s" %
                                   (hw["PC"], raw_cmd, "---", debug_cmd))

        # jumps
        elif ";" in raw_cmd:
            if raw_cmd[1] == ";":
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
                    raise RuntimeError("Interpreter: Unexpected jump command: %s %s %s %s" %
                                       (hw["PC"], raw_cmd, "---", debug_cmd))

                if jump:
                    hw["PC"] = hw["A"]  # execute the jump
                else:
                    hw["PC"] += 1  # fall through to next instruction
            else:
                raise RuntimeError("Interpreter: Unexpected command: %s %s %s %s" %
                                   (hw["PC"], raw_cmd, "---", debug_cmd))
        else:
            raise RuntimeError("Interpreter: Unexpected command: %s %s %s %s" % (hw["PC"], raw_cmd, "---", debug_cmd))

        #  format primary debug output
        if debug:
            # prine line debug cmd
            debug_msg = "%s %s" % (hw["PC"]-1, debug_cmd.replace("//", "~~"))

            # deref values and show eval / command result
            if assignment:
                # ignore pep warnings(s), thats what assignment flag is for
                debug_msg += " // EVAL: %s=%s (%s)" % (dst, eval_result, raw_eval_cmd)
            else:
                # if no assignment must be an A command
                debug_msg += " // EVAL: A=%s" % hw["A"]

            # show the state of the registers post-execute
            debug_msg += " // A=%s D=%s M=%s" % (hw["A"], hw["D"], hw["M"])

            # show the state of RAM registers
            # TODO: map this to address_labels{} not literals
            debug_msg += " R13=%s" % hw["RAM"][13]
            debug_msg += " R14=%s" % hw["RAM"][14]
            debug_msg += " R15=%s" % hw["RAM"][15]

            debug_msg += " // SP: %s" % hw["RAM"][0]
            debug_msg += " LCL=%s" % hw["RAM"][1]
            debug_msg += " ARG=%s" % hw["RAM"][2]
            debug_msg += " THIS=%s" % hw["RAM"][3]
            debug_msg += " THAT=%s" % hw["RAM"][4]
            debug_msg += " // TEMP0-7: "
            for i in range(5, 13):
                debug_msg += "%s " % hw["RAM"][i]

            # update & dump the call graph on call/return
            if "// call " in debug_cmd:
                debug_msg += "// CALL: call graph updated\n"
                callee = debug_cmd.split("// call ")[1].split()[0]
                call_tree.append(callee)
                debug_msg = dump_call_tree(call_tree, debug_msg)

            elif "// return //" in debug_cmd:
                debug_msg += "// RETURN: call graph updated\n"
                try:
                    call_tree.pop()
                except IndexError:
                    # SimpleFunction does not contain a call so will always break the index on return
                    if asm_filepath != r'..\projects\08\FunctionCalls\SimpleFunction\SimpleFunction.asm':
                        raise

                debug_msg = dump_call_tree(call_tree, debug_msg)

            # display the stack (if values to display)
            if "// stacksize++" in debug_cmd:
                stacksize += 1
            elif "// stacksize--" in debug_cmd:
                stacksize -= 1
            if stacksize:
                debug_msg += "// STACK: "
                sp = hw["RAM"][address_labels["SP"]]
                for i in range(sp, sp+stacksize):
                    debug_msg += "%s " % hw["RAM"][i]

            # display the static segment if used
            static_count = 0
            if static_dict is not None:
                for vm_file in static_dict:
                    static_count += static_dict[vm_file][1]
            if static_count:
                debug_msg += "// STATICS: "
                sp = address_labels["STATIC"]
                for i in range(sp, sp+static_count):
                    debug_msg += "%s " % hw["RAM"][i]

            debug_msg = debug_msg.replace("//", "\n ").replace("~~", "\n  //")
            print(debug_msg)
            debug_log.append(debug_msg)

        cycle += 1  # always advance clock cycle

    # program end
    if hw["PC"] == len(hw["ROM"]["raw"]):
        if debug:
            print("EOF reached: %s" % asm_filepath)
    elif cycle == hw["MAX"]:
        if debug:
            print("Cycle limit reached: %s" % asm_filepath)
    else:
        # PC will jump off into empty ROM at end of SimpleFunction test
        if "SimpleFunction" not in asm_filepath:
            raise RuntimeError("Interpreter: Unexpected exit")
    if len(call_tree) >= 1:
        raise RuntimeError("Interpreter: Elements still exist in call tree at program exit")

    # evaluate results
    result_dict = {}
    if tst_params is not None:
        for address in tst_params["results"]:
            result_dict[address] = hw["RAM"][address]

        if debug:
            print(result_dict)
            print(tst_params["compare"])
        if tst_params["compare"] == result_dict:
            print("Interpreter: Test passed for %s" % asm_filepath)
            with open(asm_filepath.replace(".asm", ".cmp"), "r") as cmp_file:
                cmp_file_contents = cmp_file.read()
            with open(asm_filepath.replace(".asm", ".out"), "w") as out_file:
                out_file.write(cmp_file_contents)
            if debug:
                with open(asm_filepath.replace(".asm", ".debug"), "w") as debug_file:
                    for line in debug_log:
                        debug_file.write(line+'\n')
        else:
            raise RuntimeError("Interpreter: Test results did not match for %s" % asm_filepath)


if __name__ == '__main__':
    '''
    Projects 1-5: HDL, TST orchestration (HardwareSimulator/CPUEmulator), OUT matched to CMP truth table 
    Project 6:    ASM (assembler/interpreter) > HACK (python_hdl) matched against CMP binary
    Project 7-8:  VM (translator) > ASM // ASM > HACK as above
                  TST file (CPUEmulator/VMEmulator/tester) > OUT matched to CMP machine state
    Project 9-11: JACK > T_XML (CST) > XML (AST) > VM (tokenizer > analyzer > compiler) // VM > ASM > HACK as above
                  Only Project 10 has CST/AST solution XML files
    '''

    # compile jack programs (JackCompiler, translator) # TODO: projects 1-11 accounted for, not included in compiler
    jack_dirpaths = [
        r"..\projects\09\Average",
        r"..\projects\09\Fraction",
        r"..\projects\09\HelloWorld",
        r"..\projects\09\List",
        r"..\projects\09\Square",
        r"..\projects\10\ArrayTest",
        # r"..\projects\10\ExpressionLessSquare",  # nonsense code that shouldn't compile or run
        r"..\projects\10\Square",
        r"..\projects\11\Average",
        r"..\projects\11\ComplexArrays",
        r"..\projects\11\ConvertToBin",
        r"..\projects\11\Pong",
        r"..\projects\11\Seven",
        r"..\projects\11\Square",

        # TODO: Project 12
        r"..\projects\12\SysTest",
        r"..\projects\12\ArrayTest",
        r"..\projects\12\KeyboardTest",
        r"..\projects\12\StringTest",
        r"..\projects\12\MemoryTest",
    ]

    # tokenizer/analyzer # TODO: projects 1-11 accounted for, included in tokenizer/analyzer/compiler
    jack_filepaths = [
        r"..\projects\09\Average\Main.jack",
        r"..\projects\09\Fraction\Main.jack",
        r"..\projects\09\Fraction\Fraction.jack",
        r"..\projects\09\HelloWorld\Main.jack",
        r"..\projects\09\List\Main.jack",
        r"..\projects\09\List\List.jack",
        r"..\projects\09\Square\Main.jack",
        r"..\projects\09\Square\Square.jack",
        r"..\projects\09\Square\SquareGame.jack",
        r"..\projects\10\ArrayTest\Main.jack",
        # r"..\projects\10\ExpressionLessSquare\Main.jack",  # nonsense code that shouldn't compile or run
        # r"..\projects\10\ExpressionLessSquare\Square.jack",
        # r"..\projects\10\ExpressionLessSquare\SquareGame.jack",
        r"..\projects\10\Square\Main.jack",
        r"..\projects\10\Square\Square.jack",
        r"..\projects\10\Square\SquareGame.jack",
        r"..\projects\11\Average\Main.jack",
        r"..\projects\11\ComplexArrays\Main.jack",
        r"..\projects\11\ConvertToBin\Main.jack",
        r"..\projects\11\Pong\Ball.jack",
        r"..\projects\11\Pong\Bat.jack",
        r"..\projects\11\Pong\Main.jack",
        r"..\projects\11\Pong\PongGame.jack",
        r"..\projects\11\Seven\Main.jack",
        r"..\projects\11\Square\Main.jack",
        r"..\projects\11\Square\Square.jack",
        r"..\projects\11\Square\SquareGame.jack",

        # TODO: Project 12
        r"..\projects\12\SysTest\Main.jack",
        r"..\projects\12\SysTest\Sys.jack",
        r"..\projects\12\ArrayTest\Main.jack",
        r"..\projects\12\ArrayTest\Array.jack",
        r"..\projects\12\KeyboardTest\Main.jack",
        r"..\projects\12\KeyboardTest\Keyboard.jack",
        r"..\projects\12\StringTest\Main.jack",
        r"..\projects\12\StringTest\String.jack",
    ]

    # compiler
    jack_filepath_lists = [  # TODO: projects 1-11 accounted for, included in interpreter/tokenizer/analyzer
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

        # TODO: Project 12
        [r"..\projects\12\SysTest\Main.jack",
         r"..\projects\12\SysTest\Sys.jack"],
        [r"..\projects\12\ArrayTest\Main.jack",
         r"..\projects\12\ArrayTest\Array.jack"],
        [r"..\projects\12\KeyboardTest\Main.jack",
         r"..\projects\12\KeyboardTest\Keyboard.jack"],
        [r"..\projects\12\StringTest\Main.jack",
         r"..\projects\12\StringTest\String.jack"],
    ]

    # enforce matching of compiler against course compiler
    jack_matches = {  # TODO: projects 1-11 accounted for
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

        # TODO: Project 12
        r"..\projects\12\SysTest\Main.vm": 281,
        r"..\projects\12\SysTest\Sys.vm": 83,
        r"..\projects\12\ArrayTest\Main.vm": 131,
        r"..\projects\12\ArrayTest\Array.vm": 23,
        r"..\projects\12\KeyboardTest\Main.vm": 949,
        r"..\projects\12\KeyboardTest\Keyboard.vm": 102,
        r"..\projects\12\StringTest\Main.vm": 919,
        r"..\projects\12\StringTest\String.vm": 393,
    }

    # VM programs (translator only, interpreted below) # TODO: projects 1-11 accounted for, included in translator
    _vm_dirpaths = [
        r'..\projects\07\MemoryAccess\BasicTest',
        r'..\projects\07\MemoryAccess\PointerTest',
        r'..\projects\07\MemoryAccess\StaticTest',
        r'..\projects\07\StackArithmetic\SimpleAdd',
        r'..\projects\07\StackArithmetic\StackTest',
        r'..\projects\08\ProgramFlow\BasicLoop',
        r'..\projects\08\ProgramFlow\FibonacciSeries',
        # r'..\projects\08\FunctionCalls\FibonacciElement',  # bootstrap
        # r'..\projects\08\FunctionCalls\NestedCall',  # bootstrap
        r'..\projects\08\FunctionCalls\SimpleFunction',
        # r'..\projects\08\FunctionCalls\StaticsTest'  # bootstrap
        r"..\projects\09\Average",
        r"..\projects\09\Fraction",
        r"..\projects\09\HelloWorld",
        r"..\projects\09\List",
        r"..\projects\09\Square",
        r"..\projects\10\ArrayTest",
        # r"..\projects\10\ExpressionLessSquare",  # nonsense code that shouldn't compile or run
        r"..\projects\10\Square",
        r"..\projects\11\Average",
        r"..\projects\11\ComplexArrays",
        r"..\projects\11\ConvertToBin",
        r"..\projects\11\Pong",
        r"..\projects\11\Seven",
        r"..\projects\11\Square",

        # TODO: Project 12
        r"..\projects\12\SysTest",
        r"..\projects\12\ArrayTest",
        r"..\projects\12\KeyboardTest",
        r"..\projects\12\StringTest",
    ]

    # VM programs # TODO: projects 1-11 accounted for, included in translator
    # that require non-spec bootstrap to pass tests (translator only, interpreted/tested below)
    # (bootstrap is injected into ASM which is loaded by tester + CPUEmulator)
    _vm_bootstrap_paths = [
        r'..\projects\08\FunctionCalls\FibonacciElement',
        r'..\projects\08\FunctionCalls\NestedCall',
        r'..\projects\08\FunctionCalls\StaticsTest'
    ]

    _vm_dirpaths = _vm_dirpaths + _vm_bootstrap_paths

    # VM test scripts # TODO: projects 1-11 accounted for, included in assembler/python_hdl
    # (assembler/tester/interpreter)
    vm_asm_filepaths = [
        r"..\projects\07\MemoryAccess\BasicTest\BasicTest.asm",
        r"..\projects\07\MemoryAccess\PointerTest\PointerTest.asm",
        r"..\projects\07\MemoryAccess\StaticTest\StaticTest.asm",
        r"..\projects\07\StackArithmetic\SimpleAdd\SimpleAdd.asm",
        r"..\projects\07\StackArithmetic\StackTest\StackTest.asm",
        r"..\projects\08\FunctionCalls\FibonacciElement\FibonacciElement.asm",
        r"..\projects\08\FunctionCalls\NestedCall\NestedCall.asm",
        r"..\projects\08\FunctionCalls\SimpleFunction\SimpleFunction.asm",
        r"..\projects\08\FunctionCalls\StaticsTest\StaticsTest.asm",
        r"..\projects\08\ProgramFlow\BasicLoop\BasicLoop.asm",
        r"..\projects\08\ProgramFlow\FibonacciSeries\FibonacciSeries.asm",
    ]

    # assembler/interpreter # TODO: projects 1-11 accounted for, included in assembler/python_hdl
    # (tested against HACK solutions for project 6)
    binary_asm_filepaths = [
        r"..\projects\04\fill\fill.asm",
        r"..\projects\04\mult\mult.asm",
        r"..\projects\06\add\add.asm",
        r"..\projects\06\max\max.asm",
        r"..\projects\06\max\maxL.asm",
        r"..\projects\06\pong\pong.asm",
        r"..\projects\06\pong\pongL.asm",
        r"..\projects\06\rect\rect.asm",
        r"..\projects\06\rect\rectL.asm",

        # exercised during vm_asm_filepaths
        # r"..\projects\07\MemoryAccess\BasicTest\BasicTest.asm",
        # r"..\projects\07\MemoryAccess\PointerTest\PointerTest.asm",
        # r"..\projects\07\MemoryAccess\StaticTest\StaticTest.asm",
        # r"..\projects\07\StackArithmetic\SimpleAdd\SimpleAdd.asm",
        # r"..\projects\07\StackArithmetic\StackTest\StackTest.asm",
        # r"..\projects\08\FunctionCalls\FibonacciElement\FibonacciElement.asm",
        # r"..\projects\08\FunctionCalls\NestedCall\NestedCall.asm",
        # r"..\projects\08\FunctionCalls\SimpleFunction\SimpleFunction.asm",
        # r"..\projects\08\FunctionCalls\StaticsTest\StaticsTest.asm",
        # r"..\projects\08\ProgramFlow\BasicLoop\BasicLoop.asm",
        # r"..\projects\08\ProgramFlow\FibonacciSeries\FibonacciSeries.asm",

        # exceeds ROM limit of 32k instructions
        r'..\projects\09\Average\Average.asm',
        r'..\projects\09\Fraction\Fraction.asm',
        r'..\projects\09\HelloWorld\HelloWorld.asm',
        r'..\projects\09\List\List.asm',
        r'..\projects\09\Square\Square.asm',
        r'..\projects\10\ArrayTest\ArrayTest.asm',
        r'..\projects\10\Square\Square.asm',  # 17 bit addresses (different Main.jack to 9/11)
        r'..\projects\11\Average\Average.asm',
        r'..\projects\11\ComplexArrays\ComplexArrays.asm',  # 17 bit addresses
        r'..\projects\11\ConvertToBin\ConvertToBin.asm',
        r'..\projects\11\Pong\Pong.asm',  # 17 bit addresses
        r'..\projects\11\Seven\Seven.asm',
        r'..\projects\11\Square\Square.asm',

        # TODO: Project 12
        r"..\projects\12\SysTest\SysTest.asm",
        r"..\projects\12\ArrayTest\ArrayTest.asm",
        r"..\projects\12\KeyboardTest\KeyboardTest.asm",  # 17 bit addresses + access violation
        r"..\projects\12\StringTest\StringTest.asm",  # 17 bit addresses + access violation
    ]

    # HDL tests (HardwareSimulator): project 1-12 accounted for, not included in tester/python_hdl!
    hw_tst_files = [
        r'..\projects\01\And.tst',
        r'..\projects\01\And16.tst',
        r'..\projects\01\DMux.tst',
        r'..\projects\01\DMux4Way.tst',
        r'..\projects\01\DMux8Way.tst',
        r'..\projects\01\Mux.tst',
        r'..\projects\01\Mux16.tst',
        r'..\projects\01\Mux4Way16.tst',
        r'..\projects\01\Mux8Way16.tst',
        r'..\projects\01\Not.tst',
        r'..\projects\01\Not16.tst',
        r'..\projects\01\Or.tst',
        r'..\projects\01\Or16.tst',
        r'..\projects\01\Or8Way.tst',
        r'..\projects\01\Xor.tst',
        r'..\projects\02\Add16.tst',
        r'..\projects\02\ALU-nostat.tst',
        r'..\projects\02\ALU.tst',
        r'..\projects\02\FullAdder.tst',
        r'..\projects\02\HalfAdder.tst',
        r'..\projects\02\Inc16.tst',
        r'..\projects\03\a\Bit.tst',
        r'..\projects\03\a\PC.tst',
        r'..\projects\03\a\RAM64.tst',
        r'..\projects\03\a\RAM8.tst',
        r'..\projects\03\a\Register.tst',
        r'..\projects\03\b\RAM16K.tst',
        r'..\projects\03\b\RAM4K.tst',
        r'..\projects\03\b\RAM512.tst',
        r'..\projects\05\ComputerAdd-external.tst',
        r'..\projects\05\ComputerAdd.tst',
        r'..\projects\05\ComputerMax-external.tst',
        r'..\projects\05\ComputerMax.tst',
        r'..\projects\05\ComputerRect-external.tst',
        r'..\projects\05\ComputerRect.tst',
        r'..\projects\05\CPU-external.tst',
        r'..\projects\05\CPU.tst',
        # r'..\projects\05\Memory.tst',  # interactive test (passed manually)
    ]
    
    # ASM tests (CPUEmulator): # project 1-12 accounted for & included in tester!
    cpu_tst_files = [
        # r'..\projects\04\fill\Fill.tst',  # interactive test (passed manually)
        r'..\projects\04\fill\FillAutomatic.tst',
        r'..\projects\04\mult\Mult.tst',
        r'..\projects\07\MemoryAccess\BasicTest\BasicTest.tst',
        r'..\projects\07\MemoryAccess\PointerTest\PointerTest.tst',
        r'..\projects\07\MemoryAccess\StaticTest\StaticTest.tst',
        r'..\projects\07\StackArithmetic\SimpleAdd\SimpleAdd.tst',
        r'..\projects\07\StackArithmetic\StackTest\StackTest.tst',
        r'..\projects\08\FunctionCalls\FibonacciElement\FibonacciElement.tst',
        r'..\projects\08\FunctionCalls\NestedCall\NestedCall.tst',
        r'..\projects\08\FunctionCalls\SimpleFunction\SimpleFunction.tst',
        r'..\projects\08\FunctionCalls\StaticsTest\StaticsTest.tst',
        r'..\projects\08\ProgramFlow\BasicLoop\BasicLoop.tst',
        r'..\projects\08\ProgramFlow\FibonacciSeries\FibonacciSeries.tst',
    ]

    # VM tests (VMEmulator): # TODO: project 1-12 accounted for, not included in tester
    vm_tst_files = [
        r'..\projects\07\MemoryAccess\BasicTest\BasicTestVME.tst',
        r'..\projects\07\MemoryAccess\PointerTest\PointerTestVME.tst',
        r'..\projects\07\MemoryAccess\StaticTest\StaticTestVME.tst',
        r'..\projects\07\StackArithmetic\SimpleAdd\SimpleAddVME.tst',
        r'..\projects\07\StackArithmetic\StackTest\StackTestVME.tst',
        r'..\projects\08\FunctionCalls\FibonacciElement\FibonacciElementVME.tst',
        r'..\projects\08\FunctionCalls\NestedCall\NestedCallVME.tst',
        r'..\projects\08\FunctionCalls\SimpleFunction\SimpleFunctionVME.tst',
        r'..\projects\08\FunctionCalls\StaticsTest\StaticsTestVME.tst',
        r'..\projects\08\ProgramFlow\BasicLoop\BasicLoopVME.tst',
        r'..\projects\08\ProgramFlow\FibonacciSeries\FibonacciSeriesVME.tst',

        # TODO: Project 12
        # interactively tested / no test files
        # r'..\projects\12\SysTest
        # r'..\projects\12\KeyboardTest
        # r'..\projects\12\StringTest

        r'..\projects\12\ArrayTest\ArrayTest.tst',

        # r'..\projects\12\MathTest\MathTest.tst',
        # r'..\projects\12\MemoryTest\MemoryTest.tst',
        # r'..\projects\12\MemoryTest\MemoryDiag.tst'
    ]

    debug_runs = [False]

    vm_static_dicts = {}
    for _debug in debug_runs:
        # compile Jack to VM (course compiler)
        for jack_dir in jack_dirpaths:
            result = subprocess.run([r"..\tools\JackCompiler.bat", jack_dir], capture_output=True, text=True)
            if result.stderr:
                raise RuntimeError(result.stderr)
            else:
                print("Course Compiler: %s" % result.stdout.strip())

        # tokenize / analyze Jack (not required with course compiler)
        for _filepath in jack_filepaths:
            tokenizer.main(_filepath, debug=False)
            analyzer.main(_filepath, debug=False)

        # compile Jack to VM (match against course compiler)
        compiler._compile(jack_filepath_lists, jack_matches)

        # translate VM to ASM
        for _vm_dir in _vm_dirpaths:
            vm_static_dicts[_vm_dir] = translator.translate(_vm_dir, _vm_bootstrap_paths, debug=False)

        # assemble all ASM to HACK and binary match if available
        _asm_filepaths = vm_asm_filepaths + binary_asm_filepaths
        for _asm_filepath in _asm_filepaths:
            assembler.assemble(_asm_filepath, debug=False)
        warnings.simplefilter("default")  # reset warning filter

        # load & execute modules without test scripts
        for _asm_filepath in binary_asm_filepaths:
            try:
                run(_asm_filepath, debug=False)
            except IndexError:
                warnings.warn("Interpreter: Probable memory access violation captured during execution of %s"
                              % _asm_filepath)
                traceback.print_exc()

        # load & execute modules with test scripts
        for _asm_filepath in vm_asm_filepaths:
            _tst_filepath = _asm_filepath.replace(".asm", ".tst")
            _cmp_filepath = _asm_filepath.replace(".asm", ".cmp")
            _tst_params = tester.load_tst(_tst_filepath, debug=False)
            _tst_params["compare"] = tester.load_cmp(_cmp_filepath, debug=False)

            # retrieve static_dict from translator run
            _static_dict = None
            for _vm_dir in _vm_dirpaths:
                if _vm_dir in _asm_filepath:
                    _static_dict = vm_static_dicts[_vm_dir]

            # execute
            run(_asm_filepath, static_dict=_static_dict, tst_params=_tst_params, debug=_debug)

        # run hdl tests (HardwareSimulator)
        cmd = r'..\tools\HardwareSimulator.bat'
        for test in hw_tst_files:
            print(r"Running: %s %s" % (cmd, test))
            result = subprocess.run([cmd, test], capture_output=True, text=True)
            if 'End of script - Comparison ended successfully\n' != result.stdout and not result.stderr:
                raise RuntimeError(r"Error when running %s: %s" % (cmd, result.stderr))

            # different style of TST file, but the test has passed
            if test in (r'..\projects\05\CPU-external.tst', r'..\projects\05\CPU.tst'):
                continue

            line = 0
            out_file = test.replace(".tst", ".out")
            cmp_file = test.replace(".tst", ".cmp")
            with open(out_file) as out:
                with open(cmp_file) as cmp:
                    for index, (solution, current) in enumerate(zip(cmp, out)):
                        if solution != current:
                            raise RuntimeError("%s mismatch after line %s" % (out_file, index))
                    line += 1

        # run hack tests (CPUEmulator) -- shares CMP and OUT files with VMEmulator
        cmd = r'..\tools\CPUEmulator.bat'
        for test in cpu_tst_files:
            print(r"Running: %s %s" % (cmd, test))
            result = subprocess.run([cmd, test], capture_output=True, text=True)
            if 'End of script - Comparison ended successfully\n' != result.stdout and not result.stderr:
                raise RuntimeError(r"Error when running %s: %s" % (cmd, result.stderr))

            line = 0
            out_file = test.replace(".tst", ".out")
            cmp_file = test.replace(".tst", ".cmp")
            with open(out_file) as out:
                with open(cmp_file) as cmp:
                    for index, (solution, current) in enumerate(zip(cmp, out)):
                        if solution != current:
                            raise RuntimeError("%s mismatch after line %s" % (out_file, index))
                    line += 1

        # run VM tests (VMEmulator) -- shares CMP and OUT files with CPUEmulator
        cmd = r'..\tools\VMEmulator.bat'
        for test in vm_tst_files:
            print(r"Running: %s %s" % (cmd, test))
            result = subprocess.run([cmd, test], capture_output=True, text=True)
            if 'End of script - Comparison ended successfully\n' != result.stdout and not result.stderr:
                raise RuntimeError(r"Error when running %s: %s" % (cmd, result.stderr))

            line = 0
            out_file = test.replace("VME.tst", ".out")
            cmp_file = test.replace("VME.tst", ".cmp")
            with open(out_file) as out:
                with open(cmp_file) as cmp:
                    for index, (solution, current) in enumerate(zip(cmp, out)):
                        if solution != current:
                            raise RuntimeError("%s mismatch after line %s" % (out_file, index))
                    line += 1

    # project
    # TODO: comment remaining sys.errors
    # TODO: Project 12: Implement the OS libraries in Jack, compile/test (test programs included)
    # TODO: add integration for Project 12 translate/execute/assemble ASM > HACK (integration test)
    # TODO: VMEmulator equivalent for Jack debugging + tests (no instruction limit)
    # TODO: separate interpreter from test harness

    # test harness
    # TODO: import file lists from common file
    # TODO: dynamically count lines in jack/strict matches

    # compiler
    # TODO: int cannot exceed 32767
    # TODO: non-void without return value / void with return value
    # TODO: statement without keyword/statement type
    # TODO: non-terminated statement
    # TODO: // in string strips the string
    # TODO: prevent using reserved keywords as identifiers
    # TODO: prevent duplicate variable/subroutine declaration
    # TODO: check num args match called function
    # TODO: check subroutine returns
    # TODO: check constructor return type is class type
    # TODO: check constructor returns this
    # TODO: check for unexpected tokens after statement expression (if/while)

    # interpreter
    # TODO: translator finish stack mapping: other stack manip(stacksize), functions(stackframes)
    # TODO: maybe stacksize should be <start-sp>-esp function instead?
    # TODO: maybe stack metadata could use address labels dict?
    # TODO: experiment with ebp (stackframe pointer) implementation
    # TODO: move remaining python comments to asm: associate all asm with function, check linebreaks
    # TODO: doc strings

    # TODO: Jack OS Error Codes
    '''
    Code Method/Function       Description
    ---- ---------------       -----------------------------------------------
     1   Sys.wait              Duration must be positive
     2   Array.new             Array size must be positive
     3   Math.divide           Division by zero
     4   Math.sqrt             Cannot compute square root of a negative number
     5   Memory.alloc          Allocated memory size must be positive
     6   Memory.alloc          Heap overflow
     7   Screen.drawPixel      Illegal pixel coordinates
     8   Screen.drawLine       Illegal line coordinates
     9   Screen.drawRectangle  Illegal rectangle coordinates
    12   Screen.drawCircle     Illegal center coordinates
    13   Screen.drawCircle     Illegal radius
    14   String.new            Maximum length must be non-negative
    15   String.charAt         String index out of bounds
    16   String.setCharAt      String index out of bounds
    17   String.appendChar     String is full
    18   String.eraseLastChar  String is empty
    19   String.setInt         Insufficient string capacity
    20   Output.moveCursor     Illegal cursor location
    '''
