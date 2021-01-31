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
_port0	=	0x00fc
_port1	=	0x00ff
_port2	=	0x0080
_port3	=	0x00c0
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
;src/cv_get_controller_state.c:12: void cv_get_controller_state(struct cv_controller_state *state, uint_fast8_t controller)
;	genLabel
;	genFunction
;	---------------------------------
; Function cv_get_controller_state
; ---------------------------------
;	Register assignment might be sub-optimal.
; Stack space usage: 1 bytes.
_cv_get_controller_state::
	call	___sdcc_enter_ix
	dec	sp
;src/cv_get_controller_state.c:16: port2 = 42; // The meaning of life, the universe and everything. Read the keypad.
;	genAssign
	ld	a, #0x2a
	out	(_port2), a
;src/cv_get_controller_state.c:18: key = controller ? port1 : port0;
;	genIfx
;	AOP_STK for 
	ld	a, 6 (ix)
	or	a, a
	jr	Z,00112$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
	in	a, (_port1)
;	genGoto
	jr	00113$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00112$:
;	genAssign
	in	a, (_port0)
;	genLabel
00113$:
;	genAssign
;	AOP_STK for _cv_get_controller_state_sloc0_1_0
;	genMove_o
	ld	-1 (ix), a
;	genMove_o
;src/cv_get_controller_state.c:19: state->keypad = keytable[key & 0xf];  // Decode key
;	genAssign
;	AOP_STK for 
;fetchPairLong
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;	genAddrOf
	ld	hl, #_keytable+0
;	genCast
;	AOP_STK for _cv_get_controller_state_sloc0_1_0
;	genMove_o
;	genMove_o
;	genMove_o
; peephole 1 removed dead load from #0x00 into d.
;	genAnd
; peephole 12 loaded -1 (ix) into a directly instead of going through e.
	ld	a, -1 (ix)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
;	genPlus
	add	hl, de
;	genPointerGet
	ld	a, (hl)
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;src/cv_get_controller_state.c:21: port3 = 42; // The meaning of life, the universe and everything. Read the joystick.
;	genAssign
	ld	a, #0x2a
	out	(_port3), a
;src/cv_get_controller_state.c:23: joy = ~(controller ? port1 : port0);
;	genIfx
;	AOP_STK for 
	ld	a, 6 (ix)
	or	a, a
	jr	Z,00114$
; peephole 163 changed absolute to relative conditional jump.
;	genAssign
	in	a, (_port1)
;	genGoto
	jr	00115$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00114$:
;	genAssign
	in	a, (_port0)
;	genLabel
00115$:
;	genCpl
	cpl
	ld	l, a
;src/cv_get_controller_state.c:24: if(!(key & 0x40))
;	genAnd
;	AOP_STK for _cv_get_controller_state_sloc0_1_0
	bit	6, -1 (ix)
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00141$.
	jr	NZ,00102$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00142$.
;src/cv_get_controller_state.c:25: joy |= CV_FIRE_1;
;	genOr
	set	7, l
;	genGoto
	jr	00103$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;src/cv_get_controller_state.c:27: joy &= ~CV_FIRE_1;
;	genAnd
	res	7, l
;	genLabel
00103$:
;src/cv_get_controller_state.c:28: if((key & 0xf) == 8)
;	genCmpEq
	ld	a, e
	sub	a, #0x08
	or	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00143$.
	jr	NZ,00105$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00144$.
;src/cv_get_controller_state.c:29: joy |= CV_FIRE_2;
;	genOr
	set	4, l
;	genGoto
	jr	00106$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00105$:
;src/cv_get_controller_state.c:31: joy &= ~CV_FIRE_2;
;	genAnd
	res	4, l
;	genLabel
00106$:
;src/cv_get_controller_state.c:32: if((key & 0xf) == 4)
;	genCmpEq
	ld	a, e
	sub	a, #0x04
	or	a, d
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00145$.
	jr	NZ,00108$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00146$.
;src/cv_get_controller_state.c:33: joy |= CV_FIRE_3;
;	genOr
	ld	a, l
	set	5, a
;	genGoto
	jr	00109$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00108$:
;src/cv_get_controller_state.c:35: joy &= ~CV_FIRE_3;
;	genAnd
	ld	a, l
	res	5, a
;	genLabel
00109$:
;src/cv_get_controller_state.c:37: state->joystick = joy;
;	genPlus
	inc	bc
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genLabel
; peephole 158 removed unused label 00110$.
;src/cv_get_controller_state.c:38: }
;	genEndFunction
	inc	sp
	pop	ix
	ret
_keytable:
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x0f	; 15
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
