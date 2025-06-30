-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJB3JlcXVpcmUGc2NyaXB0BVN0b3JlDWNyZWF0ZVJlZHVjZXIPY29tYmluZVJlZHVjZXJzEW1ha2VBY3Rpb25DcmVhdG9yEGxvZ2dlck1pZGRsZXdhcmUPdGh1bmtNaWRkbGV3YXJlCm1pZGRsZXdhcmUAAQgAAAECADujAAAApAABAAAAAECkAgMAAAAgQE0BAl4EAAAAnwACAqQBAQAAAABApAMDAAAAIEBNAgPWBQAAAJ8BAgKkAgEAAAAAQKQEAwAAACBATQME4wYAAACfAgICpAMBAAAAAECkBQMAAAAgQE0EBVsHAAAAnwMCAqQEAQAAAABApAYDAAAAIEBNBQb6CAAAAJ8EAgKkBQEAAAAAQKQHAwAAACBATQYHZAkAAACfBQIC4gYKADAABl4EAAAAMAEG1gUAAAAwAgbjBgAAADADBlsHAAAATQcEbgsAAAAwBwb6CAAAADAFBmQJAAAAggYCAAwDAQQAAABAAwIEAAAgQAMDAwQDBQMGAwcDCAUGBAUGBwgJAwkAAQABGAAAAAAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAACAQABAAEAAQABAAAAAQAAAQAAAAAA/8XoFG+/A6bNAYKAznYGm0oHapOxF3SGUzMfkqyKRiRB0lth5WSl1g==

-- Decompiled by Krnl

local v1 = require(script.Store)
local v2 = require(script.createReducer)
local v3 = require(script.combineReducers)
local v4 = require(script.makeActionCreator)
local v5 = require(script.loggerMiddleware)
local v6 = require(script.thunkMiddleware)
return {
	["Store"] = v1,
	["createReducer"] = v2,
	["combineReducers"] = v3,
	["makeActionCreator"] = v4,
	["loggerMiddleware"] = v5.middleware,
	["thunkMiddleware"] = v6
}
