/**
	Provides functions for showing/hiding the mouse cursor in a terminal.
*/
module dtermutils.cursor;

import std.stdio : write;

import dtermutils.constants;

/**
	Shows the cursor.
*/
void showCursor()
{
	write(SHOW_CURSOR);
}

/**
	Hides the cursor.
*/
void hideCursor()
{
	write(HIDE_CURSOR);
}
