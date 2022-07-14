    PROCESSOR 6502
    ORG    $0000
    DS 1
    ORG    $000A
TMP_PTR         DS.W    1
    ORG    $0010
SAVED_RET_ADDR      DS.W    1
    ORG    $001D
ROW_COUNT       DS      1
SPRITE_NUM      DS      1
ROW_ADDR        EQU     $0C     ; 2 bytes
ROW_ADDR2       EQU     $0E     ; 2 bytes
HGR_PAGE        EQU     $1F     ; 0x20 for HGR1, 0x40 for HGR2
ROWNUM          EQU     $1B
COLNUM          EQU     $1C
MASK0           EQU     $50
MASK1           EQU     $51
COL_SHIFT_AMT   EQU     $71
GAME_COLNUM     EQU     $85
GAME_ROWNUM     EQU     $86
SCREENS_DIFFER      EQU     $52
DRAW_PAGE   EQU     $87     ; 0x20 for page 1, 0x40 for page 2
    ORG    $0023
JMP_RWTS:
    SUBROUTINE

    JMP     $0000       ; Gets loaded with RWTS address later

    ORG    $0036
INDIRECT_TARGET:
    WORD    DEFAULT_INDIRECT_TARGET
DISABLE_INTS_CALL_RWTS_PTR:
    WORD    DISABLE_INTS_CALL_RWTS

DISABLE_INTS_CALL_RWTS      EQU     $B7B5

    ORG    $0060
GUARD_PATTERNS:
    BYTE    %10000110
    BYTE    %00111110
    BYTE    %10000101
    ORG    $008C
FRAME_PERIOD:
    HEX     06
SCRATCH_5C      EQU     $5C
PADDLE0_VALUE       EQU     $65
PADDLE1_VALUE       EQU     $66
PADDL0              EQU     $C064
PADDL1              EQU     $C065
PTRIG               EQU     $C070
INPUT_MODE  EQU     $95         ; 0xCA = Joystick mode (J), 0xCB = Keyboard mode (K)
    ORG    $008D
SCORE       DS      4       ; BCD format, tens/units in first byte.
    ORG    $0095
    HEX     CA                  ; Start in joystick mode
JOYSTICK_MODE   EQU     #$CA
KEYBOARD_MODE   EQU     #$CB

BUTN0       EQU     $C061       ; Or open apple
BUTN1       EQU     $C062       ; Or solid apple
SCRATCH_A1      EQU     $A1
    ORG    $00A6
LEVELNUM    DS      1
    ORG    $00C0
HUNDREDS        DS      1
TENS            DS      1
UNITS           DS      1
    ORG    $00C8
LIVES       DS      1
NOTE_INDEX      EQU     $54
SOUND_DURATION  EQU     $0E00       ; 128 bytes
SOUND_PITCH     EQU     $0E80       ; 128 bytes
ENABLE_SOUND    EQU     $99     ; If 0, do not click speaker.
SPKR            EQU     $C030   ; Access clicks the speaker.
    ORG    $00DF
BLOCK_DATA      DS      33
    ORG    $0C00
LADDER_LOCS_COL     DS      48
LADDER_LOCS_ROW     DS      48
    ORG    $0CE0
TABLE_0CE0      DS      31
    ORG    $1A85
ROW_TO_OFFSET_LO:
    INCLUDE "row_to_offset_lo_table.asm"
ROW_TO_OFFSET_HI:
    INCLUDE "row_to_offset_hi_table.asm"
    ORG    $1C05
CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS:
    HEX     00 1C 38 54 70 8C A8 C4 E0 FC 18 34 50 6C 88 A4
CURR_LEVEL_ROW_SPRITES_PTR_PAGES:
    HEX     08 08 08 08 08 08 08 08 08 08 09 09 09 09 09 09
CURR_LEVEL_ROW_SPRITES_PTR_PAGES2:
    HEX     0A 0A 0A 0A 0A 0A 0A 0A 0A 0A 0B 0B 0B 0B 0B 0B
    ORG    $1C35
HALF_SCREEN_COL_TABLE:
    ; 28 cols of 5 double-pixels each
    HEX     00 05 0a 0f 14 19 1e 23 28 2d 32 37 3c 41 46 4b
    HEX     50 55 5a 5f 64 69 6e 73 78 7d 82 87
SCREEN_ROW_TABLE:
    ; 17 rows of 11 pixels each
    HEX     00 0B 16 21 2C 37 42 4D 58 63 6E 79 84 8F 9A A5
    HEX     B5
COL_BYTE_TABLE:
    ; Byte number
    HEX     00 01 02 04 05 07 08 0A 0B 0C 0E 0F 11 12 14 15
    HEX     16 18 19 1B 1C 1E 1F 20 22 23 25 26
COL_SHIFT_TABLE:
    ; Right shift amount
    HEX     00 03 06 02 05 01 04 00 03 06 02 05 01 04 00 03
    HEX     06 02 05 01 04 00 03 06 02 05 01 04
HALF_SCREEN_COL_BYTE_TABLE:
    HEX     00 00 00 00 01 01 01 02 02 02 02 03 03 03 04 04
    HEX     04 04 05 05 05 06 06 06 06 07 07 07 08 08 08 08
    HEX     09 09 09 0A 0A 0A 0A 0B 0B 0B 0C 0C 0C 0C 0D 0D
    HEX     0D 0E 0E 0E 0E 0F 0F 0F 10 10 10 10 11 11 11 12
    HEX     12 12 12 13 13 13 14 14 14 14 15 15 15 16 16 16
    HEX     16 17 17 17 18 18 18 18 19 19 19 1A 1A 1A 1A 1B
    HEX     1B 1B 1C 1C 1C 1C 1D 1D 1D 1E 1E 1E 1E 1F 1F 1F
    HEX     20 20 20 20 21 21 21 22 22 22 22 23 23 23 24 24
    HEX     24 24 25 25 25 26 26 26 26 27 27 27
HALF_SCREEN_COL_SHIFT_TABLE:
    HEX     00 02 04 06 01 03 05 00 02 04 06 01 03 05 00 02
    HEX     04 06 01 03 05 00 02 04 06 01 03 05 00 02 04 06
    HEX     01 03 05 00 02 04 06 01 03 05 00 02 04 06 01 03
    HEX     05 00 02 04 06 01 03 05 00 02 04 06 01 03 05 00
    HEX     02 04 06 01 03 05 00 02 04 06 01 03 05 00 02 04
    HEX     06 01 03 05 00 02 04 06 01 03 05 00 02 04 06 01
    HEX     03 05 00 02 04 06 01 03 05 00 02 04 06 01 03 05
    HEX     00 02 04 06 01 03 05 00 02 04 06 01 03 05 00 02
    HEX     04 06 01 03 05 00 02 04 06 01 03 05
    ORG    $5F7D

    LDA     ROMIN_RDROM_WRRAM2
    LDA     ROMIN_RDROM_WRRAM2
    LDA     TXTCLR
    LDA     MIXCLR
    LDA     TXTPAGE1
    LDA     HIRES

    LDX     #$07
    TXS

    CLC
    LDA     #$01
    AND     #$A4
    BEQ     .short_delay_mode
    SEC
    ; fall through to short delay mode

    ORG    $5F9A

.short_delay_mode:
    LDX     #$22            ; Number of times to check for keyboard press (34).
    LDY     #$02            ; Number of times to do X checks (2).
                            ; GAME_ROWNUM was initialized to 1, so we do 34*2*1 checks.
    LDA     KBDSTRB
    LDA     JOYSTICK_MODE            ; Fake keypress 0x4A (J)
    JMP     CHECK_FOR_BUTTON_DOWN


    ORG    $6008
RESET_GAME:
    SUBROUTINE

    JSR     CLEAR_HGR1

    LDA     #$FF
    STA     .rd_table+1
    LDA     #$0E
    STA     .rd_table+2     ; RD_TABLE = 0x0EFF
    LDY     0
    STY     GAME_ROWNUM
    STY     PREGAME_MODE
    STY     DISK_LEVEL_LOC  ; GAME_ROWNUM = DISK_LEVEL_LOC = PREGAME_MODE = 0
    LDA     #$20
    STA     HGR_PAGE
    STA     DRAW_PAGE       ; HGR_PAGE = DRAW_PAGE = 0x20

.draw_splash_screen_row:
    JSR     ROW_TO_ADDR     ; ROW_ADDR = ROW_TO_ADDR(Y)
    LDY     #0

.loop:
    INC     .rd_table+1
    BNE     .rd_table
    INC     .rd_table+2     ; RD_TABLE++

.rd_table:
    LDA     $1A84           ; A <- *RD_TABLE ($1A84 is just a dummy value)
    BEQ     .end_of_row     ; if A == 0: break
    BPL     .is_row_offset  ; if A > 0: A -> Y, .loop
    STA     (ROW_ADDR),Y    ; *(ROW_ADDR+Y) = A

    INY                     ; Y++
    BPL     .loop           ; While Y < 0x80 (really while not 00)

.is_row_offset:
    TAY
    BPL     .loop           ; Unconditional jump

.end_of_row:
    INC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    CPY     #192
    BCC     .draw_splash_screen_row


    STA     TXTPAGE1
    STA     HIRES
    STA     MIXCLR
    STA     TXTCLR
    JMP     .long_delay_attract_mode

    ORG    $6056

.init_game_data:
    LDA     #0
    STA     SCORE
    STA     SCORE+1
    STA     SCORE+2
    STA     SCORE+3
    STA     GUARD_PATTERN_OFFSET
    STA     WIPE_MODE       ; WIPE_MODE = SCORE = $97 = 0
    STA     $53
    STA     $AB
    STA     $A8             ; $53 = $AB = $A8 = 0
    LDA     #$9B            ; 155
    STA     $A9             ; $A9 = 155
    LDA     #5
    STA     LIVES           ; LIVES = 5
    LDA     PREGAME_MODE
    LSR
    ; if PREGAME_MODE was 0 or 1 (i.e. not displaying high score screen or splash screen),
    ; play the game.
    BEQ     .put_status_and_start_game   

    ; We were displaying the high score screen or splash screen
    LDA     #1
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; Read hi score data
    CMP     #$00
    BNE     .set_rwts_target
    JSR     BAD_DATA_DISK
    JMP     RESET_GAME

.set_rwts_target:
    LDA     $1FFF
    BNE     .use_dos_target
    LDA     INDIRECT_TARGET
    LDX     INDIRECT_TARGET+1
    BNE     .store_rwts_addr

.use_dos_target:
    LDA     DISABLE_INTS_CALL_RWTS_PTR
    LDX     DISABLE_INTS_CALL_RWTS_PTR+1

.store_rwts_addr:
    STA     RWTS_ADDR
    STX     RWTS_ADDR+1

.put_status_and_start_game:
    JSR     PUT_STATUS
    STA     TXTPAGE1

    ORG    $609F

.start_game:
    LDX     #$01
    JSR     LOAD_LEVEL
    LDA     #$00
    STA     KEY_COMMAND
    STA     $9F
    LDA     PREGAME_MODE
    LSR
    ; if PREGAME_MODE was 0 or 1 (i.e. not displaying high score screen),
    ; play the game.
    BEQ     .play_game

    ; When PREGAME_MODE is 2:
    JSR     $869F
    LDA     PLAYER_COL
    STA     GAME_COLNUM
    LDA     PLAYER_ROW
    STA     GAME_ROWNUM
    LDA     #$09
    JSR     $8700

.play_game:
    LDX     #$00
    STX     DIG_DIRECTION
    STX     NOTE_INDEX

    LDA     GUARD_PATTERN_OFFSET
    CLC
    ADC     GUARD_COUNT         ; GUARD_COUNT + $97 can't be greater than 8.
    TAY
    LDX     TIMES_3_TABLE,Y     ; X = 3 * Y (goes up to Y=8)
    LDA     GUARD_PATTERNS_LIST,X
    STA     GUARD_PATTERNS
    LDA     GUARD_PATTERNS_LIST+1,X
    STA     GUARD_PATTERNS+1
    LDA     GUARD_PATTERNS_LIST+2,X
    STA     GUARD_PATTERNS+2

    LDY     GUARD_PATTERN_OFFSET
    LDA     $621D,Y
    STA     $5F

    ORG    $60E4
.game_loop:
    JSR     MOVE_PLAYER
    LDA     ALIVE
    BEQ     .died

    JSR     PLAY_SOUND

    LDA     GOLD_COUNT
    BNE     .still_gold_present
    JSR     $8631

.still_gold_present:
    LDA     PLAYER_ROW
    BNE     .not_at_top
    LDA     PLAYER_Y_ADJ
    CMP     #$02
    BNE     .not_at_top

    ; Reached top of screen
    LDA     GOLD_COUNT
    BEQ     .level_cleared
    CMP     #$FF
    BEQ     .level_cleared      ; level cleared if GOLD_COUNT == 0 or -1.

.not_at_top:
    JSR     $75F4
    LDA     ALIVE
    BEQ     .died
    JSR     PLAY_SOUND
    JSR     MOVE_GUARDS
    LDA     ALIVE
    BEQ     .died
    BNE     .game_loop

.level_cleared:
    INC     LEVELNUM
    INC     DISK_LEVEL_LOC
    INC     LIVES
    BNE     .lives_incremented
    DEC     LIVES               ; LIVES doesn't overflow.

.lives_incremented:
    ; Increment score by 1500, playing an ascending tune while doing so.
    LDX     #$0F
    STX     SCRATCH_5C

.loop2:
    LDY     #$01
    LDA     #$00
    JSR     ADD_AND_UPDATE_SCORE    ; SCORE += 100
    JSR     APPEND_LEVEL_CLEARED_NOTE
    JSR     APPEND_LEVEL_CLEARED_NOTE
    JSR     APPEND_LEVEL_CLEARED_NOTE
    DEC     SCRATCH_5C
    BNE     .loop2

.start_game_:
    JMP     .start_game

.died:
    DEC     LIVES
    JSR     PUT_STATUS_LIVES
    JSR     LOAD_SOUND_DATA
    HEX     02 40 02 40 03 50 03 50 04 60 04 60 05 70 05 70
    HEX     06 80 06 80 07 90 07 90 08 A0 08 A0 09 B0 09 B0
    HEX     0A C0 0A C0 0B D0 0B D0 0C E0 0C E0 0D F0 0D F0
    HEX     00

.play_died_tune:
    JSR     PLAY_SOUND
    BCS     .play_died_tune

    LDA     PREGAME_MODE
    LSR
    BEQ     .restore_enable_sound     ; If PREGAME_MODE is 0 or 1

    LDA     LIVES
    BNE     .start_game_    ; We can still play.

    ; Game over
    JSR     RECORD_HI_SCORE_DATA_TO_DISK
    JSR     SPINNING_GAME_OVER
    BCS     .key_pressed


    ORG    $618E

.long_delay_attract_mode:
    JSR     $869f
    LDX     #$FF
    LDY     #$FF
    LDA     #$03
    STA     GAME_ROWNUM

    ; fall through to .check_input_mode


    ; Game loop

    ORG    $6199

.check_input_mode:
    LDA     INPUT_MODE

CHECK_FOR_BUTTON_DOWN:
    CMP     KEYBOARD_MODE
    BEQ     .no_button_pressed  ; If keyboard mode, skip check button presses.
    LDA     BUTN1
    BMI     .button_pressed
    LDA     BUTN0
    BMI     .button_pressed

    ; fall through to .no_button_pressed

    ORG    $61A9

.no_button_pressed:
    LDA     KBD
    BMI     .key_pressed
    DEX
    BNE     .check_input_mode
    DEY
    BNE     .check_input_mode
    DEC     GAME_ROWNUM
    BNE     .check_input_mode

    ; fall through to .no_button_or_key_timeout

    ORG    $61B8

.no_button_or_key_timeout:
    LDA     PREGAME_MODE
    BNE     .check_game_mode    ; If PREGAME_MODE != 0, .check_game_mode.

    ; When PREGAME_MODE = 0:
    LDX     #$01
    STX     PREGAME_MODE        ; Set PREGAME_MODE = 1
    STX     LEVELNUM
    STX     $AC
    STX     $9D                 ; LEVELNUM = $AC = $9D = 1
    LDX     ENABLE_SOUND
    STX     .restore_enable_sound+1    ; Save previous value of DNABLE_SOUND
    STA     ENABLE_SOUND
    JMP     .init_game_data

.restore_enable_sound:
    LDA     #$00            ; Fixed up above
    STA     ENABLE_SOUND
    LDA     KBD
    LDX     $AC
    BEQ     .key_pressed
    JMP     .long_delay_attract_mode

    ORG    $61DE

.check_game_mode:
    CMP     #$01
    BNE     .reset_game
    BEQ     .pregame_mode_2        ; Unconditional jump

    ORG    $61E4

.return_pressed:
    LDA     #$01
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; read hi score table

    ; fallthrough to .pregame_mode_2

    ORG    $61E9

.pregame_mode_2:
    JSR     HI_SCORE_SCREEN
    LDA     #$02
    STA     PREGAME_MODE            ; PREGAME_MODE = 2
    JMP     .long_delay_attract_mode

    ORG    $61F3

.reset_game:
    JMP     RESET_GAME

    ORG    $61F6

