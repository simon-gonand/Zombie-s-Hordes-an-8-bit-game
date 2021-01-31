;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_play_music
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_vint_frequency
	.globl _cv_set_frequency
	.globl _cv_set_attenuation
	.globl _cvu_play_music
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
;src/cvu_play_music.c:20: bool cvu_play_music(struct cvu_music *restrict music)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_play_music
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 15 bytes.
_cvu_play_music::
	call	___sdcc_enter_ix
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
;src/cvu_play_music.c:22: if(music->note_ticks_remaining >= music->sixteenth_notes_per_second)
;	genAssign
;	AOP_STK for 
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	genMove_o
	ld	a, 4 (ix)
	ld	-11 (ix), a
	ld	a, 5 (ix)
	ld	-10 (ix), a
;	genMove_o
;	genPlus
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	AOP_STK for _cvu_play_music_sloc1_1_0
	ld	a, -11 (ix)
	add	a, #0x08
	ld	-13 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	AOP_STK for _cvu_play_music_sloc2_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
;	genPlus
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	AOP_STK for _cvu_play_music_sloc3_1_0
	ld	a, -11 (ix)
	add	a, #0x05
	ld	-15 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-14 (ix), a
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc3_1_0
;	AOP_STK for _cvu_play_music_sloc4_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genCast
;	AOP_STK for _cvu_play_music_sloc4_1_0
;	AOP_STK for _cvu_play_music_sloc5_1_0
;	genMove_o
;	genMove_o
; peephole 33 loaded a from a instead of going through -3 (ix).
	ld	-3 (ix), a
; peephole 0 removed redundant load from a into a.
	ld	-2 (ix), a
;	genMove_o
	xor	a, a
	ld	-1 (ix), a
;	genCmpLt
;	AOP_STK for _cvu_play_music_sloc2_1_0
;	AOP_STK for _cvu_play_music_sloc5_1_0
	ld	a, -5 (ix)
	sub	a, -2 (ix)
	ld	a, -4 (ix)
	sbc	a, -1 (ix)
	jr	C,00116$
; peephole 165 changed absolute to relative conditional jump.
;src/cvu_play_music.c:23: music->note_ticks_remaining -= music->sixteenth_notes_per_second;
;	genCast
;	AOP_STK for _cvu_play_music_sloc4_1_0
;	genMove_o
;	genMove_o
	ld	c, -3 (ix)
;	genMove_o
	ld	b, #0x00
;	genCast
;	AOP_STK for _cvu_play_music_sloc2_1_0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
;	genCast
;	(locations are the same)
;	genMinus
	cp	a, a
	sbc	hl, bc
;	genCast
;fetchPairLong
	ld	c, l
	ld	b, h
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genGoto
	jp	00117$
;	genLabel
00116$:
;src/cvu_play_music.c:24: else if(music->pause_ticks_remaining >= music->sixteenth_notes_per_second)
;	genPlus
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	AOP_STK for _cvu_play_music_sloc6_1_0
	ld	a, -11 (ix)
	add	a, #0x0a
	ld	-5 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc6_1_0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;src/cvu_play_music.c:26: cv_set_attenuation(music->channel, 0);
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	AOP_STK for _cvu_play_music_sloc7_1_0
;fetchPairLong
	ld	l, -11 (ix)
	ld	h, -10 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
;src/cvu_play_music.c:24: else if(music->pause_ticks_remaining >= music->sixteenth_notes_per_second)
;	genCmpLt
;	AOP_STK for _cvu_play_music_sloc5_1_0
	ld	a, c
	sub	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jr	C,00113$
