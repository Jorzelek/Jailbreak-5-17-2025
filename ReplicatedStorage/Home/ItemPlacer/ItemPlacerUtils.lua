-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYDFZpZXdwb3J0U2l6ZQFYAVkHVmVjdG9yMwNuZXcQR2V0TW91c2VMb2NhdGlvbhBnZXRNb3VzZUxvY2F0aW9uElZpZXdwb3J0UG9pbnRUb1JheQ1SYXljYXN0UGFyYW1zGkZpbHRlckRlc2NlbmRhbnRzSW5zdGFuY2VzCmNvbGxpZGFibGUGT3JpZ2luCURpcmVjdGlvbgxyYXljYXN0TW91c2UEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlEFVzZXJJbnB1dFNlcnZpY2UHcmVxdWlyZQNTdGQHUmF5Y2FzdAxUb3VjaEVuYWJsZWQJd29ya3NwYWNlDUN1cnJlbnRDYW1lcmEAAwcBAwAAABrGAQAA+wIAAA4CEQArABAA+wMBAE0CA7AAAAAATQUCeQIAAABbBAUBTQYCeAQAAABbBQYDjAYAAEw2AAKkAwcAABhQgJ8DBAJSAQMAggECAPsCAgC8AgIGCAAAAJ8CAgJSAQIAggECAAkDAQIAAAAAAADgPwMCAgAAAAAAANg/AwMDBAMFBAAYUIADBgAJBwEYAAEAAAEAAAIAAAAAAAAAAAAAAAACAAAAAAIKAAAAAAoCAwAAACD7AwAATQIDJgAAAABSAwEAnwICAvsDAQBNBQJ5AQAAAE0GAngCAAAAvAMDRgMAAACfAwQCpAQGAAAUQICfBAECMAAEfQcAAAD7BgIATQUGmggAAABNBgNDCQAAAE0HA2EKAAAAjAjnA1IJBACfBQUCDgUBAIIFAgDGBgAAggYCAAsDBwMCAwMDCAMJAwUEABRAgAMKAwsDDAMNABQOARgAAAAAAAEAAAAAAAAAAgAAAQABAAAAAAAAAAAAAQECABUAAAAABwAAAQIAKaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgYAAABQQE0EAKEHAAAATQMEwggAAACfAgICTQMBfwkAAACkBQsAAACgQE0EBUgMAAAA/wUCAAAAAADABg0AEgADABIABAASAAEAMAYFJg4AAADABg8AEgAFABIABAASAAIAMAYFBxAAAACCBQIAEQMPBAAAAEADEAMRAxIDEwQAAFBAAxQDFQMWAxcEAACgQAMYBgADBwYBAw4CAAEBAAEYAAEAAAAAAAEAAAAAAAEAAAAAAAABAAEAAAACAAEAAAAAAAsAAAAAAAwBAAAAAAKcjNqvYuhDUK5IsDvzJwpZdUN2gHpM1WVqAHGgKQpsCzCARC+XOFcH

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = require(v1.Std.Raycast)
local v_u_4 = v_u_2.TouchEnabled
local v_u_5 = workspace.CurrentCamera
local v_u_15 = {
	["getMouseLocation"] = function(p6)
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
		if not v_u_4 or p6 then
			return v_u_2:GetMouseLocation()
		end
		local v7 = v_u_5.ViewportSize
		local v8 = v7.X * 0.5
		local v9 = v7.Y * 0.375
		return Vector3.new(v8, v9, 0)
	end,
	["raycastMouse"] = function(p10, p11)
		-- upvalues: (copy) v_u_15, (copy) v_u_5, (copy) v_u_3
		local v12 = v_u_15.getMouseLocation(p11)
		local v13 = v_u_5:ViewportPointToRay(v12.X, v12.Y)
		local v14 = RaycastParams.new()
		v14.FilterDescendantsInstances = p10
		return v_u_3.collidable(v13.Origin, v13.Direction, 999, v14) or nil
	end
}
return v_u_15
