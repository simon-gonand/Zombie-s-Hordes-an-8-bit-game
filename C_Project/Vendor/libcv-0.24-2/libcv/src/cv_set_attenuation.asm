;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_set_attenuation
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_attenuation
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_port	=	0x00ff
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
;src/cv_set_attenuation.c:9: void cv_set_attenuation(enum cv_soundchannel channel, uint8_t dezibel)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_set_attenuation
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cv_set_attenuation::
	call	___sdcc_enter_ix
;src/cv_set_attenuation.c:11: channel += 1;
;	genCast
;	AOP_STK for 
;	genMove_o
;	genMove_o
;	genPlus
;	AOP_STK for 
	inc	4 (ix)
; peephole 8 removed dead load from 4 (ix) into a.
; peephole 116 incremented in 4 (ix) instead of going through a.
;src/cv_set_attenuation.c:12: dezibel >>= 1;
;	genRightShift
;	AOP_STK for 
	srl	5 (ix)
; peephole 8 removed dead load from 5 (ix) into a.
; peephole 21 shifted in (ix) instead of a.
;src/cv_set_attenuation.c:13: dezibel &= 0xf;
;	genAssign
;	AOP_STK for 
;	genMove_o
	ld	a, 5 (ix)
;	genMove_o
;	genAnd
;	AOP_STK for 
	and	a, #0x0f
;src/cv_set_attenuation.c:14: if(dezibel == 0)
;	genIfx
;	AOP_STK for 
; peephole 33 loaded a from a instead of going through 5 (ix).
	ld	5 (ix), a
; peephole 0 removed redundant load from a into a.
	or	a, a
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
;src/cv_set_attenuation.c:15: dezibel = 0xf;
;	genAssign
;	AOP_STK for 
;	genMove_o
	ld	5 (ix), #0x0f
;	genLabel
00102$:
;src/cv_set_attenuation.c:16: port = (0x80 | (channel << 4) | dezibel);
;	genCast
;	AOP_STK for 
;	genMove_o
	ld	a, 4 (ix)
;	genMove_o
;	genLeftShift
	add	a, a
	add	a, a
	add	a, a
	add	a, a
;	genCast
;	(locations are the same)
;	genOr
	ld	c, a
	set	7, c
;	genAssign
;	AOP_STK for 
;	genMove_o
	ld	a, 5 (ix)
;	genMove_o
;	genOr
	or	a, c
	out	(_port), a
;	genLabel
; peephole 158 removed unused label 00103$.
;src/cv_set_attenuation.c:17: }
;	genEndFunction
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