; peephole 165 changed absolute to relative conditional jump.
;src/cvu_play_music.c:26: cv_set_attenuation(music->channel, 0);
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _cvu_play_music_sloc7_1_0
	ld	a, -3 (ix)
	push	af
	inc	sp
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cvu_play_music.c:27: music->pause_ticks_remaining -= music->sixteenth_notes_per_second;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	AOP_STK for _cvu_play_music_sloc8_1_0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-2 (ix), a
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc3_1_0
;	AOP_STK for _cvu_play_music_sloc9_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genCast
;	AOP_STK for _cvu_play_music_sloc9_1_0
;	AOP_STK for _cvu_play_music_sloc10_1_0
;	genMove_o
;	genMove_o
; peephole 33 loaded a from a instead of going through -1 (ix).
	ld	-1 (ix), a
; peephole 0 removed redundant load from a into a.
	ld	-7 (ix), a
;	genMove_o
	xor	a, a
	ld	-6 (ix), a
;	genCast
;	AOP_STK for _cvu_play_music_sloc8_1_0
;	AOP_STK for _cvu_play_music_sloc11_1_0
;	genMove_o
	ld	a, -3 (ix)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
;	genMove_o
;	genCast
;	AOP_STK for _cvu_play_music_sloc10_1_0
;	AOP_STK for _cvu_play_music_sloc12_1_0
;	genMove_o
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
;	genMove_o
;	genMinus
;	AOP_STK for _cvu_play_music_sloc11_1_0
;	AOP_STK for _cvu_play_music_sloc12_1_0
;	AOP_STK for _cvu_play_music_sloc13_1_0
	ld	a, -9 (ix)
	sub	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	sbc	a, -1 (ix)
	ld	-6 (ix), a
;	genCast
;	AOP_STK for _cvu_play_music_sloc13_1_0
;	AOP_STK for _cvu_play_music_sloc14_1_0
;	genMove_o
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
;	genMove_o
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	AOP_STK for _cvu_play_music_sloc14_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;	genGoto
	jp	00117$
;	genLabel
00113$:
;src/cvu_play_music.c:32: const uint16_t note = *(music->notes);
;	genPlus
;	AOP_STK for _cvu_play_music_sloc0_1_0
;	AOP_STK for _cvu_play_music_sloc15_1_0
	ld	a, -11 (ix)
	add	a, #0x06
	ld	-9 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc15_1_0
;fetchPairLong
	ld	l, -9 (ix)
	ld	h, -8 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc16_1_0
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-2 (ix), a
	inc	bc
;	_moveFrom_tpair_()
	ld	a, (bc)
	ld	-1 (ix), a
;src/cvu_play_music.c:34: cv_set_attenuation(music->channel, 0);
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genIpush
;	AOP_STK for _cvu_play_music_sloc7_1_0
	ld	a, -3 (ix)
	push	af
	inc	sp
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cvu_play_music.c:36: if(note == 0xffff)
;	genCast
;	AOP_STK for _cvu_play_music_sloc16_1_0
;	AOP_STK for _cvu_play_music_sloc17_1_0
;	genMove_o
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
;	genMove_o
;	genCmpEq
;	AOP_STK for _cvu_play_music_sloc17_1_0
	ld	a, -7 (ix)
	and	a, -6 (ix)
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00174$.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00175$.
;src/cvu_play_music.c:37: return(false);
;	genRet
	inc	a
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
	ld	l,a
; peephole 124 replaced constant #0x00 by a (which has just been tested to be #0x00).
	jp	00118$
;	genLabel
00102$:
;src/cvu_play_music.c:42: uint16_t leftover_ticks = music->note_ticks_remaining + music->pause_ticks_remaining; // Avoid desynchronization of multi-voice music.
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc6_1_0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	h, (hl)
;	genPlus
;fetchPairLong
	ld	l, e
	add	hl, bc
;	genAssign
;fetchPairLong
	ld	c, l
	ld	b, h
;src/cvu_play_music.c:44: length = (note >> 4) & 0xf;
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc16_1_0
;fetchPairLong
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	a, #0x04
00176$:
	srl	d
	rr	e
	dec	a
	jr	NZ,00176$
