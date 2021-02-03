;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_left_column_blank
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_left_column_blank
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
;src/cv_set_left_column_blank.c:7: void cv_set_left_column_blank(bool status)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_left_column_blank
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_set_left_column_blank::
	call	___sdcc_enter_ix
;src/cv_set_left_column_blank.c:9: cv_vdpout(0x0, cv_vdpreg[0] = (status ? 0x20 : 0x0) | (cv_vdpreg[0] & ~0x20));
;	genIfx
;	AOP_STK for 
	bit	0, 4 (ix)
	jr	Z,00103$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0020
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genLabel
00104$:
;	genPointerGet
	ld	a, (#_cv_vdpreg + 0)
;	genAnd
	res	5, a
;	genCast
;	genMove_o
;	genMove_o
;	genOr
	or	a, c
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	(#_cv_vdpreg),a
; peephole 19 loaded (#_cv_vdpreg) from a directly instead of using hl.
;	genIpush
	push	af
	inc	sp
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_left_column_blank.c:10: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
