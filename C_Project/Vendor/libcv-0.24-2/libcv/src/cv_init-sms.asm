;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_init
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_find_vint_frequency
	.globl _cv_set_vint_handler
	.globl _cv_set_attenuation
	.globl _cv_set_screen_active
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
;src/cv_init.c:16: static void cv_set_vint_bit(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_vint_bit
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_vint_bit:
;src/cv_init.c:18: cv_machine_config |= 1;
;	genAssign
;fetchLitPair
; peephole 16 loaded _cv_machine_config into a directly instead of going through iy.
	ld	a,(#_cv_machine_config + 0)
;	genOr
	or	a, #0x01
	ld	(_cv_machine_config+0), a
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_init.c:19: }
;	genEndFunction
	ret
;src/cv_init.c:21: void cv_find_vint_frequency(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_find_vint_frequency
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_find_vint_frequency::
;src/cv_init.c:23: cv_set_vint_handler(&cv_set_vint_bit);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #_cv_set_vint_bit
	push	hl
;	genCall
	call	_cv_set_vint_handler
	pop	af
;src/cv_init.c:24: cv_set_screen_active(true);
;	genIpush
	ld	a, #0x01
	push	af
	inc	sp
;	genCall
	call	_cv_set_screen_active
	inc	sp
;src/cv_init.c:48: __endasm;
;	genInline
;	genInline
;
	ld	de, #0
	ld	hl, #_cv_machine_config
	res	0, (hl)
	wait1:
	bit	0, (hl)
	jr	z, wait1
	res	0, (hl)
	wait2:
	inc	de
	bit	0, (hl)
	jr	z, wait2
	ld	a, #8
	cp	a, d
	jr	c, pal
	ntsc:
	ld	a, #60
	jr	cont
	pal:
	ld	a, #50
	cont:
	or	a, (hl)
	ld	(hl), a
;src/cv_init.c:49: cv_set_screen_active(false);
;	genIpush
	xor	a, a
	push	af
	inc	sp
;	genCall
	call	_cv_set_screen_active
	inc	sp
;src/cv_init.c:50: cv_set_vint_handler(0);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genCall
	call	_cv_set_vint_handler
	pop	af
;src/cv_init.c:51: cv_machine_config &= ~1;
;	genAnd
;fetchLitPair
; peephole 16 loaded _cv_machine_config into a directly instead of going through iy.
	ld	a,(#_cv_machine_config + 0)
	and	a, #0xfe
	ld	(_cv_machine_config+0), a
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_init.c:52: }
;	genEndFunction
	ret
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
;src/cv_init.c:69: cv_find_vint_frequency();
;	genCall
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_init.c:71: }
;	genEndFunction
	jp	_cv_find_vint_frequency
; peephole 152 removed unused ret.
	.area _CODE
	.area _INITIALIZER
__xinit__cv_vint_handler:
	.dw #0x0000
	.area _CABS (ABS)
