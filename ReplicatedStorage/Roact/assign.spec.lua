-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSBmV4cGVjdAJ0bwVlcXVhbAFhAWIBYwNmb28DYmFyB3JlcXVpcmUGc2NyaXB0BlBhcmVudAROb25lBmFzc2lnbgJpdCRzaG91bGQgYWNjZXB0IHplcm8gYWRkaXRpb25hbCB0YWJsZXM4c2hvdWxkIG1lcmdlIG11bHRpcGxlIHRhYmxlcyBvbnRvIHRoZSBnaXZlbiB0YXJnZXQgdGFibGUnc2hvdWxkIHJlbW92ZSBrZXlzIGlmIHNwZWNpZmllZCBhcyBOb25lKnNob3VsZCByZS1hZGQga2V5cyBpZiBzcGVjaWZpZWQgYWZ0ZXIgTm9uZQAGBgABAAAAEP8AAAAAAAAA+wEAAFICAACfAQICpAQBAAAAAEBSBQAAnwQCAk0DBJICAAAATQIDewMAAABSAwEAnwICAYIAAQAEAwEEAAAAQAMCAwMABgABGAAAAQAAAgAAAAAAAAAAAAEHAAAAAAcAAQAAADviAAIAjAEFADABAIAAAAAAjAEGADABAIMBAAAA4gEEAIwCBwAwAgGDAQAAAIwCCAAwAgGCAwAAAOICBQCMAwgAMAMCgwEAAAD7AwAAUgQAAFIFAQBSBgIAnwMEAaQFBwAAAGBATQYAgAAAAACfBQICTQQFkggAAABNAwR7CQAAAIwEBQCfAwIBpAUHAAAAYEBNBgCDAQAAAJ8FAgJNBAWSCAAAAE0DBHsJAAAATQQCgwEAAACfAwIBpAUHAAAAYEBNBgCCAwAAAJ8FAgJNBAWSCAAAAE0DBHsJAAAATQQBggMAAACfAwIBggABAAoDBAMFBQIAAQMGBQIBAwUBAQMBBAAAYEADAgMDAA0AARgAAQAAAQAAAwEAAAEAAAMBAAADAAAAAAIAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAQ4AAAAABgACAAAAJuIAAgCMAQIAMAEADwAAAACMAQMAMAEAHwEAAADiAQMA+wIAADACAQ8AAAAA+wIBAFIDAABSBAEAnwIDAaQEBQAAAEBATQUADwAAAACfBAICTQMEkgYAAABNAgN7BwAAAMYDAACfAgIBpAQFAAAAQEBNBQAfAQAAAJ8EAgJNAwSSBgAAAE0CA3sHAAAAjAMDAJ8CAgGCAAEACAMHAwgFAgABBQEAAwEEAABAQAMCAwMAIwABGAABAAABAAADAQAAAwAAAAIAAAAAAAAAAAAAAQAAAAAAAAAAAAABJAAAAAAHAAIAAAAe4gABAIwBAgAwAQAPAAAAAOIBAQD7AgAAMAIBDwAAAADiAgEAjAMDADADAg8AAAAA+wMBAFIEAABSBQEAUgYCAJ8DBAGkBQMAAAAgQE0GAA8AAAAAnwUCAk0EBZIEAAAATQMEewUAAABNBAIPAAAAAJ8DAgGCAAEABgMHBQEAAwEEAAAgQAMCAwMAMwABGAABAAADAQAAAwEAAAMAAAAAAgAAAAAAAAAAAAAAATQAAAAABQAAAAAALaQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAj8FAAAAnwACAqQBAQAAAABApAQDAAAAIEBNAwQkBAAAAE0CA+MGAAAAnwECAqQCCAAAAHBAbwMJANkEAAASAAEAnwIDAaQCCAAAAHBAbwMKANkEAQASAAEAnwIDAaQCCAAAAHBAbwMLANkEAgASAAAAEgABAJ8CAwGkAggAAABwQG8DDADZBAMAEgAAABIAAQCfAgMBggABAA0DCQQAAABAAwoEAAAgQAMLAwwDDQMOBAAAcEADDwMQAxEDEgQAAQIDAQABGAAAAAAAAAAAAAIAAAAAAAAAAAIAAAAAAAcAAAAAABYAAAAAAAAQAAAAAAAAEQIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGBAEEAQABGAAAAAEAAAAABby+cnOxZwU1jnoY5+hcTkD8QIxab4iF5JcabylvaFx/ptInxrUygQs=

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent.None)
	local v_u_2 = require(script.Parent.assign)
	it("should accept zero additional tables", function()
		-- upvalues: (copy) v_u_2
		local v3 = {}
		local v4 = v_u_2(v3)
		expect(v3).to.equal(v4)
	end)
	it("should merge multiple tables onto the given target table", function()
		-- upvalues: (copy) v_u_2
		local v5 = {
			["a"] = 5,
			["b"] = 6
		}
		local v6 = {
			["b"] = 7,
			["c"] = 8
		}
		local v7 = {
			["b"] = 8
		}
		v_u_2(v5, v6, v7)
		expect(v5.a).to.equal(5)
		expect(v5.b).to.equal(v7.b)
		expect(v5.c).to.equal(v6.c)
	end)
	it("should remove keys if specified as None", function()
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v8 = {
			["foo"] = 2,
			["bar"] = 3
		}
		v_u_2(v8, {
			["foo"] = v_u_1
		})
		expect(v8.foo).to.equal(nil)
		expect(v8.bar).to.equal(3)
	end)
	it("should re-add keys if specified after None", function()
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v9 = {
			["foo"] = 2
		}
		local v10 = {
			["foo"] = 3
		}
		v_u_2(v9, {
			["foo"] = v_u_1
		}, v10)
		expect(v9.foo).to.equal(v10.foo)
	end)
end
