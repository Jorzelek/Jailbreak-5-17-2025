-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMEBU1vZGVsFkdhcmFnZVN1c3BlbnNpb25IZWlnaHQGSGVpZ2h0DFNldEF0dHJpYnV0ZQACBgIAAAAAEg4ACQBNAgE7AAAAAG8EAQBNBQC8AgAAALwCAi4DAAAAnwIEAYIAAQBNAgE7AAAAAG8EAQCMBQAAvAICLgMAAACfAgQBggABAAQDAQMCAwMDBAACAAEYAAEAAAAAAAAAAAIAAAAAAAACAwAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAEAAQAAAAABYh2WzKck61dQ2fxY65IALytf6tvdjAWEuHHzJk5ObO2uKhFRNgNc9g==

-- Decompiled by Krnl

return function(p1, p2)
	if p1 then
		p2.Model:SetAttribute("GarageSuspensionHeight", p1.Height)
	else
		p2.Model:SetAttribute("GarageSuspensionHeight", 0)
	end
end
