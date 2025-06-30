-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSC0xvY2FsUGxheWVyCEdldE1vdXNlBlRhcmdldAAFTW9kZWwYRmluZEZpcnN0QW5jZXN0b3JPZkNsYXNzFkdldFBsYXllckZyb21DaGFyYWN0ZXIETmFtZQlDbGllbnRSdW4EZ2FtZQdQbGF5ZXJzCkdldFNlcnZpY2ULRGVzY3JpcHRpb24FR3JvdXAEQXJncwVob3ZlcjVSZXR1cm5zIHRoZSBuYW1lIG9mIHRoZSBwbGF5ZXIgeW91IGFyZSBob3ZlcmluZyBvdmVyLgtEZWZhdWx0VXRpbAACBwABAAAAGfsBAABNAAExAAAAALwAACMBAAAAnwACAk0BACwCAAAAKwECAG8CAwCCAgIA+wIAAG8GBAC8BAFJBQAAAJ8EAwC8AgKJBgAAAJ8CAAIOAgMATQMCugcAAAArAwEAbwMDAIIDAgAIAwEDAgMDAwQDBQMGAwcDCAAJCQEYAAAAAAAAAQACAQADAAAAAAAAAAIAAAAAAAoAAAAAAwAAAQIAGqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwLiAQkAbwIKADACAboEAAAAbwILADACAeIFAAAAbwIMADACAcQGAAAA/wIAAAAAAAAwAgHbBwAAAMACDQASAAAAMAIBMwgAAACCAQIADgMKBAAAAEADCwMMAwgDDQMOAw8DCQUFBAUGBwgDEAMRAxIGAAEAAQABGAAAAAAAAAACAQAAAQAAAQAAAQAAAAIAAAAAAQAAAAABQ5+xyEpiLq1xW9tc9SVXemv0yRKn2bPyU9LGtK78IhB2oQCqZeZifw==

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
return {
	["Name"] = "hover",
	["Description"] = "Returns the name of the player you are hovering over.",
	["Group"] = "DefaultUtil",
	["Args"] = {},
	["ClientRun"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = v_u_1.LocalPlayer:GetMouse().Target
		if not v2 then
			return ""
		end
		local v3 = v_u_1:GetPlayerFromCharacter(v2:FindFirstAncestorOfClass("Model"))
		return v3 and v3.Name or ""
	end
}
