-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSB01ha2VDYXIFU3BlZWQLT3BlbmVkVmF1bHQFTW9kZWwNVmF1bHREb29yTWFpbg5GaW5kRmlyc3RDaGlsZAVlcnJvchtNaXNzaW5nIFZhdWx0RG9vck1haW4gbW9kZWwHRGVzdHJveQdNb3ZlQ2FyCkRlc3Ryb3lDYXIEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHRGVmYXVsdAZzY3JpcHQGUGFyZW50AAQDAQEAAAAG+wIAAE0BAicAAAAAUgIAAJ8BAgCCAQAAAQMBAAUBARgAAAAAAAAGAAAAAAkEAQAAACRNBAEsAAAAAIwFBQB9BBcABQAAAE0EAZ8BAAAAKwQTAKkEAQAwBAGfAQAAAE0EADsCAAAATQUEOwIAAABvBwMAvAUFAwQAAACfBQMCKwUEAKQGBgAAAFBAbwcHAJ8GAgG8BgVQCAAAAJ8GAgH7BQAATQQFPAkAAABSBQAAUgYBAFIHAgBSCAMAnwQFAIIEAAAKAwIDAwMEAwUDBgMHBAAAUEADCAMJAwoACAoBGAAAAAAAAQAAAQAAAQABAAAAAAABAQAAAAIAAAMAAAAAAAAAAAkAAAAAAwEBAAAABvsCAABNAQJxAAAAAFICAACfAQIAggEAAAEDCwAWCwEYAAAAAAAAFwAAAAAGAAABAgAeowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBApAQIAAAAcEBNAwQkCQAAAE0CAzoGAAAAnwECAsACCgASAAEAwAMLABIAAQDABAwAEgABAOIFEAAwAgUnDQAAADADBTwOAAAAMAQFcQ8AAACCBQIAEQMMBAAAAEADDQMOAw8EAABAQAMQAxEEAABwQAMSBgAGAQYCAwEDCgMLBQMNDg8DAAECAQABGAABAAAAAAACAAAAAAAAAAABAAMADgADAQABAAEAAAEAAAAAAxQl0CLHc8ESJuG6tn8tQPIwWKt5UYoRNJGmIqyLv5CCP48/N7U8Tmw=

-- Decompiled by Krnl

game:GetService("ReplicatedStorage")
local v_u_1 = require(script.Parent.Default)
return {
	["MakeCar"] = function(p2)
		-- upvalues: (copy) v_u_1
		return v_u_1.MakeCar(p2)
	end,
	["MoveCar"] = function(p3, p4, p5, p6)
		-- upvalues: (copy) v_u_1
		if p4.Speed <= 5 and not p4.OpenedVault then
			p4.OpenedVault = true
			local v7 = p3.Model.Model:FindFirstChild("VaultDoorMain")
			if not v7 then
				error("Missing VaultDoorMain model")
			end
			v7:Destroy()
		end
		return v_u_1.MoveCar(p3, p4, p5, p6)
	end,
	["DestroyCar"] = function(p8)
		-- upvalues: (copy) v_u_1
		return v_u_1.DestroyCar(p8)
	end
}
