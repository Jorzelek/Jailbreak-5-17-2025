-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMDGdyb3VwQWxsb3dlZAhFeGVjdXRvcgVHcm91cC1Zb3UgZG9uJ3QgaGF2ZSBwZXJtaXNzaW9uIHRvIHJ1biB0aGlzIGNvbW1hbmQJQmVmb3JlUnVuDFJlZ2lzdGVySG9vawRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQ5DbWRyUGVybWlzc2lvbgdDbWRyRXh0AAMEAQEAAAAM+wIAAE0BAh8AAAAATQIA/wEAAABNAwDEAgAAAJ8BAwIOAQEAggABAG8BAwCCAQIABAMBAwIDAwMEAAcAARgAAAAAAAAAAAABAgAIAAAAAAUBAQAAAAdvAwAAwAQBABICAAC8AQDvAgAAAJ8BBAGCAAEAAwMFBgADBgEABgABGAAAAAAAAAYHAAAAAAQAAAECABGjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwD+BwAAAE0CA1gGAAAAnwECAsACCAASAAEAggICAAkDBwQAAABAAwgDCQMKBAAAQEADCwMMBgEBAQEAARgAAQAAAAAAAQAAAAAAAAMAAAEAAAAAAq9E4p4gIfJrnYCICntOgWbYaTlxdLMkv5tBGUd2XHK+PhHP+HbSwwM=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.CmdrExt.CmdrPermission)
return function(p3)
	-- upvalues: (copy) v_u_2
	p3:RegisterHook("BeforeRun", function(p4)
		-- upvalues: (ref) v_u_2
		if not v_u_2.groupAllowed(p4.Executor, p4.Group) then
			return "You don\'t have permission to run this command"
		end
	end)
end
