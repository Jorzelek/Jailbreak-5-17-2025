-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKCnJlY2VpdmVkQXQSbWlzc2luZyByZWNlaXZlZEF0BmFzc2VydBtzZXRTcGF3blNlbGVjdGlvblJlY2VpdmVkQXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgACBQIAAAAAC00DAREAAAAAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIBEQAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAEAAAcAAAAABgAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAAjAMAAOIECQDABQoAMAUEEQgAAACfAgMAggIAAAsDBQQAAABAAwYDBwMIBAAAQEADCQMKAwQFAQgGAAEAAQABGAABAAAAAAABAAAAAAIAAAABAAD/AAEAAAAAAXt68E31l4ViSb6a2X++valq31X6MDUdcHRNoyej/gEm9nE6HEv2aPY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(0, {
	["setSpawnSelectionReceivedAt"] = function(_, p2)
		local v3 = p2.receivedAt
		assert(v3, "missing receivedAt")
		return p2.receivedAt
	end
})
