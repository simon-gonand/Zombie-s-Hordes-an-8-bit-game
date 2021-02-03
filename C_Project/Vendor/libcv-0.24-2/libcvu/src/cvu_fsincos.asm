;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_fsincos
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_fsintable
	.globl _cvu_fsin
	.globl _cvu_fcos
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
;src/cvu_fsincos.c:24: cvu_f cvu_fsin(cvu_f x)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fsin
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_fsin::
	call	___sdcc_enter_ix
;src/cvu_fsincos.c:29: if(x < 0)
;	genCast
;	AOP_STK for 
;fetchPairLong
; peephole 8 removed dead load from 4 (ix) into c.
	ld	b, 5 (ix)
;	genCmpLt
	bit	7, b
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fsincos.c:31: x = -x;
;	genUminus
;	AOP_STK for 
	xor	a, a
	sub	a, 4 (ix)
	ld	4 (ix), a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	5 (ix), a
;src/cvu_fsincos.c:32: neg = true;
;	genAssign
;	genMove_o
	ld	c, #0x01
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;src/cvu_fsincos.c:35: neg = false;
;	genAssign
;	genMove_o
	ld	c, #0x00
;src/cvu_fsincos.c:37: while(x >= CVU_F_PI)
;	genLabel
00104$:
;	genCast
;	AOP_STK for 
;	genMove_o
	ld	b, 4 (ix)
	ld	e, 5 (ix)
;	genMove_o
;	genCmpLt
	ld	a, b
	sub	a, #0xc9
	ld	a, e
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00106$
; peephole 165 changed absolute to relative conditional jump.
;src/cvu_fsincos.c:39: x -= CVU_F_PI;
;	genMinus
	ld	a, b
	add	a, #0x37
	ld	b, a
	ld	a, e
	adc	a, #0xff
	ld	e, a
;	genCast
;	AOP_STK for 
;	genMove_o
	ld	4 (ix), b
	ld	5 (ix), e
;	genMove_o
;src/cvu_fsincos.c:40: neg = !neg;
;	genNot
	ld	a, c
	xor	a, #0x01
	ld	c, a
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00106$:
;src/cvu_fsincos.c:43: if(x < CVU_F_PI_2)
;	genCmpLt
	ld	a, b
	sub	a, #0x64
	ld	a, e
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00108$
; peephole 166 changed absolute to relative conditional jump.
;src/cvu_fsincos.c:44: ret = cvu_fsintable[x];
;	genAddrOf
	ld	de, #_cvu_fsintable+0
;	genPlus
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, de
;	genPointerGet
	ld	l, (hl)
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
	ld	h, #0x00
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00108$:
;src/cvu_fsincos.c:46: ret = cvu_fsintable[CVU_F_PI - x - 1];
;	genCast
;	AOP_STK for 
;	genMove_o
	ld	b, 4 (ix)
;	genMove_o
;	genMinus
	ld	a, #0xc8
	sub	a, b
;	genCast
;	genMove_o
;	genMove_o
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #_cvu_fsintable
	add	hl, de
;	genPointerGet
	ld	l, (hl)
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
	ld	h, #0x00
;	genLabel
00109$:
;src/cvu_fsincos.c:48: if(neg)
;	genIfx
	bit	0, c
	jr	Z,00111$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_fsincos.c:49: ret = -ret;
;	genUminus
	xor	a, a
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
;	genLabel
00111$:
;src/cvu_fsincos.c:51: return(ret);
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00112$.
;src/cvu_fsincos.c:52: }
;	genEndFunction
	pop	ix
	ret
_cvu_fsintable:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
;src/cvu_fsincos.c:54: cvu_f cvu_fcos(cvu_f x)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_fcos
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_fcos::
;src/cvu_fsincos.c:56: return(cvu_fsin(x + CVU_F_PI_2));
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0064
	add	hl, bc
;	genCast
;	(locations are the same)
;	genIpush
	push	hl
;	genCall
	call	_cvu_fsin
	pop	af
;	genMove_o
;	genMove_o
;	genRet
;fetchPairLong
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_fsincos.c:57: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
