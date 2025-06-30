-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMfBHdhcm4jRHJpZnQgSXRlbSBub3QgZm91bmQsIHVzaW5nIGRlZmF1bHQETmFtZQdDbGFzc2ljBU1vZGVsCFJlc291cmNlDkRyaWZ0UGFydGljbGVzDkZpbmRGaXJzdENoaWxkD1BhcnRpY2xlRW1pdHRlchVGaW5kRmlyc3RDaGlsZE9mQ2xhc3MGUHJlc2V0C0dldENoaWxkcmVuBURyaWZ0BXRhYmxlBmluc2VydAdEZXN0cm95BUNsb25lB0VuYWJsZWQERW51bQhOb3JtYWxJZARCYWNrEUVtaXNzaW9uRGlyZWN0aW9uCUlzRWRpdGluZwRSYXRlC051bWJlclJhbmdlA25ldwVTcGVlZAZQYXJlbnQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlAAIRBAEAAABhKwAJAKQEAQAAAABAbwUCAJ8EAgHiBAQAbwUFADAFBLoDAAAAUgAEAE0EATsGAAAA+wYAAE0FBmIHAAAAbwcIALwFBQMJAAAAnwUDAk0HALoDAAAAvAUFAwkAAACfBQMCbwgKALwGBbgLAAAAnwYDAv8HAAAAAAAAbwoMALwIBAMJAAAAnwgDArwICGgNAAAAnwgCBGQICwBNDQy6AwAAAPANCAAOAACAnjQHBQwAAABSDgcAUg8MAKQNEQAAQPCAnw0DAW4I9P8CAAAAUggHAMYJAADGCgAAZAgnAG8PCgC8DQy4CwAAAJ8NAwIODQMAvA4NUBIAAACfDgIBvA4GOhMAAACfDgICbw8KADAPDroDAAAAqQ8AADAPDvAUAAAApA8YABdYUMEwDw74GQAAAA4DDwBNDwMAGgAAAA4PDACMDyQAMA8O9hsAAACkDx4AAHTAgYwQDwCfDwICMA8OLB8AAACpDwEAMA8O8BQAAAAwDA4kIAAAAG4I2P8CAAAAggABACEDAQQAAABAAwIDAwUBAwMEAwUDBgMHAwgDCQMKAwsDDAMNAw4DDwQAQPCAAxADEQMSAxMDFAMVBBdYUMEDFgMXAxgDGQMaBAB0wIEDGwMcAAQAARgAAQAAAAEBAAAAAwACAAAAAAAAAAAAAAABAAAABAABAAAAAAAAAAEAAAABAAAAAAAA/gAFAAAAAQAAAAEBAAACAAABAAABAAABAAAAAQAAAAEAAAEAAAAAAAEAAAIA8gAQBQAAAAADAAABAgAKowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAsABBAASAAAAggECAAUDHQQAAABAAx4DHwYAAQABAAEYAAEAAAAAAAIAAAEAAAAAAf77fsijtLhtzD8UXPOxWMc477VP1UwG4nUgk6EFgmS3fuwdhJGvDqk=

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
return function(p2, p3, _, p4)
	-- upvalues: (copy) v_u_1
	if not p2 then
		warn("Drift Item not found, using default")
		p2 = {
			["Name"] = "Classic"
		}
	end
	local v5 = p3.Model
	local v6 = v_u_1.Resource:FindFirstChild("DriftParticles"):FindFirstChild(p2.Name):FindFirstChildOfClass("ParticleEmitter")
	local v7 = {}
	for _, v8 in v5:FindFirstChild("Preset"):GetChildren() do
		if v8.Name == "Drift" then
			table.insert(v7, v8)
		end
	end
	for _, v9 in v7 do
		local v10 = v9:FindFirstChildOfClass("ParticleEmitter")
		if v10 then
			v10:Destroy()
		end
		local v11 = v6:Clone()
		v11.Name = "ParticleEmitter"
		v11.Enabled = false
		v11.EmissionDirection = Enum.NormalId.Back
		if p4 and p4.IsEditing then
			v11.Rate = 36
			v11.Speed = NumberRange.new(15)
			v11.Enabled = true
		end
		v11.Parent = v9
	end
end
