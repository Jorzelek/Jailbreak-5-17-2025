-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdBHR5cGUEdGV4dA9zZXREaWFsb2d1ZVRleHQNaGVsbG8sIHdvcmxkIQhkaXNwYXRjaA1jcmVhdGVCaW5kaW5nCXBjdENsb3NlZA91cGRhdGVQY3RDbG9zZWQEaW5pdA1jcmVhdGVFbGVtZW50DVN0b3JlUHJvdmlkZXIFc3RvcmUGcmVuZGVyB3VubW91bnQJQ29tcG9uZW50A0FwcAZleHRlbmQHcmVxdWlyZRFNYW5zaW9uUm9iYmVyeUFwcAZzY3JpcHQGUGFyZW50Dk1hbnNpb25Sb2JiZXJ5E21hbnNpb25Sb2JiZXJ5U3RvcmUFbW91bnQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlBVJvYWN0ClJvYWN0Um9kdXgABQUBAgAAABX7AQAA4gMCAG8EAwAwBANxAAAAAG8EBAAwBAPVAQAAALwBAUwFAAAAnwEDAfsCAQBNAQIxBgAAAG8CBwCfAQIDMAEAtQgAAAAwAgBqCQAAAIIAAQAKAwEDAgUCAAEDAwMEAwUDBgKamZmZmZnZPwMHAwgACgkBGAAAAQAAAQAA/gAABAAAAAAAAAAAAQsAAAAACQEEAAAAGvsCAABNAQLKAAAAAPsDAQBNAgO6AQAAAOIDAwD7BAIAMAQDfgIAAAD/BAAAAQAAAPsGAABNBQbKAAAAAPsGAwDiBwUATQgAtQQAAAAwCAe1BAAAAJ8FAwDFBAUAAQAAAJ8BBACCAQAABgMKAwsDDAUBAgMHBQEEABENARgAAAAAAAAAAQAAAQABAAAAAAEAAAD/AAD9ABIAAAAAAgACAAAABvsBAABNAAESAAAAAPsBAQCfAAIBggABAAEDDgAcAAEYAAAAAAABHQAAAAAHAQMAAAAy+wIAAE0BAogAAAAAbwMBALwBAZwCAAAAnwEDAqQCBAAAADBApAUHAAAAYEBNBAUkCAAAAE0DBFoFAAAAnwICAqQDBAAAADBA+wYBAE0FBvMJAAAATQQFXgoAAACfAwIC2QQAABIAAwASAgAAMAQBEwsAAADZBAEAEgIAABICAgASAAMAEgACADAEAYAMAAAA+wUAAE0EBeQNAAAA+wYAAE0FBsoOAAAAUgYBAJ8FAgJSBgAAnwQDAtkFAgASAgAAEgAEAIIFAgAPAw8DEAMRAxIEAAAwQAMTAxQEAABgQAMVAxYDFwMJAw0DGAMKAwABAgYAARgAAAAAAAAAAQAAAAAAAAAAAQAAAAAAAAABAAAAAAcAAAAAAAAKAAAAAAAAAAAAAQAAAAcAAAAABAAAAQIAFqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CACEGAAAAnwECAqQCBQAAAEBATQMALQcAAACfAgICwAMIABIAAQASAAAAEgACAIIDAgAJAxkEAAAAQAMaAxsDEgQAAEBAAxwDHQYDAQMBAAEYAAEAAAAAAAEAAAAAAQAAAAACAAAAAAEAAAAABP3VVxFQCJZtzxE9hf9Sn0s5XcDAnQ4aQcTjTJSYPzGKYSX3BA2L2nk=

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(script.Parent.MansionRobberyApp)
	local v_u_7 = require(v_u_1.MansionRobbery.mansionRobberyStore)
	function v5.init(p8)
		-- upvalues: (copy) v_u_7, (ref) v_u_2
		v_u_7:dispatch({
			["type"] = "setDialogueText",
			["text"] = "hello, world!"
		})
		local v9, v10 = v_u_2.createBinding(0.4)
		p8.pctClosed = v9
		p8.updatePctClosed = v10
	end
	function v5.render(p11)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
		return v_u_2.createElement(v_u_3.StoreProvider, {
			["store"] = v_u_7
		}, { v_u_2.createElement(v_u_6, {
				["pctClosed"] = p11.pctClosed
			}) })
	end
	local v_u_12 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_12
		v_u_2.unmount(v_u_12)
	end
end
