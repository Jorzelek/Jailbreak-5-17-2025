-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMaA25ldwxzZXRtZXRhdGFibGUSU3ByaW5nTmVja1JvdGF0aW9uCVNldFRhcmdldBNTcHJpbmdXYWlzdFJvdGF0aW9uFURlZmF1bHREaXNhYmxlQ2FtTG9jawpJbnB1dEJlZ2FuCklucHV0RW5kZWQGc2NyaXB0BlBhcmVudAdyZXF1aXJlBUJhc2ljA0hpcBJSaWdodFdyaXN0Um90YXRpb24RTGVmdFdyaXN0Um90YXRpb24HU3ByaW5ncwpJdGVtT2Zmc2V0DEl0ZW1Sb3RhdGlvbgxOZWNrUm90YXRpb24NV2Fpc3RSb3RhdGlvbgdWZWN0b3IzBkNGcmFtZQZNb3Rpb24FQ3JhdGULX19DbGFzc05hbWUHX19pbmRleAAECAMDAAAAH/sEAABNAwTvAAAAAFIEAABSBQEA+wYBAFIHAgCfAwUC+wYCAJ49AwQGAAAAUgUDAKQEAgAAABBAnwQDAU0EA4MDAAAAbwYEALwEBJcFAAAAnwQDAU0EAxIGAAAAbwYHALwEBJcFAAAAnwQDAbwEA74IAAAAnwQCAYIDAgAJAwEDAgQAABBAAwMHzcxMvgAAAAAAAAAAAAAAAAMEAwUHzcxMPgAAAAAAAAAAAAAAAAMGABgBARgAAAAAAAAAAAEAAAAAAAACAAAAAAABAAAAAAACAAACGQAAAAAEAQEBAAAIowEAAPsCAABNAQKCAAAAAFICAADdAwAAnwEAAYIAAQABAwcAIwcBGAABAAAAAAABIwAAAAABAQAAAAABggABAAAAJggBGAAmAAAAAAcAAAECAE2jAAAApAEBAAAAAEBNAAEkAgAAAKQBBAAAADBATQIAywUAAACfAQIC/wIBAAAAAADiAwkA4gQLAOIFEABvBhEAMAYFgAwAAABvBhIAMAYF5Q0AAABMNgACpAYVAABQMIGfBgECMAYFjQ4AAABMNgACpAYVAABQMIGfBgECMAYFXw8AAAAwBQSYCgAAADAEA70GAAAApAQXAABQYIGfBAECMAQDDgcAAACkBBcAAFBggZ8EAQIwBAOFCAAAADADApcYAAAA/wMEAAAAAABvBBkAMAQD5RoAAAAwAwNuGwAAAJ49AwUBAAAAUgUDAFIGAQCkBB0AAADAQZ8EAwHABB4AEgABABIAAgASAAMAMAQD7xQAAADABB8AEgABADAEA4IgAAAAwAQhADAEA68iAAAAggMCACMDCQQAAABAAwoDCwQAADBAAwwDDQMOAw8FAwYHCAMQBQEKAxEDEgMTAxQFBAwNDg8HAAAAAM3MzL4AAMC/AAAAAAfNzMy9AAAAAAAAAAAAAAAAAxUDAQQAUDCBAxYEAFBggQMXAxgDGQMaAwIEAADAQQYABgEDBwYCAwgDAAECAQABGAABAAAAAQAAAAACAAEBAQEAAAEAAAEAAAAAAAEAAAAAAPwA/wAJAAAAAAEAAAAA9QAOAAEAAAEAAQAAAAAAAAEAAAAAAAsAAAADAAACAQAAAAADHyekLQ6RRnkt4865MmygXFIzNBHXg1ZtGxzUAW4uCJ38abP/7Dj07w==

-- Decompiled by Krnl

local v1 = script.Parent
local v_u_2 = require(v1.Basic)
local v_u_3 = {}
local v4 = {}
local v5 = {
	["Springs"] = {
		["ItemOffset"] = Vector3.new(0, -0.4, -1.5),
		["ItemRotation"] = Vector3.new(-0.1, 0, 0),
		["NeckRotation"] = Vector3.new(),
		["WaistRotation"] = Vector3.new()
	}
}
v4.Hip = v5
v4.RightWristRotation = CFrame.new()
v4.LeftWristRotation = CFrame.new()
v_u_3.Motion = v4
local v_u_6 = {
	["__ClassName"] = "Crate"
}
v_u_6.__index = v_u_6
setmetatable(v_u_6, v_u_2)
function v_u_6.new(p7, p8, p9)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	local v10 = v_u_2.new(p7, p8, v_u_3, p9)
	local v11 = v_u_6
	setmetatable(v10, v11)
	v10.SpringNeckRotation:SetTarget(Vector3.new(-0.2, 0, 0))
	v10.SpringWaistRotation:SetTarget(Vector3.new(0.2, 0, 0))
	v10:DefaultDisableCamLock()
	return v10
end
function v_u_6.InputBegan(p12, ...)
	-- upvalues: (copy) v_u_2
	v_u_2.InputBegan(p12, ...)
end
function v_u_6.InputEnded(_) end
return v_u_6
