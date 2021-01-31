;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_memcpy_compression
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_get_rle
	.globl _cvu_memcpy_compression
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
;src/cvu_memcpy_compression.c:5: void *cvu_memcpy_compression(void *restrict dest, struct cvu_compression_state *state, size_t n)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_memcpy_compression
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 2 bytes.
_cvu_memcpy_compression::
	call	___sdcc_enter_ix
	push	af
;src/cvu_memcpy_compression.c:8: _common_state = state;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(__common_state), hl
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	e, 8 (ix)
	ld	d, 9 (ix)
;	genLabel
00103$:
;src/cvu_memcpy_compression.c:9: for(; n > 0; n--)
;	genIfx
	ld	a, d
	or	a, e
	jr	Z,00101$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_memcpy_compression.c:10: ((uint8_t *restrict)(dest))[i++] = cvu_get_rle(&_common_state->rle);
;	genCast
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
;	genPlus
;	AOP_STK for _cvu_memcpy_compression_sloc0_1_0
	add	hl, bc
	ex	(sp), hl
;	genPlus
	inc	bc
;	genAssign
;fetchPairLong
	ld	hl, (__common_state)
;	genPlus
	push	de
;fetchPairLong
;fetchLitPair
	ld	de, #0x000a
	add	hl, de
	pop	de
;	genIpush
	push	bc
	push	de
	push	hl
;	genCall
	call	_cvu_get_rle
	pop	af
;	genMove_o
	ld	a, l
;	genMove_o
	pop	de
	pop	bc
;	genAssign (pointer)
;	AOP_STK for _cvu_memcpy_compression_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), a
;src/cvu_memcpy_compression.c:9: for(; n > 0; n--)
;	genMinus
	dec	de
;	genGoto
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00101$:
;src/cvu_memcpy_compression.c:12: return(dest);
;	genRet
;	AOP_STK for 
;fetchPairLong
	ld	l, 4 (ix)
	ld	h, 5 (ix)
;	genLabel
; peephole 158 removed unused label 00105$.
;src/cvu_memcpy_compression.c:13: }
;	genEndFunction
	pop	af
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
