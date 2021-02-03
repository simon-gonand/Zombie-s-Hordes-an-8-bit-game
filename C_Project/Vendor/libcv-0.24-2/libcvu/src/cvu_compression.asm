;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_compression
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __read_from_array
	.globl _cvu_get_rle
	.globl _cvu_init_rle
	.globl _cvu_get_huffman
	.globl _cvu_init_huffman
	.globl _cv_set_write_vram_address
	.globl __common_state
	.globl _cvu_init_compression
	.globl _cvu_get_compression
	.globl _cvu_memtovmemcpy_compression
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_cv_graphics_port	=	0x00be
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__common_state::
	.ds 2
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
;src/cvu_compression.c:29: static uint8_t read_from_huffman(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function read_from_huffman
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_read_from_huffman:
;src/cvu_compression.c:31: return(cvu_get_huffman(&_common_state->huffman));
;	genAssign
;fetchPairLong
	ld	hl, (__common_state)
;	genIpush
	push	hl
;	genCall
	call	_cvu_get_huffman
	pop	af
;	genMove_o
;	genMove_o
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_compression.c:32: }
;	genEndFunction
	ret
;src/cvu_compression.c:34: void cvu_init_compression(const uint8_t *restrict data, struct cvu_compression_state *restrict state, const struct cvu_huffman_node *restrict tree, uint8_t root, uint8_t ls, uint8_t bs, uint8_t rs, uint8_t escape)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_init_compression
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_init_compression::
	call	___sdcc_enter_ix
;src/cvu_compression.c:36: state->data = data;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 6 (ix)
	ld	b, 7 (ix)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000f
	add	hl, bc
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
;fetchPairLong
	ld	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;src/cvu_compression.c:37: cvu_init_huffman(&state->huffman, &_read_from_array, tree, root, ls, bs, rs);
;	genIpush
	push	bc
;	AOP_STK for 
;	genIpush
;	AOP_STK for 
; peephole 47 pushed 13 (ix), 12 (ix) through hl instead of af.
	ld	h, 13 (ix)
	ld	l, 12 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;	genIpush
;	AOP_STK for 
; peephole 47 pushed 11 (ix), 10 (ix) through hl instead of af.
	ld	h, 11 (ix)
	ld	l, 10 (ix)
	push	hl
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #__read_from_array
	push	hl
;	genIpush
	push	bc
;	genCall
	call	_cvu_init_huffman
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/cvu_compression.c:38: cvu_init_rle(&state->rle, &read_from_huffman, escape);
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000a
	add	hl, bc
	ex	de, hl
;	genIpush
;	AOP_STK for 
	ld	a, 14 (ix)
	push	af
	inc	sp
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_read_from_huffman
	push	hl
;	genIpush
	push	de
;	genCall
	call	_cvu_init_rle
	pop	af
	pop	af
	inc	sp
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_compression.c:39: }
;	genEndFunction
	pop	ix
	ret
;src/cvu_compression.c:41: uint8_t cvu_get_compression(struct cvu_compression_state *state)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_get_compression
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_get_compression::
;src/cvu_compression.c:43: _common_state = state;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	de, #__common_state
	ld	hl, #2
	add	hl, sp
	ldi
	ldi
;src/cvu_compression.c:44: return(cvu_get_rle(&_common_state->rle));
;	genAssign
;fetchPairLong
	ld	hl, (__common_state)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	bc, #0x000a
	add	hl, bc
;	genIpush
	push	hl
;	genCall
	call	_cvu_get_rle
	pop	af
;	genMove_o
;	genMove_o
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_compression.c:45: }
;	genEndFunction
	ret
;src/cvu_compression.c:47: void cvu_memtovmemcpy_compression(cv_vmemp dest, struct cvu_compression_state *state, size_t n)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_memtovmemcpy_compression
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_memtovmemcpy_compression::
	call	___sdcc_enter_ix
;src/cvu_compression.c:49: _common_state = state;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(__common_state), hl
;src/cvu_compression.c:50: cv_set_write_vram_address(dest);
;	genIpush
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
;	genCall
	call	_cv_set_write_vram_address
	pop	af
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 8 (ix)
	ld	b, 9 (ix)
;	genLabel
00104$:
;src/cvu_compression.c:51: for(;n > 0; n--)
;	genIfx
	ld	a, b
	or	a, c
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_compression.c:52: cv_voutb(cvu_get_rle(&_common_state->rle));
;	genAssign
;fetchPairLong
	ld	hl, (__common_state)
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	de, #0x000a
	add	hl, de
;	genIpush
	push	bc
	push	hl
;	genCall
	call	_cvu_get_rle
	pop	af
;	genMove_o
	ld	a, l
;	genMove_o
	pop	bc
;	genAssign
;	(locations are the same)
;../libcv/include/cv_graphics.h:218: __endasm;
;	genInline
;	genInline
	cp	a, (hl)
	cp	a, (hl)
	nop
;../libcv/include/cv_graphics.h:219: cv_graphics_port = value;
;	genAssign
	out	(_cv_graphics_port), a
;src/cvu_compression.c:51: for(;n > 0; n--)
;	genMinus
	dec	bc
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00106$:
;src/cvu_compression.c:53: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
