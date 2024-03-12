import xml.etree.ElementTree as ET

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
                if input_list[i-2][1] == "(" and input_list[i-1][1] == "x" and input_list[i][1] == ",":
                    print("bp")
            except IndexError:
                pass

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
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                        # if required close letStatement/doStatement after ;
                        if parent.tag in ("letStatement", "doStatement", "returnStatement"):
                            parent = find_parent(output_root, parent)

                    elif parent.tag in ("varDec", "classVarDec", "doStatement", "returnStatement"):
                        # insert current token and update parent
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]
                        parent = find_parent(output_root, parent)

                # open class definition: class className {
                elif input_list[i][0] == "keyword" and input_list[i][1] == "class":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                elif input_list[i-1][0] == "keyword" and input_list[i-1][1] == "class":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]
                elif input_list[i-2][0] == "keyword" and input_list[i-2][1] == "class":
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open subroutineDec
                elif parent.tag == "class" and input_list[i][0] == "keyword" \
                    and input_list[i][1] in ("function", "method", "constructor"):
                    # insert new token and update parent
                    parent = ET.SubElement(parent, "subroutineDec")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open classVarDec
                elif parent.tag == "class" and input_list[i][0] == "keyword"\
                    and input_list[i][1] not in ("function", "method", "constructor"):
                    # only process if there are elements to add
                    if not (input_list[j][0] == "keyword" and input_list[j][1] in
                            ("function", "method", "constructor")):
                        # insert new token and update parent
                        parent = ET.SubElement(parent, "classVarDec")

                        # insert current token
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]
                    else:
                        # insert current token
                        child = ET.SubElement(parent, input_tuple[0])
                        child.text = " %s " % input_tuple[1]

                # open varDec
                elif input_list[i][0] == "keyword" and input_list[i][1] == "var":
                    # insert new token and update parent
                    parent = ET.SubElement(parent, "varDec")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close statements/whileStatement/subroutineBody/subroutineDec }
                elif parent.tag in ("statements", "whileStatement", "ifStatement", "subroutineBody") \
                    and input_list[i][0] == "symbol" and input_list[i][1] == "}":

                    if parent.tag == "statements":
                        # close parent and insert current token
                        parent = find_parent(output_root, parent)
                        child = ET.SubElement(parent, input_tuple[0])
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
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close term/expression/expressionList ) or ]
                elif parent.tag in ("term", "expression", "expressionList") \
                    and input_list[i][0] == "symbol" and input_list[i][1] in (")", "]"):
                    # close parent until all tags closed
                    for tag in ("term", "expression", "expressionList"):
                        if tag == parent.tag:
                            parent = find_parent(output_root, parent)

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close term: symbols except "." and "("
                elif parent.tag == "term" and input_list[i][0] == "symbol" \
                    and input_list[i][1] not in (".", "(", "[", ","):
                    # close parent and insert current token
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # close/open term/expression: ,
                elif parent.tag == "term" and input_tuple == ("symbol", ","):
                    # close parents and insert current token
                    parent = find_parent(output_root, parent)
                    parent = find_parent(output_root, parent)
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    # insert new tokens and update parents
                    parent = ET.SubElement(parent, "expression")
                    parent = ET.SubElement(parent, "term")

                # open expression/expressionList
                elif (input_list[i][0] == "symbol" and input_list[i][1] == "=") \
                    or (parent.tag in ("term", "letStatement", "whileStatement", "doStatement", "ifStatement")
                        and input_list[i][0] == "symbol" and input_list[i][1] in ("(", "[")):
                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                    if parent.tag not in ("letStatement", "whileStatement", "ifStatement") and input_list[i][1] != "[":
                        parent = ET.SubElement(parent, "expressionList")

                    # insert new token and update parent
                    parent = ET.SubElement(parent, "expression")

                # open expression (return)
                elif parent.tag == "returnStatement" and input_tuple != ("keyword", "return"):
                    # insert new tokens and update parents
                    parent = ET.SubElement(parent, "expression")
                    parent = ET.SubElement(parent, "term")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open term
                elif parent.tag == "expression":
                    # insert new token and update parent
                    parent = ET.SubElement(parent, "term")

                    # insert current token
                    child = ET.SubElement(parent, input_tuple[0])
                    child.text = " %s " % input_tuple[1]

                # open statements (letStatement/doStatement/whileStatement/ifStatement)
                elif input_list[i][0] == "keyword" and input_list[i][1] in ("let", "do", "while", "if", "return"):
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

            except IndexError:
                if j == len(input_list):
                    pass  # can't eval look-ahead rules from last token
                else:
                    raise

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
