-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXBHR5cGUHdmlzaWJsZQxjb3VudGRvd25UaWwTc2V0TGlrZVByb21wdENvbmZpZwl3b3Jrc3BhY2UQR2V0U2VydmVyVGltZU5vdxhMSUtFX1BST01QVF9WSVNJQkxFX1RJTUUIZGlzcGF0Y2gcU0hPV19MSUtFX1BST01QVF9SRU1PVEVfTkFNRQxXYWl0Rm9yQ2hpbGQNT25DbGllbnRFdmVudAdDb25uZWN0BGluaXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlClJ1blNlcnZpY2UHcmVxdWlyZQNBcHAFc3RvcmUGc2NyaXB0BlBhcmVudBBMaWtlUHJvbXB0Q29uc3RzAAMHAAIAAAAX+wAAAOICAwBvAwQAMAMCcQAAAACpAwEAMAMCoAEAAACkBAYAAABQQLwEBLcHAAAAnwQCAvsGAQBNBQZyCAAAAEMDBAUwAwLzAgAAALwAAEwJAAAAnwADAYIAAQAKAwEDAgMDBQMAAQIDBAMFBAAAUEADBgMHAwgACgABGAAAAQAAAQAAAQAAAAAAAAAAAAD9AAAFCwAAAAAEAAMAAAAQ+wAAAPsDAQBNAgMdAAAAALwAANMBAAAAnwADAk0BAIwCAAAAwAMDABICAgASAgEAvAEBxwQAAACfAQMBggABAAUDCQMKAwsGAAMMAQAIDQEYAAAAAAAAAAEAAAAAAAAABwkAAAAABwAAAQIAJqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgYAAABQQE0EAMEHAAAATQMEfggAAACfAgICpAMGAAAAUECkBgoAAACQQE0FBiQLAAAATQQFhwwAAACfAwIC/wQBAAAAAADABQ0AEgAAABIAAwASAAIAMAUEEw4AAACCBAIADwMOBAAAAEADDwMQAxEDEgQAAFBAAxMDFAMVBAAAkEADFgMXBgEDDQEBAQABGAABAAAAAAABAAAAAAABAAAAAAAAAQAAAAAAAAAAAgABAAAAAAAKAQAAAAACVnkN+/o0vcBkvWdvcV1AFbMHa5+5827haubMbTd6VaqMYfdd2tEVgA==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = require(v_u_1.App.store)
local v_u_3 = require(script.Parent.LikePromptConsts)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
		v_u_1:WaitForChild(v_u_3.SHOW_LIKE_PROMPT_REMOTE_NAME).OnClientEvent:Connect(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_3
			v_u_2:dispatch({
				["type"] = "setLikePromptConfig",
				["visible"] = true,
				["countdownTil"] = workspace:GetServerTimeNow() + v_u_3.LIKE_PROMPT_VISIBLE_TIME
			})
		end)
	end
}
