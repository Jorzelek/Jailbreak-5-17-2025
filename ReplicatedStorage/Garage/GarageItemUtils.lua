-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPIHRyYW5zbGF0ZVRvSXRlbU93bmVkQ2F0ZWdvcnlOYW1lI2NyZWF0ZVZlaGljbGVDdXN0b21pemF0aW9uSXRlbVRhYmxlIGdldFZlaGljbGVDdXN0b21pemF0aW9uSXRlbU93bmVkFENPTE9SX0NBVEVHT1JZX1RZUEVTBUNvbG9yFlRFWFRVUkVfQ0FURUdPUllfVFlQRVMHVGV4dHVyZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNBcHAJSXRlbVV0aWxzCU93bmVyc2hpcA9Pd25lcnNoaXBDb25zdHMAAwYCAgAAAAz7AwAATQIDDgAAAABSAwAAnwICAvsEAQBNAwSuAQAAAFIEAgBSBQEAnwMDAIIDAAACAwEDAgAHAwEYAAAAAAABAAAAAAAACAAAAAAEAQEAAAAP+wMAAE0CAzYAAAAAhwECAA4BAgBvAQEAggECAPsDAABNAgMJAgAAAIcBAgAOAQIAbwEDAIIBAgCCAAIABAMEAwUDBgMHAAsBARgAAAAAAAEAAgAAAAABAAIMAAAAAAUAAAECACGjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwDBBgAAAE0CAy4HAAAAnwECAqQCBQAAAEBATQQAkAgAAABNAwSsCQAAAJ8CAgL/AwIAAAAAAMAECgASAAMAEgABADAEA+0LAAAAwAQMABIAAgAwBAMODQAAAIIDAgAOAwgEAAAAQAMJAwoDCwQAAEBAAwwDDQMOAw8GAAMDBgEDAQIAAQEAARgAAQAAAAAAAQAAAAAAAAEAAAAAAAACAAEAAAAABAAAAAoBAAAAAAIIrfH6a9urtDppm27cvUl9/Y+99rAO6NGFkF8HITn2OSwJvkcKAb+W

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.App.ItemUtils)
local v_u_3 = require(v1.Ownership.OwnershipConsts)
local v_u_8 = {
	["getVehicleCustomizationItemOwned"] = function(p4, p5)
		-- upvalues: (copy) v_u_8, (copy) v_u_2
		local v6 = v_u_8.translateToItemOwnedCategoryName(p4)
		return v_u_2.createVehicleCustomizationItemTable(v6, p5)
	end,
	["translateToItemOwnedCategoryName"] = function(p7)
		-- upvalues: (copy) v_u_3
		return v_u_3.COLOR_CATEGORY_TYPES[p7] and "Color" or (v_u_3.TEXTURE_CATEGORY_TYPES[p7] and "Texture" or p7)
	end
}
return v_u_8
