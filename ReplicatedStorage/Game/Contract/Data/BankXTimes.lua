-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRFlJvYiB0aGUgQmFuayAlZCB0aW1lcy4HR2V0R29hbAZmb3JtYXQEbWF0aAZyYW5kb20EZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUIU2V0dGluZ3MIUmVzb3VyY2UIRW51bVRlYW0IQ3JpbWluYWwGdGVhbUlkB21lc3NhZ2UEZ29hbAlyZXdhcmRFeHAAAwUBAAAABwAAAQMBBAIIbwEAALwDABUBAAAAnwMCALwBAY0CAAAAnwEAAIIBAAADAwEDAgMDAAcAARgAAAAAAAAAAAgAAAAAAwAAAAAABqQAAgAABACAjAEDAIwCBACfAAMAggAAAAMDBAMFBAAEAIAACgABGAAAAAAAAAsAAAAABQAAAQIAIKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAGIHAAAATQIDygYAAACfAQIC/wIDAAAAAABNBAFMCAAAAE0DBHUJAAAAMAMCbwoAAADAAwsAMAMCmAwAAADAAw0AMAMCCg4AAACMAzwAMAMCAw8AAACCAgIAEAMGBAAAAEADBwMIAwkEAABAQAMKAwsDDAMNAw4GAAMPBgEDEAMRAgABAQABGAABAAAAAAABAAAAAAAAAgABAAAAAAABAAADAAADAAABAQAAAAACKY46DvG8rWUbSlCaOs5E62xdDnPpX/BeNjcjzXjvfyC14HqWlApJ+w==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return {
	["teamId"] = require(v1.Resource.Settings).EnumTeam.Criminal,
	["message"] = function(p2)
		return ("Rob the Bank %d times."):format(p2:GetGoal())
	end,
	["goal"] = function()
		return math.random(3, 4)
	end,
	["rewardExp"] = 60
}
