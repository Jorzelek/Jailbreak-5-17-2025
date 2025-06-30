-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRBEdsb3cORmluZEZpcnN0Q2hpbGQIR2V0TGlnaHQFTW9kZWwEVHlwZQRNYWtlCEdldENvbG9yBE5hbWUFQ29sb3IHRW5hYmxlZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVQYWludARHYW1lBkdhcmFnZQADBQEAAAAABm8DAACpBAEAvAEAAwEAAACfAQQAggEAAAIDAQMCAAUDARgAAAAAAAAGAAAAAAkCAQAAAB1NAgE7AAAAAE0DAREBAAAATQQBrQIAAABvBwMAqQgBALwFAgMEAAAAnwUEAg4FEAAOAAwA+wcAAE0GBwsFAAAATQcAugYAAACfBgICMAYFpAcAAACpBwEAMAcF8AgAAACCAAEAqQYAADAGBfAIAAAAggABAAkDBAMFAwYDAQMCAwcDCAMJAwoACAABGAMAAQABAPsAAAAACAEBAAAAAAAEAAEAAAACAAADBgAAAAAFAAABAgAUowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQQAvQcAAABNAwQoCAAAAE0CA1EGAAAAnwECAsACCQDAAwoAEgABAIIDAgALAwsEAAAAQAMMAw0DDgQAAEBAAw8DEAMRBgAGAQIAAQEAARgAAQAAAAAAAQAAAAAAAAAAAgMAAAEAAAAAAjZ1ckWUefNaBLEY0YX/MDI+nA0tq42kpTWdwfClZc7V2mPwk8Rpr5s=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.Paint)
return function(p3, p4)
	-- upvalues: (copy) v_u_2
	local v5 = p4.Model
	local _ = p4.Type
	local _ = p4.Make
	local v6 = v5:FindFirstChild("Glow", true)
	if v6 then
		if p3 then
			v6.Color = v_u_2.GetColor(p3.Name)
			v6.Enabled = true
			return
		end
		v6.Enabled = false
	end
end