; peephole 164 changed absolute to relative conditional jump.
;	genCast
;	genMove_o
	ld	a, e
;	genMove_o
;	genAnd
	and	a, #0x0f
;	genAssign
;	genMove_o
	ld	e, a
;	genMove_o
;src/cvu_play_music.c:45: if(!length)
;	genIfx
	or	a, a
	jr	NZ,00104$
; peephole 164 changed absolute to relative conditional jump.
;src/cvu_play_music.c:46: length = 0x10;
;	genAssign
;	genMove_o
	ld	e, #0x10
;	genLabel
00104$:
;src/cvu_play_music.c:47: music->note_ticks_remaining = length * cv_get_vint_frequency();
;	genCall
	push	bc
	push	de
	call	_cv_get_vint_frequency
;	genMove_o
	ld	a, l
;	genMove_o
	pop	de
;	genMult
; peephole 50 eleminated dead pop/push pair.
	ld	h, a
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00177$:
	add	hl, hl
	jr	NC,00178$
; peephole 166 changed absolute to relative conditional jump.
	add	hl, de
00178$:
	djnz	00177$
	pop	bc
	ex	de, hl
;	genCast
;	(locations are the same)
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_play_music.c:48: music->note_ticks_remaining += leftover_ticks;
;	genPlus
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:49: music->note_ticks_remaining -= music->sixteenth_notes_per_second;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc3_1_0
;fetchPairLong
	pop	hl
	push	hl
;	_moveFrom_tpair_()
	ld	e, (hl)
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
	ld	d, #0x00
;	genCast
;	(locations are the same)
;	genCast
;	(locations are the same)
;	genMinus
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;	genCast
;	(locations are the same)
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:51: rel_length = (note >> 2) & 0x3;
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc16_1_0
;fetchPairLong
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	srl	b
	rr	c
	srl	b
	rr	c
;	genCast
;	genMove_o
	ld	a, c
;	genMove_o
;	genAnd
;	AOP_STK for _cvu_play_music_sloc18_1_0
	and	a, #0x03
;src/cvu_play_music.c:52: switch(rel_length)
;	genCmpEq
;	AOP_STK for _cvu_play_music_sloc18_1_0
; peephole 33 loaded a from a instead of going through -3 (ix).
	ld	-3 (ix), a
; peephole 0 removed redundant load from a into a.
	or	a, a
	jp	Z,00109$
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00179$.
;src/cvu_play_music.c:22: if(music->note_ticks_remaining >= music->sixteenth_notes_per_second)
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;src/cvu_play_music.c:52: switch(rel_length)
;	genCmpEq
;	AOP_STK for _cvu_play_music_sloc18_1_0
	ld	a, -3 (ix)
	dec	a
	jr	Z,00106$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00180$.
;	genCmpEq
;	AOP_STK for _cvu_play_music_sloc18_1_0
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	Z,00107$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00181$.
;	genGoto
	jr	00108$
; peephole 162 changed absolute to relative unconditional jump.
;src/cvu_play_music.c:56: case 1:	// Staccato
;	genLabel
00106$:
;src/cvu_play_music.c:57: music->pause_ticks_remaining = music->note_ticks_remaining;
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:58: music->note_ticks_remaining = music->note_ticks_remaining >> 2;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genRightShift
;fetchPairLong
	srl	d
	rr	e
	srl	d
	rr	e
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_play_music.c:59: music->pause_ticks_remaining -= music->note_ticks_remaining;
;	genMinus
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:60: break;
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;src/cvu_play_music.c:61: case 2:
;	genLabel
00107$:
;src/cvu_play_music.c:62: music->pause_ticks_remaining = music->note_ticks_remaining >> 1;
;	genRightShift
;fetchPairLong
	srl	b
	rr	c
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:63: music->note_ticks_remaining -= music->pause_ticks_remaining;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:64: break;
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;src/cvu_play_music.c:65: default:	// Standard
;	genLabel
00108$:
;src/cvu_play_music.c:66: music->pause_ticks_remaining = music->note_ticks_remaining >> 2;
;	genRightShift
;fetchPairLong
	srl	b
	rr	c
	srl	b
	rr	c
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc6_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:67: music->note_ticks_remaining -= music->pause_ticks_remaining;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc1_1_0
;fetchPairLong
	ld	l, -13 (ix)
	ld	h, -12 (ix)
