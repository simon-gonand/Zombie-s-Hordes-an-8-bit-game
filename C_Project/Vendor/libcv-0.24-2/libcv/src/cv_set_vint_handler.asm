;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_vint_handler
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_vint_handler
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
;src/cv_set_vint_handler.c:5: void cv_set_vint_handler(void (*handler)(void))
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_vint_handler
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_vint_handler::
;src/cv_set_vint_handler.c:9: __endasm;
;	genInline
;	genInline
	di
;src/cv_set_vint_handler.c:10: cv_vint_handler = handler;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	de, #_cv_vint_handler
	ld	hl, #2
	add	hl, sp
	ldi
	ldi
;src/cv_set_vint_handler.c:13: __endasm;
;	genInline
;	genInline
	ei
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_vint_handler.c:14: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
