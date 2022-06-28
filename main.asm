    PROCESSOR 6502
    ORG     $0A
TMP_PTR         DS.W    1
    ORG     $DF
BLOCK_DATA      DS      33
    ORG     $1D
ROW_COUNT       DS      1
SPRITE_NUM      DS      1
ROW_ADDR        EQU     $0C     ; 2 bytes
ROW_ADDR2       EQU     $0E     ; 2 bytes
HGR_PAGE        EQU     $1F     ; 0x20 for HGR1, 0x40 for HGR2
    ORG     $1B
ROWNUM          DS      1
COLNUM          DS      1
    ORG     $50
MASK0           DS      1
MASK1           DS      1
    ORG     $71
COL_SHIFT_AMT   DS      1
    ORG     $85
GAME_COLNUM     DS      1
GAME_ROWNUM     DS      1
DRAW_PAGE   EQU     $87     ; 0x20 for page 1, 0x40 for page 2
    ORG     $10
SAVED_RET_ADDR      DS.W    1
    ORG     $C0
HUNDREDS        DS      1
TENS            DS      1
UNITS           DS      1
    ORG     $8D
SCORE       DS      4       ; BCD format, tens/units in first byte.
    ORG     $A6
LEVELNUM    DS      1
    ORG     $C8
LIVES       DS      1
PTR1        EQU     $06     ; 2 bytes
PTR2        EQU     $08     ; 2 bytes
    ORG     $00
PLAYER_COL      DS      1       ; The column number of the player.
PLAYER_ROW      DS      1       ; The row number of the player.
    ORG     $8D
GUARD_COUNT     DS      1
    ORG     $93
GOLD_COUNT      DS      1
    ORG     $A3
LADDER_COUNT    DS      1
    ORG     $A2
VERBATIM        DS      1
PLAYER_FLAGS_0002   EQU     $02
PLAYER_FLAGS_0003   EQU     $03
PLAYER_FLAGS_0004   EQU     $04
WIPE_COUNTER        EQU     $6D
WIPE_MODE           EQU     $A5     ; 0 for open, 1 for close.
WIPE_DIR            EQU     $72     ; 0 for close, 1 for open.
WIPE_CENTER_X       EQU     $77
WIPE_CENTER_Y       EQU     $73
MATH_TMPL     EQU     $6F
MATH_TMPH     EQU     $70
WIPE0       EQU     $69     ; 16-bit value
WIPE1       EQU     $67     ; 16-bit value
WIPE2       EQU     $6B     ; 16-bit value
WIPE3L      EQU     $75
WIPE4L      EQU     $76
WIPE5L      EQU     $77
WIPE6L      EQU     $78
WIPE3H      EQU     $79
WIPE4H      EQU     $7A
WIPE5H      EQU     $7B
WIPE6H      EQU     $7C
WIPE7D      EQU     $7D     ; Dividends
WIPE8D      EQU     $7E
WIPE9D      EQU     $7F
WIPE10D     EQU     $80
WIPE7R      EQU     $81     ; Remainders
WIPE8R      EQU     $82
WIPE9R      EQU     $83
WIPE10R     EQU     $84
    ORG     $AD00
SPRITE_DATA:
    INCLUDE "sprite_data.asm"
    ORG     $A900
PIXEL_PATTERN_TABLE:
    INCLUDE "pixel_pattern_table.asm"
    ORG     $A200
PIXEL_SHIFT_TABLE:
    INCLUDE "pixel_shift_table.asm"
    ORG     $84C1
PIXEL_SHIFT_PAGES:
    HEX     A2 A3 A4 A5 A6 A7 A8
    ORG     $1A85
ROW_TO_OFFSET_LO:
    INCLUDE "row_to_offset_lo_table.asm"
ROW_TO_OFFSET_HI:
    INCLUDE "row_to_offset_hi_table.asm"
    ORG     $1C35
ROW_TABLE2:
    ; 28 rows of 5 pixels each
    HEX     00 05 0a 0f 14 19 1e 23 28 2d 32 37 3c 41 46 4b
    HEX     50 55 5a 5f 64 69 6e 73 78 7d 82 87
ROW_TABLE:
    ; 17 rows of 11 pixels each
    HEX     00 0B 16 21 2C 37 42 4D 58 63 6E 79 84 8F 9A A5
    HEX     B5
COL_TABLE:
    ; Byte number
    HEX     00 01 02 04 05 07 08 0A 0B 0C 0E 0F 11 12 14 15
    HEX     16 18 19 1B 1C 1E 1F 20 22 23 25 26
COL_SHIFT_TABLE:
    ; Right shift amount
    HEX     00 03 06 02 05 01 04 00 03 06 02 05 01 04 00 03
    HEX     06 02 05 01 04 00 03 06 02 05 01 04
    ORG     $8328
PIXEL_MASK0:
    BYTE    %00000000
    BYTE    %00000001
    BYTE    %00000011
    BYTE    %00000111
    BYTE    %00001111
    BYTE    %00011111
    BYTE    %00111111
PIXEL_MASK1:
    BYTE    %11111000
    BYTE    %11110000
    BYTE    %11100000
    BYTE    %11000000
    BYTE    %10000000
    BYTE    %11111110
    BYTE    %11111100
    ORG     $1C05
CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS:
    HEX     00 1C 38 54 70 8C A8 C4 E0 FC 18 34 50 6C 88 A4
CURR_LEVEL_ROW_SPRITES_PTR_PAGES:
    HEX     08 08 08 08 08 08 08 08 08 08 09 09 09 09 09 09
CURR_LEVEL_ROW_SPRITES_PTR_PAGES2:
    HEX     0A 0A 0A 0A 0A 0A 0A 0A 0A 0A 0B 0B 0B 0B 0B 0B
    ORG     $0C00
LADDER_LOCS_COL     DS      48
LADDER_LOCS_ROW     DS      48
    ORG     $0C60
GUARD_LOCS_COL      DS      8
GUARD_LOCS_ROW      DS      8
GUARD_FLAGS_0C70    DS      8
GUARD_FLAGS_0C78    DS      8
GUARD_FLAGS_0C80    DS      8
GUARD_FLAGS_0C88    DS      8
    ORG     $8B0C
WIPE_BLOCK_CLOSE_MASK:
    BYTE     %11110000
    BYTE     %11110000
    BYTE     %11110000
    BYTE     %11110000
    BYTE     %10001111
    BYTE     %10001111
    BYTE     %10001111
WIPE_BLOCK_OPEN_MASK:
    BYTE     %10001111
    BYTE     %10001111
    BYTE     %10001111
    BYTE     %10001111
    BYTE     %11110000
    BYTE     %11110000
    BYTE     %11110000
    ORG     $7A51
CLEAR_HGR1:
    SUBROUTINE

    LDA     #$20                ; Start at $2000
    LDX     #$40                ; End at $4000 (but not including)
    BNE     CLEAR_PAGE          ; Unconditional jump

CLEAR_HGR2:
    SUBROUTINE

    LDA     #$40                ; Start at $4000
    LDX     #$60                ; End at $6000 (but not including)
    ; fallthrough

CLEAR_PAGE:
    STA     TMP_PTR+1           ; Start with the page in A.
    LDA     #$00
    STA     TMP_PTR
    TAY
    LDA     #$80                ; fill byte = 0x80

.loop:
    STA     (TMP_PTR),Y
    INY
    BNE     .loop
    INC     TMP_PTR+1
    CPX     TMP_PTR+1
    BNE     .loop               ; while TMP_PTR != X * 0x100
    RTS
    ORG     $8438
COMPUTE_SHIFTED_SPRITE:
    SUBROUTINE
    ; Enter routine with X set to pixel shift amount and
    ; SPRITE_NUM containing the sprite number to read.

.offset_table       EQU $A000               ; Target addresses in read
.page_table         EQU $A080               ; instructions. The only truly
.shift_ptr_byte0    EQU $A000               ; necessary value here is the
.shift_ptr_byte1    EQU $A000               ; 0x80 in .shift_ptr_byte0.

    LDA     #$0B                            ; 11 rows
    STA     ROW_COUNT
    LDA     #<SPRITE_DATA
    STA     TMP_PTR
    LDA     #>SPRITE_DATA
    STA     TMP_PTR+1                       ; TMP_PTR = SPRITE_DATA
    LDA     PIXEL_SHIFT_PAGES,X 
    STA     .rd_offset_table + 2
    STA     .rd_page_table + 2
    STA     .rd_offset_table2 + 2
    STA     .rd_page_table2 + 2             ; Fix up pages in lookup instructions
                                            ; based on shift amount (X).

    LDX     #$00                            ; X is the offset into BLOCK_DATA.

.loop:                                      ; === LOOP === (over all 11 rows)
    LDY     SPRITE_NUM
    LDA     (TMP_PTR),Y 
    TAY                                     ; Get sprite pixel data.

.rd_offset_table:
    LDA     .offset_table,Y                 ; Load offset for shift amount.
    STA     .rd_shift_ptr_byte0 + 1
    CLC
    ADC     #$01
    STA     .rd_shift_ptr_byte1 + 1         ; Fix up instruction offsets with it.
.rd_page_table:
    LDA     .page_table,Y                   ; Load page for shift amount.
    STA     .rd_shift_ptr_byte0 + 2
    STA     .rd_shift_ptr_byte1 + 2         ; Fix up instruction page with it.

.rd_shift_ptr_byte0:
    LDA     .shift_ptr_byte0                ; Read shifted pixel data byte 0
    STA     BLOCK_DATA,X                    ; and store in block data byte 0.
.rd_shift_ptr_byte1:
    LDA     .shift_ptr_byte1                ; Read shifted pixel data byte 1
    STA     BLOCK_DATA+1,X                  ; and store in block data byte 1.

    LDA     TMP_PTR
    CLC
    ADC     #$68
    STA     TMP_PTR
    LDA     TMP_PTR+1
    ADC     #$00
    STA     TMP_PTR+1                       ; TMP_PTR++

    ; Now basically do the same thing with the second sprite byte

    LDY     SPRITE_NUM
    LDA     (TMP_PTR),Y 
    TAY                                     ; Get sprite pixel data.

