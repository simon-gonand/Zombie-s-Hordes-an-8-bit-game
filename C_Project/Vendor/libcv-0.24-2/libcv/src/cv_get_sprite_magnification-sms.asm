;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_sprite_magnification
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_sprite_magnification
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
;src/cv_get_sprite_magnification.c:7: bool cv_get_sprite_magnification(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_sprite_magnification
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_get_sprite_magnification::
;src/cv_get_sprite_magnification.c:9: return(cv_vdpreg[1] & 0x01);
;	genPointerGet
	ld	a, (#(_cv_vdpreg + 0x0001) + 0)
;	genCast
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into b.
;	genAnd
; peephole 9 loaded a from a directly instead of going through c.
; peephole 0 removed redundant load from a into a.
	and	a, #0x01
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_sprite_magnification.c:10: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
