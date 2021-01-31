;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_get_sprite_color
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_get_sprite_color
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
;src/cvu_get_sprite_color.c:4: enum cv_color cvu_get_sprite_color(const struct cvu_sprite *sprite)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_get_sprite_color
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_get_sprite_color::
;src/cvu_get_sprite_color.c:6: return(sprite->tag & 0xf);
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
;	genPointerGet
;fetchPairLong
	inc	hl
	inc	hl
	inc	hl
;	_moveFrom_tpair_()
	ld	a, (hl)
;	genAnd
	and	a, #0x0f
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_get_sprite_color.c:7: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
