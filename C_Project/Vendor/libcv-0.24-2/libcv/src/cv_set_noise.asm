;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_noise
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_noise
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
;src/cv_set_noise.c:9: void cv_set_noise(bool white, enum cv_shift shift)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_noise
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_noise::
;src/cv_set_noise.c:11: uint8_t n = 0xe0;
;	genAssign
;	genMove_o
	ld	c, #0xe0
;src/cv_set_noise.c:12: if(white)
;	genIfx
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	ld	hl, #2+0
	add	hl, sp
	bit	0, (hl)
; peephole 67 used hl instead of iy.
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;src/cv_set_noise.c:13: n |= 0x04;
;	genAssign
;	genMove_o
	ld	c, #0xe4
;	genLabel
00102$:
;src/cv_set_noise.c:14: n |= shift;
;	genOr
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 1
	ld	a, c
	ld	hl, #3+0
	add	hl, sp
	or	a, (hl)
; peephole 68 used hl instead of iy.
	out	(_port), a
;src/cv_set_noise.c:15: port = n;
;	genLabel
; peephole 158 removed unused label 00103$.
;src/cv_set_noise.c:16: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
