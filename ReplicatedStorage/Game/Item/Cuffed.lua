-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdA25ldwxzZXRtZXRhdGFibGUQU3ByaW5nSXRlbU9mZnNldAREYW1wBEZyZXETU3ByaW5nV2Fpc3RSb3RhdGlvbhJTcHJpbmdOZWNrUm90YXRpb24JU2V0VGFyZ2V0FURlZmF1bHREaXNhYmxlQ2FtTG9jawpJbnB1dEJlZ2FuCklucHV0RW5kZWQGc2NyaXB0BlBhcmVudAdyZXF1aXJlBUJhc2ljA0hpcBJSaWdodFdyaXN0Um90YXRpb24RTGVmdFdyaXN0Um90YXRpb24HU3ByaW5ncwpJdGVtT2Zmc2V0DEl0ZW1Sb3RhdGlvbgxOZWNrUm90YXRpb24NV2Fpc3RSb3RhdGlvbgdWZWN0b3IzBkNGcmFtZQZNb3Rpb24GQ3VmZmVkC19fQ2xhc3NOYW1lB19faW5kZXgABAgDAwAAAEP7BAAATQME7wAAAABSBAAAUgUBAPsGAQBSBwIAnwMFAvsGAgCePQMEBgAAAFIFAwCkBAIAAAAQQJ8EAwFNBAMdAwAAAG8FBAAwBQSIBQAAAE0EAx0DAAAAjAUHADAFBLUGAAAATQQDEgcAAABvBQQAMAUEiAUAAABNBAMSBwAAAIwFBwAwBQS1BgAAAE0EA4MIAAAAbwUEADAFBIgFAAAATQQDgwgAAACMBQcAMAUEtQYAAABNBAMdAwAAAG8GCQC8BASXCgAAAJ8EAwFNBAMSBwAAAG8GCwC8BASXCgAAAJ8EAwFNBAODCAAAAG8GCwC8BASXCgAAAJ8EAwG8BAO+DAAAAJ8EAgGCAwIADQMBAwIEAAAQQAMDAgAAAAAAAOA/AwQDBQMGAwcHAAAAAAAAAADNzEw+AAAAAAMIBwAAAL8AAAAAAAAAAAAAAAADCQAYAQEYAAAAAAAAAAABAAAAAAAAAgAAAAABAAAAAAEAAAAAAQAAAAABAAAAAAEAAAAAAgAAAAAAAQAAAAAAAQAAAAAAAgAAAhkAAAAABAEBAQAACKMBAAD7AgAATQECggAAAABSAgAA3QMAAJ8BAAGCAAEAAQMKACsKARgAAQAAAAAAASsAAAAAAQEAAAAAAYIAAQAAAC4LARgALgAAAAAHAAABAgBQowAAAKQBAQAAAABATQABJAIAAACkAQQAAAAwQE0CAMsFAAAAnwECAv8CAQAAAAAA4gMJAOIECwDiBRAAbwYRADAGBYAMAAAATDYAAqQGFAAATCCBnwYBAjAGBeUNAAAATDYAAqQGFAAATCCBnwYBAjAGBY0OAAAATDYAAqQGFAAATCCBnwYBAjAGBV8PAAAAMAUEmAoAAAAwBAO9BgAAAKQEFgAATFCBnwQBAjAEAw4HAAAApAQWAABMUIGfBAECMAQDhQgAAAAwAwKXFwAAAP8DBAAAAAAAbwQYADAEA+UZAAAAMAMDbhoAAACePQMFAQAAAFIFAwBSBgEApAQcAAAAsEGfBAMBwAQdABIAAQASAAIAEgADADAEA+8TAAAAwAQeABIAAQAwBAOCHwAAAMAEIAAwBAOvIQAAAIIDAgAiAwwEAAAAQAMNAw4EAAAwQAMPAxADEQMSBQMGBwgDEwUBCgMUAxUDFgMXBQQMDQ4PBwAAAAAAAAAAAACAvwAAAAADGAMBBABMIIEDGQQATFCBAxoDGwMcAx0DAgQAALBBBgAGAQMKBgIDCwMAAQIBAAEYAAEAAAABAAAAAAIAAQEBAQAAAQAAAAAAAQAAAAAAAQAAAAAA/AD/AAkAAAAAAQAAAAD1AA4AAQAAAQABAAAAAAAAAQAAAAAAEwAAAAMAAAIBAAAAAAPgZ6cmWhyHZtKjzbJf9iYCh0t48pUG7kM2+kcwo+igrfm/Bg/tYHco

-- Decompiled by Krnl

local v1 = script.Parent
local v_u_2 = require(v1.Basic)
local v_u_3 = {}
local v4 = {}
local v5 = {
	["Springs"] = {
		["ItemOffset"] = Vector3.new(0, 0, -1),
		["ItemRotation"] = Vector3.new(),
		["NeckRotation"] = Vector3.new(),
		["WaistRotation"] = Vector3.new()
	}
}
v4.Hip = v5
v4.RightWristRotation = CFrame.new()
v4.LeftWristRotation = CFrame.new()
v_u_3.Motion = v4
local v_u_6 = {
	["__ClassName"] = "Cuffed"
}
v_u_6.__index = v_u_6
setmetatable(v_u_6, v_u_2)
function v_u_6.new(p7, p8, p9)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	local v10 = v_u_2.new(p7, p8, v_u_3, p9)
	local v11 = v_u_6
	setmetatable(v10, v11)
	v10.SpringItemOffset.Damp = 0.5
	v10.SpringItemOffset.Freq = 7
	v10.SpringWaistRotation.Damp = 0.5
	v10.SpringWaistRotation.Freq = 7
	v10.SpringNeckRotation.Damp = 0.5
	v10.SpringNeckRotation.Freq = 7
	v10.SpringItemOffset:SetTarget(Vector3.new(0, 0, 0.2))
	v10.SpringWaistRotation:SetTarget(Vector3.new(-0.5, 0, 0))
	v10.SpringNeckRotation:SetTarget(Vector3.new(-0.5, 0, 0))
	v10:DefaultDisableCamLock()
	return v10
end
function v_u_6.InputBegan(p12, ...)
	-- upvalues: (copy) v_u_2
	v_u_2.InputBegan(p12, ...)
end
function v_u_6.InputEnded(_) end
return v_u_6
