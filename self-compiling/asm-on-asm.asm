// char_map = {
//      " ": 32, "!": 33, '"': 34, '#': 35, '$': 36, '%': 37, '&': 38, "'": 39, "(": 40, ")": 41, "*": 42, "+": 43,
//      ",": 44, "-": 45, ".": 46, "/": 47, "0": 48, "1": 49, "2": 50, "3": 51, "4": 52, "5": 53, "6": 54, "7": 55,
//      "8": 56, "9": 57, ":": 58, ";": 59, "<": 60, "=": 61, ">": 62, "?": 63, "@": 64, "A": 65, "B": 66, "C": 67,
//      "D": 68, "E": 69, "F": 70, "G": 71, "H": 72, "I": 73, "J": 74, "K": 75, "L": 76, "M": 77, "N": 78, "O": 79,
//      "P": 80, "Q": 81, "R": 82, "S": 83, "T": 84, "U": 85, "V": 86, "W": 87, "X": 88, "Y": 89, "Z": 90, "[": 91,
//      "\\": 92, "]": 93, "^": 94, "_": 95, "`": 96, "a": 97, "b": 98, "c": 99, "d": 100, "e": 101, "f": 102, "g": 103,
//      "h": 104, "i": 105, "j": 106, "k": 107, "l": 108, "m": 109, "n": 110, "o": 111, "p": 112, "q": 113, "r": 114,
//      "s": 115, "t": 116, "u": 117, "v": 118, "w": 119, "x": 120, "y": 121, "z": 122, "{": 123, "|": 124, "}": 125,
//      "~": 126, "newline": 128, "backspace": 129, "left_arrow": 130, "up_arrow": 131, "right_arrow": 133, "home": 134,
//      "end": 135, "page_up": 136, "page_down": 137, "insert": 138, "delete": 139, "esc": 140, "f1": 141, "f2": 142,
//      "f3": 143, "f4": 144, "f5": 145, "f6": 146, "f7": 147, "f8": 148, "f9": 149, "f10": 150, "f11": 151, "f12": 152
//  }

// assumptions
    // no white space or empty lines
    // no comments
    // addresses are correctly padded/limited to 16 bits
    // code to read in is appended to end of this program in ROM at start_of_data
    // code is encoded in the Jack string format

// -----------------------------------------------------------------------------------

// reserved keywords/addresses

// address_labels = {
//  "R0": 0, "R1": 1, "R2": 2, "R3": 3, "R4": 4, "R5": 5, "R6": 6, "R7": 7, "R8": 8, "R9": 9, "R10": 10,
//  "R11": 11, "R12": 12, "R13": 13, "R14": 14, "R15": 15, "SCREEN": 16384, "KBD": 24576, "SP": 0, "LCL": 1,
//  "ARG": 2, "THIS": 3, "THAT": 4, "BASE": 15
//  }

// address_labels stored at 16+
// len, n-chars, value

// -----------------------------------------------------------------------------------

@start_of_data // FIXME
D=A
@0
M=D // initialize R0(ptr) as start_of_data

@15
D=A
@4
M=D // initialize R4(code_ptr) as BASE

// for int in instructions
    @0
    A=M // *ptr

    // if a command (instruction[0] == "@")
    @64
    D=A // @
    @0
    A=M
    D=M-D // test *ptr == @

    @0
    M=M+1 // ptr++

    @c_instruction // FIXME
    D;JNE // jump if false

        // if instruction[1].isnumeric() // 48-57
        @48
        D=A
        @0
        A=M
        D=M-D
        @non_numeric // FIXME
        D;JLT // jump if *ptr < 48

        @57
        D=A
        @0
        A=M
        D=M-D
        @non_numeric // FIXME
        D;JGT // jump if *ptr > 57

            // address = instruction[1:]  # assign if literal
            // inc until newline (128)
            @128
            D=A
            @0
            A=M
            D=M-D
            @0
            M=M+1 // ptr++
            @// inc until newline (128) // FIXME
            D;JNE // jump if *ptr != 128

            D=A
            @1
            M=D // R1 = next_instruction

            @2
            M=0 // R2(base10) = 0

            @0
            M=M-1 // ptr--, back to &newline

            // read in from smallest to largest
            @0
            M=M-1 // ptr--, next digit

            @64
            D=A
            @0
            A=M
            D=M-A
            @// write a_instruction to RAM // FIXME
            D;JEQ // jump if *ptr == @

            // TODO: simulate base10 multiplication by looping

            @0
            A=M
            D=M
            @3
            M=M+D // R3(sum) += *ptr

            @// read in from smallest to largest // FIXME
            0;JMP // loop

        // else:
            // temp_label = instruction[1:]
            // if temp_label in address_labels:
                // address = address_labels[temp_label]  # if label has an address, assign address
            // else:
                // address_labels["BASE"] += 1  # if not, increment to next slot on the heap and assign it
                // address = address_labels[temp_label] = address_labels["BASE"]

        // write a_instruction to RAM
        @3
        M=D
        @4
        A=M
        M=D // *R4(code_ptr) = R3(sum)
        @4
        M=M+1 // R4(code_ptr)++

        @1
        D=M
        @0
        M=D // R0(ptr) = R1(next_instruction)

        // TODO: test if next_instruction is eof?

        @// for int in instructions // FIXME
        0;JMP // loop

// if c instruction
    // prefix = instruction[0:2]
    // a/m = instruction[3:3]
    // comp = instruction[4:9]
    // dest = instruction[10:12]
    // jump = instruction[13:15]

// inc ptr
@0
M=M+1




