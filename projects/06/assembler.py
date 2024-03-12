"""
Nand2Tetris Week 6: Hack Assembler
"""

file_list = [
    "add/add.asm",
    "max/max.asm",
    "pong/pong.asm",
    "rect/rect.asm",
    "pong/pongL.asm",
    "max/maxL.asm",
    "rect/rectL.asm"
]

for input_file in file_list:
    print('\nloading %s' % input_file)
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

    with open(input_file, "r") as asm_file:
        asm_content = asm_file.readlines()

    # symbol pre-processing
    line = 0
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
                print("Parsing original line %s and assigning to line %s" % (instruction, line))
                continue
        line += 1

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

        print("Parsing original line %s: %s" % (line, instruction))

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
                raise Exception("Parsed %s bits worth of instructions (a command): %s >> %s"
                                % (len(address), instruction, address))

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
            elif operation == "D+1":
                binary_line += "011111"
            elif operation == "A+1" or operation == "M+1":
                binary_line += "110111"
            elif operation == "D-1":
                binary_line += "001110"
            elif operation == "A-1" or operation == "M-1":
                binary_line += "110010"
            elif operation == "D+A" or operation == "D+M":
                binary_line += "000010"
            elif operation == "D-A" or operation == "D-M":
                binary_line += "010011"
            elif operation == "A-D" or operation == "M-D":
                binary_line += "000111"
            elif operation == "D&A" or operation == "D&M":
                binary_line += "000000"
            elif operation == "D|A" or operation == "D|M":
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
                raise Exception("Parsed %s bits worth of instructions (c command): %s >> %s" % (len(binary_line), instruction, binary_line))

    with open(input_file.replace(".asm", ".hack"), "w") as output_file:
        with open(input_file.replace(".asm", ".cmp"), "r") as solution_file:
            # dump the result
            for i, (bin_line, sol_line) in enumerate(zip(binary_file, solution_file)):
                print('dumping output: %s' % bin_line)
                output_file.write(bin_line + '\n')
                if bin_line.strip() != sol_line.strip():

                    print('code    : ' + 'ixx a cccccc ddd jjj')
                    print('actual  : ' + bin_line[0:3]+" "+bin_line[3]+" "+bin_line[4:10]+" "+bin_line[10:13]+" "+bin_line[13:])
                    print('correct : ' + sol_line[0:3]+" "+sol_line[3]+" "+sol_line[4:10]+" "+sol_line[10:13]+" "+sol_line[13:])
                    raise Exception('mismatch on line %s' % str(int(i)))

print('\neverything passed!')
