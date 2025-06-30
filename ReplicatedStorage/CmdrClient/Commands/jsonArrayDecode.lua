-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVCkpTT05EZWNvZGUEdHlwZQV0YWJsZQZjb25jYXQBLANSdW4EZ2FtZQtIdHRwU2VydmljZQpHZXRTZXJ2aWNlBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cARBcmdzEWpzb24tYXJyYXktZGVjb2RlMERlY29kZXMgYSBKU09OIEFycmF5IGludG8gYSBjb21tYS1zZXBhcmF0ZWQgbGlzdAtEZWZhdWx0VXRpbARUeXBlBnN0cmluZwRKU09OD1RoZSBKU09OIGFycmF5LgACBgIBAAAAGPsCAABSBAEAvAICywAAAACfAgMCuygCA1IEAgCkAwIAAAAQQJ8DAgLwAwcAAwAAAP8DAAABAAAAUgQCAMUDBAIBAAAAUgIDAKQDBQAAEDCAUgQCAG8FBgCfAwMAggMAAAcDAQMCBAAAEEADAwMEBAAQMIADBQAQBgEYAAAAAAACAAAAAAAAAQAAAAAAAwAAAAAAEQAAAAAFAAABAgAqowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBCgBvAgsAMAIBugQAAAD/AgAAAAAAADACAScFAAAAbwIMADACAeIGAAAAbwINADACAcQHAAAA/wIAAAEAAADiAw8AbwQQADAEAxEOAAAAbwQRADAEA7oEAAAAbwQSADAEA+IGAAAAxQIDAgEAAAAwAgHbCAAAAMACEwASAAAAMAIBFgkAAACCAQIAFAMHBAAAAEADCAMJAwoDCwMMAw0DDgMGBQYEBQYHCAkDDwMQAxEDEgUDDgQGAxMDFAMVBgABAAEAARgAAAAAAAAAAgEAAAEAAAABAAABAAABAAEBAAABAAABAAAAAPwACAAAAAABAAAAAAGkuH1dMzT7RpZ8F8kMPyNsCh/H94SAQjuDJu0n+AzOr57Nn+jC8gEk

-- Decompiled by Krnl

local v_u_1 = game:GetService("HttpService")
local v5 = {
	["Name"] = "json-array-decode",
	["Aliases"] = {},
	["Description"] = "Decodes a JSON Array into a comma-separated list",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "JSON",
			["Description"] = "The JSON array."
		}
	},
	["Run"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1:JSONDecode(p2)
		local v4 = type(v3) ~= "table" and { v3 } or v3
		return table.concat(v4, ",")
	end
}
return v5
