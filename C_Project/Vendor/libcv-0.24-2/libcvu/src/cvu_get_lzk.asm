;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_get_lzk
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_get_lzk
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
;src/cvu_get_lzk.c:19: static void ringbuffer_insert(struct cvu_lzk_state *state, const uint8_t c)
;	genLabel
;	genFunction
;	---------------------------------
; Function ringbuffer_insert
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 2 bytes.
_ringbuffer_insert:
	call	___sdcc_enter_ix
	push	af
;src/cvu_get_lzk.c:21: state->buffer[++(state->start)] = c;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genPlus
;	AOP_STK for _ringbuffer_insert_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
	ex	(sp), hl
;	genPlus
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;	genPointerGet
	ld	a, (bc)
;	genPlus
	ld	e, a
	inc	e
;	genAssign (pointer)
;	isBitvar = 0
	ld	a, e
	ld	(bc), a
;	genPlus
;	AOP_STK for _ringbuffer_insert_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
	ld	d, #0x00
	add	hl, de
;	genAssign (pointer)
;	AOP_STK for 
;	isBitvar = 0
	ld	a, 6 (ix)
	ld	(hl), a
;src/cvu_get_lzk.c:22: state->start %= 64;
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into d.
;	genAnd
	ld	a, e
	and	a, #0x3f
; peephole 1 removed dead load from #0x00 into d.
;	genCast
;	genMove_o
; peephole 9 loaded a from a directly instead of going through e.
;	genMove_o
;	genAssign (pointer)
;	isBitvar = 0
; peephole 9a loaded (bc) from a directly instead of going through a.
	ld	(bc), a
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_get_lzk.c:23: }
;	genEndFunction
	pop	af
	pop	ix
	ret
;src/cvu_get_lzk.c:25: static uint8_t ringbuffer_get(struct cvu_lzk_state *state)
;	genLabel
;	genFunction
;	---------------------------------
; Function ringbuffer_get
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 2 bytes.
_ringbuffer_get:
	call	___sdcc_enter_ix
	push	af
;src/cvu_get_lzk.c:28: uint_fast8_t i = (state->start++ + 64 - state->offset);
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genPlus
;	AOP_STK for _ringbuffer_get_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0005
	add	hl, bc
	ex	(sp), hl
;	genPointerGet
;	AOP_STK for _ringbuffer_get_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genPlus
	ld	e, a
	inc	e
;	genAssign (pointer)
;	AOP_STK for _ringbuffer_get_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), e
;	genCast
;	(locations are the same)
;	genPlus
	add	a, #0x40
	ld	d, a
;	genAssign
;fetchPairLong
	ld	l, c
	ld	h, b
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	l, (hl)
;	genCast
;	(locations are the same)
;	genMinus
	ld	a, d
	sub	a, l
;src/cvu_get_lzk.c:29: state->start %= 64;
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into d.
;	genAnd
	push	af
	ld	a, e
	and	a, #0x3f
	ld	e, a
; peephole 1 removed dead load from #0x00 into d.
	pop	af
;	genCast
;	genMove_o
;	genMove_o
;	genAssign (pointer)
;	AOP_STK for _ringbuffer_get_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), e
;src/cvu_get_lzk.c:30: i %= 64;
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into d.
;	genAnd
; peephole 9 loaded a from a directly instead of going through e.
; peephole 0 removed redundant load from a into a.
	and	a, #0x3f
; peephole 1 removed dead load from #0x00 into e.
;	genCast
;	genMove_o
	ld	e, a
;	genMove_o
;src/cvu_get_lzk.c:31: return(state->buffer[i]);
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
;	genPlus
;fetchPairLong
	ld	d, #0x00
	add	hl, de
;	genPointerGet
	ld	l, (hl)
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_get_lzk.c:32: }
;	genEndFunction
	pop	af
	pop	ix
	ret
;src/cvu_get_lzk.c:34: uint8_t cvu_get_lzk(struct cvu_lzk_state *state)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_get_lzk
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 4 bytes.
_cvu_get_lzk::
	call	___sdcc_enter_ix
	push	af
	push	af
;src/cvu_get_lzk.c:38: if(state->left)
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genPlus
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0003
	add	hl, bc
	ex	(sp), hl
;	genPointerGet
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genIfx
	or	a, a
	jp	NZ, 00109$
;src/cvu_get_lzk.c:41: next = state->input();
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genCall
	push	bc
;fetchPairLong
	ld	l, e
	call	___sdcc_call_hl
;	genMove_o
;	genMove_o
	pop	bc
;	genAssign
;	AOP_STK for _cvu_get_lzk_sloc1_1_0
;	genMove_o
	ld	-2 (ix), l
;	genMove_o
;src/cvu_get_lzk.c:43: if(next != state->escape)
;	genPlus
;fetchPairLong
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;	genPointerGet
;	AOP_STK for _cvu_get_lzk_sloc2_1_0
	ld	a, (de)
	ld	-1 (ix), a
