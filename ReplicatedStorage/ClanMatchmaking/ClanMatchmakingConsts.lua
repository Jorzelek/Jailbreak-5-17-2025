-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlA1N0ZApUYWJsZVV0aWxzA0FwcAhSdW5VdGlscwlSdW5Db25zdHMGZ2V0RW52B1FBX05BTUUIREVWX05BTUULU1RVRElPX05BTUUacmVxdWlyZVZhbGlkSW5kZXhBbmRGcmVlemUdQ0xBTl9SRUFEWV9VUF9FWFBJUkFUSU9OX1RJTUUYQ0xBTl9SRUFEWV9VUF9SRVRSWV9USU1FHUNMQU5fSVNfUkVBRElFRF9VUF9NT0RFTF9OQU1FFFJFQURZX1VQX1JFTU9URV9OQU1FFlVOUkVBRFlfVVBfUkVNT1RFX05BTUUbQ0xBTl9SRUFEWV9VUF9DT09MRE9XTl9USU1FHkNMQU5fSVNfUkVBRElFRF9VUF9SRU1PVEVfTkFNRQ9DbGFuSXNSZWFkaWVkVXANUmVhZHlVcFJlbW90ZQ9VbnJlYWR5VXBSZW1vdGUVQ2xhbklzUmVhZGllZFVwUmVtb3RlAAEIAAABAgBOowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAoQYAAABNAgMYBwAAAJ8BAgKkAgUAAABAQE0EAMEIAAAATQMEQgkAAACfAgICpAMFAAAAQEBNBQDBCAAAAE0EBW8KAAAAnwMCAowEFABNBQKOCwAAAJ8FAQJNBgOcDAAAAJoFAwAGAAAAjAQKAGUADwBNBQKOCwAAAJ8FAQJNBgPBDQAAAPEFCAAGAAAATQUCjgsAAACfBQECTQYD7Q4AAACaBQIABgAAAIwEAQBNBQEADwAAAOIGFwCMBzwAMAcGNBAAAACMBwUAMAcG7xEAAABvBxgAMAcGtxIAAABvBxkAMAcGLBMAAABvBxoAMAcG4BQAAAAwBAZEFQAAAG8HGwAwBwYwFgAAAJ8FAgCCBQAAHAMBBAAAAEADAgMDAwQEAABAQAMFAwYDBwMIAwkDCgMLAwwDDQMOAw8DEAMRAxIDEwMUAxUFBxAREhMUFRYDFgMXAxgDGQABAAEYAAEAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAgBAAAAAAAAAQABAAAAAAAAAAAAAAAAAAEDAAABAAABAAABAAABAAABAAABAAEAAPkAAQAAAAAAQPEUD0yZkktyNX6bIM2t26ioYq/x7l+jUEDv+/3uO4/hG5rMKxnplQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Std.TableUtils)
local v3 = require(v1.App.RunUtils)
local v4 = require(v1.App.RunConsts)
local v5 = v3.getEnv() == v4.QA_NAME and 10 or ((v3.getEnv() == v4.DEV_NAME or v3.getEnv() == v4.STUDIO_NAME) and 1 or 20)
return v2.requireValidIndexAndFreeze({
	["CLAN_READY_UP_EXPIRATION_TIME"] = 60,
	["CLAN_READY_UP_RETRY_TIME"] = 5,
	["CLAN_IS_READIED_UP_MODEL_NAME"] = "ClanIsReadiedUp",
	["READY_UP_REMOTE_NAME"] = "ReadyUpRemote",
	["UNREADY_UP_REMOTE_NAME"] = "UnreadyUpRemote",
	["CLAN_READY_UP_COOLDOWN_TIME"] = v5,
	["CLAN_IS_READIED_UP_REMOTE_NAME"] = "ClanIsReadiedUpRemote"
})
