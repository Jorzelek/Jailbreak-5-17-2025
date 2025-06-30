-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdBE1ha2UFTW9kZWwOR2V0RGVzY2VuZGFudHMIQmFzZVBhcnQDSXNBBE5hbWUKU2Vjb25kQm9keQxFeHBlZGl0aW9uZXIGUHJlc2V0BURvb3JzBEJhY2sOSXNEZXNjZW5kYW50T2YFdGFibGUGaW5zZXJ0BE5vbmUGaXBhaXJzCE1lc2hQYXJ0AAlUZXh0dXJlSUQPcmJ4YXNzZXRpZDovLyVkBmZvcm1hdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQRHYW1lBkdhcmFnZRJTcGVjaWFsVGV4dHVyZURhdGELVGV4dHVyZURhdGEAAg8CAgAABwAAAQMMWgJyTQIBrQAAAABNAwE7AQAAAP8EAAAAAAAAvAUDRwIAAACfBQIEZAUcAG8MAwC8Cgn+BAAAAJ8KAwIOChcATQoJugUAAADwChQABgAAgPACCwAHAACATQ4DtQgAAABNDQ4GCQAAAE0MDUcKAAAAvAoJrQsAAACfCgMCKwoHAJ40BAUJAAAAUgsEAFIMCQCkCg4AADTAgJ8KAwFuBeP/AgAAAA4AOQBNBQA/DwAAACsFNgBNBQC6BQAAAMYGAAD7CAAAhwcIBUcHBQAAAAAA+wgAAIcHCAWHBgcCZQAFAPsIAQCHBwgFDgcCAPsHAQCHBgcFRwYRAAAAAICkBxEAAAAAQVIIBACfBwIEUQcIAG8OEgC8DAv+BAAAAJ8MAwIODAMAbwwTADAMC4QUAAAAbgf3/wIAAICCAAEApAcRAAAAAEFSCAQAnwcCBFEHDABvDhIAvAwL/gQAAACfDAMCDgwHAG8MFQBSDgYAvAwMjRYAAACfDAMCMAwLhBQAAABuB/P/AgAAgIIAAQCkBREAAAAAQVIGBACfBQIEUQUIAG8MEgC8Cgn+BAAAAJ8KAwIOCgMAbwoTADAKCYQUAAAAbgX3/wIAAICCAAEAFwMBAwIDAwMEAwUDBgMHAwgDCQMKAwsDDAMNAw4EADTAgAMPAxAEAAAAQQMRAxIDEwMUAxUABgABGAAAAQADAAEAAAABAAAAAAAAAAABAAIAAAAAAAAAAAAEAAAAAAAA+AALAAAAAQABAQAAAAEAAAABAAABAAIAAQAAAAABAAAAAAEAAP4AAAYAAAAAAQAAAAABAAAAAAAA/gAABwAAAAABAAAAAAEAAP4ABgcAAAAABgAAAQIAHaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0EAL0GAAAATQMEKAcAAABNAgPnCAAAAJ8BAgKkAgUAAABAQE0FAL0GAAAATQQFKAcAAABNAwQFCQAAAJ8CAgLAAwoAEgACABIAAQCCAwIACwMWBAAAAEADFwMYAxkEAABAQAMaAxsDHAMdBgABAAEAARgAAQAAAAAAAQAAAAAAAAAAAQAAAAAAAAAAAgAAAAEAAAAAAdV1YYRlnPpX57ELEJWtrN83DqP+vXE8P8OsGURnMgGDSbegpgRA3D8=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.SpecialTextureData)
local v_u_3 = require(v1.Game.Garage.TextureData)
return function(p4, p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = p5.Make
	local v7 = p5.Model
	local v8 = {}
	for _, v9 in v7:GetDescendants() do
		if v9:IsA("BasePart") and (v9.Name == "SecondBody" and (v6 ~= "Expeditioner" or not v9:IsDescendantOf(v7.Preset.Doors.Back))) then
			table.insert(v8, v9)
		end
	end
	if p4 and not p4.None then
		local v10 = p4.Name
		local v11 = nil
		if v_u_3[v10] == nil then
			if v_u_2[v10] then
				v11 = v_u_2[v10]
			end
		else
			v11 = v_u_3[v10][v6]
		end
		if v11 == nil then
			for _, v12 in ipairs(v8) do
				if v12:IsA("MeshPart") then
					v12.TextureID = ""
				end
			end
		else
			for _, v13 in ipairs(v8) do
				if v13:IsA("MeshPart") then
					v13.TextureID = ("rbxassetid://%d"):format(v11)
				end
			end
		end
	else
		for _, v14 in ipairs(v8) do
			if v14:IsA("MeshPart") then
				v14.TextureID = ""
			end
		end
		return
	end
end
