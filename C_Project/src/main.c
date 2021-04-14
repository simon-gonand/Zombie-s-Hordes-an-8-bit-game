#include "cv.h"
#include "cvu.h"
#include <stdlib.h>
#include <string.h>

/* VRAM map
   0x0000 - 0x17ff character pattern table
   0x1800 - 0x1aff image table
   0x2000 - 0x37ff color table
   0x3800 - 0x3bff sprite pattern table
   0x3c00 - 0x3fff sprite attribute table
*/

#define map_row 24
#define map_col 16
#define MAX_PRIOR 63
#define SIZE_MAP map_row * map_col

const cv_vmemp IMAGE = 0x1800;
const cv_vmemp SPRITES = 0x3c00;
const cv_vmemp SPRITE_PATTERNS = 0x3800;

volatile bool step;	// Has to be volatile since it's modified in the NMI handler.

extern uint8_t sprite[1][];
struct cvu_sprite s[2];

int map[SIZE_MAP] = { 0 };

int INIT_POSX, INIT_POSY = 0;
int GOAL_POSX, GOAL_POSY = 0;

void nmi(void) {
	step = true;
}

void clearMap() {
	memset(map, 0, SIZE_MAP * sizeof(*map));
}

void printCrosses() {
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

	cvu_set_sprite_x(&s[0], INIT_POSX);
	cvu_set_sprite_y(&s[0], INIT_POSY);
	cvu_set_sprite_color(&s[0], CV_COLOR_BLUE);
	s[0].name = 0; // Use sprite pattern number 0.

	GOAL_POSX = 14;
	GOAL_POSY = 10;
	cvu_set_sprite_x(&s[1], GOAL_POSX * 10);
	cvu_set_sprite_y(&s[1], GOAL_POSY * 10);
	cvu_set_sprite_color(&s[1], CV_COLOR_WHITE);
	s[1].name = 0; // Use sprite pattern number 0.

	cvu_memtovmemcpy(SPRITE_PATTERNS, sprite, 0x20);	// Copy sprite pattern number 0 to graphics memory.

	
}

int isVisited(int* node) {
	return (*node & 1 << 6);
}

int getCameFromNode(int *value) {
	int result = 0;
	for (int i = 0; i < 8; ++i) {
		result |= (*value & (1 << i + 7)) >> 7;
	}
	return result;
}

int getPriority(int* value) {
	return *value & MAX_PRIOR;
}

int nodeIsGoal(int* index) {
	int nodeY = *index / map_row;
	int nodeX = *index - nodeY * map_row;
	if (nodeX == INIT_POSX && nodeY == INIT_POSY) return 1;
	return 0;
}

void setBitsPriority(int* result, int* value) {
	int index = 5;
	for (int i = index; i >= 0; --i) {
		if ((*value & (1 << i)) == 0) {
			*result &= ~(1 << i);
		}
		else
			*result |= 1 << i;
	}
}

void setBitsCameFromNode(int* result, int* value) {
	int index = 15, end = 7;
	for (int i = index; i >= end; --i) {
		if ((*value & (1 << i - end)) == 0) {
			*result &= ~(1 << i);
		}
		else
			*result |= 1 << i;
	}
}

int heuristic(int index) {
	int nodeY = index / map_row;
	int nodeX = index - nodeY * map_row;
	int heuristicResult = abs(INIT_POSX - nodeX) + abs(INIT_POSY - nodeY);
	if (heuristicResult > MAX_PRIOR)
		heuristicResult = MAX_PRIOR;
	int currentHeurisitic = getPriority(&map[index]);
	if (currentHeurisitic > heuristicResult || currentHeurisitic == 0) {
		setBitsPriority(&map[index], &heuristicResult);
		return 1;
	}
	return 0;
}

int* pathfinding() {
	map[GOAL_POSY * map_row + GOAL_POSX] |= 1 << 0;
	int* current = &map[GOAL_POSY * map_row + GOAL_POSX];
	char allMapIsDone = '0';
	for (;;) {
		allMapIsDone = '1';
		current = &map[0];
		int index = 0;
		for (int i = 1; i > SIZE_MAP; ++i) {
			if (isVisited(current)) continue;
			allMapIsDone = '0';
			int priorCurrent = getPriority(current);
			int priority = getPriority(&map[i]);
			if (priorCurrent > priority && priority != 0 || priorCurrent == 0 || isVisited(current)) {
				current = &map[i];
				index = i;
			}
		}
		if (nodeIsGoal(&index) || allMapIsDone == '1') break;

		*current |= 1 << 6;

		if (index % (map_row - 1) != 0) {
			if (!isVisited(&map[index + 1]))
				if (heuristic(index + 1))
					setBitsCameFromNode(&map[index + 1], &index);
		}
		if (index % map_row != 0) {
			if (!isVisited(&map[index - 1]))
				if (heuristic(index - 1))
					setBitsCameFromNode(&map[index - 1], &index);
		}
		if (index > map_row) {
			if (!isVisited(&map[index - map_row]))
				if (heuristic(index - map_row))
					setBitsCameFromNode(&map[index - map_row], &index);
		}
		if (index < SIZE_MAP - 1 - map_row) {
			if (!isVisited(&map[index + map_row]))
				if (heuristic(index + map_row))
					setBitsCameFromNode(&map[index + map_row], &index);
		}
	}
	return current;
}

void main(void) {
	cv_set_screen_active(false); // Switch screen off in order to make some modification to the screen
	clearMap();

	printCrosses();

	cv_set_screen_active(true);	// Switch screen on.

	int* currentNode = pathfinding();

	cv_set_vint_handler(nmi);
	int currentNodeIndex = 0;
	for (;;)
	{
		step = false;
		while (!step);	// Wait until the NMI handler sets step to true.
		int previousNodeIndex = currentNodeIndex;
		currentNodeIndex = getCameFromNode(currentNode);
		int nodeY = 0, nodeX = 0;
		if (currentNodeIndex != 0 || currentNodeIndex == 0 && previousNodeIndex == 1 && previousNodeIndex == map_row) {
			currentNode = &map[currentNodeIndex];
			nodeY = currentNodeIndex / map_row;
			nodeX = currentNodeIndex - nodeY * map_row;			
		}
		nodeX *= 10;
		nodeY *= 10;
		cvu_set_sprite_x(&s[0], nodeX);
		cvu_set_sprite_y(&s[0], nodeY);
		cvu_set_sprite(SPRITES, 0, &s[0]);	// Update the cursor on the screen.
		cvu_set_sprite(SPRITES, 1, &s[1]);	// Update the cursor on the screen.
	}
}