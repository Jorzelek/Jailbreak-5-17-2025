-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWBW5hbWVkA2ZvbwZleHBlY3QCdG8CYmUBYQh1c2VyZGF0YQh0b3N0cmluZwRmaW5kAm9rA2FiYwVuZXZlcgVlcXVhbAJpdBxzaG91bGQgZ2l2ZSBhbiBvcGFxdWUgb2JqZWN0H3Nob3VsZCBjb2VyY2UgdG8gdGhlIGdpdmVuIG5hbWUhc2hvdWxkIGJlIHVuaXF1ZSB3aGVuIGNvbnN0cnVjdGVkB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTeW1ib2wIZGVzY3JpYmUABgYAAQAAABL7AQAATQABUQAAAABvAQEAnwACAqQEAwAAACBAUgUAAJ8EAgJNAwSSBAAAAE0CA8wFAAAATQECgAYAAABvAgcAnwECAYIAAQAIAwEDAgMDBAAAIEADBAMFAwYDBwAFAAEYAAAAAAACAAAAAAAAAAAAAAABBgAAAAAIAAEAAAcAAAEDBQ0CGfsBAABNAAFRAAAAAG8BAQCfAAICpAQDAAAAIEC7PwADUgYAAKQFBQAAAEBAnwUCAm8HAQC8BQVWBgAAAJ8FAwCfBAACTQMEkgcAAABNAgPMCAAAAE0BAhAJAAAAnwEBAYIAAQAKAwEDAgMDBAAAIEADCAQAAEBAAwkDBAMFAwoACwABGAAAAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAEMAAAAAAcAAQAAABf7AQAATQABUQAAAABvAQEAnwACAvsCAABNAQJRAAAAAG8CAQCfAQICpAUDAAAAIEBSBgAAnwUCAk0EBTUEAAAATQMEkgUAAABNAgN7BgAAAFIDAQCfAgIBggABAAcDAQMLAwMEAAAgQAMMAwQDDQARAAEYAAAAAAABAAAAAAIAAAAAAAAAAAAAAAESAAAAAAMAAQAAABOkAAEAAAAAQG8BAgDZAgAAEgIAAJ8AAwGkAAEAAAAAQG8BAwDZAgEAEgIAAJ8AAwGkAAEAAAAAQG8BBADZAgIAEgIAAJ8AAwGCAAEABQMOBAAAAEADDwMQAxEDAAECBAABGAAAAAAAAAYAAAAAAAYAAAAAAAYFAAAAAAQAAAAAABCkAAEAAAAAQKQDAwAAACBATQIDJAQAAABNAQKTBQAAAJ8AAgKkAQcAAABgQG8CCADZAwAAEgAAAJ8BAwGCAAEACQMSBAAAAEADEwQAACBAAxQDFQMWBAAAYEADAQEDAQABGAAAAAAAAAAAAAIAAAAAABQCAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgQBBAEAARgAAAABAAAAAAVMGfN4YKn+KX7dmexg+DSeKJioLk/pMeMCUf/MeJ3pCsrZPkaSCsxQ

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent.Symbol)
	describe("named", function()
		-- upvalues: (copy) v_u_1
		it("should give an opaque object", function()
			-- upvalues: (ref) v_u_1
			local v2 = v_u_1.named("foo")
			expect(v2).to.be.a("userdata")
		end)
		it("should coerce to the given name", function()
			-- upvalues: (ref) v_u_1
			local v3 = v_u_1.named("foo")
			expect(tostring(v3):find("foo")).to.be.ok()
		end)
		it("should be unique when constructed", function()
			-- upvalues: (ref) v_u_1
			local v4 = v_u_1.named("abc")
			local v5 = v_u_1.named("abc")
			expect(v4).never.to.equal(v5)
		end)
	end)
end