.key_pressed:
    STA     KBDSTRB     ; Clear keyboard strobe
    CMP     #$85        ; if ctrl-E:
    BEQ     .ctrl_e_pressed
    CMP     #$8D        ; if return key:
    BEQ     .return_pressed

    ; fall through to .button_pressed

    ORG    $6201

.button_pressed:
    LDX     #$00
    STX     DISK_LEVEL_LOC      ; DISK_LEVEL_LOC = 0
    INX
    STX     LEVELNUM            ; LEVELNUM = 1
    STX     $9D
    LDA     #$02
    STX     PREGAME_MODE
    JMP     .play_game

    ORG    $6211

.ctrl_e_pressed:
    JMP     START_LEVEL_EDITOR

    ORG    $6214
TIMES_3_TABLE:
    HEX     00 03 06 09 0C 0F 12 15 18
    ORG    $622A
APPEND_LEVEL_CLEARED_NOTE:
    SUBROUTINE

    LDA     SCRATCH_5C
    ASL
    ASL
    ASL
    ASL                         ; pitch = SCRATCH_5C * 16
    LDX     #$06                ; duration
    JSR     APPEND_NOTE
    JMP     PLAY_SOUND


    ; Joystick routines

    ORG    $6238
LOAD_LEVEL:
    SUBROUTINE
    ; Enter routine with X set to whether the level should be
    ; loaded verbatim or not.

    STX     VERBATIM

    LDX     #$FF
    STX     PLAYER_COL
    INX
    STX     LADDER_COUNT
    STX     GOLD_COUNT
    STX     GUARD_COUNT
    STX     $19
    STX     $A0
    STX     LEVEL_DATA_INDEX
    STX     TMP
    STX     GAME_ROWNUM
    TXA

    LDX     30
.loop1
    STA     TABLE_0CE0,X
    DEX
    BPL     .loop1

    LDX     5
.loop2
    STA     GUARD_FLAGS_5,X
    DEX
    BPL     .loop2


    LDA     #1
    STA     ALIVE       ; Set player live
    JSR     LOAD_COMPRESSED_LEVEL_DATA

.row_loop:
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDA     #0
    STA     GAME_COLNUM

.col_loop:
    LDA     TMP                         ; odd/even counter
    LSR
    LDY     LEVEL_DATA_INDEX
    LDA     DISK_BUFFER,Y
    BCS     .628c                       ; odd? 
    AND     #$0F
    BPL     .6292                       ; unconditional jump
.628c

    LSR
    LSR
    LSR
    LSR
    INC     LEVEL_DATA_INDEX

.6292
    INC     TMP

    LDY     GAME_COLNUM
    CMP     10
    BCC     .629c
    LDA     #0                           ; sprite >= 10 -> sprite 0
.629c:

    STA     (PTR1),Y
    STA     (PTR2),Y

    INC     GAME_COLNUM
    LDA     GAME_COLNUM
    CMP     28
    BCC     .col_loop                   ; loop while GAME_COLNUM < 28

    INC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    CPY     16
    BCC     .row_loop                   ; loop while GAME_ROWNUM < 16


    JSR     DRAW_LEVEL_PAGE2
    BCC     .end                ; No error

    LDA     DISK_LEVEL_LOC
    BEQ     .reset_game

    LDX     0
    STX     DISK_LEVEL_LOC
    INC     GUARD_PATTERN_OFFSET
    DEX
    JMP     LOAD_LEVEL


.end:
    RTS

.reset_game:
    JMP     RESET_GAME



    ; Sound routines

    ORG    $630E
LOAD_COMPRESSED_LEVEL_DATA:
    SUBROUTINE
    ; Enter routine with A set to command: 1 = read, 2 = write, 4 = format

    STA     IOB_COMMAND_CODE
    LDA     PREGAME_MODE
    LSR
    BEQ     .copy_level_data        ; If PREGAME_MODE is 0 or 1, copy level data

    ; Read/write/format level on disk
    LDA     DISK_LEVEL_LOC
    LSR
    LSR
    LSR
    LSR
    CLC
    ADC     3
    STA     IOB_TRACK_NUMBER            ; track 3 + (DISK_LEVEL_LOC >> 4)
    LDA     DISK_LEVEL_LOC
    AND     #$0F
    STA     IOB_SECTOR_NUMBER           ; sector DISK_LEVEL_LOC & 0x0F
    LDA     #$<DISK_BUFFER
    STA     IOB_READ_WRITE_BUFFER_PTR
    LDA     #$>DISK_BUFFER
    STA     IOB_READ_WRITE_BUFFER_PTR+1 ; IOB_READ_WRITE_BUFFER_PTR = 0D00
    LDA     #$00
    STA     IOB_VOLUME_NUMBER_EXPECTED  ; any volume

ACCESS_DISK_OR_RESET_GAME:
    LDY     #<DOS_IOB
    LDA     #>DOS_IOB
    JSR     JMP_RWTS
    BCC     .end
    JMP     RESET_GAME      ; On error

.end:
    RTS

.copy_level_data:
    LDA     LEVELNUM        ; 1-based
    CLC
    ADC     #$9E
    STA     ROW_ADDR+1
    LDY     #$00
    STY     ROW_ADDR        ; ROW_ADDR <- 9E00 + LEVELNUM * 0x100

.copyloop:
    LDA     (ROW_ADDR),Y
    STA     DISK_BUFFER,Y
    INY
    BNE     .copyloop
    RTS



    ORG    $6359
ACCESS_HI_SCORE_DATA_FROM_DISK:
    SUBROUTINE

    STA     IOB_COMMAND_CODE
    LDA     #$0C
    STA     IOB_TRACK_NUMBER
    LDA     #$0F
    STA     IOB_SECTOR_NUMBER
    LDA     #<HI_SCORE_DATA
    STA     IOB_READ_WRITE_BUFFER_PTR
    LDA     #>HI_SCORE_DATA
    STA     IOB_READ_WRITE_BUFFER_PTR+1
    LDA     #$00
    STA     IOB_VOLUME_NUMBER_EXPECTED
    LDY     #<DOS_IOB
    LDA     #>DOS_IOB
    JSR     INDIRECT_RWTS
    BCC     .no_error
    JMP     RESET_GAME

.no_error:
    LDY     #$0A
    LDA     #$00
    STA     MASK0       ; temp storage

.loop:
    LDA     HI_SCORE_DATA+244,Y
    EOR     HI_SCORE_DATA_MARKER,Y
    ORA     MASK0
    STA     MASK0
    DEY
    BPL     .loop

    LDA     MASK0
    BEQ     .all_zero_data

    LDA     #$00
    RTS

.all_zero_data:
    LDA     #$01
    LDX     $1FFF
    BNE     .end
    LDA     #$FF

.end:
    RTS

    ORG    $63A5
INDIRECT_RWTS:
    SUBROUTINE
    JMP     (INDIRECT_TARGET)

    ORG    $63A8
HI_SCORE_DATA_MARKER:
    ; Spells out "LODE RUNNER".
    HEX     CC CF C4 C5 A0 D2 D5 CE CE C5 D2
    ORG    $63B3
DRAW_LEVEL_PAGE2:
    SUBROUTINE
    ; Returns carry set if there was no player sprite in the level,
    ; or carry clear if there was.

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
    LDA     #0
    STA     (PTR1),Y
    STA     (PTR2),Y

.draw_sprite1
    BEQ     .draw_sprite        ; Unconditional jump.
.check_for_box:
    CMP      #$07
    BNE     .check_for_guard

    INC     GOLD_COUNT
    BNE     .draw_sprite        ; This leads to a situation where if we wrap
                                ; GOLD_COUNT around back to 0 (so 256 boxes)
                                ; we end up falling through, which eventually
                                ; just draws the sprite anyway. So this is kind
                                ; of unconditional.

.check_for_guard:
    CMP     #$08
    BNE     .check_for_player

    LDX     GUARD_COUNT
    CPX     5
    BCS     .remove_sprite          ; If GUARD_COUNT >= 5, remove sprite.

    INC     GUARD_COUNT
    INX
    TYA
    STA     GUARD_LOCS_COL,X
    LDA     GAME_ROWNUM
    STA     GUARD_LOCS_ROW,X
    LDA     #$00
    STA     GUARD_FLAGS_0,X
    STA     GUARD_ANIM_STATES,X
    LDA     #$02
    STA     GUARD_X_ADJS,X
    STA     GUARD_Y_ADJS,X

    LDA     #$00
    STA     (PTR2),Y
    LDA     #$08
    BNE     .draw_sprite            ; Unconditional jump.

.next_row:
    BPL     .row_loop
.next_col:
    BPL     .col_loop
.check_for_player:
    CMP     #$09
    BNE     .check_for_t_thing

    LDX     PLAYER_COL
    BPL     .remove_sprite          ; If PLAYER_COL > 0, remove sprite.

    STY     PLAYER_COL
    LDX     GAME_ROWNUM
    STX     PLAYER_ROW
    LDX     #$02
    STX     PLAYER_X_ADJ
    STX     PLAYER_Y_ADJ            ; Set Player X and Y movement to 0.
    LDX     #$08
    STX     PLAYER_ANIM_STATE       ; Corresponds to sprite 9 (see SPRITE_ANIM_SEQS)

    LDA     #$00
    STA     (PTR2),Y
    LDA     #$09
    BNE     .draw_sprite            ; Unconditional jump.
.check_for_t_thing:
    CMP     #$05
    BNE     .draw_sprite
    LDA     #$01                    ; Brick sprite

    ; fallthrough to .draw_sprite
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

    ORG    $64BD
MOVE_PLAYER:
    SUBROUTINE

    LDA     #$01
    STA     DIDNT_PICK_UP_GOLD   ; Reset DIDNT_PICK_UP_GOLD

    ; If we're digging, see if we can keep digging.
    LDA     DIG_DIRECTION
    BEQ     .not_digging
    BPL     .digging_right
    JMP     TRY_DIGGING_LEFT_check_can_dig_left

.digging_right:
    JMP     TRY_DIGGING_RIGHT_check_can_dig_right

.not_digging:
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$03
    BEQ     .check_for_keyboard_input_      ; ladder at background location?
    CMP     #$04
    BEQ     .check_if_player_should_fall    ; rope at background location?
    LDA     PLAYER_Y_ADJ
    CMP     #$02
    BEQ     .check_for_keyboard_input_      ; player at exact sprite row?

    ; player is not on exact sprite row, fallthrough.

.check_if_player_should_fall:
    LDA     PLAYER_Y_ADJ
    CMP     #$02                                    
    BCC     .make_player_fall               ; player slightly above sprite row?

    LDY     PLAYER_ROW
    CPY     #$0F
    BEQ     .check_for_keyboard_input_      ; player exactly sprite row 15?

    ; Check the sprite at the player location
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS+1,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES+1,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2+1,Y
    STA     PTR2+1


    LDY     PLAYER_COL
    LDA     (PTR1),Y
    CMP     #$00                    ; Empty
    BEQ     .make_player_fall
    CMP     #$08                    ; Guard
    BEQ     .check_for_keyboard_input_
    LDA     (PTR2),Y
    CMP     #$01                    ; Brick
    BEQ     .check_for_keyboard_input_
    CMP     #$02                    ; Stone
    BEQ     .check_for_keyboard_input_
    CMP     #$03                    ; Ladder
    BNE     .make_player_fall

.check_for_keyboard_input_:
    JMP     .check_for_keyboard_input

.make_player_fall:
    LDA     #$00
    STA     $9B                     ; $9B = 0
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS

    LDA     #$07                    ; Next anim state: player falling, facing left
    LDX     PLAYER_FACING_DIRECTION
    BMI     .player_facing_left
    LDA     #$0F                    ; Next anim state: player falling, facing right
.player_facing_left:
    STA     PLAYER_ANIM_STATE

    JSR     $6C13

    INC     PLAYER_Y_ADJ            ; Move down one
    LDA     PLAYER_Y_ADJ
    CMP     #$05
    BCS     .adjustment_overflow

    JSR     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER
    JMP     DRAW_PLAYER            ; tailcall

.adjustment_overflow:
    LDA     #$00
    STA     PLAYER_Y_ADJ            ; Set vertical adjust to -2

    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS+1,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES+1,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2+1,Y
    STA     PTR2+1

    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$01                ; Brick
    BNE     .set_on_level
    LDA     #$00                ; Store empty sprite
.set_on_level:
    STA     (PTR1),Y
    INC     PLAYER_ROW          ; Move down

    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS+1,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES+1,Y
    STA     PTR1+1


    LDY     PLAYER_COL
    LDA     #$09            ; player facing right
    STA     (PTR1),Y
    JMP     DRAW_PLAYER     ; tailcall

.check_for_keyboard_input:
    LDA     $9B
    BNE     .check_for_key  ; $9B doesn't play note
    LDA     #$64
    LDX     #$08
    JSR     PLAY_NOTE       ; play note, pitch 0x64, duration 8.

.check_for_key:
    LDA     #$20
    STA     $A4
    STA     $9B
    JSR     CHECK_FOR_INPUT
    LDA     KEY_COMMAND
    CMP     #$C9            ; 'I'
    BNE     .check_for_K
    JSR     TRY_MOVING_UP
    BCS     .check_for_J    ; couldn't move up
    RTS

.check_for_K:
    CMP     #$CB            ; 'K'
    BNE     .check_for_U
    JSR     TRY_MOVING_DOWN
    BCS     .check_for_J
    RTS

.check_for_U:
    CMP     #$D5            ; 'U'
    BNE     .check_for_O
    JSR     TRY_DIGGING_LEFT
    BCS     .check_for_J
    RTS

.check_for_O:
    CMP     #$CF            ; 'O'
    BNE     .check_for_J
    JSR     TRY_DIGGING_RIGHT
    BCS     .check_for_J
    RTS

.check_for_J:
    LDA     $9F
    CMP     #$CA            ; 'J'
    BNE     .check_for_L
    JMP     TRY_MOVING_LEFT

.check_for_L:
    CMP     #$CC            ; 'L'
    BNE     .end
    JMP     TRY_MOVING_RIGHT

.end:
    RTS

    ORG    $65D3
TRY_MOVING_LEFT:
    SUBROUTINE

    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDX     PLAYER_X_ADJ
    CPX     #$03
    BCS     .move_player_left       ; player slightly right, so can move left.

    LDY     PLAYER_COL  
    BEQ     .cannot_move            ; col == 0, so cannot move.

    DEY
    LDA     (PTR1),Y
    CMP     #$02
    BEQ     .cannot_move
    CMP     #$01
    BEQ     .cannot_move
    CMP     #$05
    BEQ     .move_player_left       ; brick, stone, or T-thing to left, so cannot move.

.cannot_move:
    RTS

.move_player_left:
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    LDA     #$FF
    STA     PLAYER_FACING_DIRECTION             ; face left
    JSR     MOVE_PLAYER_TOWARDS_EXACT_ROW
    DEC     PLAYER_X_ADJ
    BPL     .check_for_gold

    ; adjustment overflow
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .set_on_level
    LDA     #$00
.set_on_level:
    STA     (PTR1),Y

    DEC     PLAYER_COL
    DEY
    LDA     #$09
    STA     (PTR1),Y            ; Write player sprite to active page.
    LDA     #$04
    STA     PLAYER_X_ADJ        ; Set adjustment to +2
    BNE     .inc_anim_state     ; Unconditional

.check_for_gold:
    JSR     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.inc_anim_state:
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$04                ; rope
    BEQ     .anim_state_monkeying

    LDA     #$00
    LDX     #$02
    BNE     .done               ; Unconditional

.anim_state_monkeying:
    LDA     #$03
    LDX     #$05

.done:
    JSR     INC_ANIM_STATE
    JMP     DRAW_PLAYER

    ORG    $6645
TRY_MOVING_RIGHT:
    SUBROUTINE

    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDX     PLAYER_X_ADJ
    CPX     #$02
    BCC     .move_player_right      ; player slightly left, so can move right.

    LDY     PLAYER_COL
    CPY     #$1B
    BEQ     .cannot_move            ; col == 27, so cannot move.

    INY
    LDA     (PTR1),Y
    CMP     #$02
    BEQ     .cannot_move
    CMP     #$01
    BEQ     .cannot_move
    CMP     #$05
    BEQ     .move_player_right      ; brick, stone, or T-thing to right, so cannot move.

.cannot_move:
    RTS

.move_player_right:
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    LDA     #$01
    STA     PLAYER_FACING_DIRECTION             ; face right
    JSR     MOVE_PLAYER_TOWARDS_EXACT_ROW
    INC     PLAYER_X_ADJ
    LDA     PLAYER_X_ADJ
    CMP     #$05
    BCC     .check_for_gold

    ; adjustment overflow
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .set_on_level
    LDA     #$00
.set_on_level:
    STA     (PTR1),Y

    INC     PLAYER_COL
    INY
    LDA     #$09
    STA     (PTR1),Y            ; Write player sprite to active page.
    LDA     #$00
    STA     PLAYER_X_ADJ        ; Set adjustment to -2
    BNE     .inc_anim_state     ; Unconditional

.check_for_gold:
    JSR     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.inc_anim_state:
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$04                ; rope
    BEQ     .anim_state_monkeying

    LDA     #$08
    LDX     #$0A
    BNE     .done               ; Unconditional

.anim_state_monkeying:
    LDA     #$0B
    LDX     #$0D

.done:
    JSR     INC_ANIM_STATE
    JMP     DRAW_PLAYER

    ORG    $66BD
