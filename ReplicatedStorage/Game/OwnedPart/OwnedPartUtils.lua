-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQBmFzc2VydAZpcGFpcnMGR2V0QWxsCEdldE93bmVyBXRhYmxlBmluc2VydAZnZXRBbGwISXNJblBvb2wHZ2V0UG9vbAVwcmludB5yZW1vdmluZyAlZCBpdGVtcyBmcm9tIHBvb2wgJXMETmFtZQZmb3JtYXQEX29iagdEZXN0cm95CWNsZWFuUG9vbAAECwIAAAAAKEcAAgAAAACAqQMAAakDAQC7AQMCpAIBAAAAAECfAgIBRwECAAAAAICpAwABqQMBALsBAwKkAgEAAAAAQJ8CAgH/AgAAAAAAAKQDAwAAACBAvAQA0AQAAACfBAIAnwMABFEDDAC8CAfDBQAAAJ8IAgKaCAgAAQAAAJ40AgUHAAAAUgkCAFIKBwCkCAgAABxggJ8IAwFuA/P/AgAAgIICAgAJAwEEAAAAQAMCBAAAIEADAwMEAwUDBgQAHGCAAAMHARgAAAAAAAAAAAEAAAAAAAAAAQABAAAAAAAAAQAAAAABAAAAAAAA/gAFBAAAAAALAgAAAAAsRwACAAAAAICpAwABqQMBALsBAwKkAgEAAAAAQJ8CAgFHAQIAAAAAgKkDAAGpAwEAuwEDAqQCAQAAAABAnwICAf8CAAAAAAAApAMDAAAAIEC8BADQBAAAAJ8EAgCfAwAEUQMQALwIB8MFAAAAnwgCApoIDAABAAAAvAgHrwYAAACfCAICDggHAJ40AgUHAAAAUgkCAFIKBwCkCAkAACBwgJ8IAwFuA+//AgAAgIICAgAKAwEEAAAAQAMCBAAAIEADAwMEAwgDBQMGBAAgcIAADgkBGAAAAAAAAAAAAQAAAAAAAAABAAEAAAAAAAABAAAAAAAAAAABAAAAAAAA/gAFDwAAAAAKAgEAAAcAAAEDBAwCHfsDAABNAgNeAAAAAFIDAABSBAEAnwIDAqQDAgAAABBAbwQDABwGAgBNBwG6BAAAALwEBI0FAAAAnwQEAJ8DAAGkAwcAAABgQFIEAgCfAwIEUQMFAE0IB24IAAAAvAgIUAkAAACfCAIBbgP6/wIAAICCAAEACgMJAwoEAAAQQAMLAwwDDQMCBAAAYEADDgMPABkQARgAAAAAAAABAAAAAAAAAAAAAQAAAAABAAAAAP8AAxoAAAAAAgAAAQIADqMAAAD/AAMAAAAAAMABAAAwAQDwAQAAAMABAgAwAQBeAwAAAMABBAASAAAAMAEAqQUAAACCAAIABgYAAwcGAQMJBgIDEAMAAQIBAAEYAAEAAQAACwAACwAAAAcBAAAAAAPH8JXg6IwFj/U0/3SAiC5rkjDxjmcy/HKm0oea+3nbE4bzvcqHJOUu

-- Decompiled by Krnl

local v_u_17 = {
	["getAll"] = function(p1, p2)
		local v3 = p1 ~= nil
		assert(v3)
		local v4 = p2 ~= nil
		assert(v4)
		local v5 = {}
		for _, v6 in ipairs(p1:GetAll()) do
			if v6:GetOwner() == p2 then
				table.insert(v5, v6)
			end
		end
		return v5
	end,
	["getPool"] = function(p7, p8)
		local v9 = p7 ~= nil
		assert(v9)
		local v10 = p8 ~= nil
		assert(v10)
		local v11 = {}
		for _, v12 in ipairs(p7:GetAll()) do
			if v12:GetOwner() == p8 and v12:IsInPool() then
				table.insert(v11, v12)
			end
		end
		return v11
	end,
	["cleanPool"] = function(p13, p14)
		-- upvalues: (copy) v_u_17
		local v15 = v_u_17.getPool(p13, p14)
		print(("removing %d items from pool %s"):format(#v15, p14.Name))
		for _, v16 in ipairs(v15) do
			v16._obj:Destroy()
		end
	end
}
return v_u_17
