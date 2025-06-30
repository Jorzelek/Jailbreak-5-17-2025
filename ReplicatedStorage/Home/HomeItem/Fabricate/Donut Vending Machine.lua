-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKA25ldwVEb251dAVfbWFpZAhHaXZlVGFzaw9fdmVuZGluZ01hY2hpbmUFc2V0dXAHcmVxdWlyZQ9fVmVuZGluZ01hY2hpbmUGc2NyaXB0BlBhcmVudAACBQEBAAAAD/sCAABNAQLvAAAAAFICAABvAwEAnwEDAk0CAMECAAAAUgQBALwCAv0DAAAAnwIDATABAIMEAAAAggABAAUDAQMCAwMDBAMFAAUGARgAAAAAAAABAAAAAAABAAEGAAAAAAQAAAECABGjAAAApAABAAAAAECkAwQAAAAwQE0CAyQFAAAATQEC+wIAAACfAAIC/wEBAAAAAADAAgYAEgAAADACAfkHAAAAggECAAgDBwQAAABAAwgDCQQAADBAAwoGAAMGAQABAAEYAAEAAAAAAAAAAAIAAQAAAAUBAAAAAAEiGBabGmFbxxDcfA8K69RNFqPIHPUcnpyrC9qLU0mLoQF8CQq0uYqt

-- Decompiled by Krnl

local v_u_1 = require(script.Parent._VendingMachine)
return {
	["setup"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = v_u_1.new(p2, "Donut")
		p2._maid:GiveTask(v3)
		p2._vendingMachine = v3
	end
}
