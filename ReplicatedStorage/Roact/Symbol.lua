-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBHR5cGUGc3RyaW5nLFN5bWJvbHMgbXVzdCBiZSBjcmVhdGVkIHVzaW5nIGEgc3RyaW5nIG5hbWUhBmFzc2VydAhuZXdwcm94eQpTeW1ib2woJXMpBmZvcm1hdAxnZXRtZXRhdGFibGUKX190b3N0cmluZwVuYW1lZAADAQABAAAAAvsAAACCAAIAAAAYAAEYAAAZAAAAAAUBAAAABwAAAQMCFQIiuygAA1IEAACkAwEAAAAAQJ8DAgLwAwIAAgAAAKkCAAGpAgEAgQECBAMAAABvAwMApAEFAAAAQECfAQMBpAEHAAAAYECpAgEAnwECAm8CCABSBAAAvAICjQkAAACfAgMCuzwBA1IEAQCkAwsAAACgQJ8DAgLZBAAAEgACADAEAwYMAAAAggECAA0DAQQAAABAAwIDAwMEBAAAQEADBQQAAGBAAwYDBwMIBAAAoEADCQEAEQoBGAAAAAAAAAAAAAAAAAAAAAIAAAACAAAAAAIAAAAAAAAAAAQSAAAAAAIAAAECAAejAAAA/wABAAAAAADAAQAAMAEAUQEAAACCAAIAAgYBAwoBAQEAARgACAAIAAAOAQAAAAAC8pd43N17NB3AUxJIkhqVPPijwo8mbF49vG/IlLoI17NtQFbNZjCgaw==

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
	end
}
