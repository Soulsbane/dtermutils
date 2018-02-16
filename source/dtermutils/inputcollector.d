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
