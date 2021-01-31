;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_scroll_inhibit
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_scroll_inhibit
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
;src/cv_set_scroll_inhibit.c:7: void cv_set_scroll_inhibit(enum cv_scroll_inhibit inhibit)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_scroll_inhibit
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_scroll_inhibit::
;src/cv_set_scroll_inhibit.c:9: cv_vdpout(0x0, cv_vdpreg[0] = inhibit | (cv_vdpreg[0] & ~0xc0));
;	genAddrOf
	ld	bc, #_cv_vdpreg+0
;	genPointerGet
	ld	a, (bc)
;	genAnd
	and	a, #0x3f
;	genOr
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	ld	hl, #2+0
	add	hl, sp
	or	a, (hl)
; peephole 68 used hl instead of iy.
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genIpush
	push	af
	inc	sp
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_scroll_inhibit.c:10: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
