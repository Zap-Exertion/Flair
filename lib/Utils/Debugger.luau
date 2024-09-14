-- FOLDERS >
-- DEPENDENCIES >
local Messages = require(script.Parent.Messages)

-- VARIABLES >
local Debugger = {
	MessageLink = "https://zap-exertion.github.io/flair/",
}

-- FUNCTIONS >
function Debugger.Format(trace: string, messageId: string, ...: any): string
	local FoundMessage = Messages[messageId] or "UnknownId"
	local FormattedMessage = string.format(FoundMessage, ...)
	local MainString = `[Flair] {FormattedMessage}\nLearn: {Debugger.MessageLink}\nTrace: {trace}`

	-- Replaces a new line character to have 4 escape characters (to form a tab-space; \t)
	return string.gsub(MainString, "\n", "\n\t\t\t\t")
end

function Debugger.Error(messageId: string, ...: any)
	error(Debugger.Format(debug.traceback(nil, 3), messageId, ...), 0)
end

function Debugger.Warn(messageId: string, ...: any)
	warn(Debugger.Format(debug.traceback(nil, 3), messageId, ...))
end

-- RETURNING >
return Debugger
