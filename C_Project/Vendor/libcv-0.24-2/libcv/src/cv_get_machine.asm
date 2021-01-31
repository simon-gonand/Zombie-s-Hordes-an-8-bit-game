;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_machine
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_machine
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_cv_graphics_port	=	0x00be
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/cv_get_machine.c:5: enum cv_machine cv_get_machine(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_machine
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_get_machine::
;src/cv_get_machine.c:7: return(cv_machine_config >> 6);
;	genRightShift
;fetchLitPair
; peephole 16 loaded _cv_machine_config into a directly instead of going through iy.
	ld	a,(#_cv_machine_config + 0)
	rlca
	rlca
	and	a, #0x03
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_machine.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
