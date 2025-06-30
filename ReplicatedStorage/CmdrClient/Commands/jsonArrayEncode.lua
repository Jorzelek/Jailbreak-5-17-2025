-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTASwFc3BsaXQKSlNPTkVuY29kZQNSdW4EZ2FtZQtIdHRwU2VydmljZQpHZXRTZXJ2aWNlBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cARBcmdzEWpzb24tYXJyYXktZW5jb2RlMEVuY29kZXMgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBpbnRvIGEgSlNPTiBhcnJheQtEZWZhdWx0VXRpbARUeXBlBnN0cmluZwNDU1YYVGhlIGNvbW1hLXNlcGFyYXRlZCBsaXN0AAIHAgEAAAAJ+wIAAG8GAAC8BAHjAQAAAJ8EAwC8AgKeAgAAAJ8CAACCAgAAAwMBAwIDAwAQBAEYAAAAAAAAAAAAEQAAAAAFAAABAgAqowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBCgBvAgsAMAIBugQAAAD/AgAAAAAAADACAScFAAAAbwIMADACAeIGAAAAbwINADACAcQHAAAA/wIAAAEAAADiAw8AbwQQADAEAxEOAAAAbwQRADAEA7oEAAAAbwQSADAEA+IGAAAAxQIDAgEAAAAwAgHbCAAAAMACEwASAAAAMAIBFgkAAACCAQIAFAMFBAAAAEADBgMHAwgDCQMKAwsDDAMEBQYEBQYHCAkDDQMOAw8DEAUDDgQGAxEDEgMTBgABAAEAARgAAAAAAAAAAgEAAAEAAAABAAABAAABAAEBAAABAAABAAAAAPwACAAAAAABAAAAAAGju7yGypXpT5F/1hKSyW/vszX/fYh/WfSMywsQcEWZB8y5md63VE2p

-- Decompiled by Krnl

local v_u_1 = game:GetService("HttpService")
local v3 = {
	["Name"] = "json-array-encode",
	["Aliases"] = {},
	["Description"] = "Encodes a comma-separated list into a JSON array",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "CSV",
			["Description"] = "The comma-separated list"
		}
	},
	["Run"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		return v_u_1:JSONEncode(p2:split(","))
	end
}
return v3
