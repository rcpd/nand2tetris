
import re


def parse(word, keyword, strings, output):
    keywords = ['class', 'constructor', 'function', 'method', 'field', 'static', 'var', 'int', 'char', 'boolean',
                'void', 'true', 'false', 'null', 'this', 'let', 'do', 'if', 'else', 'while', 'return']
    symbols = ['{', '}', '(', ')', '[', ']', '.', ',', ';', '+', '-', '*', '/', '&', '|', '<', '>', '=', '~', '"']
    types = ["Array"]

    # process string_constant placeholders
    if re.match(r"__string\d+__", word):
        print("<stringConstant> %s </stringConstant>" % strings[word])
        output.append("<stringConstant> %s </stringConstant>" % strings[word])
        return output, keyword

    # process symbols that have been parsed to single word
    if word in symbols:
        print("<symbol> %s </symbol>" % word.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
        output.append("<symbol> %s </symbol>" % word.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
        if word == ";":
            keyword = False  # disable once identifier(s) processed
        return output, keyword

    # search for symbols in word
    else:
        for i, char in enumerate(word):
            if char in symbols:
                if i == 0:  # can't slice [0:0]
                    output, keyword = parse(word[0], keyword, strings, output)  # process symbol
                    output, keyword = parse(word[1:], keyword, strings, output)
                else:
                    if word[:i]:
                        output, keyword = parse(word[:i], keyword, strings, output)  # process word prior to symbol
                        word = word[i:]  # truncate word to symbol char onwards
                        output, keyword = parse(word[0], keyword, strings, output)  # process symbol
                    if word[1:]:  # slices return '' if out of bounds
                        output, keyword = parse(word[1:], keyword, strings, output)  # any remaining word data
                return output, keyword

    # process regular words (no symbols)
    if word:  # word might be '' after slicing
        if word.isnumeric():
            print("<integerConstant> %s </integerConstant>" % word)
            output.append("<integerConstant> %s </integerConstant>" % word)
        elif word in types:
            print("<identifier> %s </identifier>" % word)
            output.append("<identifier> %s </identifier>" % word)
        elif keyword and word not in keywords:
            print("<identifier> %s </identifier>" % word)
            output.append("<identifier> %s </identifier>" % word)
        elif word in keywords:
            print("<keyword> %s </keyword>" % word)
            output.append("<keyword> %s </keyword>" % word)
            keyword = word  # set until corresponding identifier processed

    return output, keyword


def main():
    jack_filepaths = [
        r"ArrayTest\Main.jack",
        r"ExpressionLessSquare\Main.jack",
        r"ExpressionLessSquare\Square.jack",
        r"ExpressionLessSquare\SquareGame.jack",
        r"Square\Main.jack",
        r"Square\Square.jack",
        r"Square\SquareGame.jack"
    ]

    for filepath in jack_filepaths:
        with open(filepath) as jack_file:
            jack_content = jack_file.readlines()

        block_comment = False
        output = []
        print("<tokens>")
        output.append("<tokens>")
        strings = {}
        string_id = 0

        for line in jack_content:
            line = line.strip()
            if line == "" or line.startswith("//"):
                continue
            elif "/*" in line:
                if "*/" not in line:
                    block_comment = True
                continue
            elif "*/" in line:
                block_comment = False
                continue

            if block_comment:
                continue

            print("// line:", line)
            line = line.split("//")[0].strip()

            # string_constant parsing
            if '"' in line:
                string_line = line.split('"')
                for i in range(0, len(string_line), 3):
                    substring = string_line[i+1]
                    strings["__string%s__" % string_id] = substring
                    line = line.replace(substring, " __string%s__ " % string_id)
                    string_id += 1

                while '"' in line:
                    line = line.replace('"', '')
                print("// line post-replace:", line)

            words = line.split()
            keyword = False
            print("// words:", words)

            for word in words:
                output, keyword = parse(word, keyword, strings, output)

        print("</tokens>")
        output.append("</tokens>")
        with open(filepath.replace(".jack", "T_out.xml"), "w") as output_file:
            for line in output:
                output_file.write(line + "\n")


if __name__ == '__main__':
    main()
