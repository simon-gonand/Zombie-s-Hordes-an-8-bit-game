;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_screen_mode
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_screen_mode
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
;src/cv_get_screen_mode.c:7: enum cv_screenmode cv_get_screen_mode(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_screen_mode
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_get_screen_mode::
;src/cv_get_screen_mode.c:9: return((cv_vdpreg[0] & 0x06) | (cv_vdpreg[1] & 0x18));
;	genPointerGet
	ld	a, (#_cv_vdpreg + 0)
;	genAnd
	and	a, #0x06
	ld	c, a
;	genPointerGet
	ld	a, (#_cv_vdpreg + 1)
;	genAnd
	and	a, #0x18
;	genOr
	or	a, c
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_screen_mode.c:10: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