;	_moveFrom_tpair_()
	ld	e, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	d, (hl)
;	genMinus
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc1_1_0
;	isBitvar = 0
;fetchPairLong
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/cvu_play_music.c:69: }
;	genLabel
00109$:
;src/cvu_play_music.c:77: halftone = (note >> 8) & 0xf;
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc16_1_0
; peephole 1 removed dead load from #0x00 into b.
;	genCast
;	genMove_o
; peephole 12 loaded -1 (ix) into a directly instead of going through c.
	ld	a, -1 (ix)
;	genMove_o
;	genAnd
;	AOP_STK for _cvu_play_music_sloc19_1_0
	and	a, #0x0f
;src/cvu_play_music.c:78: pause = (halftone == 0xf);
;	genCmpEq
;	AOP_STK for _cvu_play_music_sloc19_1_0
; peephole 33 loaded a from a instead of going through -4 (ix).
	ld	-4 (ix), a
; peephole 0 removed redundant load from a into a.
	sub	a, #0x0f
	ld	a, #0x01
	jr	Z,00183$
; peephole 163 changed absolute to relative conditional jump.
; peephole 169xnz used double assignment in case of NZ condition.
; peephole 158 removed unused label 00182$.
	xor	a, a
00183$:
	ld	c, a
;	genMove_o
;	genAssign
;	AOP_STK for _cvu_play_music_sloc20_1_0
;	genMove_o
	ld	-3 (ix), c
;	genMove_o
;src/cvu_play_music.c:79: if(!pause)
;	genIfx
	bit	0, c
	jp	NZ, 00111$
;src/cvu_play_music.c:81: frequency_divider = music->tuning[halftone];
;	genAssign
;	AOP_STK for _cvu_play_music_sloc0_1_0
;fetchPairLong
	ld	l, -11 (ix)
	ld	h, -10 (ix)
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genCast
;	AOP_STK for _cvu_play_music_sloc19_1_0
;	genMove_o
;	genMove_o
	ld	l, -4 (ix)
;	genMove_o
	ld	h, #0x00
;	genLeftShift
	add	hl, hl
;fetchPairLong
;	genPlus
	add	hl, bc
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc21_1_0
;fetchPairLong
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
	ld	-4 (ix), a
;src/cvu_play_music.c:83: octave = (note >> 12);
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc16_1_0
	ld	a, -1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
; peephole 1 removed dead load from #0x00 into b.
;	genCast
;	AOP_STK for _cvu_play_music_sloc22_1_0
;	genMove_o
; peephole 13 loaded a into -12 (ix) directly instead of going through c.
;	genMove_o
;src/cvu_play_music.c:84: cv_set_frequency(music->channel, (frequency_divider >> octave) <= 32736 ? frequency_divider >> octave : frequency_divider >> (octave + 1));
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc22_1_0
;	AOP_STK for _cvu_play_music_sloc23_1_0
;	AOP_STK for _cvu_play_music_sloc21_1_0
; peephole 33 loaded b from a instead of going through -12 (ix).
	ld	-12 (ix), a
	ld	b, a
;	genMove_o
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
;	genMove_o
;	genMove_o
	inc	b
	jr	00185$
; peephole 162 changed absolute to relative unconditional jump.
00184$:
	srl	-1 (ix)
	rr	-2 (ix)
00185$:
	djnz	00184$
;	genCast
;	AOP_STK for _cvu_play_music_sloc23_1_0
;fetchPairLong
	ld	c, -2 (ix)
	ld	b, -1 (ix)
