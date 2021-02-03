;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_fmul2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_s_16_16_mul
	.globl __u_16_16_mul
	.globl _cvu_fmul2
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
;src/cvu_fmul2.c:24: int32_t cvu_s_16_16_mul(int16_t l_arg, int16_t r_arg)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_s_16_16_mul
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 1 bytes.
_cvu_s_16_16_mul::
	call	___sdcc_enter_ix
	dec	sp
;src/cvu_fmul2.c:26: bool neg = false;
;	genAssign
;	AOP_STK for _cvu_s_16_16_mul_sloc0_1_0
;	genMove_o
	xor	a, a
	ld	-1 (ix), a
;src/cvu_fmul2.c:28: register int16_t l = l_arg;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;src/cvu_fmul2.c:29: register int16_t r = r_arg;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 6 (ix)
	ld	d, 7 (ix)
;src/cvu_fmul2.c:31: if(l < 0)
;	genCast
;fetchPairLong
; peephole 1 removed dead load from c into l.
	ld	h, b
;	genCmpLt
	bit	7, h
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fmul2.c:33: neg = !neg;
;	genAssign
;	AOP_STK for _cvu_s_16_16_mul_sloc0_1_0
;	genMove_o
	ld	-1 (ix), #0x01
;src/cvu_fmul2.c:34: l = -l;
;	genUminus
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
;	genLabel
00102$:
;src/cvu_fmul2.c:36: if(r < 0)
;	genCast
;fetchPairLong
; peephole 1 removed dead load from e into l.
	ld	h, d
;	genCmpLt
	bit	7, h
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fmul2.c:38: neg = !neg;
;	genNot
;	AOP_STK for _cvu_s_16_16_mul_sloc0_1_0
	ld	a, -1 (ix)
	xor	a, #0x01
	ld	-1 (ix), a
;src/cvu_fmul2.c:39: r = -r;
;	genUminus
	xor	a, a
	sub	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
;	genLabel
00104$:
;src/cvu_fmul2.c:42: ret = _u_16_16_mul(l, r);
;	genIpush
	push	de
;	genIpush
	push	bc
;	genCall
	call	__u_16_16_mul
	pop	af
	pop	af
;	genMove_o
;	genMove_o
;	genAssign
;	(locations are the same)
;src/cvu_fmul2.c:44: if(neg)
;	genIfx
;	AOP_STK for _cvu_s_16_16_mul_sloc0_1_0
	bit	0, -1 (ix)
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fmul2.c:45: ret = -ret;
;	genUminus
	xor	a, a
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	ld	a, #0x00
	sbc	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
;	genLabel
00106$:
;src/cvu_fmul2.c:47: return(ret);
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00107$.
;src/cvu_fmul2.c:48: }
;	genEndFunction
	inc	sp
	pop	ix
	ret
;src/cvu_fmul2.c:50: cvu_f cvu_fmul2(cvu_f l, cvu_f r)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fmul2
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_fmul2::
	call	___sdcc_enter_ix
;src/cvu_fmul2.c:53: tmp = cvu_s_16_16_mul(l, r);//(int32_t)l * r;
;	genIpush
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
	call	_cvu_s_16_16_mul
	pop	af
	pop	af
;	genMove_o
;	genMove_o
;	genAssign
;	(locations are the same)
;src/cvu_fmul2.c:54: return(tmp >> CVU_F_R);
;	genRightShift
	ld	b, #0x06
00103$:
	sra	d
	rr	e
	rr	h
	rr	l
; peephole 158 removed unused label 00104$.
	djnz	00103$
;	genCast
;fetchPairLong
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_fmul2.c:55: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
