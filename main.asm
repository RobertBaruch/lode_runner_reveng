    PROCESSOR 6502
    ORG 0
.dummy equ $A000
    STA     .insn0 + 2
.insn0:
    LDA .dummy,Y
    LDA #<.insn0
