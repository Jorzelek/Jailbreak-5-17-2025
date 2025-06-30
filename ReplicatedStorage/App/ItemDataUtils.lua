-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMIBEdhbWUKSXRlbUNvbmZpZw5GaW5kRmlyc3RDaGlsZAdyZXF1aXJlCWdldENvbmZpZwRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UAAgQBAQAAABL7AwAATQIDvQAAAABNAQIsAQAAAFIDAAC8AQEDAgAAAJ8BAwJHAQMAAAAAgMYCAACCAgIApAIEAAAAMEBSAwEAnwICAoICAgAFAwEDAgMDAwQEAAAwQAAGBQEYAAAAAAAAAAAAAQABAAIAAAABBwAAAAADAAABAgAOowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAQAAAAAAwAIEABIAAAAwAgFRBQAAAIIBAgAGAwYEAAAAQAMHAwgGAAMFAQABAAEYAAEAAAAAAAIAAgAAAAgBAAAAAAGXFWr+kePF0qXRAGodl7BdKqDqHGnitDasMwczmUj3T9w71cJFBaK1

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
return {
	["getConfig"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1.Game.ItemConfig:FindFirstChild(p2)
		if v3 == nil then
			return nil
		else
			return require(v3)
		end
	end
}
