;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_init_huffman
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_init_huffman
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
;src/cvu_init_huffman.c:3: void cvu_init_huffman(struct cvu_huffman_state *restrict state, uint8_t (* input)(void), const struct cvu_huffman_node *restrict tree, uint8_t root, uint8_t ls, uint8_t bs, uint8_t rs)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_init_huffman
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_init_huffman::
	call	___sdcc_enter_ix
;src/cvu_init_huffman.c:5: state->input = input;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, 6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/cvu_init_huffman.c:6: state->nodes = tree;
;	genPlus
;fetchPairLong
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 8 (ix)
	ld	(de), a
	inc	de
	ld	a, 9 (ix)
	ld	(de), a
;src/cvu_init_huffman.c:7: state->root = root;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0004
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	a, 10 (ix)
	ld	(hl), a
;src/cvu_init_huffman.c:8: state->ls = ls;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0005
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	a, 11 (ix)
	ld	(hl), a
;src/cvu_init_huffman.c:9: state->bs = bs;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	a, 12 (ix)
	ld	(hl), a
;src/cvu_init_huffman.c:10: state->rs = rs;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0007
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	a, 13 (ix)
	ld	(hl), a
;src/cvu_init_huffman.c:11: state->bit = 8;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0008
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), #0x08
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_init_huffman.c:15: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
