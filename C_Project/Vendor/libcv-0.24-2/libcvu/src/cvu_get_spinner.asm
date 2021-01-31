;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_get_spinner
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cvu_spint_handler
	.globl _cv_set_spint_handler
	.globl _cvu_spinners
	.globl _cvu_get_spinner
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_cvu_spinners::
	.ds 2
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
;src/cvu_get_spinner.c:5: void cvu_spint_handler(uint_fast8_t port0, uint_fast8_t port1)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_spint_handler
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_spint_handler::
;src/cvu_get_spinner.c:7: if(!(port0 & 0x10))
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
; peephole 62 used hl instead of iy.
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
;	genAnd
	bit	4, a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00133$.
	jr	NZ,00105$
; peephole 164 changed absolute to relative conditional jump.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00134$.
;src/cvu_get_spinner.c:9: if(port0 & 0x20)
;	genAnd
	bit	5, a
	jr	Z,00102$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00135$.
;src/cvu_get_spinner.c:10: cvu_spinners[0]++;
;	genAddrOf
	ld	bc, #_cvu_spinners+0
;	genPointerGet
	ld	a, (bc)
;	genPlus
	inc	a
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genGoto
	jr	00105$
; peephole 162 changed absolute to relative unconditional jump.
;	genLabel
00102$:
;src/cvu_get_spinner.c:12: cvu_spinners[0]--;
;	genAddrOf
	ld	bc, #_cvu_spinners+0
;	genPointerGet
	ld	a, (bc)
;	genMinus
	dec	a
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genLabel
00105$:
;src/cvu_get_spinner.c:15: if(!(port1 & 0x10))
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 1
; peephole 62 used hl instead of iy.
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
;	genAnd
	bit	4, a
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00136$.
	ret	NZ
; peephole 161 replaced jump by return.
; peephole 82 removed jp by using inverse jump logic
; peephole 158 removed unused label 00137$.
;src/cvu_get_spinner.c:17: if(port1 & 0x20)
;	genAnd
	bit	5, a
	jr	Z,00107$
; peephole 163 changed absolute to relative conditional jump.
; peephole 81 removed jp by using inverse jump logic
; peephole 158 removed unused label 00138$.
;src/cvu_get_spinner.c:18: cvu_spinners[1]++;
;	genAddrOf
	ld	bc, #_cvu_spinners+1
;	genPointerGet
	ld	a, (bc)
;	genPlus
	inc	a
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genGoto
	ret
; peephole 160 replaced jump by return.
;	genLabel
00107$:
;src/cvu_get_spinner.c:20: cvu_spinners[1]--;
;	genAddrOf
	ld	bc, #_cvu_spinners+1
;	genPointerGet
	ld	a, (bc)
;	genMinus
	dec	a
;	genAssign (pointer)
;	isBitvar = 0
	ld	(bc), a
;	genLabel
; peephole 158 removed unused label 00111$.
;src/cvu_get_spinner.c:22: }
;	genEndFunction
	ret
;src/cvu_get_spinner.c:24: int_fast8_t cvu_get_spinner(uint_fast8_t controller)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_get_spinner
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_get_spinner::
;src/cvu_get_spinner.c:30: cv_set_spint_handler(0);
;	genIpush
;fetchPairLong
;fetchLitPair
	ld	hl, #0x0000
	push	hl
;	genCall
	call	_cv_set_spint_handler
	pop	af
;src/cvu_get_spinner.c:32: spinner = cvu_spinners[controller];
;	genPlus
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	ld	a, #<(_cvu_spinners)
;	Shift into pair
	ld	hl, #2
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, #>(_cvu_spinners)
	adc	a, #0x00
	ld	b, a
;	genPointerGet
	ld	a, (bc)
	ld	e, a
;src/cvu_get_spinner.c:33: cvu_spinners[controller] = 0;
;	genAssign (pointer)
;	isBitvar = 0
	xor	a, a
	ld	(bc), a
;src/cvu_get_spinner.c:35: cv_set_spint_handler(cvu_spint_handler);
;	genIpush
	push	de
;fetchPairLong
;fetchLitPair
	ld	hl, #_cvu_spint_handler
	push	hl
;	genCall
	call	_cv_set_spint_handler
	pop	af
	pop	de
;src/cvu_get_spinner.c:37: return(spinner);
;	genRet
;	genMove_o
	ld	l, e
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00101$.
;src/cvu_get_spinner.c:38: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
