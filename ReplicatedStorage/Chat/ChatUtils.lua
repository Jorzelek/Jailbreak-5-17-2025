-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJF0NoYXRXaW5kb3dDb25maWd1cmF0aW9uFUZpbmRGaXJzdENoaWxkT2ZDbGFzcwdFbmFibGVkCnNldEVuYWJsZWQKZ2V0RW5hYmxlZARoaWRlBGdhbWUPVGV4dENoYXRTZXJ2aWNlCkdldFNlcnZpY2UABQQBAQAABgMAAAUBAQn7AQAAbwMAALwBAbgBAAAAnwEDAg4BAgAwAAHwAgAAAIIAAQADAwEDAgMDAAQEARgAAAAAAAEBAAIFAAAAAAMAAQAAAAv7AAAAbwIAALwAALgBAAAAnwADAg4AAwBNAQDwAgAAAIIBAgCpAQAAggECAAMDAQMCAwMACgUBGAAAAAAAAQEAAAIACwAAAAACAAEAAAAG+wEAAE0AAb4AAAAAqQEBAJ8AAgGCAAEAAQMEABMAARgAAAAAAAEUAAAAAAIAAQAAAAj7AQAATQABvgAAAACpAQAAnwACAcAAAQASAgAAggACAAIDBAYCAQIRBgEYAAAAAAABAAASAAAAAAMAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMC/wEDAAAAAADAAgQAEgAAADACAb4FAAAAwAIGABIAAAAwAgGiBwAAAMACCAASAAEAMAIB7wkAAACCAQIACgMHBAAAAEADCAMJBgADBAYBAwUGAwMGAwABAwEAARgAAQAAAAAAAQABAAAABgAAAAcAAAAGAQAAAAAE79VIroEU4hLdESI6hssrVGCbvZSAEeCIwn9SGI/ZtpKvUwWbneg1mg==

-- Decompiled by Krnl

local v_u_1 = game:GetService("TextChatService")
local v_u_5 = {
	["setEnabled"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1:FindFirstChildOfClass("ChatWindowConfiguration")
		if v3 then
			v3.Enabled = p2
		end
	end,
	["getEnabled"] = function()
		-- upvalues: (copy) v_u_1
		local v4 = v_u_1:FindFirstChildOfClass("ChatWindowConfiguration")
		if v4 then
			return v4.Enabled
		else
			return false
		end
	end,
	["hide"] = function()
		-- upvalues: (copy) v_u_5
		v_u_5.setEnabled(false)
		return function()
			-- upvalues: (ref) v_u_5
			v_u_5.setEnabled(true)
		end
	end
}
return v_u_5
