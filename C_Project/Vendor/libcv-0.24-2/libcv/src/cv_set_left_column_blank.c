#include "cv_graphics.h"

#include "cv_support.h"

extern uint8_t cv_vdpreg[2];

void cv_set_left_column_blank(bool status)
{
	cv_vdpout(0x0, cv_vdpreg[0] = (status ? 0x20 : 0x0) | (cv_vdpreg[0] & ~0x20));
}

