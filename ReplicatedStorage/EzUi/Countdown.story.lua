-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOB3VubW91bnQHcmVxdWlyZQlDb3VudGRvd24Gc2NyaXB0BlBhcmVudAVtb3VudAdlbmRUaW1lCXdvcmtzcGFjZRBHZXRTZXJ2ZXJUaW1lTm93BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQVSb2FjdA1jcmVhdGVFbGVtZW50AAMCAAIAAAAG+wEAAE0AARIAAAAA+wEBAJ8AAgGCAAEAAQMBAA4AARgAAAAAAAEPAAAAAAkBAgAAAB6kAQEAAAAAQKQEBAAAADBATQMEJAUAAABNAgM4AgAAAJ8BAgL7AwAATQID5AYAAAD7AwEAUgQBAOIFCACkBwsAAACgQLwHB7cMAAAAnwcCApUGBwkwBgXUBwAAAJ8DAwJSBAAAnwIDAtkDAAASAgAAEgACAIIDAgANAwIEAAAAQAMDAwQEAAAwQAMFAwYDBwUBBwIAAAAAAECPQAMIBAAAoEADCQEABgABGAAAAAAAAAAAAAEAAAEAAAEAAAAAAAAA/wP8BgAAAAcAAAAABAAAAQIAEqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CACEGAAAAnwECAk0CAcoHAAAAwAMIABIAAQASAAIAggMCAAkDCgQAAABAAwsDDAMCBAAAQEADDQMOBgEBAQEAARgAAQAAAAAAAQAAAAACAAEAAAABAAAAAALb7GEVXQPkUukoC4G++bKneruw8+W7WbquI/CcZAHRZ395vZKj4zVE

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Roact)
local v_u_3 = v_u_2.createElement
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = require(script.Parent.Countdown)
	local v_u_6 = v_u_2.mount(v_u_3(v5, {
		["endTime"] = workspace:GetServerTimeNow() + 1000
	}), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_6
		v_u_2.unmount(v_u_6)
	end
end
