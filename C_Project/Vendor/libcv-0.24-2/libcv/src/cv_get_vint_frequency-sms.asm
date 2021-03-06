;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_vint_frequency
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_vint_frequency
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
;src/cv_get_vint_frequency.c:9: unsigned char cv_get_vint_frequency(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_vint_frequency
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_get_vint_frequency::
;src/cv_get_vint_frequency.c:14: return(cv_machine_config & 0x03f);
;	genAssign
;fetchLitPair
; peephole 16 loaded _cv_machine_config into a directly instead of going through iy.
	ld	a,(#_cv_machine_config + 0)
;	genAnd
	and	a, #0x3f
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_vint_frequency.c:16: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
