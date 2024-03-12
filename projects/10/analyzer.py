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
        for input_child in input_root:
            if input_child.tag == "tokens":
                continue
            element = input_child.text.strip()

            if debug:
                print("// line:", input_child.tag, element)

        # initialize root
        output_root = None
        # check if current element is first written
        if output_root is None:
            parent = output_root = ET.Element("element")
        else:
            parent = ET.SubElement(output_root, "element")

        child = ET.SubElement(parent, "child")
        child.text = "child_text"

        # write output
        tree_string = ET.tostring(output_root)
        raw_xml = minidom.parseString(tree_string)
        pretty_xml = raw_xml.toprettyxml(indent="  ").replace(r'<?xml version="1.0" ?>'+"\n", '')
        output_filepath = filepath.replace(".jack", "_out.xml")
        print("Writing: %s" % output_filepath)
        if debug:
            print("\n%s" % pretty_xml)

        # with open(output_filepath, "w") as output_file:
        #     output_file.write(pretty_xml)


if __name__ == '__main__':
    main(debug=True)
