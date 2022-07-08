#!/usr/bin/env python3

if __name__ == "__main__":
    linebuffer = None

    while True:
        try:
            line = input()
            if linebuffer is None:
                linebuffer = line
                continue
            if linebuffer.startswith("@text") and line.startswith("@use"):
                linebuffer = line
                continue
            print(linebuffer)
            linebuffer = line
        except EOFError:
            break

    if linebuffer:
        print(linebuffer)
