-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdDEdldFJlbWFpbmluZwZvblRpY2sERmlyZQhmaW5pc2hlZApvbkZpbmlzaGVkBG1haWQMdGlja0ludGVydmFsFE1pc3NpbmcgZGVhZGxpbmVVbml4BmFzc2VydANuZXcMc2V0bWV0YXRhYmxlDGRlYWRsaW5lVW5peAhHaXZlVGFzawVldmVyeQdDb25uZWN0CERhdGVUaW1lA25vdw1Vbml4VGltZXN0YW1wCkdldE5vd1VuaXgKSXNGaW5pc2hlZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNTdGQKQmFzZU9iamVjdAZTaWduYWwISW50ZXJ2YWwHX19pbmRleAAGBAABAAAALPsAAAC8AAAdAAAAAJ8AAgKMAQAAfQAeAAEAAAD7AgAATQEC4gEAAABSAwAAvAEB3QIAAACfAQMB+wIAAE0BAvEDAAAAKwEHAPsCAABNAQJjBAAAAFIDAAC8AQHdAgAAAJ8BAwH7AQAAqQIBADACAfEDAAAA+wIAAE0BAhYFAAAAxgIAADACAf4GAAAAggABAPsCAABNAQLiAQAAAFIDAAC8AQHdAgAAAJ8BAwGCAAEABwMBAwIDAwMEAwUDBgMHABcAARgAAAAAAQAAAQAAAAAAAAEAAAABAAAAAAAAAgAAAAEAAAAAAAACAAAAAAAAAhgAAAAABgEEAAAGAwAABQECREcAAgAAAACAqQIAAakCAQCBAQIEAAAAAG8DAACkAQIAAAAQQJ8BAwH7AgAATQEC7wMAAADGAgAAnwECAvsEAQCePQEEBAAAAFIDAQCkAgUAAABAQJ8CAwEwAAFzBgAAAPsDAgBNAgPvAwAAAJ8CAQIwAgHiBwAAAE0CARYIAAAATQQB4gcAAAC8AgL9CQAAAJ8CAwH7AwIATQID7wMAAACfAgECMAIBYwoAAABNAgEWCAAAAE0EAWMKAAAAvAIC/QkAAACfAgMBqQIAADACAfELAAAATQIBFggAAAD7BAMATQMExAwAAACMBAEAnwMCAtkFAAASAAEAvAMDxw0AAACfAwMCMAMC/g4AAACCAQIADwMIAwkEAAAQQAMKAwsEAABAQAMMAwIDBgMNAwUDBAMOAw8DBwEACwoBGAAAAAAAAAAAAAABAAAAAAEAAAAAAAACAAEAAAAAAAEAAAAAAAABAAAAAAABAAAAAAAAAQAAAgAAAAAAAAAAAAAAAAAODAAAAAADAQAAAAAGpAICAAAEAICfAgECTQECtwMAAACCAQIABAMQAxEEAAQAgAMSACcTARgAAAAAAAAoAAAAAAUBAAAAAAdNAgBzAAAAALwDAK8BAAAAnwMCAiYBAgOCAQIAAgMMAxMAKgEBGAAAAAAAAAArAAAAAAIBAAAAAANNAQDxAAAAAIIBAgABAwQALRQBGAAAAC4AAAAACAAAAQIAOKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAKEGAAAATQIDSwcAAACfAQICpAIFAAAAQEBNBAChBgAAAE0DBB8IAAAAnwICAqQDBQAAAEBATQUAoQYAAABNBAWsCQAAAJ8DAgL/BAQAAAAAADAEBG4KAAAAnj0EBQEAAABSBgQAUgcBAKQFDAAAALBAnwUDAcAFDQASAAEAEgAEABIAAgASAAMAMAUE7w4AAADABQ8AMAUErxAAAADABREAMAUEHRIAAADABRMAMAUEoRQAAACCBAIAFQMVBAAAAEADFgMXAxgEAABAQAMZAxoDGwMcAx0DCwQAALBABgEDCgYCAxMGAwMBBgQDFAQBAgMEAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAACAAEAAQAAAAAAAAIAAAAAAAAcAAADAAADAAAEAQAAAAAFR5lUZNwS//p1XT7wVWe+lV26E4DvU7FH6lATZTbLQQ1tMKzemBULaw==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.BaseObject)
local v_u_3 = require(v1.Std.Signal)
local v_u_4 = require(v1.Std.Interval)
local v_u_5 = {}
v_u_5.__index = v_u_5
setmetatable(v_u_5, v_u_2)
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v7 = p6 ~= nil
	assert(v7, "Missing deadlineUnix")
	local v_u_8 = v_u_2.new(nil)
	local v9 = v_u_5
	setmetatable(v_u_8, v9)
	v_u_8.deadlineUnix = p6
	v_u_8.onTick = v_u_3.new()
	v_u_8.maid:GiveTask(v_u_8.onTick)
	v_u_8.onFinished = v_u_3.new()
	v_u_8.maid:GiveTask(v_u_8.onFinished)
	v_u_8.finished = false
	v_u_8.maid.tickInterval = v_u_4.every(1):Connect(function()
		-- upvalues: (copy) v_u_8
		local v10 = v_u_8:GetRemaining()
		if v10 <= 0 then
			v_u_8.onTick:Fire(v10)
			if not v_u_8.finished then
				v_u_8.onFinished:Fire(v10)
			end
			v_u_8.finished = true
			v_u_8.maid.tickInterval = nil
		else
			v_u_8.onTick:Fire(v10)
		end
	end)
	return v_u_8
end
function v_u_5.GetNowUnix(_)
	return DateTime.now().UnixTimestamp
end
function v_u_5.GetRemaining(p11)
	return p11.deadlineUnix - p11:GetNowUnix()
end
function v_u_5.IsFinished(p12)
	return p12.finished
end
return v_u_5
