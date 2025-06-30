-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPHlN0YXJ0IGEgYmFuayByb2JiZXJ5ICVkIHRpbWVzIQdHZXRHb2FsBmZvcm1hdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQhTZXR0aW5ncwhSZXNvdXJjZQhFbnVtVGVhbQhDcmltaW5hbAZ0ZWFtSWQHbWVzc2FnZQRnb2FsCXJld2FyZEV4cAACBQEAAAAHAAABAwEEAghvAQAAvAMAFQEAAACfAwIAvAEBjQIAAACfAQAAggEAAAMDAQMCAwMABwABGAAAAAAAAAAACAAAAAAFAAABAgAgowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAYgcAAABNAgPKBgAAAJ8BAgL/AgMAAAAAAE0EAUwIAAAATQMEdQkAAAAwAwJvCgAAAMADCwAwAwKYDAAAAIwDAgAwAwIKDQAAAIwDIwAwAwIDDgAAAIICAgAPAwQEAAAAQAMFAwYDBwQAAEBAAwgDCQMKAwsDDAYAAw0DDgMPAQABAAEYAAEAAAAAAAEAAAAAAAACAAEAAAAAAAEAAAMAAAEAAAEBAAAAAAFrC6TG7SfnpFnPzlJxxJgCN10suemqRqc8HULyCJSxXWctdDNKP8Al

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return {
	["teamId"] = require(v1.Resource.Settings).EnumTeam.Criminal,
	["message"] = function(p2)
		return ("Start a bank robbery %d times!"):format(p2:GetGoal())
	end,
	["goal"] = 2,
	["rewardExp"] = 35
}
