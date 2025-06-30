-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWFGdldENlbnRlcldpbmRvd0dyb3VwBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlCFNldHRpbmdzCFJlc291cmNlA1N0ZAZTaWduYWwLV2luZG93R3JvdXAGTW9kdWxlBldpbmRvdwNuZXcNT25UZWFtQ2hhbmdlZAhFbnVtVGVhbQhQcmlzb25lcgRUZWFtCFNjaGVkdWxlBmJvdW50eQ9vbkJvdW50eUNoYW5nZWQOcmVtb3ZlRGVhdGhHdWkTcmVtb3ZlRGVhdGhMaWdodGluZwACAQABAAAAAvsAAACCAAIAAAAQAQEYAAARAAAAAAcAAAECAESjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwBiBwAAAE0CA8oGAAAAnwECAqQCBQAAAEBATQQAoQgAAABNAwQfCQAAAJ8CAgKkAwUAAABAQE0GAEALAAAATQUGZQwAAABNBAUPCgAAAJ8DAgL/BAQAAAAAAE0FAu8NAAAAnwUBAjAFBC0OAAAATQYBTA8AAABNBQaeEAAAADAFBGwRAAAAxgUAADAFBKASAAAAjAUAADAFBFETAAAATQUC7w0AAACfBQECMAUEABQAAADGBQAAMAUEDRUAAADGBQAAMAUE4hYAAABNBQPvDQAAAJ8FAQLABhcAEgAFADAGBOAYAAAAggQCABkDAgQAAABAAwMDBAMFBAAAQEADBgMHAwgDCQMKAwsDDAMNAw4DDwMQAxEDEgMTAxQDFQMWBgADAQEAAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAAAAAEAAQAAAAABAAAAAAABAAABAAABAAAAAAEAAAEAAAIAAAEAAAADAQAAAAABd4hqZ56moaFFTADziBcF9dff9SBSdslwBFoWzaf1M9gZGUxFf+WeGQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Resource.Settings)
local v3 = require(v1.Std.Signal)
local v4 = require(v1.Module.Window.WindowGroup)
local v5 = {
	["OnTeamChanged"] = v3.new(),
	["Team"] = v2.EnumTeam.Prisoner,
	["Schedule"] = nil,
	["bounty"] = 0,
	["onBountyChanged"] = v3.new(),
	["removeDeathGui"] = nil,
	["removeDeathLighting"] = nil
}
local v_u_6 = v4.new()
function v5.getCenterWindowGroup()
	-- upvalues: (copy) v_u_6
	return v_u_6
end
return v5
