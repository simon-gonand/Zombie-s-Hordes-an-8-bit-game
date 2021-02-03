;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_sprite_invalid
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_sprite_invalid
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
;src/cv_get_sprite_invalid.c:7: bool cv_get_sprite_invalid(uint8_t *sprite)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_sprite_invalid
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_get_sprite_invalid::
;src/cv_get_sprite_invalid.c:9: if(sprite)
;	genIfx
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
; peephole 66 used hl instead of iy.
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;src/cv_get_sprite_invalid.c:10: *sprite = cv_vdpstat & 0x1f;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genAssign
;fetchLitPair
; peephole 16 loaded _cv_vdpstat into a directly instead of going through iy.
	ld	a,(#_cv_vdpstat + 0)
;	genAnd
	and	a, #0x1f
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genLabel
00102$:
;src/cv_get_sprite_invalid.c:11: return(cv_vdpstat & 0x40);
;	genCast
;	genMove_o
;fetchLitPair
;	genMove_o
; peephole 1 removed dead load from #0x00 into b.
;	genAnd
; peephole 12 loaded 0 (iy) into a directly instead of going through c.
; peephole 16 loaded _cv_vdpstat into a directly instead of going through iy.
	ld	a,(#_cv_vdpstat + 0)
	and	a, #0x40
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
; peephole 158 removed unused label 00103$.
;src/cv_get_sprite_invalid.c:12: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
