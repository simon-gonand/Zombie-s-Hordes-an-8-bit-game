;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_spint_handler
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_spint_handler
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
;src/cv_set_spint_handler.c:5: void cv_set_spint_handler(void (*handler)(uint_fast8_t, uint_fast8_t))
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_spint_handler
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_spint_handler::
;src/cv_set_spint_handler.c:9: __endasm;
;	genInline
;	genInline
	di
;src/cv_set_spint_handler.c:10: cv_spint_handler = handler;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genAssign
	ld	(_cv_spint_handler), bc
;src/cv_set_spint_handler.c:11: if(handler)
;	genIfx
	ld	a, b
	or	a, c
	ret	Z
; peephole 161 replaced jump by return.
;src/cv_set_spint_handler.c:15: __endasm;
;	genInline
;	genInline
	ei
;	genLabel
; peephole 158 removed unused label 00103$.
;src/cv_set_spint_handler.c:17: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
