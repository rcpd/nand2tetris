"""
Parse Nand2Tetris test files and execute them in the Nand2Tetris Python Interpreter
Equivalent to the course provided CPUEmulator in non-interactive mode
"""

import re


def load_tst(tst_filepath, debug=False):
    test_params = {
        "input_files": [],
        "out_file": "",
        "cmp_file": "",
        "results": [],
        "compare": {},
        "RAM": [0] * 32768,
        "MAX": 1000,
    }

    with open(tst_filepath, "r") as test_file:
        test_content = test_file.readlines()
    if debug:
        print(tst_filepath)

    for test_cmd in test_content:
        test_cmd = test_cmd.strip()  # remove indentation / trailing whitespace
        if test_cmd == "":
            continue  # empty line
        elif any(test_cmd.startswith(x) for x in ["ticktock;", "vmstep;", "output;", "}", "/"]):
            continue

        test_cmd = test_cmd.split(" //")[0].strip()  # drop comments and strip

        if debug:
            print(test_cmd)

        if test_cmd.startswith("load,"):
            raise NotImplementedError
        elif test_cmd.startswith("load "):
            test_params["input_files"] = [test_cmd.split(" ")[-1][:-1]]
            if debug:
                print(test_params["input_files"])
        elif test_cmd.startswith("output-file "):
            test_params["out_file"] = test_cmd.split(" ")[-1][:-1]
            if debug:
                print(test_params["out_file"])
        elif test_cmd.startswith("compare-to "):
            test_params["cmp_file"] = test_cmd.split(" ")[-1][:-1]
            if debug:
                print(test_params["cmp_file"])
        elif test_cmd.startswith("output-list ") or test_cmd.startswith("RAM["):
            # collect the RAM addresses used in output-list discarding the formatting strings
            raw_cmd = test_cmd.replace("output-list ", "").replace(";", "")
            addresses = re.sub(r"\%\D.\..\..", "", raw_cmd).split(" ")  # regex = "%D1.6.1", numbers vary

            for address in addresses:
                test_params["results"].append(int(address.replace("RAM[", "")[:-1]))
            if debug:
                print(test_params["results"])
        elif test_cmd.startswith("set "):
            if "RAM[" in test_cmd:
                set_vals = test_cmd.replace("set RAM[", "").replace("]", "").replace(",", "").split(" ")
                set_var = set_vals[0]
                set_element = set_vals[1]
            elif any(x in test_cmd for x in ["sp", "local", "argument", "this", "that"]):
                if "argument[" in test_cmd:
                    # parse out argument[x] elements, add to argument pos for offset
                    raw_cmd = test_cmd.split("set argument[")[-1].replace("]", "").replace(",", "")
                    set_var = str(test_params["RAM"][2] + int(raw_cmd.split(" ")[0]))  # re-cast to int later
                    set_element = raw_cmd.split(" ")[1]
                else:
                    set_var = test_cmd.split(" ")[1]
                    set_element = test_cmd.split(" ")[2]

                set_var = set_var.replace("sp", "0").replace("local", "1").replace("argument", "2") \
                    .replace("this", "3").replace("that", "4")
            elif test_cmd.startswith("set PC "):
                pass
            else:
                raise RuntimeError("Tester: Unexpected set command: %s" % test_cmd)

            test_params["RAM"][int(set_var)] = int(set_element.replace(",", "").replace(";", ""))

            if debug:
                print(set_var, set_element)
        elif test_cmd.startswith("repeat "):
            try:
                test_params["MAX"] = int(test_cmd.split(" ")[1])
            except ValueError:
                if test_cmd.split(" ")[1] == "{":
                    pass
                else:
                    raise
            if debug:
                print(test_params["MAX"])
        elif test_cmd.startswith("echo "):
            pass
        else:
            raise NotImplementedError("Tester: %s" % test_cmd)

    print("Tester: loaded test params %s" % tst_filepath)
    return test_params


def load_cmp(cmp_filepath, debug=False):
    with open(cmp_filepath, "r") as cmp_file:
        cmp_content = cmp_file.readlines()

    if debug:
        print(cmp_filepath)

    cmp_dict = {}
    address_list = []
    value_list = []
    for line in cmp_content:
        if "RAM[" in line:
            address_line = line.split("|")
            for element in address_line:
                if "RAM[" in element:  # skip empty entries from split
                    address_list.append(int(element.replace("RAM[", "").replace("]", "").strip()))
        else:
            value_line = line.split("|")
            for element in value_line:
                value = element.strip()
                if value != "":
                    value_list.append(int(value))

    for (address, value) in zip(address_list, value_list):
        cmp_dict[address] = value

    if debug:
        print(cmp_content)
        print(address_list)
        print(value_list)
        print(cmp_dict)

    if not len(address_list) or not len(value_list):
        raise RuntimeError("Tester: Address or Value parsing error (no values): %s" % cmp_filepath)
    if len(address_list) != len(value_list):
        raise RuntimeError("Tester: Address/Value mismatch in cmp file parsing: %s" % cmp_filepath)

    print("Tester: loaded test targets %s" % cmp_filepath)
    return cmp_dict


if __name__ == '__main__':
    tst_filepaths = [
        # week 5 and below use different multi row format (tested with HardwareSimulator/CPUEmulator)

        r"..\projects\07\MemoryAccess\BasicTest\BasicTest.tst",
        r"..\projects\07\MemoryAccess\PointerTest\PointerTest.tst",
        r"..\projects\07\MemoryAccess\StaticTest\StaticTest.tst",
        r"..\projects\07\StackArithmetic\SimpleAdd\SimpleAdd.tst",
        r"..\projects\07\StackArithmetic\StackTest\StackTest.tst",

        r"..\projects\08\FunctionCalls\FibonacciElement\FibonacciElement.tst",
        r"..\projects\08\FunctionCalls\NestedCall\NestedCall.tst",
        r"..\projects\08\FunctionCalls\SimpleFunction\SimpleFunction.tst",
        r"..\projects\08\FunctionCalls\StaticsTest\StaticsTest.tst",
        r"..\projects\08\ProgramFlow\BasicLoop\BasicLoop.tst",
        r"..\projects\08\ProgramFlow\FibonacciSeries\FibonacciSeries.tst",
    ]

    debug_runs = [True, False]
    for _debug in debug_runs:
        for _tst_filepath in tst_filepaths:
            _cmp_filepath = _tst_filepath.replace("VME", "").replace(".tst", ".cmp")
            _tst_params = load_tst(_tst_filepath, debug=_debug)
            _tst_params["compare"] = load_cmp(_cmp_filepath, debug=_debug)
