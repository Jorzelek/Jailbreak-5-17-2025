-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMnBmlwYWlycwVwcm9wcwdlbnRyaWVzBHJhbmsEbmFtZQZ1c2VySWQHbWVzc2FnZQVGcmFtZRZCYWNrZ3JvdW5kVHJhbnNwYXJlbmN5BFNpemUFVURpbTIDbmV3BW1lcmdlCkxpc3RMYXlvdXQMVUlMaXN0TGF5b3V0E0hvcml6b250YWxBbGlnbm1lbnQRVmVydGljYWxBbGlnbm1lbnQJU29ydE9yZGVyDUZpbGxEaXJlY3Rpb24ERW51bQZDZW50ZXIDVG9wC0xheW91dE9yZGVyCFZlcnRpY2FsBnJlbmRlcgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQRFelVpCkRpY3Rpb25hcnkFUm9hY3QNY3JlYXRlRWxlbWVudApCb2FyZEVudHJ5BnNjcmlwdAZQYXJlbnQNUHVyZUNvbXBvbmVudAVCb2FyZAZleHRlbmQAAgsBAwAAAEz/AQAAAAAAAKQCAQAAAABATQUABwIAAABNAwU3AwAAAJ8CAgRRAhMA+wcAAPsIAQDiCQgAMAUJvwQAAABNCgZaBQAAADAKCVoFAAAATQoGhgYAAAAwCgmGBgAAAE0KBpgHAAAAMAoJmAcAAACfBwMCagcBBW4C7P8CAACA+wIAAG8DCQDiBAwAjAUBADAFBDoKAAAApAUPAAA40ICMBgEAjAcAAIwIAQCMCQAAnwUFAjAFBC8LAAAA+wYCAE0FBh8QAAAA4gYSAPsHAABvCBMA4gkYAKQKGwAaUJDBMAoJYhQAAACkCh0AHFSQwTAKCXgVAAAApAofAB5YkMEwCgm5FgAAAKQKIQAgXJDBMAoJURcAAACfBwMCMAcGLhEAAABSBwEAnwUDAJ8CAACCAgAAIgMBBAAAAEADAgMDAwQDBQMGAwcFBAQFBgcDCAMJAwoFAgoLAwsDDAQAONCAAw0DDgUBEQMPAxADEQMSAxMFBBQVFhcDFAMVBBpQkMEDFgQcVJDBAxcEHliQwQMYBCBckMEAChkBGAAAAQAAAAAAAAABAAABAAEAAAABAAAAAQAAAPwA/wAIAQEBAAABAAAAAAAAAAACAAAAAQAAAQAAAAEAAAABAAAAAQAAAPwAAAb5+gALAAAAAAgAAAECACujAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwAtBgAAAE0CA6kHAAAAnwECAqQCBQAAAEBATQMAIQgAAACfAgICTQMCygkAAACkBAUAAABAQKQHDAAAALBATQYHJA0AAABNBQZjCgAAAJ8EAgJNBQL4DgAAAG8HDwC8BQWcEAAAAJ8FAwLABhEAEgADABIABAASAAEAMAYFgBIAAACCBQIAEwMaBAAAAEADGwMcAx0EAABAQAMeAx8DIAMhAyIDIwQAALBAAyQDJQMmAycGAAMZAQABAAEYAAEAAAAAAAEAAAAAAAABAAAAAAEAAgAAAAAAAAAAAgAAAAAAAQAAAAAAGgEAAAAAAU7LWu8rH7tnfA8we0rgy6d6b5MQr4ZlM1IIbcwVPZWhabiC7I5M14Y=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.EzUi.Dictionary)
local v3 = require(v1.Roact)
local v_u_4 = v3.createElement
local v_u_5 = require(script.Parent.BoardEntry)
local v6 = v3.PureComponent:extend("Board")
function v6.render(p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	local v8 = {}
	for v9, v10 in ipairs(p7.props.entries) do
		v8[v9] = v_u_4(v_u_5, {
			["rank"] = v9,
			["name"] = v10.name,
			["userId"] = v10.userId,
			["message"] = v10.message
		})
	end
	local v11 = v_u_4
	local v12 = {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v13 = v_u_2.merge
	local v14 = {
		["ListLayout"] = v_u_4("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical
		})
	}
	return v11("Frame", v12, v13(v14, v8))
end
return v6
