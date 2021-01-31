;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (CYGWIN)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _nmi
	.globl _move_cursor
	.globl _cvu_get_sprite_y
	.globl _cvu_set_sprite_y
	.globl _cvu_get_sprite_x
	.globl _cvu_set_sprite_x
	.globl _cvu_vmemset
	.globl _cvu_memtovmemcpy
	.globl _cv_set_vint_handler
	.globl _cv_memtovmemcpy_slow
	.globl _cv_set_write_vram_address
	.globl _cv_set_sprite_magnification
	.globl _cv_set_sprite_big
	.globl _cv_set_sprite_attribute_table
	.globl _cv_set_sprite_pattern_table
	.globl _cv_set_character_pattern_t
	.globl _cv_set_color_table
	.globl _cv_set_image_table
	.globl _cv_set_screen_mode
	.globl _cv_set_screen_active
	.globl _cv_get_controller_state
	.globl _s
	.globl _step
	.globl _SPRITE_PATTERNS
	.globl _SPRITES
	.globl _IMAGE
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_cv_graphics_port	=	0x00be
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_step::
	.ds 1
_s::
	.ds 128
_move_cursor_i_65536_103:
	.ds 1
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
;main.c:24: static unsigned char i = 0;
	ld	iy, #_move_cursor_i_65536_103
	ld	0 (iy), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:22: void move_cursor(void)
;	---------------------------------
; Function move_cursor
; ---------------------------------
_move_cursor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;main.c:27: cv_get_controller_state(&cs, 0);	// Read the controller.
	ld	hl, #1
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	c, l
	ld	b, h
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_cv_get_controller_state
	pop	af
	inc	sp
;main.c:29: if(cs.joystick & CV_RIGHT)	// Move cursor to the right.
	ld	a, -6 (ix)
	add	a, #0x01
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
;main.c:31: int x = cvu_get_sprite_x(&s[i]);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
;main.c:29: if(cs.joystick & CV_RIGHT)	// Move cursor to the right.
	bit	3, -9 (ix)
	jr	Z,00108$
;main.c:31: int x = cvu_get_sprite_x(&s[i]);
	ld	a, #<(_s)
	add	a, -2 (ix)
	ld	c, a
	ld	a, #>(_s)
	adc	a, -1 (ix)
	ld	b, a
	push	bc
	call	_cvu_get_sprite_x
	pop	af
	ld	-2 (ix), l
	ld	-1 (ix), h
;main.c:32: if(x < 240)
	ld	a, -2 (ix)
	sub	a, #0xf0
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;main.c:33: x++;
	inc	-2 (ix)
	jr	NZ,00216$
	inc	-1 (ix)
00216$:
00102$:
;main.c:34: cvu_set_sprite_x(&s[i], x);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_s
	add	hl, de
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	push	bc
	push	hl
	call	_cvu_set_sprite_x
	pop	af
	pop	af
	jr	00109$
00108$:
;main.c:36: else if(cs.joystick & CV_LEFT)	// Move the cursor to the left.
	bit	2, -9 (ix)
	jr	Z,00109$
;main.c:38: int x = cvu_get_sprite_x(&s[i]);
	ld	bc, #_s+0
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	add	hl, bc
	push	hl
	call	_cvu_get_sprite_x
	pop	af
	ex	de,hl
;main.c:39: if(x > 0)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00218$
	xor	a, #0x80
00218$:
	jp	P, 00104$
;main.c:40: x--;
	dec	de
00104$:
;main.c:41: cvu_set_sprite_x(&s[i], x);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	de
	push	hl
	call	_cvu_set_sprite_x
	pop	af
	pop	af
00109$:
;main.c:43: if(cs.joystick & CV_DOWN)	// Move the cursor down.
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
;main.c:31: int x = cvu_get_sprite_x(&s[i]);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ex	de,hl
;main.c:43: if(cs.joystick & CV_DOWN)	// Move the cursor down.
	bit	1, c
	jr	Z,00117$
;main.c:45: int y = cvu_get_sprite_y(&s[i]);
	ld	hl, #_s
	add	hl, de
	push	hl
	call	_cvu_get_sprite_y
	pop	af
	ld	c, l
	ld	b, h
;main.c:46: if(y < 153)
	ld	a, c
	sub	a, #0x99
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00111$
;main.c:47: y++;
	inc	bc
00111$:
;main.c:48: cvu_set_sprite_y(&s[i], y);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_s
	add	hl, de
	push	bc
	push	hl
	call	_cvu_set_sprite_y
	pop	af
	pop	af
	jr	00118$
