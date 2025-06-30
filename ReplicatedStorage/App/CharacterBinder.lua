-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMnA25ldwhtYW5pZmVzdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQ5NYW5pZmVzdEJpbmRlcgNTdGQKQmFzZU9iamVjdAdfX2luZGV4CUNoYXJhY3RlchBIdW1hbm9pZFJvb3RQYXJ0BEhlYWQKVXBwZXJUb3JzbwpMb3dlclRvcnNvBE5lY2sFV2Fpc3QEUm9vdA1SaWdodFVwcGVyQXJtDVJpZ2h0U2hvdWxkZXINUmlnaHRMb3dlckFybQpSaWdodEVsYm93CVJpZ2h0SGFuZApSaWdodFdyaXN0DExlZnRVcHBlckFybQxMZWZ0U2hvdWxkZXIMTGVmdExvd2VyQXJtCUxlZnRFbGJvdwhMZWZ0SGFuZAlMZWZ0V3Jpc3QJSGVhZC9OZWNrEFVwcGVyVG9yc28vV2Fpc3QPTG93ZXJUb3Jzby9Sb290G1JpZ2h0VXBwZXJBcm0vUmlnaHRTaG91bGRlchhSaWdodExvd2VyQXJtL1JpZ2h0RWxib3cUUmlnaHRIYW5kL1JpZ2h0V3Jpc3QZTGVmdFVwcGVyQXJtL0xlZnRTaG91bGRlchZMZWZ0TG93ZXJBcm0vTGVmdEVsYm93EkxlZnRIYW5kL0xlZnRXcmlzdAACBAIBAAAACPsDAABNAgPvAAAAAFIDAACfAgICMAECSAEAAACCAgIAAgMBAwIACQEBGAAAAAAAAQABCgAAAAAIAAABAgBbowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIAiQYAAACfAQICpAIFAAAAQEBNBAChBwAAAE0DBEsIAAAAnwICAv8DAgAAAAAAMAMDbgkAAADABAoAEgACADAEA+8LAAAATQQB7wsAAABvBQwA4gYgAG8HDQAwBwZmDQAAAG8HDgAwBwYTDgAAAG8HDwAwBwZVDwAAAG8HEAAwBwYyEAAAAG8HIQAwBwbkEQAAAG8HIgAwBwZAEgAAAG8HIwAwBwZ0EwAAAG8HFAAwBwbSFAAAAG8HJAAwBwbLFQAAAG8HFgAwBwbZFgAAAG8HJQAwBwb2FwAAAG8HGAAwBwYlGAAAAG8HJgAwBwZtGQAAAG8HGgAwBwa4GgAAAG8HJwAwBwZSGwAAAG8HHAAwBwbhHAAAAG8HKAAwBwatHQAAAG8HHgAwBwZaHgAAAG8HKQAwBwb8HwAAAFIHAwCfBAQAggQAACoDAwQAAABAAwQDBQMGBAAAQEADBwMIAwkDCgYAAwEDCwMMAw0DDgMPAxADEQMSAxMDFAMVAxYDFwMYAxkDGgMbAxwDHQMeBRMNDg8QERITFBUWFxgZGhscHR4fAx8DIAMhAyIDIwMkAyUDJgMnAQABAAEYAAEAAAAAAAEAAAAAAQAAAAAAAAIAAQACAAAACQAAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAHsAAEAAAAAAd+8hEW5hx4l7Xju0YDbCH48Y7qaFIlDHjZUYszsVOgjoHmvDoPdxAY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.ManifestBinder)
local v_u_3 = require(v1.Std.BaseObject)
local v4 = {}
v4.__index = v4
function v4.new(p5, p6)
	-- upvalues: (copy) v_u_3
	local v7 = v_u_3.new(p5)
	v7.manifest = p6
	return v7
end
return v2.new("Character", {
	["HumanoidRootPart"] = "HumanoidRootPart",
	["Head"] = "Head",
	["UpperTorso"] = "UpperTorso",
	["LowerTorso"] = "LowerTorso",
	["Neck"] = "Head/Neck",
	["Waist"] = "UpperTorso/Waist",
	["Root"] = "LowerTorso/Root",
	["RightUpperArm"] = "RightUpperArm",
	["RightShoulder"] = "RightUpperArm/RightShoulder",
	["RightLowerArm"] = "RightLowerArm",
	["RightElbow"] = "RightLowerArm/RightElbow",
	["RightHand"] = "RightHand",
	["RightWrist"] = "RightHand/RightWrist",
	["LeftUpperArm"] = "LeftUpperArm",
	["LeftShoulder"] = "LeftUpperArm/LeftShoulder",
	["LeftLowerArm"] = "LeftLowerArm",
	["LeftElbow"] = "LeftLowerArm/LeftElbow",
	["LeftHand"] = "LeftHand",
	["LeftWrist"] = "LeftHand/LeftWrist"
}, v4)
