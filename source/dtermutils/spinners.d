module dtermutils.spinners;

import std.stdio;
import std.traits;

struct Spinner
{
	string[] phases_ =  ["-", "\\", "|", "/"];
}

struct LineSpinner
{

	string[] phases_ = ["⎺", "⎻", "⎼", "⎽", "⎼", "⎻"];
	Spinner spin_;
	alias spin_ this;
}

