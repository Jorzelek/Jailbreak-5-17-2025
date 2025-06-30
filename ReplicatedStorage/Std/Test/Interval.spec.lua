-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMbBXByaW50BG1hdGgDYWJzBWVycm9yD2ludmFsaWQgZWxhcHNlZBNkaWQgbm90IGZpcmUgb25jZTogCHRvc3RyaW5nDSAoJS4yZiwgJS4yZikGZm9ybWF0CkRpc2Nvbm5lY3QGcmFuZG9tBWV2ZXJ5B0Nvbm5lY3QEdGFzawVkZWxheQR3YWl0BmdldEVycgZleHBlY3QCdG8FZXF1YWwCaXQlc2hvdWxkIGFsbCBmaXJlIGFuZCBlbGFwc2VkIG1pbmltaXplZAhkZXNjcmliZQhJbnRlcnZhbAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQACAQBBAAAABikAQEAAAAAQPsCAABSAwAAnwEDAakBAQDeAQEA+wMCACYCAAO7AgICpAEEAAAMIICfAQICbwIFAGACBQABAAAApAIHAAAAYEBvAwgAnwICAfsCAwBDAgIB3gIDAIIAAQAJAwEEAAAAQAMCAwMEAAwggAJ7FK5H4XqkPwMEBAAAYEADBQAKAAEYAAAAAAABAAEAAAAAAAEAAAEAAAACAAABCwAAAAAIAAQAAAcAAAEDBBMCGfsAAAArABYA+wABAPsCAgBbAQIAYAESAAAAAACkAAIAAAAQQG8CAwD7BgMAuz8GAqQFBQAAAEBAnwUCAlIDBQBvBAYA+wYBAPsHAgC8BASNBwAAAJ8EBAJzAQIEnwACAYIAAQAIAgAAAAAAAABAAwQEAAAQQAMGAwcEAABAQAMIAwkAFAABGAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAIVAAAAAAIAAQAAAAX7AAAAvAAAGgAAAACfAAIBggABAAEDCgAZAAEYAAAAAAEaAAAAAAwBAQAAADOMAQAAjAQBAFICAACMAwEAqAInAKQFAgAABACAnwUBAqkGAADGBwAA+wkAAE0ICcQDAAAAUgkFAJ8IAgLZCgAAEgAEABIBBv8SAAUAEgEB/7wICMcEAAAAnwgDAlIHCACkCAIAAAQAgJ8IAQKkCQcAABhQgIwKAgDZCwEAEgEG/xIACAASAAUAEgAEAJ8JAwGkCQcAABhQgFIKCADZCwIAEgEH/58JAwHBBgAAiwLZ/6QCCQAAIFCAjAMDAJ8CAgHsAgEAwQEAAIICAgAKAwIDCwQABACAAwwDDQMOAw8EABhQgAMQBAAgUIADAAECBBEBGAABAAAAAQAAAQEBAAAAAAAAAAAAAAAAAAkAAAEAAAAAAAAAAAUAAAAAAADtFwAAAAEAAAUAAAAABQABAAAAF6QAAgAABACAjAEFAJ8AAgH7AQAAjAJkAJ8BAgJvAgMAtwECAAIAAACpAAABqQABAKQDBQAAAEBAUgQAAJ8DAgJNAgOSBgAAAE0BAnsHAAAAqQIBAJ8BAgGCAAEACAMOAxAEAAQAgAKamZmZmZm5PwMSBAAAQEADEwMUACMAARgAAAAAAQAAAAAAAAABAAAAAAAAAAAAASQAAAAAAwABAAAAB6QAAQAAAABAbwECAMACAwASAgAAnwADAYIAAQAEAxUEAAAAQAMWBgQBBCIAARgAAAAAAAAFIwAAAAADAAEAAAAHpAABAAAAAEBvAQIAwAIDABICAACfAAMBggABAAQDFwQAAABAAxgGBQEFIQABGAAAAAAAAAciAAAAAAUAAAECABGjAAAApAABAAAAAECkBAMAAAAgQE0DBCQEAAAATQIDJAQAAABNAQKsBQAAAJ8AAgLAAQYAEgAAAMACBwASAAEAggICAAgDGQQAAABAAxoEAAAgQAMbAxgGAwYGAgMGAQABGAABAAAAAAAAAAAAAAIAHQAAAQAAAAAHGORlRUeVtyEqIA/RfNi/lnl016lWdlvSCSHK8+HxbzSVxsN241aApw==

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Interval)
local function v_u_13(p2)
	-- upvalues: (copy) v_u_1
	local v_u_3 = 0
	for v_u_4 = 1, p2 do
		local v_u_5 = math.random()
		local v_u_6 = false
		local v_u_10 = v_u_1.every(v_u_5):Connect(function(p7)
			-- upvalues: (copy) v_u_4, (ref) v_u_6, (copy) v_u_5, (ref) v_u_3
			print(v_u_4, p7)
			v_u_6 = true
			local v8 = p7 - v_u_5
			local v9 = math.abs(v8)
			if v9 > 0.04 then
				error("invalid elapsed")
			end
			v_u_3 = v_u_3 + v9
		end)
		local v_u_11 = math.random()
		task.delay(2, function()
			-- upvalues: (ref) v_u_6, (copy) v_u_11, (copy) v_u_5, (copy) v_u_4
			if not v_u_6 and v_u_11 > v_u_5 * 2 then
				local v12 = v_u_4
				error("did not fire once: " .. tostring(v12) .. (" (%.2f, %.2f)"):format(v_u_11, v_u_5))
			end
		end)
		task.delay(v_u_11, function()
			-- upvalues: (ref) v_u_10
			v_u_10:Disconnect()
		end)
	end
	task.wait(3)
	return v_u_3 / p2
end
return function()
	-- upvalues: (copy) v_u_13
	describe("Interval", function()
		-- upvalues: (ref) v_u_13
		it("should all fire and elapsed minimized", function()
			-- upvalues: (ref) v_u_13
			task.wait(5)
			local v14 = v_u_13(100) < 0.1
			expect(v14).to.equal(true)
		end)
	end)
end
