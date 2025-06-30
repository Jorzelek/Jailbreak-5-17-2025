-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMIBXZhbHVlFXNldE5ldHdvcmtNdXRleExvY2tlZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAIDAgAAAAADTQIBzAAAAACCAgIAAQMBAAkCARgAAAAKAAAAAAYAAAECABWjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAKkDAADiBAkAwAUKADAFBLYIAAAAnwIDAIICAAALAwMEAAAAQAMEAwUDBgQAAEBAAwcDCAMCBQEIBgABAAEAARgAAQAAAAAAAQAAAAAFAAAAAQAA/wABAAAAAAEQ4NKi4OYROiIkuDYJbsgCaM9KzdrzD0x9VHdg9r55GSBxeiSl9yp6

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["setNetworkMutexLocked"] = function(_, p2)
		return p2.value
	end
})
