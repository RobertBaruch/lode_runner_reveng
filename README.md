# lode_runner_reveng
Reverse engineering of Lode Runner for the Apple II series.

[main.pdf](main.pdf) is the literate programming document for this project. This means the explanatory text is interspersed with source code. The source code can be extracted from the document and compiled.

The goal is to provide all the source code necessary to reproduce a binary identical to the one found on the Internet Archive's [Lode_Runner_1983_Broderbund_cr_Reset_Vector.do](https://archive.org/details/a2_Lode_Runner_1983_Broderbund_cr_Reset_Vector) disk image.

The assembly code is assembled using [`dasm`](https://dasm-assembler.github.io/).

This document doesn't explain every last detail. It's assumed that the reader can find enough details on the 6502 processor and the Apple II series of computers to fill in the gaps.

## Useful 6502 and Apple II resources:

* [Beneath Apple DOS](https://archive.org/details/beneath-apple-dos), by Don Worth and Pieter Lechner, 1982.
* [Apple II Computer Graphics](https://archive.org/details/williams-et-al-1983-apple-ii-computer-graphics), by Ken Williams, Bob Kernaghan, and Lisa Kernaghan, 1983.
* [6502 Assembly Language Programming](https://archive.org/details/6502alp), by Lance A. Leventhal, 1979.
* [Beagle Bros Apple Colors and ASCII Values](https://archive.org/details/Beagle_Bros-Poster_1), Beagle Bros Micro Software Inc, 1984.
* [Hi-Res Graphics and Animation Using Assembly Language, The Guide for Apple II Programmers](https://archive.org/details/hi-res-graphics-and-animation-using-assembly-language), by Leanard I. Malkin, 1985.

## Compilation

This step should not be necessary, as the release provides the assembly files, the 6502 binary, and the PDF.

### Prerequisites

* [`dasm`](https://dasm-assembler.github.io/), the 6502 assembler.
* A distribution of [TeX Live](https://www.tug.org/texlive/) with the `booktabs` and `tikz` packages.
* [`noweb`](https://github.com/nrnrnr/noweb)

To compile `main.nw`, you must use the `noweb` package and a `TeX` distribution such as TeX Live.

WARNING: The latest TeX Live, 2022, is known to break `noweb` [[bug](https://github.com/nrnrnr/noweb/issues/24)]. Use TeXLive 2021 or earlier until the bug is fixed.

### Generating the PDF

```sh
$ noweave -delay -index main.nw > main.tex
$ pdflatex main.tex
$ pdflatex main.tex
```

Yes, you have to run `pdflatex` twice. The first run generates auxilliary information about indexes that the second run can use to properly cross-reference things.

### Generating the binary

First, you must place the filter script `ignore_preuse_text.py` in `/usr/lib/noweb`. Sorry Windows users, I don't know where to put your filter scripts.

The `ignore_preuse_text.py` filter makes it so that uses of code blocks do not get extra indentation when that use is indented. This is important for the assembly language output, and makes the PDF output more pleasant to read.

```sh
$ notangle -filter ignore_preuse_text.py main.nw > main2.asm
$ python3 reorder_asm.py main2.asm > main.asm
$ dasm main.asm -f3 -omain.bin
```

`reorder_asm.py` reads the `main.asm` output, and reorders code blocks so that
their ORG locations are increasing. This is necessary because `dasm` doesn't handle
code blocks whose origins jump around.

## License

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