.rd_offset_table2:
    LDA     .offset_table,Y                 ; Load offset for shift amount.
    STA     .rd_shift_ptr2_byte0 + 1
    CLC
    ADC     #$01
    STA     .rd_shift_ptr2_byte1 + 1        ; Fix up instruction offsets with it.
.rd_page_table2:
    LDA     .page_table,Y                   ; Load page for shift amount.
    STA     .rd_shift_ptr2_byte0 + 2
    STA     .rd_shift_ptr2_byte1 + 2        ; Fix up instruction page with it.

.rd_shift_ptr2_byte0:
    LDA     .shift_ptr_byte0                ; Read shifted pixel data byte 0
    ORA     BLOCK_DATA+1,X                  ; OR with previous block data byte 1
    STA     BLOCK_DATA+1,X                  ; and store in block data byte 1.
.rd_shift_ptr2_byte1:
    LDA     .shift_ptr_byte1                ; Read shifted pixel data byte 1
    STA     BLOCK_DATA+2,X                  ; and store in block data byte 2.

    LDA     TMP_PTR
    CLC
    ADC     #$68
    STA     TMP_PTR
    LDA     TMP_PTR+1
    ADC     #$00
    STA     TMP_PTR+1                       ; TMP_PTR++

    INX
    INX
    INX                                     ; X += 3
    DEC     ROW_COUNT                       ; ROW_COUNT--
    BNE     .loop                           ; loop while ROW_COUNT > 0
    RTS
    ORG     $7A31
ROW_TO_ADDR:
    SUBROUTINE
    ; Enter routine with Y set to row. Base address
    ; (for column 0) will be placed in ROW_ADDR.

    LDA     ROW_TO_OFFSET_LO,Y 
    STA     ROW_ADDR
    LDA     ROW_TO_OFFSET_HI,Y 
    ORA     HGR_PAGE
    STA     ROW_ADDR+1
    RTS
    ORG     $7A3E
ROW_TO_ADDR_FOR_BOTH_PAGES:
    SUBROUTINE
    ; Enter routine with Y set to row. Base address
    ; (for column 0) will be placed in ROW_ADDR (for page 1)
    ; and ROW_ADDR2 (for page 2).

    LDA     ROW_TO_OFFSET_LO,Y 
    STA     ROW_ADDR
    STA     ROW_ADDR2
    LDA     ROW_TO_OFFSET_HI,Y 
    ORA     #$20
    STA     ROW_ADDR+1
    EOR     #$60
    STA     ROW_ADDR2+1
    RTS
    ORG     $885D
GET_ROWNUM_FOR:
    SUBROUTINE
    ; Enter routine with Y set to sprite row. On
    ; return,Y  will be set to screen row.
    ; We can also set X to something, and on return
    ; X is set to something based on ROW_TABLE2, but
    ; so far I'm not sure what it's used for.

    LDA     ROW_TABLE,Y 
    PHA
    LDA     ROW_TABLE2,X 
    TAX                         ; X = ROW_TABLE2[X]
    PLA
    TAY                         ; Y = ROW_TABLE[Y]
    RTS

GET_COLNUM_FOR:
    SUBROUTINE
    ; Enter routine with X set to sprite number. On
    ; return, A will be set to screen column byte number
    ; and X will be set to an additional right shift amount.

    LDA     COL_TABLE,X 
    PHA                         ; A = COL_TABLE2[X]
    LDA     COL_SHIFT_TABLE,X 
    TAX                         ; X = COL_SHIFT_TABLE[X]
    PLA
    RTS
    ORG     $82AA
DRAW_SPRITE_PAGE1:
    SUBROUTINE
    ; Enter routine with A set to sprite number to draw,
    ; GAME_ROWNUM set to the row to draw it at, and GAME_COLNUM
    ; set to the column to draw it at.

    STA     SPRITE_NUM
    LDA     #$20                ; Page number for HGR1
    BNE     DRAW_SPRITE         ; Actually unconditional jump

DRAW_SPRITE_PAGE2:
    SUBROUTINE
    ; Enter routine with A set to sprite number to draw,
    ; GAME_ROWNUM set to the row to draw it at, and GAME_COLNUM
    ; set to the column to draw it at.

    STA     SPRITE_NUM
    LDA     #$40                ; Page number for HGR2
    ; fallthrough

DRAW_SPRITE:
    STA     HGR_PAGE
    LDY     GAME_ROWNUM
    JSR     GET_ROWNUM_FOR
    STY     ROWNUM              ; ROWNUM = ROW_TABLE[GAME_ROWNUM]

    LDX     GAME_COLNUM
    JSR     GET_COLNUM_FOR
    STA     COLNUM              ; COLNUM = COL_TABLE[GAME_COLNUM]
    STX     COL_SHIFT_AMT       ; COL_SHIFT_AMT = COL_SHIFT_TABLE[GAME_COLNUM]

    LDA     PIXEL_MASK0,X 
    STA     MASK0               ; MASK0 = PIXEL_MASK0[COL_SHIFT_AMT]
    LDA     PIXEL_MASK1,X 
    STA     MASK1               ; MASK1 = PIXEL_MASK1[COL_SHIFT_AMT]

    JSR     COMPUTE_SHIFTED_SPRITE

    LDA     #$0B
    STA     ROW_COUNT
    LDX     #$00
    LDA     COL_SHIFT_AMT
    CMP     #$05
    BCS     .need_3_bytes       ; If COL_SHIFT_AMT >= 5, we need to alter three screen bytes,
                                ; otherwise just two bytes.

