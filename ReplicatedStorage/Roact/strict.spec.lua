-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNAWMBYQFiBmV4cGVjdAJ0bwV0aHJvdwdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGc3RyaWN0Aml0K3Nob3VsZCBlcnJvciB3aGVuIGdldHRpbmcgYSBub25leGlzdGVudCBrZXkrc2hvdWxkIGVycm9yIHdoZW4gc2V0dGluZyBhIG5vbmV4aXN0ZW50IGtleQAGAgABAAAABPsBAABNAAGCAAAAAIIAAgABAwEACgABGAAAAAALAAAAAAUAAQAAABT7AAAA4gECAIwCAQAwAgGAAAAAAIwCAgAwAgGDAQAAAJ8AAgKkAwQAAAAwQNkEAAASAAAAnwMCAk0CA5IFAAAATQEC2wYAAACfAQEBggABAAcDAgMDBQIAAQMEBAAAMEADBQMGAQAEAAEYAAABAAABAAD+BQAAAAACAAAAAAEFAAAAAAIAAQAAAAX7AAAAjAEDADABAIIAAAAAggABAAEDAQAVAAEYAAAAAAEWAAAAAAUAAQAAABT7AAAA4gECAIwCAQAwAgGAAAAAAIwCAgAwAgGDAQAAAJ8AAgKkAwQAAAAwQNkEAAASAAAAnwMCAk0CA5IFAAAATQEC2wYAAACfAQEBggABAAcDAgMDBQIAAQMEBAAAMEADBQMGAQIPAAEYAAABAAABAAD+BQAAAAACAAAAAAEQAAAAAAQAAAAAABakAAEAAAAAQKQDAwAAACBATQIDJAQAAABNAQKNBQAAAJ8AAgKkAQcAAABgQG8CCADZAwAAEgAAAJ8BAwGkAQcAAABgQG8CCQDZAwEAEgAAAJ8BAwGCAAEACgMHBAAAAEADCAQAACBAAwkDCgMLBAAAYEADDAMNAgEDAQABGAAAAAAAAAAAAAIAAAAAAAsAAAAAAAoCAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgQBBAEAARgAAAABAAAAAAVdgvUAhH7VhW9Gn5RWLNuYEg5b+LMwNruO8w0LECJjenqcjBgbom1y

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent.strict)
	it("should error when getting a nonexistent key", function()
		-- upvalues: (copy) v_u_1
		local v_u_2 = v_u_1({
			["a"] = 1,
			["b"] = 2
		})
		expect(function()
			-- upvalues: (copy) v_u_2
			return v_u_2.c
		end).to.throw()
	end)
	it("should error when setting a nonexistent key", function()
		-- upvalues: (copy) v_u_1
		local v_u_3 = v_u_1({
			["a"] = 1,
			["b"] = 2
		})
		expect(function()
			-- upvalues: (copy) v_u_3
			v_u_3.c = 3
		end).to.throw()
	end)
end
