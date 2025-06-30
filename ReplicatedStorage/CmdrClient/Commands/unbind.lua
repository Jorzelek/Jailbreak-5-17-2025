-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSCkNNRFJfQmluZHMIR2V0U3RvcmUKRGlzY29ubmVjdBtVbmJvdW5kIGNvbW1hbmQgZnJvbSBpbnB1dC4YVGhhdCBpbnB1dCB3YXNuJ3QgYm91bmQuCUNsaWVudFJ1bgROYW1lB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwZ1bmJpbmQrVW5iaW5kcyBhbiBpbnB1dCBwcmV2aW91c2x5IGJvdW5kIHdpdGggQmluZAtEZWZhdWx0VXRpbARUeXBlJXVzZXJJbnB1dCAhIGJpbmRhYmxlUmVzb3VyY2UgQCBwbGF5ZXIJSW5wdXQvS2V5K1RoZSBrZXkgb3IgaW5wdXQgdHlwZSB5b3UnZCBsaWtlIHRvIHVuYmluZC4AAgUCAAAAABBvBAAAvAIAVQEAAACfAgMChwMCAQ4DCACHAwIBvAMDGgIAAACfAwIBxgMAAGoDAgFvAwMAggMCAG8DBACCAwIABQMBAwIDAwMEAwUADgYBGAAAAAACAAEAAAABAAEAAgAPAAAAAAQAAAECACOjAAAA4gAGAG8BBwAwAQC6AAAAAP8BAAAAAAAAMAEAJwEAAABvAQgAMAEA4gIAAABvAQkAMAEAxAMAAAD/AQAAAQAAAOICCwBvAwwAMAMCEQoAAABvAw0AMAMCugAAAABvAw4AMAMC4gIAAADFAQICAQAAADABANsEAAAAwAEPADABADMFAAAAggACABADBwMIAwkDCgMLAwYFBgABAgMEBQMMAw0DDgMPBQMKAAIDEAMRAxIGAAEAAQABGAAAAQAAAQAAAAEAAAEAAAEAAQEAAAEAAAEAAAAA/AAIAAAAAQAAAAAB2YNrbB6kZ/jrRwH46AUBl+ErR3/i8VP+vrs9KN+V/762naPfZRHeXQ==

-- Decompiled by Krnl

local v4 = {
	["Name"] = "unbind",
	["Aliases"] = {},
	["Description"] = "Unbinds an input previously bound with Bind",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "userInput ! bindableResource @ player",
			["Name"] = "Input/Key",
			["Description"] = "The key or input type you\'d like to unbind."
		}
	},
	["ClientRun"] = function(p1, p2)
		local v3 = p1:GetStore("CMDR_Binds")
		if not v3[p2] then
			return "That input wasn\'t bound."
		end
		v3[p2]:Disconnect()
		v3[p2] = nil
		return "Unbound command from input."
	end
}
return v4
