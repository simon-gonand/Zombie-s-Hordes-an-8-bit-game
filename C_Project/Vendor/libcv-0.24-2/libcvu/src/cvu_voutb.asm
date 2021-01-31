;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module cvu_voutb
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cv_set_write_vram_address
	.globl _cvu_voutb
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
;src/cvu_voutb.c:5: void cvu_voutb(const uint8_t value, const cv_vmemp dest)
;	genLabel
;	genFunction
;	---------------------------------
; Function cvu_voutb
; ---------------------------------
;	Register assignment is optimal.
; Stack space usage: 0 bytes.
_cvu_voutb::
;src/cvu_voutb.c:7: cv_set_write_vram_address(dest);
;	genIpush
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 3, size 2
;fetchPairLong
; peephole 64 used hl instead of iy.
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
;	genCall
	call	_cv_set_write_vram_address
	pop	af
;src/cvu_voutb.c:8: cv_voutb(value);
;	genAssign
;	AOP_EXSTK for , _G.omitFramePtr 1, sym->stack 2, size 1
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
;../libcv/include/cv_graphics.h:218: __endasm;
;	genInline
;	genInline
	cp	a, (hl)
	cp	a, (hl)
	nop
;../libcv/include/cv_graphics.h:219: cv_graphics_port = value;
;	genAssign
	out	(_cv_graphics_port), a
;src/cvu_voutb.c:8: cv_voutb(value);
;	genLabel
; peephole 158 removed unused label 00102$.
;src/cvu_voutb.c:9: }
;	genEndFunction
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
