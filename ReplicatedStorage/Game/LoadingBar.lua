-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcDHNldG1ldGF0YWJsZQNuZXcETWFpZA1Mb2FkaW5nQmFyR3VpCFJlc291cmNlCkxvYWRpbmdCYXIFQ2xvbmUDR3VpCVBsYXllckd1aQZQYXJlbnQHRW5hYmxlZAhHaXZlVGFzawhTZXRWYWx1ZQpCYWNrZ3JvdW5kBVZhbHVlBVVEaW0yBFNpemUIUG9zaXRpb24LU2V0UG9zaXRpb24HRGVzdHJveQRnYW1lB1BsYXllcnMKR2V0U2VydmljZQtMb2NhbFBsYXllchFSZXBsaWNhdGVkU3RvcmFnZQdyZXF1aXJlA1N0ZAdfX2luZGV4AAUFAAQAAAAz/wACAAAAAAD7AwAAnj0ABAMAAABSAgAApAEBAAAAAECfAQMB+wIBAE0BAu8CAAAAnwEBAjABAHYDAAAA+wQCAE0DBGIFAAAATQIDOQYAAABNAQJRBAAAALwBAToHAAAAnwECAjABAB8IAAAATQEAHwgAAAD7AwMATQIDmQkAAAAwAgEkCgAAAE0BAB8IAAAAqQIBADACAfALAAAATQEAdgMAAABNAwAfCAAAALwBAf0MAAAAnwEDAYwDAAC8AQD/DQAAAJ8BAwGCAAIADgMBBAAAAEADAgMDAwQDBQMGAwcDCAMJAwoDCwMMAw0ACQIBGAAAAQAAAAAAAAIAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAABAAAAAAEAAAAAAAACAAAAAgoAAAAACAIAAAAAEE0EAB8AAAAATQME7QEAAABNAgPsAgAAAKQDBQAAEDCAUgQBAIwFAACMBgEAjAcAAJ8DBQIwAwIvBgAAAIIAAQAHAwgDDgMPAxADAgQAEDCAAxEAFw0BGAAAAAAAAAAAAAAAAAAAAAEYAAAAAAQCAAAAAAdNAwAfAAAAAE0CA+0BAAAAMAECOwIAAACCAAEAAwMIAw4DEgAaEwEYAAAAAAAAARsAAAAAAwEAAAAACU0BAHYAAAAAvAEBUAEAAACfAQIBxgEAADABAHYAAAAAggABAAIDAwMUAB0UARgAAAAAAAEAAAEeAAAAAAYAAAECACujAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCTQEAMQQAAACkAgEAAAAAQG8EBQC8AgIWAwAAAJ8CAwKkAwcAAABgQE0FAqEIAAAATQQFdgkAAACfAwIC/wQEAAAAAAAwBARuCgAAAMAFCwASAAQAEgADABIAAgASAAEAMAUE7wwAAADABQ0AMAUE/w4AAADABQ8AMAUE6BAAAADABREAMAUEUBIAAACCBAIAEwMVBAAAAEADFgMXAxgDGQMaBAAAYEADGwMDAxwGAAMCBgEDDQYCAxMGAwMUBAABAgMBAAEYAAEAAAAAAAEAAQAAAAAAAQAAAAAAAAIAAQABAAAAAAAADgAAAwAAAwAABQEAAAAABF+RqjZ9Rc7AbVXAoll9vs9vfUvh14SVxik3mdbo6x+DVCK27j5TdjI=

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.Std.Maid)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new()
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
	local v5 = {}
	local v6 = v_u_4
	setmetatable(v5, v6)
	v5.Maid = v_u_3.new()
	v5.Gui = v_u_2.Resource.LoadingBar.LoadingBarGui:Clone()
	v5.Gui.Parent = v_u_1.PlayerGui
	v5.Gui.Enabled = true
	v5.Maid:GiveTask(v5.Gui)
	v5:SetValue(0)
	return v5
end
function v_u_4.SetValue(p7, p8)
	p7.Gui.Background.Value.Size = UDim2.new(p8, 0, 1, 0)
end
function v_u_4.SetPosition(p9, p10)
	p9.Gui.Background.Position = p10
end
function v_u_4.Destroy(p11)
	p11.Maid:Destroy()
	p11.Maid = nil
end
return v_u_4
