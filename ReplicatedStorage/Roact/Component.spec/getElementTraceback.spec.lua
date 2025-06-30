-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcE2dldEVsZW1lbnRUcmFjZWJhY2sEaW5pdAZyZW5kZXIQbW91bnRWaXJ0dWFsTm9kZQhTb21lIGtleQ1UZXN0Q29tcG9uZW50BmV4dGVuZA5lbGVtZW50VHJhY2luZwZzY29wZWQGZXhwZWN0AnRvAmJlAWEGc3RyaW5nBWVxdWFsB3JlcXVpcmUGc2NyaXB0BlBhcmVudA1jcmVhdGVFbGVtZW50EGNyZWF0ZVJlY29uY2lsZXIMR2xvYmFsQ29uZmlnDE5vb3BSZW5kZXJlcglDb21wb25lbnQCaXQtc2hvdWxkIHJldHVybiBzdGFjayB0cmFjZXMgaW4gaW5pdGlhbCByZW5kZXJzBml0U0tJUDdpdCBzaG91bGQgcmV0dXJuIGFuIHVwZGF0ZWQgc3RhY2sgdHJhY2UgYWZ0ZXIgYW4gdXBkYXRlLHNob3VsZCByZXR1cm4gbmlsIHdoZW4gZWxlbWVudFRyYWNpbmcgaXMgb2ZmAAsDAQEAAAAFvAEAKQAAAACfAQIC3gEAAIIAAQABAwEADwIBGAAAAAABEAAAAAACAQAAAAACxgEAAIIBAgAAABMDARgAABQAAAAABQADAAAAC/sAAAD7AQEAnwACAvsCAgBNAQK+AAAAAFICAADGAwAAbwQBAJ8BBAGCAAEAAgMEAwUAGwABGAAAAAQAAAAAAAABHAAAAAAIAAQAAAAo+wAAAG8CAAC8AACcAQAAAJ8AAwLGAQAA2QIAABIBAf8wAgATAgAAAMACAwAwAgCABAAAAOICBgCpAwEAMAMC+QUAAAD7BAEATQMEHQcAAABSBAIA2QUCABICAgASAAAAEgIDAJ8DAwGkBgkAAACAQFIHAQCfBgICTQUGkgoAAABNBAXMCwAAAE0DBIAMAAAAbwQNAJ8DAgHBAQAAggABAA4DBgMHAwIGAQMDAwgFAQUDCQMKBAAAgEADCwMMAw0DDgMAAQILAAEYAAAAAAACAQAAAAQAAAQBAAADAAAAAAAAAAAIAAAAAAAAAAAAAAABAAwAAAAAAAAAAAAAAYIAAQAAACYAARgAJgAAAAADAQEAAAAFvAEAKQAAAACfAQIC3gEAAIIAAQABAwEAMQIBGAAAAAABMgAAAAACAQAAAAACxgEAAIIBAgAAADUDARgAADYAAAAABQADAAAAC/sAAAD7AQEAnwACAvsCAgBNAQK+AAAAAFICAADGAwAAbwQBAJ8BBAGCAAEAAgMEAwUAOQABGAAAAAQAAAAAAAABOgAAAAAHAAQAAAAmxgAAAOIBAQCpAgAAMAIB+QAAAAD7AgAAbwQCALwCApwDAAAAnwIDAtkDAAASAQD/MAMCEwQAAADAAwUAMAMCgAYAAAD7BAEATQMEHQcAAABSBAEA2QUCABICAgASAAIAEgIDAJ8DAwGkBQkAAACAQFIGAACfBQICTQQFkgoAAABNAwR7CwAAAMYEAACfAwIBwQAAAIIAAQAMAwgFAQADBgMHAwIGBgMDAwkDCgQAAIBAAwsDDwMFBgcoAAEYAAIBAAADAAAAAAIAAAAEAAAEAAAAAAAAAAAIAAAAAAAAAAAAAQApAAAAAAkAAAAAAFKkAAEAAAAAQKQEAwAAACBATQMEJAQAAABNAgMkBAAAAE0BAsoFAAAAnwACAqQBAQAAAABApAUDAAAAIEBNBAUkBAAAAE0DBCQEAAAATQIDiwYAAACfAQICpAIBAAAAAECkBgMAAAAgQE0FBiQEAAAATQQFJAQAAABNAwSMBwAAAJ8CAgKkAwEAAAAAQKQHAwAAACBATQYHJAQAAABNBQYkBAAAAE0EBWoIAAAAnwMCAqQEAQAAAABApAgDAAAAIEBNBwgkBAAAAE0GByQEAAAATQUGiAkAAACfBAICUgUBAFIGAwCfBQICpAYLAAAAoEBvBwwA2QgAABIABAASAAIAEgAAABIABQCfBgMBpAYOAAAA0EBvBw8AwAgQAJ8GAwGkBgsAAACgQG8HEQDZCAIAEgAEABIAAgASAAAAEgAFAJ8GAwGCAAEAEgMQBAAAAEADEQQAACBAAxIDEwMUAxUDFgMXAxgEAACgQAMZAxoEAADQQAMbBgQDHAMDBAgBAAEYAAAAAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAACAAAAAAAAAAAAAAIAAAIAAAAAAAAAABsAAAAAAgAAAAAAAAAAGwIAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGCQEJAQABGAAAAAEAAAAACsvPy+V+Cvr4+QuhcQskiKxz+2taDqrbbOcI9LkurotELI5FO7AW2vI=

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent.Parent.createElement)
	local v2 = require(script.Parent.Parent.createReconciler)
	local v_u_3 = require(script.Parent.Parent.GlobalConfig)
	local v4 = require(script.Parent.Parent.NoopRenderer)
	local v_u_5 = require(script.Parent.Parent.Component)
	local v_u_6 = v2(v4)
	it("should return stack traces in initial renders", function()
		-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_1, (copy) v_u_6
		local v_u_7 = v_u_5:extend("TestComponent")
		local v_u_8 = nil
		function v_u_7.init(p9)
			-- upvalues: (ref) v_u_8
			v_u_8 = p9:getElementTraceback()
		end
		function v_u_7.render(_)
			return nil
		end
		v_u_3.scoped({
			["elementTracing"] = true
		}, function()
			-- upvalues: (ref) v_u_1, (copy) v_u_7, (ref) v_u_6
			local v10 = v_u_1(v_u_7)
			v_u_6.mountVirtualNode(v10, nil, "Some key")
		end)
		expect(v_u_8).to.be.a("string")
	end)
	itSKIP("it should return an updated stack trace after an update", function() end)
	it("should return nil when elementTracing is off", function()
		-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_1, (copy) v_u_6
		local v_u_11 = nil
		local v_u_12 = v_u_5:extend("TestComponent")
		function v_u_12.init(p13)
			-- upvalues: (ref) v_u_11
			v_u_11 = p13:getElementTraceback()
		end
		function v_u_12.render(_)
			return nil
		end
		v_u_3.scoped({
			["elementTracing"] = false
		}, function()
			-- upvalues: (ref) v_u_1, (copy) v_u_12, (ref) v_u_6
			local v14 = v_u_1(v_u_12)
			v_u_6.mountVirtualNode(v14, nil, "Some key")
		end)
		expect(v_u_11).to.equal(nil)
	end)
end
