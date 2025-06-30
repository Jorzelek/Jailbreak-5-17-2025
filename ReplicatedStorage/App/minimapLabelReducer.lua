-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZBXRpdGxlIm1pbmltYXAgbGFiZWwgbWlzc2luZyB1bmlxdWUgdGl0bGUGYXNzZXJ0B2ltYWdlSWQIcG9zaXRpb24OdXBkYXRlUG9zaXRpb24HYWRvcm5lZQttYXJrZXJDb2xvchF1cGRhdGVNYXJrZXJDb2xvcgV0YWJsZQZpbnNlcnQIYWRkTGFiZWwGaXBhaXJzD2FkZE1pbmltYXBMYWJlbAZsYWJlbHMObWlzc2luZyBsYWJlbHMFY2xvbmUQYWRkTWluaW1hcExhYmVscxJyZW1vdmVNaW5pbWFwTGFiZWwEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgAFBgIAAAAALE0DAZoAAAAAgQEDBAEAAABvBAEApAIDAAAAIECfAgMB4gQKAE0FAZoAAAAAMAUEmgAAAABNBQG2BAAAADAFBLYEAAAATQUB2wUAAAAwBQTbBQAAAE0FAfkGAAAAMAUE+QYAAABNBQE0BwAAADAFBDQHAAAATQUBSwgAAAAwBQRLCAAAAE0FAfgJAAAAMAUE+AkAAACeNAAEBAAAAFIDAACkAg0AADCwgJ8CAwGCAAEADgMBAwIDAwQAACBAAwQDBQMGAwcDCAMJBQcABAUGBwgJAwoDCwQAMLCAAAYMARgAAAAAAAAAAAEBAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAAAA+QAACQcAAAAACwIBAAAAI00DAZoAAAAAgQEDBAEAAABvBAEApAIDAAAAIECfAgMB/wIAAAAAAACkAwUAAABAQFIEAACfAwIEUQMNAE0IB5oAAAAATQkBmgAAAADxCAgACQAAAJ40AgUHAAAAUgkCAFIKBwCkCAgAABxggJ8IAwFuA/L/AgAAgPsDAABSBAIAUgUBAJ8DAwGCAgIACQMBAwIDAwQAACBAAw0EAABAQAMKAwsEABxggAATDgEYAAAAAAAAAAABAAEAAAAAAQAAAAAAAQAAAAAAAP4ABQAAAAEUAAAAAAsCAQAAABlNAwE/AAAAAIEBAwQBAAAAbwQBAKQCAwAAACBAnwIDAaQCBgAAFECAUgMAAJ8CAgKkAwgAAABwQE0EAT8AAAAAnwMCBFEDBAD7CAAAUgkCAFIKBwCfCAMBbgP7/wIAAICCAgIACQMPAxADAwQAACBAAwoDEQQAFECAAw0EAABwQAAeEgEYAAAAAAAAAAABAAAAAQAAAAAAAQAAAP8AAx8AAAAACwIAAAAAH00DAZoAAAAAgQEDBAEAAABvBAEApAIDAAAAIECfAgMB/wIAAAAAAACkAwUAAABAQFIEAACfAwIEUQMNAE0IB5oAAAAATQkBmgAAAADxCAgACQAAAJ40AgUHAAAAUgkCAFIKBwCkCAgAABxggJ8IAwFuA/L/AgAAgIICAgAJAwEDAgMDBAAAIEADDQQAAEBAAwoDCwQAHGCAACYTARgAAAAAAAAAAAEAAQAAAAABAAAAAAABAAAAAAAA/gAFJwAAAAAHAAABAgAfowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIApwYAAACfAQICwAIHAE0DAdYIAAAA/wQAAAAAAADiBQwAwAYNABIAAgAwBgWYCQAAAMAGDgASAAIAMAYFEgoAAADABg8AMAYFTgsAAACfAwMAggMAABADFAQAAABAAxUDFgMXBAAAQEADGAYAAxkDDgMSAxMFAwkKCwYBBgIGAwQAAQIDAQABGAABAAAAAAABAAAAAAMMAAAAAAEAAAALAAAACAAA7AABAAAAAAQN6v8YApOU2D8ulYwcx0xLQjdqgWir05DAIqxzUpWi/bMEFRzZDcRS

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local function v_u_6(p2, p3)
	local v4 = p3.title
	assert(v4, "minimap label missing unique title")
	local v5 = {
		["title"] = p3.title,
		["imageId"] = p3.imageId,
		["position"] = p3.position,
		["updatePosition"] = p3.updatePosition,
		["adornee"] = p3.adornee,
		["markerColor"] = p3.markerColor,
		["updateMarkerColor"] = p3.updateMarkerColor
	}
	table.insert(p2, v5)
end
return require(v1.Rodux).createReducer({}, {
	["addMinimapLabel"] = function(p7, p8)
		-- upvalues: (copy) v_u_6
		local v9 = p8.title
		assert(v9, "minimap label missing unique title")
		local v10 = {}
		for _, v11 in ipairs(p7) do
			if v11.title ~= p8.title then
				table.insert(v10, v11)
			end
		end
		v_u_6(v10, p8)
		return v10
	end,
	["addMinimapLabels"] = function(p12, p13)
		-- upvalues: (copy) v_u_6
		local v14 = p13.labels
		assert(v14, "missing labels")
		local v15 = table.clone(p12)
		for _, v16 in ipairs(p13.labels) do
			v_u_6(v15, v16)
		end
		return v15
	end,
	["removeMinimapLabel"] = function(p17, p18)
		local v19 = p18.title
		assert(v19, "minimap label missing unique title")
		local v20 = {}
		for _, v21 in ipairs(p17) do
			if v21.title ~= p18.title then
				table.insert(v20, v21)
			end
		end
		return v20
	end
})
