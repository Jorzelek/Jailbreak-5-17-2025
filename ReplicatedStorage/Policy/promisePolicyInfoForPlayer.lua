-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJG0dldFBvbGljeUluZm9Gb3JQbGF5ZXJBc3luYwNuZXcEZ2FtZQ1Qb2xpY3lTZXJ2aWNlCkdldFNlcnZpY2URUmVwbGljYXRlZFN0b3JhZ2UHcmVxdWlyZQNTdGQHUHJvbWlzZQADBgMCAAAADfsDAAD7BQEAvAMDgAAAAACfAwMCUgQCAJ8EAQIOBAEAggABAFIEAABSBQMAnwQCAYIAAQABAwEABgABGAAAAAAAAQAAAQIAAAEHAAAAAAMBAgAAAAj7AgAATQEC7wAAAADZAgAAEgIBABIAAACfAQIAggEAAAEDAgEABQABGAAAAAAAAAAABgAAAAAFAAABAgAYowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCBgAAAFBATQQBoQcAAABNAwRyCAAAAJ8CAgLAAwkAEgACABIAAACCAwIACgMDBAAAAEADBAMFAwYDBwQAAFBAAwgDCQYBAQEBAAEYAAEAAAAAAAEAAAAAAAEAAAAAAAABAAAAAQAAAAACNsC0zkbT1+wEBN5aVMDlUJpOTM9QX5x5xnJf74b3lYKPPO0d6aHYew==

-- Decompiled by Krnl

local v_u_1 = game:GetService("PolicyService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Std.Promise)
return function(p_u_4)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	return v_u_3.new(function(p5, _, p6)
		-- upvalues: (ref) v_u_1, (copy) p_u_4
		local v7 = v_u_1:GetPolicyInfoForPlayerAsync(p_u_4)
		if not p6() then
			p5(v7)
		end
	end)
end
