-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXOEludmFsaWQgb3IgbWlzc2luZyBudW1iZXIgYXQgcG9zaXRpb24gJWQgaW4gVmVjdG9yIHR5cGUuBmZvcm1hdA52YWxpZGF0ZVZlY3Rvcgd2ZWN0b3IzDFJlZ2lzdGVyVHlwZQh2ZWN0b3IzcxBNYWtlTGlzdGFibGVUeXBlB3ZlY3RvcjIIdmVjdG9yMnMHcmVxdWlyZQZzY3JpcHQGUGFyZW50BlNoYXJlZARVdGlsEE1ha2VTZXF1ZW5jZVR5cGUMVmFsaWRhdGVFYWNoDVRyYW5zZm9ybUVhY2gLQ29uc3RydWN0b3IGTGVuZ3RoCHRvbnVtYmVyB1ZlY3RvcjMDbmV3B1ZlY3RvcjIAAwYCAAAABwAAAQMDBQILRwAIAAAAAICpAgAAbwMAAFIFAQC8AwONAQAAAJ8DAwCCAgAAqQIBAIICAgACAwEDAgADAwEYAAABAAAAAAAAAwAEAAAAAAYBAwAAAB1vAwAA+wQAALwBAN0BAAAAnwEEAW8DAgD7BQEATQQFJAMAAAD7BQAAnwQCALwBAN0BAAAAnwEAAW8DBAD7BAIAvAEA3QEAAACfAQQBbwMFAPsFAQBNBAUkAwAAAPsFAgCfBAIAvAEA3QEAAACfAQABggABAAYDBAMFAwYDBwMIAwkAGQABGAAAAAAAAQAAAAAAAAAAAgAAAAABAAAAAAAAAAABGgAAAAAGAAABAgA2owAAAKQAAQAAAABApAUDAAAAIEBNBAUkBAAAAE0DBCQEAAAATQIDEgUAAABNAQKeBgAAAJ8AAgLAAQcATQIAIwgAAADiAw0AMAEDkQkAAACkBA8AAADgQDAEA00KAAAApAQSAABEAIEwBAO3CwAAAIwEAwAwBAOtDAAAAJ8CAgJNAwAjCAAAAOIEDQAwAQSRCQAAAKQFDwAAAOBAMAUETQoAAACkBRQAAEQwgTAFBLcLAAAAjAUCADAFBK0MAAAAnwMCAsAEFQASAAIAEgAAABIAAwCCBAIAFgMKBAAAAEADCwQAACBAAwwDDQMOBgADDwMQAxEDEgMTBQQJCgsMAxQEAADgQAMVAxYEAEQAgQMXBABEMIEGAQIAAQEAARgAAAAAAAAAAAAAAAAAAAIIAAABAAEAAAABAAAAAQAA/AcAAAEAAQAAAAEAAAABAAD8BwAAAAABAAAAAAIrA2iVar5qCBnHAgHpzFKgufxrxmemmmH7Pvuzn9P8aXq/i7B2Si0x

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local function v4(p2, p3)
	if p2 == nil then
		return false, ("Invalid or missing number at position %d in Vector type."):format(p3)
	else
		return true
	end
end
local v_u_5 = v_u_1.MakeSequenceType({
	["ValidateEach"] = v4,
	["TransformEach"] = tonumber,
	["Constructor"] = Vector3.new,
	["Length"] = 3
})
local v_u_6 = v_u_1.MakeSequenceType({
	["ValidateEach"] = v4,
	["TransformEach"] = tonumber,
	["Constructor"] = Vector2.new,
	["Length"] = 2
})
return function(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_6
	p7:RegisterType("vector3", v_u_5)
	p7:RegisterType("vector3s", v_u_1.MakeListableType(v_u_5))
	p7:RegisterType("vector2", v_u_6)
	p7:RegisterType("vector2s", v_u_1.MakeListableType(v_u_6))
end
