-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNBE5hbWUGQnV0dG9uBGZpbmQKVGh1bWJzdGljawREUGFkEGlzR2FtZXBhZEtleUNvZGUERW51bQ1Vc2VySW5wdXRUeXBlBVRvdWNoBmlwYWlycwhHYW1lcGFkMQhLZXlib2FyZA5nZXRCZXN0S2V5Q29kZQADBQEAAAAAFU0BALoAAAAAbwQBALwCAVYCAAAAnwIDAisCCgBvBAMAvAIBVgIAAACfAgMCKwIFAG8EBAC8AgFWAgAAAJ8CAwIOAgIAqQIBAIICAgCpAgAAggICAAUDAQMCAwMDBAMFAAIGARgAAAEAAAAAAAAAAAAAAAAAAAEAAgADAAAAAAkCAQAAACErAAEAggABACsBAQCCAAEApAIDAAIEAMCaAQIAAgAAAIIAAQCkAgUAAABAQFIDAACfAgIEUQIQAKQHBwAGBADAmgEIAAcAAAD7CAAATQcI3wgAAABSCAYAnwcCAg4HAQCCBgIApAcKAAkEAMCaAQIABwAAAIIGAgBuAu//AgAAgIIAAQALAwcDCAMJBAIEAMADCgQAAEBAAwsEBgQAwAMGAwwECQQAwAAJDQEYAAECAQIAAAABAgAAAAABAAAAAAAAAAAAAQEAAAAB/AAHCgAAAAACAAABAgALowAAAP8AAgAAAAAAwAEAADABAN8BAAAAwAECABIAAAAwAQDgAwAAAIIAAgAEBgADBgYBAw0CAAEBAAEYAAAAAQAABwAAABIBAAAAAALLDfz0GinvjPnJlmAppHsbf2ny1A5QvaqVpthOeEX9KXVx1AVpLx+f

-- Decompiled by Krnl

local v_u_6 = {
	["isGamepadKeyCode"] = function(p1)
		local v2 = p1.Name
		return (v2:find("Button") or (v2:find("Thumbstick") or v2:find("DPad"))) and true or false
	end,
	["getBestKeyCode"] = function(p3, p4)
		-- upvalues: (copy) v_u_6
		if p3 then
			if p4 then
				if p4 ~= Enum.UserInputType.Touch then
					for _, v5 in ipairs(p3) do
						if p4 == Enum.UserInputType.Gamepad1 and v_u_6.isGamepadKeyCode(v5) then
							return v5
						end
						if p4 == Enum.UserInputType.Keyboard then
							return v5
						end
					end
				end
			else
				return
			end
		else
			return
		end
	end
}
return v_u_6
