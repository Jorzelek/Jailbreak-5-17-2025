-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcAApEaXNwYXRjaGVyA3ZhchFJTklUX1BSSU5UX09VVFBVVANSdW4CCisBCgRnc3ViBXNwbGl0BmlwYWlycwNzdWIBIw5FdmFsdWF0ZUFuZFJ1bgVSZXBseQlDbGllbnRSdW4ETmFtZQdBbGlhc2VzC0Rlc2NyaXB0aW9uBUdyb3VwBEFyZ3MJcnVuLWxpbmVzZVNwbGl0cyBpbnB1dCBieSBuZXdsaW5lcyBhbmQgcnVucyBlYWNoIGxpbmUgYXMgaXRzIG93biBjb21tYW5kLiBUaGlzIGlzIHVzZWQgYnkgdGhlIGluaXQtcnVuIGNvbW1hbmQuC0RlZmF1bHRVdGlsBFR5cGUHRGVmYXVsdAZzdHJpbmcGU2NyaXB0FFRoZSBzY3JpcHQgdG8gcGFyc2UuAAINAgAAAAA0HAIBAA0CAwAAAACAbwIBAIICAgBNAwAKAgAAAG8FAwBvBgQAvAMDFgUAAACfAwQC8AMCAAEAAICpAgABqQIBAG8FBgBvBgcAvAMBzAgAAACfAwQCbwUHALwDA+MJAAAAnwMDAqQECwAAAKBAUgUDAJ8EAgRRBBIAjAsBAIwMAQC8CQjwDAAAAJ8JBALwCQwADQAAAE0JAAoCAAAAUgsIALwJCV4OAAAAnwkDAg4CBABSDAkAvAoA2Q8AAACfCgMBbgTt/wIAAIBvBAEAggQCABACAAAAAAAAAAADAQMCAwMDBAMFAwYDBwMIAwkDCgQAAKBAAwsDDAMNAw4ADw8BGAAAAAEAAwAAAAAAAAAAAAACAAAAAAAAAAACAAAAAAEAAAAAAAAEAAAAAAACAQAAAPgADAAQAAAAAAQAAAECACajAAAA4gAGAG8BBwAwAQC6AAAAAP8BAAAAAAAAMAEAJwEAAABvAQgAMAEA4gIAAABvAQkAMAEAxAMAAAD/AQAAAQAAAOICDABvAw0AMAMCEQoAAABvAw4AMAMCugAAAABvAw8AMAMC4gIAAABvAxAAMAMCOgsAAADFAQICAQAAADABANsEAAAAwAERADABADMFAAAAggACABIDEAMRAxIDEwMUAw8FBgABAgMEBQMVAxYDFwMYAxkFBAoAAgsDGgMbAxwDAQYAAQABAAEYAAABAAABAAAAAQAAAQAAAQABAQAAAQAAAQAAAQAAAAD7AAkAAAABAAAAAAG4EF6CYPUOE4rUNBbvHqvdpkDLCBUy929IMNWbsp6bZR65UF900UT4

-- Decompiled by Krnl

local v7 = {
	["Name"] = "run-lines",
	["Aliases"] = {},
	["Description"] = "Splits input by newlines and runs each line as its own command. This is used by the init-run command.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Script",
			["Description"] = "The script to parse.",
			["Default"] = ""
		}
	},
	["ClientRun"] = function(p1, p2)
		if #p2 == 0 then
			return ""
		end
		local v3 = p1.Dispatcher:Run("var", "INIT_PRINT_OUTPUT") ~= ""
		local v4 = p2:gsub("\n+", "\n"):split("\n")
		for _, v5 in ipairs(v4) do
			if v5:sub(1, 1) ~= "#" then
				local v6 = p1.Dispatcher:EvaluateAndRun(v5)
				if v3 then
					p1:Reply(v6)
				end
			end
		end
		return ""
	end
}
return v7
