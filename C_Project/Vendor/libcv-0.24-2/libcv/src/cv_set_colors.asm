;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_colors
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_colors
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
;src/cv_set_colors.c:5: void cv_set_colors(enum cv_color foreground, enum cv_color background)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_colors
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_colors::
;src/cv_set_colors.c:7: cv_vdpout(0x07, (foreground << 4) | background);
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
;	genLeftShift
	add	a, a
	add	a, a
	add	a, a
	add	a, a
;	genCast
;	(locations are the same)
;	genOr
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 1
	inc	iy
	or	a, 0 (iy)
;	genIpush
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
	ld	d,a
	ld	e,#0x07
	push	de
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_colors.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
