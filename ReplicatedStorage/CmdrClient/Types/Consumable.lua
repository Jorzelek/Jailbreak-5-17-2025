-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTCVRyYW5zZm9ybTJObyB2YWxpZCBjb25zdW1hYmxlIHdpdGggdGhhdCBuYW1lIGNvdWxkIGJlIGZvdW5kLghWYWxpZGF0ZQxBdXRvY29tcGxldGUFUGFyc2UKY29uc3VtYWJsZQxSZWdpc3RlclR5cGUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUKQ21kckNsaWVudAZTaGFyZWQEVXRpbAtDb25zdW1hYmxlcw9Db25zdW1hYmxlc0RhdGEFdGFibGUGaW5zZXJ0D01ha2VGdXp6eUZpbmRlcgAGAwEBAAAABPsBAABSAgAAnwECAIIBAAAAAA0BARgAAAAADgAAAAAEAQAAAAAIHAIAAIwDAAC3AwIAAgAAAKkBAAGpAQEAbwIAAIIBAwABAwIAEQMBGAAAAAAAAAAAEgAAAAABAQAAAAABggACAAAAFQQBGAAWAAAAAAIBAAAAAAITAQAAggECAAAAGQUBGAAAGgAAAAAFAQEAAAAGbwMAAPsEAAC8AQDdAQAAAJ8BBAGCAAEAAgMGAwcAHgABGAAAAAAAAR8AAAAADAAAAQAAO6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0EAA4GAAAATQMEEgcAAABNAgOeCAAAAJ8BAgKkAgUAAABAQE0EAMgJAAAATQMECAoAAACfAgIC/wMAAAAAAABSBAIAxgUAAMYGAABkBAcAnjQDBQcAAABSCgMAUgsHAKQJDQAAMLCAnwkDAW4E+P8CAAAATQQBPQ4AAABSBQMAnwQCAuIFEwDABhQAEgAEADAGBSEPAAAAwAYVADAGBXYQAAAAwAYWADAGBasRAAAAwAYXADAGBZsSAAAAwAYYABIABQCCBgIAGQMIBAAAAEADCQMKAwsEAABAQAMMAw0DDgMPAxADEQMSBAAwsIADEwMBAwMDBAMFBQQPEBESBgAGAQYCBgMGBAUAAQIDBAEAARgAAQAAAAAAAQAAAAAAAAAAAQAAAAAAAAIAAQAAAAEAAAAAAAD/AAMAAAACAQAAAAQAAAQAAAQAAAUAAAEAAAAABYS/T0JnmojGtnsl1swNzsxBplGyVYaL2eTYnyJiqNrIZfevNGyHzi0=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.CmdrClient.Shared.Util)
local v3 = {}
for v4, _ in require(v1.Consumables.ConsumablesData) do
	table.insert(v3, v4)
end
local v_u_5 = v2.MakeFuzzyFinder(v3)
local v_u_10 = {
	["Transform"] = function(p6)
		-- upvalues: (copy) v_u_5
		return v_u_5(p6)
	end,
	["Validate"] = function(p7)
		return #p7 > 0, "No valid consumable with that name could be found."
	end,
	["Autocomplete"] = function(p8)
		return p8
	end,
	["Parse"] = function(p9)
		return p9[1]
	end
}
return function(p11)
	-- upvalues: (copy) v_u_10
	p11:RegisterType("consumable", v_u_10)
end
