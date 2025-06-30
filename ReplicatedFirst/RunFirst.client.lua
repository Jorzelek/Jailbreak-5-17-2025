local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")
if script.Parent == ReplicatedFirst then
	local Images = {
		["Trade"] = {
			["image"] = "rbxassetid://9839090323",
			["aspectRatio"] = 2
		},
		["Battle"] = {
			["image"] = "rbxassetid://12668259770",
			["aspectRatio"] = 2
		}
	}
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.DisplayOrder = 50
	local Frame = Instance.new("Frame")
	Frame.Parent = ScreenGui
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 0
	Frame.BackgroundColor3 = Color3.new(0, 0, 0)
	Frame.BorderSizePixel = 0
	local Image = Instance.new("ImageLabel")
	Image.BackgroundTransparency = 1
	Image.Size = UDim2.new(0.25, 0, 0.25, 0)
	Image.AnchorPoint = Vector2.new(0.5, 0.5)
	Image.Position = UDim2.new(0.5, 0, 0.5, 0)
	Image.Parent = ScreenGui
	local AspectRatio = Instance.new("UIAspectRatioConstraint")
	AspectRatio.Parent = Image
	TweenService:Create(Image, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.In, -1, true), {
		["ImageTransparency"] = 1,
		["Size"] = UDim2.fromScale(0.4, 0.4)
	}):Play()
	local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	local TeleportData = TeleportService:GetLocalPlayerTeleportData()
	if TeleportData then
		ReplicatedFirst:RemoveDefaultLoadingScreen()
		if TeleportData.tradeLoadingScreen or TeleportData.battleLoadingScreen then
			if TeleportData.tradeLoadingScreen then
				AspectRatio.AspectRatio = Images.Trade.aspectRatio
				Image.Image = Images.Trade.image
			elseif TeleportData.battleLoadingScreen then
				AspectRatio.AspectRatio = Images.Battle.aspectRatio
				Image.Image = Images.Battle.image
			end
			ScreenGui.Parent = PlayerGui
		end
	end
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	ScreenGui.Parent = nil
	require(ReplicatedStorage.Std.Maid).new():GiveTask(ReplicatedStorage:WaitForChild(require(ReplicatedStorage.WorldTeleport.WorldTeleportConsts).TELEPORT_HAPPENING_REMOTE).onClientEvent:Connect(function(TeleportHappening)
		if TeleportHappening.tradeLoadingScreen or TeleportHappening.battleLoadingScreen then
			if TeleportHappening.tradeLoadingScreen then
				AspectRatio.AspectRatio = Images.Trade.aspectRatio
				Image.Image = Images.Trade.image
			elseif TeleportHappening.battleLoadingScreen then
				AspectRatio.AspectRatio = Images.Battle.aspectRatio
				Image.Image = Images.Battle.image
			end
			ScreenGui.Parent = PlayerGui
		end
		task.delay(10, function()
			ScreenGui.Parent = nil
		end)
	end))
end
