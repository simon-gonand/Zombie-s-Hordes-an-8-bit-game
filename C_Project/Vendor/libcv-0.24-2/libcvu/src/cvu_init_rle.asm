;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_init_rle
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_init_rle
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
;src/cvu_init_rle.c:3: void cvu_init_rle(struct cvu_rle_state *restrict state, uint8_t (* input)(void), uint8_t escape)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_init_rle
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_init_rle::
;src/cvu_init_rle.c:5: state->input = input;
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
;src/cvu_init_rle.c:6: state->escape = escape;
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
;src/cvu_init_rle.c:7: state->left = 0;
;	genPlus
	inc	bc
	inc	bc
	inc	bc
	ld	a, b
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, a
	ld	(hl), #0x00
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_init_rle.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
