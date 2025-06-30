-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMBHR5cGUFdGFibGU1SW52YWxpZCBhY3Rpb246IEFuIGFjdGlvbiBjcmVhdG9yIG11c3QgcmV0dXJuIGEgdGFibGUGYXNzZXJ0Bl9fY2FsbAZzdHJpbmc+QmFkIGFyZ3VtZW50ICMxOiBFeHBlY3RlZCBhIHN0cmluZyBuYW1lIGZvciB0aGUgYWN0aW9uIGNyZWF0b3IIZnVuY3Rpb25AQmFkIGFyZ3VtZW50ICMyOiBFeHBlY3RlZCBhIGZ1bmN0aW9uIHRoYXQgY3JlYXRlcyBhY3Rpb24gb2JqZWN0cwRuYW1lDHNldG1ldGF0YWJsZRFtYWtlQWN0aW9uQ3JlYXRvcgADBgECAQAAF6MBAAD7AQAA3QIAAJ8BAAK7KAEDUgUBAKQEAQAAAABAnwQCAvAEAgACAAAAqQMAAakDAQCBAQMEAwAAAG8EAwCkAgUAAABAQJ8CAwH7AgEAMAIBcQAAAACCAQIABgMBBAAAAEADAgMDAwQEAABAQAAMBQEYAAEAAAIAAAAAAAAAAAAAAAAAAAIAAAIMAAAAAAYCAAAAAC27KAADUgUAAKQEAQAAAABAnwQCAvAEAgACAAAAqQMAAakDAQCBAQMEAwAAAG8EAwCkAgUAAABAQJ8CAwG7KAEDUgUBAKQEAQAAAABAnwQCAvAEAgAGAAAAqQMAAakDAQCBAQMEBwAAAG8EBwCkAgUAAABAQJ8CAwHiAwkAMAADWggAAADiBAsA2QUAABIAAQASAAAAMAUE7woAAACePQMDBAAAAKQCDQAAAMBAnwIDAoICAgAOAwEEAAAAQAMGAwcDBAQAAEBAAwgDCQMKBQEIAwUFAQoDCwQAAMBAAQAEDAEYAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAgEAAQEAAAAAAAD9AAAABQAAAAABAAABAgADowAAAMAAAACCAAIAAQYBAQEBAAEYAAMUAQAAAAACuQ2bNCN9XlKLyfGgTvCab5kdku1Ab5Vl0WmwjcuZB9BidSQxIqpr0Q==

-- Decompiled by Krnl

return function(p_u_1, p_u_2)
	local v3 = type(p_u_1) == "string"
	assert(v3, "Bad argument #1: Expected a string name for the action creator")
	local v4 = type(p_u_2) == "function"
	assert(v4, "Bad argument #2: Expected a function that creates action objects")
	return setmetatable({
		["name"] = p_u_1
	}, {
		["__call"] = function(_, ...)
			-- upvalues: (copy) p_u_2, (copy) p_u_1
			local v5 = p_u_2(...)
			local v6 = type(v5) == "table"
			assert(v6, "Invalid action: An action creator must return a table")
			v5.type = p_u_1
			return v5
		end
	})
end
