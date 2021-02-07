FNAME "ZombiesHordesColeco.ROM"
cpu z80

include "Vendor/ColecoVision/Coleco-Include.ASM"

SPRITECOUNT: EQU 11
PATSIZE: EQU 71

; Set ROM header
           ORG        8000h

;** CARTRIDGE SOFTWARE POINTERS 8000H **
;        --------------------------------------------

;           DB       0AAh,055h       ;Cartridge present:  Colecovision logo
          DB       055h,0AAh       ;Cartridge present:  skip logo, Colecovision logo
           DW       0000           ;Pointer to the sprite name table
           DW       0000           ;Pointer to the sprite order table
           DW       0000           ;Pointer to the working buffer for WR_SPR_NM_TBL
           DW       CONTROLLER_BUFFER ;Pointer to the hand controller input areas
           DW       START      ;Entry point to the user program

;****************************************************************

rst_8:
       reti
       nop
rst_10:
       reti
       nop
rst_18:
       JP	RAND_GEN
rst_20:
       reti
       nop
rst_28:
       reti
       nop
rst_30:
       reti
       nop
rst_38:
       reti
       nop

       jp NMI

       db "ZOMBIE'S HORDES /SIMON'S PRESENTS/2021"
        
START:
; set stack pointer
    LD SP,StackTop	;128 bytes in length at 737fh
        
; Initialise sound
    LD B,SoundDataCount	;Max number of active voices+effects
    LD HL,SoundAddrs
    CALL SOUND_INIT
	
; initialise clock
    LD HL,TIMER_TABLE
    LD DE,TIMER_DATA_BLOCK
    CALL INIT_TIMER

; Set screen mode 2,2
    CALL SET_SCREEN_MODE_2_2

;Enable both joysticks, buttons, keypads
    LD HL,09b9bh
    LD (CONTROLLER_BUFFER),HL

; Set a fixed number to generate a seed number
    LD HL, 1982
    CALL SEED_RANDOM

;Enable timers
    CALL CREATE_TIMERS

NGAME:
    CALL DISABLE_NMI
    CALL CLEARPAT
    
    ; Send the sprite definitions to the VDP
    LD HL, VRAM_SPRGEN ; Addr of the sprite generation in the Virtual RAM
    LD DE, ZOMBIE_FRONT
    LD BC,32*SPRITECOUNT
    CALL LDIRVM
    
    CALL LOAD_CHR_SET
    
    ; now setup the title screen layout
    LD HL,VRAM_NAME
    LD DE,SL_MAP01
    LD BC,24*32
    CALL LDIRVM

MAIN_SCREEN:
    CALL DISABLE_NMI
    ; Clear screen from sprites and set write sprite position in Virtual RAM
    CALL CLEARSPRITES
    CALL SPRWRT

    ; SPAWN ZOMBIE SPRITE
    ; Set y position
    LD A, 120
    LD (SPRTBL), A
    LD (SPRTBL + 4), A ; The sprites has two colors, it is in reality two sprites that are superimposed on each other
    ; Set x position
    LD A, 120
    LD (SPRTBL + 1), A
    LD (SPRTBL + 5), A
    
    XOR A ; Reset A to 0
    
    ; Set pattern
    LD (SPRTBL + 2), A
    LD A, 4
    LD (SPRTBL + 6), A
    
    ; Set colour
    LD A, 0Ch
    LD (SPRTBL + 3), A
    LD A, 01h
    LD (SPRTBL + 7), A

    ; SPAWN PLAYER SPRITE
    ; Set y position
    LD A, 80
    LD (SPRTBL + 8), A
    LD (SPRTBL + 12), A ; The sprites has two colors, it is in reality two sprites that are superimposed on each other
    ; Set x position
    LD A, 120
    LD (SPRTBL + 9), A
    LD (SPRTBL + 13), A

    ; Set pattern
    LD A, 32
    LD (SPRTBL + 10), A
    LD A, 36
    LD (SPRTBL + 14), A
    
    ; Set colour
    LD A, 04h
    LD (SPRTBL + 11), A
    LD A, 0Bh
    LD (SPRTBL + 15), A

    LD HL, VDU_WRITES
    CALL SET_VDU_HOOK
    CALL ENABLE_NMI
    
    ; Main game logic loop
MLOOP:
    ; check that a base tick has occurred
    ; ensures consistent movement speed between 50 & 60Hz systems
	LD	A,(TickTimer)
	CALL	TEST_SIGNAL
	OR	A
	JR Z,MLOOP2
    ; once per tick

MLOOP2:
    LD A,(QtrSecTimer)
    CALL TEST_SIGNAL
    OR A
    JR Z,MLOOP

    JR MLOOP

; Load the character set, make all three sections the same
LOAD_CHR_SET:
    LD HL,0
SLOOP:
    ; Load the character set
    LD DE,TILESET_1_PAT
    PUSH HL
    LD BC,PATSIZE*8
    CALL LDIRVM
    POP HL
    ; Now load colour attributes
    PUSH HL
    LD BC,VRAM_COLOR
    ADD HL,BC
    LD DE,TILESET_1_COL
    LD BC,PATSIZE*8
    CALL LDIRVM
    POP HL
    LD BC,800h
    ADD HL,BC
    LD A,H
    CP 18h
    JR C,SLOOP
    RET

; This is our routine called every VDP interrupt during normal game play
; - Do all VDP writes here to avoid corruption
VDU_WRITES:
    RET

; This is our routine called every VDP interrupt during the title screen
; - Do all VDP writes here to avoid corruption
OUTPUT_VDP_TITLE:
    RET

include "resources/Sprites.asm"

;**************************************************************************************************
; Sound and music data area
;**************************************************************************************************

; Bounce
bounce:
    DB 081h, 054h, 010h, 002h, 023h, 007h
    DB $90  ; end
    DW 0000h
;**************************************************************************************************
; Sound settings
;**************************************************************************************************
SoundDataCount:	  EQU	7
Len_SoundDataArea: EQU	10*SoundDataCount+1	;7 data areas
SoundAddrs:
	DW	bounce,SoundDataArea     ; 1  ball bounce sound
	DW  0,0

include "src/ColecoVision/Librairies.asm"

; Sound Data area - 7 songs
SoundDataArea: DS Len_SoundDataArea