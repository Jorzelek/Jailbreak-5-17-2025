-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNBWVycm9yI0F0dGVtcHQgdG8gbW9kaWZ5IHJlYWQtb25seSB0YWJsZTogBiwga2V5PQgsIHZhbHVlPQpfX25ld2luZGV4B19faW5kZXgLX19tZXRhdGFibGUMc2V0bWV0YXRhYmxlDXJlYWRvbmx5dGFibGUFZGVidWcEaW5mbwd3YXJuaW5nCGNyaXRpY2FsAAMLAwAAAAALpAMBAAAAAEBvBQIAUgYAAG8HAwBSCAEAbwkEAFIKAgBzBAUKnwMCAYIAAQAFAwEEAAAAQAMCAwMDBAAFBQEYAAAAAAAAAAAAAAEGAAAAAAUBAAAAABH/AgAAAAAAAOIDAwAwAANuAAAAAKkEAAAwBAMVAQAAAMAEBAAwBAPOAgAAAJ49AgMDAAAApAEGAAAAUECfAQMCggECAAcDBgMHAwUFAwABAgYAAwgEAABQQAEAAQkBGAAAAAEAAQAAAQAAAAD9AAAAAgAAAAAEAAABAgAVowAAAMAAAABSAQAA4gIGAG8DAQAwAwISAQAAAG8DAgAwAwKaAgAAAG8DAwAwAwIxAwAAAG8DBAAwAwL+BAAAAG8DBQAwAwLaBQAAAJ8BAgKCAQIABwYBAwoDCwMMAwEDDQUFAQIDBAUBAQEAARgAAAoAAQAAAQAAAQAAAQAAAQAA+wABAAAAAAK6ibXGtVU6PohN31KOcm/5yKfGjzNBl3uTdxCYVUnVdG6BihIqDAFL

-- Decompiled by Krnl

return (function(p1)
	return setmetatable({}, {
		["__index"] = p1,
		["__metatable"] = false,
		["__newindex"] = function(p2, p3, p4)
			error("Attempt to modify read-only table: " .. p2 .. ", key=" .. p3 .. ", value=" .. p4)
		end
	})
end)({
	["debug"] = "debug",
	["info"] = "info",
	["warning"] = "warning",
	["error"] = "error",
	["critical"] = "critical"
})
