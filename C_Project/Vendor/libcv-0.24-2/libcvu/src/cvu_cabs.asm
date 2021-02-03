;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_cabs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
	.globl _cvu_cabs
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
;src/cvu_cabs.c:5: cvu_f cvu_cabs(const struct cvu_c *l)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_cabs
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_cabs::
	call	___sdcc_enter_ix
;src/cvu_cabs.c:7: return(abs(l->r) + abs(l->i));
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	dec	hl
;	genCast
;	(locations are the same)
;	genIpush
	push	hl
	push	bc
;	genCall
	call	_abs
	pop	af
;	genMove_o
	ld	c, l
	ld	b, h
;	genMove_o
	pop	hl
;	genAssign
;	(locations are the same)
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genCast
;	(locations are the same)
;	genIpush
	push	de
;	genCall
	call	_abs
	pop	af
;	genMove_o
;	genMove_o
;	genPlus
	add	hl, bc
;	genCast
;	(locations are the same)
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_cabs.c:8: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
