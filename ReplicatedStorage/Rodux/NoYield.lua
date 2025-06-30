-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLBWVycm9yBWRlYnVnCXRyYWNlYmFjawljb3JvdXRpbmUGc3RhdHVzBGRlYWQoQXR0ZW1wdGVkIHRvIHlpZWxkIGluc2lkZSBjaGFuZ2VkIGV2ZW50IQ1yZXN1bHRIYW5kbGVyBmNyZWF0ZQZyZXN1bWUHTm9ZaWVsZAADBwIAAQAAHaMCAAArAQoA3QICAKQDAQAAAABApAQEAAAMIIBSBQAAUgYCAJ8EAwKMBQIAnwMDAaQCBwAAGFCAUgMAAJ8CAgLwAgoACAAAAKQCAQAAAABApAMEAAAMIIBSBAAAbwUJAJ8DAwKMBAIAnwIDAd0CAACCAgAACgMBBAAAAEADAgMDBAAMIIADBAMFBAAYUIADBgMHAAwIARgAAQEBAAAAAAAAAAADAAAAAAABAAAAAAAAAAADAAwAAAAABwEBAQAADqMBAACkAQIAAAQAgFICAACfAQIC+wIAAFIDAQCkBAQAAAwAgFIFAQDdBgAAnwQAAJ8CAACCAgAABQMEAwkEAAQAgAMKBAAMAIAAGQsBGAABAAAAAgAAAAAAAAAAGQAAAAACAAABAgAFowAAAMAAAADAAQEAEgAAAIIBAgACBgAGAQIAAQEAARgACw0ABgEAAAAAAq7wGYCqkLGRnDRzFJm4+S6fbhNKCiB0/z235GRA5ha1EJ7LNcaENPc=

-- Decompiled by Krnl

local function v_u_3(p1, p2, ...)
	if not p2 then
		error(debug.traceback(p1, (...)), 2)
	end
	if coroutine.status(p1) ~= "dead" then
		error(debug.traceback(p1, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end
return function(p4, ...)
	-- upvalues: (copy) v_u_3
	local v5 = coroutine.create(p4)
	return v_u_3(v5, coroutine.resume(v5, ...))
end
