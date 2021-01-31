;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_vint
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_vint
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_port	=	0x00bf
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
;src/cv_vint.c:9: void cv_vint(void)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_vint
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_vint::
;src/cv_vint.c:11: cv_vint_indicator = 0xff;
;	genAssign
;fetchLitPair
; peephole 57 used hl instead of iy.
	ld	hl,#_cv_vint_indicator + 0
	ld	(hl), #0xff
;src/cv_vint.c:12: cv_vdpstat = port;
;	genAssign
	in	a, (_port)
	ld	(_cv_vdpstat+0), a
;src/cv_vint.c:13: if(cv_vint_handler) (*cv_vint_handler)();
;	genIfx
;fetchLitPair
	ld	iy, #_cv_vint_handler
	ld	a, 1 (iy)
;fetchLitPair
	or	a, 0 (iy)
	ret	Z
; peephole 161 replaced jump by return.
;	genCall
;fetchPairLong
	ld	hl, (_cv_vint_handler)
;	genLabel
; peephole 158 removed unused label 00103$.
;src/cv_vint.c:14: }
;	genEndFunction
	jp	(hl)
; peephole 152 removed unused ret.
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
