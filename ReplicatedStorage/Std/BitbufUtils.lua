-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMINVN0cmluZyB0b28gbG9uZyBmb3IgbGVuZ3RoIHRvIGJlIHdyaXR0ZW4gaW4gdWludCBzaXplBmFzc2VydAlXcml0ZVVpbnQKV3JpdGVCeXRlcwt3cml0ZVN0cmluZwhSZWFkVWludAlSZWFkQnl0ZXMKcmVhZFN0cmluZwADBwMAAAAAF4wGAgCyBQYBHAYCANQGAgAFAAAAqQQAAakEAQCBAQQEAAAAAG8FAACkAwIAAAAQQJ8DAwFSBQEAHAYCALwDAM4DAAAAnwMEAVIFAgC8AwAwBAAAAJ8DAwGCAAEABQMBAwIEAAAQQAMDAwQABAUBGAAAAAAAAAAAAAAAAAABAAAAAAEAAAABBQAAAAAGAgAAAAAJUgQBALwCAEoAAAAAnwIDAlIFAgC8AwCWAQAAAJ8DAwCCAwAAAgMGAwcACQgBGAAAAAABAAAAAAoAAAAAAgAAAQIACqMAAAD/AAIAAAAAAMABAAAwAQA3AQAAAMABAgAwAQCxAwAAAIIAAgAEBgADBQYBAwgCAAEBAAEYAAEAAgAABQAABAEAAAAAAkeRP6ZYgmZHdVVVMiFm0Sb+m7irluTgWfeQnWDvBQQ+qJLe9ol3cdU=

-- Decompiled by Krnl

return {
	["writeString"] = function(p1, p2, p3)
		local v4 = 2 ^ p2 >= #p3
		assert(v4, "String too long for length to be written in uint size")
		p1:WriteUint(p2, #p3)
		p1:WriteBytes(p3)
	end,
	["readString"] = function(p5, p6)
		return p5:ReadBytes((p5:ReadUint(p6)))
	end
}
