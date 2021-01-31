;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_vmemtomemcpy
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vmemtomemcpy_slow
	.globl _cv_vmemtomemcpy_fast
	.globl _cv_set_read_vram_address
	.globl _cv_get_screen_mode
	.globl _cv_get_screen_active
	.globl _cvu_vmemtomemcpy
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
;src/cvu_vmemtomemcpy.c:8: void cvu_vmemtomemcpy(void *dest, cv_vmemp src, size_t n)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_vmemtomemcpy
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_vmemtomemcpy::
;src/cvu_vmemtomemcpy.c:10: cv_set_read_vram_address(src);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 2
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
	call	_cv_set_read_vram_address
	pop	af
;src/cvu_vmemtomemcpy.c:11: if(cv_get_screen_active() &&
;	genCall
	call	_cv_get_screen_active
;	genMove_o
;	genMove_o
;	genIfx
	bit	0, l
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
;src/cvu_vmemtomemcpy.c:12: cv_get_screen_mode() != CV_SCREENMODE_TEXT &&
;	genCall
	call	_cv_get_screen_mode
;	genMove_o
	ld	a, l
;	genMove_o
;	genCmpEq
	sub	a, #0x10
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00123$.
;src/cvu_vmemtomemcpy.c:13: cv_get_screen_mode() != CV_SCREENMODE_MULTICOLOR)
;	genCall
	call	_cv_get_screen_mode
;	genMove_o
	ld	a, l
;	genMove_o
;	genCmpEq
	sub	a, #0x08
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00124$.
;src/cvu_vmemtomemcpy.c:14: cv_vmemtomemcpy_slow(dest, n);
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
	call	_cv_vmemtomemcpy_slow
	pop	af
	pop	af
;	genGoto
	ret
; peephole 160 replaced jump by return.
;	genLabel
00102$:
;src/cvu_vmemtomemcpy.c:16: cv_vmemtomemcpy_fast(dest, n);
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
	call	_cv_vmemtomemcpy_fast
	pop	af
	pop	af
;	genLabel
; peephole 158 removed unused label 00106$.
;src/cvu_vmemtomemcpy.c:17: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
