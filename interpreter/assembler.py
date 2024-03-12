"""
Nand2Tetris HACK Assembler
"""

import os


def assemble(asm_filepath, debug=False):
    if debug:
        print('%s: Assembling' % asm_filepath)
    address_labels = {
        "R0": 0,
        "R1": 1,
        "R2": 2,
        "R3": 3,
        "R4": 4,
        "R5": 5,
        "R6": 6,
        "R7": 7,
        "R8": 8,
        "R9": 9,
        "R10": 10,
        "R11": 11,
        "R12": 12,
        "R13": 13,
        "R14": 14,
        "R15": 15,
        "SCREEN": 16384,
        "KBD": 24576,
        "SP": 0,
        "LCL": 1,
        "ARG": 2,
        "THIS": 3,
        "THAT": 4,
        # --------
        "BASE": 15
    }

    with open(asm_filepath, "r") as asm_file:
        asm_content = asm_file.readlines()

    # symbol pre-processing
    line = 0
    asm_content_stripped = []
    for instruction in asm_content:
        instruction = instruction.strip()  # remove indentation / trailing whitespace

        # determine instruction class
        if instruction == "":
            continue  # empty line
        elif instruction[0] == "/":
            continue  # skip comment lines

        if instruction[0] == "(":
            label_val = instruction[1:-1]  # parse label name i.e. (LABEL)
            if label_val not in address_labels:
                address_labels[label_val] = line  # if required, add to dict
                continue

        line += 1
        asm_content_stripped.append(instruction)  # only append code (not symbols, comments, etc)

    binary_file = []
    line = 0
    for instruction in asm_content:
        a_command = False
        c_command = False
        address = None

        instruction = instruction.strip()  # remove indentation / trailing whitespace

        # determine instruction class
        if instruction == "":
            continue  # empty line
        elif instruction[0] == "/":
            continue  # skip comment lines

        if instruction[0] == "(":
            continue  # symbol lines already processed
        elif instruction[0] == "@":
            a_command = True
        else:
            c_command = True

        instruction = instruction.split("//")[0].strip()  # drop everything after inline comment

        if a_command:
            '''
            prefix = instruction[0]
            address = instruction[1:15]
            '''
            if instruction[1].isnumeric():
                address = instruction[1:]  # assign if literal
            else:
                temp_label = instruction[1:]
                if temp_label in address_labels:
                    address = address_labels[temp_label]  # if label has an address, assign address
                else:
                    address_labels["BASE"] += 1  # if not, increment to next slot on the heap and assign it
                    address = address_labels[temp_label] = address_labels["BASE"]

            # convert decimal address to binary
            address = str(bin(int(address))).replace("0b", "")
            # if required, pad address to 16 bytes
            if len(address) <= 16:
                i = 16 - len(address)
                address = "0"*i + address

            # add complete instruction to file
            if len(address) == 16:
                binary_file.append(address)
                line += 1
            else:
                raise Exception("Interpreter: %s: Parsed %s bits worth of instructions (a command): %s >> %s"
                                % (asm_filepath, len(address), instruction, address))

        elif c_command:
            '''
            prefix = instruction[0:2]
            a/m = instruction[3:3]
            comp = instruction[4:9]
            dest = instruction[10:12]
            jump = instruction[13:15]
            '''
            destination = None
            jump = None
            binary_line = "111"  # prefix first 3 bits for C command

            # evaluate instruction type
            if ";J" in instruction:
                operation, jump = instruction.split(";")  # jump instruction
            elif "=" in instruction:
                destination, operation = instruction.split("=")  # assignment instruction
            else:
                operation = instruction  # no assignment or jump?

            # write a/m bit
            if "M" in operation:
                binary_line += "1"
            else:
                binary_line += "0"

            # write comp bits
            if operation == "0":
                binary_line += "101010"
            elif operation == "1":
                binary_line += "111111"
            elif operation == "-1":
                binary_line += "111010"
            elif operation == "D":
                binary_line += "001100"
            elif operation == "A" or operation == "M":
                binary_line += "110000"
            elif operation == "!D":
                binary_line += "001101"
            elif operation == "!A" or operation == "!M":
                binary_line += "110001"
            elif operation == "-D":
                binary_line += "001111"
            elif operation == "-A" or operation == "-M":
                binary_line += "110011"
            elif operation == "D+1" or operation == "1+D":
                binary_line += "011111"
            elif operation == "A+1" or operation == "1+A" or operation == "M+1" or operation == "1+M":
                binary_line += "110111"
            elif operation == "D-1":
                binary_line += "001110"
            elif operation == "A-1" or operation == "M-1":
                binary_line += "110010"
            elif operation == "D+A" or operation == "A+D" or operation == "D+M" or operation == "M+D":
                binary_line += "000010"
            elif operation == "D-A" or operation == "D-M":
                binary_line += "010011"
            elif operation == "A-D" or operation == "M-D":
                binary_line += "000111"
            elif operation == "D&A" or operation == "A&D" or operation == "D&M" or operation == "M&D":
                binary_line += "000000"
            elif operation == "D|A" or operation == "A|D" or operation == "M|D" or operation == "D|M":
                binary_line += "010101"

            # write dest bits
            if destination == "M":
                binary_line += "001"
            elif destination == "D":
                binary_line += "010"
            elif destination == "MD":
                binary_line += "011"
            elif destination == "A":
                binary_line += "100"
            elif destination == "AM":
                binary_line += "101"
            elif destination == "AD":
                binary_line += "110"
            elif destination == "AMD":
                binary_line += "111"
            else:
                binary_line += "000"  # no value stored (jump instructions)

            # write jump bits
            if jump == "JGT":
                binary_line += "001"
            elif jump == "JEQ":
                binary_line += "010"
            elif jump == "JGE":
                binary_line += "011"
            elif jump == "JLT":
                binary_line += "100"
            elif jump == "JNE":
                binary_line += "101"
            elif jump == "JLE":
                binary_line += "110"
            elif jump == "JMP":
                binary_line += "111"
            else:
                binary_line += "000"

            # add complete instruction to file
            if len(binary_line) == 16:
                binary_file.append(binary_line)
                line += 1
            else:
                raise Exception("Interpreter: %s: Parsed %s bits worth of instructions (c command): %s >> %s"
                                % (asm_filepath, len(binary_line), instruction, binary_line))

    output_filepath = asm_filepath.replace(".asm", ".hack")
    solution_filepath = asm_filepath.replace(".asm", ".cmp")

    # write the output: if solution exists, check as written
    # 06 = HACK binary comparison
    if os.path.exists(solution_filepath) and "/06/" in asm_filepath:
        with open(asm_filepath.replace(".asm", ".hack"), "w") as output_file:
            with open(asm_filepath.replace(".asm", ".cmp"), "r") as solution_file:
                # dump the result
                for i, ((bin_line, sol_line), in_line) in enumerate(
                        zip(zip(binary_file, solution_file), asm_content_stripped)):
                    if debug:
                        print('%s / %s' % (in_line, bin_line))
                        print('map    : ' + 'ixx a cccccc ddd jjj')
                        print('code   : ' + bin_line[0:3] + " " + bin_line[3] + " " + bin_line[4:10] +
                              " " + bin_line[10:13] + " " + bin_line[13:])

                    output_file.write(bin_line + '\n')
                    if bin_line.strip() != sol_line.strip():
                        if debug:
                            print('target : ' + sol_line[0:3]+" "+sol_line[3]+" "+sol_line[4:10] +
                                  " "+sol_line[10:13]+" "+sol_line[13:])
                        raise Exception('Interpreter: %s: mismatch on line %s' % (asm_filepath, i))
            print('Assembler: %s Complete (no errors / matches solution file)' % asm_filepath)

    else:
        # no solution file, just write the result
        with open(asm_filepath.replace(".asm", ".hack"), "w") as output_file:
            for (bin_line, in_line) in zip(binary_file, asm_content_stripped):
                if debug:
                    print('%s / %s' % (in_line, bin_line))
                    print('map  : ' + 'ixx a cccccc ddd jjj')
                    print('code : ' + bin_line[0:3] + " " + bin_line[3] + " " + bin_line[4:10] +
                          " " + bin_line[10:13] + " " + bin_line[13:])
                output_file.write(bin_line + '\n')
        print('Assembler: %s Complete (no errors / no solution file)' % asm_filepath)


if __name__ == '__main__':
    _asm_filepaths = [
        r"..\projects\04\fill\fill.asm",
        r"..\projects\04\mult\mult.asm",

        r"..\projects\06\add\add.asm",
        r"..\projects\06\max\max.asm",
        r"..\projects\06\max\maxL.asm",
        r"..\projects\06\pong\pong.asm",
        r"..\projects\06\pong\pongL.asm",
        r"..\projects\06\rect\rect.asm",
        r"..\projects\06\rect\rectL.asm",

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

    debug_runs = [True, False]
    for _debug in debug_runs:
        for _asm_filepath in _asm_filepaths:
            assemble(_asm_filepath, debug=_debug)
