;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_c_from_polar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_cfmul
	.globl _cvu_fcos
	.globl _cvu_fsin
	.globl _cvu_c_from_polar
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
;src/cvu_c_from_polar.c:3: void cvu_c_from_polar(struct cvu_c *c, cvu_f phi, cvu_f d)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_c_from_polar
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_c_from_polar::
	call	___sdcc_enter_ix
;src/cvu_c_from_polar.c:5: c->r = cvu_fcos(phi);
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genIpush
	push	bc
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genCall
	call	_cvu_fcos
	pop	af
;	genMove_o
; peephole 156 used ex to load hl into de.
	ex	de,hl
;	genMove_o
	pop	bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_c_from_polar.c:6: c->i = cvu_fsin(phi);
;	genPlus
;fetchPairLong
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;	genIpush
	push	hl
	push	bc
;	AOP_STK for 
;fetchPairLong
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	push	de
;	genCall
	call	_cvu_fsin
	pop	af
;	genMove_o
; peephole 156 used ex to load hl into de.
	ex	de,hl
;	genMove_o
	pop	bc
	pop	hl
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_c_from_polar.c:7: if(d != CVU_I2F(1))
;	genCmpEq
;	AOP_STK for 
	ld	a, 8 (ix)
	sub	a, #0x40
	or	a, 9 (ix)
	jr	Z,00103$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00110$.
;src/cvu_c_from_polar.c:8: cvu_cfmul(c, d);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_cvu_cfmul
	pop	af
	pop	af
;	genLabel
00103$:
;src/cvu_c_from_polar.c:9: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
