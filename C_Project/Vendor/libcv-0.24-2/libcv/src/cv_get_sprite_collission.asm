;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_sprite_collission
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_sprite_collission
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
;src/cv_get_sprite_collission.c:7: bool cv_get_sprite_collission(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_sprite_collission
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_get_sprite_collission::
;src/cv_get_sprite_collission.c:9: return(cv_vdpstat & 0x20);
;	genCast
;	genMove_o
;fetchLitPair
;	genMove_o
; peephole 1 removed dead load from #0x00 into b.
;	genAnd
; peephole 12 loaded 0 (iy) into a directly instead of going through c.
; peephole 16 loaded _cv_vdpstat into a directly instead of going through iy.
	ld	a,(#_cv_vdpstat + 0)
	and	a, #0x20
	ld	c, #0x00
;	genCast
;	Casting to bool
	or	a, c
	add	a, #0xff
	ld	a, #0x00
	rla
	ld	l, a
;	genMove_o
;	genRet
;	genMove_o
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_sprite_collission.c:10: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