.loop1:
    LDY     ROWNUM
    JSR     ROW_TO_ADDR
    LDY     COLNUM
    LDA     (ROW_ADDR),Y 
    AND     MASK0
    ORA     BLOCK_DATA,X 
    STA     (ROW_ADDR),Y        ; screen[COLNUM] = screen[COLNUM] & MASK0 | BLOCK_DATA[i]

    INX                         ; X++
    INY                         ; Y++
    LDA     (ROW_ADDR),Y 
    AND     MASK1
    ORA     BLOCK_DATA,X 
    STA     (ROW_ADDR),Y        ; screen[COLNUM+1] = screen[COLNUM+1] & MASK1 | BLOCK_DATA[i+1]

    INX
    INX                         ; X += 2
    INC     ROWNUM              ; ROWNUM++
    DEC     ROW_COUNT           ; ROW_COUNT--
    BNE     .loop1              ; loop while ROW_COUNT > 0
    RTS

.need_3_bytes
    LDY     ROWNUM
    JSR     ROW_TO_ADDR
    LDY     COLNUM
    LDA     (ROW_ADDR),Y 
    AND     MASK0
    ORA     BLOCK_DATA,X 
    STA     (ROW_ADDR),Y        ; screen[COLNUM] = screen[COLNUM] & MASK0 | BLOCK_DATA[i]

    INX                         ; X++
    INY                         ; Y++
    LDA     BLOCK_DATA,X 
    STA     (ROW_ADDR),Y        ; screen[COLNUM+1] = BLOCK_DATA[i+1]

    INX                         ; X++
    INY                         ; Y++
    LDA     (ROW_ADDR),Y 
    AND     MASK1
    ORA     BLOCK_DATA,X 
    STA     (ROW_ADDR),Y        ; screen[COLNUM+2] = screen[COLNUM+2] & MASK1 | BLOCK_DATA[i+2]

    INX                         ; X++
    INC     ROWNUM              ; ROWNUM++
    DEC     ROW_COUNT           ; ROW_COUNT--
    BNE     .need_3_bytes       ; loop while ROW_COUNT > 0
    RTS
    ORG     $7b2a
CHAR_TO_SPRITE_NUM:
    SUBROUTINE
    ; Enter routine with A set to the ASCII code of the
    ; character to convert to sprite number, with the high bit set.
    ; The sprite number is returned in A.

    CMP     #$C1                    ; 'A' -> sprite 69
    BCC     .not_letter
    CMP     #$DB                    ; 'Z' -> sprite 94
    BCC     .letter

.not_letter:
    ; On return, we will subtract 0x7C from X to
    ; get the actual sprite. This is to make A-Z
    ; easier to handle.
    LDX     #$7C
    CMP     #$A0                    ; ' ' -> sprite 0
    BEQ     .end
    LDX     #$DB
    CMP     #$BE                    ; '>' -> sprite 95
    BEQ     .end
    INX
    CMP     #$AE                    ; '.' -> sprite 96
    BEQ     .end
    INX
    CMP     #$A8                    ; '(' -> sprite 97
    BEQ     .end
    INX
    CMP     #$A9                    ; ')' -> sprite 98
    BEQ     .end
    INX
    CMP     #$AF                    ; '/' -> sprite 99
    BEQ     .end
    INX
    CMP     #$AD                    ; '-' -> sprite 100
    BEQ     .end
    INX
    CMP     #$BC                    ; '<' -> sprite 101
    BEQ     .end
    LDA     #$10                    ; sprite 16: just one of the man sprites
    RTS

.end:
    TXA

.letter:
    SEC
    SBC     #$7C                    
    RTS

    ORG     $7b64
PUT_CHAR:
    SUBROUTINE
    ; Enter routine with A set to the ASCII code of the
    ; character to put on the screen, with the high bit set.

    CMP     #$8D
    BEQ     NEWLINE                 ; If newline, do NEWLINE instead.
    JSR     CHAR_TO_SPRITE_NUM
    LDX     DRAW_PAGE
    CPX     #$40
    BEQ     .draw_to_page2

    JSR     DRAW_SPRITE_PAGE1
    INC     GAME_COLNUM
    RTS

.draw_to_page2
    JSR     DRAW_SPRITE_PAGE2
    INC     GAME_COLNUM
    RTS

NEWLINE:
    SUBROUTINE
    INC     GAME_ROWNUM
    LDA     #$00
    STA     GAME_COLNUM
    RTS
    ORG     $86E0
PUT_STRING:
    SUBROUTINE

    PLA
    STA     SAVED_RET_ADDR
    PLA
    STA     SAVED_RET_ADDR+1
    BNE     .next

.loop:
    LDY     #$00
    LDA     (SAVED_RET_ADDR),Y
    BEQ     .end
    JSR     PUT_CHAR

