-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMhA25ldwRtYWlkBGluaXQFVURpbTIFcHJvcHMJcGN0Q2xvc2VkA21hcAVGcmFtZQRTaXplFkJhY2tncm91bmRUcmFuc3BhcmVuY3kDVG9wBkJvdHRvbRBCYWNrZ3JvdW5kQ29sb3IzC0FuY2hvclBvaW50CFBvc2l0aW9uD0JvcmRlclNpemVQaXhlbAZDb2xvcjMHVmVjdG9yMgZyZW5kZXIIZGlkTW91bnQKRG9DbGVhbmluZwt3aWxsVW5tb3VudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNTdGQETWFpZAVSb2FjdA1jcmVhdGVFbGVtZW50DVB1cmVDb21wb25lbnQHRXllbGlkcwZleHRlbmQABgMBAQAAAAf7AgAATQEC7wAAAACfAQECMAEAFgEAAACCAAEAAgMBAwIACAMBGAAAAAAAAAEJAAAAAAYBAAAAAAikAQIAAAQAgIwCAQCMAwAAPgQAA4wFAACfAQUAggEAAAQDBAMBBAAEAIACAAAAAAAAAEAADAABGAAAAAAAAAAADQAAAAAOAQEAAABgTQIABwAAAABNAQK1AQAAAMADAgC8AQGQAwAAAJ8BAwL7AgAAbwMEAOIEBwCkBQoAACSAgIwGAQCMBwAAjAgBAIwJAACfBQUCMAUELwUAAACMBQEAMAUEOgYAAADiBQ0A+wYAAG8HBADiCBIApAkUAAAkMIGMCgAAjAsAAIwMAACfCQQCMAkInw4AAACkCRYAACRQgW8KFwCMCwAAnwkDAjAJCOgPAAAApAkKAAAkgIBvChcAjAsAAIwMAACMDQAAnwkFAjAJCDsQAAAAMAEILwUAAACMCQAAMAkIjhEAAACfBgMCMAYFmAsAAAD7BgAAbwcEAOIIEgCkCRQAACQwgYwKAACMCwAAjAwAAJ8JBAIwCQifDgAAAKQJFgAAJFCBbwoXAIwLAQCfCQMCMAkI6A8AAACkCQoAACSAgG8KFwCMCwAAjAwBAIwNAACfCQUCMAkIOxAAAAAwAQgvBQAAAIwJAAAwCQiOEQAAAJ8GAwIwBgUTDAAAAJ8CBACCAgAAGAMFAwYGAQMHAwgDCQMKBQIFBgMEAwEEACSAgAMLAwwFAgsMAw0DDgMPAxAFBQ4PEAURAxEEACQwgQMSBAAkUIECAAAAAAAA4D8BAQsTARgAAAAAAAAAAAMAAAEAAAAAAAAAAAEAAAEBAAABAAAAAAAAAAEAAAAAAAABAAAAAAAAAAABAAEAAPsAAAcAAAEAAAAAAAAAAQAAAAAAAAEAAAAAAAAAAAEAAQAA+wAA9QAMAAAAAAEBAAAAAAGCAAEAAAAjFAEYACMAAAAAAwEAAAAABk0BABYAAAAAvAEBUQEAAACfAQIBggABAAIDAgMVACQWARgAAAAAAAElAAAAAAcAAAECACqjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwChBgAAAE0CA3YHAAAAnwECAqQCBQAAAEBATQMAIQgAAACfAgICTQMCygkAAABNBAL4CgAAAG8GCwC8BAScDAAAAJ8EAwLABQ0AEgABADAFBBMOAAAAwAUPABIAAwAwBQSAEAAAAMAFEQAwBQRqEgAAAMAFEwAwBQQ0FAAAAIIEAgAVAxcEAAAAQAMYAxkDGgQAAEBAAxsDHAMdAx4DHwMgAyEGAAMDBgIDEwYDAxQGBAMWBAACAwQBAAEYAAEAAAAAAAEAAAAAAAABAAAAAAEAAgAAAAAAAQAAAAMAAAAYAAABAAADAQAAAAAFuHnqjx2OlbuKvYAbZjOkVCi7rLsKRLLbcQ3cXbNqpnFyqr4OTv+r8w==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.Maid)
local v3 = require(v1.Roact)
local v_u_4 = v3.createElement
local v5 = v3.PureComponent:extend("Eyelids")
function v5.init(p6)
	-- upvalues: (copy) v_u_2
	p6.maid = v_u_2.new()
end
function v5.render(p7)
	-- upvalues: (copy) v_u_4
	local v9 = p7.props.pctClosed:map(function(p8)
		return UDim2.new(1, 0, p8 / 2, 0)
	end)
	local v10 = v_u_4
	local v11 = {
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundTransparency"] = 1
	}
	local v12 = {
		["Top"] = v_u_4("Frame", {
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["Size"] = v9,
			["BorderSizePixel"] = 0
		}),
		["Bottom"] = v_u_4("Frame", {
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["Position"] = UDim2.new(0.5, 0, 1, 0),
			["Size"] = v9,
			["BorderSizePixel"] = 0
		})
	}
	return v10("Frame", v11, v12)
end
function v5.didMount(_) end
function v5.willUnmount(p13)
	p13.maid:DoCleaning()
end
return v5
