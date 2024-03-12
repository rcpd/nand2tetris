"""
From a JACK source file tokenize every word/symbol in the source file into the *T_out.xml
Where available the solution files are *T.xml (i.e. not *T_out.xml)
"""

import xml.etree.ElementTree as ET
import re
import os

from xml.dom import minidom


def parse(word, keyword, strings, tokens, debug=False):
    keywords = ['class', 'constructor', 'function', 'method', 'field', 'static', 'var', 'int', 'char', 'boolean',
                'void', 'true', 'false', 'null', 'this', 'let', 'do', 'if', 'else', 'while', 'return']
    symbols = ['{', '}', '(', ')', '[', ']', '.', ',', ';', '+', '-', '*', '/', '&', '|', '<', '>', '=', '~', '"']
    types = ["Array"]

    # process string_constant placeholders
    if re.match(r"__string\d+__", word):
        if debug:
            print("<stringConstant> %s </stringConstant>" % strings[word])
        child = ET.SubElement(tokens, 'stringConstant')
        child.text = " %s " % strings[word]
        return tokens, keyword

    # process symbols that have been parsed to single word
    if word in symbols:
        if debug:
            print("<symbol> %s </symbol>" % word.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))
        child = ET.SubElement(tokens, 'symbol')
        child.text = " %s " % word  # etree will escape
        if word == ";":
            keyword = False  # disable once identifier(s) processed
        return tokens, keyword

    # search for symbols in word
    else:
        for i, char in enumerate(word):
            if char in symbols:
                if i == 0:  # can't slice [0:0]
                    tokens, keyword = parse(word[0], keyword, strings, tokens, debug=debug)  # process symbol
                    tokens, keyword = parse(word[1:], keyword, strings, tokens, debug=debug)
                else:
                    if word[:i]:
                        tokens, keyword = parse(word[:i], keyword, strings, tokens,
                                                debug=debug)  # process word prior to symbol
                        word = word[i:]  # truncate word to symbol char onwards
                        tokens, keyword = parse(word[0], keyword, strings, tokens, debug=debug)  # process symbol
                    if word[1:]:  # slices return '' if out of bounds
                        tokens, keyword = parse(word[1:], keyword, strings, tokens,
                                                debug=debug)  # any remaining word data
                return tokens, keyword

    # process regular words (no symbols)
    if word:  # word might be '' after slicing
        if word.isnumeric():
            if debug:
                print("<integerConstant> %s </integerConstant>" % word)
            child = ET.SubElement(tokens, 'integerConstant')
            child.text = " %s " % word
        elif word in types:
            if debug:
                print("<identifier> %s </identifier>" % word)
            child = ET.SubElement(tokens, 'identifier')
            child.text = " %s " % word
        elif keyword and word not in keywords:
            if debug:
                print("<identifier> %s </identifier>" % word)
            child = ET.SubElement(tokens, 'identifier')
            child.text = " %s " % word
        elif word in keywords:
            if debug:
                print("<keyword> %s </keyword>" % word)
            child = ET.SubElement(tokens, 'keyword')
            child.text = " %s " % word
            keyword = word  # set until corresponding identifier processed

    return tokens, keyword


def main(filepath, debug=False):
    with open(filepath) as jack_file:
        jack_content = jack_file.readlines()

    block_comment = False
    strings = {}
    string_id = 0
    tokens = ET.Element("tokens")

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

        if debug:
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
            if debug:
                print("// line post-replace:", line)

        words = line.split()
        keyword = False
        if debug:
            print("// words:", words)

        for word in words:
            tokens, keyword = parse(word, keyword, strings, tokens, debug=debug)

    # write/check output
    output_filepath = filepath.replace(".jack", "T_out.xml")
    match_filepath = filepath.replace(".jack", "T.xml")
    tree_string = ET.tostring(tokens)
    raw_xml = minidom.parseString(tree_string)
    pretty_xml = raw_xml.toprettyxml(indent="").replace(r'<?xml version="1.0" ?>', '').strip()
    pretty_xml += "\n"

    print("Tokenized: %s" % output_filepath)
    if debug:
        print(pretty_xml)

    with open(output_filepath, "w") as output_file:
        output_file.write(pretty_xml)

    if os.path.exists(match_filepath):
        with open(match_filepath, "r") as match_file:
            match_contents = match_file.read()

        if match_contents != pretty_xml:
            raise RuntimeError("%s did not match solution file" % output_file)


if __name__ == '__main__':
    jack_filepaths = [
        r"..\09\Average\Main.jack",
        r"..\09\Fraction\Main.jack",
        r"..\09\Fraction\Fraction.jack",
        r"..\09\HelloWorld\Main.jack",
        r"..\09\List\Main.jack",
        r"..\09\List\List.jack",
        r"..\09\Square\Main.jack",
        r"..\09\Square\Square.jack",
        r"..\09\Square\SquareGame.jack",

        r"..\10\ArrayTest\Main.jack",
        # r"..\10\ExpressionLessSquare\Main.jack",  # nonsense code that doesn't / shouldn't compile or run
        # r"..\10\ExpressionLessSquare\Square.jack",  # nonsense code that doesn't / shouldn't compile or run
        # r"..\10\ExpressionLessSquare\SquareGame.jack",  # nonsense code that doesn't / shouldn't compile or run
        r"..\10\Square\Main.jack",
        r"..\10\Square\Square.jack",
        r"..\10\Square\SquareGame.jack",

        r"..\11\Average\Main.jack",
        r"..\11\ComplexArrays\Main.jack",
        r"..\11\ConvertToBin\Main.jack",
        r"..\11\Pong\Ball.jack",
        r"..\11\Pong\Bat.jack",
        r"..\11\Pong\Main.jack",
        r"..\11\Pong\PongGame.jack",
        r"..\11\Seven\Main.jack",
        r"..\11\Square\Main.jack",
        r"..\11\Square\Square.jack",
        r"..\11\Square\SquareGame.jack",
    ]

    for _filepath in jack_filepaths:
        main(_filepath, debug=False)
