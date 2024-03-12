""""
Python bindings & test framework for Nand2Tetris HACK Assembly language
"""
import assembler
import tester
import translator


def dump_call_tree(call_tree, debug_msg):
    if len(call_tree) == 0:
        debug_msg += "  <nil>"
    else:
        for i, func in enumerate(call_tree, start=1):
            debug_msg += "  " + ("-" * i) + func + "\n"
    return debug_msg


def run(asm_filepath, static_dict=None, tst_params=None, debug=False):
    # TODO: (week 6-8) all asm/tst/cmp/out/vms parsed/compiled/executed/passed
    # TODO: translator finish stack mapping: other stack manip(stacksize), functions(stackframes)
    # TODO: maybe stacksize should be <start-sp>-esp function instead?
    # TODO: maybe stack metadata could use address labels dict?
    # TODO: experiment with ebp (stackframe pointer) implementation
    # TODO: move remaining python comments to asm: associate all asm with function, check linebreaks
    # TODO: doc strings
    # TODO: (future) write a HDL module for interpreter?
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

    if debug:
        print('\n%s: Running' % asm_filepath)

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
                    if asm_filepath != '../08/FunctionCalls/SimpleFunction/SimpleFunction.asm':
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
            with open(asm_filepath.replace(".asm", ".debug"), "w") as debug_file:
                for line in debug_log:
                    debug_file.write(line+'\n')
        else:
            raise RuntimeError("Interpreter: Test results did not match for %s" % asm_filepath)


if __name__ == '__main__':
    # regular VM programs
    # TODO: standardise paths
    _vm_dirpaths = [
        # r'..\07\MemoryAccess\BasicTest',
        # r'..\07\MemoryAccess\PointerTest',
        # r'..\07\MemoryAccess\StaticTest',
        # r'..\07\StackArithmetic\SimpleAdd',
        # r'..\07\StackArithmetic\StackTest',
        #
        # r'..\08\ProgramFlow\BasicLoop',
        # r'..\08\ProgramFlow\FibonacciSeries',
        # r'..\08\FunctionCalls\SimpleFunction',

        r"..\11\Seven",
    ]

    # VM programs that require non-spec bootstrap to pass tests
    _vm_bootstrap_paths = [
        # r'..\08\FunctionCalls\FibonacciElement',
        # r'..\08\FunctionCalls\NestedCall',
        # r'..\08\FunctionCalls\StaticsTest'
    ]

    _vm_dirpaths = _vm_dirpaths + _vm_bootstrap_paths

    vm_asm_filepaths = [  # test scripts
        # "../07/MemoryAccess/BasicTest/BasicTest.asm",
        # "../07/MemoryAccess/PointerTest/PointerTest.asm",
        # "../07/MemoryAccess/StaticTest/StaticTest.asm",
        # "../07/StackArithmetic/SimpleAdd/SimpleAdd.asm",
        # "../07/StackArithmetic/StackTest/StackTest.asm",
        #
        # "../08/FunctionCalls/FibonacciElement/FibonacciElement.asm",
        # "../08/FunctionCalls/NestedCall/NestedCall.asm",
        # "../08/FunctionCalls/SimpleFunction/SimpleFunction.asm",
        # "../08/FunctionCalls/StaticsTest/StaticsTest.asm",
        # "../08/ProgramFlow/BasicLoop/BasicLoop.asm",
        # "../08/ProgramFlow/FibonacciSeries/FibonacciSeries.asm",
    ]

    binary_asm_filepaths = [  # compilation only
        # "../04/fill/fill.asm",
        # "../04/mult/mult.asm",
        # "../06/add/add.asm",
        # "../06/max/max.asm",
        # "../06/max/maxL.asm",
        # "../06/pong/pong.asm",
        # "../06/pong/pongL.asm",
        # "../06/rect/rect.asm",
        # "../06/rect/rectL.asm",
        r"../11/Seven/Seven.asm",
    ]

    # debug_runs = [True, False]
    debug_runs = [True]
    # debug_runs = [False]
    vm_static_dicts = {}
    for _debug in debug_runs:
        # transpile VM to ASM
        for _vm_dir in _vm_dirpaths:
            vm_static_dicts[_vm_dir] = translator.translate(_vm_dir, _vm_bootstrap_paths, debug=False)

        # compile all ASM to HACK and binary match if available
        _asm_filepaths = vm_asm_filepaths + binary_asm_filepaths
        for _asm_filepath in _asm_filepaths:
            assembler.assemble(_asm_filepath, debug=False)

        # load & execute modules without test scripts
        for _asm_filepath in binary_asm_filepaths:
            run(_asm_filepath, debug=False)

        # load & execute modules with test scripts
        for _asm_filepath in vm_asm_filepaths:
            _tst_filepath = _asm_filepath.replace(".asm", ".tst")
            _cmp_filepath = _asm_filepath.replace(".asm", ".cmp")
            _tst_params = tester.load_tst(_tst_filepath, debug=False)
            _tst_params["compare"] = tester.load_cmp(_cmp_filepath, debug=False)

            # retrieve static_dict from translator run
            _static_dict = None
            for _vm_dir in _vm_dirpaths:
                # TODO: standardise paths
                if _vm_dir.replace("\\", "/") in _asm_filepath:
                    _static_dict = vm_static_dicts[_vm_dir]

            # execute
            run(_asm_filepath, static_dict=_static_dict, tst_params=_tst_params, debug=_debug)


