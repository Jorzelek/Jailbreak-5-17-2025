-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXBGluaXQNY3JlYXRlRWxlbWVudA1TdG9yZVByb3ZpZGVyBXN0b3JlC2FzcGVjdFJhdGlvFHZlcnRpY2FsUGFkZGluZ1JhdGlvCXNob3dQbGFjZQZyZW5kZXIHdW5tb3VudAlDb21wb25lbnQDQXBwBmV4dGVuZAdyZXF1aXJlCVBsYWNlckFwcARIb21lAlVJCWhvbWVTdG9yZQVtb3VudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UFUm9hY3QKUm9hY3RSb2R1eAAFAQEAAAAAAYIAAQAAAAoBARgACgAAAAAJAQQAAAAf+wIAAE0BAsoAAAAA+wMBAE0CA7oBAAAA4gMDAPsEAgAwBAN+AgAAAP8EAAABAAAA+wYAAE0FBsoAAAAA+wYDAOIHBwCMCAUAMAgHiQQAAABvCAgAMAgHxgUAAACpCAEAMAgHCgYAAACfBQMAxQQFAAEAAACfAQQAggEAAAkDAgMDAwQFAQIDBQMGAwcFAwQFBgKamZmZmZk5QAAMCAEYAAAAAAAAAAEAAAEAAQAAAAABAAABAAABAAD9AAD9AA4AAAAAAgACAAAABvsBAABNAAESAAAAAPsBAQCfAAIBggABAAEDCQAaAAEYAAAAAAABGwAAAAAHAQMAAAAx+wIAAE0BAogAAAAAbwMBALwBAZwCAAAAnwEDAqQCBAAAADBA+wYBAE0FBmoGAAAATQQFXAcAAABNAwTLBQAAAJ8CAgKkAwQAAAAwQPsGAQBNBQZqBgAAAE0EBYIIAAAAnwMCAsAECQAwBAETCgAAANkEAQASAgAAEgICABIAAwASAAIAMAQBgAsAAAD7BQAATQQF5AwAAAD7BgAATQUGyg0AAABSBgEAnwUCAlIGAACfBAMC2QUCABICAAASAAQAggUCAA4DCgMLAwwDDQQAADBAAw4DDwMQAxEGAAMBAwgDEgMCAwABAgYAARgAAAAAAAAAAQAAAAAAAAAAAAEAAAAAAAAAAQAAAgAAAAAAAA0AAAAAAAAAAAABAAAABwAAAAAEAAABAgAWowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIAIQYAAACfAQICpAIFAAAAQEBNAwAtBwAAAJ8CAgLAAwgAEgABABIAAAASAAIAggMCAAkDEwQAAABAAxQDFQMNBAAAQEADFgMXBgMBAwEAARgAAQAAAAAAAQAAAAABAAAAAAIAAAAAAQAAAAAEC1QC5PwflEA5kGhwgB2zkjsreZeqkA0fmvjYf7ml8yj8VkeZio5N+Q==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(v_u_1.Home.UI.PlacerApp)
	local v_u_7 = require(v_u_1.Home.homeStore)
	function v5.init(_) end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
		return v_u_2.createElement(v_u_3.StoreProvider, {
			["store"] = v_u_7
		}, { v_u_2.createElement(v_u_6, {
				["aspectRatio"] = 5,
				["verticalPaddingRatio"] = 25.6,
				["showPlace"] = true
			}) })
	end
	local v_u_8 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_8
		v_u_2.unmount(v_u_8)
	end
end
