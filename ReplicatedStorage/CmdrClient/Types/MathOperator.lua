-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOB1BlcmZvcm0MbWF0aE9wZXJhdG9yBENtZHIEVXRpbAxNYWtlRW51bVR5cGUNTWF0aCBPcGVyYXRvcgROYW1lASsBLQEqAS8CKioBJQxSZWdpc3RlclR5cGUACAMCAAAAAAJDAgABggICAAAABQEBGAAABgAAAAADAgAAAAACJgIAAYICAgAAAAsBARgAAAwAAAAAAwIAAAAAAgkCAAGCAgIAAAARAQEYAAASAAAAAAMCAAAAAALsAgABggICAAAAFwEBGAAAGAAAAAADAgAAAAACsgIAAYICAgAAAB0BARgAAB4AAAAAAwIAAAAAAs8CAAGCAgIAAAAjAQEYAAAkAAAAAA4BAAAAADtvAwAATQYAngEAAABNBQaeAgAAAE0EBbIDAAAAbwUEAP8GAAAGAAAA4gcHAG8ICAAwCAe6BQAAAMAICQAwCAdcBgAAAOIIBwBvCQoAMAkIugUAAADACQsAMAkIXAYAAADiCQcAbwoMADAKCboFAAAAwAoNADAKCVwGAAAA4goHAG8LDgAwCwq6BQAAAMALDwAwCwpcBgAAAOILBwBvDBAAMAwLugUAAADADBEAMAwLXAYAAADiDAcAbw0SADANDLoFAAAAwA0TADANDFwGAAAAxQYHBwEAAACfBAMAvAEA3RQAAACfAQABggABABUDAgMDAwQDBQMGAwcDAQUCBQYDCAYAAwkGAQMKBgIDCwYDAwwGBAMNBgUDDgYAAQIDBAUBAAEYAAAAAAAAAAAAAAEBAAABAAAEAQAAAQAABAEAAAEAAAQBAAABAAAEAQAAAQAABAEAAAEAAAAA3wAAACYCAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgYBBgEAARgAAAABAAAAAAdUJ46tuu/ozGbj5DljkaeEsdgpyp9QmvkK7mfdSkofygbnL9r53Vfv

-- Decompiled by Krnl

return function(p1)
	p1:RegisterType("mathOperator", p1.Cmdr.Util.MakeEnumType("Math Operator", {
		{
			["Name"] = "+",
			["Perform"] = function(p2, p3)
				return p2 + p3
			end
		},
		{
			["Name"] = "-",
			["Perform"] = function(p4, p5)
				return p4 - p5
			end
		},
		{
			["Name"] = "*",
			["Perform"] = function(p6, p7)
				return p6 * p7
			end
		},
		{
			["Name"] = "/",
			["Perform"] = function(p8, p9)
				return p8 / p9
			end
		},
		{
			["Name"] = "**",
			["Perform"] = function(p10, p11)
				return p10 ^ p11
			end
		},
		{
			["Name"] = "%",
			["Perform"] = function(p12, p13)
				return p12 % p13
			end
		}
	}))
end
