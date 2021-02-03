;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_screen_mode
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vdpout
	.globl _cv_set_screen_mode
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
;src/cv_set_screen_mode.c:7: void cv_set_screen_mode(enum cv_screenmode mode)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_screen_mode
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_set_screen_mode::
	call	___sdcc_enter_ix
;src/cv_set_screen_mode.c:9: cv_vdpout(0x0, cv_vdpreg[0] = (mode & 0x06) | (cv_vdpreg[0] & ~0x06));
;	genAddrOf
	ld	bc, #_cv_vdpreg+0
;	genAssign
;	AOP_STK for 
;	genMove_o
	ld	e, 4 (ix)
;	genMove_o
;	genAnd
	ld	a, e
	and	a, #0x06
	ld	d, a
;	genPointerGet
	ld	a, (bc)
;	genAnd
	and	a, #0xf9
;	genOr
	or	a, d
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genIpush
	push	bc
	push	af
	inc	sp
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genCall
	call	_cv_vdpout
	pop	af
	pop	bc
;src/cv_set_screen_mode.c:10: cv_vdpout(0x1, cv_vdpreg[1] = (mode & 0x18) | (cv_vdpreg[1] & ~0x18));
;	genPlus
	inc	bc
;	genAnd
	ld	a, e
	and	a, #0x18
	ld	e, a
;	genPointerGet
	ld	a, (bc)
;	genAnd
	and	a, #0xe7
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
;src/cv_set_screen_mode.c:11: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
