module dtermutils.inputcollector;

import std.stdio;
import std.string;

struct Prompt
{
	string variableName;
	string value;
	bool enabled;
}

struct InputCollector
{
	string prompt(const string promptName, const string msg, string defaultValue = string.init)
	{
		bool promptEnabled = true;
		string input;

		if(hasValueFor(promptName))
		{
			promptEnabled = values_[promptName].enabled;
		}

		if(promptEnabled)
		{
			if(defaultValue == string.init)
			{
				writef("%s: ", msg);
			}
			else
			{
				writef("%s [%s]: ", msg, defaultValue);
			}

			input = readln();

			if(input == "\x0a") // Only enter was pressed use the default value instead.
			{
				input = defaultValue;
			}

			Prompt prompt;

			prompt.variableName = promptName;
			prompt.value = input.strip;
			prompt.enabled = promptEnabled;

			values_[promptName] = prompt;
		}

		return input.strip;
	}

	bool hasValueFor(const string key)
	{
		if(key in values_)
		{
			return true;
		}

		return false;
	}

	string getValueFor(const string key)
	{
		if(hasValueFor(key))
		{
			return values_[key].value;
		}

		return string.init;
	}

	void enablePrompt(const string name)
	{
		if(hasValueFor(name))
		{
			values_[name].enabled = false;
		}
		else
		{
			Prompt prompt;

			prompt.enabled = true;
			values_[name] = prompt;
		}
	}

	void disablePrompt(const string name)
	{
		if(hasValueFor(name))
		{
			values_[name].enabled = false;
		}
		else
		{
			Prompt prompt;

			prompt.variableName = name;
			prompt.enabled = false;
			values_[name] = prompt;
		}
	}

	bool isPromptEnabled(const string name)
	{
		if(hasValueFor(name))
		{
			return values_[name].enabled;
		}

		return false;
	}

	CollectedValues getAllPromptValues()
	{
		return values_;
	}

	alias CollectedValues = Prompt[string];
	private CollectedValues values_;
}
