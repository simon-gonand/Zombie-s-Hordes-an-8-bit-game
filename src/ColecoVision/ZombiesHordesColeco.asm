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