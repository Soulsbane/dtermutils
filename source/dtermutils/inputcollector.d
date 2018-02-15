module dtermutils.inputcollector;

struct Prompt
{
	string variableName;
	string value;
	bool enabled;
}

struct InputCollector
{
	bool hasValueFor(const string key)
	{
		if(key in _Values)
		{
			return true;
		}

		return false;
	}

	string getValueFor(const string key)
	{
		if(hasValueFor(key))
		{
			return _Values[key].value;
		}

		return string.init;
	}

	void enablePrompt(const string name)
	{
		if(hasValueFor(name))
		{
			_Values[name].enabled = false;
		}
		else
		{
			Prompt prompt;

			prompt.enabled = true;
			_Values[name] = prompt;
		}
	}

	void disablePrompt(const string name)
	{
		if(hasValueFor(name))
		{
			_Values[name].enabled = false;
		}
		else
		{
			Prompt prompt;

			prompt.variableName = name;
			prompt.enabled = false;
			_Values[name] = prompt;
		}
	}

	bool isPromptEnabled(const string name)
	{
		if(hasValueFor(name))
		{
			return _Values[name].enabled;
		}

		return false;
	}

	CollectedValues getAllPromptValues()
	{
		return _Values;
	}

	alias CollectedValues = Prompt[string];
	private CollectedValues _Values;
}