;	genCmpEq
;	AOP_STK for _cvu_get_lzk_sloc1_1_0
;	AOP_STK for _cvu_get_lzk_sloc2_1_0
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jr	Z,00104$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00132$.
;src/cvu_get_lzk.c:45: ringbuffer_insert(state, next);
;	genIpush
;	AOP_STK for _cvu_get_lzk_sloc1_1_0
	ld	a, -2 (ix)
	push	af
	inc	sp
;	genIpush
	push	bc
;	genCall
	call	_ringbuffer_insert
	pop	af
	inc	sp
;src/cvu_get_lzk.c:46: return(next);
;	genRet
;	AOP_STK for _cvu_get_lzk_sloc1_1_0
	ld	l, -2 (ix)
	jp	00110$
;	genLabel
00104$:
;src/cvu_get_lzk.c:49: next = state->input();
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genCall
	push	bc
	push	de
;fetchPairLong
	call	___sdcc_call_hl
;	genMove_o
;	genMove_o
	pop	de
	pop	bc
;	genAssign
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
;	genMove_o
;	genMove_o
;src/cvu_get_lzk.c:51: if(!next)
;	genIfx
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
; peephole 33 loaded a from l instead of going through -1 (ix).
	ld	-1 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00106$
; peephole 164 changed absolute to relative conditional jump.
;src/cvu_get_lzk.c:53: ringbuffer_insert(state, state->escape);
;	genPointerGet
	ld	a, (de)
;	genIpush
	push	de
	push	af
	inc	sp
;	genIpush
	push	bc
;	genCall
	call	_ringbuffer_insert
	pop	af
	inc	sp
	pop	de
;src/cvu_get_lzk.c:54: return(state->escape);
;	genPointerGet
	ld	a, (de)
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
	jr	00110$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00106$:
;src/cvu_get_lzk.c:57: state->offset = 0;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0004
	add	hl, bc
	ex	de, hl
;	genAssign (pointer)
;	isBitvar = 0
	xor	a, a
	ld	(de), a
;src/cvu_get_lzk.c:58: if(!(next & 0xf))
;	genAnd
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
	ld	a, -1 (ix)
	and	a, #0x0f
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00133$.
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00134$.
;src/cvu_get_lzk.c:60: state->left = ((next >> 4) & 0x3);
;	genRightShift
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
	ld	a, -1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
;	genAnd
	and	a, #0x03
;	genAssign (pointer)
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), a
;src/cvu_get_lzk.c:61: state->offset = (next >> 6);
;	genRightShift
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
	ld	a, -1 (ix)
	rlca
	rlca
	and	a, #0x03
;	genAssign (pointer)
;	isBitvar = 0
	ld	(de), a
;src/cvu_get_lzk.c:62: next = state->input();
;	genPointerGet
;fetchPairLong
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;	genCall
	push	bc
	push	de
;fetchPairLong
	call	___sdcc_call_hl
;	genMove_o
;	genMove_o
	pop	de
	pop	bc
;	genAssign
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
;	genMove_o
	ld	-1 (ix), l
;	genMove_o
;	genLabel
00108$:
;src/cvu_get_lzk.c:65: state->left += (next & 0xf);
;	genPointerGet
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	l, (hl)
;	genCast
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
;	genMove_o
	ld	a, -1 (ix)
;	genMove_o
;	genAnd
	and	a, #0x0f
;	genCast
;	(locations are the same)
;	genPlus
	add	a, l
;	genAssign (pointer)
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), a
;src/cvu_get_lzk.c:66: state->left++;
;	genPointerGet
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genPlus
	inc	a
;	genAssign (pointer)
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), a
;src/cvu_get_lzk.c:67: state->offset += (next >> 4);
;	genPointerGet
	ld	a, (de)
	ld	l, a
;	genRightShift
;	AOP_STK for _cvu_get_lzk_sloc3_1_0
	ld	a, -1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
;	genPlus
	add	a, l
;	genAssign (pointer)
;	isBitvar = 0
	ld	(de), a
;src/cvu_get_lzk.c:69: output:
;	genLabel
00109$:
;src/cvu_get_lzk.c:70: state->left--;
;	genPointerGet
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genMinus
	dec	a
;	genAssign (pointer)
;	AOP_STK for _cvu_get_lzk_sloc0_1_0
;	isBitvar = 0
;fetchPairLong
	pop	hl
	push	hl
	ld	(hl), a
;src/cvu_get_lzk.c:71: return(ringbuffer_get(state));
;	genIpush
	push	bc
;	genCall
	call	_ringbuffer_get
	pop	af
;	genMove_o
;	genMove_o
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
00110$:
;src/cvu_get_lzk.c:72: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
