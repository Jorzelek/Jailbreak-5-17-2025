-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPEG1pc3NpbmcgcG9zaXRpb24GYXNzZXJ0CU1hZ25pdHVkZRxkaXJlY3Rpb24gaXMgbm90IHVuaXQgbGVuZ3RoFmxlbmd0aCBpcyBub3Qgbm9uIHplcm8NUmF5Y2FzdFBhcmFtcwNuZXcaRmlsdGVyRGVzY2VuZGFudHNJbnN0YW5jZXMJd29ya3NwYWNlB1JheWNhc3QISW5zdGFuY2UKQ2FuQ29sbGlkZQV0YWJsZQZpbnNlcnQKY29sbGlkYWJsZQACDQUAAAAKBwAABQUICAKHhVSBAQAFAAAAAFIGAABvBwAApAUCAAAAEECfBQMBTQgBqgQAAAB4BwgDbwgFANQHAgAIAAAAqQYAAakGAQCBAQYEBgAAAG8HBgCkBQIAAAAQQJ8FAwGMBwAAtwcCAAIAAACpBgABqQYBAIEBBgQHAAAAbwcHAKQFAgAAABBAnwUDASsDBACkBQoAACSAgJ8FAQJSAwUAKwMBAIIAAQBNBQN9CwAAAIwGAADGBwAAbwgFAH0IJgACAAAAjAgKAH0GIwAIAAAApAgNAAAAwEBSCgAACQsBAlIMAwC8CAjCDgAAAJ8IBQJSBwgADgcYAA4EBQBSCAQATQkH9A8AAACfCAICKwgSACsEBQBNCQf0DwAAAE0ICdMQAAAAKwgMAE0KB/QPAAAAnjQFBAoAAABSCQUApAgTAABIEIGfCAMBMAUDfQsAAACVBgYDSADY/4IHAgAUAwEDAgQAABBAAgAAAAAAAPA/AwMC/Knx0k1iUD8DBAMFAwYDBwQAJICAAwgDCQQAAMBAAwoDCwMMAw0DDgQASBCBAAQPARgAAAAAAAAAAQAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAIBAAAAAwECAAIBAQAAAAAAAQAAAAAAAAAAAQMBAAAAAAABAAAAAAkAAAAAAAAABAAB6xcLAAAAAAIAAAECAAejAAAA/wABAAAAAADAAQAAMAEAmgEAAACCAAIAAgYAAw8BAAEAARgAAQACAAAvAQAAAAAB+J0z0dxusITKWVlFjfVrKoenNl+kMo/Jsgm3f6DJ36jIQ6OTD1bTkA==

-- Decompiled by Krnl

return {
	["collidable"] = function(p1, p2, p3, p4, p5)
		assert(p1, "missing position")
		local v6 = p2.Magnitude - 1 <= 0.001
		assert(v6, "direction is not unit length")
		local v7 = p3 > 0
		assert(v7, "length is not non zero")
		local v8 = p4 or RaycastParams.new()
		if not v8 then
			return
		end
		local v9 = v8.FilterDescendantsInstances
		local v10 = 0
		local v11 = nil
		while p3 >= 0.001 and v10 <= 10 do
			v11 = workspace:Raycast(p1, p2 * p3, v8)
			if not v11 or p5 and p5(v11.Instance) or not p5 and v11.Instance.CanCollide then
				break
			end
			local v12 = v11.Instance
			table.insert(v9, v12)
			v8.FilterDescendantsInstances = v9
			v10 = v10 + 1
		end
		return v11
	end
}
