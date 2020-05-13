import xml.etree.ElementTree as ET

from xml.dom import minidom


def find_parent(tree, node):
    parent_map = {c: p for p in tree.iter() for c in p}
    return parent_map[node]


def main(debug=False):
    jack_filepaths = [
        r"ArrayTest\Main.jack",
        r"ExpressionLessSquare\Main.jack",
        r"ExpressionLessSquare\Square.jack",
        r"ExpressionLessSquare\SquareGame.jack",
        r"Square\Main.jack",
        r"Square\Square.jack",
        r"Square\SquareGame.jack"
    ]

    output = []

    for filepath in jack_filepaths:
        input_tree = ET.parse(filepath.replace(".jack", "T_out.xml"))
        input_root = input_tree.getroot()
        output_root = ET.Element("class")
        input_list = []

        # read the token XML into something else more easily traversed
        for input_child in input_root:
            if input_child.tag == "tokens":
                continue
            element = input_child.text.strip()
            input_list.append((input_child.tag, element))

        # process the token stream
        parent = output_root
        for i, input_tuple in enumerate(input_list):
            j = i+1  # next token

            if debug:
                print("// line:", input_tuple[0], input_tuple[1])

            if j < len(input_list):
                # open subroutineDec (function def)  # TODO: how to close?
                if parent.tag == "class" and input_list[j][0] == "keyword" and input_list[j][1] == "function":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # inject new token & update parent
                    if debug:
                        print("// insert:", "subroutineDec")
                    parent = ET.SubElement(parent, "subroutineDec")

                # close varDec/letStatement
                elif parent.tag in ("varDec", "letStatement") \
                    and input_list[i][0] == "symbol" and input_list[i][1] == ";":
                    # insert current token and revert parent
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                    parent = find_parent(output_root, parent)

                # open varDec
                elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                    # inject new token & update parent
                    if debug:
                        print("// insert:", "varDec")
                    parent = ET.SubElement(parent, "varDec")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open expression
                elif input_list[i][0] == "symbol" and input_list[i][1] == "=":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # inject expression & update parent(s)
                    parent = ET.SubElement(parent, "expression")

                # open expressionList
                elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # inject expressionList > expression > term & update parent(s)
                    parent = ET.SubElement(parent, "expressionList")
                    parent = ET.SubElement(parent, "expression")

                # open term
                elif parent.tag == "expression" and \
                        input_list[i][0] in ("identifier", "stringConstant", "integerConstant"):
                    # inject term
                    parent = ET.SubElement(parent, "term")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # read ahead and revert parent only if single term
                    if input_list[j][0] != "symbol" or (input_list[j][0] == "symbol" and input_list[j][1] == ")"):
                        parent = find_parent(output_root, parent)

                # open letStatement/doStatement/whileStatement  # TODO: how to close do/while statement?
                elif input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while"):
                    # if required inject statements & update parent
                    if parent.tag != "statements":
                        # inject new token & update parent
                        if debug:
                            print("// insert:", "statements")
                        parent = ET.SubElement(parent, "statements")

                    # inject letStatement & update parent
                    parent = ET.SubElement(parent, input_list[i][1]+"Statement")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close parameterList
                elif parent.tag == "parameterList" and input_list[i][0] == "symbol" and input_list[i][1] == ")":
                    # revert parent then insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # populate subroutineBody for function def
                    # inject new token & update parent
                    if debug:
                        print("// insert:", "subroutineBody")
                    parent = ET.SubElement(parent, "subroutineBody")

                # populate parameterList for function def
                elif parent.tag == "subroutineDec" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # inject new token & update parent
                    if debug:
                        print("// insert:", "parameterList")
                    parent = ET.SubElement(parent, "parameterList")

                # insert current token
                else:
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

            # insert current token
            else:
                child = ET.SubElement(parent, input_tuple[0])
                child.text = " %s " % input_tuple[1]

        # write output
        tree_string = ET.tostring(output_root)
        raw_xml = minidom.parseString(tree_string)
        pretty_xml = raw_xml.toprettyxml(indent="  ").replace(r'<?xml version="1.0" ?>'+"\n", '')
        output_filepath = filepath.replace(".jack", "_out.xml")
        print("Writing: %s" % output_filepath)

        # if debug:
        print("\n%s" % pretty_xml)

        with open(output_filepath, "w") as output_file:
            output_file.write(pretty_xml)


if __name__ == '__main__':
    main(debug=True)
