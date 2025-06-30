-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMfA3N1YgpzdGFydHNXaXRoGkNvbmRpdGlvbiAlcSBpcyBub3QgdmFsaWQuBmZvcm1hdApEaXNwYXRjaGVyBENtZHIEVXRpbBNSdW5FbWJlZGRlZENvbW1hbmRzDkV2YWx1YXRlQW5kUnVuAANSdW4ETmFtZQdBbGlhc2VzC0Rlc2NyaXB0aW9uBUdyb3VwBEFyZ3MFcnVuaWY6UnVucyBhIGdpdmVuIGNvbW1hbmQgc3RyaW5nIGlmIGEgY2VydGFpbiBjb25kaXRpb24gaXMgbWV0LgtEZWZhdWx0VXRpbARUeXBlEWNvbmRpdGlvbkZ1bmN0aW9uCUNvbmRpdGlvbhZUaGUgY29uZGl0aW9uIGZ1bmN0aW9uBnN0cmluZwhBcmd1bWVudCZUaGUgYXJndW1lbnQgdG8gdGhlIGNvbmRpdGlvbiBmdW5jdGlvbgxUZXN0IGFnYWluc3QZVGhlIHRleHQgdG8gdGVzdCBhZ2FpbnN0LghPcHRpb25hbAdDb21tYW5kbFRoZSBjb21tYW5kIHN0cmluZyB0byBydW4gaWYgcmVxdWlyZW1lbnRzIGFyZSBtZXQuIElmIG9taXR0ZWQsIHJldHVybiB2YWx1ZSBmcm9tIGNvbmRpdGlvbiBmdW5jdGlvbiBpcyB1c2VkLgADBgIAAAAADowEAQAcBQEAvAIA8AAAAACfAgQCmgIHAAEAAAAcBQEAlQQFAbwCAPAAAAAAnwIDAIICAACCAAEAAgMBAgAAAAAAAPA/AAICARgAAAAAAAAAAQAAAAAAAgMAAAAADAUBAAAHAAABAwYFAiD7BgAAhwUGASsFBgBvBgAAUggBALwGBo0BAAAAnwYDAIIGAABSBgUAUgcDAFIIAgCfBgMCDgYQAE0HAAoCAAAATQsAngMAAABNCgueBAAAAE0JCmIFAAAATQoACgIAAADKCwQGnwkDALwHB14GAAAAnwcAAIIHAABvBwcAggcCAAgDAwMEAwUDBgMHAwgDCQMKACYLARgAAAIBAAAAAAADAAAAAgEAAAAAAAAAAAAAAAAAAAADACcAAAAACAAAAQIASaMAAADiAAEAwAECADABADoAAAAA4gEJAG8CCgAwAgG6AwAAAP8CAAAAAAAAMAIBJwQAAABvAgsAMAIB4gUAAABvAgwAMAIBxAYAAAD/AgAABAAAAOIDDgBvBA8AMAQDEQ0AAABvBBAAMAQDugMAAABvBBEAMAQD4gUAAADiBA4AbwUSADAFBBENAAAAbwUTADAFBLoDAAAAbwUUADAFBOIFAAAA4gUOAG8GEgAwBgURDQAAAG8GFQAwBgW6AwAAAG8GFgAwBgXiBQAAAOIGGABvBxIAMAcGEQ0AAABvBxkAMAcGugMAAABvBxoAMAcG4gUAAACpBwEAMAcGcRcAAADFAgMFAQAAADACAdsHAAAAwAIbABIAAAAwAgEWCAAAAIIBAgAcAwIFAQAGAAMMAw0DDgMPAxADCwUGAwQFBgcIAxEDEgMTAxQFAw0DBQMVAxYDFwMYAxkDGgMbAxwDHQUEDQMFFwMeAx8GAQIAAQEAARgAAAEAAAcBAAABAAAAAQAAAQAAAQABAQAAAQAAAQAAAgEAAAEAAAEAAAIBAAABAAABAAACAQAAAQAAAQAAAQAAAADsABgAAAAAAQAAAAACMEjm8uS5VXACjIxmQumVwtYDT/QLY4YI1B86V+pzUw/tx/HUkQutRg==

-- Decompiled by Krnl

local v_u_3 = {
	["startsWith"] = function(p1, p2)
		if p1:sub(1, #p2) == p2 then
			return p1:sub(#p2 + 1)
		end
	end
}
local v11 = {
	["Name"] = "runif",
	["Aliases"] = {},
	["Description"] = "Runs a given command string if a certain condition is met.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "conditionFunction",
			["Name"] = "Condition",
			["Description"] = "The condition function"
		},
		{
			["Type"] = "string",
			["Name"] = "Argument",
			["Description"] = "The argument to the condition function"
		},
		{
			["Type"] = "string",
			["Name"] = "Test against",
			["Description"] = "The text to test against."
		},
		{
			["Type"] = "string",
			["Name"] = "Command",
			["Description"] = "The command string to run if requirements are met. If omitted, return value from condition function is used.",
			["Optional"] = true
		}
	},
	["Run"] = function(p4, p5, p6, p7, p8)
		-- upvalues: (copy) v_u_3
		local v9 = v_u_3[p5]
		if not v9 then
			return ("Condition %q is not valid."):format(p5)
		end
		local v10 = v9(p7, p6)
		return not v10 and "" or p4.Dispatcher:EvaluateAndRun(p4.Cmdr.Util.RunEmbeddedCommands(p4.Dispatcher, p8 or v10))
	end
}
return v11
