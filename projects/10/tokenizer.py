
# chars = "abcdefghijklmnopqrstuvwxyz"


filepath = r"ArrayTest\Main.jack"

with open(filepath) as jack_file:
    jack_content = jack_file.readlines()

block_comment = False
keywords = ['class', 'constructor', 'function', 'method', 'field', 'static', 'var', 'int', 'char', 'boolean', 'void',
            'true', 'false', 'null', 'this', 'let', 'do', 'if', 'else', 'while', 'return']
symbols = ['{', '}', '(', ')', '[', ']', '. ', ', ', '; ', '+', '-', '*', '/', '&', '|', '<', '>', '=', '~']

print("<tokens>")

for line in jack_content:
    if block_comment:
        continue

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

    words = line.split()
    keyword = False
    print(line, "-----", words)
    for i, word in enumerate(words):
        # search for symbols in word
        symbol = False
        for j, char in enumerate(word):
            if char in symbols:
                symbol = char
                if word[:j]:  # if something left after slice
                    words.insert(i+1, word[j+1:])  # inject symbol (and remainder) into next word
                word = word[:j]  # truncate word to before symbol char
                break

        if keyword and word not in keywords:
            print("<identifier> %s </identifier>" % word)
            keyword = False  # disable once identifier processed
        elif word in keywords:
            print("<keyword> %s </keyword>" % word)
            keyword = True  # set until corresponding identifier processed

        if symbol:  # not mutually exclusive with previous
            print("<symbol> %s </symbol>" % symbol)
            symbol = False

print("</tokens>")



