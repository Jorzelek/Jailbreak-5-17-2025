-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMrClRleHRCdXR0b24FcHJvcHMLYW5jaG9yUG9pbnQLQW5jaG9yUG9pbnQKYm9yZGVyU2l6ZQ9Cb3JkZXJTaXplUGl4ZWwLYm9yZGVyQ29sb3IMQm9yZGVyQ29sb3IzD2JhY2tncm91bmRDb2xvchBCYWNrZ3JvdW5kQ29sb3IzBHRleHQEVGV4dAl0ZXh0Q29sb3IKVGV4dENvbG9yMwRzaXplBFNpemUERW51bQRGb250DlNvdXJjZVNhbnNCb2xkClRleHRTY2FsZWQIcG9zaXRpb24IUG9zaXRpb24LbGF5b3V0T3JkZXILTGF5b3V0T3JkZXIHdmlzaWJsZQdWaXNpYmxlBUV2ZW50CUFjdGl2YXRlZAdvbkNsaWNrCENoaWxkcmVuBnJlbmRlcgZzY3JpcHQERXpVaRFGaW5kRmlyc3RBbmNlc3RvcgdyZXF1aXJlBlBhcmVudAVSb2FjdA1jcmVhdGVFbGVtZW50CUNvbXBvbmVudAZleHRlbmQGQ29sb3IzA25ldwxkZWZhdWx0UHJvcHMAAggBAgAAAFn7AQAAbwIAAP8DBQAAAAAATQUABwEAAABNBAUIAgAAADAEA+gDAAAATQUABwEAAABNBAVpBAAAADAEA44FAAAATQUABwEAAABNBAWLBgAAADAEAzQHAAAATQUABwEAAABNBAUOCAAAADAEA58JAAAATQUABwEAAABNBAXVCgAAADAEA/ULAAAATQUABwEAAABNBAW/DAAAADAEA3MNAAAATQUABwEAAABNBAUPDgAAADAEAy8PAAAApAQTABJEAMEwBAM5EQAAAKkEAQAwBAPeFAAAAE0FAAcBAAAATQQF2xUAAAAwBAM7FgAAAE0FAAcBAAAATQQFIBcAAAAwBAMAGAAAAE0FAAcBAAAATQQFoBkAAAAwBAOAGgAAAPsGAQBNBQY2GwAAAE0EBR4cAAAATQYABwEAAABNBQZuHQAAAGoFAwRNBQAHAQAAAPsHAQBNBgfOHgAAAIcEBQafAQQAggEAAB8DAQMCAwMDBAMFAwYDBwMIAwkDCgMLAwwDDQMOAw8DEAMRAxIDEwQSRADBAxQDFQMWAxcDGAMZAxoDGwMcAx0DHgAPHwEYAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAEAAAABAAABAAAAAAABAAAAAAABAAAAAAABAAAAAAAAAAAAAQAAAAAA8gAQAAAAAAkAAAECADqjAAAApAABAAAAAEBvAgIAvAAAfAMAAACfAAMCpAEFAAAAQEBNAwAkBgAAAE0CAyEHAAAAnwECAk0CAcoIAAAATQMBiAkAAABvBQoAvAMDnAsAAACfAwMC4gQQAKQFEwAASBCBjAYBAIwHAQCMCAEAnwUEAjAFBA4MAAAApAUTAABIEIGMBgAAjAcAAIwIAACfBQQCMAUEvw0AAACMBQAAMAUEaQ4AAACkBRMAAEgQgYwGAACMBwAAjAgAAJ8FBAIwBQSLDwAAADAEA5IUAAAAwAQVABIAAgASAAEAMAQDgBYAAACCAwIAFwMgBAAAAEADIQMiAyMEAABAQAMkAyUDJgMnAwEDKAMJAw0DBQMHBQQMDQ4PAykDKgQASBCBAysGAAMfAQABAAEYAAEAAAAAAAEAAAAAAAABAAIAAAAAAAIBAAAAAAAAAAEAAAAAAAAAAQAAAQAAAAAAAAD8AAcAAAAAEQEAAAAAAXKCDgviMw71QEZkny3U1eqylqx97xhFNGlylO+OsZFOxEJhiXZ9KAs=

-- Decompiled by Krnl

local v1 = script:FindFirstAncestor("EzUi")
local v_u_2 = require(v1.Parent.Roact)
local v_u_3 = v_u_2.createElement
local v4 = v_u_2.Component:extend("TextButton")
v4.defaultProps = {
	["backgroundColor"] = Color3.new(1, 1, 1),
	["textColor"] = Color3.new(0, 0, 0),
	["borderSize"] = 0,
	["borderColor"] = Color3.new(0, 0, 0)
}
function v4.render(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3("TextButton", {
		["AnchorPoint"] = p5.props.anchorPoint,
		["BorderSizePixel"] = p5.props.borderSize,
		["BorderColor3"] = p5.props.borderColor,
		["BackgroundColor3"] = p5.props.backgroundColor,
		["Text"] = p5.props.text,
		["TextColor3"] = p5.props.textColor,
		["Size"] = p5.props.size,
		["Font"] = Enum.Font.SourceSansBold,
		["TextScaled"] = true,
		["Position"] = p5.props.position,
		["LayoutOrder"] = p5.props.layoutOrder,
		["Visible"] = p5.props.visible,
		[v_u_2.Event.Activated] = p5.props.onClick
	}, p5.props[v_u_2.Children])
end
return v4
