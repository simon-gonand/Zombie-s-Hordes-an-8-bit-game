;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_init_lzk
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_init_lzk
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
;src/cvu_init_lzk.c:5: void cvu_init_lzk(struct cvu_lzk_state *restrict state, uint8_t (* input)(void), uint8_t escape)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_init_lzk
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_init_lzk::
;src/cvu_init_lzk.c:7: state->input = input;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
;src/cvu_init_lzk.c:8: state->escape = escape;
;	genPlus
;fetchPairLong
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;	genAssign (pointer)
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 6, size 1
;	isBitvar = 0
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(de), a
;src/cvu_init_lzk.c:9: state->left = 0;
;	genPlus
;fetchPairLong
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;	genAssign (pointer)
;	isBitvar = 0
	xor	a, a
	ld	(de), a
;src/cvu_init_lzk.c:10: state->start = 0;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0005
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), #0x00
;src/cvu_init_lzk.c:11: memset(state->buffer, 0, 64);
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
;	genCast
;	(locations are the same)
;	genBuiltIn
;fetchPairLong
	ld	b, #0x40
00103$:
	ld	(hl), #0x00
	inc	hl
	djnz	00103$
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_init_lzk.c:12: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
