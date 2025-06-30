-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMmBGluaXQKSW1hZ2VMYWJlbAhQb3NpdGlvbg9Cb3JkZXJTaXplUGl4ZWwQQmFja2dyb3VuZENvbG9yMxZCYWNrZ3JvdW5kVHJhbnNwYXJlbmN5BUltYWdlBFNpemUFcHJvcHMIcG9zaXRpb24GQ29sb3IzA25ldy5yYnh0aHVtYjovL3R5cGU9QXZhdGFySGVhZFNob3Qmdz0xNTAmaD0xNTAmaWQ9BnVzZXJJZAh0b3N0cmluZwRzaXplCFVJQ29ybmVyCFVJU3Ryb2tlDVVJQXNwZWN0UmF0aW8MQ29ybmVyUmFkaXVzBFVEaW0IaXNGcmllbmQJVGhpY2tuZXNzBUNvbG9yB2Zyb21IZXgGNWNjNzZkF1VJQXNwZWN0UmF0aW9Db25zdHJhaW50C0FzcGVjdFJhdGlvBnJlbmRlcgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2FjdA1jcmVhdGVFbGVtZW50DVB1cmVDb21wb25lbnQGQXZhdGFyBmV4dGVuZAADAQEAAAAAAYIAAQAAAAcBARgABwAAAAALAQEAAABW+wEAAG8CAADiAwcATQUABwgAAABNBAXbCQAAADAEAzsBAAAAjAQAADAEA44CAAAApAQMAAAsoIBvBQ0AbwYNAG8HDQCfBAQCMAQDnwMAAACMBAAAMAQDOgQAAABvBQ4ATQgABwgAAABNBwiGDwAAALs/BwKkBhEAAAAAQZ8GAgJzBAUGMAQDqQUAAABNBQAHCAAAAE0EBQ8SAAAAMAQDLwYAAADiBBYA+wUAAG8GEwDiBxgApAgaAAAskIGMCQEAjAoAAJ8IAwIwCAdPFwAAAJ8FAwIwBQT0EwAAAE0GAAcIAAAATQUGQBsAAAAOBQ0A+wUAAG8GFADiBx4AjAgBADAIBxgcAAAApAggAAB8oIBvCSEAnwgCAjAIB6QdAAAAnwUDAjAFBG0UAAAA+wUAAG8GIgDiByQAjAgBADAIB2kjAAAAnwUDAjAFBIAVAAAAnwEEAIIBAAAlAwIDAwMEAwUDBgMHAwgFBgECAwQFBgMJAwoDCwMMBAAsoIACZmZmZmZm5j8DDQMOAw8EAAAAQQMQAxEDEgMTBQMTFBUDFAUBFwMVBAAskIEDFgMXAxgFAhwdAxkEAHyggAMaAxsDHAUBIwAIHQEYAAAAAQAAAAAAAQAAAQAAAAAAAAABAAABAAAAAAAAAAAAAAADAAAAAAABAQAAAQAAAAAAAP8AAAMAAAAAAAAAAQAAAQAAAAAA/gAABAAAAQAA/wAA7wAKAAAAAAYAAAECAByjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgAhBgAAAJ8BAgJNAgHKBwAAAE0DAfgIAAAAbwUJALwDA5wKAAAAnwMDAsAECwAwBAMTDAAAAMAEDQASAAIAMAQDgA4AAACCAwIADwMeBAAAAEADHwMgAyEEAABAQAMiAyMDJAMlAyYGAAMBBgEDHQIAAQEAARgAAQAAAAAAAQAAAAABAAIAAAAAAAEAAAEAAAAZAQAAAAACyUJuoB41OcH7hgQ0fqqrAF66sKqovrqQznYoyklFl34IUHTcWAx9Vg==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Roact)
local v_u_3 = v2.createElement
local v4 = v2.PureComponent:extend("Avatar")
function v4.init(_) end
function v4.render(p5)
	-- upvalues: (copy) v_u_3
	local v6 = v_u_3
	local v7 = "ImageLabel"
	local v8 = {
		["Position"] = p5.props.position,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = Color3.new(0.7, 0.7, 0.7),
		["BackgroundTransparency"] = 0
	}
	local v9 = p5.props.userId
	v8.Image = "rbxthumb://type=AvatarHeadShot&w=150&h=150&id=" .. tostring(v9)
	v8.Size = p5.props.size
	local v10 = {
		["UICorner"] = v_u_3("UICorner", {
			["CornerRadius"] = UDim.new(1, 0)
		})
	}
	local v11 = p5.props.isFriend
	if v11 then
		v11 = v_u_3("UIStroke", {
			["Thickness"] = 1,
			["Color"] = Color3.fromHex("5cc76d")
		})
	end
	v10.UIStroke = v11
	v10.UIAspectRatio = v_u_3("UIAspectRatioConstraint", {
		["AspectRatio"] = 1
	})
	return v6(v7, v8, v10)
end
return v4
