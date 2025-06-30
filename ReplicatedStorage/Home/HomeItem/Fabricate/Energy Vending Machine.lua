-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKA25ldwxFbmVyZ3kgRHJpbmsFX21haWQIR2l2ZVRhc2sPX3ZlbmRpbmdNYWNoaW5lBXNldHVwB3JlcXVpcmUPX1ZlbmRpbmdNYWNoaW5lBnNjcmlwdAZQYXJlbnQAAgUBAQAAAA/7AgAATQEC7wAAAABSAgAAbwMBAJ8BAwJNAgDBAgAAAFIEAQC8AgL9AwAAAJ8CAwEwAQCDBAAAAIIAAQAFAwEDAgMDAwQDBQAFBgEYAAAAAAAAAQAAAAAAAQABBgAAAAAEAAABAgARowAAAKQAAQAAAABApAMEAAAAMEBNAgMkBQAAAE0BAvsCAAAAnwACAv8BAQAAAAAAwAIGABIAAAAwAgH5BwAAAIIBAgAIAwcEAAAAQAMIAwkEAAAwQAMKBgADBgEAAQABGAABAAAAAAAAAAACAAEAAAAFAQAAAAABugsi+POOPdSIz0hszuhFF/y+umZtiSntt34WyERp0Cfw52X/48za7g==

-- Decompiled by Krnl

local v_u_1 = require(script.Parent._VendingMachine)
return {
	["setup"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1.new(p2, "Energy Drink")
		p2._maid:GiveTask(v3)
		p2._vendingMachine = v3
	end
}
