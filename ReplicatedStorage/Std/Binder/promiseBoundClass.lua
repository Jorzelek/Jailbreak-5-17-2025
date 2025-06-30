-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZA0dldA9PYnNlcnZlSW5zdGFuY2UIR2l2ZVRhc2sHRGVzdHJveQlnZXRTdGF0dXMGU3RhdHVzB1N0YXJ0ZWQEd2FybkJbcHJvbWlzZUJvdW5kQ2xhc3NdIC0gSW5maW5pdGUgeWllbGQgcG9zc2libGUgb24gJXEgZm9yIGJpbmRlciAlcQoLR2V0RnVsbE5hbWUGR2V0VGFnBmZvcm1hdAVkZWJ1Zwl0cmFjZWJhY2sHcmVzb2x2ZQNuZXcFZGVmZXIHZmluYWxseQR0YXNrBWRlbGF5B3JlcXVpcmUGc2NyaXB0BlBhcmVudAdQcm9taXNlBE1haWQABgMBAQAAAAT7AQAAUgIAAJ8BAgGCAAEAAAASAAEYAAAAARMAAAAACAEDAAAAFvsBAAD7AwEAvAEBfwAAAACfAQMCDgEEAFICAABSAwEAnwICAYIAAQD7AgIA+wQAAPsGAQDZBwAAEgAAALwEBMwBAAAAnwQEALwCAv0CAAAAnwIAAYIAAQADAwEDAgMDAQANAAEYAAAAAAABAQAAAAIAAAAAAAAAAAAABA4AAAAAAgABAAAABfsAAAC8AABQAAAAAJ8AAgGCAAEAAQMEABcAARgAAAAAARgAAAAABgAFAAAHAAABAwEWAh/7AAAAvAAA/QAAAACfAAIC+wMBAE0CA+wBAAAATQECswIAAACaABQAAQAAAKQABAAAADBAbwEFAPsDAgC8AwOyBgAAAJ8DAgL7BAMAvAQEtwcAAACfBAIAvAEBjQgAAACfAQAAnwAAAaQABAAAADBA+wEEAJ8AAgGCAAEACQMFAwYDBwMIBAAAMEADCQMKAwsDDAAaAAEYAAAAAAAAAAAAAAABAAEBAAAAAQAAAP4AAP8GAAAAAhsAAAAACQICAAAAKqQCAgAABACAnwIBAlIFAQC8AwB/AwAAAJ8DAwIOAwYA+wUAAE0EBR0EAAAAUgUDAJ8EAgCCBAAA+wUBAE0EBe8FAAAAnwQBAvsGAABNBQZoBgAAANkGAAASAAAAEgABABIABACfBQIC2QgBABIABAC8BgVCBwAAAJ8GAwGkBgoAACSAgIwHBQDZCAIAEgAFABICAAASAAEAEgAAABIAAgCfBgMBggUCAAsDDQMOBAAEAIADAQMPAxADEQMSAxMDFAQAJICAAwECAwUAARgAAAACAAAAAQEAAAAAAAIAAAABAAAAAAAAAAoAAAAAAwAAAAAAAAAAAAsGAAAAAAYAAAECABujAAAApAABAAAAAECkBAMAAAAgQE0DBCQEAAAATQIDJAQAAABNAQJyBQAAAJ8AAgKkAQEAAAAAQKQFAwAAACBATQQFJAQAAABNAwQkBAAAAE0CA3YGAAAAnwECAsACBwASAAAAEgABAIICAgAIAxUEAAAAQAMWBAAAIEADFwMYAxkGBAEEAQABGAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAgAAAAEAAAAABbNAmwmEPGpAgYTxnSgBRpJjpZZPJJd34u/Wwfr+IEQR/YuPPW6+dIE=

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Promise)
local v_u_2 = require(script.Parent.Parent.Maid)
return function(p_u_3, p_u_4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v_u_5 = debug.traceback()
	local v6 = p_u_3:Get(p_u_4)
	if v6 then
		return v_u_1.resolve(v6)
	end
	local v_u_7 = v_u_2.new()
	local v_u_11 = v_u_1.defer(function(p_u_8)
		-- upvalues: (copy) p_u_3, (copy) p_u_4, (copy) v_u_7
		local v9 = p_u_3:Get(p_u_4)
		if v9 then
			p_u_8(v9)
		else
			v_u_7:GiveTask(p_u_3:ObserveInstance(p_u_4, function(p10)
				-- upvalues: (copy) p_u_8
				p_u_8(p10)
			end))
		end
	end)
	v_u_11:finally(function()
		-- upvalues: (copy) v_u_7
		v_u_7:Destroy()
	end)
	task.delay(5, function()
		-- upvalues: (copy) v_u_11, (ref) v_u_1, (copy) p_u_4, (copy) p_u_3, (copy) v_u_5
		if v_u_11:getStatus() == v_u_1.Status.Started then
			warn(("[promiseBoundClass] - Infinite yield possible on %q for binder %q\n"):format(p_u_4:GetFullName(), p_u_3:GetTag()))
			warn(v_u_5)
		end
	end)
	return v_u_11
end
