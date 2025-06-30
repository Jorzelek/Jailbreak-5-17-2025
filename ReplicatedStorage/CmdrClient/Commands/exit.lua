-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQB3JlcXVpcmUER2FtZQlTaWRlYmFyVUkQb25EZXZQYW5lbFRvZ2dsZQRGaXJlCUNsaWVudFJ1bgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UETmFtZQtEZXNjcmlwdGlvbgVHcm91cARBcmdzBGV4aXQQRXhpdCB0aGUgY29uc29sZQRIZWxwAAIHAwEAAAAPpAMBAAAAAED7BgAATQUGvQIAAABNBAVVAwAAAJ8DAgJNBANgBAAAALwEBN0FAAAAnwQCAakEAQCCBAIABgMBBAAAAEADAgMDAwQDBQAIBgEYAAAAAAAAAAABAAAAAAEACQAAAAADAAABAgAaowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBCQBvAgoAMAIBugQAAABvAgsAMAIB4gUAAABvAgwAMAIBxAYAAAD/AgAAAAAAADACAdsHAAAAwAINABIAAAAwAgEzCAAAAIIBAgAOAwcEAAAAQAMIAwkDCgMLAwwDDQMGBQUEBQYHCAMOAw8DEAYAAQABAAEYAAEAAAAAAAEBAAABAAABAAABAAAAAQAAAAABAAAAAAFnU2UvDXAtnVWXD7t/t5ORn5Q40WtKuuADoK3fpudkHW3n2pWEC4OC

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
return {
	["Name"] = "exit",
	["Description"] = "Exit the console",
	["Group"] = "Help",
	["Args"] = {},
	["ClientRun"] = function(_, _, _)
		-- upvalues: (copy) v_u_1
		require(v_u_1.Game.SidebarUI).onDevPanelToggle:Fire()
		return true
	end
}
