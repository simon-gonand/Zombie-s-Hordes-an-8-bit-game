;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_fdiv2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
	.globl _cvu_fdiv2
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
;src/cvu_fdiv2.c:21: cvu_f cvu_fdiv2(cvu_f l_arg, cvu_f r)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fdiv2
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_fdiv2::
;src/cvu_fdiv2.c:23: register cvu_f l = l_arg;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	de
	push	de
	push	bc
;src/cvu_fdiv2.c:26: for(shift = CVU_F_R; shift && abs(l) <= (INT16_MAX >> 1); shift--)
;	genAssign
;	genMove_o
	ld	b, #0x06
;	genLabel
00104$:
;	genIfx
	ld	a, b
	or	a, a
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
;	genCast
;fetchPairLong
	ld	l, e
	ld	h, d
;	genIpush
	push	de
	push	hl
;	genCall
	call	_abs
	pop	af
;	genMove_o
;	genMove_o
	pop	de
;	genCmpGt
	ld	a, #0xff
	cp	a, l
	ld	a, #0x3f
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	M, 00101$
;src/cvu_fdiv2.c:27: l <<= 1;
;	genLeftShift
;fetchPairLong
	sla	e
	rl	d
;src/cvu_fdiv2.c:26: for(shift = CVU_F_R; shift && abs(l) <= (INT16_MAX >> 1); shift--)
;	genMinus
	dec	b
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00101$:
;src/cvu_fdiv2.c:29: return((l / r) << shift);
;	genIpush
	push	bc
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genIpush
	push	de
;	genCall
	call	__divsint
	pop	af
	pop	af
;	genMove_o
;	genMove_o
	pop	bc
;	genLeftShift
	inc	b
	jr	00128$
; peephole 162 changed absolute to relative unconditional jump.
00127$:
	add	hl, hl
00128$:
	djnz	00127$
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00106$.
;src/cvu_fdiv2.c:30: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
