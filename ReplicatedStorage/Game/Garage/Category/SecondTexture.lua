-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWBE1ha2UFTW9kZWwKU2Vjb25kQm9keQ5GaW5kRmlyc3RDaGlsZAtUcmFpbGJsYXplcgJSOAlNb2x0ZW5NMTIEUmF5OQpCZWFtSHlicmlkB0NvbmNlcHQHQ2Vsc2lvcgpKYWNrUmFiYml0CFNlbnRpbmVsCUJhbmFuYUNhcglFc2NhcGVCb3QGU2hvZ3VuCFBvc2VpZG9uBVN0dW50CERpcnRiaWtlBVNsb29wB0NydWlzZXIFV2VkZ2UAAgcBAQAAABFNAQCtAAAAAPsDAACHAgMBDgICAKkCAACCAgIATQIAOwEAAAArAgEAggABAG8FAgCpBgEAvAMCAwMAAACfAwQAggMAAAQDAQMCAwMDBAAZAAEYAAABAAABAAIAAQECAAAAAAAaAAAAAAIAAAECADyjAAAA/wAGAAAAAACpAQEAMAEA0AAAAACpAQEAMAEAygEAAACpAQEAMAEAvAIAAACpAQEAMAEAMgMAAACpAQEAMAEAmQQAAACpAQEAMAEAaAUAAACpAQEAMAEAzgYAAACpAQEAMAEANAcAAACpAQEAMAEAWwgAAACpAQEAMAEAWAkAAACpAQEAMAEAnwoAAACpAQEAMAEAwAsAAACpAQEAMAEAWQwAAACpAQEAMAEAlg0AAACpAQEAMAEAXA4AAACpAQEAMAEAXg8AAACpAQEAMAEAmBAAAACpAQEAMAEAMhEAAADAARIAEgAAAIIBAgATAwUDBgMHAwgDCQMKAwsDDAMNAw4DDwMQAxEDEgMTAxQDFQMWBgABAAEAARgAAwABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAABAAADAAABAAAAAAGYwWY3ULgaxqoFDKPDWKGqquJeX+cae6cP1lUpTCvVBAvW00VKJpPN

-- Decompiled by Krnl

local v_u_1 = {
	["Trailblazer"] = true,
	["R8"] = true,
	["MoltenM12"] = true,
	["Ray9"] = true,
	["BeamHybrid"] = true,
	["Concept"] = true,
	["Celsior"] = true,
	["JackRabbit"] = true,
	["Sentinel"] = true,
	["BananaCar"] = true,
	["EscapeBot"] = true,
	["Shogun"] = true,
	["Poseidon"] = true,
	["Stunt"] = true,
	["Dirtbike"] = true,
	["Sloop"] = true,
	["Cruiser"] = true,
	["Wedge"] = true
}
return function(p2)
	-- upvalues: (copy) v_u_1
	if v_u_1[p2.Make] then
		return false
	end
	local v3 = p2.Model
	if v3 then
		return v3:FindFirstChild("SecondBody", true)
	end
end
