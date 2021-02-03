;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_fatan
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
	.globl _cvu_fdiv2
	.globl _cvu_fmul2
	.globl _cvu_fatan2
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
;src/cvu_fatan.c:8: static cvu_f cvu_fatan_approx1(cvu_f x)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fatan_approx1
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_fatan_approx1:
;src/cvu_fatan.c:10: return(x - cvu_fmul2(CVU_I2F(2) / 9, cvu_fmul2(x, cvu_fmul2(x, x))));
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_cvu_fmul2
	pop	af
;	genMove_o
;	genMove_o
;	genIpush
; peephole 142 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_cvu_fmul2
	pop	af
;	genMove_o
;	genMove_o
;	genIpush
; peephole 142 used ex to move hl onto the stack.
	ex	(sp),hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000e
	push	hl
;	genCall
	call	_cvu_fmul2
	pop	af
	pop	af
;	genMove_o
	ld	c, l
	ld	b, h
;	genMove_o
;	genMinus
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, c
	ld	c, a
	ld	a, 1 (iy)
	sbc	a, b
	ld	b, a
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_fatan.c:11: }
;	genEndFunction
	ret
;src/cvu_fatan.c:13: cvu_f cvu_fatan2(cvu_f y, cvu_f x)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fatan2
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 2 bytes.
_cvu_fatan2::
	call	___sdcc_enter_ix
	push	af
;src/cvu_fatan.c:17: if(abs(y) <= abs(x))
;	genCast
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genIpush
	push	bc
;	genCall
;	AOP_STK for _cvu_fatan2_sloc0_1_0
	call	_abs
	pop	af
;	genMove_o
	ld	-2 (ix), l
	ld	-1 (ix), h
;	genMove_o
;	genCast
;	AOP_STK for 
;fetchPairLong
	ld	e, 6 (ix)
	ld	d, 7 (ix)
;	genIpush
	push	de
	push	de
;	genCall
	call	_abs
	pop	af
;	genMove_o
;	genMove_o
	pop	de
;src/cvu_fatan.c:20: tmp = (((x < 0)^(y < 0)) ? -CVU_F_PI_2 : CVU_F_PI_2) - cvu_fatan_approx1(cvu_fdiv2(x, y));
;	genCmpLt
	ld	a, d
	rlca
	and	a,#0x01
; peephole 109 replaced zero load, rla by and since rlca writes the same value to carry bit and least significant bit.
	ld	e, a
;	genMove_o
;	genCmpLt
	ld	a, b
	rlca
	and	a,#0x01
; peephole 109 replaced zero load, rla by and since rlca writes the same value to carry bit and least significant bit.
	ld	d, a
;	genMove_o
;src/cvu_fatan.c:17: if(abs(y) <= abs(x))
;	genCmpGt
;	AOP_STK for _cvu_fatan2_sloc0_1_0
	ld	a, l
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jp	PO, 00133$
	xor	a, #0x80
00133$:
	jp	M, 00102$
;src/cvu_fatan.c:18: tmp = cvu_fatan_approx1(cvu_fdiv2(y, x));
;	genIpush
	push	de
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_cvu_fdiv2
	pop	af
;	genMove_o
;	genMove_o
;	genIpush
; peephole 50 eleminated dead pop/push pair.
; peephole 142 used ex to move hl onto the stack.
	ex	(sp),hl
;	genCall
	call	_cvu_fatan_approx1
	pop	af
;	genMove_o
;	genMove_o
	pop	de
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;	genGoto
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;src/cvu_fatan.c:20: tmp = (((x < 0)^(y < 0)) ? -CVU_F_PI_2 : CVU_F_PI_2) - cvu_fatan_approx1(cvu_fdiv2(x, y));
;	genXor
	ld	a, e
;	genIfx
	xor	a,d
; peephole 101 removed redundant or after xor.
	jr	Z,00111$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0xff9c
;	genGoto
	jr	00112$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00111$:
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0064
;	genLabel
00112$:
;	genIpush
	push	bc
	push	de
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
;	genCall
	call	_cvu_fdiv2
	pop	af
;	genMove_o
;	genMove_o
;	genIpush
; peephole 50 eleminated dead pop/push pair.
; peephole 50 eleminated dead pop/push pair.
; peephole 142 used ex to move hl onto the stack.
	ex	(sp),hl
;	genCall
	call	_cvu_fatan_approx1
	pop	af
;	genMove_o
;	genMove_o
	pop	de
	pop	bc
;	genCast
;	(locations are the same)
;	genMinus
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;	genAssign
;	(locations are the same)
;	genLabel
00103$:
;src/cvu_fatan.c:22: if(x < 0)
;	genIfx
	ld	a, e
	or	a, a
	jr	Z,00108$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fatan.c:25: tmp += CVU_F_PI;
;	genCast
;	(locations are the same)
;src/cvu_fatan.c:24: if(y >= 0)
;	genAssign
;	(locations are the same)
;	genIfx
	bit	0, d
	jr	NZ,00105$
; peephole 164 changed absolute to relative conditional jump.
;src/cvu_fatan.c:25: tmp += CVU_F_PI;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x00c9
	add	hl, bc
;	genCast
;fetchPairLong
	ld	c, l
	ld	b, h
;	genGoto
	jr	00108$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;src/cvu_fatan.c:27: tmp -= CVU_F_PI;
;	genMinus
	ld	a, c
	add	a, #0x37
	ld	c, a
	ld	a, b
	adc	a, #0xff
;	genCast
;fetchPairLong
	ld	b, a
;	genLabel
00108$:
;src/cvu_fatan.c:30: return(tmp);
;	genRet
;fetchPairLong
	ld	l, c
	ld	h, b
;	genLabel
; peephole 158 removed unused label 00109$.
;src/cvu_fatan.c:31: }
;	genEndFunction
	pop	af
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
