-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUBW1lcmdlBHR5cGUWc2V0UmV3YXJkU3Bpbm5lckNvbmZpZwhkaXNwYXRjaA1PbkNsaWVudEV2ZW50B0Nvbm5lY3QQU1BJTl9SRU1PVEVfTkFNRQdhbmRUaGVuBGluaXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUDU3RkCkRpY3Rpb25hcnkNUmV3YXJkU3Bpbm5lchNSZXdhcmRTcGlubmVyQ29uc3RzDHdhaXRGb3JDaGlsZANBcHAFc3RvcmUABAYBAgAAAA77AQAA+wQBAE0DBB8AAAAA4gQCAG8FAwAwBQRxAQAAAFIFAACfAwMAvAEBTAQAAACfAQABggABAAUDAQMCBQEBAwMDBAALAAEYAAAAAAABAAAB/gAAAAMMAAAAAAQBAgAAAAlNAQCMAAAAAMADAQASAgAAEgIBALwBAccCAAAAnwEDAYIAAQADAwUGAAMGAQAKAAEYAAAAAAAAAAAFCwAAAAAEAAUAAAAN+wAAAPsBAQD7AwIATQIDSQAAAACfAAMCwAIBABICAwASAgQAvAAAtQIAAACfAAMBggABAAMDBwYBAwgBAQkJARgAAAAAAAAAAAAAAAAHCgAAAAAHAAABAgAuowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAoQYAAABNAgOpBwAAAJ8BAgKkAgUAAABAQE0EALcIAAAATQMEZwkAAACfAgICpAMFAAAAQEBNBQChBgAAAE0EBfMKAAAAnwMCAqQEBQAAAEBATQYAwQsAAABNBQZ+DAAAAJ8EAgL/BQEAAAAAAMAGDQASAAMAEgAAABIAAgASAAQAEgABADAGBRMOAAAAggUCAA8DCgQAAABAAwsDDAMNBAAAQEADDgMPAxADEQMSAxMDFAYCAwkBAgEAARgAAQAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAIAAQAAAAAAAAAJAQAAAAADIdXQx20hDZUTEbpTwj6rCHyDPTGyBwwdHw1cYw0SF18+qhdYWWucyw==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Std.Dictionary)
local v_u_3 = require(v_u_1.RewardSpinner.RewardSpinnerConsts)
local v_u_4 = require(v_u_1.Std.waitForChild)
local v_u_5 = require(v_u_1.App.store)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3, (copy) v_u_5, (copy) v_u_2
		v_u_4(v_u_1, v_u_3.SPIN_REMOTE_NAME):andThen(function(p6)
			-- upvalues: (ref) v_u_5, (ref) v_u_2
			p6.OnClientEvent:Connect(function(p7)
				-- upvalues: (ref) v_u_5, (ref) v_u_2
				v_u_5:dispatch(v_u_2.merge({
					["type"] = "setRewardSpinnerConfig"
				}, p7))
			end)
		end)
	end
}
