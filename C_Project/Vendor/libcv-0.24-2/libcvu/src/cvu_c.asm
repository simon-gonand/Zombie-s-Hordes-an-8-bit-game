;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_c
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_fmul2
	.globl _cvu_cdot
	.globl _cvu_cfmul
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
;src/cvu_c.c:3: cvu_f cvu_cdot(const struct cvu_c *l)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_cdot
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_cdot::
	call	___sdcc_enter_ix
;src/cvu_c.c:5: return(cvu_fmul2(l->r, l->r) + cvu_fmul2(l->i, l->i));
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
;	genIpush
	push	hl
	push	bc
;	genIpush
	push	bc
;	genCall
	call	_cvu_fmul2
	pop	af
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
;	genIpush
	push	bc
	push	de
;	genIpush
	push	de
;	genCall
	call	_cvu_fmul2
	pop	af
	pop	af
;	genMove_o
;	genMove_o
	pop	bc
;	genPlus
	add	hl, bc
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_c.c:6: }
;	genEndFunction
	pop	ix
	ret
;src/cvu_c.c:8: void cvu_cfmul(struct cvu_c *l, cvu_f r)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_cfmul
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_cfmul::
;src/cvu_c.c:10: l->r = cvu_fmul2(l->r, r);
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	dec	hl
;	genIpush
	push	hl
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 63 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
;	genIpush
	push	bc
;	genCall
	call	_cvu_fmul2
	pop	af
	pop	af
;	genMove_o
	ld	c, l
	ld	b, h
;	genMove_o
	pop	hl
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_c.c:11: l->i = cvu_fmul2(l->i, r);
;	genPlus
; peephole 155a removed inc hl / dec hl pair.
	inc	hl
;	genPointerGet
;fetchPairLong
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
	dec	hl
;	genIpush
	push	hl
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 63 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
;	genIpush
	push	bc
;	genCall
	call	_cvu_fmul2
	pop	af
	pop	af
;	genMove_o
	ld	c, l
	ld	b, h
;	genMove_o
	pop	hl
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_c.c:12: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
