;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_vscroll
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_vscroll
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
;src/cv_set_vscroll.c:5: void cv_set_vscroll(uint8_t offset)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_vscroll
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_vscroll::
;src/cv_set_vscroll.c:7: cv_vdpout(0x9, offset);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
; peephole 62 used hl instead of iy.
	ld	hl, #2+0
	add	hl, sp
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
; peephole 9 loaded d from (hl) directly instead of going through a.
	ld	d, (hl)
	ld	e,#0x09
	push	de
;	genCall
	call	_cv_vdpout
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_set_vscroll.c:8: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
