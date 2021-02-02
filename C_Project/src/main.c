#include "cv.h"
#include "cvu.h"

/* VRAM map
   0x0000 - 0x17ff character pattern table
   0x1800 - 0x1aff image table
   0x2000 - 0x37ff color table
   0x3800 - 0x3bff sprite pattern table
   0x3c00 - 0x3fff sprite attribute table
*/

const cv_vmemp IMAGE = 0x1800;
const cv_vmemp SPRITES = 0x3c00;
const cv_vmemp SPRITE_PATTERNS = 0x3800;

volatile bool step;	// Has to be volatile since it's modified in the NMI handler.

extern uint8_t sprite[1][];

void nmi(void) {
	step = true;
}

void main(void) {
	struct cvu_sprite s[2];

	cv_set_screen_active(false); // Switch screen off in order to make some modification to the screen

	// Take the default values of the VRAM that are use in the demos of the library
	cv_set_color_table(0x3fff);
	cv_set_character_pattern_t(0x1fff);
	cv_set_image_table(IMAGE);
	cv_set_sprite_pattern_table(SPRITE_PATTERNS);
	cv_set_sprite_attribute_table(SPRITES);
	cv_set_screen_mode(CV_SCREENMODE_4); // It is the screen mode 2_2
	cvu_vmemset(0x2000, (CV_COLOR_BLACK << 4) | CV_COLOR_BLACK, 6144);

	cv_set_sprite_magnification(false);
	cv_set_sprite_big(true);	// 16x16 pixel sprites.

	cvu_set_sprite_x(&s[0], 128);
	cvu_set_sprite_y(&s[0], 96);
	cvu_set_sprite_color(&s[0], CV_COLOR_WHITE);
	s[0].name = 0; // Use sprite pattern number 0.

	cvu_memtovmemcpy(SPRITE_PATTERNS, sprite, 0x20);	// Copy sprite pattern number 0 to graphics memory.
	
	cvu_set_sprite_x(&s[1], 10);
	cvu_set_sprite_y(&s[1], 10);
	cvu_set_sprite_color(&s[1], CV_COLOR_BLUE);
	s[1].name = 0; // Use sprite pattern number 0.

	cv_set_screen_active(true);	// Switch screen on.

	cv_set_vint_handler(nmi);
	for (;;)
	{
		step = false;
		while (!step);	// Wait until the NMI handler sets step to true.
		cvu_set_sprite(SPRITES, 0, &s[0]);	// Update the cursor on the screen.
		cvu_set_sprite(SPRITES, 1, &s[1]);	// Update the cursor on the screen.
	}
}