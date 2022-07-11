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

// history
    // v1: no formatting/comments, hard-coded/manually resolved labels only
    // v2: formatting/comments/label resolution

// assumptions
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

// address_labels stored at BASE+
// len, n-chars, value

// -----------------------------------------------------------------------------------

@BASE
D=A
@R4
M=D // initialize R4(code_ptr) = BASE

@start_of_data // BASE + <len of this program>
D=A
@R0
M=D // initialize R0(ptr) as start_of_data

// -----------------------------------------------------------------------------------

// label pre-scan
// for int in instructions, process labels
    (pre_check_comment)
    @R9
    D=M-1
    @pre_check_newline
    D;JGE // jump if R9(comment_flag) >= 1

    @47
    D=A
    @R0
    A=M
    D=D-M
    @pre_check_newline
    D;JNE // jump if *ptr != "/"

    // comment_found
    @R9
    M=1
    @pre_next
    0;JMP // set R9(comment_flag) and skip

    (pre_check_newline)
    @128
    D=A
    @R0
    A=M
    D=D-M
    @pre_test_label_comment
    D;JNE // jump if *ptr != "newline"

    // newline_found
    @R9
    M=0 // reset R9(comment_flag)

    @R5
    D=M-1
    @pre_close_label
    D;JEQ // jump if R5(label_flag) == 1

    @R10
    D=M-1
    @pre_next
    D;JNE // jump if R10(line_data) != 1

    @R7
    M=M+1 // R7(line_count_t)++ on non-label/comment line

    @R10
    M=0 // reset R10(line_data)

    @pre_next
    0;JMP // continue

    (pre_close_label)
    @R5
    M=0 // R5(label_flag) = 0
    @R6
    D=M // save R6(len)
    M=0 // clear R6(len)
    @R4
    A=A-D
    A=A-1 // code_ptr-len-1 (&label.value)
    M=D // update label.len
    @R7
    D=M // R7(line_count_t)
    @R8
    M=M+1 // R8(label_count)++
    @R4
    M=D // *code_ptr(label.value) = line_count
    @pre_next
    0;JMP // continue

    (pre_test_label_comment)
    @R9
    D=M-1
    @pre_next
    D;JGE // jump if R9(comment_flag) >= 1

    @R5
    D=M-1
    @pre_check_right_bracket
    D;JEQ // jump if R5(label_flag) == 1

    // pre_check_left_bracket
    @40
    D=A
    @R0
    A=M
    D=D-M
    @pre_new_label
    D;JEQ // jump if *ptr == "("

    // non_comment_label
    @R10
    M=1 // set R10(line_data)

    (pre_new_label)
    @R5
    M=1 // R5(label_flag)
    @pre_next
    0;JMP // continue

    (pre_check_right_bracket)
    @41
    D=A
    @R0
    A=M
    D=D-M
    @pre_next
    D;JEQ // jump if *ptr == ")"

    // pre_append_label
    @R0
    A=M
    D=M
    @R4
    A=M
    M=D // *code_ptr = *ptr
    @R4
    M=M+1 // code_ptr++
    @R6
    M=M+1 // len++

    (pre_next)
    @R0
    M=M+1 // ptr++

    // pre_test_eof
    @32767
    D=A
    @R0
    A=M
    D=D-M
    @pre_check_newline
    D;JNE // loop until exhausted then fall through

// -----------------------------------------------------------------------------------

