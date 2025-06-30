-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMyDGNvcm5lclJhZGl1cwpUZXh0QnV0dG9uD2JhY2tncm91bmRDb2xvchBCYWNrZ3JvdW5kQ29sb3IzBHNpemUEU2l6ZQhwb3NpdGlvbghQb3NpdGlvbgthbmNob3JQb2ludAtBbmNob3JQb2ludAAEVGV4dApTZWxlY3RhYmxlBUV2ZW50CUFjdGl2YXRlZAdvbkNsaWNrBkNvcm5lcgVUaXRsZQhVSUNvcm5lcgxDb3JuZXJSYWRpdXMJVGV4dExhYmVsFkJhY2tncm91bmRUcmFuc3BhcmVuY3kERm9udApMaW5lSGVpZ2h0ClRleHRTY2FsZWQOVGV4dFhBbGlnbm1lbnQOVGV4dFlBbGlnbm1lbnQKVGV4dENvbG9yMwVVRGltMglmcm9tU2NhbGUFdGl0bGUERW51bQdCYW5nZXJzBkNlbnRlcgpzYXR1cmF0ZUJ5BlN0cm9rZQhVSVN0cm9rZQVDb2xvcglUaGlja25lc3MGQ29sb3IzA25ldw9idXR0b25Db21wb25lbnQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9hY3QDU3RkCkNvbG9yVXRpbHMNY3JlYXRlRWxlbWVudAACEQEDAAAAck0BAG8AAAAA+wIAAG8DAQD/BAQAAAAAAE0FAA4CAAAAMAUEnwMAAABNBQAPBAAAADAFBC8FAAAATQUA2wYAAAAwBQQ7BwAAAE0FAAgIAAAAMAUE6AkAAABvBQoAMAUE9QsAAACpBQEAMAUEJAwAAAD7BwEATQYHNg0AAABNBQYeDgAAAE0GAG4PAAAAagYEBeIFEgBSBgEADgYGAPsGAABvBxMA4ggVADABCE8UAAAAnwYDAjAGBWoQAAAA+wYAAG8HFgDiCB4AjAkBADAJCDoXAAAApAkhAACA8IGMCgEAjAsBAJ8JAwIwCQgvBQAAAE0JAJoiAAAAMAkI9QsAAACkCSUAJGAwwjAJCDkYAAAAjAkBADAJCIIZAAAAqQkBADAJCN4aAAAApAknACZsMMIwCQh7GwAAAKQJKAAmcDDCMAkIHRwAAAD7CgIATQkK3ikAAABNCgAOAgAAAG8LKgCfCQMCMAkIcx0AAADiCSwA+woAAG8LLQDiDDAApA0zAADIEIOMDgAAjA8AAIwQAACfDQQCMA0MpC4AAACMDQEAMA0MGC8AAACfCgMCMAoJpSsAAACfBgQCMAYFuhEAAACfAgQAggIAADQDAQMCAwMDBAMFAwYDBwMIAwkDCgMLAwwDDQMOAw8DEAMRAxIFAhARAxMDFAUBFAMVAxYDFwMYAxkDGgMbAxwFCRcFCxgZGhscHQMdAx4EAIDwgQMfAyADIQQkYDDCAyIEJmwwwgQmcDDCAyMCZmZmZmZm5r8DJAUBKwMlAyYDJwUCLi8DKAMpBADIEIMAByoBGAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAABAAABAAAAAAAAAAEBAAAAAAEA/wAAAwAAAQAAAQAAAAAAAAEAAAABAAAAAQAAAQAAAQAAAAEAAAABAAAAAAAAAAABAQAAAQAAAAAAAAACAAD9AAD1AAD0AAgAAAAABQAAAQIAGqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CACEGAAAAnwECAqQCBQAAAEBATQQAoQcAAABNAwQzCAAAAJ8CAgJNAwHKCQAAAMAECgASAAMAEgABABIAAgCCBAIACwMrBAAAAEADLAMtAy4EAABAQAMvAzADMQMyBgABAAEAARgAAQAAAAAAAQAAAAABAAAAAAAAAQACAAAAIgEAAAAAAa7OnMBSWqGNnAr2VLrYSgyOxCjkvIwy6gaQHNoyaEumqY6JyFfNjVo=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Roact)
local v_u_3 = require(v1.Std.ColorUtils)
local v_u_4 = v_u_2.createElement
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v6 = p5.cornerRadius
	local v7 = v_u_4
	local v8 = "TextButton"
	local v9 = {
		["BackgroundColor3"] = p5.backgroundColor,
		["Size"] = p5.size,
		["Position"] = p5.position,
		["AnchorPoint"] = p5.anchorPoint,
		["Text"] = "",
		["Selectable"] = true,
		[v_u_2.Event.Activated] = p5.onClick
	}
	local v10 = {}
	if v6 then
		v6 = v_u_4("UICorner", {
			["CornerRadius"] = v6
		})
	end
	v10.Corner = v6
	local v11 = v_u_4
	local v12 = {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1),
		["Text"] = p5.title,
		["Font"] = Enum.Font.Bangers,
		["LineHeight"] = 1,
		["TextScaled"] = true,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["TextColor3"] = v_u_3.saturateBy(p5.backgroundColor, -0.7)
	}
	local v13 = {
		["Stroke"] = v_u_4("UIStroke", {
			["Color"] = Color3.new(0, 0, 0),
			["Thickness"] = 1
		})
	}
	v10.Title = v11("TextLabel", v12, v13)
	return v7(v8, v9, v10)
end
