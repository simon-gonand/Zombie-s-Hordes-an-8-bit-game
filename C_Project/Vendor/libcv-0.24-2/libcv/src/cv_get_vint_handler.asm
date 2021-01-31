;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_vint_handler
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_vint_handler
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
;src/cv_get_vint_handler.c:5: void *cv_get_vint_handler(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_vint_handler
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_get_vint_handler::
;src/cv_get_vint_handler.c:7: return(cv_vint_handler);
;	genCast
;fetchPairLong
	ld	hl, (_cv_vint_handler)
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_vint_handler.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
