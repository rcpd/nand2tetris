"""
From the *T_out.xml produced by the tokenizer add additional metadata, prettify it and write it to *_out.xml
Where available the solution files are *.xml (i.e. not *_out.xml)
"""

import xml.etree.ElementTree as Et
import os

from xml.dom import minidom


def find_parent(tree, node):
    """
    Draw a map of the tree and yield the parent from node
    """
    parent_map = {c: p for p in tree.iter() for c in p}
    return parent_map[node]


def find_ancestor(tree, node, ancestors):
    """
    Draw a map of the tree and yield the parent from node until ancestor is found
    """
    if node.tag not in ancestors:
        parent_map = {c: p for p in tree.iter() for c in p}
        while parent_map[node].tag not in ancestors:
            node = parent_map[node]
    return node


def main(filepath, debug=False):
    operators = ['+', '-', '*', '/', '&', '|', '<', '>', '~']

    input_tree = Et.parse(filepath.replace(".jack", "T_out.xml"))
    input_root = input_tree.getroot()
    output_root = Et.Element("class")
    input_list = []

    # read the token XML into something else more easily traversed
    for input_child in input_root:
        if input_child.tag == "tokens":
            continue
        element = input_child.text[1:-1]  # strip the outermost padding
        input_list.append((input_child.tag, element))

    # process the token stream
    parent = output_root
    for i, input_tuple in enumerate(input_list):
        j = i+1  # next token

        if debug:
            print("// line:", input_tuple[0], input_tuple[1])

        # process tokens
        try:
            # close decs/expressions/statements ;
            # varDec/classVarDec, term/expression, letStatement/doStatement/returnStatement
            if input_list[i][0] == "symbol" and input_list[i][1] == ";":
                if parent.tag in ("term", "expression"):
                    # close parent until all desired tags closed
                    for tag in ("term", "expression"):
                        if tag == parent.tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # if required close letStatement/doStatement after ;
                    if parent.tag in ("letStatement", "doStatement", "returnStatement"):
                        parent = find_parent(output_root, parent)

                elif parent.tag in ("varDec", "classVarDec", "doStatement", "returnStatement"):
                    # insert current token and update parent
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                    parent = find_parent(output_root, parent)

            # open class definition: class className {
            elif input_list[i][0] == "keyword" and input_list[i][1] == "class":
                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # open subroutineDec
            elif parent.tag == "class" and input_list[i][0] == "keyword" \
                    and input_list[i][1] in ("function", "method", "constructor"):
                # insert new token and update parent
                parent = Et.SubElement(parent, "subroutineDec")

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # open classVarDec
            elif parent.tag == "class" and input_list[i][0] == "keyword"\
                    and input_list[i][1] not in ("function", "method", "constructor"):
                # only process if there are elements to add
                if not (input_list[j][0] == "keyword" and input_list[j][1] in
                        ("function", "method", "constructor")):
                    # insert new token and update parent
                    parent = Et.SubElement(parent, "classVarDec")

                    # insert current token
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

            # open varDec
            elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                # insert new token and update parent
                parent = Et.SubElement(parent, "varDec")

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close statements/whileStatement/subroutineBody/subroutineDec }
            elif parent.tag in ("statements", "whileStatement", "ifStatement", "subroutineBody") \
                    and input_list[i][0] == "symbol" and input_list[i][1] == "}":

                if parent.tag == "statements":
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                if parent.tag == "ifStatement":
                    # don't close if } followed by else
                    if not (input_list[j][0] == "keyword" and input_list[j][1] == "else"):
                        parent = find_parent(output_root, parent)

                if parent.tag == "whileStatement":
                    # close parent
                    parent = find_parent(output_root, parent)

                if parent.tag == "subroutineBody":
                    # close parent(s)
                    parent = find_parent(output_root, parent)
                    parent = find_parent(output_root, parent)  # subroutineDec

            # close expression (nested in term)
            elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i][1] in "]" \
                    and find_parent(output_root, find_parent(output_root, parent)).tag == "term":
                # close parent until all tags closed
                for tag in ("term", "expression", "expressionList"):
                    if tag == parent.tag:
                        parent = find_parent(output_root, parent)

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close term/expression/expressionList ) or ]
            elif parent.tag in ("term", "expression", "expressionList") \
                    and input_list[i][0] == "symbol" and input_list[i][1] in (")", "]"):
                # close parent until all tags closed
                for tag in ("term", "expression", "expressionList"):
                    while tag == parent.tag:
                        parent = find_parent(output_root, parent)

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close term: symbols except ". ( [ , -"
            elif parent.tag == "term" and input_list[i][0] == "symbol" \
                    and input_list[i][1] not in (".", "(", "[", ",", "-"):
                # close parent and insert current token
                parent = find_parent(output_root, parent)
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close term: unless symbol is "-" and is referring to a negative term
            elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i-1][0] == "symbol" \
                    and input_list[i][1] == "-" and input_list[i-1][1] not in ("[", "(", ","):
                # close parent and insert current token
                parent = find_parent(output_root, parent)
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close term: "-" if preceded by a variable or literal
            elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i][1] == "-" \
                    and input_list[i-1][0] in ("identifier", "integerConstant"):
                # close parent and insert current token
                parent = find_parent(output_root, parent)
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]
                
            # close/open term/expression: ","
            elif parent.tag == "term" and input_tuple == ("symbol", ","):
                # close parents and insert current token
                parent = find_parent(output_root, parent)
                parent = find_parent(output_root, parent)
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

                # insert new tokens and update parents
                parent = Et.SubElement(parent, "expression")
                parent = Et.SubElement(parent, "term")

            # open expression/expressionList
            elif (input_list[i][0] == "symbol" and input_list[i][1] == "=") \
                or (parent.tag in ("expression", "term", "letStatement", "whileStatement", "doStatement",
                    "ifStatement") and input_list[i][0] == "symbol" and input_list[i][1] in ("(", "[")):

                if parent.tag != "expression":
                    # insert current token
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if parent.tag not in ("letStatement", "whileStatement", "ifStatement") \
                            and input_list[i][1] != "[":
                        # test if already part of expressionList
                        # term > expression > expressionList
                        if parent.tag == "term":
                            grandparent = find_parent(output_root, parent)
                            if grandparent.tag == "expression":
                                great_grandparent = find_parent(output_root, grandparent)
                                if great_grandparent.tag == "expressionList":
                                    # insert new token and update parent
                                    parent = Et.SubElement(parent, "expression")
                                    continue

                        parent = Et.SubElement(parent, "expressionList")

                    # insert new token and update parent
                    parent = Et.SubElement(parent, "expression")
                else:
                    # insert new token and update parent
                    parent = Et.SubElement(parent, "term")

                    # insert current token
                    child = Et.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
                    parent = Et.SubElement(parent, "expression")

            # open expression (return)
            elif parent.tag == "returnStatement" and input_tuple != ("keyword", "return"):
                # insert new tokens and update parents
                parent = Et.SubElement(parent, "expression")
                parent = Et.SubElement(parent, "term")

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # open term / nested term
            elif parent.tag == "expression":
                # insert new token and update parent
                parent = Et.SubElement(parent, "term")

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

                if input_list[i][0] == "symbol" and input_list[i][1] in operators:
                    # insert new token and update parent
                    parent = Et.SubElement(parent, "term")

            # open statements (letStatement/doStatement/whileStatement/ifStatement)
            elif input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return"):
                # if required insert statements & update parent
                if parent.tag != "statements":
                    # insert new token and update parent
                    parent = Et.SubElement(parent, "statements")

                # insert new token and update parent
                parent = Et.SubElement(parent, input_list[i][1]+"Statement")

                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

            # close parameterList
            elif parent.tag == "parameterList" and input_list[i][0] == "symbol" and input_list[i][1] == ")":
                # close parent and insert current token
                parent = find_parent(output_root, parent)
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

                # insert new token and update parent
                parent = Et.SubElement(parent, "subroutineBody")

            # open parameterList
            elif parent.tag == "subroutineDec" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                # insert current token
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

                # insert new token and update parent
                parent = Et.SubElement(parent, "parameterList")

            # insert current token"
            else:
                child = Et.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

        except IndexError:
            if j == len(input_list):
                pass  # can't eval look-ahead rules from last token
            else:
                raise

    # write/check output
    output_filepath = filepath.replace(".jack", "_out.xml")
    match_filepath = filepath.replace(".jack", ".xml")
    tree_string = Et.tostring(output_root).strip()
    raw_xml = minidom.parseString(tree_string)
    pretty_xml = raw_xml.toprettyxml(indent="  ").replace(r'<?xml version="1.0" ?>'+'\n', '')

    print("Analyzed: %s" % output_filepath)
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

        # current
        # r"..\11\ConvertToBin\Main.jack",
    ]

    for _filepath in jack_filepaths:
        main(_filepath, debug=False)
