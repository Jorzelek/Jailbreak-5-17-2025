-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMGHGdldEVzdGltYXRlZFBoeXNpY3NTdGVwc011bHQEZ2FtZQpSdW5TZXJ2aWNlCkdldFNlcnZpY2UHU3RlcHBlZAdDb25uZWN0AAMGAgEAAAAH+wIAAPsFAAAmBAEFWwMEAEMCAgPeAgAAggABAAECmpmZmZmZuT8ACAABGAAAAAAAAAEJAAAAAAIAAQAAAAP7AQAAPgABAIIAAgABAhEREREREZE/AA0BARgAAAAOAAAAAAUAAAECABejAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCbwEEAE0CANkFAAAA2QQAABIBAf+8AgLHBgAAAJ8CAwH/AgEAAAAAANkDAQASAQH/MAMCIwcAAADBAQAAggICAAgDAgQAAABAAwMDBAIRERERERGRPwMFAwYDAQIAAQEAARgAAQAAAAAABQEAAAAAAAAEAAEAAAADAAEAAAAAAvyPxKMlGyP1zkuuN0kH867HDU/q80jalwAqdbq9Cr95FPCqckS1q5c=

-- Decompiled by Krnl

local v1 = game:GetService("RunService")
local v_u_2 = 0.016666666666666666
v1.Stepped:Connect(function(_, p3)
	-- upvalues: (ref) v_u_2
	v_u_2 = v_u_2 + (p3 - v_u_2) * 0.1
end)
return {
	["getEstimatedPhysicsStepsMult"] = function()
		-- upvalues: (ref) v_u_2
		return v_u_2 / 0.016666666666666666
	end
}
