-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXBE5hbWUJVHJhbnNmb3JtNU5vIHZhbGlkIHZlaGljbGUgbWFrZXMgd2l0aCB0aGF0IG5hbWUgY291bGQgYmUgZm91bmQuCFZhbGlkYXRlDEF1dG9jb21wbGV0ZQVQYXJzZQR0b29sDFJlZ2lzdGVyVHlwZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNTdGQKVGFibGVVdGlscwpDbWRyQ2xpZW50BlNoYXJlZARVdGlsA21hcAhSZXNvdXJjZQpJdGVtU3lzdGVtBk1vZGVscwtHZXRDaGlsZHJlbg9NYWtlRnV6enlGaW5kZXIABwIBAAAAAANNAQC6AAAAAIIBAgABAwEABgABGAAAAAcAAAAAAwEBAAAABPsBAABSAgAAnwECAIIBAAAAAAwCARgAAAAADQAAAAAEAQAAAAAIHAIAAIwDAAC3AwIAAgAAAKkBAAGpAQEAbwIAAIIBAwABAwMAEAQBGAAAAAAAAAAAEQAAAAABAQAAAAABggACAAAAFAUBGAAVAAAAAAIBAAAAAAITAQAAggECAAAAGAYBGAAAGQAAAAAFAQEAAAAGbwMAAPsEAAC8AQDdAQAAAJ8BBAGCAAEAAgMHAwgAHQABGAAAAAAAAR4AAAAABwAAAQIAOaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAKEGAAAATQIDGAcAAACfAQICpAIFAAAAQEBNBQAOCAAAAE0EBRIJAAAATQMEngoAAACfAgICTQMBkAsAAABNBgBiDAAAAE0FBvANAAAATQQF+A4AAAC8BARoDwAAAJ8EAgLABRAAnwMDAk0EAj0RAAAAUgUDAJ8EAgLiBRYAwAYXABIABAAwBgUhEgAAAMAGGAAwBgV2EwAAAMAGGQAwBgWrFAAAAMAGGgAwBgWbFQAAAMAGGwASAAUAggYCABwDCQQAAABAAwoDCwMMBAAAQEADDQMOAw8DEAMRAxIDEwMUAxUDFgYAAxcDAgMEAwUDBgUEEhMUFQYBBgIGAwYEBgUGAAECAwQFAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAAAAgAAAAAAAAAAAAAAAAMAAAACAQAAAAQAAAQAAAQAAAUAAAEAAAAABunZYrVwOp1E2x0IId+sAe6AVFMpt/aznH3v0+3AS0P9ScyYLuHZsVs=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Std.TableUtils)
local v3 = require(v1.CmdrClient.Shared.Util)
local v5 = v2.map(v1.Resource.ItemSystem.Models:GetChildren(), function(p4)
	return p4.Name
end)
local v_u_6 = v3.MakeFuzzyFinder(v5)
local v_u_11 = {
	["Transform"] = function(p7)
		-- upvalues: (copy) v_u_6
		return v_u_6(p7)
	end,
	["Validate"] = function(p8)
		return #p8 > 0, "No valid vehicle makes with that name could be found."
	end,
	["Autocomplete"] = function(p9)
		return p9
	end,
	["Parse"] = function(p10)
		return p10[1]
	end
}
return function(p12)
	-- upvalues: (copy) v_u_11
	p12:RegisterType("tool", v_u_11)
end
