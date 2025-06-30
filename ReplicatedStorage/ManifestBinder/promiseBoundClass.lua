-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZA0dldA9PYnNlcnZlSW5zdGFuY2UIR2l2ZVRhc2sHRGVzdHJveQlnZXRTdGF0dXMGU3RhdHVzB1N0YXJ0ZWQEd2FybkJbcHJvbWlzZUJvdW5kQ2xhc3NdIC0gSW5maW5pdGUgeWllbGQgcG9zc2libGUgb24gJXEgZm9yIGJpbmRlciAlcQoLR2V0RnVsbE5hbWUGR2V0VGFnBmZvcm1hdAdyZXNvbHZlA25ldwVkZWZlcgdmaW5hbGx5BHRhc2sFZGVsYXkEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUDU3RkB1Byb21pc2UETWFpZAAGAwEBAAAABPsBAABSAgAAnwECAYIAAQAAABEAARgAAAABEgAAAAAIAQMAAAAW+wEAAPsDAQC8AQF/AAAAAJ8BAwIOAQQAUgIAAFIDAQCfAgIBggABAPsCAgD7BAAA+wYBANkHAAASAAAAvAQEzAEAAACfBAQAvAIC/QIAAACfAgABggABAAMDAQMCAwMBAAwAARgAAAAAAAEBAAAAAgAAAAAAAAAAAAAEDQAAAAACAAEAAAAF+wAAALwAAFAAAAAAnwACAYIAAQABAwQAFgABGAAAAAABFwAAAAAGAAQAAAcAAAEDARYCG/sAAAC8AAD9AAAAAJ8AAgL7AwEATQID7AEAAABNAQKzAgAAAJoAEAABAAAApAAEAAAAMEBvAQUA+wMCALwDA7IGAAAAnwMCAvsEAwC8BAS3BwAAAJ8EAgC8AQGNCAAAAJ8BAACfAAABggABAAkDBQMGAwcDCAQAADBAAwkDCgMLAwwAGQABGAAAAAAAAAAAAAAAAQABAQAAAAEAAAD+AAD/BxoAAAAACAICAAAAJlIEAQC8AgB/AAAAAJ8CAwIOAgYA+wQAAE0DBB0BAAAAUgQCAJ8DAgCCAwAA+wQBAE0DBO8CAAAAnwMBAvsFAABNBAVoAwAAANkFAAASAAAAEgABABIAAwCfBAIC2QcBABIAAwC8BQRCBAAAAJ8FAwGkBQcAABhQgIwGBQDZBwIAEgAEABICAAASAAEAEgAAAJ8FAwGCBAIACAMBAw0DDgMPAxADEQMSBAAYUIADAQIDBgABGAAAAAABAQAAAAAAAgAAAAEAAAAAAAAACgAAAAADAAAAAAAAAAAKBwAAAAAFAAABAgAZowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAoQYAAABNAgNyBwAAAJ8BAgKkAgUAAABAQE0EAKEGAAAATQMEdggAAACfAgICwAMJABIAAQASAAIAggMCAAoDEwQAAABAAxQDFQMWBAAAQEADFwMYAxkGBAEEAQABGAAAAAAAAAACAAAAAAAAAQAAAAAAAAIAAAABAAAAAAXXBBo+FWVI/eXAcKrXMgsikFWVvO9xrRiAM6DdZdPAza0sYDfrCciT

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.Promise)
local v_u_3 = require(v1.Std.Maid)
return function(p_u_4, p_u_5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = p_u_4:Get(p_u_5)
	if v6 then
		return v_u_2.resolve(v6)
	end
	local v_u_7 = v_u_3.new()
	local v_u_11 = v_u_2.defer(function(p_u_8)
		-- upvalues: (copy) p_u_4, (copy) p_u_5, (copy) v_u_7
		local v9 = p_u_4:Get(p_u_5)
		if v9 then
			p_u_8(v9)
		else
			v_u_7:GiveTask(p_u_4:ObserveInstance(p_u_5, function(p10)
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
		-- upvalues: (copy) v_u_11, (ref) v_u_2, (copy) p_u_5, (copy) p_u_4
		if v_u_11:getStatus() == v_u_2.Status.Started then
			warn(("[promiseBoundClass] - Infinite yield possible on %q for binder %q\n"):format(p_u_5:GetFullName(), p_u_4:GetTag()))
		end
	end)
	return v_u_11
end