TRY_MOVING_UP:
    SUBROUTINE

    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     PLAYER_COL
    LDA     (PTR2),Y

    CMP     #$03
    BEQ     .ladder_here

    LDY     PLAYER_Y_ADJ
    CPY     #$03
    BCC     .cannot_move       ; if PLAYER_Y_ADJ <= 2

    ; and if there's no ladder below, you can't move up.
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS+1,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2+1,Y
    STA     PTR2+1

    LDY     PLAYER_COL
    LDA     (PTR2),Y

    CMP     #$03
    BEQ     .move_player_up

.cannot_move:
    SEC
    RTS

.ladder_here:
    LDY     PLAYER_Y_ADJ
    CPY     #$03
    BCS     .move_player_up             ; if PLAYER_Y_ADJ > 2

    ; If you're at the top, you can't move up even if there's a ladder.
    LDY     PLAYER_ROW
    BEQ     .cannot_move       ; if PLAYER_ROW == 0, set carry and return

    ; You can't move up if there's a brick, stone, or T-thing above.
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS-1,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES-1,Y
    STA     PTR1+1
    LDY     PLAYER_COL
    LDA     (PTR1),Y                    ; Get the sprite on the row above.

    CMP     #$01
    BEQ     .cannot_move
    CMP     #$02
    BEQ     .cannot_move
    CMP     #$05
    BEQ     .cannot_move       ; If brick, stone, or T-thing, set carry and return

.move_player_up:
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    JSR     MOVE_PLAYER_TOWARDS_EXACT_COLUMN
    DEC     PLAYER_Y_ADJ                ; Move player up
    BPL     TRY_MOVING_UP_check_for_gold

    ; PLAYER_Y_ADJ rolled over.

    ; Restore the sprite at the player's former location:
    ; If background page at player location is brick, put an empty at the
    ; (previous) player location on active page, otherwise copy the background
    ; sprite to the active page.
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .set_on_real_page
    LDA     #$00
.set_on_real_page:
    STA     (PTR1),Y

    DEC     PLAYER_ROW                  ; Move player up
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1

    LDY     PLAYER_COL
    LDA     #$09
    STA     (PTR1),Y            ; Write player sprite to active page.
    LDA     #$04
    STA     PLAYER_Y_ADJ        ; Set adjustment to +2
    BNE     TRY_MOVING_UP_inc_anim_state     ; unconditional

TRY_MOVING_UP_check_for_gold:
    JSR     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

TRY_MOVING_UP_inc_anim_state:
    LDA     #$10
    LDX     #$11
    JSR     INC_ANIM_STATE      ; player climbing on ladder
    JSR     DRAW_PLAYER
    CLC
    RTS

    ORG    $6766
TRY_MOVING_DOWN:
    SUBROUTINE

    LDY     PLAYER_Y_ADJ
    CPY     #$02
    BCC     .move_player_down   ; player slightly above, so can move down.

    LDY     PLAYER_ROW
    CPY     #$0F
    BCS     .cannot_move        ; player on row >= 15, so cannot move.

    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS+1,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES+1,Y
    STA     PTR1+1

    LDY     PLAYER_COL
    LDA     (PTR1),Y
    CMP     #$02                ; stone
    BEQ     .cannot_move
    CMP     #$01                ; brick
    BNE     .move_player_down   ; Row below is stone or brick, so cannot move.

.cannot_move:
    SEC
    RTS

.move_player_down:
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    JSR     MOVE_PLAYER_TOWARDS_EXACT_COLUMN
    INC     PLAYER_Y_ADJ                ; Move player down
    LDA     PLAYER_Y_ADJ
    CMP     #$05
    BCC     .check_for_gold_

    ; adjustment overflow
    LDY     PLAYER_COL
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .set_on_real_page
    LDA     #$00
.set_on_real_page:
    STA     (PTR1),Y

    INC     PLAYER_ROW
    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1

    LDY     PLAYER_COL
    LDA     #$09
    STA     (PTR1),Y            ; Write player sprite to active page.
    LDA     #$00
    STA     PLAYER_Y_ADJ        ; Set adjustment to -2
    JMP     TRY_MOVING_UP_inc_anim_state

.check_for_gold_:
    JMP     TRY_MOVING_UP_check_for_gold

    ORG    $67D8
    SUBROUTINE

.cannot_dig_:
    JMP     .stop_digging

TRY_DIGGING_LEFT:
    LDA     #$FF
    STA     DIG_DIRECTION
    STA     KEY_COMMAND
    STA     $9F                 ; DIG_DIRECTION = KEY_COMMAND = 0xFF
    LDA     #$00
    STA     DIG_ANIM_STATE      ; DIG_ANIM_STATE = 0

TRY_DIGGING_LEFT_check_can_dig_left:
    LDY     PLAYER_ROW
    CPY     #$0F
    BCS     .cannot_dig_        ; row >= 15, so cannot dig.

    INY
    JSR     GET_PTRS_TO_CURR_LEVEL_SPRITE_DATA
    LDY     PLAYER_COL
    BEQ     .cannot_dig_        ; col == 0, so cannot dig left.

    DEY
    LDA     (PTR1),Y
    CMP     #$01
    BNE     .cannot_dig_        ; no brick below and to the left, so cannot dig left.

    LDY     PLAYER_ROW
    JSR     GET_PTRS_TO_CURR_LEVEL_SPRITE_DATA
    LDY     PLAYER_COL
    DEY
    LDA     (PTR1),Y
    CMP     #$00
    BNE     .not_empty_to_left  ; not empty to the left, so maybe cannot dig left.

    ; Can dig!
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    JSR     MOVE_PLAYER_TOWARDS_EXACT_COLUMN
    JSR     MOVE_PLAYER_TOWARDS_EXACT_ROW
    LDY     DIG_ANIM_STATE
    LDA     DIG_NOTE_PITCHES,Y
    LDX     DIG_NOTE_DURATIONS,Y
    JSR     APPEND_NOTE

    LDX     DIG_ANIM_STATE
    LDA     #$00                ; running left
    CPX     #$00
    BCS     .note_0             ; DIG_ANIM_STATE >= 0
    LDA     #$06                ; digging left
.note_0:
    STA     PLAYER_ANIM_STATE
    JSR     DRAW_PLAYER

    LDX     DIG_ANIM_STATE
    CPX     #$0C
    BEQ     .move_player_left
    CPX     #$00
    BEQ     .draw_curr_dig              ; Don't have to erase previous dig debris sprite

    ; Erase the previous dig debris sprite
    LDA     DIG_DEBRIS_LEFT_SPRITES-1,X
    PHA
    LDX     PLAYER_COL
    DEX
    LDY     PLAYER_ROW
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS

    LDX     DIG_ANIM_STATE
.draw_curr_dig:
    LDA     DIG_DEBRIS_LEFT_SPRITES,X
    PHA
    LDX     PLAYER_COL
    DEX
    STX     GAME_COLNUM
    LDY     PLAYER_ROW
    STY     GAME_ROWNUM
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS     ; Draw current dig debris sprite above dig site

    LDX     DIG_ANIM_STATE
    LDA     DIG_BRICK_SPRITES,X
    INC     GAME_ROWNUM
    JSR     DRAW_SPRITE_PAGE1               ; Draw dig brick sprite at dig site

    INC     DIG_ANIM_STATE
    CLC
    RTS

.not_empty_to_left:
    LDY     PLAYER_ROW
    INY
    STY     GAME_ROWNUM
    LDY     PLAYER_COL
    DEY
    STY     GAME_COLNUM
    LDA     #$01
    JSR     DRAW_SPRITE_PAGE1           ; Draw brick below and to the left of player

    LDX     DIG_ANIM_STATE
    BEQ     .stop_digging

    ; Erase previous dig debris sprite
    DEX
    LDA     DIG_DEBRIS_LEFT_SPRITES,X
    PHA
    LDY     PLAYER_ROW
    LDX     PLAYER_COL
    DEX
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS

.stop_digging:
    LDA     #$00
    STA     DIG_DIRECTION
    SEC
    RTS

.move_player_left:
    LDX     PLAYER_COL
    DEX
    JMP     DROP_PLAYER_IN_HOLE

    ORG    $689E
    SUBROUTINE

.cannot_dig_:
    JMP     .stop_digging

TRY_DIGGING_RIGHT:
    LDA     #$01
    STA     DIG_DIRECTION
    STA     KEY_COMMAND
    STA     $9F                 ; DIG_DIRECTION = KEY_COMMAND = 0x01
    LDA     #$0C
    STA     DIG_ANIM_STATE      ; DIG_ANIM_STATE = 0x0C

TRY_DIGGING_RIGHT_check_can_dig_right:
    LDY     PLAYER_ROW
    CPY     #$0F
    BCS     .cannot_dig_        ; row >= 15, so cannot dig.

    INY
    JSR     GET_PTRS_TO_CURR_LEVEL_SPRITE_DATA
    LDY     PLAYER_COL
    CPY     #$1B
    BCS     .cannot_dig_        ; col >= 27, so cannot dig right.

    INY
    LDA     (PTR1),Y
    CMP     #$01
    BNE     .cannot_dig_        ; no brick below and to the right, so cannot dig right.

    LDY     PLAYER_ROW
    JSR     GET_PTRS_TO_CURR_LEVEL_SPRITE_DATA
    LDY     PLAYER_COL
    INY
    LDA     (PTR1),Y
    CMP     #$00
    BNE     .not_empty_to_right  ; not empty to the right, so maybe cannot dig right.

    ; Can dig!
    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    JSR     MOVE_PLAYER_TOWARDS_EXACT_COLUMN
    JSR     MOVE_PLAYER_TOWARDS_EXACT_ROW
    LDY     DIG_ANIM_STATE
    LDA     DIG_NOTE_PITCHES-12,Y
    LDX     DIG_NOTE_DURATIONS-12,Y
    JSR     APPEND_NOTE

    LDX     DIG_ANIM_STATE
    LDA     #$08                ; running right
    CPX     #$12
    BCS     .note_0             ; DIG_ANIM_STATE >= 0x12
    LDA     #$0E                ; digging right
.note_0:
    STA     PLAYER_ANIM_STATE
    JSR     DRAW_PLAYER

    LDX     DIG_ANIM_STATE
    CPX     #$18
    BEQ     .move_player_right
    CPX     #$0C
    BEQ     .draw_curr_dig              ; Don't have to erase previous dig debris sprite

    ; Erase the previous dig debris sprite
    LDA     DIG_DEBRIS_LEFT_SPRITES-1,X
    PHA
    LDX     PLAYER_COL
    INX
    LDY     PLAYER_ROW
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS

    LDX     DIG_ANIM_STATE
.draw_curr_dig:
    LDA     DIG_DEBRIS_LEFT_SPRITES,X
    PHA
    LDX     PLAYER_COL
    INX
    STX     GAME_ROWNUM
    LDY     PLAYER_ROW
    STY     GAME_ROWNUM
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS     ; Draw current dig debris sprite above dig site

    INC     GAME_ROWNUM
    LDX     DIG_ANIM_STATE
    LDA     DIG_BRICK_SPRITES-12,X
    JSR     DRAW_SPRITE_PAGE1               ; Draw dig brick sprite at dig site

    INC     DIG_ANIM_STATE
    CLC
    RTS

.not_empty_to_right:
    LDY     PLAYER_ROW
    INY
    STY     GAME_ROWNUM
    LDY     PLAYER_COL
    INY
    STY     GAME_COLNUM
    LDA     #$01
    JSR     DRAW_SPRITE_PAGE1           ; Draw brick below and to the right of player

    LDX     DIG_ANIM_STATE
    CPX     #$0C
    BEQ     .stop_digging

    ; Erase previous dig debris sprite
    DEX
    LDA     DIG_DEBRIS_LEFT_SPRITES,X
    PHA
    LDX     PLAYER_COL
    INX
    LDY     PLAYER_ROW
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS

.stop_digging:
    LDA     #$00
    STA     DIG_DIRECTION
    SEC
    RTS

.move_player_right:
    LDX     PLAYER_COL
    INX
    JMP     DROP_PLAYER_IN_HOLE

    ORG    $6968
SPRITE_ANIM_SEQS:
    HEX     0B 0C 0D        ; player running left
    HEX     18 19 1A        ; player monkey swinging left
    HEX     0F              ; player digging left
    HEX     13              ; player falling, facing left
    HEX     09 10 11        ; player running right
    HEX     15 16 17        ; player monkey swinging right
    HEX     25              ; player digging right
    HEX     14              ; player falling, facing right
    HEX     0E 12           ; player climbing on ladder
    ORG    $697A
DIG_DEBRIS_LEFT_SPRITES:
    HEX     1B 1B 1C 1C 1D 1D 1E 1E 00 00 00 00
DIG_DEBRIS_RIGHT_SPRITES:
    HEX     26 26 27 27 1D 1D 1E 1E 00 00 00 00
DIG_BRICK_SPRITES:
    HEX     1F 1F 20 20 21 21 22 22 23 23 24 24
DIG_NOTE_PITCHES:
    HEX     20 20 20 20 20 20 20 20 24 24 24 24 24
DIG_NOTE_DURATIONS:
    HEX     04 04 04 04 04 04 04 04 03 03 02 02 01
    ORG    $69B8
CHECK_FOR_MODE_1_INPUT:
    SUBROUTINE

    LDA     KBD
    BMI     .key_pressed

    LDA     INPUT_MODE
    CMP     KEYBOARD_MODE
    BEQ     .nothing_pressed
    
    ; Check joystick buttons also
    LDA     BUTN1
    BMI     .key_pressed
    LDA     BUTN0
    BPL     .nothing_pressed

.key_pressed:
    ; Simulate killing the attact-mode player.
    LSR     $AC
    LSR     ALIVE
    LDA     #$01
    STA     LIVES
    RTS

.nothing_pressed:
    LDA     $AB
    BNE     .sim_keypress

    LDY     #$00
    LDA     ($A8),Y
    STA     $AA
    INY
    LDA     ($A8),Y
    STA     $AB
    CLC
    ADC     #$02
    STA     $A8
    LDA     $A9
    ADC     #$00
    STA     $A9

.sim_keypress:
    LDA     $AA
    AND     #$0F
    TAX
    LDA     VALID_KEY_COMMANDS,X
    STA     KEY_COMMAND
    LDA     $AA
    LSR
    LSR
    LSR
    LSR
    TAX
    LDA     VALID_KEY_COMMANDS,X
    STA     $9F
    DEC     $AB
    RTS


    ; Guard AI routines

    ORG    $6A0B
VALID_KEY_COMMANDS:
    HEX     C9      ; 'I'
    HEX     CA      ; 'J'
    HEX     CB      ; 'K'
    HEX     CC      ; 'L'
    HEX     CF      ; 'O'
    HEX     D5      ; 'U'
    HEX     A0      ; space
    ORG    $6A12
CHECK_FOR_INPUT:
    SUBROUTINE

    LDA     PREGAME_MODE
    CMP     #$01
    BEQ     CHECK_FOR_MODE_1_INPUT

    LDX     KBD
    STX     KBDSTRB
    STX     SPRITE_NUM
    BMI     .key_pressed

    LDA     INPUT_MODE
    CMP     KEYBOARD_MODE
    BEQ     .end                    ; If keyboard mode, end.

.check_buttons_:
    JMP     CHECK_BUTTONS

.key_pressed:
    CPX     #$A0
    BCS     .non_ctrl_key_pressed
    ; ctrl key pressed
    STX     SPRITE_NUM
    LDY     #$FF

.loop:
    INY
    LDA     VALID_CTRL_KEYS,Y
    BEQ     .non_ctrl_key_pressed

    CMP     SPRITE_NUM
    BNE     .loop

    TYA
    ASL
    TAY
    LDA     CTRL_KEY_HANDLERS+1,Y
    PHA
    LDA     CTRL_KEY_HANDLERS,Y
    PHA
    RTS                             ; JSR to CTRL_KEY_HANDLERS[Y], then return.

.non_ctrl_key_pressed:
    LDA     INPUT_MODE
    CMP     JOYSTICK_MODE
    BEQ     .check_buttons_         ; If joystick mode, check buttons.

    LDX     SPRITE_NUM
    STX     KEY_COMMAND
    STX     $9F

.end:
    RTS

    ORG    $6A56
CTRL_CARET_HANDLER:
    SUBROUTINE

    INC     LIVES
    INC     LEVELNUM
    INC     DISK_LEVEL_LOC
    LSR     ALIVE       ; set player dead
    LSR     $9D
    RTS
    ORG    $6A61
CTRL_AT_HANDLER:
    SUBROUTINE

    INC     LIVES
    BNE     .have_lives
    DEC     LIVES           ; LIVES = 255
.have_lives:
    JSR     PUT_STATUS_LIVES
    LSR     $9D
    JMP     CHECK_FOR_INPUT
    ORG    $6A76
ESC_HANDLER:
    SUBROUTINE

    JSR     WAIT_KEY
    CMP     #$9B            ; key pressed is ESC?
    BNE     ESC_HANDLER
    JMP     CHECK_FOR_INPUT
    ORG    $6A80
CTRL_R_HANDLER:
    SUBROUTINE

    LDA     #$01
    STA     LIVES

CTRL_A_HANDLER:
    LSR     ALIVE           ; Set player to dead
    RTS
    ORG    $6A87
