-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMGFm1pc3NpbmcgaW52ZW50b3J5VmFsdWUGYXNzZXJ0EG1pc3NpbmcgaXRlbU5hbWUORmluZEZpcnN0Q2hpbGQWZG9lc0ludmVudG9yeVZhbHVlSGF2ZRVnZXRJbnZlbnRvcnlJdGVtVmFsdWUAAwYCAAAAABeBAQAFAAAAAFIDAABvBAAApAICAAAAEECfAgMBgQEBBQMAAABSAwEAbwQDAKQCAgAAABBAnwIDAVIFAQC8AwADBAAAAJ8DAwJHAwIAAAAAgKkCAAGpAgEAggICAAUDAQMCBAAAEEADAwMEAAMFARgAAAAAAAAAAQAAAAAAAAIAAAAAAAAAAAQAAAAABQIAAAAAE4EBAAUAAAAAUgMAAG8EAACkAgIAAAAQQJ8CAwGBAQEFAwAAAFIDAQBvBAMApAICAAAAEECfAgMBUgQBALwCAAMEAAAAnwIDAIICAAAFAwEDAgQAABBAAwMDBAAJBgEYAAAAAAAAAAEAAAAAAAACAAAAAAoAAAAAAgAAAQIACqMAAAD/AAIAAAAAAMABAAAwAQDJAQAAAMABAgAwAQAAAwAAAIIAAgAEBgADBQYBAwYCAAEBAAEYAAEAAQAABgAABwEAAAAAAgr+rbKRtXFQODrHJlFbzvgeZLAxcavylAELmHYHPBF7qK/I13JfPqk=

-- Decompiled by Krnl

return {
	["doesInventoryValueHave"] = function(p1, p2)
		assert(p1, "missing inventoryValue")
		assert(p2, "missing itemName")
		return p1:FindFirstChild(p2) ~= nil
	end,
	["getInventoryItemValue"] = function(p3, p4)
		assert(p3, "missing inventoryValue")
		assert(p4, "missing itemName")
		return p3:FindFirstChild(p4)
	end
}
