;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_vinb
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_read_vram_address
	.globl _cvu_vinb
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
;src/cvu_vinb.c:5: uint8_t cvu_vinb(const cv_vmemp dest)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_vinb
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_vinb::
;src/cvu_vinb.c:7: cv_set_read_vram_address(dest);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 2
;fetchPairLong
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
;	genCall
	call	_cv_set_read_vram_address
	pop	af
;../libcv/include/cv_graphics.h:228: __endasm;
;	genInline
;	genInline
	cp	a, (hl)
	cp	a, (hl)
	nop
;../libcv/include/cv_graphics.h:229: return(cv_graphics_port);
;	genAssign
	in	a, (_cv_graphics_port)
;src/cvu_vinb.c:8: return(cv_vinb());
;	genRet
;	genMove_o
	ld	l, a
;	genMove_o
;	genLabel
; peephole 158 removed unused label 00102$.
;src/cvu_vinb.c:9: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
