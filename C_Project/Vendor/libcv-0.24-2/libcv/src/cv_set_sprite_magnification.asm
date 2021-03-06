;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_sprite_magnification
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_sprite_magnification
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
;src/cv_set_sprite_magnification.c:9: void cv_set_sprite_magnification(bool status)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_sprite_magnification
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_set_sprite_magnification::
;src/cv_set_sprite_magnification.c:11: cv_vdpout(0x1, cv_vdpreg[1] = status | (cv_vdpreg[1] & ~0x01));
;	genAddrOf
	ld	bc, #_cv_vdpreg+1
;	genPointerGet
	ld	a, (bc)
;	genAnd
	res	0, a
;	genCast
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
; peephole 62 used hl instead of iy.
	ld	hl, #2+0
	add	hl, sp
	ld	e, (hl)
;	genCast
;	(locations are the same)
;	genOr
	or	a, e
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genIpush
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
	ld	d,a
	ld	e,#0x01
	push	de
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_sprite_magnification.c:12: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
