-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVFUdldERlZmF1bHRWZWhpY2xlUGFydAxUcmFuc3BhcmVuY3kPc2V0VHJhbnNwYXJlbmN5BU1vZGVsBVZhbHVlDkZpbmRGaXJzdENoaWxkBmlwYWlycw5HZXREZXNjZW5kYW50cwROYW1lB1dpbmRvd3MGUHJlc2V0CERvb3JMZWZ0BldpbmRvdwlEb29yUmlnaHQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUKUGFpbnRVdGlscwRHYW1lBkdhcmFnZQADBAIBAAAADEcBCAAAAACA+wMAAE0CA4gAAAAAUgMAAJ8CAgJNAQLZAQAAADABANkBAAAAggABAAIDAQMCAAUDARgAAAEAAAAAAQACAAEGAAAAAA0CAQAAAFZNAgE7AAAAAFIDAAAOAwIATQMA7AEAAABvBgAAvAQCAwIAAACfBAMCDgRKAKQFBAAAADBAvAYCRwUAAACfBgIAnwUABFEFEABNCgm6BgAAAPAKDQAHAACAUgoDAEcKCAAAAACA+wwAAE0LDIgIAAAAUgwJAJ8LAgJNCgvZCQAAADAKCdkJAAAAbgXv/wIAAIBvBwoAvAUCAwIAAACfBQMCDgUsAG8ICwC8BgUDAgAAAJ8GAwIOBhEAbwkMALwHBgMCAAAAnwcDAg4HDABSCAMARwgIAAAAAID7CgAATQkKiAgAAABSCgcAnwkCAk0ICdkJAAAAMAgH2QkAAABvCQ0AvAcFAwIAAACfBwMCDgcRAG8KDAC8CAcDAgAAAJ8IAwIOCAwAUgkDAEcJCAAAAACA+wsAAE0KC4gIAAAAUgsIAJ8KAgJNCQrZCQAAADAJCNkJAAAAggABAA4DBAMFAwYDBwQAADBAAwgDCQMKAwEDAgMLAwwDDQMOAA0AARgIAAEAAAADAAAAAQEAAAAAAAABAAAAAfAAAQAAAAABAAIACgAGAAAAAQEAAAABAQAAAAEB5gABAAAAAAEAAgAZAAAAAQEAAAABAd8AAQAAAAABAAIAIgYAAAAABQAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0EAL0HAAAATQMEKAgAAABNAgN5BgAAAJ8BAgLAAgkAEgABAMADCgASAAEAggMCAAsDDwQAAABAAxADEQMSBAAAQEADEwMUAxUGAAYBAgABAQABGAABAAAAAAABAAAAAAAAAAACAAgAAAEAAAAAAmwIjdZVaiLmXsznQsj0kFW737QNPKbJ9Jow02hg3hweSXQmWpZG9NY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.PaintUtils)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = p4.Model
	if p3 then
		p3 = p3.Value
	end
	if v5:FindFirstChild("Model") then
		for _, v6 in ipairs(v5:GetDescendants()) do
			if v6.Name == "Windows" then
				local v7
				if p3 == nil then
					v7 = v_u_2.GetDefaultVehiclePart(v6).Transparency
				else
					v7 = p3
				end
				v6.Transparency = v7
			end
		end
		local v8 = v5:FindFirstChild("Preset")
		if v8 then
			local v9 = v8:FindFirstChild("DoorLeft")
			local v10 = v9 and v9:FindFirstChild("Window")
			if v10 then
				local v11
				if p3 == nil then
					v11 = v_u_2.GetDefaultVehiclePart(v10).Transparency
				else
					v11 = p3
				end
				v10.Transparency = v11
			end
			local v12 = v8:FindFirstChild("DoorRight")
			local v13 = v12 and v12:FindFirstChild("Window")
			if v13 then
				if p3 == nil then
					p3 = v_u_2.GetDefaultVehiclePart(v13).Transparency
				end
				v13.Transparency = p3
			end
		end
	end
end
