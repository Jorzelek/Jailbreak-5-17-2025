-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMEBU1vZGVsBlByZXNldA5GaW5kRmlyc3RDaGlsZAVEcmlmdAACBwEAAAAAFU0BADsAAAAAKwECAKkCAACCAgIAbwQBALwCAQMCAAAAnwIDAisCAgCpAwAAggMCAG8GAwC8BAIDAgAAAJ8EAwJHBAIAAAAAgKkDAAGpAwEAggMCAAQDAQMCAwMDBAACAAEYAAABAQACAAAAAQEAAgAAAAAAAAAAAwAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAEAAQAAAAABxLAfQJkRBhj2dHXUtixC1muPGG30+F2FRvkCqE85F44/F5g9+UEnMQ==

-- Decompiled by Krnl

return function(p1)
	local v2 = p1.Model
	if v2 then
		local v3 = v2:FindFirstChild("Preset")
		if v3 then
			return v3:FindFirstChild("Drift") ~= nil
		else
			return false
		end
	else
		return false
	end
end
