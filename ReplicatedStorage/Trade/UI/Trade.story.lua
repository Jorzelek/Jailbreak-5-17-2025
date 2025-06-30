-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMfBHR5cGUGdXNlcklkC2Rpc3BsYXlOYW1lBXJlYWR5DnVwZGF0ZVRyYWRlck1lBWJhZGNjCGRpc3BhdGNoEHVwZGF0ZVRyYWRlclRoZW0JYXNpbW8zMDg5BXZhbHVlDnNldFRyYWRlQWN0aXZlBGluaXQNY3JlYXRlRWxlbWVudA1TdG9yZVByb3ZpZGVyBXN0b3JlBnJlbmRlcgt3aWxsVW5tb3VudAd1bm1vdW50CUNvbXBvbmVudANBcHAGZXh0ZW5kB3JlcXVpcmUFVHJhZGUGc2NyaXB0BlBhcmVudAVtb3VudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UFUm9hY3QKUm9hY3RSb2R1eAAGBQEBAAAALvsBAADiAwQAbwQFADAEA3EAAAAAbwQGADAEA4YBAAAAbwQHADAEA3cCAAAAqQQBADAEA88DAAAAvAEBTAgAAACfAQMB+wEAAOIDBABvBAkAMAQDcQAAAABvBAoAMAQDhgEAAABvBAsAMAQDdwIAAACpBAAAMAQDzwMAAAC8AQFMCAAAAJ8BAwH7AQAA4gMNAG8EDgAwBANxAAAAAKkEAQAwBAPMDAAAALwBAUwIAAAAnwEDAYIAAQAPAwEDAgMDAwQFBAABAgMDBQIAAAAAluY+QQMGAwcDCAIAAACAa6ZFQQMJAwoFAgAMAwsACgwBGAAAAQAAAQAAAQAAAQAA/AAABgABAAABAAABAAABAAD8AAAGAAEAAAEAAP4AAAQLAAAAAAgBBAAAABf7AgAATQECygAAAAD7AwEATQIDugEAAADiAwMA+wQCADAEA34CAAAA/wQAAAEAAAD7BgAATQUGygAAAAD7BgMA/wcAAAAAAACfBQMAxQQFAAEAAACfAQQAggEAAAQDDQMOAw8FAQIAHBABGAAAAAAAAAABAAABAAEAAAAAAAAAAP0AHQAAAAABAQAAAAABggABAAAAIxEBGAAjAAAAAAIAAgAAAAb7AQAATQABEgAAAAD7AQEAnwACAYIAAQABAxIAJgABGAAAAAAAAScAAAAABwEDAAAANPsCAABNAQKIAAAAAG8DAQC8AQGcAgAAAJ8BAwKkAgQAAAAwQPsFAQBNBAXBAQAAAE0DBH4FAAAAnwICAqQDBAAAADBApAYIAAAAcEBNBQYkCQAAAE0EBbsGAAAAnwMCAtkEAAASAAIAMAQBEwoAAADZBAEAEgIAABICAgASAAIAEgADADAEAYALAAAAwAQMADAEATQNAAAA+wUAAE0EBeQOAAAA+wYAAE0FBsoPAAAAUgYBAJ8FAgJSBgAAnwQDAtkFAwASAgAAEgAEAIIFAgAQAxMDFAMVAxYEAAAwQAMPAxcDGAQAAHBAAxkDDAMQBgIDEQMaAw0EAAECAwYAARgAAAAAAAAAAQAAAAAAAAABAAAAAAAAAAABAAAAEgAAAAAAAAcAAAIAAAAAAAAAAAABAAAABwAAAAAEAAABAgAWowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIAIQYAAACfAQICpAIFAAAAQEBNAwAtBwAAAJ8CAgLAAwgAEgABABIAAAASAAIAggMCAAkDGwQAAABAAxwDHQMWBAAAQEADHgMfBgQBBAEAARgAAQAAAAAAAQAAAAABAAAAAAIAAAAAAQAAAAAF4vUOcPatX2HQMWTkQjQShrp7+ZKG3teJCNBf5r30nryeowzPGzAngQ==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(v_u_1.App.store)
	local v_u_7 = require(script.Parent.Trade)
	function v5.init(_)
		-- upvalues: (copy) v_u_6
		v_u_6:dispatch({
			["type"] = "updateTraderMe",
			["userId"] = 2025110,
			["displayName"] = "badcc",
			["ready"] = true
		})
		v_u_6:dispatch({
			["type"] = "updateTraderThem",
			["userId"] = 2837719,
			["displayName"] = "asimo3089",
			["ready"] = false
		})
		v_u_6:dispatch({
			["type"] = "setTradeActive",
			["value"] = true
		})
	end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_6, (copy) v_u_7
		local v8 = {
			["store"] = v_u_6
		}
		return v_u_2.createElement(v_u_3.StoreProvider, v8, { v_u_2.createElement(v_u_7, {}) })
	end
	function v5.willUnmount(_) end
	local v_u_9 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_9
		v_u_2.unmount(v_u_9)
	end
end