// for int in instructions
    (check_comment_flag)
    @R9
    D=M-1
    @skip_to_newline
    D;JGE // jump if R9(comment_flag) >= 1
    
    // check_label_flag
    @R5
    D=M-1
    @skip_to_newline
    D;JEQ // jump if R5(label_flag) == 1
    
    // check_left_bracket
    @40
    D=A
    @R0
    A=M
    D=D-M
    @check_slash
    D;JNE // jump if *ptr != "("
    
    // label_found
    @R5
    M=1 // set R5(label_flag)
    @next
    0;JMP // continue
    
    (check_slash)
    @47
    D=A
    @R0
    A=M
    D=D-M
    @check_newline
    D;JNE // jump if *ptr != "/"

    // comment_found
    @R9
    M=1
    @next
    0;JMP // set R9(comment_flag) and skip
    
    (check_newline)
    @128
    D=A
    @R0
    A=M
    D=D-M
    @check_c_flag
    D;JNE // jump if *ptr != "newline"
    
    @newline_found
    0;JMP // jump to common handling    
    
    (skip_to_newline)
    @128
    D=A
    @R0
    A=M
    D=D-M
    @next
    D;JNE // jump if *ptr != "newline"

    (newline_found)
    @R5
    M=0 // reset R5(label_flag)
    @R9
    M=0 // reset R9(comment_flag)
    
    @R0
    D=M
    @R1
    M=D+1 // R1(next_instruction) = R0(ptr)+1

    @next
    0;JMP // continue

    (check_c_flag)
    @R7
    D=M-1
    @c_instruction
    D;JEQ // jump if R7(c_flag_t) == 1

    (check_a_flag)
    @R11
    D=M-1
    @a_instruction
    D;JEQ // jump if R11(a_flag_t) == 1

    // if neither, test for a instruction

    (test_a)
    // if a command (instruction[0] == "@")
    @64
    D=A
    @R0
    A=M
    D=M-D // test *ptr == @

    @R0
    M=M+1 // ptr++

    @set_c_instruction
    D;JNE // jump if instruction[0] != "@"

    // set_a_instruction
    @R11
    M=1 // R11(a_flag_t) = 1

    (a_instruction) // if instruction[1].isnumeric() // 48-57
    @48
    D=A
    @R0
    A=M
    D=M-D
    @nan
    D;JLT // jump if *ptr < 48

    @57
    D=A
    @R0
    A=M
    D=M-D
    @nan
    D;JGT // jump if *ptr > 57

    // address = instruction[1:]  # assign if literal

    (a_check_newline)
    // advance until newline
    @128
    D=A
    @R0
    A=M
    D=M-D
    @R0
    M=M+1 // ptr++
    @a_check_newline
    D;JNE // jump if *ptr != newline (128)

    @R2
    M=0 // reset R2(base10_t)
    @R5
    M=0 // reset R5(base10_count_t)

    @R0
    M=M-1 // ptr--, back to &newline

    (a_rev_read) // loop through digits smallest to largest
    @R0
    M=M-1 // ptr--, next digit

    @64
    D=A
    @R0
    A=M
    D=M-A
    @a_write
    D;JEQ // jump if *ptr == @
    
    @R2
    M=M+1 // R2(base10_t)++

    // simulate base10_t multiplication by looping
    
    // init base10_count_t
    @R5
    M=1

    @R2
    D=M-1
    @a_start_base10
    D;JEQ // jump if R2(base10_t) == 1
    
    @10
    D=A
    @R5
    M=D
    
    @R2
    D=M
    @2
    D=D-A
    @a_start_base10
    D;JEQ // jump if R2(base10_t) == 2
    
    @100
    D=A
    @R5
    M=D
    
    @R2
    D=M
    @3
    D=D-A
    @a_start_base10
    D;JEQ // jump if R2(base10_t) == 3
    
    @1000
    D=A
    @R5
    M=D
    
    @R2
    D=M
    @4
    D=D-A
    @a_start_base10
    D;JEQ // jump if R2(base10_t) == 4
    
    @10000
    D=A
    @R5
    M=D
    
    @R2
    D=M
    @5
    D=D-A
    @a_start_base10
    D;JEQ // jump if R2(base10_t) == 5
    
    (a_start_base10)
    
    // cumulative sum
    @R0
    A=M
    D=M // *ptr
    @R3
    M=M+D // R3(sum_t) += *ptr

    @R5
    M=M-1 // R5(base10_count_t)--
    D=M
    @a_start_base10
    D;JNE // jump if R5(base10_count_t) != 0

    @a_rev_read
    0;JMP // loop to next char

    // else:
        // temp_label = instruction[1:]
        // if temp_label in address_labels:
            // address = address_labels[temp_label]  # if label has an address, assign address
        // else:
            // address_labels["BASE"] += 1  # if not, increment to next slot on the heap and assign it
            // address = address_labels[temp_label] = address_labels["BASE"]

    (a_write)
    @R3
    M=D
    @R4
    A=M
    M=D // *R4(code_ptr) = R3(sum_t)
    @R4
    M=M+1 // R4(code_ptr)++

    @next
    0;JMP // continue

    // else c instruction

    (set_c_instruction)
    @R7
    M=1 // R7(c_flag_t) = 1

    // prefix = instruction[0:2], first 3 bits always set
    @57344
    D=A
    @R3
    M=D // R3(sum_t) = 1110 0000 0000 0000

    (c_instruction)
    // comp = instruction[4:9]
    // dest = instruction[10:12]
    // jump = instruction[13:15]

    (next)
    @R1
    D=M
    @R0
    M=D // R0(ptr) = R1(next_instruction) // TODO: test if next_instruction is eof?
    @check_comment_flag
    0;JMP // continue

(eof)
@eof
0;JMP // halt