.next:
    INC     SAVED_RET_ADDR
    BNE     .loop
    INC     SAVED_RET_ADDR+1
    BNE     .loop

.end:
    LDA     SAVED_RET_ADDR+1
    PHA
    LDA     SAVED_RET_ADDR
    PHA
    RTS
    ORG     $7B15
PUT_DIGIT:
    SUBROUTINE
    ; Enter routine with A set to the digit to put on the screen.

    CLC
    ADC     #$3B                    ; '0' -> sprite 59, '9' -> sprite 68.
    LDX     DRAW_PAGE
    CPX     #$40
    BEQ     .draw_to_page2
    JSR     DRAW_SPRITE_PAGE1
    INC     GAME_COLNUM
    RTS

.draw_to_page2:
    JSR     DRAW_SPRITE_PAGE2
    INC     GAME_COLNUM
    RTS
    ORG     $7AF8
TO_DECIMAL3:
    SUBROUTINE
    ; Enter routine with A set to the number to convert.

    LDX     #$00
    STX     TENS
    STX     HUNDREDS

.loop1:
    CMP     100
    BCC     .loop2
    INC     HUNDREDS
    SBC     100
    BNE     .loop1

.loop2:
    CMP     10
    BCC     .end
    INC     TENS
    SBC     10
    BNE     .loop2

.end:
    STA     UNITS
    RTS
    ORG     $7AE9
BCD_TO_DECIMAL2:
    SUBROUTINE
    ; Enter routine with A set to the BCD number to convert.

    STA     TENS
    AND     #$0F
    STA     UNITS
    LDA     TENS
    LSR
    LSR
    LSR
    LSR
    STA     TENS
    RTS
    ORG     $7A92
ADD_AND_UPDATE_SCORE:
    SUBROUTINE
    ; Enter routine with A set to BCD tens/units and
    ; Y set to BCD thousands/hundreds.

    CLC
    SED                         ; Turn on BCD addition mode.
    ADC     SCORE
    STA     SCORE
    TYA
    ADC     SCORE+1
    STA     SCORE+1
    LDA     #$00
    ADC     SCORE+2
    STA     SCORE+2
    LDA     #$00
    ADC     SCORE+3
    STA     SCORE+3             ; SCORE += param
    CLD                         ; Turn off BCD addition mode.

    LDA     5
    STA     GAME_COLNUM
    LDA     16
    STA     GAME_ROWNUM

    LDA     SCORE+3
    JSR     BCD_TO_DECIMAL2
    LDA     UNITS               ; Note we skipped TENS.
    JSR     PUT_DIGIT

    LDA     SCORE+2
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    LDA     SCORE+1
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    LDA     SCORE
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JMP     PUT_DIGIT           ; tail call

    ORG     $7a70
PUT_STATUS_LIVES:
    SUBROUTINE

    LDA     LIVES
    LDX     16
    ; fallthrough

PUT_STATUS_BYTE:
    SUBROUTINE
    ; Puts the number in A as a three-digit decimal on the screen
    ; at row 16, column X.

    STX     GAME_COLNUM
    JSR     TO_DECIMAL3
    LDA     16
    STA     GAME_ROWNUM
    LDA     HUNDREDS
    JSR     PUT_DIGIT
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JMP     PUT_DIGIT           ; tail call

PUT_STATUS_LEVEL:
    SUBROUTINE

    LDA     LEVELNUM
    LDX     25
    BNE     PUT_STATUS_BYTE     ; Unconditional jump

    ORG     $63B3
DRAW_LEVEL_PAGE2:
    SUBROUTINE

    LDY     15
    STY     GAME_ROWNUM

.row_loop:
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1
    LDY     27
    STY     GAME_COLNUM

.col_loop:
    LDA     (PTR1),Y
    LDX     VERBATIM
    BEQ     .draw_sprite1       ; This will then unconditionally jump to
                                ; .draw_sprite2. We have to do that because of
                                ; relative jump amount limitations.
    CMP      #$06
    BNE     .check_for_box

    LDX     LADDER_COUNT
    CPX     45
    BCS     .remove_sprite

    INC     LADDER_COUNT
    INX
    LDA     GAME_ROWNUM
    STA     LADDER_LOCS_ROW,X
    TYA
    STA     LADDER_LOCS_COL,X

.remove_sprite:
    LDA     0
    STA     (PTR1),Y
    STA     (PTR2),Y

.draw_sprite1
    BEQ     .draw_sprite        ; Unconditional jump.
.check_for_box:
    CMP      #$07
    BNE     .check_for_8

    INC     GOLD_COUNT
    BNE     .draw_sprite        ; This leads to a situation where if we wrap
                                ; GOLD_COUNT around back to 0 (so 256 boxes)
                                ; we end up falling through, which eventually
                                ; just draws the sprite anyway. So this is kind
                                ; of unconditional.

