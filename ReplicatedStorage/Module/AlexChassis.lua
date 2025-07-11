--[[
	AlexChassis.lua
	Client-side vehicle physics and controller.
	Handles player input, vehicle movement, suspension, sound, and camera.

	Original Author: @badccvoid
	Improvements and Comments by: @jorzelek1 (Readability) and Gemini AI (Further Comments)

	This script is responsible for the client-side simulation and visual representation
	of vehicle dynamics, including:
	- Processing player input for driving, steering, and vehicle actions.
	- Calculating and applying forces for suspension, traction, drag, and engine thrust.
	- Managing visual aspects like wheel rotation, steering wheel animation, and lighting.
	- Controlling sound effects for engine, tires, and environmental acoustics.
]]

--// SERVICES & MODULES //--
-- Get necessary Roblox services.
local CollectionService = game:GetService("CollectionService") -- Used for tagging and retrieving game objects.
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- A storage area for assets accessible by both client and server.
local UserInputService = game:GetService("UserInputService") -- Manages user input (keyboard, mouse, gamepad, touch).
local SoundService = game:GetService("SoundService") -- Manages sound properties and sound effects.
local RunService = game:GetService("RunService") -- Provides events that fire every frame.
local Players = game:GetService("Players") -- Manages players in the game.
local Lighting = game:GetService("Lighting") -- Provides access to lighting properties (used for rain check).

