-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYCVNjcmVlbkd1aQpQcm9kdWN0R3VpCXdvcmtzcGFjZQRMMThuDkZpbmRGaXJzdENoaWxkBmlwYWlycwtHZXRDaGlsZHJlbgpTdXJmYWNlR3VpCVRleHRMYWJlbAh3b3JsZC4lcwROYW1lBmZvcm1hdAtGb3JtYXRCeUtleQRUZXh0BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdQbGF5ZXJzC0xvY2FsUGxheWVyB3JlcXVpcmUMTG9jYWxpemF0aW9uBk1vZHVsZRJDaGluYVBvbGljeVNlcnZpY2UIUmVzb3VyY2UAAhABAQAABwAAAQMNIgItTQEAegAAAABNAgBrAQAAAKQDAwAAACBAbwUEALwDAwMFAAAAnwMDAg4DIQCkBAcAAABgQLwFA2gIAAAAnwUCAJ8EAARRBBgAbwsJALwJCAMFAAAAnwkDAkcJEwAAAAAAbwwKALwKCQMFAAAAnwoDAkcKDQAAAAAA+wsAAG8NCwBNDwi6DAAAALwNDY0NAAAAnw0DALwLC5sOAAAAnwsAAjALCvUPAAAAbgTn/wIAAICCAAEAEAMBAwIDAwQAACBAAwQDBQMGBAAAYEADBwMIAwkDCgMLAwwDDQMOAAgAARgAAAEAHQAAAAAAAQEAAAAAAAABAAAAAQABAAAAAQABAAAAAAAAAAAAAAD7ABcJAAAAAAcAAAECACCjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEBAAAAAEBvAwQAvAEBFgMAAACfAQMCTQIBMQUAAACkAwcAAABgQE0FAEAJAAAATQQFfAgAAACfAwICpAQHAAAAYEBNBgBiCwAAAE0FBowKAAAAnwQCAsAFDAASAAMAggUCAA0DDwQAAABAAxADEQMSAxMDFAQAAGBAAxUDFgMXAxgGAAEAAQABGAABAAAAAAABAAAAAAABAAEAAAAAAAABAAAAAAAAAgAAAQAAAAABkqiWEosee7agbPyGAfkqFnR9qfh8zd7XCb4blbSwYtqkhL2uscpPHQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local _ = game:GetService("Players").LocalPlayer
local v_u_2 = require(v1.Module.Localization)
require(v1.Resource.ChinaPolicyService)
return function(p3)
	-- upvalues: (copy) v_u_2
	local _ = p3.ScreenGui
	local _ = p3.ProductGui
	local v4 = workspace:FindFirstChild("L18n")
	if v4 then
		for _, v5 in ipairs(v4:GetChildren()) do
			local v6 = v5:FindFirstChild("SurfaceGui")
			if v6 ~= nil then
				local v7 = v6:FindFirstChild("TextLabel")
				if v7 ~= nil then
					v7.Text = v_u_2:FormatByKey(("world.%s"):format(v5.Name))
				end
			end
		end
	end
end