.check_for_8:
    CMP     #$08
    BNE     .check_for_9

    LDX     GUARD_COUNT
    CPX     5
    BCS     .remove_sprite          ; If GUARD_COUNT > 5, remove sprite.

    INC     GUARD_COUNT
    INX
    TYA
    STA     GUARD_LOCS_COL,X
    LDA     GAME_ROWNUM
    STA     GUARD_LOCS_ROW,X
    LDA     #$00
    STA     GUARD_FLAGS_0C70,X
    STA     GUARD_FLAGS_0C88,X
    LDA     #$02
    STA     GUARD_FLAGS_0C78,X
    STA     GUARD_FLAGS_0C80,X

    LDA     #$00
    STA     (PTR2),Y
    LDA     #$08
    BNE     .draw_sprite            ; Unconditional jump.

.next_row:
    BPL     .row_loop
.next_col:
    BPL     .col_loop
.check_for_9:
    CMP     #$09
    BNE     .check_for_5

    LDX     PLAYER_COL
    BPL     .remove_sprite          ; If PLAYER_COL > 0, remove sprite.

    STY     PLAYER_COL
    LDX     GAME_ROWNUM
    STX     PLAYER_ROW
    LDX     #$02
    STX     PLAYER_FLAGS_0002
    STX     PLAYER_FLAGS_0003
    LDX     #$08
    STX     PLAYER_FLAGS_0004

    LDA     #$00
    STA     (PTR2),Y
    LDA     #$09
    BNE     .draw_sprite            ; Unconditional jump.
.check_for_5:
    CMP     #$05
    BNE     .draw_sprite
    LDA     #$01                    ; Brick sprite
.draw_sprite:
    JSR     DRAW_SPRITE_PAGE2

    DEC     GAME_COLNUM
    LDY     GAME_COLNUM
    BPL     .next_col               ; Jumps to .col_loop

    DEC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    BPL     .next_row               ; Jumps to .row_loop
    LDA     VERBATIM
    BEQ     .copy_page2_to_page1

    LDA     PLAYER_COL
    BPL     .reveal_screen

    SEC                             ; Oops, no player! Return error.
    RTS
.copy_page2_to_page1:
    LDA     #$20
    STA     ROW_ADDR2+1
    LDA     #$40
    STA     ROW_ADDR+1
    LDA     #$00
    STA     ROW_ADDR2
    STA     ROW_ADDR
    TAY

.copy_loop:
    LDA     (ROW_ADDR),Y
    STA     (ROW_ADDR2),Y
    INY
    BNE     .copy_loop

    INC     ROW_ADDR2+1
    INC     ROW_ADDR+1
    LDX     ROW_ADDR+1
    CPX     #$60
    BCC     .copy_loop

    CLC
    RTS
.reveal_screen
    JSR     IRIS_WIPE

    LDY     15
    STY     GAME_ROWNUM

.row_loop2:
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDY     27
    STY     GAME_COLNUM

.col_loop2:
    LDA     (PTR1),Y
    CMP     #$09
    BEQ     .remove
    CMP     #$08
    BNE     .next

.remove:
    LDA     #$00
    JSR     DRAW_SPRITE_PAGE2

.next:
    DEC     GAME_COLNUM
    LDY     GAME_COLNUM
    BPL     .col_loop2

    DEC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    BPL     .row_loop2

    CLC
    RTS
    ORG     $8A45
DIV_BY_7:
    SUBROUTINE
    ; Enter routine with AX set to (unsigned) numerator.
    ; On exit, Y will contain the integer portion of AX/7,
    ; and A contains the remainder.

    STX     MATH_TMPL
    LDY     8
    SEC
    SBC     7

.loop:
    PHP
    ROL     MATH_TMPH
    ASL     MATH_TMPL
    ROL
    PLP
    BCC     .adjust_up
    SBC     7
    JMP     .next

.adjust_up
    ADC     7

.next
    DEY
    BNE     .loop

    BCS     .no_adjust
    ADC     7
    CLC

.no_adjust
    ROL     MATH_TMPH
    LDY     MATH_TMPH
    RTS
    ORG     $88A2
IRIS_WIPE:
    SUBROUTINE

    LDA     88
    STA     WIPE_CENTER_Y
    LDA     140
    STA     WIPE_CENTER_X

    LDA     WIPE_MODE
    BEQ     .iris_open

    LDX     #$AA
    STX     WIPE_COUNTER
    LDX     #$00
    STX     WIPE_DIR             ; Close

.loop_close:
    JSR     IRIS_WIPE_STEP
    DEC     WIPE_COUNTER
    BNE     .loop_close

.iris_open:
    LDA     #$01
    STA     WIPE_COUNTER
    STA     WIPE_MODE           ; So next time we will close.
    STA     WIPE_DIR            ; Open
    JSR     PUT_STATUS_LIVES
    JSR     PUT_STATUS_LEVEL

.loop_open:
    JSR     IRIS_WIPE_STEP
    INC     WIPE_COUNTER
    LDA     WIPE_COUNTER
    CMP     #$AA
    BNE     .loop_open
    RTS
    ORG     $88D7
