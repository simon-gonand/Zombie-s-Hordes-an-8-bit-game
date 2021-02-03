;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_init
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_attenuation
	.globl _cv_vint_handler
	.globl _cv_vdpreg
	.globl _cv_vint_indicator
	.globl _cv_vdpstat
	.globl _cv_spint_handler
	.globl _cv_init
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_cv_graphics_port	=	0x00be
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_cv_spint_handler::
	.ds 2
_cv_vdpstat::
	.ds 1
_cv_vint_indicator::
	.ds 1
_cv_vdpreg::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_cv_vint_handler::
	.ds 2
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
;src/cv_init.c:55: void cv_init(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_init
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_init::
;src/cv_init.c:58: cv_vdpreg[1] = 0xa0;
;	genAssign (pointer)
;	isBitvar = 0
;fetchPairLong
;fetchLitPair
	ld	hl, #(_cv_vdpreg + 0x0001)
	ld	(hl), #0xa0
;src/cv_init.c:61: cv_set_attenuation(CV_SOUNDCHANNEL_0, 0);
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cv_init.c:62: cv_set_attenuation(CV_SOUNDCHANNEL_1, 0);
;	genIpush
	xor	a, a
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
	ld	d,a
	ld	e,#0x02
	push	de
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cv_init.c:63: cv_set_attenuation(CV_SOUNDCHANNEL_2, 0);
;	genIpush
	xor	a, a
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
	ld	d,a
	ld	e,#0x04
	push	de
;	genCall
	call	_cv_set_attenuation
	pop	af
;src/cv_init.c:64: cv_set_attenuation(CV_SOUNDCHANNEL_NOISE, 0);
;	genIpush
	xor	a, a
;	genIpush
; peephole 37 pushed de instead of pushing a twice.
	ld	d,a
	ld	e,#0x06
	push	de
;	genCall
	call	_cv_set_attenuation
	pop	af
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_init.c:71: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__cv_vint_handler:
	.dw #0x0000
	.area _CABS (ABS)
