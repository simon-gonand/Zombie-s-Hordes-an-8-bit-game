;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_frequency
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_frequency
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_port	=	0x00ff
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
;src/cv_set_frequency.c:9: void cv_set_frequency(enum cv_soundchannel channel, uint16_t frequency_divider)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_frequency
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_frequency::
;src/cv_set_frequency.c:11: frequency_divider = frequency_divider >> 5;
;	genRightShift
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 2
;	genMove_o
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	b, #0x05
00103$:
	srl	1 (iy)
	rr	0 (iy)
	djnz	00103$
;src/cv_set_frequency.c:12: port = (0x80 | (channel << 4) | (frequency_divider & 0xf));
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	dec	iy
	ld	a, 0 (iy)
;	genLeftShift
	add	a, a
	add	a, a
	add	a, a
	add	a, a
;	genCast
;	(locations are the same)
;	genOr
	ld	c, a
	set	7, c
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 2
	inc	iy
	ld	a, 0 (iy)
;	genAnd
	and	a, #0x0f
;	genOr
	or	a, c
	out	(_port), a
;src/cv_set_frequency.c:13: port = (frequency_divider >> 4);
;	genRightShift
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 2
;	genMove_o
	ld	c, 0 (iy)
	ld	e, 1 (iy)
	ld	b, #0x04
00104$:
	srl	e
	rr	c
	djnz	00104$
;	genCast
	ld	a, c
	out	(_port), a
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_frequency.c:14: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
