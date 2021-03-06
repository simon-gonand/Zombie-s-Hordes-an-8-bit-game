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

void move_cursor(struct cvu_sprite *s)
{
	struct cv_controller_state cs;

	cv_get_controller_state(&cs, 0);	// Read the controller.
	
	if(cs.joystick & CV_RIGHT)	// Move cursor to the right.
	{
		int x = cvu_get_sprite_x(s);
		if(x < 240)
			x++;
		cvu_set_sprite_x(s, x);
	}
	else if(cs.joystick & CV_LEFT)	// Move the cursor to the left.
	{
		int x = cvu_get_sprite_x(s);
		if(x > 0)
			x--;
		cvu_set_sprite_x(s, x);
	}
	if(cs.joystick & CV_DOWN)	// Move the cursor down.
	{
		int y = cvu_get_sprite_y(s);
		if(y < 153)
			y++;
		cvu_set_sprite_y(s, y);
	}
	else if(cs.joystick & CV_UP)	// Move the cursor up.
	{
		int y = cvu_get_sprite_y(s);
		if(y > 0)
			y--;
		cvu_set_sprite_y(s, y);
	}

	cvu_set_sprite(SPRITES, 0, s);	// Update the cursor on the screen.
}

void nmi(void)
{
	step = true;
}

void main(void)
{
	struct cvu_sprite s;	// The sprite used for the cursor.
		
	cv_set_screen_active(false);	// Switch screen off.
	
	cv_set_color_table(0x3fff);
	cv_set_character_pattern_t(0x1fff);
	cv_set_image_table(IMAGE);
	cv_set_sprite_pattern_table(SPRITE_PATTERNS);
	cv_set_sprite_attribute_table(SPRITES);
	cv_set_screen_mode(CV_SCREENMODE_BITMAP);	// Doesn't really matter much here. We only need a screen mode that supports sprites.
	cvu_vmemset(0x2000, (CV_COLOR_BLACK << 4) | CV_COLOR_BLACK, 6144);	// Set both colors for all characters to black to get a black background.
	
	cv_set_sprite_magnification(false);
	cv_set_sprite_big(true);	// 16x16 pixel sprites.
	
	cvu_set_sprite_x(&s, 60);	// Set initial cursor position.
	cvu_set_sprite_y(&s, 60);	// Set initial cursor position.
	cvu_set_sprite_color(&s, CV_COLOR_WHITE);
	s.name = 0;	// Use sprite pattern number 0.
	cvu_memtovmemcpy(SPRITE_PATTERNS, sprite, 0x20);	// Copy sprite pattern number 0 to graphics memory.
	
	cv_set_screen_active(true);	// Switch screen on.
	
	cv_set_vint_handler(nmi);
	for(;;)
	{
		step = false;
		while(!step);	// Wait until the NMI handler sets step to true.
		move_cursor(&s);
	}
}

