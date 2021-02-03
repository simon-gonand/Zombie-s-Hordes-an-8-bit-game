;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_init_music
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CVU_EMPTY_MUSIC
	.globl _CVU_VOLUME_DEFAULT
	.globl _cvu_init_music
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
;src/cvu_init_music.c:27: void cvu_init_music(struct cvu_music *music)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_init_music
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cvu_init_music::
	call	___sdcc_enter_ix
;src/cvu_init_music.c:29: music->channel = CV_SOUNDCHANNEL_0;
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genAssign (pointer)
;	isBitvar = 0
	xor	a, a
	ld	(bc), a
;src/cvu_init_music.c:30: music->volume = CVU_VOLUME_DEFAULT;
;	genPlus
;fetchPairLong
	ld	l, c
	ld	h, b
	inc	hl
;	genAddrOf
	ld	de, #_CVU_VOLUME_DEFAULT+0
;	genCast
;	(locations are the same)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_init_music.c:31: music->tuning = CVU_TUNING_ISO16_EQUAL;
;	genPlus
;fetchPairLong
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
;	genAddrOf
	ld	de, #_CVU_TUNING_ISO16_EQUAL+0
;	genCast
;	(locations are the same)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/cvu_init_music.c:32: music->sixteenth_notes_per_second = 10;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0005
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
	ld	(hl), #0x0a
;src/cvu_init_music.c:33: music->note_ticks_remaining = 0;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0008
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/cvu_init_music.c:34: music->pause_ticks_remaining = 0;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x000a
	add	hl, bc
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/cvu_init_music.c:35: music->notes = &CVU_EMPTY_MUSIC;
;	genPlus
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0006
	add	hl, bc
;	genAddrOf
	ld	bc, #_CVU_EMPTY_MUSIC+0
;	genCast
;	(locations are the same)
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
	ld	(hl), c
	inc	hl
	ld	(hl), b
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_init_music.c:36: }
;	genEndFunction
	pop	ix
	ret
_CVU_VOLUME_DEFAULT:
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x08	; 8
_CVU_EMPTY_MUSIC:
	.dw #0xffff
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
