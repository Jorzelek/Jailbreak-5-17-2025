-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBmFzc2VydAZzY3JpcHQORmluZEZpcnN0Q2hpbGQFcHJpbnQWTm8gY2F0ZWdvcnkgbW9kdWxlOiAlcwZmb3JtYXQFZXJyb3ISTm8gY2F0ZWdvcnkgbW9kdWxlB3JlcXVpcmURR2V0Q2F0ZWdvcnlCeU5hbWUNR2V0SXRlbUJ5TmFtZQhHZXRJdGVtcwVJdGVtcwROYW1lH05vIENhdGVnb3J5TmFtZS9JdGVtTmFtZTogJXMvJXMEd2FybgVwYWlycxNHZXRNYXBGcm9tU2VsZWN0aW9uC0dldENoaWxkcmVuAAQGAQIAAAoDAAEFAQMDAxMCJ7sBAANSAgAApAEBAAAAAECfAQIB+wIAAIcBAgArARwApAEDAAAAIEBSAwAAvAEBAwQAAACfAQMCKwEMAKQCBgAAAFBAbwMHAFIFAAC8AwONCAAAAJ8DAwCfAgABpAIKAAAAkEBvAwsAnwICAfsCAQCkAw0AAADAQFIEAQCfAwICagMCAPsCAACpAwEAagMCAPsCAQCHAQIAggECAA4DAQQAAABAAwIEAAAgQAMDAwQEAABQQAMFAwYDBwQAAJBAAwgDCQQAAMBAAAgKARgAAAAAAAEAAAEAAAAAAAEBAAAAAAAAAAEAAAACAAAAAAABAAACAAAJAAAAAAoCAQAABwAAAQMDNAI9uwEAA1IDAACkAgEAAAAAQJ8CAgG7AQEDUgMBAKQCAQAAAABAnwICAfsCAABSAwAAnwICAg4CIwCeAQIFAAAAAFIEAgBSBQAApAMBAAAAAECfAwMBTQMCoQIAAAAOAwUATQMCoQIAAABSBAEAnwMCAIIDAABNBALmAwAAAA4EBABNAwLmAwAAAJ8DAQJlAAIATQMCOAQAAABSBAMAxgUAAMYGAABkBAUATQkIugUAAACaCQIAAQAAAIIIAgBuBPr/AgAAAG8DBgBSBQAAUgYBALwDA40HAAAAnwMEAqQECQAAAIBAUgUDAJ8EAgHGBAAAggQCAAoDAQQAAABAAwsDDAMNAw4DDwMGAxAEAACAQAAVCwEYAAAAAAABAAAAAAEAAAMBAAAAAAAAAgAAAQAAAAACAAAAAAAAAAABAAAAAQAAAAH+AAcAAAAAAAIAAAABABYAAAAACgEBAAAAFLsBAANSAgAApAEBAAAAAECfAQIB/wEAAAAAAACkAgMAAAAgQFIDAACfAgIEFwIFAPsHAABSCAUAUgkGAJ8HAwJqBwEFbgL6/wIAAACCAQIABAMBBAAAAEADEQQAACBAADASARgAAAAAAAEAAQAAAAABAAAAAf4ABDEAAAAACQAAAQAAIKMAAAD/AAAAAAAAAP8BAAAAAAAApAIBAAAAAEC8AgJoAgAAAJ8CAgRkAgQATQcGugMAAACpCAAAaggBB24C+/8CAAAAwAIEABIAAQASAAAAwAMFABIAAgDABAYAEgADAOIFCgAwAgUGBwAAADADBaEIAAAAMAQFbgkAAACCBQIACwMCBAAAAEADEwMOBgAGAQYCAwoDCwMSBQMHCAkDAAECAQABGAABAAIAAQAAAAAAAQAAAP8AAwAADQAbAAoBAAEAAQAAAQAAAAADz70jx0PNtbP9eUlTRl9vdObshTr7isejDFd9EXX/wWuOvXR3MHscDw==

-- Decompiled by Krnl

local v_u_1 = {}
local v_u_2 = {}
for _, v3 in script:GetChildren() do
	v_u_1[v3.Name] = false
end
local function v_u_6(p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	assert(p4)
	if not v_u_1[p4] then
		local v5 = script:FindFirstChild(p4)
		if not v5 then
			print(("No category module: %s"):format(p4))
			error("No category module")
		end
		v_u_2[p4] = require(v5)
		v_u_1[p4] = true
	end
	return v_u_2[p4]
end
local function v_u_13(p7, p8)
	-- upvalues: (copy) v_u_6
	assert(p7)
	assert(p8)
	local v9 = v_u_6(p7)
	if v9 then
		assert(v9, p7)
		if v9.GetItemByName then
			return v9.GetItemByName(p8)
		end
		local v10
		if v9.GetItems then
			v10 = v9.GetItems()
		else
			v10 = v9.Items
		end
		for _, v11 in v10 do
			if v11.Name == p8 then
				return v11
			end
		end
	end
	local v12 = ("No CategoryName/ItemName: %s/%s"):format(p7, p8)
	warn(v12)
	return nil
end
return {
	["GetCategoryByName"] = v_u_6,
	["GetItemByName"] = v_u_13,
	["GetMapFromSelection"] = function(p14)
		-- upvalues: (copy) v_u_13
		assert(p14)
		local v15 = {}
		for v16, v17 in pairs(p14) do
			v15[v16] = v_u_13(v16, v17)
		end
		return v15
	end
}
