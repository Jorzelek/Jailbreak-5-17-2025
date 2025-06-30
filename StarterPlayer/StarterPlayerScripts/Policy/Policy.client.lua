-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLGXNldENhY2hlZFBsYXllclBvbGljeUluZm8EZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB1BsYXllcnMHcmVxdWlyZQZQb2xpY3kacHJvbWlzZVBvbGljeUluZm9Gb3JQbGF5ZXINUG9saWN5U2VydmljZQtMb2NhbFBsYXllcgdhbmRUaGVuAAIEAQIAAAAH+wIAAE0BArMAAAAA+wIBAFIDAACfAQMBggABAAEDAQAJAAEYAAAAAAAAAQoAAAAACAAAAQIAJ6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgYAAABQQE0EAIUHAAAATQMETAgAAACfAgICpAMGAAAAUEBNBQCFBwAAAE0EBcUJAAAAnwMCAk0EATEKAAAAUgUCAFIGBACfBQICwAcLABIAAwASAAQAvAUFtQwAAACfBQMBggABAA0DAgQAAABAAwMDBAMFAwYEAABQQAMHAwgDCQMKBgADCwEAAQABGAABAAAAAAABAAAAAAABAAAAAAAAAgAAAAAAAAIAAQAAAAAAAAAAAwEAAAAAAS9JHV7vyCkeHY13yvNG8EXIygZy+YFFeClxKk44wa+KNN/+10gE9EI=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Policy.promisePolicyInfoForPlayer)
local v_u_4 = require(v1.Policy.PolicyService)
local v_u_5 = v2.LocalPlayer
v3(v_u_5):andThen(function(p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	v_u_4.setCachedPlayerPolicyInfo(v_u_5, p6)
end)
