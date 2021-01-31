;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cv_get_controller_state
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_get_controller_state
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_port0	=	0x00dc
_port1	=	0x00dd
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
;src/cv_get_controller_state.c:45: void cv_get_controller_state(struct cv_controller_state *state, uint_fast8_t controller)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_controller_state
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 0 bytes.
_cv_get_controller_state::
;src/cv_get_controller_state.c:47: uint8_t joy = ~(!controller ? port0 : ((port0 >> 6) | (port1 << 2)));
;	genIfx
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 4, size 1
; peephole 62 used hl instead of iy.
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	NZ,00103$
; peephole 164 changed absolute to relative conditional jump.
;	genAssign
	in	a, (_port0)
;	genGoto
	jr	00104$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00103$:
;	genRightShift
	in	a, (_port0)
	rlca
	rlca
	and	a, #0x03
	ld	c, a
;	genCast
	in	a, (_port1)
;	genLeftShift
	add	a, a
	add	a, a
;	genCast
;	(locations are the same)
;	genOr
	or	a, c
;	genLabel
00104$:
;	genCpl
	cpl
;	genAssign
;	genMove_o
	ld	l, a
;	genMove_o
;src/cv_get_controller_state.c:48: state->joystick = joy & 0x3f;
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	de
	pop	bc
	push	bc
	push	de
;	genPlus
	inc	bc
;	genAnd
	ld	a, l
	and	a, #0x3f
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cv_get_controller_state.c:49: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
