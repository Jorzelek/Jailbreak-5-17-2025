-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBWl0ZW1zBXRhYmxlBmluc2VydAhkdXJhdGlvbgh3aW5JbmRleAV0aXRsZQtpY29uSW1hZ2VJZAxwcmltYXJ5Q29sb3IFdG9waWMJZXh0cmFUZXh0FnNldFJld2FyZFNwaW5uZXJDb25maWcEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNUmV3YXJkU3Bpbm5lchpnZXRJdGVtUHJvcHNGcm9tUmV3YXJkRGF0YQ1jcmVhdGVSZWR1Y2VyAAIMAgEAAAA4TQIBGAAAAAArAgIAxgIAAIICAgD/AgAAAAAAAE0DARgAAAAAxgQAAMYFAABkAwoA+wgAAFIJBwCfCAICnjQCBQgAAABSCgIAUgsIAKQJAwAACBCAnwkDAW4D9f8CAAAA4gMLADACAxgAAAAATQQBxQQAAAAwBAPFBAAAAE0EAb8FAAAAMAQDvwUAAABNBAGaBgAAADAEA5oGAAAATQQB1QcAAAAwBAPVBwAAAE0EAWQIAAAAMAQDZAgAAABNBAGrCQAAADAEA6sJAAAATQQBaQoAAAAwBANpCgAAAIIDAgAMAwEDAgMDBAAIEIADBAMFAwYDBwMIAwkDCgUIAAQFBgcICQoACAsBGAAAAAEAAgABAAAAAAEAAAEAAAAAAAD+AAQBAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAAACQAAAAAHAAABAgAdowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIApwYAAACfAQICpAIFAAAAQEBNBAC3BwAAAE0DBOcIAAAAnwICAk0DAdYJAAAAxgQAAOIFCwDABgwAEgACADAGBeAKAAAAnwMDAIIDAAANAwwEAAAAQAMNAw4DDwQAAEBAAxADEQMSAxMDCwUBCgYAAQABAAEYAAEAAAAAAAEAAAAAAgAAAAAAAAIAAAABAAAA/wABAAAAAAEE3hbkmyk3GzYafHBPzizjBpUxs9qjdRGiLinGJc6NKV23kerCVEuI

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Rodux)
local v_u_3 = require(v1.RewardSpinner.getItemPropsFromRewardData)
return v2.createReducer(nil, {
	["setRewardSpinnerConfig"] = function(_, p4)
		-- upvalues: (copy) v_u_3
		if not p4.items then
			return nil
		end
		local v5 = {}
		for _, v6 in p4.items do
			local v7 = v_u_3(v6)
			table.insert(v5, v7)
		end
		return {
			["items"] = v5,
			["duration"] = p4.duration,
			["winIndex"] = p4.winIndex,
			["title"] = p4.title,
			["iconImageId"] = p4.iconImageId,
			["primaryColor"] = p4.primaryColor,
			["topic"] = p4.topic,
			["extraText"] = p4.extraText
		}
	end
})
