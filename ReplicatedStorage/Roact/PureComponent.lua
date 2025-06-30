-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXN0YXRlBXByb3BzBXBhaXJzDHNob3VsZFVwZGF0ZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQJQ29tcG9uZW50DVB1cmVDb21wb25lbnQGZXh0ZW5kAAIKAwAAAAApTQMAGAAAAADxAgMAAwAAAKkDAQCCAwIATQMABwEAAACaAQMAAwAAAKkDAACCAwIApAMDAAAAIEBSBAEAnwMCBBcDBwBNCQAHAQAAAIcICQbxCAMABwAAAKkIAQCCCAIAbgP4/wIAAACkAwMAAAAgQE0EAAcBAAAAnwMCBBcDBQCHCAEG8QgDAAcAAACpCAEAgggCAG4D+v8CAAAAqQMAAIIDAgAEAwEDAgMDBAAAIEAADwQBGAAAAAABAAMAAAABAAMAAAAAAQAAAAABAP4ABgAAAAAAAQAAAQD+AAYAEgAAAAAEAAABAgAWowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAogFAAAAnwACAm8DBgC8AQCcBwAAAJ8BAwJNAgCcBwAAADACAZwHAAAAwAIIADACAUkJAAAAggECAAoDBQQAAABAAwYEAAAgQAMHAwgDCQMKBgADBAEAAQABGAAFAAAAAAAAAAACAAAABQAAAAIAABoBAAAAAAFkZD9L3mBA1VagVd82YRf7blfpDCMX38ZooJyrOiFjP5pQc5mFWEMt

-- Decompiled by Krnl

local v1 = require(script.Parent.Component)
local v2 = v1:extend("PureComponent")
v2.extend = v1.extend
function v2.shouldUpdate(p3, p4, p5)
	if p5 ~= p3.state then
		return true
	end
	if p4 == p3.props then
		return false
	end
	for v6, v7 in pairs(p4) do
		if p3.props[v6] ~= v7 then
			return true
		end
	end
	for v8, v9 in pairs(p3.props) do
		if p4[v8] ~= v9 then
			return true
		end
	end
	return false
end
return v2
