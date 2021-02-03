;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_set_sprite_xy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_set_sprite_y
	.globl _cvu_set_sprite_x
	.globl _cvu_set_sprite_xy
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
;src/cvu_set_sprite_xy.c:19: void cvu_set_sprite_xy(struct cvu_sprite *sprite, int x, int y)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_set_sprite_xy
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_set_sprite_xy::
;src/cvu_set_sprite_xy.c:21: cvu_set_sprite_x(sprite, x);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
;fetchPairLong
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
;	genCall
	call	_cvu_set_sprite_x
	pop	af
	pop	af
;src/cvu_set_sprite_xy.c:22: cvu_set_sprite_y(sprite, y);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 6, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #6
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #4
	add	hl, sp
; peephole 49 pushed bc instead of hl.
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
;	genCall
	call	_cvu_set_sprite_y
	pop	af
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_set_sprite_xy.c:23: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
