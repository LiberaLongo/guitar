#!/usr/bin/env python3
import sys

translation = {
        " ": " ",
        "\n": "\n",
        "[": "<",
        "]": ">",
        "|": "4",

        "1": "c,,", "2": "d,,", "3": "e,,", "4": "f,,", "5": "g,,", "6": "a,,", "7": "b,,",
        "8": "c,",  "9": "d,",  "0": "e,",  "q": "f,",  "w": "g,",  "e": "a,",  "r": "b,",
        "t": "c",   "y": "d",   "u": "e",   "i": "f",   "o": "g",   "p": "a",   "a": "b",
        "s": "c'",  "d": "d'",  "f": "e'",  "g": "f'",  "h": "g'",  "j": "a'",  "k": "b'",
        "l": "c''", "z": "d''", "x": "e''", "c": "f''", "v": "g''", "b": "b''", "n": "b''",
        "m": "c'''",

        "!": "cis,,", "@": "dis,,", "$": "fis,,", "%": "gis,,", "^": "ais,,",
        "*": "cis,",  "(": "dis,",  "Q": "fis,",  "W": "gis,",  "E": "ais,",
        "T": "cis",   "Y": "dis",   "I": "fis",   "O": "gis",   "P": "ais",
        "S": "cis'",  "D": "dis'",  "G": "fis'",  "H": "gis'",  "J": "ais'",
        "L": "cis''", "Z": "dis''", "C": "fis''", "V": "gis''", "B": "ais''"
}

if __name__ == "__main__":
    outstr = ''
    if len(sys.argv) < 2:
        print("usage: ...");
        sys.exit(1)

    with open(sys.argv[1], 'r') as fin:
        instr = fin.read()
    for c in instr:
        outstr += translation[c]
    with open(sys.argv[2], 'w') as fout:
        fout.write(outstr)
