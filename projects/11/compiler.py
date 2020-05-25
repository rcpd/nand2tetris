

def compile(jack_filepath):
    with open(jack_filepath) as jack_file:
        jack_source = jack_file.read()


def main():
    file_paths = [
        r"Seven\Main.jack"
    ]

    for jack_filepath in file_paths:
        compile(jack_filepath)


if __name__ == '__main__':
    main