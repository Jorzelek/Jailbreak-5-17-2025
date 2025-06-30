-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOBnNwYXducwRuYW1lDG1pc3NpbmcgbmFtZQZhc3NlcnQFdGl0bGUFdGFibGUGaW5zZXJ0EG1pbmltYXBTZXRTcGF3bnMEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgACCwIAAAAAIP8CAAAAAAAATQMB2wAAAADGBAAAxgUAAGQDFgBNCQdaAQAAAIEBCQQCAAAAbwoCAKQIBAAAADBAnwgDAU0IB5oFAAAAKwgEAE0IB1oBAAAAMAgHmgUAAACeNAIFBwAAAFIJAgBSCgcApAgIAAAcYICfCAMBbgPp/wIAAACCAgIACQMBAwIDAwMEBAAAMEADBQMGAwcEABxggAAGCAEYAAABAAAAAAEAAAAAAAAAAQAAAQAAAAIAAAAAAAD7AAcHAAAAAAYAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQJAMAFCgAwBQSgCAAAAJ8CAwCCAgAACwMJBAAAAEADCgMLAwwEAABAQAMNAw4DCAUBCAYAAQABAAEYAAEAAAAAAAEAAAAAAgAAAAABAAD/AAEAAAAAAQGEBO7MeG9cM0BuenKHUtKeKe/fKoVXizFyhGF8JWZHKa5gmlVpnW8=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["minimapSetSpawns"] = function(_, p2)
		local v3 = {}
		for _, v4 in p2.spawns do
			local v5 = v4.name
			assert(v5, "missing name")
			if not v4.title then
				v4.title = v4.name
			end
			table.insert(v3, v4)
		end
		return v3
	end
})
