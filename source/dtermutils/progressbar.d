/**
	Module for creating a progressbar in the terminal.
*/
module dtermutils.progressbar;

import std.stdio;
import std.math;
import std.conv;
import std.range;

import dtermutils.cursor;
import dtermutils.constants;

///Handles the creation of a progressbar.
struct ProgressBar
{
	/**
		Initializes and creates the initial progressbar.

		Params:
			total = The number of items that are being processed.
			prefix = The text printed at the left side of the progressbar.
			suffix = The text printed at the right side of the progressbar.
			barLength = How wide the bar should be.
	*/
	void create(const size_t total, const string prefix = "Progress", const string suffix = "Complete",
		const size_t barLength = 100)
	{
		total_ = total;
		prefix_ = prefix;
		suffix_ = suffix;
		barLength_ = barLength;

		update(0);
	}

	/**
		Updates the progressbar.

		Params:
			iteration = The current item being processed. Ex. 34 of 83. The 34 portion.
	*/
	void update(size_t iteration)
	{
		immutable auto filledLength = to!size_t(round(barLength_ * iteration / to!float(total_)));
		immutable auto percents = round(100.00 * (iteration / to!float(total_)));
		immutable auto bar = to!string('█'.repeat(filledLength)) ~ to!string('░'.repeat(barLength_ - filledLength));

		hideCursor();
		writef("\r%s %s %s%s %s", prefix_, bar, percents, '%', suffix_);
		stdout.flush;

		if(iteration == total_)
		{
			clearLine();
			writeln;
			showCursor();
		}
	}

	/**
		Clears the line. Imagine that!
	*/
	void clearLine() //FIXME: Probably should be a module function.
	{
		stdout.flush();
		write(CLEAR_LINE);
	}

private:
	size_t total_;
	size_t barLength_;
	string prefix_;
	string suffix_;
}
