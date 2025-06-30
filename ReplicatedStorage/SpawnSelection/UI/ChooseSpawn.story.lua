-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcBGluaXQNY3JlYXRlRWxlbWVudA1TdG9yZVByb3ZpZGVyBXN0b3JlBnJlbmRlcgt3aWxsVW5tb3VudAd1bm1vdW50CUNvbXBvbmVudANBcHAGZXh0ZW5kB3JlcXVpcmUGc2NyaXB0BlBhcmVudAtDaG9vc2VTcGF3bgR0eXBlB3Zpc2libGUdc2V0U3Bhd25TZWxlY3Rpb25PZmZlclZpc2libGUIZGlzcGF0Y2gKbGFzdERpZWRBdA1zZXRMYXN0RGllZEF0CXdvcmtzcGFjZRBHZXRTZXJ2ZXJUaW1lTm93BW1vdW50BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQVSb2FjdApSb2FjdFJvZHV4AAYBAQAAAAABggABAAAACgEBGAAKAAAAAAgBBAAAABf7AgAATQECygAAAAD7AwEATQIDugEAAADiAwMA+wQCADAEA34CAAAA/wQAAAEAAAD7BgAATQUGygAAAAD7BgMA/wcAAAAAAACfBQMAxQQFAAEAAACfAQQAggEAAAQDAgMDAwQFAQIAEwUBGAAAAAAAAAABAAABAAEAAAAAAAAAAP0AFAAAAAABAQAAAAABggABAAAAGgYBGAAaAAAAAAIAAgAAAAb7AQAATQABEgAAAAD7AQEAnwACAYIAAQABAwcAHQABGAAAAAAAAR4AAAAACQEDAAAAS/sCAABNAQKIAAAAAG8DAQC8AQGcAgAAAJ8BAwKkAgQAAAAwQPsFAQBNBAXBAQAAAE0DBH4FAAAAnwICAqQDBAAAADBApAYHAAAAYEBNBQYkCAAAAE0EBb4JAAAAnwMCAsAECgAwBAETCwAAAOIGDgBvBw8AMAcGcQwAAACpBwEAMAcGoA0AAAC8BAJMEAAAAJ8EAwHiBhIAbwcTADAHBnEMAAAApAcVAAAAQEG8Bwe3FgAAAJ8HAgIwBwa+EQAAALwEAkwQAAAAnwQDAdkEAQASAgAAEgICABIAAgASAAMAMAQBgBcAAADABBgAMAQBNBkAAAD7BQAATQQF5BoAAAD7BgAATQUGyhsAAABSBgEAnwUCAlIGAACfBAMC2QUDABICAAASAAQAggUCABwDCAMJAwoDCwQAADBAAwQDDAQAAGBAAw0DDgYAAwEDDwMQBQIMDQMRAxIDEwUCDBEDFAMVBAAAQEEDFgMFBgIDBgMXAwIEAAECAwYAARgAAAAAAAAAAQAAAAAAAAABAAAAAAAAAAABAAABAQAAAQAA/gAABAEAAAEAAAAAAAD+AAAEAAAAAAAABwAAAgAAAAAAAAAAAAEAAAAHAAAAAAQAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgAhBgAAAJ8BAgKkAgUAAABAQE0DAC0HAAAAnwICAsADCAASAAEAEgAAABIAAgCCAwIACQMYBAAAAEADGQMaAwsEAABAQAMbAxwGBAEEAQABGAABAAAAAAABAAAAAAEAAAAAAgAAAAABAAAAAAViLKDIExa7eFDoylzWC30qOqX2Ww2WgqQDUZSeZ8U8+oNyjz3Nkc3y

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(v_u_1.App.store)
	local v_u_7 = require(script.Parent.ChooseSpawn)
	function v5.init(_) end
	v_u_6:dispatch({
		["type"] = "setSpawnSelectionOfferVisible",
		["visible"] = true
	})
	v_u_6:dispatch({
		["type"] = "setLastDiedAt",
		["lastDiedAt"] = workspace:GetServerTimeNow()
	})
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
