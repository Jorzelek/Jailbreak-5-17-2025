-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTDnNob3J0QW5nbGVEaXN0BmlwYWlycwpHZXRQbGF5ZXJzB2dldFRlYW0EVGVhbQZQb2xpY2ULZ2V0Um9vdFBhcnQIUG9zaXRpb24JTWFnbml0dWRlE2dldE5lYXJlc3ROb25Qb2xpY2UEZ2FtZQdQbGF5ZXJzCkdldFNlcnZpY2URUmVwbGljYXRlZFN0b3JhZ2UHcmVxdWlyZQtQbGF5ZXJVdGlscwRHYW1lCFNldHRpbmdzCFJlc291cmNlAAMHAgAAAAAHJgMBACECAwCMBgIACQUGAiEEBQAmAwQCggMCAAECGC1EVPshGUAACAEBGAAAAQAAAAAKAAAAAA4CAwAAACmQAgEAxgMAAKQEAgAAABBA+wUAALwFBasDAAAAnwUCAJ8EAARRBBwA+woBAE0JCpQEAAAAUgoIAJ8JAgIOCRYA+wwCAE0LDGwFAAAATQoLsgYAAADxCRAACgAAAPsLAQBNCgsbBwAAAFILCACfCgICDgoJAE0NCjsIAAAAJgwNAE0LDKoJAAAAYAsDAAIAAABSAgsAUgMIAG4E4/8CAACAggMCAAoCAAAAAAAA8H8DAgQAABBAAwMDBAMFAwYDBwMIAwkADQoBGAABAQAAAAAAAAABAAAAAAEAAAAAAAAAAQAAAAABAQAAAAABAAEB+AANDgAAAAAGAAABAgAnowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCBgAAAFBATQQBvQgAAABNAwSmBwAAAJ8CAgKkAwYAAABQQE0FAWIKAAAATQQFygkAAACfAwIC/wQCAAAAAADABQsAMAUEqQwAAADABQ0AEgAAABIAAgASAAMAMAUEjw4AAACCBAIADwMLBAAAAEADDAMNAw4DDwQAAFBAAxADEQMSAxMGAAMBBgEDCgIAAQEAARgAAQAAAAAAAQAAAAAAAQAAAAAAAAEAAAAAAAACAAEAAAUAAAAAABIBAAAAAAIY4cSYHlBxpyolrgzVNlfAMA474wLjs9BvTCjIDLYlTzkxLbHwnwq1

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Game.PlayerUtils)
local v_u_4 = require(v2.Resource.Settings)
return {
	["shortAngleDist"] = function(p5, p6)
		local v7 = (p6 - p5) % 6.283185307179586
		return 2 * v7 % 6.283185307179586 - v7
	end,
	["getNearestNonPolice"] = function(p8, p9)
		-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
		local v10 = p9 or (1 / 0)
		local v11 = nil
		for _, v12 in ipairs(v_u_1:GetPlayers()) do
			local v13 = v_u_3.getTeam(v12)
			if v13 and v13 ~= v_u_4.Team.Police then
				local v14 = v_u_3.getRootPart(v12)
				if v14 then
					local v15 = (v14.Position - p8).Magnitude
					if v15 < v10 then
						v11 = v12
						v10 = v15
					end
				end
			end
		end
		return v11
	end
}
