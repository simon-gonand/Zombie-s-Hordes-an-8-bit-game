;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_character_pattern_table
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_character_pattern_t
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
;src/cv_set_character_pattern_table.c:5: void cv_set_character_pattern_t(cv_vmemp loc)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_character_pattern_t
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_character_pattern_t::
;src/cv_set_character_pattern_table.c:7: cv_vdpout(0x4, loc >> 11);
;	genRightShift
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
; peephole 62 used hl instead of iy.
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	b, a
	ld	c, #0x00
;	genCast
;	genMove_o
;	genMove_o
;	genIpush
	push	bc
	inc	sp
;	genIpush
	ld	a, #0x04
	push	af
	inc	sp
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_character_pattern_table.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
