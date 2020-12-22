FNAME "ZombiesHordesColeco.ROM"
cpu z80

include "Vendor/ColecoVision/Coleco-Include.ASM"

; Set ROM header
           ORG        8000h
           
;** CARTRIDGE SOFTWARE POINTERS 8000H **
;        --------------------------------------------

           DB       0AAh,055h       ;Cartridge present:  Colecovision logo
;          DB       055h,0AAh       ;Cartridge present:  skip logo, Colecovision logo
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



;**************************************************************************************************
; Sound settings
;**************************************************************************************************
SoundDataCount:	  EQU	7
Len_SoundDataArea: EQU	10*SoundDataCount+1	;7 data areas
SoundAddrs:
	DW	bounce,SoundDataArea     ; 1  ball bounce sound
	DW  0,0

; Sound Data area - 7 songs
SoundDataArea: DS Len_SoundDataArea