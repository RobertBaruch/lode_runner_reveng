# lode_runner_reveng
Reverse engineering of Lode Runner for the Apple II series.

NOTE: This is a work in progress. One issue is that `dasm` doesn't seem to want to assemble a file that has
out-of-order ORG fragments. Eventually once I add all code blocks in the source document, I hope to order them
properly in the root code block so that the generated binary exactly matches the binary I started with for
reverse engineering.

For now, you can track progress in the main.pdf file.

## Compilation

This step should not be necessary, as the release provides the assembly files, the 6502 binary, and the PDF.

### Prerequisites

* [`dasm`](https://dasm-assembler.github.io/), the 6502 assembler.
* A distribution of [TeX Live](https://www.tug.org/texlive/) with the `booktabs` and `tikz` packages.
* [`noweb`](https://github.com/nrnrnr/noweb)

### Procedure

To compile `main.nw`, you must use the `noweb` package and a `TeX` distribution such as TeX Live.

WARNING: The latest TeX Live, 2022, is known to break `noweb` [[bug](https://github.com/nrnrnr/noweb/issues/24)]. Use TeXLive 2019 until the bug is fixed.

```sh
$ noweave -delay -index main.nw > main.tex
$ pdflatex main.tex
$ pdflatex main.tex
```

Yes, you have to run `pdflatex` twice. The first run generates auxilliary information about indexes that the second run can use to properly cross-reference things.

```sh
$ notangle main.nw > main.asm
$ dasm main.asm -f3 -omain.bin
```

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