IRIS_WIPE_STEP:
    SUBROUTINE

    LDA     WIPE_COUNTER
    STA     WIPE0
    LDA     #$00
    STA     WIPE0+1         ; WIPE0 = WIPE_COUNTER
    ; fallthrough with A = 0
    STA     WIPE1
    STA     WIPE1+1         ; WIPE1 = 0
    LDA     WIPE0
    ASL
    STA     WIPE2
    LDA     WIPE0+1
    ROL
    STA     WIPE2+1         ; WIPE2 = 2 * WIPE0
    LDA     #$03
    SEC
    SBC     WIPE2
    STA     WIPE2
    LDA     #$00
    SBC     WIPE2+1
    STA     WIPE2+1         ; WIPE2 = 3 - WIPE2

; WIPE3, WIPE4, WIPE5, and WIPE6 correspond to
; row numbers. WIPE3 is above the center, WIPE6
; is below the center, while WIPE4 and WIPE5 are on
; the center.

    LDA     WIPE_CENTER_Y
    SEC
    SBC     WIPE_COUNTER
    STA     WIPE3L
    LDA     #$00
    SBC     #$00
    STA     WIPE3H          ; WIPE3 = WIPE_CENTER_Y - WIPE_COUNTER
    LDA     WIPE_CENTER_Y
    STA     WIPE4L
    STA     WIPE5L
    LDA     #$00
    STA     WIPE4H
    STA     WIPE5H          ; WIPE4 = WIPE5 = WIPE_CENTER_Y
    LDA     WIPE_CENTER_Y
    CLC
    ADC     WIPE_COUNTER
    STA     WIPE6L
    LDA     #$00
    ADC     #$00
    STA     WIPE6H          ; WIPE6 = WIPE_CENTER_Y + WIPE_COUNTER

; WIPE7, WIPE8, WIPE9, and WIPE10 correspond to
; column byte numbers. Note the division by 7 pixels!
; WIPE7 is left of center, WIPE10 is right of center,
; while WIPE8 and WIPE9 are on the center.

    LDA     WIPE_CENTER_X
    SEC
    SBC     WIPE_COUNTER
    TAX
    LDA     #$00
    SBC     #$00
    JSR     DIV_BY_7
    STY     WIPE7D
    STA     WIPE7R          ; WIPE7 = (WIPE_CENTER_X - WIPE_COUNTER) / 7
    LDX     WIPE_CENTER_X
    LDA     #$00
    JSR     DIV_BY_7
    STY     WIPE8D
    STY     WIPE9D
    STA     WIPE8R
    STA     WIPE9R          ; WIPE8 = WIPE9 = WIPE_CENTER_X / 7
    LDA     WIPE_CENTER_X
    CLC
    ADC     WIPE_COUNTER
    TAX
    LDA     #$00
    ADC     #$00
    JSR     DIV_BY_7
    STY     WIPE10D
    STA     WIPE10R         ; WIPE10 = (WIPE_CENTER_X + WIPE_COUNTER) / 7
.loop:

    LDA     WIPE1+1
    CMP     WIPE0+1
    BCC     .draw_wipe_step ; Effectively, if WIPE1 > WIPE0, jump to .draw_wipe_step.
    BEQ     .8969           ; Otherwise jump to .loop1, which...

.loop1:
    LDA     WIPE1
    CMP     WIPE0
    BNE     .end
    LDA     WIPE1+1
    CMP     WIPE0+1
    BNE     .end            ; If WIPE0 != WIPE1, return.
    JMP     DRAW_WIPE_STEP

.end:
    RTS

.8969:
    LDA     WIPE1
    CMP     WIPE0
    BCS     .loop1          ; The other half of the comparison from .loop.

.draw_wipe_step:

    JSR     DRAW_WIPE_STEP

    LDA     WIPE2+1
    BPL     .89a7

    LDA     WIPE1
    ASL
    STA     MATH_TMPL
    LDA     WIPE1+1
    ROL
    STA     MATH_TMPH       ; MATH_TMP = WIPE1 * 2

    LDA     MATH_TMPL
    ASL
    STA     MATH_TMPL
    LDA     MATH_TMPH
    ROL
    STA     MATH_TMPH       ; MATH_TMP *= 2

    LDA     WIPE2
    CLC
    ADC     MATH_TMPL
    STA     MATH_TMPL
    LDA     WIPE2+1
    ADC     MATH_TMPH
    STA     MATH_TMPH       ; MATH_TMP += WIPE2

    LDA     #$06
    CLC
    ADC     MATH_TMPL
    STA     WIPE2
    LDA     #$00
    ADC     MATH_TMPH
    STA     WIPE2+1        ; WIPE2 = MATH_TMP + 6
    JMP     .8a14

.89a7:

    LDA     WIPE1
    SEC
    SBC     WIPE0
    STA     MATH_TMPL
    LDA     WIPE1+1
    SBC     WIPE0+1
    STA     MATH_TMPH       ; MATH_TMP = WIPE1 - WIPE0

    LDA     MATH_TMPL
    ASL
    STA     MATH_TMPL
    LDA     MATH_TMPH
    ROL
    STA     MATH_TMPH       ; MATH_TMP *= 2

    LDA     MATH_TMPL
    ASL
    STA     MATH_TMPL
    LDA     MATH_TMPH
    ROL
    STA     MATH_TMPH       ; MATH_TMP *= 2

    LDA     MATH_TMPL
    CLC
    ADC     #$10
    STA     MATH_TMPL
    LDA     MATH_TMPH
    ADC     #$00
    STA     MATH_TMPH       ; MATH_TMP += 16

    LDA     MATH_TMPL
    CLC
    ADC     WIPE2
    STA     WIPE2
    LDA     MATH_TMPH
    ADC     WIPE2+1
    STA     WIPE2+1        ; WIPE2 += MATH_TMP
    LDA     WIPE0
    PHP
    DEC     WIPE0
    PLP
    BNE     .b9ec
    DEC     WIPE0+1         ; WIPE0--
