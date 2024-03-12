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

            # TODO: debug
            try:
                if input_list[i-2][1] == "HOW MANY NUMBERS?":
                    print("bp")
            except IndexError:
                pass

            if debug:
                print("// line:", input_tuple[0], input_tuple[1])

            if j < len(input_list):
                # open subroutineDec
                if parent.tag == "class" and input_list[j][0] == "keyword" and input_list[j][1] == "function":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "subroutineDec")

                # close varDec
                elif parent.tag == "varDec" and input_list[i][0] == "symbol" and input_list[i][1] == ";":
                    # insert current token and close parent
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                    parent = find_parent(output_root, parent)

                # open varDec
                elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                    # insert new token and update parent
                    parent = ET.SubElement(parent, "varDec")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                
                # close statements/whileStatement }
                elif parent.tag in ("statements", "whileStatement") and input_list[i][0] == "symbol" \
                    and input_list[i][1] == "}":
                    if parent.tag == "statements":
                        # close parent and insert current token
                        parent = find_parent(output_root, parent)
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                    if parent.tag == "whileStatement":
                        # close parent
                        parent = find_parent(output_root, parent)
                
                # close expression (nested in term)
                elif parent.tag == "term" and input_list[i][0] == "symbol" and input_list[i][1] in "]" \
                    and find_parent(output_root, find_parent(output_root, parent)).tag == "term":
                    # close parent until all tags closed
                    for tag in ("term", "expression", "expressionList"):
                        if parent.tag == tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                
                # close term/expression/expressionList ) or ]
                elif parent.tag in ("term", "expression", "expressionList") \
                    and input_list[i][0] == "symbol" and input_list[i][1] in (")", "]"):
                    # close parent until all tags closed
                    for tag in ("term", "expression", "expressionList"):
                        if parent.tag == tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close term/expression/letStatement ;
                elif parent.tag in ("term", "expression") and input_list[i][0] == "symbol" and input_list[i][1] == ";":
                    # close parent until all desired tags closed
                    for k in range(0, 2):
                        if parent.tag in ("term", "expression"):
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # if required close letStatement/doStatement after ;
                    if parent.tag in ("letStatement", "doStatement"):  #
                        parent = find_parent(output_root, parent)

                # close term: symbols except "." and "("
                elif parent.tag == "term" and input_list[i][0] == "symbol" \
                    and input_list[i][1] not in (".", "(", "["):
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open expression/expressionList
                elif (input_list[i][0] == "symbol" and input_list[i][1] == "=") \
                    or (parent.tag in ("term", "letStatement", "whileStatement", "doStatement")
                        and input_list[i][0] == "symbol" and input_list[i][1] in ("(", "[")):
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if parent.tag not in ("letStatement", "whileStatement") and input_list[i][1] != "[":
                        parent = ET.SubElement(parent, "expressionList")

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "expression")

                # open term
                elif parent.tag == "expression" and \
                        input_list[i][0] in ("identifier", "stringConstant", "integerConstant"):
                    # insert new token and update parent
                    parent = ET.SubElement(parent, "term")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open letStatement/doStatement/whileStatement
                elif input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while"):
                    # if required insert statements & update parent
                    if parent.tag != "statements":
                        # insert new token and update parent
                        parent = ET.SubElement(parent, "statements")

                    # insert new token and update parent
                    parent = ET.SubElement(parent, input_list[i][1]+"Statement")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close parameterList
                elif parent.tag == "parameterList" and input_list[i][0] == "symbol" and input_list[i][1] == ")":
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "subroutineBody")

                # open parameterList
                elif parent.tag == "subroutineDec" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new token and update parent
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
