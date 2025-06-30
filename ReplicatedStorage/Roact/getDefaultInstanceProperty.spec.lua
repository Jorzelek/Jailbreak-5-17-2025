-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUC1N0cmluZ1ZhbHVlBE5hbWUGZXhwZWN0AnRvBWVxdWFsBVZhbHVlAAhJbnRWYWx1ZQtPYmplY3RWYWx1ZQlCb29sVmFsdWUHcmVxdWlyZQZzY3JpcHQGUGFyZW50GmdldERlZmF1bHRJbnN0YW5jZVByb3BlcnR5Aml0JXNob3VsZCBnZXQgZGVmYXVsdCBuYW1lIHN0cmluZyB2YWx1ZXMmc2hvdWxkIGdldCBkZWZhdWx0IGVtcHR5IHN0cmluZyB2YWx1ZXMgc2hvdWxkIGdldCBkZWZhdWx0IG51bWJlciB2YWx1ZXMdc2hvdWxkIGdldCBuaWwgZGVmYXVsdCB2YWx1ZXMec2hvdWxkIGdldCBib29sIGRlZmF1bHQgdmFsdWVzAAcGAAEAAAAP+wAAAG8BAABvAgEAnwADA6QEAwAAACBAUgUBAJ8EAgJNAwSSBAAAAE0CA3sFAAAAbwMGAJ8CAgGCAAEABwMBAwIDAwQAACBAAwQDBQMGAAQAARgAAAAAAgAAAAAAAAAAAAEFAAAAAAYAAQAAAA/7AAAAbwEAAG8CAQCfAAMDpAQDAAAAIEBSBQEAnwQCAk0DBJIEAAAATQIDewUAAABvAwYAnwICAYIAAQAHAwEDBgMDBAAAIEADBAMFAwcACgABGAAAAAACAAAAAAAAAAAAAQsAAAAABgABAAAAD/sAAABvAQAAbwIBAJ8AAwOkBAMAAAAgQFIFAQCfBAICTQMEkgQAAABNAgN7BQAAAIwDAACfAgIBggABAAYDCAMGAwMEAAAgQAMEAwUAEAABGAAAAAACAAAAAAAAAAAAAREAAAAABgABAAAAD/sAAABvAQAAbwIBAJ8AAwOkBAMAAAAgQFIFAQCfBAICTQMEkgQAAABNAgN7BQAAAMYDAACfAgIBggABAAYDCQMGAwMEAAAgQAMEAwUAFgABGAAAAAACAAAAAAAAAAAAARcAAAAABgABAAAAD/sAAABvAQAAbwIBAJ8AAwOkBAMAAAAgQFIFAQCfBAICTQMEkgQAAABNAgN7BQAAAKkDAACfAgIBggABAAYDCgMGAwMEAAAgQAMEAwUAHAABGAAAAAACAAAAAAAAAAAAAR0AAAAABAAAAAAAKKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAqYFAAAAnwACAqQBBwAAAGBAbwIIANkDAAASAAAAnwEDAaQBBwAAAGBAbwIJANkDAQASAAAAnwEDAaQBBwAAAGBAbwIKANkDAgASAAAAnwEDAaQBBwAAAGBAbwILANkDAwASAAAAnwEDAaQBBwAAAGBAbwIMANkDBAASAAAAnwEDAYIAAQANAwsEAAAAQAMMBAAAIEADDQMOAw8EAABgQAMQAxEDEgMTAxQFAAECAwQBAAEYAAAAAAAAAAAAAgAAAAAABgAAAAAABgAAAAAABgAAAAAABgAAAAAABQIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGBQEFAQABGAAAAAEAAAAABukLMRJM03cc289bhv4e/xAlSjCBBIdB/ScPvFzHyNCzkbaB3m4kuRY=

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent.getDefaultInstanceProperty)
	it("should get default name string values", function()
		-- upvalues: (copy) v_u_1
		local _, v2 = v_u_1("StringValue", "Name")
		expect(v2).to.equal("Value")
	end)
	it("should get default empty string values", function()
		-- upvalues: (copy) v_u_1
		local _, v3 = v_u_1("StringValue", "Value")
		expect(v3).to.equal("")
	end)
	it("should get default number values", function()
		-- upvalues: (copy) v_u_1
		local _, v4 = v_u_1("IntValue", "Value")
		expect(v4).to.equal(0)
	end)
	it("should get nil default values", function()
		-- upvalues: (copy) v_u_1
		local _, v5 = v_u_1("ObjectValue", "Value")
		expect(v5).to.equal(nil)
	end)
	it("should get bool default values", function()
		-- upvalues: (copy) v_u_1
		local _, v6 = v_u_1("BoolValue", "Value")
		expect(v6).to.equal(false)
	end)
end