;	genCmpGt
	ld	a, #0xe0
	cp	a, c
	ld	a, #0x7f
	sbc	a, b
;	genAssign
;	AOP_STK for _cvu_play_music_sloc23_1_0
;	AOP_STK for _cvu_play_music_sloc24_1_0
;	(locations are the same)
;	genGoto
;	genLabel
	jr	NC,00121$
; peephole 166 changed absolute to relative conditional jump.
; peephole 80 removed jp by using inverse jump logic
; peephole 158 removed unused label 00120$.
;	genPlus
;	AOP_STK for _cvu_play_music_sloc22_1_0
;	AOP_STK for _cvu_play_music_sloc25_1_0
	ld	a, -12 (ix)
	inc	a
;	genRightShift
;	AOP_STK for _cvu_play_music_sloc25_1_0
;	AOP_STK for _cvu_play_music_sloc24_1_0
;	AOP_STK for _cvu_play_music_sloc21_1_0
; peephole 33 loaded b from a instead of going through -1 (ix).
	ld	-1 (ix), a
	ld	b, a
;	genMove_o
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
;	genMove_o
;	genMove_o
	inc	b
	jr	00187$
; peephole 162 changed absolute to relative unconditional jump.
00186$:
	srl	-1 (ix)
	rr	-2 (ix)
00187$:
	djnz	00186$
;	genLabel
00121$:
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc0_1_0
;fetchPairLong
	ld	l, -11 (ix)
	ld	h, -10 (ix)
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genIpush
;	AOP_STK for _cvu_play_music_sloc24_1_0
;fetchPairLong
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
;	genIpush
	push	bc
	inc	sp
;	genCall
	call	_cv_set_frequency
	pop	af
	inc	sp
;	genLabel
00111$:
;src/cvu_play_music.c:90: cv_set_attenuation(music->channel, pause ? 0 : (music->volume[note & 0x3]));
;	genIfx
;	AOP_STK for _cvu_play_music_sloc20_1_0
	bit	0, -3 (ix)
	jr	Z,00122$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
;fetchPairLong
;fetchLitPair
	ld	bc, #0x0000
;	genGoto
	jr	00123$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00122$:
;	genAssign
;	AOP_STK for _cvu_play_music_sloc0_1_0
;fetchPairLong
	ld	l, -11 (ix)
	ld	h, -10 (ix)
;	genPointerGet
;fetchPairLong
	inc	hl
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genAnd
;	AOP_STK for _cvu_play_music_sloc17_1_0
	ld	a, -7 (ix)
	and	a, #0x03
	ld	h, #0x00
;	genPlus
;fetchPairLong
	ld	l, a
	add	hl, bc
;	genPointerGet
	ld	c, (hl)
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into b.
;	genLabel
00123$:
;	genCast
;	genMove_o
	ld	a, c
;	genMove_o
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc0_1_0
;fetchPairLong
	ld	l, -11 (ix)
	ld	h, -10 (ix)
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genIpush
	push	af
	inc	sp
;	genIpush
	push	bc
	inc	sp
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cvu_play_music.c:92: music->notes++;
;	genPointerGet
;	AOP_STK for _cvu_play_music_sloc15_1_0
;fetchPairLong
	ld	l, -9 (ix)
	ld	h, -8 (ix)
;	_moveFrom_tpair_()
	ld	c, (hl)
	inc	hl
;	_moveFrom_tpair_()
	ld	b, (hl)
;	genPlus
	inc	bc
	inc	bc
;	genAssign (pointer)
;	AOP_STK for _cvu_play_music_sloc15_1_0
;	isBitvar = 0
;fetchPairLong
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
00117$:
;src/cvu_play_music.c:94: return(true);
;	genRet
	ld	l, #0x01
;	genLabel
00118$:
;src/cvu_play_music.c:95: }
;	genEndFunction
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
