-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMbGnlpZWxkRm9yQWxsVmFsdWVzUG9wdWxhdGVkG2NyZWF0ZVRhYmxlRnJvbU9iamVjdFZhbHVlcwZwYWNrZXQEdGFzawZjYW5jZWwFZGVsYXkGdXBkYXRlCVZhbHVlQmFzZQNJc0EDbmV3DHNldG1ldGF0YWJsZQRtYWlkD0Rlc2NlbmRhbnRBZGRlZAdDb25uZWN0CEdpdmVUYXNrBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlA0FwcBRTdHJlYW1pbmdIZWxwZXJVdGlscwNTdGQGQmluZGVyCkJhc2VPYmplY3QKVGFibGVVdGlscwdfX2luZGV4DFZlaGljbGVTdGF0ZQAFAgAGAAAAGPsAAAD7AQEA8QACAAEAAACCAAEA+wECAE0AAfAAAAAA+wEDAJ8AAgH7AAAA+wEBAPEAAgABAAAAggABAPsBBABNAAFvAQAAAPsBAwCfAAIC+wEFADAAAXQCAAAAggABAAMDAQMCAwMAGAABGAAAAAABAgAAAAABAAAAAQIAAAAAAQAAARkAAAAABAAGAAAAGPsBAACVAAEA3gAAAPsBAQAOAQYApAEDAAAIEID7AgEAnwECAcYBAADeAQEApAEFAAAQEIBvAgYA2QMAABIAAAASAgAAEgICABICAwASAgQAEgIFAJ8BAwLeAQEAggABAAcCAAAAAAAA8D8DBAMFBAAIEIADBgQAEBCAApqZmZmZmbk/AQARBwEYAAABAQABAAAAAQACAAAAAAAAAAAAAAALEgAAAAAFAQYAAAAdbwMAALwBAP4BAAAAnwEDAg4BFwD7AgAAlQECAt4BAAD7AgEADgIGAKQCBQAAEDCA+wMBAJ8CAgHGAgAA3gIBAKQCBwAAGDCAbwMIANkEAAASAAEAEgIAABICAgASAgMAEgIEABICBQCfAgMC3gIBAIIAAQAJAwgDCQIAAAAAAADwPwMEAwUEABAwgAMGBAAYMIACmpmZmZmZuT8BACQAARgTAAAAAO0AAQEAAQAAAAEAAgAAAAAAAAAAAAAAEBIAAAAACgEEAAAAPPsCAABNAQLvAAAAAFICAACfAQIC+wQBAJ49AQQEAAAAUgMBAKQCAgAAABBAnwIDAYwCAADGAwAA2QQAABIBAv8SAQP/EgICABIAAAASAgMAEgABAE0FARYDAAAATQcAZAQAAADZCQEAEgEC/xIBA/8SAgIAEgAAABICAwASAAEAvAcHxwUAAACfBwMAvAUF/QYAAACfBQABlQUCB1ICBQAOAwUApAYKAAAkgIBSBwMAnwYCAcYDAACkBgwAACyAgG8HDQDZCAIAEgAFABIBAv8SAgIAEgAAABICAwASAAEAnwYDAlIDBgDBAgAAggECAA4DCgMLBAAAEEADDAMNAw4DDwIAAAAAAADwPwMEAwUEACSAgAMGBAAsgIACmpmZmZmZuT8DAQIADAoBGAAAAAAAAQAAAAAAAAEBAQAAAAAAABMAAAAAAAAAAAAAAAAAAAAA7gEBAQAAAAECAAAAAAAAAAAAAAASAA0AAAAACQAAAQIAO6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAMEGAAAATQIDWgcAAACfAQICpAIFAAAAQEBNBAChCAAAAE0DBH8JAAAAnwICAqQDBQAAAEBATQUAoQgAAABNBAVLCgAAAJ8DAgKkBAUAAABAQE0GAKEIAAAATQUGGAsAAACfBAIC/wUCAAAAAAAwBQVuDAAAAJ49BQUDAAAAUgcFAFIIAwCkBg4AAADQQJ8GAwHABg8AEgADABIABQASAAEAEgAEADAGBe8QAAAATQYC7xAAAABvBxEAUggFAJ8GAwCCBgAAEgMQBAAAAEADEQMSAxMEAABAQAMUAxUDFgMXAxgDGQMaAwsEAADQQAYDAwoDGwEDAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAgABAAEAAAAAAAACAAAAAAAAIQAAAAAAAQAAAAAEWC4Y3PHhuFRq6nJIc76GYSREnR7fN6kVSo1fgr0iAKgWac2df0/4JA==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.App.StreamingHelperUtils)
local v3 = require(v1.Std.Binder)
local v_u_4 = require(v1.Std.BaseObject)
local v_u_5 = require(v1.Std.TableUtils)
local v_u_6 = {}
v_u_6.__index = v_u_6
setmetatable(v_u_6, v_u_4)
function v_u_6.new(p_u_7)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_5
	local v_u_8 = v_u_4.new(p_u_7)
	local v9 = v_u_6
	setmetatable(v_u_8, v9)
	local v_u_10 = 0
	local v_u_11 = nil
	v_u_8.maid:GiveTask(p_u_7.DescendantAdded:Connect(function(p12)
		-- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_2, (copy) p_u_7, (ref) v_u_5, (copy) v_u_8
		if p12:IsA("ValueBase") then
			local v_u_13 = v_u_10 + 1
			v_u_10 = v_u_13
			if v_u_11 then
				task.cancel(v_u_11)
				v_u_11 = nil
			end
			v_u_11 = task.delay(0.1, function()
				-- upvalues: (copy) v_u_13, (ref) v_u_10, (ref) v_u_2, (ref) p_u_7, (ref) v_u_5, (ref) v_u_8
				if v_u_13 == v_u_10 then
					v_u_2.yieldForAllValuesPopulated(p_u_7)
					if v_u_13 == v_u_10 then
						v_u_8.packet = v_u_5.createTableFromObjectValues(p_u_7)
					end
				else
					return
				end
			end)
		end
	end))
	local v_u_14 = v_u_10 + 1
	v_u_10 = v_u_14
	if v_u_11 then
		task.cancel(v_u_11)
		v_u_11 = nil
	end
	v_u_11 = task.delay(0.1, function()
		-- upvalues: (copy) v_u_14, (ref) v_u_10, (ref) v_u_2, (copy) p_u_7, (ref) v_u_5, (copy) v_u_8
		if v_u_14 == v_u_10 then
			v_u_2.yieldForAllValuesPopulated(p_u_7)
			if v_u_14 == v_u_10 then
				v_u_8.packet = v_u_5.createTableFromObjectValues(p_u_7)
			end
		else
			return
		end
	end)
	return v_u_8
end
return v3.new("VehicleState", v_u_6)
