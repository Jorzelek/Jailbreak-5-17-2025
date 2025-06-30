-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLBXRhYmxlBWNsb25lB3Zpc2libGUMY291bnRkb3duVGlsE3NldExpa2VQcm9tcHRDb25maWcEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgACBAIAAAAADaQCAgAABACAUgMAAJ8CAgJNAwGgAwAAADADAqADAAAATQMB8wQAAAAwAwLzBAAAAIICAgAFAwEDAgQABACAAwMDBAAJBQEYAAAAAAEAAAABAAAAAQoAAAAABgAAAQIAG6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAA4gMKAKkEAAAwBAOgCAAAAIwEAAAwBAPzCQAAAOIEDADABQ0AMAUERgsAAACfAgMAggIAAA4DBgQAAABAAwcDCAMJBAAAQEADCgMLAwMDBAUCCAkDBQUBCwYAAQABAAEYAAEAAAAAAAEAAAAAAgAAAQAAAQAAAQEAAPwAAQAAAAABoAFvavGwma6SxQX+WbYeLi1xJYedlGoif8OgbvWsy+sdFb0iG7zx3A==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({
	["visible"] = false,
	["countdownTil"] = 0
}, {
	["setLikePromptConfig"] = function(p2, p3)
		local v4 = table.clone(p2)
		v4.visible = p3.visible
		v4.countdownTil = p3.countdownTil
		return v4
	end
})
