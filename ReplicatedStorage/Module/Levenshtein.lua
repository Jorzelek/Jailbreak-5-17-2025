-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMFBnN0cmluZwNsZW4EYnl0ZQRtYXRoA21pbgACFAIAAAAAV7srAANSAwAApAICAAAEAICfAgICuysBA1IEAQCkAwIAAAQAgJ8DAgL/BAAAAAAAAMYFAAANAgIAAwAAgIIDAgANAwIAAwAAgIICAgCaAAMAAQAAAIwGAACCBgIAjAgAAFIGAgCMBwEAqAYHAP8JAAAAAAAAagkECIcJBAiMCgAAaggJCosG+f+MCAAAUgYDAIwHAQCoBgQAjAoAAIcJBApqCAkIiwb8/4wIAQBSBgIAjAcBAKgGJgCMCwEAUgkDAIwKAQCoCSEAUg4IALwMANwEAAAAnwwDAlIPCwC8DQHcBAAAAJ8NAwKaDAMADQAAAIwFAABlAAEAjAUBAIcMBAh4EQgFhxAEEYcPEAuVDg8FhxEECHgSCwWHEBESlQ8QBXgTCAWHEgQTeBMLBYcREhNDEBEFTBMAAqQNCAAAHGCAnw0EAmoNDAuLCd//iwba/4cHBAKHBgcDggYCAAkDAQMCBAAEAIACAAAAAAAAAAADAwIAAAAAAADwPwMEAwUEABxggAADAAEYAAAAAAABAAAAAAEAAQMAAQEAAQEAAQAEAAAAAQAAAQAA/gQAAAABAAD/BQAAAAEAAAABAAAAAAAAAAAAAQACAwAAAAAAAAAAAAAAAAAAAAAAAPn/DQAABAAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAIAAQAAAAABqh7PGLj/xe2Y2qWMMlZ5OcK7K2nwpVdPSt2IMaIVV9ubHQwVwRRUdg==

-- Decompiled by Krnl

return function(p1, p2)
	local v3 = string.len(p1)
	local v4 = string.len(p2)
	local v5 = {}
	if v3 == 0 then
		return v4
	end
	if v4 == 0 then
		return v3
	end
	if p1 == p2 then
		return 0
	end
	for v6 = 0, v3 do
		v5[v6] = {}
		v5[v6][0] = v6
	end
	for v7 = 0, v4 do
		v5[0][v7] = v7
	end
	for v8 = 1, v3 do
		for v9 = 1, v4 do
			local v10 = p1:byte(v8) == p2:byte(v9) and 0 or 1
			local v11 = v5[v8]
			local v12 = v5[v8 - 1][v9] + 1
			local v13 = v5[v8][v9 - 1] + 1
			local v14 = v5[v8 - 1][v9 - 1] + v10
			v11[v9] = math.min(v12, v13, v14)
		end
	end
	return v5[v3][v4]
end
