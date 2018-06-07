module dtermutils.prompts;

import std.stdio;
import std.string;
import std.range;
import std.conv;

/**
	Pauses the program until the enter key is pressed

	Params:
		msg = The message to display.
*/
void pause(const string msg = "Press enter/return to continue...")
{
	write(msg);
	getchar();
}

/**
	A simple prompt for retrieving an answer etc.

	Params:
		T = The type to convert the return value to.
		message = The prompt message.

	Returns:
		The value converted to T.
*/
T prompt(T = string)(const string message = "Answer: ")
{
	write(message);
	immutable auto answer = readln();

	return answer.chomp.to!T;
}

/**
	Display a prompt that contains a yes(Y/y) or no instruction.

	Params:
		msg = The prompt message.

	Returns:
		True if input is 'y' or 'Y'. False otherwise.
*/
bool confirmationPrompt(const string msg = "Do you wish to continue(y/n): ")
{
	write(msg);
	immutable auto answer = readln();

	if(answer.front == 'Y' || answer.front == 'y')
	{
		return true;
	}

	return false;
}

unittest
{
	//confirmationPrompt();
	//pause();
	//size_t number = prompt!size_t("Enter a number: ");
	//++number;
	//writeln("A number: ", number);
}
