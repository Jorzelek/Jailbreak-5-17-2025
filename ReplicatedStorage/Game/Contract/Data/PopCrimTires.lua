-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPKFBvcCB0aGUgdGlyZXMgb2YgYSAlZCBjcmltaW5hbCB2ZWhpY2xlcyEHR2V0R29hbAZmb3JtYXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUIU2V0dGluZ3MIUmVzb3VyY2UIRW51bVRlYW0GUG9saWNlBnRlYW1JZAdtZXNzYWdlBGdvYWwJcmV3YXJkRXhwAAIFAQAAAAcAAAEDAQQCCG8BAAC8AwAVAQAAAJ8DAgC8AQGNAgAAAJ8BAACCAQAAAwMBAwIDAwAHAAEYAAAAAAAAAAAIAAAAAAUAAAECACCjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwBiBwAAAE0CA8oGAAAAnwECAv8CAwAAAAAATQQBTAgAAABNAwSyCQAAADADAm8KAAAAwAMLADADApgMAAAAjAMEADADAgoNAAAAjAMoADADAgMOAAAAggICAA8DBAQAAABAAwUDBgMHBAAAQEADCAMJAwoDCwMMBgADDQMOAw8BAAEAARgAAQAAAAAAAQAAAAAAAAIAAQAAAAAAAQAAAwAAAQAAAQEAAAAAAdpj0mRDQpiv6Ke48OUC8jaSZiH5UssFFpU2k2ZDgYwwy730oGMmGmI=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return {
	["teamId"] = require(v1.Resource.Settings).EnumTeam.Police,
	["message"] = function(p2)
		return ("Pop the tires of a %d criminal vehicles!"):format(p2:GetGoal())
	end,
	["goal"] = 4,
	["rewardExp"] = 40
}