-- Load custom modules from ReplicatedStorage. These are external scripts providing specific functionalities.
local IsStudio = require(ReplicatedStorage.App.RunUtils).isStudio() -- Module function to check if running in Studio.
local CharacterUtils = require(ReplicatedStorage.Std.CharacterUtils) -- Utility functions for character manipulation (e.g., transparency).
local UI = require(ReplicatedStorage.Module.UI) -- User Interface related functions.
local R15IKv2 = require(ReplicatedStorage.Module.R15IKv2) -- Inverse Kinematics module for R15 arms (for steering wheel).
local AlexWM = require(ReplicatedStorage.Module.AlexWM) -- Appears to be related to UI or management (though not directly used in this snippet's exposed functions).
local Region = require(ReplicatedStorage.Module.Region) -- Module for checking if a point is within a defined region (used for environment sounds).
local Settings = require(ReplicatedStorage.Resource.Settings) -- Game settings (used for Region sounds test).
local ChassisShared = require(ReplicatedStorage.Module.ChassisShared) -- Shared data accessible by both client and server (e.g., handbrake state).
local PhysicsLagService = require(ReplicatedStorage.App.PhysicsLagService) -- Service to estimate physics lag.
local RayCast = require(ReplicatedStorage.Module.RayCast) -- Custom raycasting module.
local Time = require(ReplicatedStorage.Module.Time) -- Time utility module (synced time).
local Spring = require(ReplicatedStorage.Std.Spring) -- Spring physics simulation module (used for Rattler/Shogun effects).
local Audio = require(ReplicatedStorage.Std.Audio) -- Audio playing utility module.
local Missile = require(ReplicatedStorage.Game.Missile) -- Missile module (used for "TheAgent" action).
local VehicleUtils = require(ReplicatedStorage.Vehicle.VehicleUtils) -- General vehicle utility functions.
local WheelWorld = require(ReplicatedStorage.Module.Wheel.WheelWorld) -- Appears wheel-related, but not directly used in this snippet's exposed functions.
local WheelModule = require(ReplicatedStorage.Module.Wheel.Wheel) -- Appears wheel-related, but not directly used.
local CharacterAnim = require(ReplicatedStorage.Game.CharacterAnim) -- Character animation utility module.
local EnumMake = require(ReplicatedStorage.Game.Garage.EnumMake) -- Enumeration for vehicle makes/brands.
local EnvironmentUtils = require(ReplicatedStorage.Environment.EnvironmentUtils) -- Environment utility functions (used for precipitation check).
local EnvironmentConsts = require(ReplicatedStorage.Environment.EnvironmentConsts) -- Environment constants (precipitation types).
local PartUtils = require(ReplicatedStorage.Std.PartUtils) -- Part utility functions (not directly used in exposed functions).

--// LOCAL VARIABLES //--
local Vehicles = workspace:WaitForChild("Vehicles") -- Wait for the "Vehicles" folder in the workspace.
local LocalPlayer = Players.LocalPlayer -- The player currently running this script.
local CurrentCamera = workspace.CurrentCamera -- Reference to the game's current camera.

--// FUNCTION DECLARATIONS & SHORTCUTS //--
local GetMoveVector -- Forward declare function to get player movement vector, primarily for mobile support.
function GetMoveVector()
	-- Default empty move vector. This will be overwritten if ControlModule is found.
	return Vector3.new()
end
-- Overwrite GetMoveVector with the one from the player's ControlModule for mobile support.
-- This block ensures that mobile input (like joysticks) is correctly captured.
do
	local ControlModule = LocalPlayer.PlayerScripts:WaitForChild("PlayerModule", 5).ControlModule -- Attempts to find the ControlModule from PlayerScripts.
	if ControlModule then
		ControlModule = require(ControlModule) -- Loads the ControlModule.
		function GetMoveVector()
			return ControlModule:GetMoveVector() -- Overwrites the function to get the actual movement vector from the ControlModule.
		end
	end
end

-- Shortcuts for frequently used constructors and functions to improve performance and readability.
local cf, v3, cfa = CFrame.new, Vector3.new, CFrame.Angles -- Aliases for CFrame and Vector3 constructors.
local cfb, v3b, v3d = cf(0, 0, 0), v3(0, 0, 0), v3(0, -1, 0) -- Pre-created common CFrames and Vectors (e.g., zero vector, down vector).
local RayNew = Ray.new -- Alias for Ray.new constructor.
local fpor = workspace.FindPartOnRay -- Alias for FindPartOnRay method.
local fporwil = workspace.FindPartOnRayWithIgnoreList -- Alias for FindPartOnRayWithIgnoreList method.
local min, max, abs, tanh = math.min, math.max, math.abs, math.tanh -- Aliases for common math functions.
local exp = math.exp -- Alias for math.exp (e^x).
local tos, vtos, vtws = cfb.toObjectSpace, cfb.vectorToObjectSpace, cfb.vectorToWorldSpace -- CFrame method shortcuts (e.g., for converting coordinates).

local Event -- Will be set later by the main script to communicate with the server. This is a RemoteEvent.
local ScreenGui -- Will be set later by the main script to the main ScreenGui.

--// SOUND CONFIGURATION //--
-- References to sound effects in the SoundService. These are Roblox SoundEffect instances.
local SoundEffects = {
	Echo = SoundService.Chassis.EchoSoundEffect,
	Equalizer = SoundService.Chassis.EqualizerSoundEffect,
	Reverb = SoundService.Chassis.ReverbSoundEffect
}
-- A map of sound effects to their configurable properties. This defines which properties can be adjusted.
local SoundOptions = {
	Echo = {"Delay", "DryLevel", "Feedback", "WetLevel"},
	Equalizer = {"HighGain", "LowGain", "MidGain"},
	Reverb = {"DecayTime", "Density", "Diffusion", "DryLevel", "WetLevel"}
}
-- Predefined sound presets for different environments. These are collections of property values for the SoundEffects.
local SoundValues = {
	Tunnel = {
		Echo = {Delay = 0.35, DryLevel = 0, Feedback = 0, WetLevel = -27},
		Equalizer = {HighGain = 0, LowGain = -2.5, MidGain = -2.5},
		Reverb = {DecayTime = 3.5, Density = 1, Diffusion = 0.6, DryLevel = 4, WetLevel = 0}
	},
	Outside = {
		Echo = {Delay = 1.5, DryLevel = 0, Feedback = 0, WetLevel = -42.2},
		Equalizer = {HighGain = 0, LowGain = 0, MidGain = 0},
		Reverb = {DecayTime = 10, Density = 1, Diffusion = 1, DryLevel = 0, WetLevel = -35}
	},
	City = {
		Echo = {Delay = 0.198, DryLevel = 0, Feedback = 0, WetLevel = -9.8},
		Equalizer = {HighGain = 0, LowGain = -8, MidGain = 0},
		Reverb = {DecayTime = 4.6, Density = 1, Diffusion = 0.6, DryLevel = 0, WetLevel = -28}
	}
}

local Transition = 0 -- Variable for controlling the transition progress between sound environments (0 to 1).
local SetRPMRaw -- Forward declare the raw RPM sound function, which will be defined in the following 'do' block.

-- This block encapsulates the engine sound logic.
do
	-- Gaussian function to create a smooth curve for sound volume based on RPM.
	-- This function outputs a value between 0 and 1, peaking at 'Mean' and spreading based on 'StdDev'.
	local function f(Mean, Ratio, StdDev)
		return math.exp(-(Mean - Ratio) ^ 2 / (2 * StdDev * StdDev))
	end

	-- Complex engine sound logic for combustion engines (most cars).
	-- It blends between Idle, Low, Mid, and High RPM sounds based on current RPM and throttle input.
	local function SetRPM3(Sounds, RPM, Throttle, Make)
		local Mult = 0.2 -- General volume multiplier.
		local IdleSpeed, OnLowSpeed, OnMidSpeed, OnHighSpeed, OffLowSpeed -- Playback speed variables.
		local IdleMult = 0.6 -- Multiplier for idle sound.

		-- Specific tuning parameters for certain high-performance or unique cars.
		if Make == EnumMake.Lamborghini or Make == EnumMake.Bugatti or Make == EnumMake.Chiron or Make == EnumMake.Surus or Make == EnumMake.Challenger or Make == EnumMake.Beignet or Make == EnumMake.Macaron or Make == EnumMake.Monster or Make == EnumMake.Goliath or Make == EnumMake.ShellMark5 or Make == EnumMake.Power1 or Make == EnumMake.Successor or Make == EnumMake.OGLaMatador or Make == EnumMake.Maverick or Make == EnumMake.Wedge or Make == EnumMake.Revox then
			IdleSpeed = (RPM + 2000) / 5500 + 0.8
			OnLowSpeed = RPM / 12000 + 0.5 + 0.07 - 0.1
			OnMidSpeed = 1 + RPM / 12000 - 0.5 + 0.07 - 0.1
			OnHighSpeed = 1 + RPM / 12000 - 0.3 + 0.25 - 0.1
			OffLowSpeed = RPM / 12000 + 0.6 + 0.1 - 0.1
			IdleMult = 0.5
		else -- Default engine sound characteristics for other cars.
			IdleSpeed = (RPM + 1000) / 6000 + 0.8
			OnLowSpeed = RPM / 10000 + 0.2
			OnMidSpeed = 1 + RPM / 10000 - 0.7
			OnHighSpeed = 1 + RPM / 10000 - 1
			OffLowSpeed = RPM / 10000 + 0.2
		end

		-- Additional speed adjustment for specific classic/muscle cars.
		local SpeedOffset = (Make == EnumMake.TheRattler or (Make == EnumMake.ShellClassic or (Make == EnumMake.Bandit or (Make == EnumMake.Longhorn or (Make == EnumMake.Laviolette or (Make == EnumMake.Hammerhead or Make == EnumMake.Delorean)))))) and -0.3 or ((Make == EnumMake.MCL36 or Make == EnumMake.MCL36FREE) and 0.45 or (Make == EnumMake.Power1 and -0.3 or 0))

		-- Set playback speeds for different sound layers, applying vehicle-specific adjustment.
		Sounds.Idle.PlaybackSpeed = IdleSpeed + SpeedOffset
		Sounds.OnLow.PlaybackSpeed = OnLowSpeed + SpeedOffset
		Sounds.OnMid.PlaybackSpeed = OnMidSpeed + SpeedOffset
		Sounds.OnHigh.PlaybackSpeed = OnHighSpeed + SpeedOffset
		Sounds.OffLow.PlaybackSpeed = OffLowSpeed + SpeedOffset

		-- Calculate volumes for each sound layer using the Gaussian function based on RPM ratio.
		local Ratio = RPM / 8000
		local IdleVolume = f(-0.1, Ratio, 0.2) * Mult * IdleMult
		local OnLowVolume = f(0.3, Ratio, 0.1) * Mult
		local OnMidVolume = f(0.6, Ratio, 0.2) * Mult
		local OnHighVolume = (Ratio < 0.9 and f(0.9, Ratio, 0.15) or 1) * Mult -- High RPM sound has a plateau at high Ratio.

		Sounds.Idle.Volume = IdleVolume
		-- Adjust volumes based on whether the player is accelerating (Throttle > 0) or decelerating.
		if Throttle > 0 then
			Sounds.OnLow.Volume = OnLowVolume
			Sounds.OnMid.Volume = OnMidVolume
			Sounds.OnHigh.Volume = OnHighVolume
			Sounds.OffLow.Volume = 0
		else
			Sounds.OnLow.Volume = OnLowVolume * 0.5
			Sounds.OnMid.Volume = OnMidVolume * 1
			Sounds.OnHigh.Volume = OnHighVolume * 1
			Sounds.OffLow.Volume = OnLowVolume * 0.5 -- Off-throttle sound is active when decelerating.
		end
	end

	-- Simpler engine sound logic for electric vehicles.
	-- These typically have a more linear and less varied sound profile.
	local function SetRPM1(Sounds, RPM, Throttle, Make)
		local Mult = 0.2 -- General volume multiplier for electric cars.
		-- Different electric cars have different max RPMs for sound scaling.
		local Ratio = RPM / ((Make == EnumMake.Volt or Make == EnumMake.Volt4x4) and 10000 or (Make == EnumMake.Roadster and 12000 or 6000))
		Sounds.Idle.PlaybackSpeed = (Make == EnumMake.DesertCrawler and 0.1 or 0) + (Make == EnumMake.DesertCrawler and 1.4 or 1) * (RPM + 3000) / 8000  -- Adjust playback speed based on RPM.
		local IdleVolume = f(1.1, Ratio, 0.5) * Mult -- Use Gaussian function for a smooth volume curve.
		Sounds.Idle.Volume = IdleVolume
	end

	-- Engine sound logic for custom/newer sound configs.
	-- Uses Gear and a custom config table to influence sound blending and pitch.
	local function SetRPMNew(Sounds, RPM, Throttle, Make, Gear, CustomSoundConfig) -- Note: Parameters are in a different order here.
		local GearRatioFactor = Gear / 6 -- Ratio of current gear to a base (maybe max gear or 6).
		local RPMToBase = RPM / 6300 -- Ratio of RPM to a base (6300).
		local Ratio = 5 * RPMToBase -- Scaled RPM ratio.
		local IdleMult = 0.2 -- Base multiplier for idle volume.
		local Mult = 0.2 -- Base multiplier for other volumes.

		-- Increase multipliers for specific vehicles (Venom, Cobra).
		if Make == EnumMake.Venom or Make == EnumMake.Cobra then
			IdleMult = IdleMult * 2
			Mult = Mult * 2
		end

		-- Calculate volumes using the Gaussian function based on the scaled RPM Ratio.
		local IdleVolume = f(Ratio, 0, 2) * IdleMult
		local OnLowVolume = f(Ratio, 1.5, 1) * Mult
		local OnMidVolume = f(Ratio, 3.25, 1) * Mult
		local OnHighVolume = (Ratio <= 5 and f(Ratio, 5, 1) or 1) * Mult -- High RPM sound has a plateau.

		-- Calculate playback speeds based on Gear, RPM ratio, and custom config offsets.
		local PitchMult = 0.1 + 1.15 * ((1 + GearRatioFactor) * (RPMToBase - 0.4 * GearRatioFactor))
		local OnLowSpeed = PitchMult * 2 ^ (-CustomSoundConfig.low / 12) -- Adjust speed based on 'low' config value.
		local OnMidSpeed = PitchMult * 2 ^ (-CustomSoundConfig.mid / 12) -- Adjust speed based on 'mid' config value.
		local OnHighSpeed = PitchMult * 2 ^ (-CustomSoundConfig.high / 12) -- Adjust speed based on 'high' config value.
		local IdleSpeed = PitchMult * 0.75 + 1 -- Idle speed calculation.

		-- Apply calculated volumes and speeds.
		Sounds.Idle.Volume = IdleVolume
		Sounds.OnLow.Volume = OnLowVolume
		Sounds.OnMid.Volume = OnMidVolume
		Sounds.OnHigh.Volume = OnHighVolume
		Sounds.Idle.PlaybackSpeed = IdleSpeed
		Sounds.OnLow.PlaybackSpeed = OnLowSpeed
		Sounds.OnMid.PlaybackSpeed = OnMidSpeed
		Sounds.OnHigh.PlaybackSpeed = OnHighSpeed
	end

	-- Main function to set RPM sounds. It decides which logic to use based on the car's SoundType and CustomSoundConfig.
	function SetRPMRaw(SoundType, EnumMakeId, Sounds, RPM, Throttle, Gear, CustomSoundConfig) -- Note: Parameters are different from the internal functions.
		if SoundType == "Electric" then
			SetRPM1(Sounds, RPM, Throttle, EnumMakeId) -- Use electric vehicle sound logic.
		elseif CustomSoundConfig then
			SetRPMNew(Sounds, RPM, Throttle, EnumMakeId, Gear, CustomSoundConfig) -- Use new custom sound logic.
		else
			SetRPM3(Sounds, RPM, Throttle, EnumMakeId) -- Use combustion engine sound logic (the default).
		end
	end
end

--// GEAR & RPM LOGIC //--
--[[
	Updates the vehicle's current gear and calculates the engine RPM.
	This simulates an automatic transmission, handling gear shifts and RPM calculation.
]]
local function UpdateGearsAndRPM(p, Gears, Speed, Throttle, dt)
	local Gear, LastGear, t3, LastRPM = p.Gear, p.LastGear, p.t3, p.LastRPM -- Retrieve current gear state from the vehicle packet 'p'.
	-- Calculate engine speed based on wheel speed and wheel radius.
	-- Constants convert vehicle speed (Magnitude of AssemblyLinearVelocity) to engine speed equivalent.
	-- Assumes all wheels have the same size (uses WheelBackRight's PrimaryPart size).
	local EngineSpeed = Speed / (p.Wheels[1].Model.PrimaryPart.Size.Y / 2.9) * 1000 / 3600 / 0.34 -- Calculate engine speed relative to wheel rotation.
	local GearRatio = LastGear * (1 - t3) + Gear * t3 -- Interpolate gear ratio for a potentially smoother visual transition? (Maybe this is vestigial).

	-- Handle smooth transition between gear ratios during a shift.
	if LastGear ~= Gear then -- If a gear shift is in progress.
		GearRatio = Gears[2 + LastGear] * (1 - t3 * t3) + Gears[2 + Gear] * t3 * t3 -- Use a squared interpolation (t3*t3) for a snappier shift curve. Gears[2] is reverse, Gears[3] is 1st, etc.
		t3 = t3 + dt * 1 / 0.26 -- Increment the transition timer. 0.26 is the target transition duration in seconds.
		p.t3 = t3
		if t3 >= 1 then -- Transition complete.
			p.LastGear = Gear -- Update LastGear to the new current gear.
			p.t3 = 0 -- Reset transition timer.
		end
	else -- No shift in progress.
		GearRatio = Gears[2 + Gear] -- Use the direct gear ratio for the current gear.
	end

	-- Calculate the final RPM based on engine speed, final drive ratio (Gears[1]), and current effective gear ratio.
	local RPM = EngineSpeed * Gears[1] * GearRatio * 60 / (2 * math.pi)
	-- Calculate the "Full RPM" which is the RPM if the shift was instantaneous (used for shift point detection).
	local FullRPM = EngineSpeed * Gears[1] * Gears[2 + Gear] * 60 / (2 * math.pi)
	local ChangeIn = FullRPM - LastRPM -- Change in RPM, used to detect acceleration/deceleration for shifting.

	-- Automatic gear shifting logic.
	if not p.NoGears then -- If the vehicle has an automatic transmission enabled.
		-- Shift up: Accelerating (Throttle > 0), RPM is increasing (ChangeIn > 0), RPM is high (FullRPM > 6000), and not in top gear.
		if Throttle > 0 and (ChangeIn > 0 and (FullRPM > 6000 and Gear < #Gears - 2)) then -- #Gears - 2 represents the index of the top gear.
			local PreviousGear = Gear -- Store current gear before shifting.
			p.Gear = Gear + 1 -- Shift up.
			if p.onGearShift then -- Call the onGearShift callback if defined.
				p:onGearShift(PreviousGear, p.Gear) -- Pass previous and new gear.
			end
			-- Shift down: RPM is decreasing (ChangeIn < 0), RPM is low (FullRPM < 3400), and not in first gear.
		elseif ChangeIn < 0 and (FullRPM < 3400 and Gear > 1) then
			local PreviousGear = Gear -- Store current gear before shifting.
			p.Gear = Gear - 1 -- Shift down.
			if p.onGearShift then -- Call the onGearShift callback if defined.
				p:onGearShift(PreviousGear, p.Gear) -- Pass previous and new gear.
			end
		end
	end

	-- Update the engine sound based on the new RPM and other parameters.
	SetRPMRaw(p.SoundType, p.EnumMakeId, p.Sounds, RPM, Throttle, Gear, p.engineSoundConfig)

	-- Update visual RPM for UI display.
	p.rpmVisual = RPM
	p.rpmVisualMax = 7000 -- Max RPM for the visual display.

	p.LastRPM = FullRPM -- Store FullRPM for the next frame's ChangeIn calculation.

	-- Handle turbo intake and blow-off sounds (specifically for Wedge/Manta).
	if p.turboIntakeSound then
		-- Scale intake volume based on RPM (TimePosition) and Throttle.
		local TimePosition = p.rpmVisual / p.rpmVisualMax
		local ClampedRatio = math.clamp(TimePosition, 0, 1) ^ 3 -- Non-linear scaling based on clamped RPM ratio.
		local TargetTurboIntakeVolume = (Throttle <= 0 and 0 or ClampedRatio) * p.maxTurboIntakeSoundVolume -- Volume is 0 when not accelerating.
		-- Smoothly interpolate the turbo intake sound volume.
		p.turboIntakeSound.Volume = p.turboIntakeSound.Volume + (TargetTurboIntakeVolume - p.turboIntakeSound.Volume) * 0.1

		-- Play turbo blow-off sound on gear shifts (when the *new* gear is greater than the *previous* gear, i.e., shifting *up*).
		if Gear < p.Gear and p.turboBlowOff then -- The condition `Gear < p.Gear` here seems to use the *previous* gear value passed into the function compared to the potentially *new* value set on `p.Gear` earlier in this function. This is slightly unusual logic.
			p.turboBlowOff.PlaybackSpeed = 1 + (math.random() * 0.15 - 0.075) -- Add slight random pitch variation.
			p.turboBlowOff:Play()
		end
	end

	return Gear, GearRatio -- Return the current gear and its ratio.
end

-- Helper function to check if a number is NaN (Not-a-Number).
local function IsNaN(n)
	return n ~= n
end

-- Updates the camera's Field of View (FOV) based on speed and effective gear ratio for a sense of speed.
local function updateFOV(p135) -- p135 is the vehicle packet 'p'.
	local EffectiveGearRatio = p135.LastFakeGear or 1 -- Use a 'fake' gear ratio (often just the current actual ratio) or default to 1.
	local Speed = p135.Model.Engine.AssemblyLinearVelocity.Magnitude -- Get the absolute speed.
	local FOVSpeedEffect = EffectiveGearRatio ^ 0.5 * (Speed / 120) -- Calculate the base FOV effect, influenced by gear ratio and speed.
	if IsNaN(FOVSpeedEffect) then FOVSpeedEffect = 0 end -- NaN check.
	FOVSpeedEffect = math.clamp(FOVSpeedEffect, 0, 3) -- Clamp the effect intensity.

	-- Apply a non-linear curve to the FOV effect.
	local FieldOfView = FOVSpeedEffect < 0.825155 and FOVSpeedEffect ^ 3 or 1 - exp(-FOVSpeedEffect)
	FieldOfView = FieldOfView * 30 + 70 -- Scale the effect to a realistic FOV range (70 to 100).

	local mFieldOfView = CurrentCamera.FieldOfView -- Get the camera's current FOV.
	-- Smoothly interpolate the camera's FOV towards the target FOV.
	FieldOfView = mFieldOfView + (FieldOfView - mFieldOfView) * 0.7
	CurrentCamera.FieldOfView = FieldOfView
end

--// MAIN CHASSIS MODULE TABLE & STATE VARIABLES //--
local m = {} -- The main module table that will be returned.
local WASDQE = {0, 0, 0, 0, 0, 0} -- Input state table: [W, A, S, D, Q, E]. 0 for released, 1 (or analog value) for pressed.
local ShouldDrift, Lights, Autopilot = false, false, false -- Boolean flags for various vehicle states.
local Sirens = false -- Boolean flag for police sirens.

--// INPUT SETTERS (Likely deprecated in favor of OnAction) //--
-- Set the forward input state (W).
function m.setForward(processed)
	WASDQE[1] = processed and 1 or 0
end
-- Set the backward input state (S).
function m.setBackward(processed)
	WASDQE[3] = processed and 1 or 0
end
-- Toggles police sirens on/off.
function m.toggleSirens()
	Sirens = not Sirens -- Toggle the local flag.
	Event:FireServer("VehicleEvent", "PoliceLights", Sirens) -- Notify the server to update police lights.
end
-- Toggles headlights on/off.
function m.toggleHeadlights()
	-- This simply fires a server event, the server likely handles the actual light toggle.
	Event:FireServer("VehicleEvent", "Lights")
end
-- Sets the state of the continuous handbrake/drift.
function m.setHandbrakeEnabled(enabled)
	ShouldDrift = enabled -- Set the local flag.
	ChassisShared.HandBrake = enabled -- Update the shared state accessible by server.
end
-- Handles the 'Action' input binding (e.g., Firetruck water, TheAgent missile).
function m.runAction(processed)
	if processed then -- If the action button/key was pressed.
		local p = VehicleUtils.GetLocalVehiclePacket() -- Get the local player's vehicle packet.
		if not p then return end -- Exit if player is not in a vehicle.

		-- Handle specific vehicle actions.
		if p.Make == "Firetruck" then
			Event:FireServer("VehicleEvent", "FiretruckWater", true) -- Activate firetruck water.
			return
		elseif p.Make == "TheAgent" then
			m.AttemptFireMissile(p) -- Attempt to fire a missile for TheAgent.
		else
			Event:FireServer("VehicleEvent", "Action") -- Generic action for other vehicles.
		end
	else -- If the action button/key was released.
		-- Stop firetruck water if it was active.
		if ChassisShared.VehicleMake == "Firetruck" then
			Event:FireServer("VehicleEvent", "FiretruckWater", false)
		end
		return
	end
end
-- Toggles between external camera and internal (first-person) camera.
function m.toggleInsideCamera(p) -- p is the vehicle packet, can be nil if called from a non-vehicle context.
	p = p or VehicleUtils.GetLocalVehiclePacket() -- Get the vehicle packet.
	if p and not p.Passenger then -- Only allow the driver to toggle the camera.
		local IsCameraLocked = p.IsCameraLocked -- Get current camera locked state.
		if IsCameraLocked then
			m.UnlockCamera(p) -- Unlock if currently locked.
		else
			m.LockCamera(p) -- Lock if currently unlocked.
		end

		local Character = LocalPlayer.Character
		if Character then
			local Humanoid = Character:FindFirstChild("Humanoid")
			assert(Humanoid, "missing humanoid") -- Ensure humanoid exists.

			-- Predicate function to determine which parts of the character to make transparent.
			-- Makes limbs transparent except Left/Right Arm (presumably to keep them visible on steering wheel).
			local function getTransparencyPredicateForHumanoid(v)
				if v.Parent == Humanoid.Parent then -- Check if the part is a direct child of the character model.
					local Limb = Humanoid:GetLimb(v) -- Get the corresponding limb enumeration.
					if Limb == Enum.Limb.LeftArm or Limb == Enum.Limb.RightArm then
						return false -- Do NOT make arms transparent.
					end
				end
				return true -- Make other parts transparent.
			end

			-- Set character transparency based on the new camera locked state.
			if IsCameraLocked then -- Camera is now unlocked (moving to external view).
				-- Restore original transparency using popInvisible (removes previous setInvisible effect).
				CharacterUtils.popInvisible(LocalPlayer.Character, getTransparencyPredicateForHumanoid)
			else -- Camera is now locked (moving to internal view).
				-- Set transparency for parts based on the predicate.
				CharacterUtils.setInvisible(LocalPlayer.Character, getTransparencyPredicateForHumanoid)
			end
		end
	end
end

--// VEHICLE EVENT CALLBACKS //--
-- Called when the vehicle performs a gear shift.
function m.onGearShift(p, PreviousGear, Gear)
	-- Specific effects for the Venom vehicle on gear shift.
	if p.EnumMakeId == EnumMake.Venom then
		-- Play a specific audio effect (asset ID: 18128231812).
		Audio.ObjectLocal(p.Model.PrimaryPart, 18128231812, {
			Volume = 0.5,
			Pitch = 1
		})
		-- Emit particles from specific attachments on the "Metal" part of the model.
		for _, v in p.Model.Model.Metal:GetChildren() do
			if v:IsA("Attachment") then
				v:FindFirstChildWhichIsA("ParticleEmitter"):Emit(3)
			end
		end
	end
	-- Fire a server event to notify the server about the gear shift.
	local GearShiftRemote = p.Model:FindFirstChild("GearShiftRemote")
	if GearShiftRemote then
		GearShiftRemote:FireServer(PreviousGear, Gear)
	end
end

-- Initializes the module with necessary data (currently only ScreenGui).
function m.init(Data)
	ScreenGui = Data.ScreenGui -- Store the main ScreenGui reference.
end

--// VEHICLE SETUP & STATE MANAGEMENT //--

-- Sets the anti-gravity force to counteract a portion of Roblox's gravity.
-- This helps the car stay on the ground and provides better handling.
function m.SetGravity(p, Gravity)
	-- Calculate Mass from the Engine part (multiplied by 9.81 * 20, which is Roblox's default gravity constant).
	local Mass = p.Model:FindFirstChild("Engine").AssemblyMass * 9.81 * 20 -- This seems incorrect, should be total vehicle mass. Likely simplified in decompiled.
	local Force = 1 - Gravity / (9.81 * 20) -- Calculate the force needed to counteract a given 'Gravity' value relative to Roblox gravity.
	if Mass ~= Mass then Mass = 0 end -- NaN check for Mass.
	if Force ~= Force then Force = 0 end -- NaN check for Force.
	p.gravityOffset = Mass * Force -- Store the calculated force value. Note: This is stored in p.gravityOffset, not applied directly here.
end

-- Called when the local player enters a vehicle. Sets up controls, sounds, and state.
function m.VehicleEnter(p)
	local IsPassenger = p.Passenger -- Check if the player is a passenger.
	local Character = LocalPlayer.Character
	local Humanoid = Character.Humanoid

	-- Disable player movement states while seated.
	-- Uses a maid utility (p.seatMaid) to manage cleanup when leaving.
	local seatMaid = p.seatMaid
	seatMaid:GiveTask(function()
		if Character then
			-- On leaving, make face visible again if it was hidden.
			local Head = Character:FindFirstChild("Head")
			local Face = Head and Head:FindFirstChildOfClass("Decal")
			if Face then
				Face.Transparency = 0
			end
		end
	end)
	-- Task to update FOV every heartbeat (physics step).
	seatMaid:GiveTask(RunService.Heartbeat:Connect(function()
		updateFOV(p) -- Call the FOV update function.
	end))

	p.EnumMakeId = EnumMake[p.Make] -- Get the enumerated ID for the vehicle make.

	-- Handle different seating animations/states based on vehicle type.
	local ShouldSit = true -- Flag to determine if the default car sit animation should play.
	if p.EnumMakeId == EnumMake.ATV or p.EnumMakeId == EnumMake.Volt then
		p.NoLook = true -- Disable camera look.
	elseif p.Seat:FindFirstChild("Turret") then -- For vehicles with a turret.
		-- Stop existing animations and play a specific idle animation.
		task.delay(0.1, function()
			for _, v in ipairs(Humanoid:GetPlayingAnimationTracks()) do
				v:Stop()
			end
			local Idle = CharacterAnim.getIdleTrack() -- Get and load an idle animation track.
			Idle:Play()
			-- Add a task to stop the idle animation when leaving.
			seatMaid:GiveTask(function()
				Idle:Stop()
			end)
		end)
		ShouldSit = false -- Don't play the default car sit animation.
	end

	-- Play the default car sit animation if needed.
	if ShouldSit then
		local CarSit = CharacterAnim.getCarSitTrack() -- Get and load the car sit animation track.
		CarSit:Play()
		-- Add a task to stop the sit animation when leaving.
		seatMaid:GiveTask(function()
			CarSit:Stop()
		end)
	end

	-- Find steering wheel offset for IK.
	local Steer = p.Model:FindFirstChild("Steer")
	local SteerOffset = Steer and Steer:FindFirstChild("Offset")
	if SteerOffset then
		p.SteerOffset = SteerOffset.Value -- Store the steering offset value.
	end

	local Model = p.Model
	-- Make player's face invisible for first-person view if no 'Visible' part is in the seat.
	if not p.Seat:FindFirstChild("Visible") then
		local Head = Character:FindFirstChild("Head")
		local Face = Head and Head:FindFirstChildOfClass("Decal")
		if Face then
			Face.Transparency = 1
		end
	end
	ChassisShared.VehicleMake = p.Make -- Update the shared vehicle make information.

	if IsPassenger then return end -- Stop here if the player is a passenger.

	-- Reset driving state variables for the driver.
	WASDQE = { 0, 0, 0, 0, 0, 0 }
	ShouldDrift = false -- Handbrake/Drift off.
	Lights = false -- Headlights off (local flag).
	ChassisShared.HandBrake = false -- Shared handbrake state off.
	Autopilot = false -- Autopilot off.
	local Engine = Model.Engine -- Reference to the Engine part.
	Sirens = p.PoliceLights -- Initialize sirens state based on the vehicle's server-provided PoliceLights property.
	m.SetGravity(p, 100) -- Apply anti-gravity (value 100 is arbitrary, not actual gravity).

	-- Create BodyAngularVelocity for steering rotation.
	local Rotate = Instance.new("BodyAngularVelocity")
	Rotate.AngularVelocity = Vector3.new(0, 0, 0) -- Initialize with no rotation.
	-- Set max torque for rotation around the Y-axis (steering). X and Z torque seem high but less relevant for typical car steering.
	Rotate.MaxTorque = v3(p.Mass, (1 / 0), p.Mass) -- Use vehicle mass for X/Z torque, infinite torque for Y (math.huge).
	Rotate.Parent = Engine -- Parent to the Engine part.
	p.Rotate = Rotate -- Store reference.

	-- Initialize vehicle specific state properties.
	p.Traction = 1 -- Initial traction value.
	p.LastForward = 0 -- Last forward direction (1 for forward, -1 for backward).
	p.RotY = 0 -- Current Y-rotation for steering visuals.
	p.LastDrift = 0 -- Tick count of the last time a drift condition occurred.
	p.vHeading = 0 -- Smoothed steering input.
	-- Smoothed volume variables for terrain sounds.
	p.vGrass = 0
	p.vAsphalt = 0
	p.vSandstone = 0
	p.Gear = 1 -- Current gear (starts in first).
	p.LastGear = 1 -- Last gear (for transition).
	p.LastRPM = 0 -- Last calculated RPM.
	p.t3 = 0 -- Transition timer for gear shifts.
	p.AreTiresPopped = false -- Flag for tire pop state.
	p.PopTires = m.PopTires -- Reference to the PopTires function (allows calling it via the packet).
	p._flagBrakelightsEnabled = false -- Internal flag for brakelights state.
	p._flagHeadlightsEnabled = false -- Internal flag for headlights state (seems unused, local 'Lights' flag is used).

	-- Set up inverse kinematics for the player's arms on the steering wheel.
	if p.Make ~= "Volt" then -- Volt might have different controls or no visible steering wheel.
		p.IK = R15IKv2.BuildPacketArms(Character) -- Build an IK packet for the character's arms.
	end

	-- Vehicle-specific initialization logic.
	if p.Make == "TheRattler" then
		p.SpringEngineRattle = Spring.new(v3b, v3b, 0.6, 30) -- Spring for engine rattling visual effect.
		p.SpringEngineFlaps = Spring.new(0, 0, 0.8, 15) -- Spring for engine flaps visual effect.
		p.LastEngineRattle = os.clock() -- Timer for rattling frequency.
		p.RattleFire = {} -- Table to store fire particle emitters.
		p.RattleSmoke = {} -- Table to store smoke particle emitters.
		-- Find particle emitters under specific attachments.
		for _, v in ipairs(Model.Preset.RattlerEngine.EngineGold:GetChildren()) do
			if v:IsA("Attachment") then
				table.insert(p.RattleFire, v.Fire)
				table.insert(p.RattleSmoke, v.Smoke)
				v.Fire.Enabled = false -- Disable emitters initially.
				v.Smoke.Enabled = false
			end
		end
	elseif p.Make == "Shogun" then
		p.LastEngineRattle = os.clock() -- Timer for rattling frequency.
		p.RattleMotors = {} -- Table to store Motor parts for rattling effect.
		p.BrakeTrails = {} -- Table to store brake trail effects.
		p.RattleParticles = {} -- Table to store general rattle particles.
		p.SpringEngineRattle = Spring.new(v3b, v3b, 0.6, 30) -- Spring for engine rattling visual effect.
		-- Find Engine Motor parts.
		for _, v in Model.Preset.RattlerEngine:GetChildren() do -- Note: Shogun uses RattlerEngine preset structure.
			local motor = v:FindFirstChildOfClass("Motor")
			if motor and motor.Name:match("Engine$") then
				table.insert(p.RattleMotors, {
					motor = motor
				})
			end
		end
		-- Find particles under the "SecondBody" part.
		for _, v in Model.Model:FindFirstChild("SecondBody"):GetDescendants() do
			if v:IsA("ParticleEmitter") then
				table.insert(p.RattleParticles, v)
				v.Enabled = false -- Disable particles initially.
			end
		end
		-- Find Trails under "BrakelightGlass" parts.
		for _, v in Model.Model:FindFirstChild("BrakelightGlass"):GetChildren() do
			if v:IsA("Trail") then
				table.insert(p.BrakeTrails, v)
				v.Enabled = false -- Disable trails initially.
			end
		end
	elseif p.Make == "Wedge" or p.Make == "Manta" then
		-- Set up turbo intake sound.
		local turboIntakeSound = Audio.ObjectLocal(Model.Engine, 132884974895700, { -- Asset ID 132884974895700
			Volume = 0,
			Looped = true,
			RollOffMaxDistance = 400,
			RollOffMinDistance = 200
		})
		p.maxTurboIntakeSoundVolume = 0.2 -- Default max volume.
		if p.Make == "Manta" then
			p.maxTurboIntakeSoundVolume = 0.1 -- Lower max volume for Manta.
		end
		-- Set up turbo blow-off sound.
		local turboBlowOff = Audio.ObjectLocal(Model.Engine, 118282536530342, { -- Asset ID 118282536530342
			Volume = 0.2,
			DoNotPlay = true, -- Don't play immediately.
			RollOffMaxDistance = 400,
			RollOffMinDistance = 200
		})
		p.turboIntakeSound = turboIntakeSound -- Store references.
		p.turboBlowOff = turboBlowOff
		-- Add task to destroy sounds when leaving.
		seatMaid:GiveTask(function()
			turboIntakeSound:Destroy()
			turboBlowOff:Destroy()
		end)
	end

	-- Initialize drift squeal volume to 0.
	p.Sounds.DriftSqueal.Volume = 0
	-- Play all vehicle specific sounds.
	for _, Sound in pairs(p.Sounds) do
		if not Sound.IsPlaying then
			Sound:Play()
		end
	end

	-- Assign module functions to the vehicle packet for easy access.
	p.setForward = m.setForward
	p.setBackward = m.setBackward
	p.onGearShift = m.onGearShift
end

-- Called when the local player leaves a vehicle. Cleans up and resets state.
function m.VehicleLeave(p)
	local IsPassenger = p.Passenger
	-- Reset camera FOV to default.
	CurrentCamera.FieldOfView = 70
	-- Reset and stop all vehicle sounds and environmental sound effects.
	if p.Sounds then
		local Outside = SoundValues.Outside -- Get default "Outside" sound values.
		for Effect, Options in next, SoundOptions do -- Iterate through each sound effect (Echo, Equalizer, Reverb).
			for _, Option in next, Options do -- Iterate through each option for that effect.
				local Value = Outside[Effect][Option] -- Get the default value from the "Outside" preset.
				SoundEffects[Effect][Option] = Value -- Apply the default value to the actual SoundEffect instances.
			end
		end
		for _, Sound in pairs(p.Sounds) do
			Sound.Volume = 0 -- Set all vehicle specific sounds to 0 volume.
		end
		p.Sounds.DriftSqueal:Stop() -- Stop the drift squeal sound explicitly.
	end

	-- Unlock camera if it was locked.
	if p.IsCameraLocked then
		m.UnlockCamera(p)
	end

	if not IsPassenger then -- Cleanup for the driver.
		p.Rotate:Destroy() -- Destroy the BodyAngularVelocity used for steering.
		p.Lift.Force = v3b -- Reset the anti-gravity force (BodyForce).
		-- Reset forces for engine thrusters (Drive and Friction).
		for _, EngineThruster in p.EngineThrusters do
			EngineThruster.Drive.Force = v3b
			EngineThruster.Friction.Force = v3b
		end
		p.IK = nil -- Clear IK reference.
		-- Reset forces for wheel thrusters (Suspension).
		for _, Wheel in p.Wheels do
			Wheel.Thruster.Force = v3b
		end

		-- Disable vehicle-specific particles/trails.
		if p.RattleSmoke then
			for _, Smoke in p.RattleSmoke do
				Smoke.Enabled = false
			end
		end
		if p.RattleFire then
			for _, Fire in p.RattleFire do
				Fire.Enabled = false
			end
		end
		if p.RattleParticles then
			for _, Particle in p.RattleParticles do
				Particle.Enabled = false
			end
		end
		if p.BrakeTrails then
			for _, BrakeTrail in p.BrakeTrails do
				BrakeTrail.Enabled = false
			end
		end
		-- Ensure brakelights are off visually.
		VehicleUtils.setBrakelightsEnabled(p.Model, false)
	end
end

--// LOW QUALITY MODE FUNCTIONS //--
-- A simplified wheel update for lower performance settings.
-- This likely sacrifices some visual fidelity or precision for better framerates on less powerful devices.
function m.UpdateWheelLowQuality(Model, Height, Thruster, WheelRotation)
	local Engine = Thruster.Engine
	local EngineCFrame = Engine.CFrame
	local Thruster = Thruster.Part
	local ThrusterCFrame = Thruster.CFrame
	local RelativePos = tos(EngineCFrame, ThrusterCFrame)
	-- Get optional offset attributes from the Thruster part.
	local lateralRotateOffset = Thruster.lateralRotateOffset or 0
	local lateralOffset = Thruster.lateralOffset or 0
	local lateralDirection = RelativePos.X > 0 and 1 or -1 -- Direction based on lateral position relative to engine.
	local lateralRotCFrame = cf(lateralRotateOffset * lateralDirection, 0, 0) -- CFrame for lateral rotation offset.
	-- Calculate the base CFrame of the Thruster part including lateral offsets.
	local ThrusterCFrameNew = ThrusterCFrame * cf(lateralOffset * lateralDirection, 0, 0) * lateralRotCFrame
	local ThrusterPosition = ThrusterCFrameNew.p -- World position of the adjusted thruster.

	-- Raycast down from the adjusted thruster position to find the ground.
	-- Uses RayCast.RayIgnoreNonCollide (unlike SmartCast in the more commented version).
	-- Direction is downwards in world space (vtws(ThrusterCFrameNew, v3d)).
	local _, Pos = RayCast.RayIgnoreNonCollide(ThrusterPosition, vtws(ThrusterCFrameNew, v3d) * Height, Vehicles) -- Raycast downwards.
	-- Calculate distance to hit position.
	local Distance = (Pos - ThrusterPosition).magnitude -- Calculate distance from ray origin to hit position.

	-- Calculate the visual vertical offset for the wheel based on compression.
	local Motor = Thruster.Motor -- Get the Motor6D connecting the wheel.
	local LastWheelYOffset = -min(Distance, Height) + Motor.Part0.Size.Y * 0.5
	local WheelOffset = cf(0, LastWheelYOffset, 0) -- Offset based on minimum of distance/Height and wheel size.

	-- Apply steering-like rotation to front wheels.
	if RelativePos.Z < 0 then -- Check if it's a front wheel (negative Z relative to engine).
		-- Apply rotation based on engine's angular velocity around Y.
		WheelOffset = WheelOffset * cfa(0, Engine.AssemblyAngularVelocity.Y * 0.5, 0)
	end

	-- Combine offsets and apply rolling rotation.
	Motor.C1 = WheelOffset * lateralRotCFrame * cfa(WheelRotation, 0, 0) -- Update the CFrame of the Motor6D.

	-- Update optional BridgeMotor if present.
	local BridgeMotor = Thruster:FindFirstChild("BridgeMotor")
	if BridgeMotor then
		-- Get optional bridge offset attributes.
		local bridgeXOffset = Thruster.bridgeXOffset or 0
		local bridgeYOffset = Thruster.bridgeYOffset or 0
		local bridgeLocalYOffset = Thruster.bridgeLocalYOffset or 0
		-- Calculate the CFrame for the BridgeMotor.
		local BridgeMotorCFrame = cf(bridgeXOffset * lateralDirection, bridgeYOffset + bridgeLocalYOffset, 0)
		BridgeMotor.C1 = BridgeMotorCFrame * CFrame.lookAt(v3b, (v3(RelativePos.X, LastWheelYOffset - bridgeLocalYOffset, 0))) -- Set Motor C1. This CFrame.lookAt looks unusual.
	end
end

-- A simplified sound update for lower performance settings.
function m.UpdateSoundLowQuality(p, Gears, Velocity)
	if p.EnumMakeId == nil then
		p.EnumMakeId = EnumMake[p.Make] -- Ensure EnumMakeId is set.
	end
	-- Calls UpdateGearsAndRPM with a fixed delta time (0.01666... is roughly 1/60th of a second).
	-- This skips using the actual variable 'dt' for sound updates, potentially simplifying calculations.
	UpdateGearsAndRPM(p, Gears, math.abs(Velocity.Z), -math.sign(Velocity.Z), 0.016666666666666666)
end

--// PHYSICS UPDATE FUNCTIONS //--
-- This function updates the physics for a single wheel (suspension, visual position/rotation).
local function UpdateThruster(p, WheelThruster, EngineThruster, dt)
	-- Get all necessary parts and data.
	local Wheel = WheelThruster.Part -- The visual wheel part.
	local Engine = WheelThruster.Engine
	local EngineCFrame = Engine.CFrame
	local WheelCFrame = Wheel.CFrame
	local RelativePos = tos(EngineCFrame, WheelCFrame) -- Position of Wheel relative to Engine.

	-- Get optional offset attributes from the WheelThruster part.
	local lateralRotateOffset = WheelThruster.lateralRotateOffset or 0
	local lateralOffset = WheelThruster.lateralOffset or 0
	local Direction = RelativePos.X > 0 and 1 or -1 -- Direction based on lateral position relative to engine.
	local NewRotate = cf(lateralRotateOffset * Direction, 0, 0) -- CFrame for lateral rotation offset.
	local NewOffset = cf(lateralOffset * Direction, 0, 0) -- CFrame for lateral offset.

	-- Calculate the base CFrame of the wheel part including lateral offsets.
	local WheelCFrameNew = WheelCFrame * NewOffset * NewRotate
	local WheelPosition = WheelCFrameNew.p -- World position of the adjusted wheel origin.
	local Velocity = Wheel.Velocity
	local Motor = Wheel.Motor
	local SuspensionThruster = WheelThruster.Thruster -- The BodyThruster used for suspension force.
	local Mass = Wheel.AssemblyMass * 9.81 * 20 -- Mass calculation based on wheel assembly mass (might be intended for the whole car).
	local Suspension = p.Suspension
	local Bounce = p.Bounce
	local Force = Mass * Suspension
	if Force ~= Force then Force = 0 end
	local Damping = Force / Bounce
	if Damping ~= Damping then Damping = 0 end
	local RelativeWheelVelocity = vtos(WheelCFrameNew, Velocity) -- Wheel velocity in its own local space.
	local Height = p.Height -- Base suspension travel height.

	-- Add height from Garage Suspension upgrade if applicable.
	local GarageSuspensionHeight = p.Model:GetAttribute("GarageSuspensionHeight")
	if GarageSuspensionHeight then
		Height = Height + GarageSuspensionHeight
	end

	-- Apply and smooth a per-wheel height offset attribute.
	local heightOffset = WheelThruster._heightOffset or 0
	local mHeightOffset = heightOffset + ((Wheel:GetAttribute("ThrusterHeightOffset") or 0) - heightOffset) * 0.1 -- Smoothly interpolate towards the attribute value.
	WheelThruster._heightOffset = mHeightOffset -- Store the smoothed offset.
	local SuspensionHeight = Height + mHeightOffset -- Total effective suspension height for this wheel.

	local IsDelorean = p.EnumMakeId == EnumMake.Delorean -- Flag for Delorean specific raycast ignores.
	-- Raycast down from the adjusted wheel origin to find the ground.
	-- Uses RayCast.RayIgnoreNonCollide (unlike SmartCast in the more commented version).
	-- Direction is downwards in the wheel's local space converted to world space.
	local Hit, Pos = RayCast.RayIgnoreNonCollide(WheelPosition, WheelCFrameNew:VectorToObjectSpace(Vector3.new(0, -1, 0)) * SuspensionHeight, Vehicles, nil, IsDelorean)
	local Distance = (Pos - WheelPosition).Magnitude -- Distance from ray origin to hit position.

	local TireMesh = Wheel.Parent:FindFirstChild("TireMesh") -- Find the visual tire mesh.
	local Growth = not TireMesh and 0 or TireMesh.Size.Y -- Get tire height (used for visual offset).

	-- Calculate the visual vertical offset for the wheel based on compression and tire size.
	local WheelYOffset = -min(Distance, SuspensionHeight) + Growth * 0.5
	local LastWheelYOffset = Motor.C1.Y -- Get the previous visual Y offset.
	-- Smoothly interpolate the wheel's visual Y offset.
	local WheelNewYOffset = LastWheelYOffset + (WheelYOffset - LastWheelYOffset) * 0.5
	local NewWheelCFrame = cf(0, WheelNewYOffset, 0) * NewOffset -- Start building the new CFrame.

	local DriftEmitter = Wheel:FindFirstChild("Drift") -- Find the Drift part/emitter.
	-- Apply steering-like rotation to front wheels or handle drift particles for back wheels.
	if RelativePos.Z < 0 then -- Check if it's a front wheel (negative Z relative to engine).
		-- Apply rotation based on vehicle's smoothed steering rotation (p.RotY) and engine's angular velocity.
		NewWheelCFrame = NewWheelCFrame * cfa(0, p.RotY * 0.4 + Engine.AssemblyAngularVelocity.Y * 0.2, 0)
	elseif DriftEmitter and (Hit and (ShouldDrift or p.Drift)) then -- Check if a DriftEmitter part exists and conditions for emitting particles are met (on ground AND drifting). This condition is checked if the first condition (RelativePos.Z < 0) is false, meaning this section handles non-front wheels.
		if DriftEmitter then -- Double check emitter exists.
			p._didAnyWheelDrift = true -- Set flag indicating at least one wheel is drifting.
			DriftEmitter.C0 = cf(0, -WheelNewYOffset + Growth * 0.5, 0) -- Position the emitter relative to the wheel's visual position.
			DriftEmitter.Part0.ParticleEmitter:Emit(2) -- Emit 2 particles.
		end
	end

	-- Combine offsets and apply rolling rotation.
	NewWheelCFrame = NewWheelCFrame * NewRotate * cfa(EngineThruster.WheelRotation or 0, 0, 0) -- Apply rolling rotation.

	-- Sanity check to prevent visual glitches from invalid CFrame values (NaNs or excessively large values).
	if NewWheelCFrame.x ~= NewWheelCFrame.x or (NewWheelCFrame.y ~= NewWheelCFrame.y or (NewWheelCFrame.z ~= NewWheelCFrame.z or abs(NewWheelCFrame.x + NewWheelCFrame.y + NewWheelCFrame.z) > 100)) then
		NewWheelCFrame = cfb -- Reset to identity CFrame if invalid.
	end
	Motor.C1 = NewWheelCFrame -- Update the CFrame of the Motor6D to visually move the wheel.

	-- If the wheel is on the ground, calculate and apply suspension force.
	if Hit then
		local DampingForce = RelativeWheelVelocity * Damping -- Damping force opposes vertical velocity.
		local MaxForce = Mass * 0.5 -- Maximum upward force.
		local MinForce = -Mass * 0.5 -- Maximum downward force.

		-- Calculate spring force based on compression.
		local SuspensionForce = Mass * Suspension -- Assuming SuspensionForce is calculated here or defined somewhere else.
		local UpwardForce = (SuspensionHeight - min(Distance, SuspensionHeight)) ^ 2 * (SuspensionForce / SuspensionHeight ^ 2) -- Spring force increases with squared compression.

		-- Apply damping to reduce bounciness if the wheel has significant vertical velocity.
		if RelativeWheelVelocity.magnitude > 0.01 then
			UpwardForce = UpwardForce - DampingForce.Y
		end
		if IsNaN(UpwardForce) then UpwardForce = 0 end -- NaN check.

		UpwardForce = max(MinForce, min(MaxForce, UpwardForce)) -- Clamp the force to min/max.

		-- Scale force based on physics step time to ensure consistency across different framerates, influenced by PhysicsLagService.
		local TimePosition = 1
		if PhysicsLagService.getEstimatedPhysicsStepsMult() >= 2 then -- If physics is running slower than target (multiples of 1/60).
			TimePosition = TimePosition / 2 -- Reduce the force application time proportionally.
		end

		-- Apply the calculated upward force to the suspension BodyThruster.
		-- The force is scaled by TimePosition and a multiplier (4 / NumWheels), likely to distribute total suspension force correctly.
		local Mult = 4 / WheelThruster.NumWheels -- Multiplier based on total number of wheels (assuming 4).
		SuspensionThruster.Force = v3(0, UpwardForce * math.clamp(TimePosition, 0, 1) * Mult, 0)
	else
		-- No force if the wheel is in the air.
		SuspensionThruster.Force = v3b -- Set thruster force to zero.
	end

	-- Update optional BridgeMotor if present.
	local BridgeMotor = Wheel:FindFirstChild("BridgeMotor")
	if BridgeMotor then
		-- Get optional bridge offset attributes.
		local bridgeXOffset = WheelThruster.bridgeXOffset or 0
		local bridgeYOffset = WheelThruster.bridgeYOffset or 0
		local bridgeLocalYOffset = WheelThruster.bridgeLocalYOffset or 0
		-- Calculate the CFrame for the BridgeMotor.
		local BridgeMotorCFrame = cf(bridgeXOffset * Direction, bridgeYOffset + bridgeLocalYOffset, 0)
		BridgeMotor.C1 = BridgeMotorCFrame * CFrame.lookAt(v3b, (v3(RelativePos.X, WheelNewYOffset - bridgeLocalYOffset, 0))) -- Set Motor C1 using CFrame.lookAt.
	end
end

--// RAYCASTING UTILITIES //--
--[[
	A raycast function that repeatedly casts until it hits a collidable part,
	ignoring any non-collidable parts it hits along the way.
	This is useful for ensuring the ray hits a solid surface and doesn't get stuck on decorative or invisible parts.
]]
local function fpor2Autopilot(Origin, Direction, IgnoreList)
	local Length = Direction.magnitude
	Direction = Direction.unit
	local Position = Origin
	local Traveled = 0
	local Ignored = { IgnoreList } -- Initialize ignore list.
	local Hit, Pos, Normal = nil, v3b, v3b
	local Attempts = 0
	local CanCollide
	repeat
		Attempts = Attempts + 1
		local r = RayNew(Position, Direction * (Length - Traveled)) -- Create ray for remaining length.
		-- Perform the raycast, ignoring specified parts.
		Hit, Pos, Normal = fporwil(workspace, r, Ignored, false, true)
		CanCollide = Hit and Hit.CanCollide -- Check if hit part is collidable.
		-- Crucial check: If collidable, *also* check if the material is Concrete.
		if CanCollide then
			CanCollide = Hit.Material == Enum.Material.Concrete
		end
		if not CanCollide then
			table.insert(Ignored, Hit) -- If not Concrete or not collidable, add to ignore list.
		end
		Traveled = (Origin - Pos).magnitude -- Calculate distance traveled.
		Position = Pos -- Update ray origin to the previous hit position.
	until CanCollide or (Length - Traveled <= 0.001 or Attempts > 4) -- Stop conditions: hit Concrete, ray exhausted, or too many attempts.
	if not Hit then
		Pos = Origin + Direction * Length -- If no hit after attempts, set Pos to the end of the original ray.
		Normal = v3d -- Set normal to down.
	end
	return Hit, Pos, Normal -- Return the hit part, hit position, and hit normal.
end

-- Table listing vehicle Makes that might have slightly different handling/physics.
local NotEngineBoost = {
	[EnumMake.Proto8] = true,
	[EnumMake.Parisian] = true,
	[EnumMake.Semi] = true,
	[EnumMake.PrisonBus] = true,
	[EnumMake.Aperture] = true,
	[EnumMake.Fiasco] = true
}

-- Main physics update function, called every frame (likely on Heartbeat).
-- Contains core driving logic, force calculations, sound updates, and effects.
function m.UpdateEngine(p, EngineThruster, dt)
	local Model = p.Model
	local CanDrive = EngineThruster.CanDrive -- Flag indicating if the engine thruster can apply force.
	local Engine = EngineThruster.Engine
	local EngineCFrame = Engine.CFrame
	local EngineHalfSize = Engine.Size * 0.5
	local Rotate = p.Rotate -- BodyAngularVelocity for steering.
	local Height = p.Height -- Base suspension height.
	local Mass = Engine.AssemblyMass * 9.81 * 20 -- Mass calculation (seems based on Engine part, not total car mass).
	local TurnSpeed = p.TurnSpeed -- How quickly the car turns.
	local Make = p.EnumMakeId -- Vehicle make/brand.
	local RelativeVelocity = vtos(EngineCFrame, Engine.AssemblyLinearVelocity) -- Velocity relative to the car's own orientation (forward/sideways).
	local Speed = RelativeVelocity.Magnitude -- Absolute speed of the car.
	local t = os.clock() -- Current time (using os.clock).

	-- Spin Out logic - check if car is in a forced spin-out state (_spinOutAt is set).
	local spinOutAt = p._spinOutAt
	if spinOutAt then
		spinOutAt = t - p._spinOutAt < 3 -- Spin out lasts for 3 seconds.
	end

	-- Get player input.
	local Forward, Heading = WASDQE[1] - WASDQE[3], WASDQE[2] - WASDQE[4] -- Calculate combined forward/backward and left/right input.

	-- Handle mobile input overrides.
	if UserInputService.TouchEnabled then
		local MoveVector = GetMoveVector().X -- Get horizontal mobile joystick input.
		local MoveX = math.clamp(MoveVector, -1, 1)
		Heading = -MoveX * abs(MoveX) -- Apply squared input for smoother control curve.
	end

	-- Reduce forward input significantly during spin-out.
	if spinOutAt then
		Forward = Forward * 0.5
	end

	if p.LockMovement or Model:FindFirstChild("LockMovement") then Heading = 0 Forward = 0 end -- Lock movement if specified by vehicle state or attribute.

	-- Autopilot logic.
	if Autopilot then
		local RightVector = EngineCFrame.lookVector:Cross(v3(0, 1, 0)) -- Calculate the vehicle's right vector.
		-- Cast down ahead of the car to find the road (specifically Concrete material).
		local Hit = fpor2Autopilot(EngineCFrame * v3(0, 0, -EngineHalfSize.Z - abs(RelativeVelocity.Z) * 16 * dt), Vector3.new(0, -10, 0), Model) -- Raycast downwards. The direction magnitude -10 seems small for finding road far away.
		if Hit then -- If a Concrete surface was hit.
			-- Calculate the target position in the center of the current lane.
			local EnginePosInRoadSpace = tos(Hit.CFrame, EngineCFrame) -- Car's position relative to the road part.
			local LaneIndex = math.floor((EnginePosInRoadSpace.x + Hit.Size.x * 0.5) / 12) -- Determine which lane based on X position (assuming 12-stud lanes).
			local LaneCenterX = -Hit.Size.x * 0.5 + LaneIndex * 12 + 6 -- Calculate the center X position of that lane.
			local RoadDirection = 0 < EngineCFrame.lookVector:Dot(Hit.CFrame.lookVector) and 1 or -1 -- Determine if car is facing same direction as road.
			local TargetPosition = Hit.CFrame * v3(LaneCenterX, 0, -Hit.Size.z * 0.5 * RoadDirection) -- Target position in world space.

			-- Calculate steering and throttle corrections to stay in the lane.
			local CorrectionVector = (TargetPosition - EngineCFrame.p).unit:Dot(RightVector) -- How far off center the car is laterally (projection onto right vector).
			local SteeringCorrection = math.clamp(CorrectionVector * 4, -1, 1) -- Steering input proportional to offset.
			Heading = Heading - SteeringCorrection -- Apply steering correction (subtract as RightVector gives positive for right offset, need to steer left).
			local ForwardCorrection = 1 - abs(CorrectionVector) ^ (1 / 6) -- Forward thrust correction (reduces if off-center, non-linear).
			Forward = Forward + ForwardCorrection - abs(CorrectionVector) ^ 4 * 0.3 -- Apply forward thrust and add a penalty for being too off-center.

			Heading = math.clamp(Heading, -1, 1) -- Clamp final heading and forward inputs.
			Forward = math.clamp(Forward, -1, 1)
		end
	end

	-- Smooth the steering input (Heading).
	local rHeading = 0.16 -- Smoothing factor.
	local vHeading = p.vHeading -- Current smoothed heading.
	-- Exponential smoothing towards the raw Heading input.
	vHeading = vHeading + Heading * dt * 60 - vHeading * (Heading == 0 and 0.3 or rHeading) * dt * 60 -- dt*60 scales the smoothing rate to be consistent with 60Hz physics.
	p.vHeading = vHeading
	vHeading = vHeading * rHeading -- Apply the smoothed heading value (effectively another smoothing step).

	-- Drag, rolling resistance, and braking coefficients (Aerodynamic).
	local CoefDrag, CoefRolling, CoefBrake = p.Cd, p.Crr, p.Cb 

	-- Tire popping logic.
	local DisableDuration = p.DisableDuration -- Duration for tire disable effect (how long until they heal).
	local TirePopProportion = p.TirePopProportion -- Proportion of disable duration when effect is max.
	local VehicleTiresLastPop = Model:GetAttribute("VehicleTiresLastPop") or 0 -- Get timestamp of last tire pop from vehicle attribute.
	local t = (Time.GetNowSync() - VehicleTiresLastPop) / DisableDuration -- Calculate normalized "health" based on time since last pop.
	local AvgTireHealth = math.min(t, 1) -- Clamp health between 0 and 1.
	local AreTiresPopped = AvgTireHealth < 0.999 -- Flag if health is very low (tires considered popped).

	local PopForce -- Force applied when tires are popped.
	if AreTiresPopped then
		-- Calculate effectiveness of the pop effect based on health.
		local PopEffectiveness = AvgTireHealth < TirePopProportion and 0 or (AvgTireHealth - TirePopProportion) / (1 - TirePopProportion)
		PopForce = Mass * ((Vector3.new(0, 0, 0) - RelativeVelocity) / (1 - PopEffectiveness) * 200 + PopEffectiveness * 500) -- Formula seems complex, likely applying a strong deceleration.
		Forward = 0 -- Disable forward input when tires are popped.
		if Speed > 30 then
			p.LastDrift = tick() -- Force a drift state if speed is high with popped tires.
		end
	end
	p.AreTiresPopped = AreTiresPopped -- Update the stored state.

	-- Drifting logic.
	-- Check if steering input is given and opposes lateral velocity, or if lateral speed is high.
	if Heading ~= 0 and (Heading / abs(Heading) ~= RelativeVelocity.X / abs(RelativeVelocity.X) and abs(RelativeVelocity.X) > 8) then
		p.LastDrift = tick() -- Record time of drift if turning against lateral velocity at speed.
	end
	local IsDrifting = tick() - p.LastDrift < 0.3 -- A drift is active for 0.3 seconds after LastDrift was updated.

	-- Specific check: Volt vehicles cannot drift.
	if Make == EnumMake.Volt then
		ShouldDrift = false -- Disable forced drift.
		IsDrifting = false -- Disable detected drift.
	end
	p.Drift = IsDrifting -- Store detected drift state.

	-- Update drift sound volume.
	local TargetDriftVolume = 0
	local CurrentDriftVolume = p.Sounds.DriftSqueal.Volume
	-- Play drift sound if speed is high AND (detected drifting OR forced drifting + steering input).
	if Speed > 30 and (IsDrifting or ShouldDrift and Heading ~= 0) or spinOutAt then -- Also trigger sound during spin-out.
		TargetDriftVolume = 0.3 -- Target volume when drifting.
		-- Smoothly increase volume towards target.
		CurrentDriftVolume = CurrentDriftVolume + (TargetDriftVolume - CurrentDriftVolume) * 0.06
	else
		-- Smoothly decrease volume towards 0.
		CurrentDriftVolume = CurrentDriftVolume + (TargetDriftVolume - CurrentDriftVolume) * 0.1
	end
	p.Sounds.DriftSqueal.Volume = CurrentDriftVolume

	-- Update wheel suspension forces (calls UpdateThruster for each wheel).
	m.UpdateForces(p, EngineThruster, dt) -- Note: dt passed here, but seems unused in UpdateForces/UpdateThruster signature provided earlier.

	-- Update visual wheel rotation (based on forward/backward velocity).
	local mWheelRotation = RelativeVelocity.Z * dt -- Distance traveled along the forward axis.
	if IsNaN(mWheelRotation) then mWheelRotation = 0 end -- NaN check.
	-- Add to current rotation, normalizing by wheel radius (using p.Wheels[1] PrimaryPart size).
	-- % (2 * math.pi) keeps the angle within a full circle.
	local WheelRotation = ((EngineThruster.WheelRotation or 0) + mWheelRotation / (p.Wheels[1].Model.PrimaryPart.Size.Y * 0.5)) % (2 * math.pi) -- Stores rotation on EngineThruster object.
	EngineThruster.WheelRotation = WheelRotation -- Update the stored rotation.

	-- Update traction based on drift state, speed, and environment.
	local TractionSpeedFactor = tanh(abs(RelativeVelocity.magnitude) * 0.03) -- Traction decreases with speed (using tanh).
	local mTraction = p.Traction -- Current traction value.
	-- Calculate target traction: reduced by speed factor squared when drifting, full when not.
	local vTraction = (ShouldDrift or IsDrifting) and ((1 - TractionSpeedFactor) ^ 2 or 1) or 1
	-- Reduce traction in rain.
	if EnvironmentUtils.getPrecipitation() == EnvironmentConsts.PRECIPITATION_ENUM.Rain then
		vTraction = vTraction * 0.4
	end
	-- Reduce traction during spin-out.
	if spinOutAt then
		vTraction = vTraction * 0.6
	end
	vTraction = max(vTraction, 0.07) -- Minimum traction value.
	local rTraction = vTraction < mTraction and 0.2 or 0.01 -- Smoothing rate for traction (faster when decreasing).
	-- Smoothly transition current traction towards the target traction.
	mTraction = mTraction + (vTraction - mTraction) * rTraction * dt * 60 -- dt*60 scales to 60Hz.
	p.Traction = mTraction -- Store the smoothed traction.

	-- Update gears and RPM.
	local Gears = p.Gears -- Get gear ratio data.
	local CurrentGear, CurrentGearRatio = UpdateGearsAndRPM(p, Gears, math.abs(RelativeVelocity.Z), Forward, dt) -- Pass absolute forward velocity for speed, and raw Forward input for throttle state.
	p.LastFakeGear = CurrentGearRatio -- Store the current ratio (used for FOV calculation).

	-- Check surface material under the front of the car (used for terrain sounds and possibly physics).
	-- Raycast downwards from slightly ahead of the engine.
	local IsDelorean = p.EnumMakeId == EnumMake.Delorean -- Flag for Delorean specific raycast ignores.
	local Hit, _, _, Normal = RayCast.RayIgnoreNonCollide(EngineCFrame * v3(0, 0, EngineHalfSize.Z - 1), EngineCFrame:vectorToWorldSpace(Vector3.new(0, -1, 0)) * Height * 2, Model, nil, IsDelorean)

	-- Calculate base lateral friction (skidding resistance).
	if not p.TractionMag then -- Calculate and store if not already done.
		-- Base lateral friction magnitude varies significantly by car model.
		local TractionMag = ((
			Make == EnumMake.Firetruck or Make == EnumMake.Surus or Make == EnumMake.BankTruck or
				Make == EnumMake.Volt4x4 or Make == EnumMake.Interrogator or Make == EnumMake.Sentinel or
				Make == EnumMake.TheCamper or Make == EnumMake.Roadster or Make == EnumMake.Boxer or
				Make == EnumMake.Ray9 or Make == EnumMake.JackRabbit or Make == EnumMake.ShellClassic or
				Make == EnumMake.Bandit or Make == EnumMake.Parisian or Make == EnumMake.Carbonara or
				Make == EnumMake.Laviolette or Make == EnumMake.Venom or Make == EnumMake.Beignet or
				Make == EnumMake.Snake or Make == EnumMake.MoltenM12 or Make == EnumMake.Scorpio or 
				Make == EnumMake.Iceborn) and 450 or ( 
					Make == EnumMake.Challenger or Make == EnumMake.Deja or Make == EnumMake.Shogun or 
					Make == EnumMake.Bugatti or Make == EnumMake.Stormrider or Make == EnumMake.Revox or 
					Make == EnumMake.Badger or Make == EnumMake.Mustang or
					Make == EnumMake.TheAgent) and 175 or (
					Make == EnumMake.MCL36 or Make == EnumMake.MCL36FREE or 
					Make == EnumMake.Manta) and 550 or (
					Make == EnumMake.Striker or Make == EnumMake.XRK) and 900 or 300)
		if Make == EnumMake.Shogun then
			TractionMag = TractionMag * 0.85 -- Shogun specific multiplier.
		end
		p.TractionMag = TractionMag -- Store the calculated value.
	end
	local TractionMag = p.TractionMag -- Get the calculated value.

	-- Calculate Drag force.
	local DragForce = -CoefDrag * RelativeVelocity * Speed * v3(0, 0, Forward < 0 and 80 or 1) -- Drag opposes velocity, scaled by speed. Extra multiplier on Z for reverse? (80).

	-- Calculate Rolling Resistance force.
	local RollingResistance = -CoefRolling * RelativeVelocity * Vector3.new(0, 0, 1) -- Rolling resistance opposes forward/backward velocity.

	-- Calculate lateral friction/skid force. lateralFrictionForce represents this force in local space.
	-- It opposes lateral velocity (X), scaled by TractionMag and current mTraction.
	-- The magic numbers (150 / 588600 * Mass) likely convert the force unit or scale it based on mass.
	local lateralFrictionForce = -v3(math.clamp(RelativeVelocity.X, -150, 150), 0, 0) * TractionMag * mTraction * 150 / 588600 * Mass -- Clamps lateral velocity input.

	-- Special case for ATV lateral rolling resistance limit.
	if Make == EnumMake.ATV then
		if math.abs(RollingResistance.X) > Mass * 0.05 then
			RollingResistance = Vector3.new(math.clamp(RollingResistance.X, -Mass * 0.05, Mass * 0.05), 0, RollingResistance.Z)
		end
	end

	-- Mass conversion factor (Mass / (9.81 * 20) is inverse of Roblox gravity constant).
	local ForceFactor = Mass / (9.81 * 20)

	-- Calculate Braking power based on backward velocity.
	local BrakingPower = -(CoefBrake * (1 + p.GarageBrakes)) * RelativeVelocity.Z / abs(RelativeVelocity.Z) -- Proportional to brake coefficient, garage upgrade, and sign of forward velocity.
	if IsNaN(BrakingPower) then BrakingPower = 0 end -- NaN check.
	-- Calculate Forward Braking force.
	local ForwardForce = (BrakingPower / 18000 * ForceFactor) * Vector3.new(0, 0, 1) -- Scales BrakingPower and applies in the Z direction (forward/backward).

	-- Calculate Lateral Braking force (for skidding/handbrake).
	local BrakingForce = -CoefBrake * 0.3 * RelativeVelocity * Vector3.new(1, 0, 0) -- Opposes lateral velocity (X), scaled by brake coef.

	-- Nitro (NOS) logic.
	local IsNitroActive = p.Nitro -- Check if nitro is active.
	local NitroForce = (IsNitroActive and (0.17 * Mass or 0) or 0) * Vector3.new(0, -0.1, -1) -- Downward and backward force for nitro.
	if IsNitroActive and not p.Nitrof1 then
		p.Nitrof1 = true
		m.SetGravity(p, 20) -- Apply increased downforce.
	elseif not IsNitroActive and p.Nitrof1 then
		p.Nitrof1 = false
		m.SetGravity(p, 100) -- Reset gravity/downforce.
	end

	-- Calculate base engine force based on input and first gear ratio.
	local EngineThrust
	local EngineForce = Forward * Vector3.new(0, 0, -1) * Gears[1] * 1 / 0.34 * 750 -- Applies force in the backward (negative Z) direction when Forward input is positive.
	local EffectiveGearRatio
	if p.NoGears then -- For vehicles without traditional gears (e.g., electric).
		EffectiveGearRatio = Forward > 0 and Gears[1] or Gears[2] -- Use forward ratio (Gears[1]) or reverse (Gears[2]).
	else
		EffectiveGearRatio = Forward > 0 and Gears[2 + CurrentGear] or Gears[2] -- Use current gear ratio (Gears[2+Gear]) or reverse (Gears[2]).
	end
	-- Different power multipliers for different cars and upgrades.
	local EnginePowerMultiplier = 4.4
	if Make == EnumMake.Lamborghini or (Make == EnumMake.OGLaMatador or Make == EnumMake.Hammerhead) then EnginePowerMultiplier = 5.5
	elseif Make == EnumMake.Ambulance then EnginePowerMultiplier = 5
	elseif Make == EnumMake.Bandit then EnginePowerMultiplier = 11.399999999999999 * ForceFactor / 4300
	elseif Make == EnumMake.FrostCrawler then EnginePowerMultiplier = 2.485 * ForceFactor / 4600
	elseif Make == EnumMake.Laviolette then EnginePowerMultiplier = 3 * ForceFactor / 4300
	elseif Make == EnumMake.Crown then EnginePowerMultiplier = 11.2 * ForceFactor / 3304
	elseif Make == EnumMake.DesertCrawler then EnginePowerMultiplier = 9 * ForceFactor / 3894
	elseif Make == EnumMake.ShellMark5 then EnginePowerMultiplier = 6.6 * ForceFactor / 3089
	elseif Make == EnumMake.Goliath then EnginePowerMultiplier = 2.6 * ForceFactor / 12720
	elseif Make == EnumMake.Bloxy then EnginePowerMultiplier = 6.6 * ForceFactor / 3948
	elseif Make == EnumMake.TinyToy then EnginePowerMultiplier = 1.02 * ForceFactor / 720
	elseif Make == EnumMake.ShellClassic then EnginePowerMultiplier = 5.5 * ForceFactor / 2250
	elseif Make == EnumMake.Snake then EnginePowerMultiplier = 13.3 * ForceFactor / 5449 * 1.39
	elseif Make == EnumMake.Scorpio then EnginePowerMultiplier = 25.27 * ForceFactor / 12583
	elseif Make == EnumMake.Successor then EnginePowerMultiplier = 9.545689999999999 * ForceFactor / 3018
	elseif Make == EnumMake.Macaron then EnginePowerMultiplier = 9.182440218957073 * ForceFactor / 5543 * 1.6
	elseif Make == EnumMake.JackRabbit then EnginePowerMultiplier = 3.331709741550696 * ForceFactor / 3047
	elseif Make == EnumMake.Poseidon then EnginePowerMultiplier = 5.43452380952381 * ForceFactor / 3024
	elseif Make == EnumMake.MCL36 or Make == EnumMake.MCL36FREE then EnginePowerMultiplier = 132500 / ForceFactor
	elseif Make == EnumMake.TowTruck then EnginePowerMultiplier = 6.6 * ForceFactor / 4000
	elseif Make == EnumMake.NASCAR1 then EnginePowerMultiplier = 11.407
	elseif Make == EnumMake.NASCAR2 or Make == EnumMake.NASCAR75th then EnginePowerMultiplier = 6.039
	elseif Make == EnumMake.Trailblazer then EnginePowerMultiplier = 8.368421052631579
	elseif Make == EnumMake.Concept then EnginePowerMultiplier = 9.636363636363637
	elseif Make == EnumMake.Torero then EnginePowerMultiplier = 15.847
	elseif Make == EnumMake.Beignet then EnginePowerMultiplier = 10.794242074927956
	elseif Make == EnumMake.Ray9 then EnginePowerMultiplier = 5.4
	elseif Make == EnumMake.TheRattler then EnginePowerMultiplier = 5.5
	elseif Make == EnumMake.Ferrari then EnginePowerMultiplier = 6
	elseif Make == EnumMake.BananaCar then EnginePowerMultiplier = 9
	elseif Make == EnumMake.Challenger then EnginePowerMultiplier = 5.459999999999999
	elseif Make == EnumMake.Surus then EnginePowerMultiplier = 6
	elseif Make == EnumMake.MoltenM12 then EnginePowerMultiplier = 8.2
	elseif Make == EnumMake.Bugatti then EnginePowerMultiplier = 8
	elseif Make == EnumMake.Parisian then EnginePowerMultiplier = 24.8
	elseif Make == EnumMake.Chiron then EnginePowerMultiplier = 8.8 * ForceFactor / 3303
	elseif Make == EnumMake.Model3 then EnginePowerMultiplier = 4.2
	elseif Make == EnumMake.Roadster then EnginePowerMultiplier = 9
	elseif Make == EnumMake.IceBreaker then EnginePowerMultiplier = 8.5
	elseif Make == EnumMake.Proto8 then EnginePowerMultiplier = 6.73
	elseif Make == EnumMake.Monster then EnginePowerMultiplier = 5.75
	elseif Make == EnumMake.OGMonster then EnginePowerMultiplier = 5
	elseif Make == EnumMake.Firetruck then EnginePowerMultiplier = 10 * ForceFactor / 10418
	elseif Make == EnumMake.ATV then EnginePowerMultiplier = 1.5
	elseif Make == EnumMake.BankTruck then EnginePowerMultiplier = 15
	elseif Make == EnumMake.BeamHybrid then EnginePowerMultiplier = 6.5
	elseif Make == EnumMake.AirTail then EnginePowerMultiplier = 7.5
	elseif Make == EnumMake.Volt4x4 then EnginePowerMultiplier = 20
	elseif Make == EnumMake.TheAgent then EnginePowerMultiplier = 8.5
	elseif Make == EnumMake.Interrogator then EnginePowerMultiplier = 6
	elseif Make == EnumMake.Sentinel then EnginePowerMultiplier = 7
	elseif Make == EnumMake.TheCamper then EnginePowerMultiplier = 5
	elseif Make == EnumMake.R8 then EnginePowerMultiplier = 6.072
	elseif Make == EnumMake.Semi then EnginePowerMultiplier = 4.928000000000001
	elseif Make == EnumMake.Stormrider then EnginePowerMultiplier = 19.712000000000003
	elseif Make == EnumMake.Shogun then EnginePowerMultiplier = 4.95 * ForceFactor / 3010 * 1.8
	elseif Make == EnumMake.PrisonBus then EnginePowerMultiplier = 5
	elseif Make == EnumMake.Power1 then EnginePowerMultiplier = 7.700000000000001 * ForceFactor / 2267
	elseif Make == EnumMake.Aperture then EnginePowerMultiplier = 7.2 * ForceFactor / 2242
	elseif Make == EnumMake.Fiasco then EnginePowerMultiplier = 12.32
	elseif Make == EnumMake.Longhorn then EnginePowerMultiplier = 10.26
	elseif Make == EnumMake.Carbonara then EnginePowerMultiplier = 7.6 * ForceFactor / 2601
	elseif Make == EnumMake.XRK then EnginePowerMultiplier = EnginePowerMultiplier * 1.568
	elseif Make == EnumMake.Striker then EnginePowerMultiplier = EnginePowerMultiplier * 0.7
	elseif Make == EnumMake.SWATVan then EnginePowerMultiplier = EnginePowerMultiplier * 1.32
	elseif Make == EnumMake.Wedge then EnginePowerMultiplier = EnginePowerMultiplier * 1.3
	elseif Make == EnumMake.Manta then EnginePowerMultiplier = EnginePowerMultiplier * 9.2
	elseif Make == EnumMake.Iceborn then EnginePowerMultiplier = EnginePowerMultiplier * (ForceFactor / 2250 * 1.0093333333333334 * 1.05)
	elseif Make == EnumMake.Tanker then EnginePowerMultiplier = EnginePowerMultiplier * 3
	elseif Make == EnumMake.Revox then EnginePowerMultiplier = EnginePowerMultiplier * 1.830907534246575
	elseif Make == EnumMake.Deja then EnginePowerMultiplier = EnginePowerMultiplier * 2
	elseif Make == EnumMake.McLaren then EnginePowerMultiplier = EnginePowerMultiplier * 1.3
	elseif Make == EnumMake.Cobra then EnginePowerMultiplier = EnginePowerMultiplier * 1.7
	elseif Make == EnumMake.Expeditioner then EnginePowerMultiplier = EnginePowerMultiplier * 1.6
	elseif Make == EnumMake.Wraith then EnginePowerMultiplier = EnginePowerMultiplier * 1.3
	elseif Make == EnumMake.Badger then EnginePowerMultiplier = EnginePowerMultiplier * 1.5
	elseif Make == EnumMake.Mustang then EnginePowerMultiplier = EnginePowerMultiplier * 1.25
	end

	-- Apply EngineSpeedMult and GarageEngineSpeed upgrades.
	if p.EngineSpeedMult then
		EnginePowerMultiplier = EnginePowerMultiplier * p.EngineSpeedMult -- Apply general speed multiplier.
	end
	EnginePowerMultiplier = EnginePowerMultiplier + p.GarageEngineSpeed -- Add garage engine upgrade bonus.

	-- Add a bonus to cars *not* in the NotEngineBoost table (presumably smaller/faster cars?).
	if not NotEngineBoost[Make] then
		EnginePowerMultiplier = EnginePowerMultiplier + 0.5
	end

	-- Final Engine Thrust calculation.
	EngineThrust = EngineForce * EffectiveGearRatio * EnginePowerMultiplier -- Base force * gear ratio * total multiplier.

	-- Check for water material below the car (raycast upwards for some reason?) and reduce thrust.
	local _, _, _, Normal = RayCast.RayIgnoreNonCollide(EngineCFrame * v3(0, 0, EngineHalfSize.Z - 1), EngineCFrame:VectorToWorldSpace(Vector3.new(0, -1, 0)) * Height * 2, Model, nil, IsDelorean) -- This is the same raycast as the terrain check. Re-using it.
	-- Check the material hit by the *terrain* raycast.
	if Normal and (Normal == Enum.Material.Water and not IsDelorean) then -- If hit water material (and not Delorean).
		EngineThrust = EngineThrust * 0.625 -- Reduce thrust significantly in water.
	end

	-- Sum up all forces to get the total ThrustForce applied to the main engine thruster.
	local ThrustForce = DragForce + RollingResistance -- Combine drag and rolling resistance.
	if Forward ~= 0 and Forward == Forward then -- If there's active forward/backward input (and Forward is not NaN).
		ThrustForce = ThrustForce + EngineThrust -- Add engine thrust.
		p.LastForward = Forward / abs(Forward) -- Store last forward direction (sign).
	end

	-- If no forward input: apply braking force or full stop at very low speed.
	if Forward == 0 then
		if Speed <= 1 then
			Engine.AssemblyLinearVelocity = Vector3.new(0, 0, 0) -- Stop car completely if speed is very low.
		else
			ThrustForce = ThrustForce + ForwardForce -- Apply forward braking force.
		end
	end

	-- If handbraking/drifting without other inputs: apply stronger braking forces.
	if ShouldDrift and (Heading == 0 and Forward == 0) then
		ThrustForce = ThrustForce + ForwardForce * 3 + BrakingForce -- Add stronger forward brake and lateral brake.
	end

	ThrustForce = ThrustForce + NitroForce -- Add nitro force.

	-- Add PopForce if tires are popped.
	if PopForce ~= nil then
		ThrustForce = ThrustForce + PopForce
	end

	-- Update terrain sounds based on surface material.
	local GrassRatio = 0
	local AsphaltRatio = 0
	local SandstoneRatio = 0
	local RotY = p.RotY -- Current smoothed steering rotation.
	RotY = RotY + (Heading - RotY) * 0.1 -- Smooth interpolation towards raw Heading.
	p.RotY = RotY -- Store smoothed rotation.

	-- Check the material hit by the terrain raycast.
	if Hit then -- If the terrain raycast hit something.
		if Normal == Enum.Material.Grass then
			GrassRatio = 0.4
		elseif Normal == Enum.Material.Concrete or (Normal == Enum.Material.Basalt or Normal == Enum.Material.Asphalt) then
			AsphaltRatio = 0.94
		elseif Normal == Enum.Material.Sandstone or Normal == Enum.Material.Sand then
			SandstoneRatio = 0.5
		end

		-- Calculate steering effectiveness factor (decreases with speed, increased by drift).
		local SteeringFactor = math.exp(-max(RelativeVelocity.magnitude, 120) / 400) * (ShouldDrift and 1.5 or 1.2)
		local LastForward = -RelativeVelocity.Z / abs(RelativeVelocity.Z) -- Current forward direction based on Z velocity.
		if LastForward ~= LastForward then LastForward = 0 end -- NaN check.

		-- Update LastForward flag if the car changes direction significantly (and not drifting).
		if p.LastForward ~= LastForward and (abs(RelativeVelocity.Z) > 2 and not ShouldDrift) then
			p.LastForward = LastForward
		end

		-- Adjust BodyAngularVelocity MaxTorque based on steering input.
		if Heading == 0 then -- If no steering input.
			if RelativeVelocity.Z < 0 and not ShouldDrift then -- If reversing and not drifting.
				Rotate.MaxTorque = v3(0, Mass * 2, 0) -- Reduced steering torque while reversing.
			end
		else -- If active steering input.
			Rotate.MaxTorque = v3(0, Mass * 30, 0) -- High steering torque.
		end

		-- Apply angular velocity for steering.
		Rotate.AngularVelocity = v3(0, vHeading * TurnSpeed * p.LastForward * SteeringFactor * TractionSpeedFactor, 0) -- Scaled by smoothed heading, turn speed, forward direction, steering factor, and traction speed factor.
	else -- If the terrain raycast didn't hit anything (car is in the air).
		-- Disable driving forces and reduce rotation torque.
		Rotate.MaxTorque = v3(Mass * 0.5, Mass, Mass * 0.5) -- Limited rotation torque in air.
		ThrustForce = v3b -- No forward/backward thrust.
		lateralFrictionForce = v3b -- No lateral friction.
	end

	-- Apply the calculated ThrustForce to the main engine BodyThruster.
	if CanDrive then -- Only apply if the thruster is enabled.
		EngineThruster.Drive.Force = ThrustForce
	end
	-- Apply the calculated lateral friction force (lateralFrictionForce) converted to world space.
	EngineThruster.Friction.Force = EngineCFrame:VectorToWorldSpace(lateralFrictionForce)

	-- Vehicle flip detection.
	-- Get rotation components from engine CFrame.
	local _, _, _, _, _, _, _, VehicleYRotation, _, _, _, _ = EngineCFrame:GetComponents() -- GetComponents returns 12 values, 8th is Y rotation in radians.
	-- Check if the car is significantly upside down (Y rotation magnitude > 0.25 radians, roughly 14 degrees).
	if VehicleYRotation < -0.25 then -- Check only negative Y rotation? This seems incorrect for detecting upside down. Likely meant math.abs(VehicleYRotation) > someValue.
		if p.UpsideDownTime then
			-- If already counting, check if more than 2 seconds have passed since the timer started.
			if tick() - p.UpsideDownTime > 2 then
				p.UpsideDownTime = nil -- Reset timer.
				-- Fire a server event to request flipping the vehicle.
				-- The string is likely obfuscated: "nk5tv62me" -> "k5t" reversed is "t5k", "lu9dqpp" -> "q" reversed is "q". Result: "t5kq2l".
				Event:FireServer("n" .. ("k5tv62me"):sub(5, 7):reverse() .. "" .. "" .. ("lu9dqpp"):sub(5, 5):reverse() .. "t2l", Model) -- Likely "t5kq2l" event name.
			end
		else
			p.UpsideDownTime = tick() -- Start timer when first detected as potentially upside down.
		end
	else
		p.UpsideDownTime = nil -- Reset timer if not upside down.
	end

	-- Environmental sound logic (City, Tunnel, Outside).
	local CurrentEnvironment = nil -- Default environment.
	if not IsStudio or IsStudio and Settings.Test.RegionSounds then -- Only check region sounds if not in Studio (or if specifically enabled for testing).
		local Prism = Settings.Prism.City -- Get the definition of the city region.
		if Region.CastPoint(Prism, Engine.Position) then -- Check if the car is within the city region using its Engine position.
			CurrentEnvironment = "City"
		end
	end
	-- Check if inside a tunnel by casting upwards from slightly ahead of the engine.
	local Hit, _ = RayCast.RayIgnoreNonCollide(EngineCFrame * v3(0, 0, EngineHalfSize.Z - 1), EngineCFrame:VectorToWorldSpace(Vector3.new(0, 1, 0)) * 20, Model) -- Raycast upwards 20 studs.
	local LastEnvironment = Hit and "Tunnel" or (CurrentEnvironment or "Outside") -- Determine current environment: Tunnel if upward ray hits, else City if in city region, else Outside.

	-- If the environment changed, start a transition.
	if p.LastEnvironment ~= LastEnvironment then
		-- Set transition speed (faster for tunnels).
		p.TransitionSpeed = 1 / ((LastEnvironment == "Tunnel" or p.LastEnvironment == "Tunnel") and 0.5 or 4) -- 0.5 seconds for tunnel transition, 4 seconds otherwise.
		p.EnvironmentTransition = true -- Flag to indicate transition is active.
		p.LastEnvironment = LastEnvironment -- Update the stored last environment.
		Transition = 0 -- Reset global transition progress.
		-- Store the starting values for the transition for each sound effect (Echo, Equalizer, Reverb).
		for Effect, Options in pairs(SoundOptions) do
			p[Effect] = {} -- Create a table to store starting values for this effect.
			for _, Option in pairs(Options) do
				p[Effect][Option] = SoundEffects[Effect][Option] -- Store the current value of the sound effect property.
			end
		end
	end

	-- Smoothly interpolate sound properties during the transition.
	if p.EnvironmentTransition then
		local Values = SoundValues[LastEnvironment] -- Get target sound values for the new environment.
		Transition = Transition + dt * p.TransitionSpeed -- Increment global transition progress based on delta time and speed.
		for Effect, Options in pairs(SoundOptions) do -- Iterate through each sound effect.
			for _, Option in pairs(Options) do -- Iterate through each property option.
				local Last = p[Effect][Option] -- Starting value stored previously.
				local Value = Values[Effect][Option] -- Target value from the new environment preset.
				-- Linear interpolation between Last and Value based on global Transition progress (0 to 1).
				SoundEffects[Effect][Option] = Last * (1 - Transition) + Value * Transition
			end
		end
		if Transition >= 1 then -- If transition is complete (progress >= 1).
			p.EnvironmentTransition = false -- End transition.
		end
	end

	-- Vehicle-specific update logic (Rattler, Shogun).
	if Make == EnumMake.TheRattler then
		local t = os.clock() -- Current time (using os.clock).
		local IsAccel = math.abs(Forward) > 0.01 -- Flag if there is significant forward/backward input.
		-- Trigger engine rattle spring acceleration periodically.
		if (IsAccel and 0.1 or 0.2) < t - p.LastEngineRattle then -- Shorter interval when accelerating.
			p.LastEngineRattle = t -- Update last rattle time.
			-- Add a random impulse to the spring.
			p.SpringEngineRattle:Accelerate(Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1) * (IsAccel and 4 or 2)) -- Stronger impulse when accelerating.
		end
		-- Update engine flaps spring target based on acceleration state.
		local FlapsSpring -- Variable to store the spring's current value after updating.
		if IsAccel then
			FlapsSpring = p.SpringEngineFlaps:SetTarget(1) -- Target 1 when accelerating.
		else
			FlapsSpring = p.SpringEngineFlaps:SetTarget(0) -- Target 0 otherwise.
		end
		-- Update engine rattle spring and apply its displacement to the engine body Motor.
		local RattlePos = p.SpringEngineRattle:Update()
		Model.Preset.RattlerEngine.EngineBody["EngineBody->Engine"].C1 = cf(RattlePos) -- Update Motor C1.
		-- Update engine flaps spring and apply its value to the engine flaps Motor's C1 (relative to its C0).
		local FlapsMotor = Model.Preset.RattlerEngine.EngineFlaps["EngineFlaps->Engine"]
		FlapsMotor.C1 = FlapsMotor.C0:Inverse() * CFrame.Angles(FlapsSpring * -(math.pi) * 0.45, 0, 0) * FlapsMotor.C0 -- Apply rotation based on spring value.
		-- Toggle smoke and fire particles based on acceleration state.
		for _, Smoke in ipairs(p.RattleSmoke) do
			Smoke.Enabled = not IsAccel -- Smoke is enabled when NOT accelerating.
		end
		for _, Fire in ipairs(p.RattleFire) do
			Fire.Enabled = IsAccel -- Fire is enabled when accelerating.
		end
	elseif Make == EnumMake.Shogun then
		local LastEngineRattle = os.clock() -- Current time (using os.clock).
		local Enabled = math.abs(Forward) > 0.01 -- Flag if there is significant forward/backward input.
		-- Trigger engine rattle spring acceleration periodically.
		if (Enabled and 0.05 or 0.1) < LastEngineRattle - p.LastEngineRattle then -- Shorter interval when accelerating.
			p.LastEngineRattle = LastEngineRattle -- Update last rattle time.
			-- Add a random impulse to the rattle spring.
			p.SpringEngineRattle:Accelerate(Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1) * (Enabled and 3 or 2)) -- Stronger impulse when accelerating.
		end
		local RattlePos = p.SpringEngineRattle:Update() -- Update engine rattle spring.
		-- Apply the spring displacement to Engine Motors.
		for _, Motor in p.RattleMotors do
			Motor.motor.C1 = cf(RattlePos) -- Update Motor C1.
		end
		-- Toggle rattle particles based on acceleration state.
		for _, Particle in p.RattleParticles do
			Particle.Enabled = Enabled -- Particles are enabled when accelerating.
		end
	end

	-- Toggle brake trails visual effect based on brakelight state.
	if p.BrakeTrails then
		for _, BrakeTrail in p.BrakeTrails do
			BrakeTrail.Enabled = p._flagBrakelightsEnabled -- Enable trails if brakelights are on.
		end
	end

	-- Apply the anti-gravity force (gravityOffset) to the BodyForce (Lift).
	local gravityOffset = p.gravityOffset -- Get the pre-calculated anti-gravity force magnitude.
	-- Set Lift force, but zero it out if the vehicle is flagged as being picked up (e.g., by a cargo plane).
	local PickupForce = p.Model:FindFirstChild("IsPickedUp") and 0 or gravityOffset
	p.Lift.Force = v3(0, PickupForce, 0) -- Apply the force in the upward direction.
end

-- Main update function, called every frame (likely on Heartbeat).
-- Orchestrates the physics and state updates.
function m.Update(p, dt)
	p._didAnyWheelDrift = false -- Reset the flag indicating if any wheel drifted this frame.

	-- Check if accelerating input is held (W).
	local isAccelHeld = WASDQE[1] - WASDQE[3] > 0
	-- Trigger turbo blow-off sound when accelerating input is released, speed is high, and enough time has passed.
	if not isAccelHeld and (p.isAccelHeld ~= isAccelHeld and p.Model.PrimaryPart.AssemblyLinearVelocity.Magnitude > 50) then -- Check if input *just* changed from held to not held, and speed is high.
		local t = os.clock() -- Current time (using os.clock).
		if p.turboBlowOff and t - (p.lastTurboBlowOff or 0) > 1 then -- If turbo blow-off sound exists and 1 second cooldown has passed.
			p.lastTurboBlowOff = t -- Update last blow-off time.
			p.turboBlowOff.PlaybackSpeed = 1 + (math.random() * 0.1 - 0.05) -- Add slight random pitch variation.
			p.turboBlowOff:Play() -- Play the sound.
		end
	end
	p.isAccelHeld = isAccelHeld -- Store current acceleration held state.

	-- Call UpdateEngine for each engine thruster (usually just one main one).
	for _, EngineThruster in p.EngineThrusters do
		m.UpdateEngine(p, EngineThruster, dt)
	end

	-- If the overall drift state changed this frame.
	if p.Model:GetAttribute("VehicleIsDrifting") ~= p._didAnyWheelDrift then
		p.Model:SetAttribute("VehicleIsDrifting", p._didAnyWheelDrift) -- Update the attribute on the model (accessible by server/other scripts).
		p.Model:FindFirstChild("RelayDriftingRemote"):FireServer(p._didAnyWheelDrift) -- Fire a server event to notify others.
	end
end

-- Update function specifically called on Stepped (before frame rendering).
-- Often used for visual updates or IK.
function m.UpdateStepped(p)
	local Model = p.Model
	-- Update IK for steering wheel (player's arms).
	if p.IK then
		local Angle = 0.6 * p.RotY -- Calculate steering wheel rotation based on car's smoothed Y rotation.
		p.WeldSteer.C0 = cfa(0, Angle, 0) -- Apply rotation to the steering wheel's weld (relative to its C0).
		local SteerCFrame = Model.Steer.CFrame
		local SteerHalfWidth = Model.Steer.Size.X * 0.5 - 0.2
		local SteerOffset = p.SteerOffset -- Vertical/forward offset stored in VehicleEnter.
		local IKPacket = p.IK -- Get the IK packet.
		-- Set target positions for the hands in world space.
		local RightArm = v3(SteerHalfWidth, 0.1, 0) -- Base right arm position relative to steering center.
		if SteerOffset then
			RightArm = RightArm + SteerOffset -- Add stored offset.
		end
		local LeftArm = v3(-SteerHalfWidth, 0.1, 0) -- Base left arm position relative to steering center.
		if SteerOffset then
			LeftArm = LeftArm + SteerOffset -- Add stored offset.
		end
		IKPacket.RightArm = SteerCFrame * RightArm -- Convert local target to world space.
		IKPacket.LeftArm = SteerCFrame * LeftArm -- Convert local target to world space.
		-- Set target angles for the arms to simulate gripping and turning the wheel.
		IKPacket.RightAngle = -Angle - 0.6 -- Angle adjusted by steering rotation.
		IKPacket.LeftAngle = -Angle + 0.6 -- Angle adjusted by steering rotation.

		R15IKv2.Arms(IKPacket) -- Apply IK to move the character's arms.
	end
end

-- Called every frame after the physics step (Heartbeat).
-- Used for visual updates or resetting forces that should not persist.
function m.UpdateForces(p, EngineThruster, dt)
	for _, Thruster in p.Wheels do -- Iterate through the table of wheel data.
		-- Call UpdateThruster for each wheel. Note the parameters passed.
		UpdateThruster(p, Thruster, EngineThruster, dt) -- Passes p, wheel data, engine data, and dt.
	end
end

-- Halts all vehicle movement immediately.
function m.Halt(p)
	-- Set Engine Thruster forces to zero.
	for _, EngineThruster in p.EngineThrusters do
		EngineThruster.Drive.Force = Vector3.new(0, 0, 0)
		EngineThruster.Friction.Force = Vector3.new(0, 0, 0)
	end
	p.Rotate.MaxTorque = Vector3.new(0, 0, 0) -- Set steering torque to zero.
end

-- Puts the vehicle into a spin-out state.
function m.SpinOut(p)
	p._spinOutAt = os.clock() -- Record the current time to start the spin-out timer.
end

-- Reference to VehicleUtils module (already required at the top).
local VehicleUtils = require(ReplicatedStorage.Vehicle.VehicleUtils) -- Redundant require?

-- Attempts to fire a missile from "TheAgent" vehicle.
function m.AttemptFireMissile(p)
	local Missiles = p.Missiles -- Get the missile data table.
	if not Missiles then -- Exit if vehicle doesn't have missiles setup.
		return false
	end

	-- Check if the player has missiles available.
	if LocalPlayer:GetAttribute("MissileCount") <= 0 then
		VehicleUtils.promptMissileBuy() -- Prompt the player to buy more missiles.
		return false -- Don't fire if no missiles.
	end

	-- Implement firing cooldown.
	local t = tick() -- Current time.
	local dt = t - Missiles.LastFire -- Time since last fire.
	if dt < 1 and dt > 0 then -- If less than 1 second has passed since last fire (and not the very first fire).
		return false -- Cooldown active, cannot fire.
	end
	Missiles.LastFire = t -- Record the time of this fire.

	-- Get the next missile part from the cycling list.
	local Part = Missiles.Parts[Missiles.i]
	Part.Transparency = 1 -- Make the missile part invisible briefly.
	delay(2, function() -- Use delay to make it visible again after 2 seconds.
		Part.Transparency = 0
	end)

	local MissileCFrame = Part.CFrame -- Get the starting CFrame of the missile.
	local MissileVelocity = Part.Velocity -- Get the starting velocity of the missile.
	-- Create an ignore list including the car model and the player character.
	local IgnoreList = { p.Model, LocalPlayer.Character }
	-- Calculate the target direction (ahead of the car, slightly downwards).
	local Direction = (p.Model.Engine.CFrame.LookVector * 60 - Vector3.new(0, 2, 0)).Unit -- Vector 60 studs ahead, offset 2 studs down, then normalize.
	-- Raycast to find a target position in that direction (up to 999 studs), ignoring specified parts.
	local _, Pos = RayCast.RayIgnoreNonCollideWithIgnoreList(MissileCFrame.p, Direction * 999, IgnoreList) -- Raycast from missile origin.

	local Now = Time.GetNowSync() -- Get current synced game time.

	-- Fire a server event to launch the missile on the server.
	Event:FireServer("LaunchMissile", MissileCFrame, MissileVelocity, Pos, Now, "RocketPart2", 0) -- Pass missile start data and target position.

	-- Also launch the missile locally for client prediction/visual effect.
	Missile.LaunchMissile(MissileCFrame, MissileVelocity, Pos, Now, "RocketPart2", 0, IgnoreList)

	-- Cycle to the next missile part.
	Missiles.i = Missiles.i % #Missiles.Parts + 1
end

--// INPUT HANDLING //--
-- Lookup table to map KeyCodes to indices in the WASDQE state table.
-- This allows mapping different keys/buttons to the same logical input.
local InputLookup = {
	[Enum.KeyCode.W] = 1, [Enum.KeyCode.A] = 2, [Enum.KeyCode.S] = 3, [Enum.KeyCode.D] = 4, [Enum.KeyCode.Q] = 5, [Enum.KeyCode.E] = 6,
	[Enum.KeyCode.ButtonR2] = 1, [Enum.KeyCode.ButtonL2] = 3, -- Gamepad triggers for forward/backward.
	[Enum.KeyCode.Up] = 1, [Enum.KeyCode.Left] = 2, [Enum.KeyCode.Down] = 3, [Enum.KeyCode.Right] = 4 -- Arrow keys.
}

-- Called when a keyboard key is pressed.
function m.InputBegan(i)
	if i.UserInputType == Enum.UserInputType.Keyboard then
		local k = i.KeyCode
		if InputLookup[k] then WASDQE[InputLookup[k]] = 1 end -- Set input state to 1 (pressed).
	end
end

-- Called when a keyboard key or gamepad trigger is released.
function m.InputEnded(i)
	if i.UserInputType == Enum.UserInputType.Keyboard then
		local k = i.KeyCode
		if InputLookup[k] then WASDQE[InputLookup[k]] = 0 end -- Set input state to 0 (released).
	elseif i.UserInputType == Enum.UserInputType.Gamepad1 then
		local k = i.KeyCode
		if k == Enum.KeyCode.ButtonR2 or k == Enum.KeyCode.ButtonL2 then
			WASDQE[InputLookup[k]] = 0 -- Release analog triggers.
		end
	end
end

-- Called when a gamepad thumbstick or trigger changes.
function m.InputChanged(i)
	if i.UserInputType == Enum.UserInputType.Gamepad1 then
		local k = i.KeyCode
		if k == Enum.KeyCode.Thumbstick1 then -- Steering (left thumbstick).
			local v = i.Position -- Get the X, Y, Z position of the thumbstick (X for horizontal, Y for vertical).
			local x, y = v.x, v.y
			local th = 0.24 -- Deadzone: ignore small movements near center.
			WASDQE[2] = x < -th and (-x) ^ 2 or 0 -- Apply squared input for left turn.
			WASDQE[4] = x > th and x ^ 2 or 0 -- Apply squared input for right turn.
		elseif k == Enum.KeyCode.ButtonR2 or k == Enum.KeyCode.ButtonL2 then -- Analog throttle/brake.
			local v = i.Position
			local z = v.z -- Get the Z position, which typically represents trigger pressure.
			local th = 0.05 -- Deadzone.
			WASDQE[InputLookup[k]] = z > th and z ^ 0.5 or 0 -- Use square root for a better, less sensitive curve at low pressures.
		end
	end
end

--// INITIALIZATION //--
-- Function to allow the main vehicle script to pass in the server communication event.
function m.SetEvent(n)
	Event = n -- Assign the RemoteEvent for server communication.
end

-- This block handles interactions with special vehicle parts, like firetruck ladders.
do
	local CircleAction = UI.CircleAction -- Reference to a UI module function for interactive prompts.
	-- Callback function for the interaction.
	local function Callback(Spec, Processed)
		if Processed then
			Event:FireServer("ToggleLadder", Spec.Part) -- Tell the server to toggle the ladder.
		end
		return true
	end
	-- Function to add the interaction prompt to a part.
	local function AddedFun(Part)
		local Spec = {
			Part = Part,
			Name = "Toggle Ladder",
			NoRay = true, -- Does not require raycasting to activate (always visible).
			Timed = true, -- Requires holding down for a duration.
			Duration = 0.5, -- Hold duration.
			Dist = 10, -- Max distance from player to activate.
			Callback = Callback -- Function to call when activated.
		}
		CircleAction.Add(Spec, Part) -- Add the interactive prompt to the part.
	end
	-- Function to remove the interaction prompt.
	local function RemovedFun(Part)
		CircleAction.Remove(Part)
	end

	-- Connect to CollectionService to detect all parts tagged as "Firetruck_Ladder".
	-- This ensures that ladders are automatically interactive when added to the game.
	for _, v in next, CollectionService:GetTagged("Firetruck_Ladder") do
		AddedFun(v) -- Add interaction to existing tagged ladders.
	end
	CollectionService:GetInstanceAddedSignal("Firetruck_Ladder"):Connect(AddedFun) -- Connect to add interaction for new ladders.
	CollectionService:GetInstanceRemovedSignal("Firetruck_Ladder"):Connect(RemovedFun) -- Connect to remove interaction for removed ladders.
end

return m -- Return the main module table containing all chassis control functions.