CTRL_S_HANDLER:
    SUBROUTINE

    LDA     ENABLE_SOUND
    EOR     #$FF
    STA     ENABLE_SOUND
    JMP     CHECK_FOR_INPUT
    ORG    $6A90
DOWN_ARROW_HANDLER:
    SUBROUTINE

    LDA     JOYSTICK_MODE
    STA     INPUT_MODE
    JMP     CHECK_FOR_INPUT

    ORG    $6A97
UP_ARROW_HANDLER:
    SUBROUTINE

    LDA     KEYBOARD_MODE
    STA     INPUT_MODE
    JMP     CHECK_FOR_INPUT
    ORG    $6A9E
CTRL_X_HANDLER:
    SUBROUTINE

    LDA     $6B81
    LDX     $6B82
    STA     $6B82
    STX     $6B81
    JMP     CHECK_FOR_INPUT

    ORG    $6AAD
CTRL_Y_HANDLER:
    SUBROUTINE

    LDA     $6B83
    LDX     $6B84
    STA     $6B84
    STX     $6B85
    JMP     CHECK_FOR_INPUT

    ORG    $6ABC
RIGHT_ARROW_HANDLER:
    SUBROUTINE

    LDA     FRAME_PERIOD
    BEQ     .end
    DEC     FRAME_PERIOD
    
.end
    JMP     CHECK_FOR_INPUT

    ORG    $6AC5
LEFT_ARROW_HANDLER:
    SUBROUTINE

    LDA     FRAME_PERIOD
    CMP     #$0F
    BEQ     .end
    INC     FRAME_PERIOD

.end
    JMP     CHECK_FOR_INPUT

    ORG    $6AD0
CHECK_BUTTONS:
    SUBROUTINE

    LDA     BUTN1
    BPL     .check_butn0
    LDA     #$D5
    BNE     .store_key_command    ; unconditional

.check_butn0:
    LDA     BUTN0
    BPL     .read_paddles
    LDA     #$CF

.store_key_command
    STA     KEY_COMMAND
    STA     $9F
    RTS

.read_paddles:
    JSR     READ_PADDLES
    LDY     PADDLE0_VALUE

    LDA     $6b82
    CMP     #$2E
    BEQ     .6afa

    CPY     $6b82
    BCS     .6b03
    LDA     #$CC
    BNE     .6b1e       ; unconditional

.6afa:
    CPY     $6b82
    BCC     .6b03
    LDA     #$CC
    BNE     .6b1e       ; unconditional

.6b03:
    LDA     $6b81
    CMP     #$2E
    BEQ     .6b13

    CPY     $6b81
    BCS     .6b1c
    LDA     #$CA
    BNE     .6b1e       ; unconditional

.6b13:
    CPY     $6b81
    BCC     .6b1c
    LDA     #$CA
    BNE     .6b1e       ; unconditional

.6b1c:
    LDA     #$C0

.6b1e:
    STA     $9F

    LDY     PADDLE1_VALUE

    LDA     $6b83
    CMP     #$2E
    BEQ     .6b32

    CPY     $6b83
    BCS     .6b3b
    LDA     #$C9
    BNE     .6b56       ; unconditional

.6b32:
    CPY     $6b84
    BCC     .6b3b
    LDA     #$C9
    BNE     .6b56       ; unconditional

.6b3b:
    LDA     $6b84
    CMP     #$2E
    BEQ     .6b4b

    CPY     $6b84
    BCS     .6b54
    LDA     #$CB
    BNE     .6b56       ; unconditional

.6b4b:
    CPY     $6b84
    BCC     .6b54
    LDA     #$CB
    BNE     .6b56       ; unconditional

.6b54:
    LDA     #$C0

.6b56:
    STA     KEY_COMMAND
    RTS


    ORG    $6B59
