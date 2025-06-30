-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVDWNyZWF0ZUJpbmRpbmcIcHJvZ3Jlc3MOdXBkYXRlUHJvZ3Jlc3MEaW5pdA1jcmVhdGVFbGVtZW50D3Byb2dyZXNzQmluZGluZwZyZW5kZXILd2lsbFVubW91bnQHdW5tb3VudAlDb21wb25lbnQDQXBwBmV4dGVuZAVtb3VudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQZzY3JpcHQGUGFyZW50E0NpcmN1bGFyUHJvZ3Jlc3NCYXIFUm9hY3QABgMBAQAAAA77AgAATQECMQAAAABvAgEAnwECAzABAAQCAAAAMAIALgMAAABNAQAuAwAAAG8CBACfAQIBggABAAUDAQIzMzMzMzPTPwMCAwMCmpmZmZmZuT8ABwQBGAAAAAAAAAAAAAEAAAABCAAAAAAFAQIAAAAL+wIAAE0BAsoAAAAA+wIBAOIDAgBNBAAEAwAAADAEA3wBAAAAnwEDAIIBAAAEAwUDBgUBAQMCAAsHARgAAAAAAAEAAAD/AAwAAAAAAQEAAAAAAYIAAQAAABAIARgAEAAAAAACAAIAAAAG+wEAAE0AARIAAAAA+wEBAJ8AAgGCAAEAAQMJABMAARgAAAAAAAEUAAAAAAUBAgAAACH7AgAATQECiAAAAABvAwEAvAEBnAIAAACfAQMCwAIDABICAAAwAgETBAAAAMACBQASAgAAEgIBADACAYAGAAAAwAIHADACATQIAAAA+wMAAE0CA+QJAAAA+wQAAE0DBMoKAAAAUgQBAJ8DAgJSBAAAnwIDAtkDAwASAgAAEgACAIIDAgALAwoDCwMMBgADBAYBAwcGAgMIAw0DBQQAAQIDBQABGAAAAAAAAAABAAAABAAAAAAFAAACAAAAAAAAAAAAAQAAAAYAAAAABQAAAQIAGaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQKQEBwAAAGBATQMEJAgAAABNAgPZCQAAAJ8BAgKkAgUAAABAQE0DACEKAAAAnwICAsADCwASAAIAEgABAIIDAgAMAw4EAAAAQAMPAxADEQQAAEBAAxIEAABgQAMTAxQDFQYEAQQBAAEYAAAAAAAAAAEAAAAAAAAAAAEAAAAAAgAAAAEAAAAABZkRDcLrIgiLq9VnVo4LDwi/VWDVtD5IrwNu4suwirr4xqVtAzJQWQc=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.CircularProgressBar)
local v_u_3 = require(v1.Roact)
return function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = v_u_3.Component:extend("App")
	function v5.init(p6)
		-- upvalues: (ref) v_u_3
		local v7, v8 = v_u_3.createBinding(0.3)
		p6.progress = v7
		p6.updateProgress = v8
		p6.updateProgress(0.1)
	end
	function v5.render(p9)
		-- upvalues: (ref) v_u_3, (ref) v_u_2
		return v_u_3.createElement(v_u_2, {
			["progressBinding"] = p9.progress
		})
	end
	function v5.willUnmount(_) end
	local v_u_10 = v_u_3.mount(v_u_3.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_3, (copy) v_u_10
		v_u_3.unmount(v_u_10)
	end
end
