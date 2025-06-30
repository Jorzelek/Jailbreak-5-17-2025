-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBmlwYWlycwlHZXRUYWdnZWQIQmFzZVBhcnQDSXNBBmFzc2VydAlDYXN0UG9pbnQBYwFzBkNGcmFtZQRTaXplDGlzUG9pbnRJblRhZwRnYW1lEUNvbGxlY3Rpb25TZXJ2aWNlCkdldFNlcnZpY2URUmVwbGljYXRlZFN0b3JhZ2UHcmVxdWlyZQNTdGQGUmVnaW9uC1JlZ2lvblV0aWxzAAILAgIAAAAmpAIBAAAAAED7AwAAUgUBALwDAwUCAAAAnwMDAJ8CAARRAhkAbwoDALwIBv4EAAAAnwgDAEwBAAKkBwYAAABQQJ8HAAH7CAEATQcIoQcAAADiCAoATQkGhQsAAAAwCQiCCAAAAE0JBi8MAAAAMAkIkgkAAABSCQAAnwcDAg4HAgCpBwEAggcCAG4C5v8CAACAqQIAAIICAgANAwEEAAAAQAMCAwMDBAMFBAAAUEADBgMHAwgFAggJAwkDCgAHCwEYAAAAAAAAAAAAAQAAAAAAAAABAAAAAAAAAAAAAAAAAAABAP0ABgAIAAAAAAYAAAECAB6jAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEBAAAAAEBvAwQAvAEBFgMAAACfAQMCpAIGAAAAUEBNBQGhBwAAAE0EBfMIAAAATQME/gkAAACfAgIC/wMBAAAAAADABAoAEgAAABIAAgAwBAOyCwAAAIIDAgAMAwwEAAAAQAMNAw4DDwMQBAAAUEADEQMSAxMGAAMLAQABAAEYAAEAAAAAAAEAAAAAAAEAAAAAAAAAAAIAAQAAAAAJAQAAAAABtJsSadE7Tq+GX3j9vSAZ9tD8FYnBopP0NjRyQy6nHOnsa6qZCzJEsQ==

-- Decompiled by Krnl

local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Std.Region.RegionUtils)
return {
	["isPointInTag"] = function(p4, p5)
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		for _, v6 in ipairs(v_u_1:GetTagged(p5)) do
			assert(v6:IsA("BasePart"))
			if v_u_3.CastPoint({
				["c"] = v6.CFrame,
				["s"] = v6.Size
			}, p4) then
				return true
			end
		end
		return false
	end
}
