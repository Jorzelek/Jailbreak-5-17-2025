-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPHlJvYiB0aGUgSmV3ZWxyeSBTdG9yZSAlZCB0aW1lcwdHZXRHb2FsBmZvcm1hdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQhTZXR0aW5ncwhSZXNvdXJjZQhFbnVtVGVhbQhDcmltaW5hbAZ0ZWFtSWQHbWVzc2FnZQRnb2FsCXJld2FyZEV4cAACBQEAAAAHAAABAwEEAghvAQAAvAMAFQEAAACfAwIAvAEBjQIAAACfAQAAggEAAAMDAQMCAwMABwABGAAAAAAAAAAACAAAAAAFAAABAgAgowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAYgcAAABNAgPKBgAAAJ8BAgL/AgMAAAAAAE0EAUwIAAAATQMEdQkAAAAwAwJvCgAAAMADCwAwAwKYDAAAAIwDBQAwAwIKDQAAAIwDMgAwAwIDDgAAAIICAgAPAwQEAAAAQAMFAwYDBwQAAEBAAwgDCQMKAwsDDAYAAw0DDgMPAQABAAEYAAEAAAAAAAEAAAAAAAACAAEAAAAAAAEAAAMAAAEAAAEBAAAAAAH0YmFAFtIR8samC9SkiF8KV3k7s1n7PY6rwdR6DnX0KmOAB8yTmhhh

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return {
	["teamId"] = require(v1.Resource.Settings).EnumTeam.Criminal,
	["message"] = function(p2)
		return ("Rob the Jewelry Store %d times"):format(p2:GetGoal())
	end,
	["goal"] = 5,
	["rewardExp"] = 50
}
