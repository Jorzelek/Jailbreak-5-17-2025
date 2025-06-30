-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRBE5hbWUYQXByaWwyMDIyTGl2ZUV2ZW50Q2xpZW50GUFwcmlsMjAyMkxpdmVFdmVudFJ1bnRpbWUMV2FpdEZvckNoaWxkBHRhc2sEd2FpdAdyZXF1aXJlBGluaXQFcHJpbnQoTG9hZGVkIEFwcmlsIDIwMjIgbGl2ZSBldmVudCBjbGllbnQgY29kZQVjaGVjawRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UORmluZEZpcnN0Q2hpbGQKQ2hpbGRBZGRlZAdDb25uZWN0AAIFAQAAAAAaKwABAIIAAQBNAQC6AAAAAPABFAABAACAbwMCALwBANMDAAAAnwEDAqQCBgAAFECAbwMHAJ8CAgGkAwkAAACAQFIEAQCfAwICTQIDEwoAAACfAgEBpAIMAAAAsEBvAw0AnwICAYIAAQAOAwEDAgMDAwQDBQMGBAAUQIACmpmZmZmZuT8DBwQAAIBAAwgDCQQAALBAAwoABgsBGAABAgAAAAEAAAABAAAAAQAAAAAAAAEAAAACBwAAAAAGAAABAgAVowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAsABBABSAgEAbwUFALwDAAMGAAAAnwMDAJ8CAAFNAgBrBwAAAFIEAQC8AgLHCAAAAJ8CAwGCAAEACQMMBAAAAEADDQMOBgADAgMPAxADEQEAAQABGAABAAAAAAAECwAAAAAAAQAAAAAAAQEAAAAAAfy0DkcEDBuVznBk01Lt9YmMV0oSaHq/VlhZpELF+kgx+s3N40nnPqk=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local function v4(p2)
	if p2 then
		if p2.Name == "April2022LiveEventClient" then
			local v3 = p2:WaitForChild("April2022LiveEventRuntime")
			task.wait(0.1)
			require(v3).init()
			print("Loaded April 2022 live event client code")
		end
	end
end
v4(v1:FindFirstChild("April2022LiveEventClient"))
v1.ChildAdded:Connect(v4)
