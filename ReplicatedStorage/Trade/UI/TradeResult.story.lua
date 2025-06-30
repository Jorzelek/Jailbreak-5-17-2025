-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdBHR5cGUFdmFsdWUOc2V0VHJhZGVSZXN1bHQHc3VjY2VzcwV0aXRsZQRib2R5BUhlbGxvBVdvcmxkCGRpc3BhdGNoBGluaXQNY3JlYXRlRWxlbWVudA1TdG9yZVByb3ZpZGVyBXN0b3JlBnJlbmRlcgt3aWxsVW5tb3VudAd1bm1vdW50CUNvbXBvbmVudANBcHAGZXh0ZW5kB3JlcXVpcmULVHJhZGVSZXN1bHQGc2NyaXB0BlBhcmVudAVtb3VudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UFUm9hY3QKUm9hY3RSb2R1eAAGBgEBAAAAFfsBAADiAwIAbwQDADAEA3EAAAAA4gQHAKkFAQAwBQT6BAAAAG8FCAAwBQSaBQAAAG8FCQAwBQRHBgAAADAEA8wBAAAAvAEBTAoAAACfAQMBggABAAsDAQMCBQIAAQMDAwQDBQMGBQMEBQYDBwMIAwkACgoBGAAAAQAAAQEAAAEAAAEAAP0A/gAACAsAAAAACAEEAAAAF/sCAABNAQLKAAAAAPsDAQBNAgO6AQAAAOIDAwD7BAIAMAQDfgIAAAD/BAAAAQAAAPsGAABNBQbKAAAAAPsGAwD/BwAAAAAAAJ8FAwDFBAUAAQAAAJ8BBACCAQAABAMLAwwDDQUBAgAUDgEYAAAAAAAAAAEAAAEAAQAAAAAAAAAA/QAVAAAAAAEBAAAAAAGCAAEAAAAbDwEYABsAAAAAAgACAAAABvsBAABNAAESAAAAAPsBAQCfAAIBggABAAEDEAAeAAEYAAAAAAABHwAAAAAHAQMAAAA0+wIAAE0BAogAAAAAbwMBALwBAZwCAAAAnwEDAqQCBAAAADBA+wUBAE0EBcEBAAAATQMEfgUAAACfAgICpAMEAAAAMECkBggAAABwQE0FBiQJAAAATQQFOQYAAACfAwIC2QQAABIAAgAwBAETCgAAANkEAQASAgAAEgICABIAAgASAAMAMAQBgAsAAADABAwAMAQBNA0AAAD7BQAATQQF5A4AAAD7BgAATQUGyg8AAABSBgEAnwUCAlIGAACfBAMC2QUDABICAAASAAQAggUCABADEQMSAxMDFAQAADBAAw0DFQMWBAAAcEADFwMKAw4GAgMPAxgDCwQAAQIDBgABGAAAAAAAAAABAAAAAAAAAAEAAAAAAAAAAAEAAAAKAAAAAAAABwAAAgAAAAAAAAAAAAEAAAAHAAAAAAQAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgAhBgAAAJ8BAgKkAgUAAABAQE0DAC0HAAAAnwICAsADCAASAAEAEgAAABIAAgCCAwIACQMZBAAAAEADGgMbAxQEAABAQAMcAx0GBAEEAQABGAABAAAAAAABAAAAAAEAAAAAAgAAAAABAAAAAAUv7Zh0LmpXbx0p8uD7egX52M8T2kvNfyv4m0HfaOczUmyxKNM5wYDN

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(v_u_1.App.store)
	local v_u_7 = require(script.Parent.TradeResult)
	function v5.init(_)
		-- upvalues: (copy) v_u_6
		local v8 = {
			["type"] = "setTradeResult",
			["value"] = {
				["success"] = true,
				["title"] = "Hello",
				["body"] = "World"
			}
		}
		v_u_6:dispatch(v8)
	end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_6, (copy) v_u_7
		local v9 = {
			["store"] = v_u_6
		}
		return v_u_2.createElement(v_u_3.StoreProvider, v9, { v_u_2.createElement(v_u_7, {}) })
	end
	function v5.willUnmount(_) end
	local v_u_10 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_10
		v_u_2.unmount(v_u_10)
	end
end
