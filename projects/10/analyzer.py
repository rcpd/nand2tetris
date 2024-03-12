import xml.etree.ElementTree as ET

from xml.dom import minidom


def main(debug=False):
    jack_filepaths = [
        r"ArrayTest\Main.jack",
        # r"ExpressionLessSquare\Main.jack",
        # r"ExpressionLessSquare\Square.jack",
        # r"ExpressionLessSquare\SquareGame.jack",
        # r"Square\Main.jack",
        # r"Square\Square.jack",
        # r"Square\SquareGame.jack"
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

            # if debug:
            #     print("// line:", input_child.tag, element)
            input_list.append((input_child.tag, element))

        # process the token stream
        prev_parent = parent = output_root
        for i, input_tuple in enumerate(input_list):
            j = i+1  # next token

            # function def (+1)
            if j < len(input_list):
                if parent.tag == "class" and input_list[i][0] == "symbol" and input_list[i][1] == "{":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # then inject new token & update parent
                    if debug:
                        print("// insert:", "subroutineDec")
                    child = ET.SubElement(parent, "subroutineDec")
                    prev_parent = parent
                    parent = child

                # populate parameterList for function def
                elif parent.tag == "subroutineDec" and input_list[i][0] == "symbol" and input_list[i][1] == "(":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # then inject new token & update parent
                    if debug:
                        print("// insert:", "parameterList")
                    child = ET.SubElement(parent, "parameterList")
                    prev_parent = parent
                    parent = child

                # close parameterList for function def
                elif parent.tag == "parameterList" and input_list[i][0] == "symbol" and input_list[i][1] == ")":
                    # revert parent then insert current token
                    parent = prev_parent
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
        if debug:
            print("\n%s" % pretty_xml)

        with open(output_filepath, "w") as output_file:
            output_file.write(pretty_xml)


if __name__ == '__main__':
    main(debug=True)