VALID_CTRL_KEYS:
    ; ctrl-
    ; ^ @ [ R A S J K H U X Y M
    ; Esc:         ctrl-[
    ; Down arrow:  ctrl-J
    ; Up arrow:    ctrl-K
    ; Right arrow: ctrl-U
    ; Left arrow:  ctrl-H
    ; Return:      ctrl-M
    HEX     9E 80 9B 92 81 93 8A 8B 88 95 98 99 8D 00

    ORG    $6B67
CTRL_KEY_HANDLERS:
    ; These get pushed onto the stack, then an RTS is issued.
    ; Remember that the 6502's return stack contains the address
    ; to return to *minus 1*, so these values are actually one less
    ; than the function to jump to.
    WORD    CTRL_CARET_HANDLER-1
    WORD    CTRL_AT_HANDLER-1
    WORD    ESC_HANDLER-1
    WORD    CTRL_R_HANDLER-1
    WORD    CTRL_A_HANDLER-1
    WORD    CTRL_S_HANDLER-1
    WORD    DOWN_ARROW_HANDLER-1
    WORD    UP_ARROW_HANDLER-1
    WORD    LEFT_ARROW_HANDLER-1
    WORD    RIGHT_ARROW_HANDLER-1
    WORD    CTRL_X_HANDLER-1
    WORD    CTRL_Y_HANDLER-1
    WORD    RETURN_HANDLER-1
    ORG    $6B85
GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER:
    SUBROUTINE
    ; Using PLAYER_COL/ROW, PLAYER_X/Y_ADJ, and PLAYER_ANIM_STATE,
    ; return the player sprite in A, and the screen coords in X and Y.

    LDX     PLAYER_COL
    LDY     PLAYER_X_ADJ
    JSR     GET_HALF_SCREEN_COL_OFFSET_IN_Y_FOR
    STX     SPRITE_NUM          ; Used only as a temporary to save X
    LDY     PLAYER_ROW
    LDX     PLAYER_Y_ADJ
    JSR     GET_SCREEN_ROW_OFFSET_IN_X_FOR
    LDX     PLAYER_ANIM_STATE
    LDA     SPRITE_ANIM_SEQS,X
    LDX     SPRITE_NUM
    RTS

    ORG    $6B9D
CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER:
    SUBROUTINE

    LDA     PLAYER_X_ADJ
    CMP     #$02
    BNE     .end
    LDA     PLAYER_Y_ADJ
    CMP     #$02
    BNE     .end

    LDY     PLAYER_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     PLAYER_COL
    LDA     (PTR2),Y

    CMP     #$07                ; Gold
    BNE     .end

    LSR     DIDNT_PICK_UP_GOLD  ; picked up gold
    DEC     GOLD_COUNT          ; GOLD_COUNT--

    LDY     PLAYER_ROW
    STY     GAME_ROWNUM
    LDY     PLAYER_COL
    STY     GAME_COLNUM
    LDA     #$00
    STA     (PTR2),Y
    JSR     DRAW_SPRITE_PAGE2   ; Register and draw blank at player loc in background screen

    LDY     PLAYER_ROW
    LDX     PLAYER_COL
    JSR     GET_SCREEN_COORDS_FOR
    LDA     #$07                            ; Gold
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS    ; Erase gold at player loc

    LDY     #$02
    LDA     #$50
    JSR     ADD_AND_UPDATE_SCORE            ; SCORE += 250
    JSR     LOAD_SOUND_DATA
    HEX     07 45 06 55 05 44 04 54 03 43 02 53 00

.end:
    RTS

    ORG    $6BF4
INC_ANIM_STATE:
    SUBROUTINE

    INC     PLAYER_ANIM_STATE
    CMP     PLAYER_ANIM_STATE
    BCC     .check_upper_bound      ; lower bound < PLAYER_ANIM_STATE?
    ; otherwise PLAYER_ANIM_STATE <= lower bound:

.write_lower_bound:
    STA     PLAYER_ANIM_STATE       ; PLAYER_ANIM_STATE = lower bound
    RTS

.check_upper_bound:
    CPX     PLAYER_ANIM_STATE
    BCC     .write_lower_bound       ; PLAYER_ANIM_STATE > upper bound?
    ; otherwise PLAYER_ANIM_STATE <= upper bound:
    RTS

    ORG    $6C02
DRAW_PLAYER:
    SUBROUTINE

    JSR     GET_SPRITE_AND_SCREEN_COORD_AT_PLAYER
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS
    LDA     SCREENS_DIFFER
    BEQ     .end
    LDA     DIDNT_PICK_UP_GOLD
    BEQ     .end
    LSR     ALIVE       ; Set player as dead
.end
    RTS

    ORG    $6C13
MOVE_PLAYER_TOWARDS_EXACT_COLUMN:
    SUBROUTINE

    LDA     PLAYER_X_ADJ
    CMP     #$02
    BCC     .player_slightly_left
    BEQ     .end

.player_slightly_right:
    DEC     PLAYER_X_ADJ        ; Nudge player left
    JMP     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.player_slightly_left:
    INC     PLAYER_X_ADJ        ; Nudge player right
    JMP     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.end:
    RTS

    ORG    $6C26
MOVE_PLAYER_TOWARDS_EXACT_ROW:
    SUBROUTINE

    LDA     PLAYER_Y_ADJ
    CMP     #$02
    BCC     .player_slightly_above
    BEQ     .end

.player_slightly_below:
    DEC     PLAYER_Y_ADJ        ; Nudge player up
    JMP     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.player_slightly_above:
    INC     PLAYER_Y_ADJ        ; Nudge player down
    JMP     CHECK_FOR_GOLD_PICKED_UP_BY_PLAYER

.end:
    RTS

    ORG    $6C39
DROP_PLAYER_IN_HOLE:
    SUBROUTINE

    LDA     #$00
    STA     DIG_DIRECTION       ; Stop digging

    LDY     PLAYER_ROW
    INY                         ; Move player down

    STX     GAME_COLNUM
    STY     GAME_ROWNUM
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1

    LDA     #$00
    LDY     GAME_COLNUM
    STA     (PTR1),Y                ; Set blank sprite at player location in active page
    JSR     DRAW_SPRITE_PAGE1
    LDA     #$00
    JSR     DRAW_SPRITE_PAGE2       ; Draw blank at player location on both graphics pages

    DEC     GAME_ROWNUM
    LDA     #$00
    JSR     DRAW_SPRITE_PAGE1       ; Draw blank at location above player
    INC     GAME_ROWNUM
    LDX     #$FF

.loop:
    INX
    CPX     #$1E
    BEQ     .end
    LDA     TABLE_0CE0,X
    BNE     .loop

    LDA     GAME_ROWNUM
    STA     TABLE_0CC0,X
    LDA     GAME_COLNUM
    STA     TABLE_0CA0,X
    LDA     #$B4
    STA     TABLE_0CE0,X
    SEC

.end:
    RTS

    ORG    $6C82
MOVE_GUARDS:
    SUBROUTINE

    LDX     GUARD_COUNT
    BEQ     .end

    ; Increment GUARD_PHASE mod 3
    INC     GUARD_PHASE
    LDY     GUARD_PHASE
    CPY     #$03
    BCC     .incremented_phase
    LDY     #$00
    STY     GUARD_PHASE
.incremented_phase:

    LDA     GUARD_PATTERNS,Y
    STA     GUARD_PATTERN

.loop:
    LSR     GUARD_PATTERN       ; Peel off the lsb
    BCC     .bit_done
    JSR     MOVE_GUARD          ; Move a guard
    LDA     ALIVE
    BEQ     .end                ; If player is dead, end.

.bit_done:
    LDA     GUARD_PATTERN
    BNE     .loop

.end:
    RTS

    ORG    $6CA7
GUARD_PATTERNS_LIST:
    HEX     00 01 01
    HEX     01 01 01
    HEX     01 03 01
    HEX     01 03 03
    HEX     03 03 03
    HEX     03 03 07
    HEX     03 07 07
    HEX     07 07 07
    HEX     07 07 0F
    HEX     07 0F 0F
    HEX     0F 0F 0F
    ORG    $6CCB
GUARD_ANIM_SPRITES:
    HEX     08 2B 2C        ; running left
    HEX     30 31 32        ; monkey-traversing left
    HEX     36              ; falling left
    HEX     28 29 2A        ; running right
    HEX     2D 2E 2F        ; monkey-traversing right
    HEX     35              ; falling right
    HEX     33 34           ; climbing
    ORG    $6CDB
MOVE_GUARD
    SUBROUTINE

    ; Increment GUARD_NUM mod GUARD_COUNT, except 1-based.
    INC     GUARD_NUM
    LDX     GUARD_COUNT
    CPX     GUARD_NUM
    BCS     .guard_num_incremented
    LDX     #$01
    STX     GUARD_NUM
.guard_num_incremented:

    JSR     LOAD_GUARD_DATA
    LDA     GUARD_FLAG_0
    BMI     .check_sprite_at_guard_pos
    BEQ     .check_sprite_at_guard_pos

    DEC     GUARD_FLAG_0
    LDY     GUARD_FLAG_0
    CPY     #$0D
    BCS     .guard_flag_0_gt_12
    JMP     $6e65

.guard_flag_0_gt_12:
    LDX     GUARD_NUM
    LDA     GUARD_FLAGS_5,X
    BEQ     .guard_flag_5_zero
    JMP     STORE_GUARD_DATA            ; tailcall

.guard_flag_5_zero:
    JMP     $6db7                       

.check_sprite_at_guard_pos:
    LDY     GUARD_LOC_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GUARD_LOC_COL
    LDA     (PTR2),Y

    CMP     #$03
    BEQ     .ladder_
    CMP     #$04
    BNE     .not_rope_or_ladder
    LDA     GUARD_Y_ADJ
    CMP     #$02
    BEQ     .ladder_

.not_rope_or_ladder:
    LDA     GUARD_Y_ADJ
    CMP     #$02
    BCC     .blank_or_player           ; if GUARD_Y_ADJ < 2
    LDY     GUARD_LOC_ROW
    CPY     #$0F
    BEQ     .ladder_          ; Row == 15
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1

    LDY     GUARD_LOC_COL
    LDA     (PTR1),Y

    CMP     #$00
    BEQ     .blank_or_player
    CMP     #$09
    BEQ     .blank_or_player
    CMP     #$08                ; guard
    BEQ     .ladder_

    LDA     (PTR2),Y
    CMP     #$01                ; brick
    BEQ     .ladder_
    CMP     #$02                ; stone
    BEQ     .ladder_
    CMP     #$03                ; ladder
    BNE     .blank_or_player

.ladder_:
    JMP     .ladder

.blank_or_player:
    JSR     $74DF
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    JSR     $7582
    LDA     #$06
    LDY     GUARD_FLAG_4
    BMI     .set_guard_flag_3
    LDA     #$0D
.set_guard_flag_3
    STA     GUARD_ANIM_STATE

    INC     GUARD_Y_ADJ
    LDA     GUARD_Y_ADJ
    CMP     #$05
    BCS     $6dc0           ; If GUARD_Y_ADJ > 4

    LDA     GUARD_Y_ADJ
    CMP     #$02
    BNE     $6db7           ; If GUARD_Y_ADJ != 2

    LDY     GUARD_LOC_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GUARD_LOC_COL
    LDA     (PTR2),Y

    CMP     #$01
    BNE     $6db7           ; If background screen has brick

    LDA     GUARD_FLAG_0
    BPL     .6da2
    DEC     GOLD_COUNT
.6da2:
    LDA     $5F
    STA     GUARD_FLAG_0
    LDY     #$00
    LDA     #$75
    JSR     ADD_AND_UPDATE_SCORE        ; SCORE += 75

    ; Play the guard kill tune
    JSR     LOAD_SOUND_DATA
    HEX     06 20 04 30 02 40 00

    JSR     GET_GUARD_SPRITE_AND_COORDS
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS
    JMP     STORE_GUARD_DATA            ; tailcall

.6dc0:
    LDA     #$00
    STA     GUARD_Y_ADJ                 ; set vertical adjust to -2
    LDY     GUARD_LOC_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GUARD_LOC_COL
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .set_real_sprite
    LDA     #$00
.set_real_sprite:
    STA     (PTR1),Y

    INC     GUARD_LOC_ROW               ; move guard down
    LDY     GUARD_LOC_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GUARD_LOC_COL
    LDA     (PTR1),Y
    CMP     #$09
    BNE     .get_background_sprite
    LSR     ALIVE                       ; set player to dead
.get_background_sprite:
    LDA     (PTR2),Y
    CMP     #$01
    BNE     .place_guard_at_loc
    LDA     GUARD_FLAG_0
    BPL     .place_guard_at_loc

    ; What's above the guard?
    LDY     GUARD_LOC_ROW
    DEY
    STY     GAME_ROWNUM
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GUARD_LOC_COL
    STY     GAME_COLNUM
    LDA     (PTR2),Y
    CMP     #$00
    BEQ     .drop_gold
    DEC     GOLD_COUNT
    JMP     .6e46

.drop_gold:
    LDA     #$07
    STA     (PTR1),Y
    STA     (PTR2),Y
    JSR     DRAW_SPRITE_PAGE2
    LDY     GAME_ROWNUM
    LDX     GAME_COLNUM
    JSR     GET_SCREEN_COORDS_FOR
    LDA     #$07
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS

.6e46
    LDY     GUARD_LOC_ROW
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1

    LDA     #$00
    STA     GUARD_FLAG_0
    LDY     GUARD_LOC_COL

.place_guard_at_loc
    LDA     #$08            ; guard
    STA     (PTR1),Y

    JSR     GET_GUARD_SPRITE_AND_COORDS
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS
    JMP     STORE_GUARD_DATA            ; tailcall

.6e65:
    CPY     #$07
    BCC     .ladder
    JSR     GET_GUARD_SPRITE_AND_COORDS
    JSR     ERASE_SPRITE_AT_PIXEL_COORDS
    LDY     GUARD_FLAG_0
    LDA     GUARD_X_ADJ_TABLE-7,Y
    STA     GUARD_X_ADJ
    JSR     GET_GUARD_SPRITE_AND_COORDS
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS
    JMP     STORE_GUARD_DATA            ; tailcall

    ORG    $6E7F
GUARD_X_ADJ_TABLE:
    HEX     02 01 02 03 02 01
    ORG    $6E85
.ladder
    LDX     GUARD_LOC_COL
    LDY     GUARD_LOC_ROW
    JSR     $70D8
    ASL
    TAY
    LDA     GUARD_FN_TABLE+1,Y
    PHA
    LDA     GUARD_FN_TABLE,Y
    PHA
    RTS



    ; Disk routines

    ORG    $6E97
GUARD_FN_TABLE:
    WORD    STORE_GUARD_DATA-1

    ORG    $74DF
GET_GUARD_SPRITE_AND_COORDS:
    SUBROUTINE

    LDX     GUARD_LOC_COL
    LDY     GUARD_X_ADJ
    JSR     GET_HALF_SCREEN_COL_OFFSET_IN_Y_FOR
    STX     SPRITE_NUM

    LDY     GUARD_LOC_ROW
    LDX     GUARD_Y_ADJ
    JSR     GET_SCREEN_ROW_OFFSET_IN_X_FOR
    LDX     GUARD_ANIM_STATE
    LDA     GUARD_ANIM_SPRITES,X

    LDX     SPRITE_NUM
    RTS

    ORG    $75A8
STORE_GUARD_DATA:
    SUBROUTINE

    LDX     GUARD_NUM
    LDA     GUARD_LOC_COL
    STA     GUARD_LOCS_COL,X
    LDA     GUARD_LOC_ROW
    STA     GUARD_LOCS_ROW,X
    LDA     GUARD_X_ADJ
    STA     GUARD_X_ADJS,X
    LDA     GUARD_Y_ADJ
    STA     GUARD_Y_ADJS,X
    LDA     GUARD_FLAG_0
    STA     GUARD_FLAGS_0,X
    LDA     GUARD_FLAG_4
    STA     GUARD_FLAGS_4,X
    LDA     GUARD_ANIM_STATE
    STA     GUARD_ANIM_STATES,X
    RTS

LOAD_GUARD_DATA:
    SUBROUTINE

    LDX     GUARD_NUM
    LDA     GUARD_LOCS_COL,X
    STA     GUARD_LOC_COL
    LDA     GUARD_LOCS_ROW,X
    STA     GUARD_LOC_ROW
    LDA     GUARD_X_ADJS,X
    STA     GUARD_X_ADJ
    LDA     GUARD_Y_ADJS,X
    STA     GUARD_Y_ADJ
    LDA     GUARD_ANIM_STATES,X
    STA     GUARD_ANIM_STATE
    LDA     GUARD_FLAGS_4,X
    STA     GUARD_FLAG_4
    LDA     GUARD_FLAGS_0,X
    STA     GUARD_FLAG_0
    RTS

    ORG    $77AC
RETURN_HANDLER:
    SUBROUTINE

    JSR     HI_SCORE_SCREEN     ; show high score screen
    LDX     #$FF
    LDY     #$FF
    LDA     #$04
    STA     SCRATCH_A1          ; loop 256x256x4 times

.loop:
    LDA     INPUT_MODE
    CMP     KEYBOARD_MODE                ; Keyboard mode
    BEQ     .check_keyboard

    LDA     BUTN1
    BMI     .button_pressed
    LDA     BUTN0
    BMI     .button_pressed

.check_keyboard:
    LDA     KBD
    BMI     .button_pressed

    DEX
    BNE     .loop
    DEY
    BNE     .loop
    DEC     SCRATCH_A1
    BNE     .loop

.button_pressed:
    STA     KBDSTRB
    STA     TXTPAGE1
    JSR     CLEAR_HGR2
    LDY     #$0F
    STY     GAME_ROWNUM

.loop2:
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     #$1B
    STY     GAME_COLNUM

.loop3:
    LDA     (PTR2),Y
    CMP     #$05
    BNE     .draw_sprite
    LDA     #$01                ; draw brick in place of T-thing
.draw_sprite:
    JSR     DRAW_SPRITE_PAGE2

    DEC     GAME_COLNUM
    LDY     GAME_COLNUM
    BPL     .loop3

    DEC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    BPL     .loop2

    LDX     #$1E
.loop4:
    STX     SCRATCH_88
    LDA     TABLE_0CE0,X
    BEQ     .next4

    LDY     TABLE_0CC0,X
    STY     GAME_ROWNUM
    LDY     TABLE_0CA0,X
    STY     GAME_COLNUM
    CMP     #$15
    BCC     .check_b

    LDA     #$00
    JSR     DRAW_SPRITE_PAGE2
    JMP     .next4

.check_b:
    CMP     #$0B
    BCC     .draw_sprite_56
    LDA     #$37
    JSR     DRAW_SPRITE_PAGE2
    JMP     .next4

.draw_sprite_56:
    LDA     #$38
    JSR     DRAW_SPRITE_PAGE2

.next4:
    LDX     SCRATCH_88
    DEX
    BPL     .next4

    LDX     GUARD_COUNT
    BEQ     .check_for_input

.loop5:
    STA     GUARD_FLAGS_5,X
    STX     SCRATCH_88
    BEQ     .next5

    LDY     GUARD_LOCS_COL
    STY     GAME_COLNUM
    LDY     GUARD_LOCS_ROW
    STY     GAME_ROWNUM
    CMP     #$14
    BCS     .next5

    CMP     #$0B
    BCC     .draw_sprite_58
    LDA     #$39                ; sprite 57
    BNE     .draw_sprite2       ; unconditional

.draw_sprite_58:
    LDA     #$3A

.draw_sprite2:
    JSR     DRAW_SPRITE_PAGE2

.next5:
    LDX     SCRATCH_88
    DEX
    BNE     .loop5

.check_for_input:
    JMP     CHECK_FOR_INPUT

    ORG    $786B

HI_SCORE_SCREEN:
    SUBROUTINE

    JSR     CLEAR_HGR2
    LDA     #$40
    STA     DRAW_PAGE
    LDA     #$00
    STA     GAME_COLNUM
    STA     GAME_ROWNUM

    ; "    LODE RUNNER HIGH SCORES\r"
    ; "\r"
    ; "\r"
    ; "    INITIALS LEVEL  SCORE\r"
    ; "    -------- ----- --------\r"
    JSR     PUT_STRING
    HEX     A0 A0 A0 A0 CC CF C4 C5 A0 D2 D5 CE CE C5 D2 A0
    HEX     C8 C9 C7 C8 A0 D3 C3 CF D2 C5 D3 8D 8D 8D A0 A0
    HEX     A0 A0 C9 CE C9 D4 C9 C1 CC D3 A0 CC C5 D6 C5 CC
    HEX     A0 A0 D3 C3 CF D2 C5 8D A0 A0 A0 A0 AD AD AD AD
    HEX     AD AD AD AD A0 AD AD AD AD AD A0 AD AD AD AD AD
    HEX     AD AD AD 8D 00

    LDA     #$01
    STA     $55             ; Used for row number
.loop:
    CMP     #$0A
    BNE     .display_0_to_9
    LDA     #1
    JSR     PUT_DIGIT
    LDA     #0
    JSR     PUT_DIGIT
    JMP     .rest_of_row_number

.display_0_to_9:
    LDA     #$A0
    JSR     PUT_CHAR        ; space
    LDA     $55
    JSR     PUT_DIGIT

.rest_of_row_number:
    ; ".    "
    JSR     PUT_STRING
    HEX     AE A0 A0 A0 A0 00

    LDX     $55
    LDY     HI_SCORE_TABLE_OFFSETS,X
    STY     $56
    LDA     HI_SCORE_DATA+3,Y
    BNE     .draw_initials
    JMP     .next_high_score_row
.draw_initials:
    LDY     $56
    LDA     HI_SCORE_DATA,Y
    JSR     PUT_CHAR
    LDY     $56
    LDA     HI_SCORE_DATA+1,Y
    JSR     PUT_CHAR
    LDY     $56
    LDA     HI_SCORE_DATA+2,Y
    JSR     PUT_CHAR

    ; "    "
    JSR     PUT_STRING
    HEX     A0 A0 A0 A0 00

    LDY     $56
    LDA     HI_SCORE_DATA+3,Y
    JSR     TO_DECIMAL3
    LDA     HUNDREDS
    JSR     PUT_DIGIT
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    ; "  "
    JSR     PUT_STRING
    HEX     A0 A0 00

    LDY     $56
    LDA     HI_SCORE_DATA+4,Y
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    LDY     $56
    LDA     HI_SCORE_DATA+5,Y
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    LDY     $56
    LDA     HI_SCORE_DATA+6,Y
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

    LDY     $56
    LDA     HI_SCORE_DATA+7,Y
    JSR     BCD_TO_DECIMAL2
    LDA     TENS
    JSR     PUT_DIGIT
    LDA     UNITS
    JSR     PUT_DIGIT

.next_high_score_row:
    JSR     NEWLINE
    INC     $55
    LDA     $55
    CMP     #11
    BCS     .end
    JMP     .loop


.end:
    STA     TXTPAGE2        ; Flip to page 2
    LDA     #$20
    STA     DRAW_PAGE       ; Set draw page to 1
    RTS


    ORG    $79A2
HI_SCORE_TABLE_OFFSETS:
    HEX     00 08 10 18 20 28 30 38 40 48
    ORG    $79AD
PUT_STATUS:
    SUBROUTINE

    JSR     CLEAR_HGR1
    JSR     CLEAR_HGR2
    LDY     #$27
    LDA     DRAW_PAGE
    CMP     #$40
    BEQ     .draw_line_on_page_2

.draw_line_on_page_1:
    LDA     #$AA
    STA     $2350,Y
    STA     $2750,Y
    STA     $2B50,Y
    STA     $2F50,Y
    DEY
    LDA     #$D5
    STA     $2350,Y
    STA     $2750,Y
    STA     $2B50,Y
    STA     $2F50,Y
    DEY
    BPL     .draw_line_on_page_1
    BMI     .end        ; Unconditional

.draw_line_on_page_2:
    LDA     #$AA
    STA     $4350,Y
    STA     $4750,Y
    STA     $4B50,Y
    STA     $4F50,Y
    DEY
    LDA     #$D5
    STA     $4350,Y
    STA     $4750,Y
    STA     $4B50,Y
    STA     $4F50,Y
    DEY
    BPL     .draw_line_on_page_2

.end:
    LDA     #$10
    STA     GAME_ROWNUM
    LDA     #$00
    STA     GAME_COLNUM

    ; "SCORE        MEN    LEVEL   "
    JSR     PUT_STRING
    HEX     D3 C3 CF D2 C5 A0 A0 A0 A0 A0 A0 A0 A0 CD C5 CE
    HEX     A0 A0 A0 A0 CC C5 D6 C5 CC A0 A0 A0 00

    JSR     PUT_STATUS_LIVES
    JSR     PUT_STATUS_LEVEL
    LDA     #$00
    TAY
    JMP     ADD_AND_UPDATE_SCORE        ; tailcall


    ORG    $7A31
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
    ORG    $7A3E
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
    ORG    $7A51
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
    ORG    $7A70
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
    LDA     #16
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

    ORG    $7A92
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

    LDA     #5
    STA     GAME_COLNUM
    LDA     #16
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


    ORG    $7AE9
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


    ; Screen and level routines

    ORG    $7AF8
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

    ORG    $7B15
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

    ORG    $7B2A
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


    ORG    $7B64
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

    ORG    $7B84
LEVEL_EDITOR:
    SUBROUTINE

    LDA     #$00
    STA     SCORE
    STA     SCORE+1
    STA     SCORE+2
    STA     SCORE+3

    LDA     INDIRECT_TARGET
    STA     RWTS_ADDR
    LDA     INDIRECT_TARGET+1
    STA     RWTS_ADDR+1

    LDA     #$05
    STA     LIVES
    STA     PREGAME_MODE
    LDA     INPUT_MODE
    STA     SAVED_INPUT_MODE

    STA     TXTPAGE1

    LDA     DISK_LEVEL_LOC
    CMP     #$96
    BCC     START_LEVEL_EDITOR
    LDA     #$00
    STA     DISK_LEVEL_LOC

START_LEVEL_EDITOR:
    JSR     CLEAR_HGR1
    LDA     #$20
    STA     DRAW_PAGE
    LDA     #$00
    STA     GAME_COLNUM
    STA     GAME_ROWNUM

    ; "  LODE RUNNER BOARD EDITOR\r
    ; "----------------------------\r
    ; "  <ESC> ABORTS ANY COMMAND\r"
    JSR     PUT_STRING
    HEX     A0 A0 CC CF C4 C5 A0 D2 D5 CE CE C5 D2 A0 C2 CF
    HEX     C1 D2 C4 A0 C5 C4 C9 D4 CF D2 8D AD AD AD AD AD
    HEX     AD AD AD AD AD AD AD AD AD AD AD AD AD AD AD AD
    HEX     AD AD AD AD AD AD AD 8D A0 A0 BC C5 D3 C3 BE A0
    HEX     C1 C2 CF D2 D4 D3 A0 C1 CE D9 A0 C3 CF CD CD C1
    HEX     CE C4 8D 00

EDITOR_COMMAND_LOOP:
    LDA     GAME_ROWNUM
    CMP     #$09
    BCS     START_LEVEL_EDITOR

    ; "\r"
    ; "COMMAND>"
    JSR     PUT_STRING
    HEX     8D C3 CF CD CD C1 CE C4 BE 00

    JSR     EDITOR_WAIT_FOR_KEY
    LDX     #$00

.loop2:
    LDY     EDITOR_KEYS,X
    BEQ     .beep
    CMP     EDITOR_KEYS,X
    BEQ     .end
    INX
    BNE     .loop2

.beep:
    JSR     BEEP
    JMP     EDITOR_COMMAND_LOOP

.end:
    TXA
    ASL
    TAX
    LDA     EDITOR_RETURN_ADDRESS+1,X
    PHA
    LDA     EDITOR_RETURN_ADDRESS,X
    PHA
    RTS


    ORG    $7C4D
EDITOR_KEYS:
    ; P (Play level)
    ; C (Clear level)
    ; E (Edit level)
    ; M (Move level)
    ; I (Initialize disk)
    ; S (clear high Scores)
    HEX     D0 C3 C5 CD C9 D3 00    ; P C E M I S
EDITOR_ROUTINE_ADDRESS:
    WORD    EDITOR_PLAY_LEVEL-1
    WORD    EDITOR_CLEAR_LEVEL-1
    WORD    EDITOR_EDIT_LEVEL-1
    WORD    EDITOR_MOVE_LEVEL-1
    WORD    EDITOR_INITIALIZE_DISK-1
    WORD    EDITOR_CLEAR_HIGH_SCORES-1

    ORG    $7C54
EDITOR_RETURN_ADDRESS:
    HEX     5F 7C
    ORG    $7C77
SAVED_INPUT_MODE:
    HEX     00    

    ORG    $7C8E
EDITOR_CLEAR_LEVEL:
    SUBROUTINE

    ; "\r"
    ; ">>CLEAR LEVEL"
    JSR     PUT_STRING
    HEX     8D BE BE C3 CC C5 C1 D2 A0 CC C5 D6 C5 CC 00

    JSR     GET_LEVEL_FROM_KEYBOARD
    BCS     .beep
    JSR     CHECK_FOR_VALID_DATA_DISK

    LDY     #$00
    TYA
.loop:
    STA     DISK_BUFFER,Y
    INY
    BNE     .loop

    LDA     #$02
    JSR     LOAD_COMPRESSED_LEVEL_DATA      ; write level
    JMP     EDITOR_COMMAND_LOOP

.beep:
    JMP     BEEP

    ORG    $7CD8
EDITOR_MOVE_LEVEL:
    SUBROUTINE

    ; "\r"
    ; ">>MOVE LEVEL"
    JSR     PUT_STRING
    HEX     8D BE BE CD CF D6 C5 A0 CC C5 D6 C5 CC 00

    JSR     GET_LEVEL_FROM_KEYBOARD
    BCS     .beep
    STY     EDITOR_LEVEL_ENTRY      ; source level

    ; " TO LEVEL"
    JSR     PUT_STRING
    HEX     A0 D4 CF A0 CC C5 D6 C5 CC 00

    JSR     GET_LEVEL_FROM_KEYBOARD
    BCS     .beep
    STY     SAVED_VTOC_DATA         ; convenient place for target level

    ; "\r"
    ; "  SOURCE DISKETTE"
    JSR     PUT_STRING
    HEX     8D A0 A0 D3 CF D5 D2 C3 C5 A0 C4 C9 D3 CB C5 D4 D4 C5 00
 
    JSR     EDITOR_WAIT_FOR_KEY
    ; Deny and dump user back to editor if not valid data disk
    JSR     CHECK_FOR_VALID_DATA_DISK
    LDA     EDITOR_LEVEL_ENTRY              ; source level
    STA     DISK_LEVEL_LOC
    LDA     #$01
    JSR     LOAD_COMPRESSED_LEVEL_DATA      ; read source level

    ; "\r"
    ; "  DESTINATION DISKETTE"
    JSR     PUT_STRING
    HEX     8D A0 A0 C4 C5 D3 D4 C9 CE C1 D4 C9 CF CE A0 C4 C9 D3 CB C5 D4 D4 C5 00

    JSR     EDITOR_WAIT_FOR_KEY
    ; Deny and dump user back to editor if not valid data disk
    JSR     CHECK_FOR_VALID_DATA_DISK
    LDA     SAVED_VTOC_DATA                 ; target level
    STA     DISK_LEVEL_LOC
    LDA     #$02
    JSR     LOAD_COMPRESSED_LEVEL_DATA      ; write target level
    JMP     EDITOR_COMMAND_LOOP

.beep:
    JMP     .beep


    ORG    $7D5D
EDITOR_INITIALIZE_DISK:
    SUBROUTINE

    ; "\r"
    ; ">>INITIALIZE\r"
    ; "  THIS FORMATS THE DISKETTE\r"
    ; "  FOR USER CREATED LEVELS.\r"
    ; "  (CAUTION. IT ERASES THE\r"
    ; "   ENTIRE DISKETTE FIRST)\r"
    ; "\r"
    ; "  ARE YOU SURE (Y/N) "
    JSR     PUT_STRING
    HEX     8D BE BE C9 CE C9 D4 C9 C1 CC C9 DA C5 8D A0 A0
    HEX     D4 C8 C9 D3 A0 C6 CF D2 CD C1 D4 D3 A0 D4 C8 C5
    HEX     A0 C4 C9 D3 CB C5 D4 D4 C5 8D A0 A0 C6 CF D2 A0
    HEX     D5 D3 C5 D2 A0 C3 D2 C5 C1 D4 C5 C4 A0 CC C5 D6
    HEX     C5 CC D3 AE 8D A0 A0 A8 C3 C1 D5 D4 C9 CF CE AE
    HEX     A0 C9 D4 A0 C5 D2 C1 D3 C5 D3 A0 D4 C8 C5 8D A0
    HEX     A0 A0 C5 CE D4 C9 D2 C5 A0 C4 C9 D3 CB C5 D4 D4
    HEX     C5 A0 C6 C9 D2 D3 D4 A9 8D 8D A0 A0 C1 D2 C5 A0
    HEX     D9 CF D5 A0 D3 D5 D2 C5 A0 A8 D9 AF CE A9 A0 00

    JSR     EDITOR_WAIT_FOR_KEY
    CMP     #$D9        ; Y
    BNE     .end

    NOP     ; NOP x 15
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP

    LDA     DISK_LEVEL_LOC
    PHA

    ; Format the disk
    LDA     #$04
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    ; Write the boot sector (T0S0)
    LDA     #<DISK_BOOT_SECTOR_DATA
    STA     IOB_READ_WRITE_BUFFER_PTR
    LDA     #>DISK_BOOT_SECTOR_DATA
    STA     IOB_READ_WRITE_BUFFER_PTR+1
    LDA     #$00
    STA     IOB_TRACK_NUMBER
    STA     IOB_SECTOR_NUMBER
    LDA     #$02
    STA     IOB_COMMAND_CODE            
    JSR     ACCESS_DISK_OR_RESET_GAME   ; write T0S0 with DISK_BOOT_SECTOR_DATA.

    ; Read the VTOC (T17S0)
    LDA     #$E0
    STA     DISK_LEVEL_LOC              ; ends up being T17S0 (the VTOC)
    LDA     #$01
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    ; Copy from SAVED_VTOC_DATA to DISK_BUFFER and write it.
    LDY     #$37
.loop:
    LDA     SAVED_VTOC_DATA+1,Y
    STA     DISK_BUFFER,Y
    DEY
    BPL     .loop

    LDA     #$02
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    ; Read the first catalog sector (T17S15)
    LDA     #$EF
    STA     DISK_LEVEL_LOC
    LDA     #$01
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    ; Copy from SAVED_FILE_DESCRIPTIVE_ENTRY_DATA the first file descriptive
    ; entry to DISK_BUFFER and write it.
    LDY     #$20
.loop2:
    LDA     SAVED_FILE_DESCRIPTIVE_ENTRY_DATA,Y
    STA     DISK_BUFFER+11,Y
    DEY
    BPL     .loop2

    ; Write it back
    LDA     #$02
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    ; Read the high score sector
    LDA     #$01
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK

    ; Copy from HI_SCORE_DATA_MARKER and write it.
    LDY     #$0A
.loop3:
    LDA     HI_SCORE_DATA_MARKER,Y
    STA     $1FF4,Y
    DEY
    BPL     .loop3

    ; Write it back
    LDA     #$02
    JSR     LOAD_COMPRESSED_LEVEL_DATA

    PLA
    STA     DISK_LEVEL_LOC
.end:
    JMP     EDITOR_COMMAND_LOOP

    ORG    $7E75
EDITOR_CLEAR_HIGH_SCORES:
    SUBROUTINE

    ; "\r"
    ; ">>CLEAR SCORE FILE\r"
    ; "  THIS CLEARS THE HIGH\r"
    ; "  SCORE FILE OF ALL\r"
    ; "  ENTRIES.\r"
    ; "\r"
    ; "  ARE YOU SURE (Y/N) "
    JSR     PUT_STRING
    HEX     8D BE BE C3 CC C5 C1 D2 A0 D3 C3 CF D2 C5 A0 C6
    HEX     C9 CC C5 8D A0 A0 D4 C8 C9 D3 A0 C3 CC C5 C1 D2
    HEX     D3 A0 D4 C8 C5 A0 C8 C9 C7 C8 8D A0 A0 D3 C3 CF
    HEX     D2 C5 A0 C6 C9 CC C5 A0 CF C6 A0 C1 CC CC 8D A0
    HEX     A0 C5 CE D4 D2 C9 C5 D3 AE 8D 8D A0 A0 C1 D2 C5
    HEX     A0 D9 CF D5 A0 D3 D5 D2 C5 A0 A8 D9 AF CE A9 A0
    HEX     00

    JSR     EDITOR_WAIT_FOR_KEY
    CMP     #$D9        ; 'Y'
    BNE     .end

    LDA     #$01
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; read table
    CMP     #$00
    BNE     .good_disk
    JSR     BAD_DATA_DISK
    JMP     START_LEVEL_EDITOR

.good_disk:
    LDY     #$4F
    LDA     #$00

.loop:
    STA     HI_SCORE_DATA,Y
    DEY
    BPL     .loop

    LDA     #$02
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; write table

.end:
    JMP     EDITOR_WAIT_FOR_KEY


    ; Startup code

    ORG    $807F
CHECK_FOR_VALID_DATA_DISK:
    SUBROUTINE

    LDA     #$01
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; read table
    CMP     #$00        ; bad table
    BNE     .check_for_master_disk

    JSR     BAD_DATA_DISK
    JMP     START_LEVEL_EDITOR

.check_for_master_disk:
    CMP     #$01        ; master disk
    BNE     RETURN_FROM_SUBROUTINE

    JSR     DONT_MANIPULATE_MASTER_DISK
    JMP     START_LEVEL_EDITOR

    ORG    $8098
DONT_MANIPULATE_MASTER_DISK:
    SUBROUTINE

    JSR     CLEAR_HGR2
    LDA     #$40
    STA     DRAW_PAGE
    LDA     #$00
    STA     GAME_COLNUM
    STA     GAME_ROWNUM

    ; "USER NOT ALLOWED TO\r"
    ; "MANIPULATE MASTER DISKETTE."
    JSR     PUT_STRING
    HEX     D5 D3 C5 D2 A0 CE CF D4 A0 C1 CC CC CF D7 C5 C4
    HEX     A0 D4 CF 8D CD C1 CE C9 D0 D5 CC C1 D4 C5 A0 CD
    HEX     C1 D3 D4 C5 D2 A0 C4 C9 D3 CB C5 D4 D4 C5 AE 00

    ; fallthrough to HIT_KEY_TO_CONTINUE

    ORG    $80D8
HIT_KEY_TO_CONTINUE:
    SUBROUTINE

    ; "\r"
    ; "\r"
    ; "HIT A KEY TO CONTINUE "
    JSR     PUT_STRING
    HEX     8D 8D C8 C9 D4 A0 C1 A0 CB C5 D9 A0 D4 CF A0 C3
    HEX     CF CE D4 C9 CE D5 C5 A0 00

    JSR     BEEP
    STA     TXTPAGE2
    LDA     #$00
    JSR     WAIT_FOR_KEY
    STA     KBDSTRB
    STA     TXTPAGE1
RETURN_FROM_SUBROUTINE:
    RTS

    ORG    $8106
BAD_DATA_DISK:
    SUBROUTINE

    JSR     CLEAR_HGR2
    LDA     #$40
    STA     DRAW_PAGE
    LDA     #$00
    STA     GAME_COLNUM
    STA     GAME_ROWNUM

    ; "DISKETTE IN DRIVE IS NOT A\r"
    ; "LODE RUNNER DATA DISK."
    JSR     PUT_STRING
    HEX     C4 C9 D3 CB C5 D4 D4 C5 A0 C9 CE A0 C4 D2 C9 D6
    HEX     C5 A0 C9 D3 A0 CE CF D4 A0 C1 8D CC CF C4 C5 A0
    HEX     D2 D5 CE CE C5 D2 A0 C4 C1 D4 C1 A0 C4 C9 D3 CB
    HEX     AE 00

    JMP     HIT_KEY_TO_CONTINUE

    ORG    $817B
GET_LEVEL_FROM_KEYBOARD:
    SUBROUTINE

    LDY     DISK_LEVEL_LOC
    INY
    TYA
    JSR     TO_DECIMAL3     ; make 1-based
    LDA     GAME_COLNUM
    STA     SAVED_GAME_COLNUM

    ; Print current level
.loop:
    LDA     HUNDREDS,Y
    STY     KBD_ENTRY_INDEX     ; save Y
    JSR     PUT_DIGIT
    LDY     KBD_ENTRY_INDEX     ; restore Y
    INY
    CPY     #$03
    BCC     .loop

    LDA     SAVED_GAME_COLNUM
    STA     GAME_COLNUM
    LDY     #$00
    STY     KBD_ENTRY_INDEX

.loop2
    LDX     KBD_ENTRY_INDEX
    LDA     HUNDREDS,X
    CLC
    ADC     #$3B            ; sprite = '0' + X
    JSR     WAIT_FOR_KEY_PAGE_1
    STA     KBDSTRB
    CMP     #$8D            ; return
    BEQ     .return_pressed

    CMP     #$88            ; backspace
    BNE     .check_for_fwd_arrow

    LDX     KBD_ENTRY_INDEX
    BEQ     .beep           ; can't backspace past the beginning

    DEC     KBD_ENTRY_INDEX
    DEC     GAME_COLNUM
    JMP     .loop2

.check_for_fwd_arrow:
    CMP     #$95            ; fwd arrow
    BNE     .check_for_escape

    LDX     KBD_ENTRY_INDEX
    CPX     #$02
    BEQ     .beep           ; can't fwd past the end

    INC     GAME_COLNUM
    INC     KBD_ENTRY_INDEX
    JMP     .loop2

.check_for_escape:
    CMP     #$9B            ; ESC
    BNE     .check_for_digit
    JMP     EDITOR_COMMAND_LOOP

.check_for_digit:
    CMP     #$B0            ; '0'
    BCC     .beep           ; less than '0' not allowed
    CMP     #$BA            ; '9'+1
    BCS     .beep           ; greater than '9' not allowed

    SEC
    SBC     #$B0            ; char - '0'
    LDY     KBD_ENTRY_INDEX
    STA     HUNDREDS,Y
    JSR     PUT_DIGIT
    INC     KBD_ENTRY_INDEX
    LDA     KBD_ENTRY_INDEX
    CMP     #$03
    BCC     .loop2

    ; Don't allow a fourth digit
    DEC     KBD_ENTRY_INDEX
    DEC     GAME_COLNUM
    JMP     .loop2

.beep:
    JSR     BEEP
    JMP     .loop2

.return_pressed:
    LDA     SAVED_GAME_COLNUM
    CLC
    ADC     #$03
    STA     GAME_COLNUM
    LDA     #$00
    LDX     HUNDREDS
    BEQ     .add_tens

    CLC
.loop_hundreds:
    ADC     #100
    BCS     .end
    DEX
    BNE     .loop_hundreds

.add_tens:
    LDX     TENS
    BEQ     .add_units

    CLC
.loop_tens:
    ADC     #10
    BCS     .end
    DEX
    BNE     .loop_tens

.add_units:
    CLC
    ADC     UNITS
    BCS     .end

    STA     LEVELNUM
    TAY
    DEY
    STY     DISK_LEVEL_LOC
    CPY     #$96

.end:
    RTS


    ; Player movement routines

    ORG    $823D
EDITOR_WAIT_FOR_KEY:
    SUBROUTINE

    LDA     #$00
    JSR     WAIT_FOR_KEY_PAGE_1
    STA     KBDSTRB
    CMP     #$9B        ; ESC
    BNE     .return
    JMP     EDITOR_COMMAND_LOOP

.return
    RTS

    ORG    $824C
KBD_ENTRY_INDEX:
    HEX     60

    ORG    $824F
EDITOR_LEVEL_ENTRY:
    HEX     0F

    ORG    $8250
SAVED_VTOC_DATA:
    HEX     60 02 11 0F 04 00 00 FE 00 00 00 00 00 00 00 00
    HEX     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    HEX     00 00 00 00 00 00 00 00 7A 00 00 00 00 00 00 00
    HEX     00 FF FF 00 00 23 0F 00

    ORG    $8289
SAVED_FILE_DESCRIPTIVE_ENTRY_DATA:
    HEX     22 ; Track of first track/sector list sector (T34)
    HEX     0F ; Sector of first track/sector list sector (S15)
    HEX     88 ; File type and flags: locked, S-type file
    ; File name: "^H^H^H^H^H^H^HLODE RUNNER DATA DISK  "
    HEX     88 88 88 88 88 88 88 CC CF C4 C5 A0 D2 D5 CE CE
    HEX     C5 D2 A0 C4 C1 D4 C1 A0 C4 C9 D3 CB A0 A0
    ORG    $82AA
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
    JSR     GET_SCREEN_COORDS_FOR
    STY     ROWNUM              ; ROWNUM = SCREEN_ROW_TABLE[GAME_ROWNUM]

    LDX     GAME_COLNUM
    JSR     GET_BYTE_AND_SHIFT_FOR_COL
    STA     COLNUM              ; COLNUM = COL_BYTE_TABLE[GAME_COLNUM]
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
    ORG    $8328
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
    ORG    $8336
ERASE_SPRITE_AT_PIXEL_COORDS:
    SUBROUTINE
    ; Enter routine with A set to sprite number to draw,
    ; Y set to the screen row to erase it at, and X
    ; set to *half* the screen column to erase it at.

    STY     ROWNUM
    STA     SPRITE_NUM
    JSR     GET_BYTE_AND_SHIFT_FOR_HALF_SCREEN_COL
    STA     COLNUM
    STX     COL_SHIFT_AMT
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
    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES
    LDY     COLNUM
    LDA     BLOCK_DATA,X
    EOR     #$7F
    AND     (ROW_ADDR),Y
    ORA     (ROW_ADDR2),Y
    STA     (ROW_ADDR),Y            ; screen[COLNUM] =
                                    ;   (screen[COLNUM] & (BLOCK_DATA[i] ^ 0x7F)) | screen2[COLNUM]

    INX                             ; X++
    INY                             ; Y++
    LDA     BLOCK_DATA+1,X
    EOR     #$7F
    AND     (ROW_ADDR),Y
    ORA     (ROW_ADDR2),Y
    STA     (ROW_ADDR),Y            ; screen[COLNUM+1] =
                                    ;   (screen[COLNUM+1] & (BLOCK_DATA[i+1] ^ 0x7F)) | screen2[COLNUM+1]

    INX                             ; X++
    INX                             ; X++
    INC     ROWNUM
    DEC     ROW_COUNT
    BNE     .loop1
    RTS

.need_3_bytes:
    LDY     ROWNUM
    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES
    LDY     COLNUM
    LDA     BLOCK_DATA,X
    EOR     #$7F
    AND     (ROW_ADDR),Y
    ORA     (ROW_ADDR2),Y
    STA     (ROW_ADDR),Y            ; screen[COLNUM] =
                                    ;   (screen[COLNUM] & (BLOCK_DATA[i] ^ 0x7F)) | screen2[COLNUM]

    INX                             ; X++
    INY                             ; Y++
    LDA     BLOCK_DATA+1,X
    EOR     #$7F
    AND     (ROW_ADDR),Y
    ORA     (ROW_ADDR2),Y
    STA     (ROW_ADDR),Y            ; screen[COLNUM+1] =
                                    ;   (screen[COLNUM+1] & (BLOCK_DATA[i+1] ^ 0x7F)) | screen2[COLNUM+1]

    INX                             ; X++
    INY                             ; Y++
    LDA     BLOCK_DATA+2,X
    EOR     #$7F
    AND     (ROW_ADDR),Y
    ORA     (ROW_ADDR2),Y
    STA     (ROW_ADDR),Y            ; screen[COLNUM+2] =
                                    ;   (screen[COLNUM+2] & (BLOCK_DATA[i+2] ^ 0x7F)) | screen2[COLNUM+2]

    INX                             ; X++
    INC     ROWNUM
    DEC     ROW_COUNT
    BNE     .need_3_bytes
    RTS

    ORG    $83A7
DRAW_SPRITE_AT_PIXEL_COORDS:
    SUBROUTINE
    ; Enter routine with A set to sprite number to draw,
    ; Y set to the screen row to draw it at, and X
    ; set to *half* the screen column to draw it at.

    STY     ROWNUM
    STA     SPRITE_NUM
    JSR     GET_BYTE_AND_SHIFT_FOR_HALF_SCREEN_COL
    STA     COLNUM
    STX     COL_SHIFT_AMT
    JSR     COMPUTE_SHIFTED_SPRITE

    LDA     #$0B
    STA     ROW_COUNT
    LDX     #$00
    STX     SCREENS_DIFFER      ; SCREENS_DIFFER = 0
    LDA     COL_SHIFT_AMT
    CMP     #$05
    BCS     .need_3_bytes       ; If COL_SHIFT_AMT >= 5, we need to alter three screen bytes,
                                ; otherwise just two bytes.

.loop1:
    LDY     ROWNUM
    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES
    LDY     COLNUM
    LDA     (ROW_ADDR),Y
    EOR     (ROW_ADDR2),Y
    AND     BLOCK_DATA,X
    ORA     SCREENS_DIFFER
    STA     SCREENS_DIFFER          ; SCREENS_DIFFER |= 
                                    ;   ( (screen[COLNUM] ^ screen2[COLNUM]) & BLOCK_DATA[i])
    LDA     BLOCK_DATA,X            
    ORA     (ROW_ADDR),Y            
    STA     (ROW_ADDR),Y            ; screen[COLNUM] |= BLOCK_DATA[i]

    INX                             ; X++
    INY                             ; Y++
    LDA     (ROW_ADDR),Y
    EOR     (ROW_ADDR2),Y
    AND     BLOCK_DATA+1,X
    ORA     SCREENS_DIFFER
    STA     SCREENS_DIFFER          ; SCREENS_DIFFER |= 
                                    ;   ( (screen[COLNUM+1] ^ screen2[COLNUM+1]) & BLOCK_DATA[i+1])
    LDA     BLOCK_DATA+1,X            
    ORA     (ROW_ADDR),Y            
    STA     (ROW_ADDR),Y            ; screen[COLNUM+1] |= BLOCK_DATA[i+1]

    INX                             ; X++
    INX                             ; X++
    INC     ROWNUM
    DEC     ROW_COUNT
    BNE     .loop1
    RTS

.need_3_bytes:
    LDY     ROWNUM
    JSR     ROW_TO_ADDR_FOR_BOTH_PAGES
    LDY     COLNUM
    LDA     (ROW_ADDR),Y
    EOR     (ROW_ADDR2),Y
    AND     BLOCK_DATA,X
    ORA     SCREENS_DIFFER
    STA     SCREENS_DIFFER          ; SCREENS_DIFFER |= 
                                    ;   ( (screen[COLNUM] ^ screen2[COLNUM]) & BLOCK_DATA[i])
    LDA     BLOCK_DATA,X            
    ORA     (ROW_ADDR),Y            
    STA     (ROW_ADDR),Y            ; screen[COLNUM] |= BLOCK_DATA[i]

    INX                             ; X++
    INY                             ; Y++
    LDA     (ROW_ADDR),Y
    EOR     (ROW_ADDR2),Y
    AND     BLOCK_DATA+1,X
    ORA     SCREENS_DIFFER
    STA     SCREENS_DIFFER          ; SCREENS_DIFFER |= 
                                    ;   ( (screen[COLNUM+1] ^ screen2[COLNUM+1]) & BLOCK_DATA[i+1])
    LDA     BLOCK_DATA+1,X            
    ORA     (ROW_ADDR),Y            
    STA     (ROW_ADDR),Y            ; screen[COLNUM+1] |= BLOCK_DATA[i+1]

    INX                             ; X++
    INY                             ; Y++
    LDA     (ROW_ADDR),Y
    EOR     (ROW_ADDR2),Y
    AND     BLOCK_DATA+2,X
    ORA     SCREENS_DIFFER
    STA     SCREENS_DIFFER          ; SCREENS_DIFFER |= 
                                    ;   ( (screen[COLNUM+2] ^ screen2[COLNUM+2]) & BLOCK_DATA[i+2])
    LDA     BLOCK_DATA+2,X            
    ORA     (ROW_ADDR),Y            
    STA     (ROW_ADDR),Y            ; screen[COLNUM+2] |= BLOCK_DATA[i+2]

    INX                             ; X++
    INC     ROWNUM
    DEC     ROW_COUNT
    BNE     .loop1
    RTS

    ORG    $8438
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
    ORG    $84C1
PIXEL_SHIFT_PAGES:
    HEX     A2 A3 A4 A5 A6 A7 A8
    ORG    $84C8
RECORD_HI_SCORE_DATA_TO_DISK:
    SUBROUTINE

    LDA     $9D
    BEQ     .end

    LDA     SCORE
    ORA     SCORE+1
    ORA     SCORE+2
    ORA     SCORE+3
    BEQ     .end

    LDA     #$01
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; read table
    ; Return value of 0 means the hi score marker wasn't present,
    ; so don't write the hi score table.
    BEQ     .end

    LDY     #$01
.loop:
    LDX     HI_SCORE_TABLE_OFFSETS,Y
    LDA     LEVELNUM
    CMP     HI_SCORE_DATA+3,X       ; level
    BCC     .next
    BNE     .record_it

    LDA     SCORE+3
    CMP     HI_SCORE_DATA+4
    BCC     .next
    BNE     .record_it

    LDA     SCORE+2
    CMP     HI_SCORE_DATA+5
    BCC     .next
    BNE     .record_it

    LDA     SCORE+1
    CMP     HI_SCORE_DATA+6
    BCC     .next
    BNE     .record_it

    LDA     SCORE
    CMP     HI_SCORE_DATA+7
    BCC     .next
    BNE     .record_it

.next:
    INY
    CPY     #$0B
    BCC     .loop

.end:
    RTS

.record_it:
    CPY     #$0A
    BEQ     .write_here
    STY     $56

    ; Move the table rows to make room at index $56
    LDY     #$09
.loop2:
    LDX     HI_SCORE_TABLE_OFFSETS,Y

    ; Move 8 bytes of hi score data
    LDA     #$08
    STA     ROW_COUNT       ; temporary counter
.loop3:
    LDA     HI_SCORE_DATA,X
    STA     HI_SCORE_DATA+8,X
    INX
    DEC     ROW_COUNT
    BNE     .loop3

    CPY     $56
    BEQ     .write_here
    DEY
    BNE     .loop2

.write_here:
    LDX     HI_SCORE_TABLE_OFFSETS,Y
    LDA     #$A0
    STA     HI_SCORE_DATA,X
    STA     HI_SCORE_DATA+1,X
    STA     HI_SCORE_DATA+2,X
    LDA     LEVELNUM
    STA     HI_SCORE_DATA+3,X
    LDA     SCORE+3
    STA     HI_SCORE_DATA+4,X
    LDA     SCORE+2
    STA     HI_SCORE_DATA+5,X
    LDA     SCORE+1
    STA     HI_SCORE_DATA+6,X
    LDA     SCORE
    STA     HI_SCORE_DATA+7,X
    STY     WIPE0               ; temporary
    LDA     HI_SCORE_TABLE_OFFSETS,Y
    STA     .rd_loc+1
    STA     .wr_loc+1
    JSR     HI_SCORE_SCREEN

    LDA     #$40
    STA     DRAW_PAGE
    LDA     WIPE0
    CLC
    ADC     #$04
    STA     GAME_ROWNUM
    LDA     #$07
    STA     GAME_COLNUM

    LDX     #$00
    STX     HIGH_SCORE_INITIALS_INDEX
.get_initial_from_player:
    LDX     HIGH_SCORE_INITIALS_INDEX
.rd_loc:
    LDA     HI_SCORE_DATA,X     ; fixed up to add offset from above
    JSR     CHAR_TO_SPRITE_NUM
    JSR     WAIT_FOR_KEY
    STA     KBDSTRB
    CMP     #$8D
    BEQ     .return_pressed
    CMP     #$88                ; backspace/back arrow
    BNE     .other_key_pressed

    ; backspace pressed
    LDX     KBD_ENTRY_INDEX
    BEQ     .beep       ; can't backspace/back arrow past the beginning

    DEC     HIGH_SCORE_INITIALS_INDEX
    DEC     GAME_COLNUM
    JMP     .get_initial_from_player

.other_key_pressed:
    CMP     #$95            ; fwd arrow
    BNE     .check_for_allowed_chars
    LDX     KBD_ENTRY_INDEX
    CPX     #$02
    BEQ     .beep       ; can't fwd arrow past the end

    INC     GAME_COLNUM
    INC     KBD_ENTRY_INDEX
    JMP     .get_initial_from_player

.check_for_allowed_chars
    CMP     #$AE        ; period allowed
    BEQ     .put_char
    CMP     #$A0        ; space allowed
    BEQ     .put_char
    CMP     #$C1
    BCC     .beep       ; can't be less than 'A'
    CMP     #$DB
    BCS     .beep       ; can't be greater than 'Z'

.put_char
    LDY     KBD_ENTRY_INDEX
.wr_loc:
    STA     HI_SCORE_DATA,Y     ; fixed up to add offset from above
    JSR     PUT_CHAR
    INC     KBD_ENTRY_INDEX
    LDA     KBD_ENTRY_INDEX
    CMP     #$03
    BCC     .get_initial_from_player

.beep:
    JSR     BEEP
    JMP     .get_initial_from_player

.return_pressed:
    LDA     #$20
    STA     DRAW_PAGE
    LDA     #$02
    JSR     ACCESS_HI_SCORE_DATA_FROM_DISK      ; write hi score table
    JMP     $618E

    ORG    $85F3
WAIT_FOR_KEY:
    SUBROUTINE
    ; Enter routine with A set to cursor sprite. If zero, sprite 10 (all white)
    ; will be used.

    STA     CURSOR_SPRITE

.loop:
    LDA     #$68
    STA     SCRATCH_A1
    LDA     CURSOR_SPRITE
    BNE     .draw_sprite
    LDA     #$0A            ; all-white sprite
.draw_sprite:
    JSR     DRAW_SPRITE_PAGE2

.loop2:
    LDA     KBD
    BMI     .end            ; on keypress, end

    JSR     CHECK_JOYSTICK_OR_DELAY
    DEC     SCRATCH_A1
    BNE     .loop2

    ; Draw a blank
    LDA     #$00
    JSR     DRAW_SPRITE_PAGE2
    LDA     #$68
    STA     SCRATCH_A1

.loop3:
    LDA     KBD
    BMI     .end
    JSR     CHECK_JOYSTICK_OR_DELAY
    DEC     SCRATCH_A1
    BNE     .loop3
    JMP     .loop

.end:
    PHA
    LDA     CURSOR_SPRITE
    JSR     DRAW_SPRITE_PAGE2
    PLA
    RTS

    ORG    $8631
DO_LADDERS:
    SUBROUTINE

    LDA     #$00
    STA     LADDER_LOCS_COL     ; LADDER_LOCS_COL = 0

    LDX     LADDER_COUNT
    STX     .count              ; .count backwards from LADDER_COUNT to 0
.loop:
    LDX     .count
    BEQ     .dec_gold_count_if_no_ladder

    LDA     LADDER_LOCS_COL,X   ; A = LADDER_LOCS_COL[X]
    BMI     .next               ; If not present, next.

    STA     GAME_COLNUM         ; GAME_COLNUM = LADDER_LOCS_COL[X]
    LDA     LADDER_LOCS_ROW,X
    STA     GAME_ROWNUM         ; GAME_ROWNUM = LADDER_LOCS_ROW[X]
    TAY
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    LDY     GAME_COLNUM
    LDA     (PTR2),Y            ; A = sprite at ladder loc
    BNE     .set_col_to_1

    LDA     #$03
    STA     (PTR2),Y            ; Set background sprite to ladder
    LDA     (PTR1),Y
    BNE     .draw_ladder        ; .draw_ladder if active sprite not blank

    LDA     #$03
    STA     (PTR1),Y            ; Set active sprite to ladder

.draw_ladder:
    LDA     #$03
    JSR     DRAW_SPRITE_PAGE2   ; Draw ladder on background page

    LDX     GAME_COLNUM
    LDY     GAME_ROWNUM
    JSR     GET_SCREEN_COORDS_FOR
    LDA     #$03
    JSR     DRAW_SPRITE_AT_PIXEL_COORDS ; Draw ladder on active page

    LDX     .count
    LDA     #$FF
    STA     LADDER_LOCS_COL,X       ; Remove ladder loc
    BMI     .next                   ; Unconditional

.set_col_to_1:
    LDA     #$01
    STA     LADDER_LOCS_COL         ; LADDER_LOCS_COL = 1

.next:
    DEC     .count
    JMP     .loop

.dec_gold_count_if_no_ladder:
    LDA     LADDER_LOCS_COL
    BNE     .end
    DEC     GOLD_COUNT

.end:
    RTS

.count:
    BYTE    0

    ORG    $86A8
WAIT_KEY:
    SUBROUTINE

    LDA     KBD
    BPL     WAIT_KEY
    STA     KBDSTRB
    RTS
    ORG    $86B5
SOUND_DELAY:
    SUBROUTINE

    LDY     #$B4        ; 180
.loop:
    DEY                 ; 2 cycles
    BNE     .loop       ; 3 cycles
    DEX                 ; 2 cycles
    BNE     .loop       ; 3 cycles
    RTS

    ORG    $86CE
BEEP:
    SUBROUTINE

    LDY     #$C0

.loop:
    ; From here to click is 651 cycles. Additional 5 cycles afterwards.
    LDX     #$80            ; 2 cycles

    ; delay 640 cycles
.loop2:
    DEX                     ; 2 cycles
    BNE     .loop2          ; 3 cycles

    LDA     ENABLE_SOUND    ; 3 cycles
    BEQ     .next           ; 3 cycles
    LDA     SPKR            ; 3 cycles

.next:
    DEY                     ; 2 cycles
    BNE     .loop           ; 3 cycles
    RTS

    ORG    $86E0
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

    ORG    $8700
WAIT_FOR_KEY_PAGE_1:
    SUBROUTINE
    ; Enter routine with A set to cursor sprite. If zero, sprite 10 (all white)
    ; will be used.

    STA     CURSOR_SPRITE

.loop:
    LDA     #$68
    STA     SCRATCH_A1
    LDA     #$00
    LDX     CURSOR_SPRITE
    BNE     .draw_sprite
    LDA     #$0A            ; all-white sprite
.draw_sprite:
    JSR     DRAW_SPRITE_PAGE1

.loop2:
    LDA     KBD
    BMI     .end            ; on keypress, end

    JSR     CHECK_JOYSTICK_OR_DELAY
    BCS     .end

    DEC     SCRATCH_A1
    BNE     .loop2

    LDA     CURSOR_SPRITE
    JSR     DRAW_SPRITE_PAGE1
    LDA     #$68
    STA     SCRATCH_A1

.loop3:
    LDA     KBD
    BMI     .end

    JSR     CHECK_JOYSTICK_OR_DELAY
    BCS     .end

    DEC     SCRATCH_A1
    BNE     .loop3
    JMP     .loop

.end:
    PHA
    LDA     CURSOR_SPRITE
    JSR     DRAW_SPRITE_PAGE1
    PLA
    RTS

    ORG    $8745
CURSOR_SPRITE:
    HEX     06
SAVED_GAME_COLNUM       EQU     $824E
PTR1        EQU     $06     ; 2 bytes
PTR2        EQU     $08     ; 2 bytes
PLAYER_COL      EQU     $00
PLAYER_ROW      EQU     $01
GUARD_COUNT     EQU      $8D
GOLD_COUNT      EQU      $93
LADDER_COUNT    EQU      $A3
VERBATIM        EQU      $A2
PLAYER_X_ADJ                EQU     $02     ; [0-4] minus 2 (so 2 = right on the sprite location)
PLAYER_Y_ADJ                EQU     $03     ; [0-4] minus 2 (so 2 = right on the sprite location)
PLAYER_ANIM_STATE           EQU     $04     ; Index into SPRITE_ANIM_SEQS
PLAYER_FACING_DIRECTION     EQU     $05     ; Hi bit set: facing left, otherwise facing right
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
PREGAME_MODE            EQU     $A7
DISK_BUFFER   EQU     $0D00       ; 256 bytes
RWTS_ADDR               EQU     $24         ; 2 bytes
DISK_LEVEL_LOC          EQU     $96
ALIVE       EQU     $9A
TMP                     EQU     $1A
LEVEL_DATA_INDEX        EQU     $92
HI_SCORE_DATA    EQU     $1F00      ; 256 bytes
TXTPAGE2                EQU     $C055
ROMIN_RDROM_WRRAM2      EQU     $C081
TXTCLR                  EQU     $C050
MIXCLR                  EQU     $C052
TXTPAGE1                EQU     $C054
HIRES                   EQU     $C057
KBDSTRB     EQU     $C010
KBD         EQU     $C000
DIDNT_PICK_UP_GOLD      EQU     $94
KEY_COMMAND     EQU     $9E
SCRATCH_88      EQU     $88
TABLE_0CA0      EQU     $0CA0       ; 31 bytes
TABLE_0CC0      EQU     $0CC0       ; 31 bytes
DIG_DIRECTION       EQU     $9C     ; 0xFF = left, 0x00 = not digging, 0x01 = right
DIG_ANIM_STATE      EQU     $A0     ; 00-0C
GUARD_LOCS_COL      EQU     $0C60       ; 8 bytes
GUARD_LOCS_ROW      EQU     $0C68       ; 8 bytes
GUARD_FLAGS_0       EQU     $0C70       ; 8 bytes
GUARD_X_ADJS        EQU     $0C78       ; 8 bytes
GUARD_Y_ADJS        EQU     $0C80       ; 8 bytes
GUARD_ANIM_STATES   EQU     $0C88       ; 8 bytes
GUARD_FLAGS_4       EQU     $0C90       ; 8 bytes
GUARD_FLAGS_5       EQU     $0C98       ; 8 bytes

GUARD_LOC_COL       EQU     $12
GUARD_LOC_ROW       EQU     $13
GUARD_ANIM_STATE    EQU     $14
GUARD_FLAG_4        EQU     $15
GUARD_FLAG_0        EQU     $16
GUARD_X_ADJ         EQU     $17
GUARD_Y_ADJ         EQU     $18
GUARD_NUM           EQU     $19

GUARD_PATTERN       EQU     $63
GUARD_PHASE         EQU     $64
DOS_IOB                     EQU     $B7E8
IOB_SLOTNUMx16              EQU     $B7E9
IOB_DRIVE_NUM               EQU     $B7EA
IOB_VOLUME_NUMBER_EXPECTED  EQU     $B7EB
IOB_TRACK_NUMBER            EQU     $B7EC
IOB_SECTOR_NUMBER           EQU     $B7ED
IOB_DEVICE_CHARACTERISTICS_TABLE_PTR        EQU     $B7EE   ; 2 bytes
IOB_READ_WRITE_BUFFER_PTR   EQU     $B7F0   ; 2 bytes
IOB_UNUSED                  EQU     $B7F2
IOB_BYTE_COUNT_FOR_PARTIAL_SECTOR   EQU     $B7F3
IOB_COMMAND_CODE            EQU     $B7F4
IOB_RETURN_CODE             EQU     $B7F5
IOB_LAST_ACCESS_VOLUME      EQU     $B7F6
IOB_LAST_ACCESS_SLOTx16     EQU     $B7F7
IOB_LAST_ACCESS_DRIVE       EQU     $B7F8

DCT_DEVICE_TYPE             EQU     $B7FB
DCT_PHASES_PER_TRACK        EQU     $B7FC
DCT_MOTOR_ON_TIME_COUNT     EQU     $B7FD   ; 2 bytes
HIGH_SCORE_INITIALS_INDEX       EQU     $824D
DISK_BOOT_SECTOR_DATA   EQU     $1DB2       ; 256 bytes
GUARD_PATTERN_OFFSET        EQU     $97
    ORG    $8746
READ_PADDLES:
    SUBROUTINE

    LDA     #$00
    STA     PADDLE0_VALUE
    STA     PADDLE1_VALUE       ; Zero out values
    LDA     PTRIG

.loop:
    LDX     #$01                ; Start with paddle 1

.check_paddle:
    LDA     PADDL0,X
    BPL     .threshold_reached
    INC     PADDLE0_VALUE,X
.check_next_paddle
    DEX
    BPL     .check_paddle

    ; Checked both paddles
    LDA     PADDL0
    ORA     PADDL1
    BPL     .end                ; Both paddles triggered, then end.
    LDA     PADDLE0_VALUE
    ORA     PADDLE1_VALUE
    BPL     .loop               ; Unconditional

.threshold_reached:
    NOP
    BPL     .check_next_paddle      ; Unconditional

.end:
    RTS

    ORG    $876D
CHECK_JOYSTICK_OR_DELAY:
    SUBROUTINE

    LDA     INPUT_MODE
    CMP     KEYBOARD_MODE
    BEQ     .delay_and_return       ; Keyboard mode, so just delay and return

    JSR     READ_PADDLES

    LDA     PADDLE0_VALUE
    CMP     #$12
    BCC     .have_joystick_input           ; PADDLE0_VALUE < 0x12
    CMP     #$3B
    BCS     .have_joystick_input           ; PADDLE0_VALUE >= 0x3B

    LDA     PADDLE1_VALUE
    CMP     #$12
    BCC     .have_joystick_input
    CMP     #$3B
    BCS     .have_joystick_input

    LDA     BUTN1
    BMI     .have_joystick_input
    LDA     BUTN0
    BMI     .have_joystick_input

    CLC
    RTS

.have_joystick_input:
    SEC
    RTS

.delay_and_return:
    LDX     #$02
.loop:
    DEY
    BNE     .loop
    DEX
    BNE     .loop
    CLC
    RTS


    ; Keyboard routines

    ORG    $87BA
PLAY_NOTE:
    SUBROUTINE

    STA     TMP_PTR
    STX     TMP_PTR+1

.loop:
    LDA     ENABLE_SOUND
    BEQ     .decrement_counter
    LDA     SPKR

.decrement_counter:
    DEY
    BNE     .counter_decremented
    DEC     TMP_PTR+1
    BEQ     .end

.counter_decremented:
    DEX
    BNE     .decrement_counter
    LDX     TMP_PTR
    JMP     .loop

.end:
    RTS

    ORG    $87D5
APPEND_NOTE:
    SUBROUTINE

    INC     NOTE_INDEX
    LDY     NOTE_INDEX
    STA     SOUND_PITCH,Y
    TXA
    STA     SOUND_DURATION,Y
    RTS

    ORG    $87E1
LOAD_SOUND_DATA:
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
    INC     NOTE_INDEX
    LDX     NOTE_INDEX
    STA     SOUND_DURATION,X
    INY
    LDA     (SAVED_RET_ADDR),Y
    STA     SOUND_PITCH,X

    INC     SAVED_RET_ADDR
    BNE     .next
    INC     SAVED_RET_ADDR+1

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

    ORG    $8811
PLAY_SOUND:
    SUBROUTINE

    LDY     NOTE_INDEX
    BEQ     .no_more_notes
    LDA     SOUND_PITCH,Y
    LDX     SOUND_DURATION,Y
    JSR     PLAY_NOTE

    LDY     NOTE_INDEX              ; Y = NOTE_INDEX
    DEC     NOTE_INDEX              ; NOTE_INDEX--
    LDA     FRAME_PERIOD
    SEC
    SBC     SOUND_DURATION,Y        ; A = FRAME_PERIOD - SOUND_DURATION[Y]
    BEQ     .done
    BCC     .done                   ; If A <= 0, done.
    TAX
    JSR     SOUND_DELAY

.done:
    SEC
    RTS

.no_more_notes:
    LDA     $9B
    BNE     .end
    LDA     $A4
    LSR                     ; pitch = $A4 >> 1
    INC     $A4             ; $A4++
    LDX     FRAME_PERIOD
    INX
    INX                     ; duration = FRAME_PERIOD + 2
    JSR     PLAY_NOTE

    CLC
    RTS

.end:
    LDX     FRAME_PERIOD
    JSR     SOUND_DELAY

    CLC
    RTS

    ORG    $884B
GET_PTRS_TO_CURR_LEVEL_SPRITE_DATA:
    SUBROUTINE

    LDA     CURR_LEVEL_ROW_SPRITES_PTR_OFFSETS,Y
    STA     PTR1
    STA     PTR2
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES,Y
    STA     PTR1+1
    LDA     CURR_LEVEL_ROW_SPRITES_PTR_PAGES2,Y
    STA     PTR2+1

    RTS

    ORG    $885D
GET_SCREEN_COORDS_FOR:
    SUBROUTINE
    ; Enter routine with Y set to sprite row (0-16) and
    ; X set to sprite column (0-27). On return, Y will be set to
    ; screen row, and X is set to half screen column.

    LDA     SCREEN_ROW_TABLE,Y 
    PHA
    LDA     HALF_SCREEN_COL_TABLE,X 
    TAX                         ; X = HALF_SCREEN_COL_TABLE[X]
    PLA
    TAY                         ; Y = SCREEN_ROW_TABLE[Y]
    RTS
    ORG    $8868
GET_BYTE_AND_SHIFT_FOR_COL:
    SUBROUTINE
    ; Enter routine with X set to sprite column. On
    ; return, A will be set to screen column byte number
    ; and X will be set to an additional right shift amount.

    LDA     COL_BYTE_TABLE,X 
    PHA                         ; A = COL_BYTE_TABLE[X]
    LDA     COL_SHIFT_TABLE,X 
    TAX                         ; X = COL_SHIFT_TABLE[X]
    PLA
    RTS
    ORG    $8872
GET_BYTE_AND_SHIFT_FOR_HALF_SCREEN_COL:
    SUBROUTINE
    ; Enter routine with X set to half screen column. On
    ; return, A will be set to screen column byte number
    ; and X will be set to an additional right shift amount.

    LDA     HALF_SCREEN_COL_BYTE_TABLE,X 
    PHA                         ; A = HALF_SCREEN_COL_BYTE_TABLE[X]
    LDA     HALF_SCREEN_COL_SHIFT_TABLE,X 
    TAX                         ; X = HALF_SCREEN_COL_SHIFT_TABLE[X]
    PLA
    RTS
    ORG    $887C
GET_SCREEN_ROW_OFFSET_IN_X_FOR:
    SUBROUTINE
    ; Enter routine with X set to offset+2 (in double-pixels) and
    ; Y set to sprite row. On return, X will retain its value and
    ; Y will be set to the screen row.

    TXA
    PHA
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    TAX                                 ; Restore X
    TYA
    CLC
    ADC     ROW_OFFSET_TABLE,X
    TAY
    RTS
    ORG    $888A
ROW_OFFSET_TABLE:
    HEX     FB FD 00 02 04
    ORG    $888F
GET_HALF_SCREEN_COL_OFFSET_IN_Y_FOR:
    SUBROUTINE
    ; Enter routine with Y set to offset+2 (in double-pixels) and
    ; X set to sprite column. On return, Y will retain its value and
    ; X will be set to the half screen column.

    TYA
    PHA
    JSR     GET_SCREEN_COORDS_FOR
    PLA
    TAY                                 ; Restore Y
    TXA
    CLC
    ADC     COL_OFFSET_TABLE,Y
    TAX
    RTS
    ORG    $889D
COL_OFFSET_TABLE:
    HEX     FE FF 00 01 02
    ORG    $88A2
IRIS_WIPE:
    SUBROUTINE

    LDA     #88
    STA     WIPE_CENTER_Y
    LDA     #140
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

    ORG    $88D7
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

    ORG    $8A45
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

    ; Sprite routines

    ORG    $8A69
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


    ORG    $8AF6
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

    ORG    $8B0C
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
    ORG    $8B1A
SPINNING_GAME_OVER:
    SUBROUTINE

    LDA     #$01
    STA     ANIM_COUNT
    LDA     #$20
    STA     HGR_PAGE

.loop:
    JSR     ANIM5
    JSR     ANIM4
    JSR     ANIM3
    JSR     ANIM2
    JSR     ANIM1
    JSR     ANIM0
    JSR     ANIM1
    JSR     ANIM2
    JSR     ANIM3
    JSR     ANIM4
    JSR     ANIM5
    JSR     ANIM10
    JSR     ANIM9
    JSR     ANIM8
    JSR     ANIM7
    JSR     ANIM6
    JSR     ANIM7
    JSR     ANIM8
    JSR     ANIM9
    JSR     ANIM10
    LDA     ANIM_COUNT
    CMP     #100
    BCC     .loop

    JSR     ANIM5
    JSR     ANIM4
    JSR     ANIM3
    JSR     ANIM2
    JSR     ANIM1
    JSR     ANIM0
    CLC
    RTS

    ORG    $8B7A
ANIM0:
    JSR     SHOW_ANIM_LINE
    HEX     00 01 02 03 04 05 06 07 08 09 0A 02 01 00
ANIM1:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 01 02 03 04 05 07 09 0A 02 01 00 00
ANIM2:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 01 02 03 04 09 0A 02 01 00 00 00
ANIM3:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 00 01 02 03 0A 02 01 00 00 00 00
ANIM4:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 00 00 01 03 0A 01 00 00 00 00 00
ANIM5:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 00 00 00 01 01 00 00 00 00 00 00
ANIM6:
    JSR     SHOW_ANIM_LINE
    HEX     00 01 02 0A 09 08 07 06 05 04 03 02 01 00
ANIM7:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 01 02 0A 09 07 05 04 03 02 01 00 00
ANIM8:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 01 02 0A 09 04 03 02 01 00 00 00
ANIM9:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 00 01 02 0A 03 02 01 00 00 00 00
ANIM10:
    JSR     SHOW_ANIM_LINE
    HEX     00 00 00 00 00 01 0A 03 01 00 00 00 00 00

    ORG    $8C35
TABLE0:
    HEX     80 80 80 80 80 80 80 80 80 80 80 80 80 80
TABLE1:
    HEX     C0 AA D5 AA D5 AA D5 AA D5 AA D5 AA D5 80
TABLE2:
    HEX     90 80 80 80 80 80 80 80 80 80 80 80 80 82
TABLE3:
    HEX     90 AA D1 A2 D5 A8 85 A8 C5 A2 D4 A2 95 82
TABLE4:
    HEX     90 82 91 A2 C5 A8 80 88 C5 A2 94 A0 90 82
TABLE5:
    HEX     90 82 90 A2 C4 A8 80 88 C5 A2 94 A0 90 82
TABLE6:
    HEX     90 82 90 A2 C4 A8 81 88 C4 A2 D4 A0 95 82
TABLE7:
    HEX     90 A2 D1 A2 C4 88 80 88 C4 A2 84 A0 85 82
TABLE8:
    HEX     90 82 91 A2 C4 88 80 88 C4 AA 84 A0 85 82
TABLE9:
    HEX     90 82 91 A2 C4 88 80 88 C4 8A 84 A0 91 82
TABLE10:
    HEX     90 AA 91 A2 C4 A8 85 A8 85 82 D4 A2 91 82

    ORG    $8CCF
ADDRESS_TABLE:
    WORD    TABLE0-14
    WORD    TABLE1-14
    WORD    TABLE2-14
    WORD    TABLE3-14
    WORD    TABLE4-14
    WORD    TABLE5-14
    WORD    TABLE6-14
    WORD    TABLE7-14
    WORD    TABLE8-14
    WORD    TABLE9-14
    WORD    TABLE10-14
    ORG    $8CE5
SHOW_ANIM_LINE:
    SUBROUTINE

    PLA
    STA     TMP_PTR
    PLA
    STA     TMP_PTR+1           ; store "return" addr

    ; Fill 14 rows of pixel data from row 0x51 (81) through 0x5E (94).
    LDY     #$50
    STY     GAME_ROWNUM
    BNE     .next      ; unconditional

.loop:
    JSR     ROW_TO_ADDR
    LDY     #$00
    LDA     (TMP_PTR),Y
    ASL
    LDA     ADDRESS_TABLE,X
    STA     .loop2+1
    LDA     ADDRESS_TABLE+1,X   ; groups of 14 bytes
    STA     .loop2+2
    LDY     #$0D

    ; Copy 13 bytes of pixel data onto screen from
    ; addr+14 to addr+26
.loop2:
    LDA     $8D08,Y             ; fixed up from above
    STA     (ROW_ADDR),Y        ; pixel data
    INY
    CPY     #$1B
    BCC     .loop2              ; Y < 27

    ; Next row
.next:
    JSR     INCREMENT_TMP_PTR
    INC     GAME_ROWNUM
    LDY     GAME_ROWNUM
    CPY     #$5F
    BCC     .loop

    LDX     ANIM_COUNT
    LDY     #$FF
.delay:
    DEY
    BNE     .delay
    DEX
    BNE     .delay
    INC     ANIM_COUNT

    LDA     INPUT_MODE
    CMP     KEYBOARD_MODE
    BEQ     .check_for_keypress
    LDA     BUTN1
    BMI     .input_detected
    LDA     BUTN0
    BMI     .input_detected

.check_for_keypress:
    LDA     KBD
    BMI     .input_detected
    RTS

    ; Skip the rest of the big animation.
.input_detected:
    PLA
    PLA
    SEC
    LDA     KBD
    STA     KBDSTRB
    RTS

ANIM_COUNT:
    HEX     9D

    ORG    $8D4C
INCREMENT_TMP_PTR:
    SUBROUTINE

    INC     TMP_PTR
    BNE     .end
    INC     TMP_PTR+1
.end:
    RTS


    ; Editor routines

    ORG    $8E50
DEFAULT_INDIRECT_TARGET:
    SUBROUTINE
    JMP     DISABLE_INTS_CALL_RWTS

    ORG    $A200
PIXEL_SHIFT_TABLE:
    INCLUDE "pixel_shift_table.asm"
    ORG    $A900
PIXEL_PATTERN_TABLE:
    INCLUDE "pixel_pattern_table.asm"
    ORG    $AD00
SPRITE_DATA:
    INCLUDE "sprite_data.asm"