00117$:
;main.c:50: else if(cs.joystick & CV_UP)	// Move the cursor up.
	bit	0, c
	jr	Z,00118$
;main.c:52: int y = cvu_get_sprite_y(&s[i]);
	ld	hl, #_s
	add	hl, de
	push	hl
	call	_cvu_get_sprite_y
	pop	af
	ld	c, l
	ld	b, h
;main.c:53: if(y > 0)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00221$
	xor	a, #0x80
00221$:
	jp	P, 00113$
;main.c:54: y--;
	dec	bc
00113$:
;main.c:55: cvu_set_sprite_y(&s[i], y);
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_s
	add	hl, de
	push	bc
	push	hl
	call	_cvu_set_sprite_y
	pop	af
	pop	af
00118$:
;main.c:58: cvu_set_sprite(SPRITES, i, &s[i]);	// Update the cursor on the screen.
	ld	bc, #_s+0
	ld	iy, #_move_cursor_i_65536_103
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	l, 0 (iy)
	ld	bc, (_SPRITES)
;../../include/cvu_graphics.h:83: cv_set_write_vram_address((base) + (number) * 0x4);
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	call	_cv_set_write_vram_address
;../../include/cvu_graphics.h:84: cv_memtovmemcpy_slow((sprite), 4);
	ld	hl, #0x0004
	ex	(sp),hl
	push	de
	call	_cv_memtovmemcpy_slow
	pop	af
	pop	af
;main.c:61: if(cs.joystick & CV_FIRE_0)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	bit	4, -1 (ix)
	jr	Z,00128$
;main.c:63: do
	ld	c, -6 (ix)
	ld	b, -5 (ix)
00119$:
;main.c:64: cv_get_controller_state(&cs, 0);
	ld	e, c
	ld	d, b
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cv_get_controller_state
	pop	af
	inc	sp
	pop	bc
;main.c:65: while(cs.joystick & CV_FIRE_0);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	bit	4, (hl)
	jr	NZ,00119$
;main.c:66: i++;
	ld	hl, #_move_cursor_i_65536_103+0
	inc	(hl)
	jr	00129$
00128$:
;main.c:68: else if(cs.joystick & CV_FIRE_1)
	bit	5, -1 (ix)
	jr	Z,00129$
;main.c:70: do
	ld	c, -6 (ix)
	ld	b, -5 (ix)
00122$:
;main.c:71: cv_get_controller_state(&cs, 0);
	ld	e, c
	ld	d, b
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_cv_get_controller_state
	pop	af
	inc	sp
	pop	bc
;main.c:72: while(cs.joystick & CV_FIRE_1);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	bit	5, (hl)
	jr	NZ,00122$
;main.c:73: i--;
	ld	hl, #_move_cursor_i_65536_103+0
	dec	(hl)
00129$:
;main.c:76: if(i == 32)
	ld	iy, #_move_cursor_i_65536_103
	ld	a, 0 (iy)
	sub	a, #0x20
	jr	NZ,00131$
;main.c:77: i = 0;
	ld	0 (iy), #0x00
00131$:
;main.c:78: if(i == 255)
	ld	iy, #_move_cursor_i_65536_103
	ld	a, 0 (iy)
	inc	a
	jr	NZ,00135$
;main.c:79: i = 31;
	ld	0 (iy), #0x1f
00135$:
;main.c:80: }
	ld	sp, ix
	pop	ix
	ret
_IMAGE:
	.dw #0x1800
_SPRITES:
	.dw #0x1b80
_SPRITE_PATTERNS:
	.dw #0x3800
;main.c:82: void nmi(void)
;	---------------------------------
; Function nmi
; ---------------------------------
_nmi::
;main.c:84: step = true;
	ld	hl,#_step + 0
	ld	(hl), #0x01
;main.c:85: }
	ret
;main.c:87: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:91: cv_set_screen_active(false);	// Switch screen off.
	xor	a, a
	push	af
	inc	sp
	call	_cv_set_screen_active
	inc	sp
;main.c:93: cv_set_color_table(0x3fff);
	ld	hl, #0x3fff
	push	hl
	call	_cv_set_color_table
;main.c:94: cv_set_character_pattern_t(0x1fff);
	ld	hl, #0x1fff
	ex	(sp),hl
	call	_cv_set_character_pattern_t
	pop	af
;main.c:95: cv_set_image_table(IMAGE);
	ld	hl, (_IMAGE)
	push	hl
	call	_cv_set_image_table
	pop	af
