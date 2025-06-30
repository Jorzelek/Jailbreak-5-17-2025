-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMaBGluaXQNY3JlYXRlRWxlbWVudA1TdG9yZVByb3ZpZGVyBXN0b3JlC2FzcGVjdFJhdGlvFHZlcnRpY2FsUGFkZGluZ1JhdGlvFUFzcGVjdFJhdGlvQ29uc3RyYWludBdVSUFzcGVjdFJhdGlvQ29uc3RyYWludAtBc3BlY3RSYXRpbwZyZW5kZXIHdW5tb3VudAlDb21wb25lbnQDQXBwBmV4dGVuZAdyZXF1aXJlDEpvaW5PckNyZWF0ZQZzY3JpcHQGUGFyZW50DlBlcnNpc3RlbnRDcmV3E3BlcnNpc3RlbnRDcmV3U3RvcmUFbW91bnQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlBVJvYWN0ClJvYWN0Um9kdXgABQEBAAAAAAGCAAEAAAAKAQEYAAoAAAAADQEEAAAAKPsCAABNAQLKAAAAAPsDAQBNAgO6AQAAAOIDAwD7BAIAMAQDfgIAAAD/BAAAAQAAAPsGAABNBQbKAAAAAPsGAwDiBwYAbwgHADAIB4kEAAAAjAiAADAIB8YFAAAA4ggJAPsKAABNCQrKAAAAAG8KCgDiCwwAbwwHADAMC2kLAAAAnwkDAjAJCKkIAAAAnwUEAMUEBQABAAAAnwEEAIIBAAANAwIDAwMEBQECAwUDBgUCBAUCHMdxHMdx/D8DBwUBCAMIAwkFAQsADAoBGAAAAAAAAAABAAABAAEAAAAAAQAAAQAAAQEAAAAAAQAA/wAA/AAA/QANAAAAAAIAAgAAAAb7AQAATQABEgAAAAD7AQEAnwACAYIAAQABAwsAHAABGAAAAAAAAR0AAAAABwEDAAAAMPsCAABNAQKIAAAAAG8DAQC8AQGcAgAAAJ8BAwKkAgQAAAAwQKQFBwAAAGBATQQFJAgAAABNAwSTBQAAAJ8CAgKkAwQAAAAwQPsGAQBNBQbFCQAAAE0EBVIKAAAAnwMCAsAECwAwBAETDAAAANkEAQASAgAAEgICABIAAwASAAIAMAQBgA0AAAD7BQAATQQF5A4AAAD7BgAATQUGyg8AAABSBgEAnwUCAlIGAACfBAMC2QUCABICAAASAAQAggUCABADDAMNAw4DDwQAADBAAxADEQQAAGBAAxIDEwMUBgADAQMKAxUDAgMAAQIGAAEYAAAAAAAAAAEAAAAAAAAAAAEAAAAAAAAAAQAAAgAAAAAAAA8AAAAAAAAAAAABAAAABwAAAAAEAAABAgAWowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIAIQYAAACfAQICpAIFAAAAQEBNAwAtBwAAAJ8CAgLAAwgAEgABABIAAAASAAIAggMCAAkDFgQAAABAAxcDGAMPBAAAQEADGQMaBgMBAwEAARgAAQAAAAAAAQAAAAABAAAAAAIAAAAAAQAAAAAEuyRz3qypymqJ4BlKBtHPXG78GEds3f0jLwnRXUsQ3EzsFV6k/os1xQ==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(script.Parent.JoinOrCreate)
	local v_u_7 = require(v_u_1.PersistentCrew.persistentCrewStore)
	function v5.init(_) end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
		local v8 = v_u_2.createElement
		local v9 = v_u_3.StoreProvider
		local v10 = {
			["store"] = v_u_7
		}
		local v11 = {}
		local v12 = v_u_2.createElement
		local v13 = v_u_6
		local v14 = {
			["AspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = 1.7777777777777777
			})
		}
		__set_list(v11, 1, {v12(v13, {
	["aspectRatio"] = 1.7777777777777777,
	["verticalPaddingRatio"] = 128
}, v14)})
		return v8(v9, v10, v11)
	end
	local v_u_15 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_15
		v_u_2.unmount(v_u_15)
	end
end
