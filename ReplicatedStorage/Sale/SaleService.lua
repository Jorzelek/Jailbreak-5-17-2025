-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWCGdldFN0YXRlBHR5cGUIcGFnZU5hbWUMY2F0ZWdvcnlOYW1lBnNvcnRJZAdzZXRQYWdlCmdhcmFnZVBhZ2UOZ2FyYWdlQ2F0ZWdvcnkKZ2FyYWdlU29ydAhkaXNwYXRjaA1vblNhbGVSZWZyZXNoB0Nvbm5lY3QEaW5pdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNBcHAFc3RvcmUGc2NyaXB0BlBhcmVudApTYWxlU2hhcmVkAAMFAAEAAAAZ+wAAALwAABYAAAAAnwACAvsBAADiAwUAbwQGADAEA3EBAAAATQQA+gcAAAAwBAPpAgAAAE0EAF0IAAAAMAQDvgMAAABNBAAyCQAAADAEA6YEAAAAvAEBTAoAAACfAQMBggABAAsDAQMCAwMDBAMFBQQBAgMEAwYDBwMIAwkDCgAIAAEYAAAAAAEAAQAAAQAAAAEAAAABAAAA/AAABgkAAAAAAwACAAAACfsBAABNAAFAAAAAAMACAQASAgEAvAAAxwIAAACfAAMBggABAAMDCwYAAwwBAAcNARgAAAAAAAAAAAkIAAAAAAYAAAECAB+jAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwDBBgAAAE0CA34HAAAAnwECAqQCBQAAAEBApAUJAAAAgEBNBAUkCgAAAE0DBO4LAAAAnwICAv8DAQAAAAAAwAQMABIAAgASAAEAMAQDEw0AAACCAwIADgMOBAAAAEADDwMQAxEEAABAQAMSAxMDFAQAAIBAAxUDFgYBAw0BAQEAARgAAQAAAAAAAQAAAAAAAAEAAAAAAAAAAAEAAgAAAAALAQAAAAACW6p1DDvAjqlpbh+YZB0MgI55fWQNY0G17NLpj/y9kHTW/e1z8vXnIQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.App.store)
local v_u_3 = require(script.Parent.SaleShared)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		v_u_3.onSaleRefresh:Connect(function()
			-- upvalues: (ref) v_u_2
			local v4 = v_u_2:getState()
			v_u_2:dispatch({
				["type"] = "setPage",
				["pageName"] = v4.garagePage,
				["categoryName"] = v4.garageCategory,
				["sortId"] = v4.garageSort
			})
		end)
	end
}