;main.c:96: cv_set_sprite_pattern_table(SPRITE_PATTERNS);
	ld	hl, (_SPRITE_PATTERNS)
	push	hl
	call	_cv_set_sprite_pattern_table
	pop	af
;main.c:97: cv_set_sprite_attribute_table(SPRITES);
	ld	hl, (_SPRITES)
	push	hl
	call	_cv_set_sprite_attribute_table
;main.c:98: cv_set_screen_mode(CV_SCREENMODE_BITMAP);	// Doesn't really matter much here. We only need a screen mode that supports sprites.
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	call	_cv_set_screen_mode
	inc	sp
;main.c:99: cvu_vmemset(0x2000, (CV_COLOR_BLACK << 4) | CV_COLOR_BLACK, 6144);	// Set both colors for all characters to black to get a black background.
	ld	hl, #0x1800
	push	hl
	ld	hl, #0x0011
	push	hl
	ld	hl, #0x2000
	push	hl
	call	_cvu_vmemset
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;main.c:101: cv_set_sprite_magnification(false);
	xor	a, a
	push	af
	inc	sp
	call	_cv_set_sprite_magnification
	inc	sp
;main.c:102: cv_set_sprite_big(true);	// 16x16 pixel sprites.
	ld	a, #0x01
	push	af
	inc	sp
	call	_cv_set_sprite_big
	inc	sp
;main.c:104: cvu_memtovmemcpy(SPRITE_PATTERNS, sprite, 0x20);	// Copy sprite pattern number 0 to graphics memory.
	ld	bc, #_sprite+0
	ld	hl, (_SPRITE_PATTERNS)
	ld	de, #0x0020
	push	de
	push	bc
	push	hl
	call	_cvu_memtovmemcpy
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;main.c:106: for(i = 0; i < 32; i++)
	ld	hl, #0x0000
	ex	(sp), hl
00108$:
;main.c:108: cvu_set_sprite_x(&s[i], i * 4);	// Set initial cursor position.
	pop	hl
	push	hl
	add	hl, hl
	add	hl, hl
	ld	a, #<(_s)
	add	a, l
	ld	e, a
	ld	a, #>(_s)
	adc	a, h
	ld	d, a
	ld	c, e
	ld	b, d
	push	hl
	push	hl
	push	bc
	call	_cvu_set_sprite_x
	pop	af
	pop	af
	pop	hl
;main.c:109: cvu_set_sprite_y(&s[i], i * 4);	// Set initial cursor position.
	ld	c, e
	ld	b, d
	push	hl
	push	bc
	call	_cvu_set_sprite_y
	pop	af
	pop	af
;main.c:110: cvu_set_sprite_color(&s[i], CV_COLOR_WHITE);
	ld	c, e
	ld	b, d
;../../include/cvu_graphics.h:116: sprite->tag = (sprite->tag & 0x80) | color;
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	and	a, #0x80
	or	a, #0x0f
	ld	(bc), a
;main.c:111: s[i].name = 0;	// Use sprite pattern number 0.
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;main.c:112: cvu_set_sprite(SPRITES, i, &s[i]);
	ld	l, -2 (ix)
	ld	bc, (_SPRITES)
;../../include/cvu_graphics.h:83: cv_set_write_vram_address((base) + (number) * 0x4);
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	call	_cv_set_write_vram_address
;../../include/cvu_graphics.h:84: cv_memtovmemcpy_slow((sprite), 4);
	ld	hl, #0x0004
	ex	(sp),hl
	push	de
	call	_cv_memtovmemcpy_slow
	pop	af
	pop	af
;main.c:106: for(i = 0; i < 32; i++)
	inc	-2 (ix)
	jr	NZ,00140$
	inc	-1 (ix)
00140$:
	ld	a, -2 (ix)
	sub	a, #0x20
	ld	a, -1 (ix)
	sbc	a, #0x00
	jr	C,00108$
;main.c:115: cv_set_screen_active(true);	// Switch screen on.
	ld	a, #0x01
	push	af
	inc	sp
	call	_cv_set_screen_active
	inc	sp
;main.c:117: cv_set_vint_handler(nmi);
	ld	hl, #_nmi
	push	hl
	call	_cv_set_vint_handler
	pop	af
00110$:
;main.c:120: step = false;
	ld	hl,#_step + 0
	ld	(hl), #0x00
;main.c:121: while(!step);	// Wait until the NMI handler sets step to true.
00102$:
	ld	hl,#_step+0
	bit	0, (hl)
	jr	Z,00102$
;main.c:122: move_cursor();
	call	_move_cursor
;main.c:124: }
	jr	00110$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