.b9ec
    INC     WIPE3L
    BNE     .89f2
    INC     WIPE3H          ; WIPE3++
.89f2
    DEC     WIPE10R
    BPL     .89fc
    LDA     #$06
    STA     WIPE10R
    DEC     WIPE10D
.89fc
    INC     WIPE7R
    LDA     WIPE7R
    CMP     #$07
    BNE     .8a0a
    LDA     #$00
    STA     WIPE7R
    INC     WIPE7D
.8a0a
    DEC     WIPE6L
    LDA     WIPE6L
    CMP     #$FF
    BNE     .8a14
    DEC     WIPE6H

.8a14:

    INC     WIPE1
    BNE     .8a1a
    INC     WIPE1+1          ; WIPE1++
.8a1a
    INC     WIPE9R
    LDA     WIPE9R
    CMP     #$07
    BNE     .8a28
    LDA     #$00
    STA     WIPE9R
    INC     WIPE9D
.8a28
    DEC     WIPE4L
    LDA     WIPE4L
    CMP     #$FF
    BNE     .8a32
    DEC     WIPE4H
.8a32
    INC     WIPE5L
    BNE     .8a38
    INC     WIPE5H          ; WIPE5++
.8a38
    DEC     WIPE8R
    BPL     .8a42
    LDA     #$06
    STA     WIPE8R
    DEC     WIPE8D
.8a42
    JMP     .loop
    ORG     $8A69
DRAW_WIPE_STEP:
    SUBROUTINE

    LDY     WIPE6H
    BNE     .draw_north
    LDY     WIPE6L
    CPY     176
    BCS     .draw_north        ; Skip if WIPE6 >= 176

    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES

    ; East side
    LDY     WIPE9D
    CPY     40
    BCS     .draw_south_west
    LDX     WIPE9R
    JSR     DRAW_WIPE_BLOCK

.draw_south_west
    ; West side
    LDY     WIPE8D
    CPY     40
    BCS     .draw_north
    LDX     WIPE9R
    JSR     DRAW_WIPE_BLOCK
.draw_north:
    LDY     WIPE3H
    BNE     .draw_north2
    LDY     WIPE3L
    CPY     176
    BCS     .draw_north2        ; Skip if WIPE3 >= 176

    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES

    ; East side
    LDY     WIPE9D
    CPY     40
    BCS     .draw_north_west
    LDX     WIPE9R
    JSR     DRAW_WIPE_BLOCK

.draw_north_west
    ; West side
    LDY     WIPE8D
    CPY     40
    BCS     .draw_north2
    LDX     WIPE9R
    JSR     DRAW_WIPE_BLOCK
.draw_north2:
    LDY     WIPE5H
    BNE     .draw_south2
    LDY     WIPE5L
    CPY     176
    BCS     .draw_south2        ; Skip if WIPE5 >= 176

    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES

    ; East side
    LDY     WIPE10D
    CPY     40
    BCS     .draw_north2_west
    LDX     WIPE10R
    JSR     DRAW_WIPE_BLOCK

.draw_north2_west
    ; West side
    LDY     WIPE7D
    CPY     40
    BCS     .draw_south2
    LDX     WIPE7R
    JSR     DRAW_WIPE_BLOCK
.draw_south2:
    LDY     WIPE4H
    BNE     .end
    LDY     WIPE4L
    CPY     176
    BCS     .end        ; Skip if WIPE4 >= 176

    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES

    ; East side
    LDY     WIPE10D
    CPY     40
    BCS     .draw_south2_west
    LDX     WIPE10R
    JSR     DRAW_WIPE_BLOCK

.draw_south2_west
    ; West side
    LDY     WIPE7D
    CPY     40
    BCS     .draw_south2
    LDX     WIPE7R
    JMP     DRAW_WIPE_BLOCK           ; tail call

.end:
    RTS
    ORG     $8AF6
DRAW_WIPE_BLOCK:
    SUBROUTINE
    ; Enter routine with X set to the column byte and Y set to
    ; the pixel number within that byte (0-6). ROW_ADDR and
    ; ROW_ADDR2 must contain the base row address for page 1
    ; and page 2, respectively.

    LDA     WIPE_DIR
    BNE     .open
    LDA     (ROW_ADDR),Y
    AND     WIPE_BLOCK_CLOSE_MASK,X
    STA     (ROW_ADDR),Y

.open:
    LDA     (ROW_ADDR2),Y
    AND     WIPE_BLOCK_OPEN_MASK,X
    ORA     (ROW_ADDR),Y
    STA     (ROW_ADDR),Y
    RTS
