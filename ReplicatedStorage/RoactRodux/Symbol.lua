-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMBHR5cGUGc3RyaW5nLFN5bWJvbHMgbXVzdCBiZSBjcmVhdGVkIHVzaW5nIGEgc3RyaW5nIG5hbWUhBmFzc2VydAhuZXdwcm94eQpTeW1ib2woJXMpBmZvcm1hdAxnZXRtZXRhdGFibGUKX190b3N0cmluZwVuYW1lZA5Vbm5hbWVkIFN5bWJvbAd1bm5hbWVkAAUBAAEAAAAC+wAAAIIAAgAAABYAARgAABcAAAAABQEAAAAHAAABAwIVAiK7KAADUgQAAKQDAQAAAABAnwMCAvADAgACAAAAqQIAAakCAQCBAQIEAwAAAG8DAwCkAQUAAABAQJ8BAwGkAQcAAABgQKkCAQCfAQICbwIIAFIEAAC8AgKNCQAAAJ8CAwK7PAEDUgQBAKQDCwAAAKBAnwMCAtkEAAASAAIAMAQDBgwAAACCAQIADQMBBAAAAEADAgMDAwQEAABAQAMFBAAAYEADBgMHAwgEAACgQAMJAQAPCgEYAAAAAAAAAAAAAAAAAAAAAgAAAAIAAAAAAgAAAAAAAAAABBAAAAAAAQAAAAAAAm8AAACCAAIAAQMLACQAARgAACUAAAAAAwAAAAAADaQAAQAAAABAqQEBAJ8AAgK7PAADUgIAAKQBAwAAACBAnwECAsACBAAwAgEGBQAAAIIAAgAGAwUEAAAAQAMIBAAAIEAGAgMJAQIhDAEYAAAAAAIAAAAAAAAABCIAAAAAAgAAAQIACqMAAAD/AAIAAAAAAMABAAAwAQBRAQAAAMABAgAwAQDtAwAAAIIAAgAEBgEDCgYDAwwCAQMBAAEYAAYACAAAEgAACgEAAAAABG2stJHKZb+2X2jeBZcdrNpmRORbPNeN5E8POPnPK6rTdx2WhwA70J0=

-- Decompiled by Krnl

return {
	["named"] = function(p1)
		local v2 = type(p1) == "string"
		assert(v2, "Symbols must be created using a string name!")
		local v3 = newproxy(true)
		local v_u_4 = ("Symbol(%s)"):format(p1)
		getmetatable(v3).__tostring = function()
			-- upvalues: (copy) v_u_4
			return v_u_4
		end
		return v3
	end,
	["unnamed"] = function()
		local v5 = newproxy(true)
		getmetatable(v5).__tostring = function()
			return "Unnamed Symbol"
		end
		return v5
	end
}
