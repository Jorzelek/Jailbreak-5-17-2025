-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYBENtZHIEVXRpbA9NYWtlRnV6enlGaW5kZXIORGljdGlvbmFyeUtleXMJdmFyc191c2VkCEdldFN0b3JlDEF1dG9jb21wbGV0ZQZpcGFpcnMFbWF0Y2hXS2V5IG5hbWVzIG11c3Qgc3RhcnQgd2l0aCBhbiBvcHRpb25hbCBtb2RpZmllcjogLiAkIG9yICQuIGFuZCBtdXN0IGJlZ2luIHdpdGggYSBsZXR0ZXIuCFZhbGlkYXRlBVBhcnNlCXN0b3JlZEtleQxSZWdpc3RlclR5cGUKc3RvcmVkS2V5cxBNYWtlTGlzdGFibGVUeXBlB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTaGFyZWQKXiVhWyV3X10qJAxeJSQlYVsld19dKiQMXiUuJWFbJXdfXSokDl4lJCUuJWFbJXdfXSokAAUGAQEAAAAc+wQAAE0DBJ4AAAAATQIDngEAAABNAQI9AgAAAPsFAABNBAWeAAAAAE0DBJ4BAAAATQID4wMAAAD7AwAAbwUEALwDA1UFAAAAnwMDAisDAgD/AwAAAAAAAJ8CAgCfAQACUgIBAFIDAACfAgIAggIAAAYDAQMCAwMDBAMFAwYADAcBGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAAAANAAAAAAkBAQAAABGkAQEAAAAAQPsCAACfAQIEUQEHAFIIBQC8BgDnAgAAAJ8GAwIOBgIAqQYBAIIGAgBuAfj/AgAAgKkBAABvAgMAggEDAAQDCAQAAABAAwkDCgASCwEYAAAAAAABAAAAAAEA/gAGAAATAAAAAAEBAAAAAAGCAAIAAAAcDAEYAB0AAAAABwECAAAAG+IBAwDZAgAAEgAAADACAasAAAAAwAIEABICAAAwAgF2AQAAAMACBQAwAgGbAgAAAG8EBgBSBQEAvAIA3QcAAACfAgQBbwQIAPsGAQBNBQYkCQAAAFIGAQCfBQIAvAIA3QcAAACfAgABggABAAoDBwMLAwwFAwABAgYBBgIDDQMOAw8DEAMAAQIKAAEYAAEAAAAGAAAACgAABAAAAAABAAAAAAAAAAABCwAAAAAGAAABAgAaowAAAKQAAQAAAABApAUDAAAAIEBNBAUkBAAAAE0DBCQEAAAATQIDEgUAAABNAQKeBgAAAJ8AAgL/AQAABAAAAG8CBwBvAwgAbwQJAG8FCgDFAQIFAQAAAMACCwASAAEAEgAAAIICAgAMAxEEAAAAQAMSBAAAIEADEwMUAwIDFQMWAxcDGAYDAQMBAAEYAAAAAAAAAAAAAAAAAAACAAEBAQEAAAMAAAABAAAAAASy/b6OMQH4y4A51BoiOx73XyAkc6pSPM1VAkYy1tiCRiseuQx80kRV

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_2 = {
	"^%a[%w_]*$",
	"^%$%a[%w_]*$",
	"^%.%a[%w_]*$",
	"^%$%.%a[%w_]*$"
}
return function(p_u_3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v8 = {
		["Autocomplete"] = function(p4)
			-- upvalues: (copy) p_u_3
			return p_u_3.Cmdr.Util.MakeFuzzyFinder(p_u_3.Cmdr.Util.DictionaryKeys(p_u_3:GetStore("vars_used") or {}))(p4)
		end,
		["Validate"] = function(p5)
			-- upvalues: (ref) v_u_2
			for _, v6 in ipairs(v_u_2) do
				if p5:match(v6) then
					return true
				end
			end
			return false, "Key names must start with an optional modifier: . $ or $. and must begin with a letter."
		end,
		["Parse"] = function(p7)
			return p7
		end
	}
	p_u_3:RegisterType("storedKey", v8)
	p_u_3:RegisterType("storedKeys", v_u_1.MakeListableType(v8))
end
