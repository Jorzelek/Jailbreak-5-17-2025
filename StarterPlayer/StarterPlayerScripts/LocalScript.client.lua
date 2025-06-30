--[[
	LocalScript.lua
	
	Original Author: @badccvoid
	Improvements and Comments by: @jorzelek1 (Readability) and Gemini AI (Further Comments)

	Client-side main script for a Roblox game, likely Jailbreak or a similar large-scale experience.
	This script handles a vast array of client-side logic, including:
	- Initializing core game systems and modules.
	- Processing player input for movement, vehicle control, and interactions.
	- Managing UI elements and displaying notifications.
	- Simulating client-side physics and visual effects for vehicles and characters.
	- Handling player state (health, money, inventory, team).
	- Communicating with the server via a custom, obfuscated remote event system.
	- Implementing client-side anti-cheat measures.
	- Managing dynamic world elements like doors, proximity interactions, and weather.

	This is a large, complex script designed for performance and security in a live game environment.
]]

--// SERVICES & MODULES //--
-- Standard Roblox services are fetched for core functionality.
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Provides access to assets replicated between client and server.
local RunUtils = require(ReplicatedStorage.App.RunUtils) -- Utility functions related to the game's execution environment (e.g., checking if in Studio).
local MarketplaceService = game:GetService("MarketplaceService") -- Handles in-game purchases, developer products, and game passes.
local RunService = game:GetService("RunService") -- Provides events that fire every frame, crucial for game loops and updates.
local IsStudio = RunUtils.isStudio() -- Boolean flag: true if the game is currently running in Roblox Studio.
local UserInputService = game:GetService("UserInputService") -- Manages user input from various devices (keyboard, mouse, gamepad, touch).
local TouchEnabled = UserInputService.TouchEnabled -- Boolean flag: true if the client device supports touch input.
game:GetService("GuiService") -- Provides access to Roblox's core GUI features (fetched but not assigned to a variable).
local SoundService = game:GetService("SoundService") -- Manages sound properties and sound effects within the game.
local Players = game:GetService("Players") -- Manages players in the game, including their character models and data.
local LocalPlayer = Players.LocalPlayer -- Reference to the player currently executing this local script.
local CurrentCamera = workspace.CurrentCamera -- Reference to the game's current active camera.

-- Custom modules for various game systems are required from ReplicatedStorage.
local R15IKv2 = require(ReplicatedStorage.Module.R15IKv2) -- Inverse Kinematics module for R15 character rigs, likely used for animating player limbs (e.g., on a steering wheel).
local UI = require(ReplicatedStorage.Module.UI) -- Custom User Interface module, possibly for managing UI elements and interactions.
local CollectionService = game:GetService("CollectionService") -- Allows tagging game objects for easy retrieval and binding of logic.
local Joint = require(ReplicatedStorage.Std.Joint) -- Standard library module for joint manipulation, likely for creating/breaking welds.
local m = require(ReplicatedStorage.Module.Math) -- Custom Math utility module, potentially containing functions for vector math, GUID generation, or custom easing.
local AlexParticles = require(ReplicatedStorage.Module.AlexParticles) -- Custom particle effects module for visual effects.
local AlexWM = require(ReplicatedStorage.Module.AlexWM) -- Custom Window Manager module, likely for creating and managing draggable/resizable UI windows.
local Settings = require(ReplicatedStorage.Resource.Settings) -- Module containing game-wide settings and configuration data.
local StarterGui = game:GetService("StarterGui") -- Manages the initial GUI elements that are cloned to a player's PlayerGui.
local ChinaPolicyService = require(ReplicatedStorage.Resource.ChinaPolicyService) -- Module to handle specific policy adjustments for the China region.
local Localization = require(ReplicatedStorage.Module.Localization) -- Module for translating in-game text into different languages.
local Raycast = require(ReplicatedStorage.Std.Raycast) -- Standard library module for raycasting operations.
local Audio = require(ReplicatedStorage.Std.Audio) -- Standard library module for managing audio playback.
local GameUtil = require(ReplicatedStorage.Game.GameUtil) -- General game utility functions and shared game state.
local RunConsts = require(ReplicatedStorage.App.RunConsts) -- Constants defining different game environments (e.g., development, QA, production).
local RxInstanceUtils = require(ReplicatedStorage.Std.RxInstanceUtils) -- Utilities for reacting to changes in Roblox Instances (e.g., property changes, child added).
local Binder = require(ReplicatedStorage.Std.Binder) -- A system for automatically connecting client-side logic to game objects tagged with specific names.
local TableUtils = require(ReplicatedStorage.Std.TableUtils) -- Standard library module for common table manipulation functions.
local PartUtils = require(ReplicatedStorage.Std.PartUtils) -- Standard library module for common BasePart manipulation functions.
local Maid = require(ReplicatedStorage.Std.Maid) -- A utility class for managing and cleaning up Roblox connections and objects automatically.
local waitForChild = require(ReplicatedStorage.Std.waitForChild) -- Utility function to safely wait for a child object to appear.
local GameSettingsService = require(ReplicatedStorage.GameSettings.GameSettingsService) -- Manages player-specific game settings (e.g., graphics, audio preferences).
local gameSettingType = require(ReplicatedStorage.GameSettings.gameSettinagType) -- An enum-like module defining types for game settings (e.g., Checkbox, Slider).
local TradeService = require(ReplicatedStorage.Trade.TradeService) -- Manages in-game trading functionality between players.
local HandcuffsConfig = require(ReplicatedStorage.Game.ItemConfig.Handcuffs) -- Configuration data specific to the Handcuffs item.
local TradeUtils = require(ReplicatedStorage.Trade.TradeUtils) -- Utility functions related to the trading system.
local MovementConsts = require(ReplicatedStorage.Movement.MovementConsts) -- Constants related to player movement speeds and states.
local WorldUnloadUtils = require(ReplicatedStorage.WorldUnload.WorldUnloadUtils) -- Utilities for managing streaming and unloading of world objects based on distance.
local HumanoidUnloadUtils = require(ReplicatedStorage.HumanoidUnload.HumanoidUnloadUtils) -- Utilities for managing streaming and unloading of Humanoid characters.
local DestructibleUtils = require(ReplicatedStorage.Game.Destructible.DestructibleUtils) -- Utilities for managing destructible game objects.
local StreamingHelperUtils = require(ReplicatedStorage.App.StreamingHelperUtils) -- Helper functions related to Roblox's streaming enabled feature.
local ItemUtils = require(ReplicatedStorage.App.ItemUtils) -- General utility functions for in-game items.
local TextChatService = game:GetService("TextChatService") -- Provides access to the new TextChatService for displaying chat messages.
local RichTextUtils = require(ReplicatedStorage.Std.RichTextUtils) -- Utilities for formatting text with Roblox's RichText markup.

-- CFrame and Vector3 shortcuts for cleaner code and minor performance optimization.
local cf, cfa, v3 = CFrame.new, CFrame.Angles, Vector3.new -- Aliases for CFrame and Vector3 constructors.
local cfb, v3b = cf(0, 0, 0), v3(0, 0, 0) -- Pre-defined identity CFrame and zero Vector3 for common use.
local RayNew = Ray.new -- Alias for the Ray.new constructor.
local sin = math.sin -- Alias for the math.sin function.
local floor, abs, ln, max = math.floor, math.abs, math.log, math.max -- Aliases for common math functions.

-- Prints the build version if the game is running outside of Roblox Studio, for debugging live servers.
if not RunUtils.isStudio() then
	print("Build:", "02 May @ 04:06 PM EDT @fa22119")
end

--// CUSTOM REMOTE EVENT SYSTEM //--
-- This section sets up a secure and obfuscated remote event system for client-server communication.
-- Obfuscated event names (e.g., "d0u6cxwg") are used to deter reverse engineering and provide some level of security.
local ConnectEvents -- Forward declaration for the function responsible for connecting remote events.
local GenericRemoteEvent = waitForChild(ReplicatedStorage, "GenericRemoteEvent", 30):catch(warn) -- A single generic RemoteEvent, typically shared for all client-server communication, waited for with a timeout.
local RandomEvent -- Will store the reference to GenericRemoteEvent after its name has been randomized.
local em = {} -- Event Map (`em`): A dispatch table that maps incoming obfuscated event names (from the server) to corresponding client-side handler functions.

-- Creates multiple fake RemoteEvents in ReplicatedStorage. This is a common anti-exploit technique to clutter the environment
-- and make it harder for exploiters to identify legitimate remote events.
for _ = 1, 10 do
	local FakeRemoteEvent = Instance.new("RemoteEvent")
	FakeRemoteEvent.Name = m.GUID() -- Assigns a randomly generated GUID (Globally Unique Identifier) as its name.
	FakeRemoteEvent.Parent = ReplicatedStorage.Resource
end

local Encrypters -- This variable will hold a table mapping readable event names to their obfuscated counterparts, received from the server.
local Event = {} -- Public API (`Event`): This table exposes functions for firing events to the server, providing a clean interface.
local EventFireServer -- An internal helper function for firing events to the server.
-- A direct reference to the raw `FireServer` method of a new, temporary `RemoteEvent` instance. This can be used for performance
-- or to ensure that the `FireServer` method being called is the original one, potentially as an anti-tamper measure.
local FireServer = Instance.new("RemoteEvent").FireServer
do    
	-- This function serves as a wrapper for sending events to the server.
	function EventFireServer(n, ...) -- `n` is the readable event name, `...` are the arguments.
		-- If the `Encrypters` map exists (meaning the encryption keys have been received from the server),
		-- it uses the obfuscated name (`Encrypters[n]`). Otherwise, it sends the original readable name.
		FireServer(RandomEvent, Encrypters and Encrypters[n] or n, ...)
	end
	-- Exposes the `EventFireServer` functionality through the `Event` table under the `FireServer` key.
	-- The `_` parameter is a convention for the `self` argument in method calls, indicating it's not used here.
	function Event.FireServer(_, n, ...) -- `n` is the readable event name, `...` are the arguments.
		return EventFireServer(n, ...)
	end
	-- This function (`em.d0u6cxwg`) is a client-side handler that the server specifically calls.
	-- Its purpose is to provide the client with the `Encrypters` map (obfuscation keys).
	function em.d0u6cxwg(t) -- `d0u6cxwg` is an obfuscated name (likely "ReceiveEncryptionMap" or similar). `t` is the encryption map.
		em.hems = true -- Sets a flag (`em.hems`) indicating that the encryption system is now active.
		Encrypters = t -- Stores the received encryption map.
	end
	-- This is the main handler function for all incoming generic client events from the server.
	local function OnClientEvent(n, ...) -- `n` is the obfuscated event name received from the server.
		-- Asserts that a corresponding handler function exists in the `em` table for the received obfuscated event name.
		-- If a handler is found, it is executed with the provided arguments.
		assert(em[n], "Invalid client event received: "..tostring(n))(...)
	end
	-- This function is responsible for connecting the client-side event handling system.
	function ConnectEvents()
		local Found, GenericGameEvent = GenericRemoteEvent:await() -- Waits for the `GenericRemoteEvent` to become available in `ReplicatedStorage`.
		if not Found then
			error("Bad error... could not find `GenericGameEvent`") -- Critical error if the event isn't found within the timeout.
		end
		GenericGameEvent.Name = m.GUID() -- Randomizes the name of the `GenericGameEvent` to further complicate reverse engineering attempts.
		RandomEvent = GenericGameEvent -- Stores the reference to the now-randomized `GenericGameEvent`.
		GenericGameEvent.OnClientEvent:Connect(OnClientEvent) -- Connects the `OnClientEvent` function as the listener for all incoming events on this generic remote.
	end
end

--// GUI INITIALIZATION //--
-- This section configures Roblox's default GUI behavior and initializes custom ScreenGuis.
StarterGui.ResetPlayerGuiOnSpawn = false -- Prevents Roblox from automatically resetting a player's GUI elements when their character respawns.
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui") -- Safely retrieves the `PlayerGui` folder for the local player.
local Team = LocalPlayer:WaitForChild("TeamValue") -- Retrieves the `TeamValue` `StringValue` object, which stores the player's current team.

-- Helper function to efficiently get or create a `ScreenGui` instance for the player.
-- If the `ScreenGui` with the given `Name` already exists in `PlayerGui`, it returns it.
-- Otherwise, it clones a pre-made `ScreenGui` from `ReplicatedStorage.StarterGui` and parents it to `PlayerGui`.
local function GetScreenGui(Name)
	local ScreenGui = PlayerGui:FindFirstChild(Name)
	if not ScreenGui then
		ScreenGui = ReplicatedStorage.StarterGui:FindFirstChild(Name):Clone()
		ScreenGui.Parent = PlayerGui
	end
	return ScreenGui
end
local ScreenGui = GetScreenGui("MainGui") -- Initializes the primary game UI screen.
local ProductGui = GetScreenGui("ProductGui") -- Initializes the GUI for displaying product and game pass purchase prompts.
local ParticlesGui = GetScreenGui("Particles") -- Initializes the GUI specifically for displaying screen-space particle effects (e.g., fireworks).
local DeathGui = GetScreenGui("DeathGui") -- Initializes the GUI displayed to the player upon death.

-- Initializes core UI components and disables Roblox's default backpack.
UI.CircleAction.Frame = ScreenGui.CircleAction -- Assigns a specific `Frame` within `ScreenGui` to be used by the `UI.CircleAction` module (for "Hold E to interact" prompts).
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false) -- Disables the built-in Roblox backpack UI, as the game likely uses a custom inventory system.

--// GAME SYSTEM INITIALIZATION //--
-- This large block systematically requires and initializes all the major client-side game systems and features.

-- Player, Inventory, and Item Systems
local PlayerUtils = require(ReplicatedStorage.Game.PlayerUtils) -- Module containing general utility functions related to players.
PlayerUtils.init() -- Initializes the `PlayerUtils` module.
local InventoryItemUtils = require(ReplicatedStorage.Inventory.InventoryItemUtils) -- Utility functions for managing inventory items.
local InventoryItemSystem = require(ReplicatedStorage.Inventory.InventoryItemSystem) -- Core system responsible for the player's inventory items (client-side).
local ItemSystem = require(ReplicatedStorage.Game.ItemSystem.ItemSystem) -- The central system for handling all in-game items (e.g., equipping, using).
ItemSystem.Init({ -- Initializes `ItemSystem`, passing necessary dependencies.
	em = em, -- Passes the event map for communicating with the server regarding item actions.
	Event = Event -- Passes the public API for firing server events.
})
require(ReplicatedStorage.Game.AmmoGui).Init({ -- Initializes the ammunition display UI.
	GetScreenGui = GetScreenGui -- Passes the GUI helper function.
})
-- Initializes and registers various specific item types with the `ItemSystem`.
-- Each item module typically handles its own client-side logic (e.g., animations, visual effects).
require(ReplicatedStorage.Game.Item.Gun).Init({ -- Initializes the base Gun module, used by all gun types.
	Event = Event,
	em = em
})
local Rifle = require(ReplicatedStorage.Game.Item.Rifle)
ItemSystem.Register(Rifle) -- Registers the Rifle item with `ItemSystem`.
local AK47 = require(ReplicatedStorage.Game.Item.AK47)
ItemSystem.Register(AK47) -- Registers the AK47 item.
local Pistol = require(ReplicatedStorage.Game.Item.Pistol)
ItemSystem.Register(Pistol) -- Registers the Pistol item.
local NerfPistol = require(ReplicatedStorage.Game.Item.NerfPistol)
ItemSystem.Register(NerfPistol) -- Registers the NerfPistol item.
local NerfRevolver = require(ReplicatedStorage.Game.Item.NerfRevolver)
ItemSystem.Register(NerfRevolver) -- Registers the NerfRevolver item.
local Shotgun = require(ReplicatedStorage.Game.Item.Shotgun)
ItemSystem.Register(Shotgun) -- Registers the Shotgun item.
local Uzi = require(ReplicatedStorage.Game.Item.Uzi)
ItemSystem.Register(Uzi) -- Registers the Uzi item.
local RocketLauncher = require(ReplicatedStorage.Game.Item.RocketLauncher)
ItemSystem.Register(RocketLauncher) -- Registers the RocketLauncher item.
local Grenade = require(ReplicatedStorage.Game.Item.Grenade)
ItemSystem.Register(Grenade) -- Registers the Grenade item.
local Sword = require(ReplicatedStorage.Game.Item.Sword)
Sword.Init({
	Event = Event
})
ItemSystem.Register(Sword) -- Registers the Sword item.
local Baton = require(ReplicatedStorage.Game.Item.Baton)
Baton.Init({
	Event = Event
})
ItemSystem.Register(Baton) -- Registers the Baton item.
local ForcefieldLauncher = require(ReplicatedStorage.Game.Item.ForcefieldLauncher)
ForcefieldLauncher.Init({
	Event = Event,
	em = em
})
ItemSystem.Register(ForcefieldLauncher) -- Registers the ForcefieldLauncher item.
local RoadSpike = require(ReplicatedStorage.Game.Item.RoadSpike)
RoadSpike.Init({
	Event = Event,
	em = em
})
ItemSystem.Register(RoadSpike) -- Registers the RoadSpike item.
local Turret = require(ReplicatedStorage.Game.Item.Turret)
ItemSystem.Register(Turret) -- Registers the Turret item.
local StuntTurret = require(ReplicatedStorage.Game.Item.StuntTurret)
ItemSystem.Register(StuntTurret) -- Registers the StuntTurret item.
local CarTurret = require(ReplicatedStorage.Game.Item.CarTurret)
ItemSystem.Register(CarTurret) -- Registers the CarTurret item.
local Key = require(ReplicatedStorage.Game.Item.Key)
ItemSystem.Register(Key) -- Registers the Key item.
local MansionInvite = require(ReplicatedStorage.Game.Item.MansionInvite)
ItemSystem.Register(MansionInvite) -- Registers the MansionInvite item.
local CCTV = require(ReplicatedStorage.Game.Item.CCTV)
ItemSystem.Register(CCTV) -- Registers the CCTV item.
local Donut = require(ReplicatedStorage.Game.Item.Donut)
Donut.Init({
	Event = Event
})
ItemSystem.Register(Donut) -- Registers the Donut item.
local Cuffed = require(ReplicatedStorage.Game.Item.Cuffed)
ItemSystem.Register(Cuffed) -- Registers the Cuffed item (likely a status effect item).
local Taser = require(ReplicatedStorage.Game.Item.Taser)
Taser.Init({
	Event = Event,
	em = em
})
ItemSystem.Register(Taser) -- Registers the Taser item.
local Glider = require(ReplicatedStorage.Game.Item.Glider)
Glider.Init({
	Event = Event
})
ItemSystem.Register(Glider) -- Registers the Glider item.
local Crate = require(ReplicatedStorage.Game.Item.Crate)
ItemSystem.Register(Crate) -- Registers the Crate item.
local Flashlight = require(ReplicatedStorage.Game.Item.Flashlight)
ItemSystem.Register(Flashlight) -- Registers the Flashlight item.
local Handcuffs = require(ReplicatedStorage.Game.Item.Handcuffs)
ItemSystem.Register(Handcuffs) -- Registers the Handcuffs item.
local ShieldSWAT = require(ReplicatedStorage.Game.Item.ShieldSWAT)
ItemSystem.Register(ShieldSWAT) -- Registers the ShieldSWAT item.
local Binoculars = require(ReplicatedStorage.Game.Item.Binoculars)
Binoculars.Init({
	ScreenGui = ScreenGui
})
ItemSystem.Register(Binoculars) -- Registers the Binoculars item.
local Bag = require(ReplicatedStorage.Game.Item.Bag)
ItemSystem.Register(Bag) -- Registers the Bag item.
local PlasmaPistol = require(ReplicatedStorage.Game.Item.PlasmaPistol)
ItemSystem.Register(PlasmaPistol) -- Registers the PlasmaPistol item.
local PlasmaShotgun = require(ReplicatedStorage.Game.Item.PlasmaShotgun)
ItemSystem.Register(PlasmaShotgun) -- Registers the PlasmaShotgun item.
local Revolver = require(ReplicatedStorage.Game.Item.Revolver)
ItemSystem.Register(Revolver) -- Registers the Revolver item.
local Sniper = require(ReplicatedStorage.Game.Item.Sniper)
ItemSystem.Register(Sniper) -- Registers the Sniper item.
local Flintlock = require(ReplicatedStorage.Game.Item.Flintlock)
ItemSystem.Register(Flintlock) -- Registers the Flintlock item.
require(ReplicatedStorage.Game.ItemSystem.ItemCamera).Init() -- Initializes camera logic specific to items (e.g., aiming).
require(ReplicatedStorage.Game.ItemSkin.ItemSkin).Init({ -- Initializes the system for managing item skins.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.ItemSkin.UI.UI).Init() -- Initializes the User Interface for item skins.
local C4 = require(ReplicatedStorage.Game.Item.C4)
C4.Init({
	Event = Event
})
ItemSystem.Register(C4) -- Registers the C4 item.
local SmokeGrenade = require(ReplicatedStorage.Game.Item.SmokeGrenade)
SmokeGrenade.Init({
	Event = Event
})
ItemSystem.Register(SmokeGrenade) -- Registers the SmokeGrenade item.
ItemSystem.Register(require(ReplicatedStorage.Game.Item.Gem)) -- Registers the Gem item.
local Juice = require(ReplicatedStorage.Game.Item.Juice)
Juice.Init({
	Event = Event,
	em = em
})
ItemSystem.Register(Juice) -- Registers the Juice item.

-- Initialize Police Report UI
local PoliceReportUI = require(ReplicatedStorage.Game.PoliceReportUI.PoliceReportUI) -- Module for displaying police reports.
PoliceReportUI.Init() -- Initializes the Police Report UI.
-- Server command handler (`em.jfppajz2`) to display a police report on the client.
function em.jfppajz2(Info) -- `jfppajz2` is an obfuscated name (likely "DisplayPoliceReportClient"). `Info` contains report data.
	PoliceReportUI.Display(Info) -- Calls the `Display` method of the `PoliceReportUI` module.
end

--// CUSTOM THREAD LOOP //--
-- This section sets up a custom scheduler to run multiple client-side functions at specific intervals.
-- This approach is more performant than creating many individual `RunService.Heartbeat:Connect` connections or `while true do wait()` loops,
-- as it centralizes updates into one main connection.
local ThreadLoopAdd -- Forward declaration for the function to add new entries to the custom loop.
local Loops = {} -- A table to store all registered loop entries.
function ThreadLoopAdd(i, c) -- `i` is the desired interval (in seconds), `c` is the callback function to execute.
	table.insert(Loops, {
		t = 0, -- `t`: Stores the `os.clock()` time of the last execution of this specific loop entry.
		i = i, -- `i`: The specified interval for this loop entry.
		c = c  -- `c`: The callback function for this loop entry. It will receive `t2` (current time) and `dt` (delta time) as arguments.
	})
end
local t = os.clock() -- Stores the `os.clock()` time of the last `Heartbeat` invocation. Used for calculating `dt`.
local function Stepped() -- This function is the primary callback connected to `RunService.Heartbeat`.
	local t2 = os.clock() -- Current `os.clock()` time for this frame.
	local dt = t2 - t -- `dt`: Delta time, the time elapsed since the last `Heartbeat` frame.
	t = t2 -- Updates `t` to the current time for the next `Heartbeat` calculation.
	debug.profilebegin("Thread Loop") -- Starts a profiling session for this block, useful for performance monitoring.
	-- Iterates through all registered loop entries.
	for i = 1, #Loops do
		local Loop = Loops[i]
		-- Checks if enough time (`Loop.i`) has passed since this loop entry's last execution (`Loop.t`).
		if t2 - Loop.t > Loop.i then
			Loop.t = t2 -- Updates the last execution time for this loop entry.
			Loop.c(t2, dt) -- Executes the callback function, passing the current time and delta time.
		end
	end
	debug.profileend() -- Ends the profiling session.
end
RunService.Heartbeat:Connect(Stepped) -- Connects the `Stepped` function to `RunService.Heartbeat`, ensuring it runs every physics frame.

--// CHARACTER & HOTBAR SYSTEMS //--
local MainWindowGroup = AlexWM.MakeWindowGroup() -- Creates a new window group for managing multiple UI windows, likely controlling their z-index and interaction.
local CharacterBinder = require(ReplicatedStorage.App.CharacterBinder) -- A binder specific to `Character` instances, automatically connecting logic when characters are added/removed.
CharacterBinder:Start() -- Starts the `CharacterBinder`, making it active.
local CharacterUtil = require(ReplicatedStorage.Game.CharacterUtil) -- Utility functions related to player characters beyond basic Roblox API.
require(ReplicatedStorage.Inventory.InventorySystem).init() -- Initializes the client-side system for displaying and managing player inventory UI.
local HotbarSystem = require(ReplicatedStorage.Hotbar.HotbarSystem) -- Client-side system managing the player's hotbar UI and item selection.
HotbarSystem.init() -- Initializes the `HotbarSystem`.
-- Connects to `GameUtil.OnTeamChanged` signal to update the hotbar's visual color based on the player's new team.
GameUtil.OnTeamChanged:Connect(function(Team)
	HotbarSystem.setColor(Settings.TeamColor[Team]) -- Sets the hotbar color using a predefined color map from `Settings`.
end)
-- Connects to `HotbarItemBinder`'s `GetClassAddedSignal`. This likely triggers when a new type of item is registered for the hotbar,
-- ensuring the hotbar color is reset or re-applied.
require(ReplicatedStorage.Hotbar.HotbarItemBinder):GetClassAddedSignal():Connect(function()
	HotbarSystem.setColor(Settings.TeamColor[GameUtil.Team])
end)

--// BARBED WIRE CLIENT LOGIC //--
-- Uses a `Binder` to automatically attach client-side interaction logic to any `BasePart` tagged "BarbedWireClient".
Binder.new("BarbedWireClient", function(v) -- `v` is the `BasePart` instance tagged "BarbedWireClient".
	local mMaid = Maid.new() -- A `Maid` object for managing connections and cleaning up when the `v` part is removed.
	local t2 = 0 -- `t2`: Cooldown timer for applying damage from the barbed wire.
	mMaid:GiveTask(v.Touched:Connect(function(Hit) -- Connects to the `Touched` event of the barbed wire part. `Hit` is the part that touched it.
		local Character = LocalPlayer.Character
		if not Character then
			return -- If the local player's character doesn't exist, exit.
		end
		if Hit.Parent ~= Character then
			return -- If the `Hit` part does not belong to the local player's character, ignore.
		end
		local Humanoid = Character:FindFirstChild("Humanoid")
		if not Humanoid then
			return -- If the character lacks a `Humanoid`, ignore.
		end
		-- Checks if a valid `Limb` (e.g., Torso, Leg) was hit, not an accessory or an unknown part.
		if Humanoid:GetLimb(Hit) == Enum.Limb.Unknown then
			return
		end
		-- Applies damage to the player with a cooldown to prevent excessive damage ticks from continuous touching.
		local t = os.clock() -- Current time from `os.clock()`.
		if t - t2 >= 0.3 then -- If 0.3 seconds have passed since the last damage tick.
			t2 = t -- Reset the cooldown timer.
			local BarbedWireDamage = v:GetAttribute("BarbedWireDamage") or 30 -- Retrieves damage amount from the part's attribute, defaults to 30.
			assert(typeof(BarbedWireDamage) == "number") -- Asserts that the damage value is a number.
			-- Fires a remote event to the server to deal damage. The event name is obfuscated.
			-- "o" + reversed (`ussnz2dr` sub `3,4`) -> "sn" + reversed (`b98aurzl` sub `4,5`) -> "ua" + reversed (`wbhsx3hw` sub `4,4`) -> "h" + "q9".
			-- Resulting obfuscated event name is likely "osnuaq9".
			Event:FireServer("o" .. ("ussnz2dr"):sub(3, 4):reverse():reverse():reverse():reverse():reverse() .. ("b98aurzl"):sub(4, 5):reverse():reverse():reverse():reverse():reverse() .. ("wbhsx3hw"):sub(4, 4):reverse() .. "q9", BarbedWireDamage)
		end
	end))
	return mMaid -- Returns the `Maid` object, allowing the `Binder` to manage its cleanup automatically when `v` is removed.
end):Start() -- Starts the `Binder` to begin listening for tagged instances.

--// PLAYER STATE VARIABLES //--
local Looking = {} -- A table that stores animation data (e.g., head/neck spring values) for other players' "looking" animations.
local mVehiclePacket -- Stores a reference to the local player's current vehicle data packet if they are currently occupying a vehicle.
local VehicleStuff = { -- A table storing various vehicle-related data specific to the local player.
	VehiclesOwned = {}, -- A table listing vehicles that the local player owns.
	VehiclesRented = {}, -- A table listing vehicles that the local player has rented.
	Nitro = 50, -- The current amount of nitro fuel the player has.
	NitroLastMax = 50 -- The last known maximum nitro capacity, used for UI scaling.
}
local ShouldSprint = false -- Boolean flag indicating whether the player is currently in a sprinting state.
local ShouldCrawl = false -- Boolean flag indicating whether the player is currently in a crawling state.
GameUtil.Schedule = "Yard" -- Sets the initial game schedule or phase (e.g., "Yard" for prison breaks).
local Stunned = false -- Boolean flag indicating whether the player character is currently stunned and unable to move.
local EzUtils = require(ReplicatedStorage.EzUi.EzUtils) -- A utility module for simplifying UI interactions, especially for gamepad support.
-- `PlayerStuff` is a table of shared resources and functions. It is passed as a dependency to other modules,
-- providing them access to core client-side functionalities and UI elements.
local PlayerStuff = {
	MainWindowGroup = MainWindowGroup, -- The main UI window group for z-indexing and management.
	ScreenGui = ScreenGui, -- The primary `ScreenGui` for general UI elements.
	ProductGui = ProductGui, -- The `ScreenGui` for product purchase prompts.
	Event = Event, -- The public API for firing events to the server.
	em = em, -- The event map for receiving events from the server.
	UI = UI, -- The UI utility module.
	SelectIfGamepad = function(f) -- A helper function to call a function `f` if a gamepad is active, often used for initial button focus.
		EzUtils.selectIfGamepad(f)
	end,
	GetVehiclePacket = function() -- A getter function to retrieve the current vehicle packet, passed to modules that need vehicle data.
		return mVehiclePacket
	end,
}

--// VEHICLE SYSTEM INITIALIZATION //--
local VehicleUtils = require(ReplicatedStorage.Vehicle.VehicleUtils) -- General utility functions related to vehicles (e.g., entering/exiting).
VehicleUtils.Init({ -- Initializes the `VehicleUtils` module with necessary dependencies.
	GetVehiclePacket = PlayerStuff.GetVehiclePacket, -- Passes the getter for the local vehicle packet.
	em = em, -- Passes the event map for server communication.
	Event = Event -- Passes the public event API for server communication.
})
local VehicleStateBinder = require(ReplicatedStorage.Game.VehicleStateBinder) -- A binder that connects client-side logic to server-replicated `VehicleState` objects.
VehicleStateBinder:Start() -- Starts the `VehicleStateBinder` to begin processing `VehicleState` instances.
-- The `Classes` table (part of `VehicleUtils`) is used to store and look up different vehicle chassis and type modules.
local Classes = VehicleUtils.Classes
Classes.Chassis = require(ReplicatedStorage.Module.AlexChassis) -- Main car chassis physics and control module.
Classes.Chassis.init({ -- Initializes the main chassis module.
	ScreenGui = ScreenGui -- Passes the main `ScreenGui` for UI-related functions.
})
Classes.Chassis.SetEvent(Event) -- Passes the event system to the main chassis module for server communication.
Classes.Chassis2 = require(ReplicatedStorage.Module.AlexChassis2) -- A secondary chassis module, potentially for different vehicle types (e.g., motorcycles, dune buggies).
Classes.Chassis2.SetEvent(Event) -- Passes the event system to the secondary chassis module.
Classes.Volt = require(ReplicatedStorage.Game.Vehicle.Volt) -- A specific vehicle module for the "Volt" electric car, which may have unique physics/controls.
Classes.Volt.Init({ -- Initializes the Volt vehicle module.
	Event = Event,
	em = em
})
Classes.Tank = require(ReplicatedStorage.Tank.TankService) -- Module for tank vehicle specific mechanics.
Classes.Tank.init() -- Initializes the Tank service.

--// GAMEPASS & PRODUCT PURCHASE HANDLING //--
require(ReplicatedStorage.Module.RoundedBackingBuilder).new():Create(ProductGui.Gamepass.ContainerFrame) -- Creates a rounded graphical backing for the gamepass purchase UI.
local Proxy = 0 -- A counter used as a unique identifier for each purchase prompt. This helps debounce multiple prompts and ensures only the latest one's callbacks are active.
local function PromptPurchase(Pass) -- Displays a prompt to the player for purchasing a game pass or developer product.
	local PassId = Pass.PassId -- The ID of the game pass.
	local mProxy = Proxy + 1 -- Increments the proxy counter for this specific purchase attempt.
	Proxy = mProxy -- Updates the global proxy counter.
	-- Checks if the `Pass` object has an `OldPassId` (for older developer products) or a `PassId` (for newer game passes)
	-- and prompts the appropriate purchase dialog.
	if Pass.OldPassId then
		MarketplaceService:PromptPurchase(LocalPlayer, Pass.OldPassId)
	else
		MarketplaceService:PromptGamePassPurchase(LocalPlayer, PassId)
	end
	ProductGui.Gamepass.ContainerFrame.TextLabel.Text = Pass.Text -- Sets the text displayed on the purchase UI.
	-- Shows the `ProductGui.Gamepass` frame after a short delay (0.2 seconds).
	-- The `if Proxy == mProxy then` check ensures that if another prompt has been triggered since, this one won't appear (debouncing).
	delay(0.2, function()
		if Proxy == mProxy then
			ProductGui.Gamepass.Visible = true
		end
	end)
end
local function PromptGamePassPurchaseFinished(Player, Asset, IsPurchased) -- Callback function fired by `MarketplaceService` when any purchase prompt finishes.
	Proxy = Proxy + 1 -- Increments the global proxy counter. This effectively invalidates any pending `delay` calls from `PromptPurchase`.
	ProductGui.Gamepass.Visible = false -- Hides the purchase UI regardless of purchase success.
end
MarketplaceService.PromptGamePassPurchaseFinished:Connect(PromptGamePassPurchaseFinished) -- Connects the callback for Game Pass purchases.
MarketplaceService.PromptPurchaseFinished:Connect(PromptGamePassPurchaseFinished) -- Connects the callback for Developer Product purchases.
-- Server command handler (`em.ykqxb6t3`) that tells the client to display a purchase prompt.
function em.ykqxb6t3(Pass) -- `ykqxb6t3` is an obfuscated event name (likely "PromptPurchaseClient"). `Pass` contains purchase details.
	PromptPurchase(Pass) -- Calls the local `PromptPurchase` function to display the UI.
end
local GamepassSystem = require(ReplicatedStorage.Game.Gamepass.GamepassSystem) -- Module managing the player's owned game passes.
GamepassSystem.Init() -- Initializes the `GamepassSystem`.
local GamepassUtils = require(ReplicatedStorage.Game.Gamepass.GamepassUtils) -- Utility functions related to game passes.
GamepassUtils.Init({ -- Initializes `GamepassUtils`, passing the `PromptPurchase` function for convenience.
	PromptPurchase = PromptPurchase
})
PlayerStuff.PromptPurchase = PromptPurchase -- Adds the `PromptPurchase` function to the `PlayerStuff` table, making it accessible to other modules.

--// MORE GAME SYSTEM INITIALIZATIONS //--
-- This section continues the process of setting up various client-side game features by requiring and initializing their respective modules.
local Notification = require(ReplicatedStorage.Game.Notification) -- Module for displaying on-screen notifications to the player.
Notification.Init({ -- Initializes the `Notification` module.
	Event = Event, -- Passes the event system for potential server communication from notifications.
	em = em -- Passes the event map for receiving server events.
})
local SidebarUI = require(ReplicatedStorage.Game.SidebarUI) -- Module for managing the game's sidebar User Interface (e.g., displaying time, stats).
SidebarUI.Init({ -- Initializes the `SidebarUI` module.
	Event = Event,
	em = em
})
require(ReplicatedStorage.GameAnalytics).initClient() -- Initializes client-side game analytics, likely for tracking player behavior and performance.
local DefaultActions = require(ReplicatedStorage.Game.DefaultActions) -- Module defining default player actions (e.g., jump, sprint, punch) and their input bindings.
require(ReplicatedStorage.CmdrExt.CmdrExtSystem).init() -- Initializes an extension for Cmdr (a command-line interface system), if used.
local Time = require(ReplicatedStorage.Module.Time) -- Module for managing synchronized game time.
Time.Init() -- Initializes the `Time` module.
require(ReplicatedStorage.Module.Confirmation).Init({ -- Initializes a system for displaying confirmation dialogs to the player.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.DisplayDamage).init() -- Initializes the system for displaying damage numbers (e.g., "+10") when hitting entities.
require(ReplicatedStorage.Game.CharacterAnim).init() -- Initializes additional character animation handling logic.
require(ReplicatedStorage.Module.NetSync).Init({ -- Initializes a network synchronization module, likely for syncing visual effects or non-critical client data.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.OwnedPart.OwnedPartSystem).init() -- Initializes a system for managing game parts that can be owned by players.
-- Train System
require(ReplicatedStorage.Game.TrainSystem).Init({ -- Initializes the client-side logic for the train system.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.TrackSwitch).Init({ -- Initializes client-side logic for interactive train track switches.
	Event = Event,
	em = em
})
-- More Vehicle Types
Classes.Heli = require(ReplicatedStorage.Game.Vehicle.Heli)(PlayerStuff) -- Initializes the helicopter vehicle type, passing `PlayerStuff` for shared resources.
-- Robbery and Location-based Systems
require(ReplicatedStorage.Game.Museum)(PlayerStuff, ItemSystem) -- Initializes client-side logic for the Museum robbery, passing `PlayerStuff` and `ItemSystem`.
require(ReplicatedStorage.Game.L18n)({ -- Initializes the Localization module with references to specific GUIs for translation.
	ScreenGui = ScreenGui,
	ProductGui = ProductGui
})
require(ReplicatedStorage.Game.Level2.LevelSystem).init() -- Initializes a secondary level system or a more advanced leveling feature.
require(ReplicatedStorage.Game.TurbineSystem).init() -- Initializes client-side logic for game mechanics involving turbines.
require(ReplicatedStorage.AirDrop.BriefcaseBinder):Start() -- Binds client-side logic to airdrop briefcases when they appear.
require(ReplicatedStorage.Plane.PlaneBinder):Start() -- Binds client-side logic to planes.
require(ReplicatedStorage.Game.Hologram).Init({ -- Initializes client-side hologram effects.
	em = em
})
require(ReplicatedStorage.Game.Codes).Init({ -- Initializes the system for redeeming in-game codes.
	MainWindowGroup = MainWindowGroup, -- Passes the window group for managing code input UI.
	Event = Event
})
require(ReplicatedStorage.Game.SecretBases).Init({ -- Initializes client-side logic for secret bases.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.RobberyBank.RobberyBank).Init({ -- Initializes client-side logic for the Bank robbery.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.RobberyJewelry).Init({ -- Initializes client-side logic for the Jewelry Store robbery.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.RobberyCargoTrain).Init({ -- Initializes client-side logic for the Cargo Train robbery.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.RobberyPassengerTrain).Init({ -- Initializes client-side logic for the Passenger Train robbery.
	Event = Event,
	em = em,
	ScreenGui = ScreenGui
})
require(ReplicatedStorage.Game.Robbery.RobberyCargoPlane).Init({ -- Initializes client-side logic for the Cargo Plane robbery.
	Event = Event,
	em = em,
	Team = Team,
	ScreenGui = ScreenGui
})
require(ReplicatedStorage.Game.Cell).Init({ -- Initializes client-side logic for prison cells.
	Event = Event,
	em = em,
	ScreenGui = ScreenGui
})
require(ReplicatedStorage.Game.MilitaryIsland).Init() -- Initializes client-side features related to Military Island.
local JetSki = require(ReplicatedStorage.Game.VehicleSystem.JetSki) -- Module for the JetSki vehicle type.
require(ReplicatedStorage.Game.Plane.BaseUserControlledPlane).Init() -- Initializes a base module for user-controlled planes.
local Jet = require(ReplicatedStorage.Game.Plane.Jet) -- Module for the Jet plane type.
Jet.Init({
	Event = Event,
	em = em
})
local Stunt = require(ReplicatedStorage.Game.Plane.Stunt) -- Module for the Stunt plane type.
-- New Unified Vehicle System
local VehicleSystem = require(ReplicatedStorage.Game.VehicleSystem) -- A centralized system for managing various vehicle types.
VehicleSystem.Init({ -- Initializes the `VehicleSystem`.
	Event = Event,
	em = em
})
VehicleSystem.RegisterModule(JetSki) -- Registers the JetSki module with the unified `VehicleSystem`.
VehicleSystem.RegisterModule(Jet) -- Registers the Jet module.
VehicleSystem.RegisterModule(Stunt) -- Registers the Stunt plane module.
-- Server command handler (`em.ldwys2nl`) to update the client's missile UI (e.g., missile count) for their current vehicle.
function em.ldwys2nl(Missiles, MaxMissiles) -- `ldwys2nl` is an obfuscated event name (likely "UpdateMissileUI"). `Missiles` and `MaxMissiles` are the current and max missile counts.
	local p, _ = VehicleSystem.WaitForVehiclePacket(LocalPlayer) -- Waits for the local player's vehicle packet to be available.
	if p == nil then
		error("No vehicle exists for LocalPlayer") -- Throws an error if no vehicle packet is found.
	end
	p:UpdateMissileUI(Missiles, MaxMissiles) -- Calls a method on the vehicle packet to update its missile UI.
end
local Missile = require(ReplicatedStorage.Game.Missile) -- Module for client-side missile visual effects and logic.
-- Server command handler (`em.wpub4yx9`) that tells the client to render a new missile being launched.
function em.wpub4yx9(Position, Speed, Target, BornAt) -- `wpub4yx9` is an obfuscated event name (likely "LaunchMissileClient"). Arguments provide missile launch details.
	Missile.LaunchMissile(Position, Speed, Target, BornAt) -- Calls the local `LaunchMissile` function to render the missile.
end
require(ReplicatedStorage.Game.Robbery.PuzzleFlow).Init({ -- Initializes client-side logic for robbery puzzle mini-games.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.PowerPlant.PowerPlant).Init({ -- Initializes client-side logic for the Power Plant robbery.
	Event = Event,
	em = em
})
local JetPack = require(ReplicatedStorage.Game.JetPack.JetPack) -- Module for client-side JetPack item logic.
JetPack.Init({ -- Initializes the `JetPack` module.
	Event = Event,
	em = em
})
JetPack.Signal.OnEquipped:Connect(function() -- Connects to a signal that fires when the JetPack is equipped.
	InventoryItemSystem.unequipAll() -- Unequips any other items the player might be holding, as JetPack is likely an exclusive item.
end)
local Streetlights = require(ReplicatedStorage.Game.Streetlights) -- Module for controlling streetlight states (e.g., on/off, flickering).
Streetlights.init() -- Initializes the `Streetlights` module.
-- Server command handler (`em.zrbvzm69`) to make streetlights flicker.
function em.zrbvzm69() -- `zrbvzm69` is an obfuscated event name (likely "FlickerStreetlights").
	Streetlights.Flicker() -- Calls the local `Flicker` method.
end
-- Server command handler (`em.ee6o5cev`) to enable or disable streetlights.
function em.ee6o5cev(Enabled) -- `ee6o5cev` is an obfuscated event name (likely "SetStreetlightsEnabled"). `Enabled` is a boolean.
	Streetlights.SetEnabled(Enabled) -- Calls the local `SetEnabled` method.
end
require(ReplicatedStorage.App.MinimapService).init() -- Initializes the client-side minimap system.
require(ReplicatedStorage.Game.RoadSpikeSystem).Init({ -- Initializes client-side logic for road spike deployment.
	Event = Event
})
require(ReplicatedStorage.Game.WorldMarker.WorldMarkerSystem).init() -- Initializes client-side world markers (e.g., mission objectives, points of interest).
require(ReplicatedStorage.Game.RobberyMarkerSystem).init() -- Initializes client-side markers specifically for robberies.
require(ReplicatedStorage.Game.LightningSystem).Init({ -- Initializes client-side lightning strike visual effects.
	em = em
})
require(ReplicatedStorage.Game.April2020LiveEventLoader).Init({ -- Initializes a loader for a specific past live event (April 2020).
	Event = Event,
	em = em
})
-- Boat System
require(ReplicatedStorage.Game.Boat.Boat).Init() -- Initializes the base client-side boat module.
local Sloop = require(ReplicatedStorage.Game.Boat.Sloop) -- Module for the Sloop boat type.
VehicleSystem.RegisterModule(Sloop) -- Registers the Sloop with the unified `VehicleSystem`.
local Cruiser = require(ReplicatedStorage.Game.Boat.Cruiser) -- Module for the Cruiser boat type.
VehicleSystem.RegisterModule(Cruiser) -- Registers the Cruiser with the unified `VehicleSystem`.
if RunUtils.isMainWorld() then -- Initializes boat scenery only if the game is running in the main world.
	require(ReplicatedStorage.Game.BoatScenery).Init()
end
require(ReplicatedStorage.Game.Lighthouse).Init() -- Initializes client-side logic for lighthouses.
require(ReplicatedStorage.Game.Drawbridge).Init({ -- Initializes client-side logic for interactive drawbridges.
	em = em
})
require(ReplicatedStorage.Game.NukeControl).Init({ -- Initializes client-side logic for nuke control mechanics.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Robbery.CargoShip.CargoShipCoordinator).Init({ -- Initializes client-side logic for the Cargo Ship robbery.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Radio.RadioPlayer).Init({ -- Initializes the in-game radio player for playing music/audio.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.RobberyMoneyUI.RobberyMoneyUI).Init() -- Initializes UI for displaying money gained from robberies.
require(ReplicatedStorage.Game.DuffelBag.DuffelBagBinder):Start() -- Binds client-side logic to duffel bags (e.g., for carrying loot).
require(ReplicatedStorage.Game.GunShop.GunShopSystem).init() -- Initializes client-side gun shop mechanics.
require(ReplicatedStorage.Game.GunShop.GunShopUI).init({ -- Initializes gun shop UI elements.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.ContextMessage.ContextMessageUI).init() -- Initializes UI for displaying contextual messages (e.g., hints).
require(ReplicatedStorage.Game.ContextTutorial.ContextTutorialSystem).init() -- Initializes client-side contextual tutorial system.
require(ReplicatedStorage.Game.C4.C4System).init({ -- Initializes client-side C4 explosive system.
	em = em
})
require(ReplicatedStorage.Game.SmokeGrenade.SmokeGrenadeSystem).init() -- Initializes client-side smoke grenade system.
require(ReplicatedStorage.Game.Level2.LevelUISystem).init() -- Initializes client-side UI related to player levels.
require(ReplicatedStorage.Game.Contract.ContractSystem).init() -- Initializes client-side contract system.
require(ReplicatedStorage.Game.Contract.ContractUISystem).init() -- Initializes client-side contract UI.
require(ReplicatedStorage.Game.Season.SeasonUISystem).init() -- Initializes client-side UI related to game seasons.
require(ReplicatedStorage.Game.Season.SeasonSystem).init() -- Initializes client-side game season system.
require(ReplicatedStorage.Game.Robbery.MoneyTruck.MoneyTruckSystem).init() -- Initializes client-side logic for the Money Truck robbery.
require(ReplicatedStorage.Game.NorthernLights).init() -- Initializes client-side Northern Lights visual effect.
require(ReplicatedStorage.Game.Dog.DogSystem).init() -- Initializes client-side companion dog system.
require(ReplicatedStorage.Game.Adoption.AdoptionStandUI).init() -- Initializes client-side adoption stand UI.
require(ReplicatedStorage.Game.Adoption.AdoptionSystem).init() -- Initializes client-side adoption system.
-- Home / Apartment System
require(ReplicatedStorage.Home.HomeUI.HomeSaleUISystem).init() -- Initializes client-side home sale UI.
require(ReplicatedStorage.Home.HomeSystem).init() -- Initializes the core client-side home/apartment system.
require(ReplicatedStorage.Home.ItemPlacer.ItemPlacerSystem).init() -- Initializes client-side furniture placement system for homes.
require(ReplicatedStorage.Home.Surface.SurfaceSystem).init() -- Initializes client-side logic for home surfaces/floors.
require(ReplicatedStorage.Home.HomeItem.HomeItemSystem).init() -- Initializes client-side home item management.
require(ReplicatedStorage.Home.HomeItem.Fabricate.Turret).init({ -- Initializes client-side logic for fabricating turrets in homes.
	Event = Event
})
require(ReplicatedStorage.Home.HomeItem.Fabricate["Trapped Bookshelf"]).init({ -- Initializes client-side logic for fabricating trapped bookshelves.
	Event = Event
})
require(ReplicatedStorage.Game.Robbery.TombRobbery.TombRobberySystem).init({ -- Initializes client-side logic for the Tomb robbery.
	Event = Event
})
require(ReplicatedStorage.Game.Cart.CartSystem).init() -- Initializes client-side shopping cart system.
require(ReplicatedStorage.Game.ProximityCamShake.ProximityCamShakeSystem).init() -- Initializes client-side proximity-based camera shake effects.
require(ReplicatedStorage.Game.ProximitySound.ProximitySoundSystem).init() -- Initializes client-side proximity-based sound effects.
require(ReplicatedStorage.Game.DartDispenser.DartDispenserSystem).init() -- Initializes client-side dart dispenser system.
require(ReplicatedStorage.Game.Plank.PlankSystem).init() -- Initializes client-side plank building system.
require(ReplicatedStorage.Game.MilitaryTurret.MilitaryTurretSystem).init({ -- Initializes client-side military turret system.
	Event = Event
})
require(ReplicatedStorage.Game.Destructible.DestructibleSystem).init() -- Initializes client-side destructible object system.
require(ReplicatedStorage.Game.PlayerMarkerSystem).init() -- Initializes client-side player marker system.
require(ReplicatedStorage.Game.TopExpBoard.TopExpBoardSystem).init() -- Initializes client-side top experience leaderboard.
require(ReplicatedStorage.Game.CatalogPurchaseSystem).init() -- Initializes client-side catalog purchase system.
require(ReplicatedStorage.CCTV.CCTVService).init() -- Initializes client-side CCTV camera service.

--// PLAYER SETTINGS SYSTEM //--
-- This system manages player-specific game settings (e.g., graphics, audio preferences).
-- It handles loading saved settings from the server, applying them locally, and sending changes back to the server.
local SettingsValues = {} -- A temporary table to store setting values received from the server before their corresponding setting modules are fully loaded.
local CurrentSettings = {} -- A table storing the currently active local values for all game settings.
local SettingsProxy = {} -- A table used for debouncing updates to the server. Each setting has a proxy counter.
-- Server command handler (`em.mlty6ncm`) that sends the player's saved settings to the client upon joining.
function em.mlty6ncm(Settings) -- `mlty6ncm` is an obfuscated event name (likely "ReceiveAllSettings"). `Settings` is a table of saved settings.
	CurrentSettings = Settings -- Stores the complete table of received settings.
	for Name, Value in pairs(Settings) do -- Iterates through each setting received.
		local Setting = GameSettingsService.getSettingByName(Name) -- Attempts to retrieve the `GameSetting` object by its name.
		if Setting then -- If the setting module for this setting has already been loaded.
			if not Setting.noSave then -- Checks if this setting is intended to be saved (not a temporary client-only setting).
				GameSettingsService.setValue(Setting, Value) -- Applies the loaded `Value` to the setting, triggering its `onChanged` signal locally.
			end
		else
			-- If the setting module is not yet loaded, store the `Value` temporarily in `SettingsValues`.
			-- This value will be applied once the setting module registers itself.
			SettingsValues[Name] = Value
		end
	end
end
-- This function is called for each `GameSetting` when it is added to the `GameSettingsService`.
-- It applies any previously saved value and sets up a listener for local changes.
local function handleSetting(Setting)
	local Value = SettingsValues[Setting.name] -- Checks if there's a temporarily stored value for this setting.
	if Value ~= nil then
		SettingsValues[Setting.name] = nil -- Clears the temporary storage once the value is used.
		if not Setting.noSave then
			GameSettingsService.setValue(Setting, Value) -- Applies the value.
		end
	end
	-- Connects to the `onChanged` signal of the `GameSetting`. This fires whenever the setting's value is changed locally.
	Setting.onChanged:Connect(function(Value)
		local mProxy = (SettingsProxy[Setting.name] or 0) + 1 -- Increments a proxy counter specific to this setting.
		SettingsProxy[Setting.name] = mProxy -- Updates the proxy counter.
		if CurrentSettings[Setting.name] ~= Value then -- Only proceeds if the new `Value` is different from the `CurrentSettings` record.
			CurrentSettings[Setting.name] = Value -- Updates the `CurrentSettings` with the new value.
			-- Schedules a delayed task (0.25 seconds) to send the updated setting to the server.
			-- This debounces rapid changes, sending only the latest value within the delay period.
			task.delay(0.25, function()
				if SettingsProxy[Setting.name] == mProxy then -- Checks if this is still the most recent proxy value for this setting.
					Event:FireServer("UpdateSettings", Setting.name, Value) -- Fires an event to the server to update the setting.
				end
			end)
		end
	end)
end
GameSettingsService.onAdded:Connect(handleSetting) -- Connects `handleSetting` to the `onAdded` signal of `GameSettingsService`, for settings registered after this script loads.
-- Iterates through all settings that might have been registered *before* this script connected to `onAdded`.
for _, Setting in ipairs(GameSettingsService.getAll()) do
	handleSetting(Setting) -- Calls `handleSetting` for each existing setting.
end

--// MORE BINDERS & SERVICES (LATE INITIALIZATION) //--
-- This section initializes additional client-side services and binders, typically done later in the script's lifecycle
-- to ensure all core dependencies are loaded or for specific order-of-operation requirements.
require(ReplicatedStorage.VehicleLink.VehicleLinkBinder):Start() -- Binds logic related to linking vehicles (e.g., tow trucks attaching to cars).
require(ReplicatedStorage.Elevator.ElevatorBinder):Start() -- Binds client-side logic to elevator objects.
require(ReplicatedStorage.Casino.CasinoService).init() -- Initializes the client-side casino game service.
require(ReplicatedStorage.TransportJet.TransportJetService).init() -- Initializes client-side logic for a transport jet.
require(ReplicatedStorage.DamageIndicator.DamageIndicatorService).init() -- Initializes the service for displaying damage indicators (e.g., hit markers).
require(ReplicatedStorage.Trade.TradeService).init({ -- Initializes the client-side trading service.
	em = em
})
if RunUtils.isTradeWorld() then -- Conditionally initializes `TradeDesireService` only if the game is running in a trade-specific world.
	require(ReplicatedStorage.Trade.TradeDesireService).init()
end
require(ReplicatedStorage.RewardSpinner.RewardSpinnerService).init() -- Initializes the client-side reward spinner game.
require(ReplicatedStorage.HyperChrome.HyperChromeService).init() -- Initializes the client-side HyperChrome vehicle customization service.
require(ReplicatedStorage.RobberyBonus.RobberyBonusService).init({ -- Initializes the client-side robbery bonus system.
	em = em
})
require(ReplicatedStorage.Safes.SafesService).init({ -- Initializes the client-side safes interaction service.
	em = em
})
require(ReplicatedStorage.GuardNPC.GuardNPCBinder):Start() -- Binds client-side logic to NPC guards.
require(ReplicatedStorage.AirDrop.AirDropService).init({ -- Initializes the client-side airdrop event service.
	em = em
})
require(ReplicatedStorage.App.HoldEService).init() -- Initializes a service for "Hold E to interact" prompts.
require(ReplicatedStorage.TargetingIndicator.TargetingIndicatorService).init() -- Initializes the client-side targeting indicator service.
require(ReplicatedStorage.Forcefield.ForcefieldService).init() -- Initializes the client-side forcefield service.
require(ReplicatedStorage.SpawnSelection.SpawnSelectionService).init() -- Initializes the client-side spawn selection UI.
require(ReplicatedStorage.Consumables.ConsumablesService).init() -- Initializes the client-side consumables service.
require(ReplicatedStorage.PersistentCrew.PersistentCrewService).init() -- Initializes the client-side persistent crew system.
require(ReplicatedStorage.PersistentCrewBattle.PersistentCrewBattleService).init() -- Initializes the client-side persistent crew battle system.
require(ReplicatedStorage.TrackingSpotlight.TrackingSpotlightService).init() -- Initializes the client-side tracking spotlight service.
require(ReplicatedStorage.GameMode.GameModeService).init() -- Initializes the client-side game mode management service.
require(ReplicatedStorage.DragStrip.DragStripService).init() -- Initializes the client-side drag strip racing service.
require(ReplicatedStorage.App.CircleActionBinder):Start() -- Binds client-side logic for general circular action prompts to tagged objects.
require(ReplicatedStorage.VehicleState.TurretService).init() -- Initializes the client-side turret service for vehicles.
require(ReplicatedStorage.App.OnboardTutorialService).init() -- Initializes the client-side onboard tutorial system.
require(ReplicatedStorage.Commerce.CommerceService).init() -- Initializes the client-side commerce (in-game store) service.
local CashBuyUI = require(ReplicatedStorage.Game.CashBuyUI) -- Module for the UI to buy in-game cash with Robux.
CashBuyUI.Init({ -- Initializes the `CashBuyUI` module.
	Event = Event,
	em = em
})
require(ReplicatedStorage.Game.Radio.Radio).Init() -- Initializes the client-side radio playback system.
Settings.FetchProducts() -- Calls a function in the `Settings` module to fetch product information from `MarketplaceService`.
local Falling = require(ReplicatedStorage.Game.Falling) -- Module handling player falling and ragdolling.
Falling.Init({ -- Initializes the `Falling` module.
	Event = Event,
	em = em
})
local Paraglide = require(ReplicatedStorage.Game.Paraglide) -- Module handling paragliding mechanics.
Paraglide.Init({ -- Initializes the `Paraglide` module.
	Event = Event,
	em = em
})

--// UTILITY & FORMATTING FUNCTIONS //--
-- Formats a number by inserting commas as thousands separators (e.g., 1000000 becomes "1,000,000").
local comma = function(n) -- `n` is the number to format.
	-- `string.match` extracts three parts: `left` (non-digits before first digit), `num` (the main digits), `right` (non-digits after last digit).
	local left, num, right = string.match(tostring(n), "^([^%d]*%d)(%d*)(.-)$")
	-- Reverses the digit part (`num`), inserts commas every three digits using `gsub`, then reverses back.
	-- Concatenates with `left` and `right` to preserve non-digit parts (e.g., currency symbols, decimals).
	return left .. num:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. right
end
-- Formats a number as in-game currency, including a sign and localization.
local function FormatMoney(n) -- `n` is the monetary value.
	local Sign = n >= 0 and "" or "-" -- Determines if a negative sign is needed.
	-- Uses the `Localization` module to format the currency key ("General.Cash") with the comma-formatted absolute value.
	return Sign .. Localization:FormatByKey("General.Cash", {
		comma(abs(n)) -- Calls `comma` on the absolute value of `n`.
	})
end
-- Lerps (linearly interpolates) a table of values. This function can interpolate numbers directly
-- and also objects that have a `:lerp` method (e.g., `CFrame`, `Color3`).
local LerpTable = function(a, b, i) -- `a`: the starting table, `b`: the ending table, `i`: the interpolation factor (0.0 to 1.0).
	local r = {} -- The table to store the interpolated results.
	for k, v in next, a, nil do -- Iterates through all key-value pairs in the starting table `a`.
		local av, bv, n = v, b[k], nil -- `av` is value from `a`, `bv` is value from `b`, `n` is the interpolated result.
		if type(v) == "number" then -- If the value is a number.
			local j = 1 - i -- Calculate the inverse interpolation factor.
			n = j * av + i * bv -- Apply linear interpolation formula for numbers.
		else -- If the value is not a number (assumed to be an object with a `:lerp` method).
			n = av:lerp(bv, i) -- Calls the object's own `:lerp` method.
		end
		r[k] = n -- Stores the interpolated value in the result table.
	end
	return r -- Returns the table of interpolated values.
end

--// SOUND SYSTEM //--
-- A centralized system for playing and stopping sounds, both locally and replicated to other players across the server.
local Playing = {} -- A table to keep track of currently playing sound instances, indexed by a unique identifier.
local PlaySound, StopSound do
	-- Function to play a sound. It can either be played only locally or replicated to the server for other clients.
	function PlaySound(Name, Options, Local) -- `Name`: Identifier for the sound (from `Settings.Sounds`), `Options`: A table of sound properties, `Local`: Boolean, true if only played locally.
		if Options.Source then -- Requires a `Source` part to parent the sound to.
			Options.Play = true -- Ensures the `Play` option is set to true for the handler.
			if not Local then -- If the sound should be replicated to other clients.
				-- Fires an obfuscated remote event to the server. The event name is derived by string manipulation
				-- of `buk5buxpc` and `12t34`. Likely `zbu12t34`.
				Event:FireServer("z" .. ("buk5buxpc"):sub(5, 6):reverse():reverse():reverse():reverse():reverse() .. "12t34", Name, Options)
			end
			-- Always calls the local sound handler (`em.zub12t34`) to play the sound immediately for responsiveness.
			em.zub12t34(LocalPlayer.Name, Name, Options)
		end
	end
	-- Function to stop a sound. It can either stop only locally or replicate the stop command to the server.
	function StopSound(Name, Local) -- `Name`: Identifier for the sound, `Local`: Boolean, true if only stopped locally.
		local Options = {} -- An empty `Options` table is typically sent when stopping a sound.
		if not Local then -- If the stop command should be replicated to other clients.
			-- Fires an obfuscated remote event to the server. The event name is derived by string manipulation
			-- of `pylk21bunc2`, `btlf1`, and `nl53mbi`. Likely `zbc4`.
			Event:FireServer("z" .. ("pylk21bunc2"):sub(5, 8):reverse():reverse():reverse():reverse():reverse() .. ("btlf1"):sub(2, 2):reverse() .. ("nl53mbi"):sub(4, 4):reverse():reverse():reverse() .. "4", Name, Options)
		end
		-- Calls the local sound handler (`em.zub12t34`) to stop the sound locally.
		em.zub12t34(LocalPlayer.Name, Name, Options)
	end
	local SoundProxy = 0 -- A counter used as a proxy ID for sound instances. This helps manage uniqueness and ensures older sound instances for the same `Identifier` don't interfere with newer ones.
	-- The core function that handles the creation, playback, and stopping of a sound instance.
	-- This function is called both by `PlaySound`/`StopSound` (locally) and by the server (via `em.zub12t34`) for other players.
	function em.zub12t34(PlayerName, Name, Options) -- `zub12t34` is an obfuscated event name (likely "HandleSoundPlaybackClient" or similar).
		local Source = Options.Source -- The `BasePart` to which the `Sound` instance will be parented.
		local Volume = Options.Volume or 0.5 -- The desired volume, defaults to 0.5.
		Volume = math.min(2, Volume) -- Clamps the volume to a maximum of 2.
		if Volume ~= Volume then Volume = 0.5 end -- NaN check: if `Volume` is NaN, reset to 0.5.
		local Pitch = Options.Pitch or 1 -- The desired playback speed/pitch, defaults to 1.
		local MaxTime = Options.MaxTime or 1 -- The maximum duration (in seconds) the sound will play before being stopped/destroyed. Defaults to 1 second.
		local Looped = Options.Looped -- Boolean: true if the sound should loop.
		local Play = Options.Play -- Boolean: true if the sound should play, false if it should be stopped.
		local TimeStart = Options.TimeStart -- The time position (in seconds) to start playback from.
		local Delay = Options.Delay -- A delay (in seconds) before the sound starts playing.
		local EmitterSize = Options.EmitterSize or 10 -- The size of the sound's emitter, affecting 3D sound spatialization. Defaults to 10.
		if Options.TimeStop then MaxTime = TimeStart + Options.TimeStop end -- If `TimeStop` (a duration from start) is provided, calculate `MaxTime`.

		local mProxy = SoundProxy + 1 -- Increments the global `SoundProxy` counter for this new sound attempt.
		SoundProxy = mProxy -- Updates the global `SoundProxy`.
		-- Generates a unique `Identifier` for the sound instance. If `Options.Multi` is true, a unique ID is generated for each instance.
		-- Otherwise, a single ID is used per `PlayerName` and `Name` combination (for sounds that should not overlap).
		local Identifier = Options.Multi and ("%s_%s_%d"):format(PlayerName, Name, mProxy) or ("%s_%s"):format(PlayerName, Name)
		local Event = Playing[Identifier] -- Checks if a sound with this `Identifier` is already recorded as playing.
		-- If a sound with this `Identifier` is already playing, it is stopped and destroyed to prevent overlaps or "ghost" sounds.
		if Event then
			Event.Object:Stop()
			Event.Object:Destroy()
			Playing[Identifier] = nil
		end
		if not Play then return end -- If `Options.Play` is false, the function's purpose was solely to stop an existing sound, so it exits.
		if not Source then return end -- If no `Source` part is provided, the sound cannot be created or played.
		local SoundId = Settings.Sounds[Name] -- Retrieves the Roblox asset ID (rbxassetid) for the given `Name` from `Settings.Sounds`.
		if not SoundId then return end -- If the `SoundId` is not found, the sound cannot be played.

		local Sound = Instance.new("Sound") -- Creates a new `Sound` instance.
		Sound.SoundId = "rbxassetid://" .. SoundId -- Sets the asset ID for the sound.
		if TimeStart then Sound.TimePosition = TimeStart end -- Sets the starting playback position if specified.
		if Options.SoundGroup then Sound.SoundGroup = Options.SoundGroup end -- Assigns the `SoundGroup` if provided.
		Sound.Name = Identifier -- Sets the `Sound` instance's `Name` property to the unique `Identifier`.
		Sound.Looped = Looped -- Sets whether the sound loops.
		Sound.Volume = Volume -- Sets the volume.
		Sound.PlaybackSpeed = Pitch -- Sets the playback speed.
		Sound.EmitterSize = EmitterSize -- Sets the emitter size for 3D spatialization.
		Sound.MaxDistance = 400 -- Sets the maximum distance at which the sound can be heard.
		Sound.Parent = Source -- Parents the `Sound` instance to the `Source` part, making it a 3D sound.

		if Delay then -- If a `Delay` is specified.
			delay(Delay, function() Sound:Play() end) -- Schedules the `Sound` to play after the specified delay.
		else
			Sound:Play() -- Plays the `Sound` immediately.
		end
		Playing[Identifier] = { -- Stores a reference to the newly created `Sound` instance in the `Playing` table.
			Object = Sound,
			Proxy = mProxy -- Stores the `mProxy` for this sound instance for future management.
		}
		-- Schedules a cleanup task to automatically stop and destroy the sound after its `MaxTime` duration.
		local function Expire()
			local Event = Playing[Identifier] -- Retrieves the sound entry from `Playing` table.
			if not Event then return end -- If the sound entry no longer exists (already cleaned up), exit.
			if mProxy < Event.Proxy then return end -- Ensures only the latest instance for an `Identifier` cleans itself up, preventing older `delay` calls from interfering.
			Event.Object:Stop() -- Stops the sound.
			Event.Object:Destroy() -- Destroys the `Sound` instance.
			Playing[Identifier] = nil -- Removes the entry from the `Playing` table.
		end
		delay(MaxTime, Expire) -- Schedules the `Expire` function to run after `MaxTime`.
	end
end

--// FIREWORKS & PARTY SYSTEM //--
-- This section defines client-side logic for fireworks displays and party-related events.
local function Fireworks(n) -- `n` is the number of fireworks to launch.
	local s = AlexParticles.MakeState() -- Creates a new state object for the `AlexParticles` module to manage this particular particle simulation.
	s.Frame = ParticlesGui.Particles -- Assigns a `Frame` within `ParticlesGui` as the container for these screen-space particles.
	AlexParticles.EasySimulate(s, 4) -- Initializes a simplified particle simulation within the given state, with a certain simulation detail (4).
	local Size = s.Frame.AbsoluteSize -- Retrieves the absolute size (in pixels) of the particle container frame.
	local w, h = Size.X, Size.Y -- Extracts width and height.
	local function OnDestroy(_) -- Callback function executed when an individual firework particle effect is destroyed.
		-- Plays a "FireworkBang" sound. The sound is triggered based on `n` (fewer fireworks always play, more have a random chance).
		if n <= 4 or math.random() > 0.2 then
			PlaySound("FireworkBang", {
				Source = ScreenGui, -- The sound is played from the `ScreenGui`, making it a 2D (non-spatialized) sound.
				Volume = 0.2 + math.random() * 0.3, -- Randomizes the volume slightly for variation.
				Multi = true -- Allows multiple instances of this sound to play simultaneously.
			}, true) -- The `true` argument ensures the sound is played locally only (not replicated to the server).
		end
	end
	for i = 1, n do -- Loops `n` times to launch `n` fireworks.
		local mh = h * 0.3 + h * 0.6 * math.random() -- Calculates a random maximum height for the firework explosion.
		local v = Vector3.new(0, -400, 0) + m.Uniform2D(150) -- Sets the initial velocity of the firework: -400 in Y (upwards), plus a random 2D spread.
		local t = (h - mh) / v.magnitude -- Calculates the time-to-live (`ttl`) for the firework based on its trajectory and height.
		local p = AlexParticles.Firework(s, v3(math.random() * w, h, 0), v, Vector3.new(0, 0, 0)) -- Creates a new firework particle effect within the simulation `s`.
		-- Arguments: `s` (simulation state), initial position (random X, full screen height Y, 0 Z), initial velocity `v`, acceleration (0,0,0).
		p.ttl = t -- Sets the time-to-live for the particle.
		p.OnDestroy = OnDestroy -- Assigns the `OnDestroy` callback to the particle.
		wait(0.1 + math.random() * 0.1 * 0.5) -- Introduces a small random delay between launching each firework.
	end
end
-- Server command handler (`em.vbxm2cq9`) that tells the client to trigger a fireworks display.
function em.vbxm2cq9(n) -- `vbxm2cq9` is an obfuscated event name (likely "TriggerFireworksClient"). `n` is the number of fireworks.
	assert(n <= 50) -- Asserts that the number of fireworks requested is not excessive (max 50).
	Fireworks(n) -- Calls the local `Fireworks` function.
end
PlayerStuff.Fireworks = Fireworks -- Adds the `Fireworks` function to the `PlayerStuff` table for access by other modules.
require(ReplicatedStorage.Game.Party).Init({ -- Initializes the client-side Party system.
	Fireworks = Fireworks -- Passes the `Fireworks` function as a dependency.
})

--// PLAYER ACTIONS & INTERACTIONS //--
-- This section defines functions for player-initiated actions like arresting, pickpocketing, breaking out, and trading.
local function AttemptArrest(Player) -- Attempts to arrest another `Player`.
	-- Fires an obfuscated remote event to the server to request an arrest.
	-- The obfuscated event name is derived by concatenating string segments and reversing them.
	-- `a` + reversed (`q68qrtls9` sub `5,5`) -> "q" + reversed (`x8auint5` sub `5,5`) -> "i" + reversed (`og21habb6` sub `5,5`) -> "h" + reversed (`mldvbwxib` sub `5,5`) -> "b" + "lvf".
	-- The final obfuscated name is "aqlhblvf".
	Event:FireServer("a" .. ("q68qrtls9"):sub(5, 5):reverse():reverse():reverse():reverse():reverse() .. ("x8auint5"):sub(5, 5):reverse():reverse():reverse():reverse():reverse() .. ("og21habb6"):sub(5, 5):reverse() .. ("mldvbwxib"):sub(5, 5):reverse() .. "lvf", Player.Name)
end
local function AttemptPickpocket(Player) -- Attempts to pickpocket another `Player`.
	-- Fires an obfuscated remote event to the server to request a pickpocket.
	-- `w` + reversed (`abt6ieht` sub `5,7`) -> "ei" + "hiii".
	-- The final obfuscated name is "weihiii".
	Event:FireServer("w" .. ("abt6ieht"):sub(5, 7):reverse():reverse():reverse() .. "ihii", Player.Name)
end
local function AttemptBreakout(Player) -- Attempts to break out another `Player` (from handcuffs/prison).
	-- Fires an obfuscated remote event to the server to request a breakout.
	-- `x` + reversed (`j1x33ocb` sub `5,5`) -> "3" + "0wy9zy".
	-- The final obfuscated name is "x30wy9zy".
	Event:FireServer("x" .. ("j1x33ocb"):sub(5, 5):reverse():reverse():reverse() .. "0wy9zy", Player.Name)
end
-- Server command handler (`em.iqfm5axe`) for a failed arrest attempt, displaying specific feedback.
function em.iqfm5axe(t) -- `iqfm5axe` is an obfuscated event name (likely "ArrestFailedClient"). `t` is a table containing details (e.g., `Bribed` duration).
	if t.Bribed then
		em.ht9y5ngc({ -- Calls the general notification function (`em.ht9y5ngc`).
			Title = "Arrest",
			Text = ("You are bribed! Wait %d seconds."):format(t.Bribed) -- Displays a message indicating player was bribed and a cooldown.
		})
	end
end
-- Server command handler (`em.owamnojv`) for a failed breakout attempt, displaying specific feedback.
function em.owamnojv(t) -- `owamnojv` is an obfuscated event name (likely "BreakoutFailedClient"). `t` contains details (e.g., `Cooldown` duration).
	if t.Cooldown then
		em.ht9y5ngc({ -- Calls the general notification function (`em.ht9y5ngc`).
			Title = "Breakout",
			Text = ("Wait %d seconds."):format(t.Cooldown) -- Displays a message indicating a cooldown for breakout.
		})
	end
end
local function AttemptTrade(t) -- Attempts to initiate or accept a trade with another player.
	-- Checks if a trade with the target player is already initiated by the local player or the target player.
	if TradeService.checkAlreadyInitiated(t, LocalPlayer) then
		TradeService.acceptInitiation(t.UserId) -- If initiated by target, accept the trade.
	else
		TradeService.sendInitiation(t.UserId) -- Otherwise, send a new trade initiation request.
	end
end
local function AttemptVehicleHotwire(Vehicle) -- Attempts to hotwire a vehicle.
	-- Fires an obfuscated remote event to the server to request hotwiring.
	-- `t` + reversed (`ihqfw` sub `4,4`) -> "q" + reversed (`q9k4winrx` sub `4,6`) -> "nik" + "lgn".
	-- The final obfuscated name is "tqniklgn".
	Event:FireServer("t" .. ("ihqfw"):sub(4, 4):reverse() .. ("q9k4winrx"):sub(4, 6):reverse() .. "lgn", Vehicle)
end

--// VEHICLE NITRO SYSTEM //--
-- This section manages the client-side display and logic for the vehicle's nitro (boost) system.
local NitroShopGui -- Reference to the `NitroShopGui` ScreenGui instance.
local StartNitro, StopNitro do
	local t = tick() -- `t`: Stores the `tick()` time when nitro was last activated or when its duration began. Used for calculating elapsed nitro time.
	local ShouldCalc = false -- Boolean flag: true if nitro duration needs to be calculated and sent to the server.
	-- `CalculateDelta` is a helper function that calculates the duration nitro was active
	-- and sends this information to the server for validation and data tracking.
	local function CalculateDelta()
		if ShouldCalc then
			ShouldCalc = false -- Resets the flag.
			local dt = tick() - t -- Calculates the duration nitro was active.
			-- Fires an obfuscated remote event to the server, sending the `dt` (duration).
			-- `h` + reversed (`wfreigyf` sub `4,4`) -> "e" + reversed (`i1d5cjscaj` sub `4,8`) -> "jcs" + "3".
			-- The final obfuscated name is "hejs3".
			Event:FireServer("h" .. ("wfreigyf"):sub(4, 4):reverse():reverse():reverse():reverse():reverse() .. ("i1d5cjscaj"):sub(4, 8):reverse() .. "3", dt)
		end
	end
	local t2 = tick() -- `t2`: A debounce timer for the `StartNitro` function to prevent rapid activation.
	function StartNitro() -- Activates the vehicle's nitro boost.
		if tick() - t2 >= 0.1 then -- Checks for a 0.1-second debounce cooldown.
			t2 = tick() -- Resets the debounce timer.
			if ShouldCalc then CalculateDelta() end -- If nitro was previously active, calculate its duration before starting a new one.
			ShouldCalc = true -- Sets the flag to indicate that a new nitro duration measurement has started.
			t = tick() -- Resets the `t` timer for the new nitro duration.
			-- Checks if the local player is in a vehicle, is not a passenger, and if the vehicle has nitro particles defined.
			if mVehiclePacket and (not mVehiclePacket.Passenger and #mVehiclePacket.Nitrous > 0) then
				mVehiclePacket.Nitro = true -- Sets the `Nitro` flag on the vehicle packet to true, indicating nitro is active.
				PlaySound("Nitro1", { -- Plays a one-shot nitro start sound.
					Source = mVehiclePacket.Nitrous[1].Parent, -- Parents the sound to the parent of the first nitro particle emitter.
					TimeStart = 0.5, -- Starts the sound at 0.5 seconds into its audio clip.
					Volume = 1
				})
				PlaySound("NitroLoop", { -- Plays a looping nitro sound.
					Source = mVehiclePacket.Nitrous[1].Parent,
					Looped = true,
					MaxTime = 30, -- The loop will stop after 30 seconds if not explicitly stopped earlier.
					Volume = 1,
					Delay = 0.3 -- Delays the start of the loop to allow `Nitro1` to play first.
				})
				for _, v in next, mVehiclePacket.Nitrous do -- Iterates through all nitro particle emitters.
					v.Enabled = true -- Enables the visual nitrous particles.
				end
				-- Fires an obfuscated remote event to the server to notify it of nitro activation.
				-- `l` + reversed (`d3t62j` sub `4,5`) -> "6t" + reversed (`d4m8ijmiz` sub `4,7`) -> "ijm" + "f".
				-- The final obfuscated name is "l6tijmf".
				Event:FireServer("l" .. ("d3t62j"):sub(4, 5):reverse():reverse():reverse() .. ("d4m8ijmiz"):sub(4, 7):reverse() .. "f")
			end
			-- If the current nitro amount is very low (less than 1% of max), automatically opens the nitro shop if player is at a gas station.
			if VehicleStuff.Nitro / VehicleStuff.NitroLastMax <= 0.01 then
				em.k9quu0id(true, true) -- Calls the handler to open the nitro shop UI.
			end
		end
	end
	function StopNitro() -- Deactivates the vehicle's nitro boost.
		StopSound("NitroLoop") -- Stops the looping nitro sound.
		if mVehiclePacket and not mVehiclePacket.Passenger then
			mVehiclePacket.Nitro = false -- Sets the `Nitro` flag on the vehicle packet to false.
			if mVehiclePacket.Nitrous then -- Checks if nitro particles are defined.
				for _, v in next, mVehiclePacket.Nitrous do
					v.Enabled = false -- Disables the visual nitrous particles.
				end
			end
		end
		CalculateDelta() -- Calls `CalculateDelta` to record the final duration nitro was active and send to server.
		Event:FireServer("zycffoj4") -- Fires an obfuscated remote event to the server to notify of nitro deactivation (`zycffoj4` is likely "StopNitroServer").
	end
	-- Server command handler (`em.klm31351`) that updates the client's current nitro amount and maximum capacity.
	function em.klm31351(n, m) -- `klm31351` is an obfuscated event name (likely "UpdateNitroAmount"). `n` is current nitro, `m` is max nitro.
		VehicleStuff.Nitro = n -- Updates the local `Nitro` amount.
		VehicleStuff.NitroLastMax = m -- Updates the local `NitroLastMax` capacity.
		VehicleStuff.NitroForceUIUpdate = true -- Sets a flag to force the nitro UI to update on the next heartbeat.
		-- Directly updates the size of the nitro bar UI element.
		NitroShopGui.Container.Container.ContainerBar.Value.Size = UDim2.new(n / Settings.Scalar.NitroMax, 0, 1, 0)
		-- Updates the text display for nitro amount (e.g., "50/100").
		NitroShopGui.Container.Container.ContainerFuel.Amount.Text = ("%d/%d"):format(n, Settings.Scalar.NitroMax)
	end
end

--// RENDER STEP & HEARTBEAT LOOPS //--
-- These loops handle continuous updates for UI, vehicles, and character animations, optimized for different frequencies and phases of the game engine.
local t2 = 0 -- `t2`: Timer used for debouncing the character looking animation replication to the server.
local TargetLookPosition = v3b -- `TargetLookPosition`: A `Vector3` representing the smoothed target position the camera is looking at.
RunService.RenderStepped:Connect(function(dt) -- `RenderStepped` runs every frame, *after* physics has completed and *before* the frame is rendered. It's ideal for smooth visual animations and camera updates.
	-- Updates the position and visual state of the circular action UI (e.g., "Hold E to interact" prompts).
	debug.profilebegin("CircleAction (position, renderstepped") -- Starts a profiling session for this block.
	UI.CircleAction.Update(dt) -- Calls the `Update` method of the `UI.CircleAction` module, passing delta time.
	debug.profileend() -- Ends the profiling session.
end)
-- `Stepped` runs every frame, *before* the physics simulation. It's ideal for applying forces or making changes that should be calculated before physics.
RunService.Stepped:Connect(function()
	-- If the local player is currently driving a vehicle and is not a passenger.
	if mVehiclePacket and not mVehiclePacket.Passenger then
		-- Dispatches the `UpdateStepped` call to the appropriate chassis module based on the vehicle's `Type`.
		if mVehiclePacket.Type == "Chassis" then
			Classes.Chassis.UpdateStepped(mVehiclePacket)
			return -- Exits early as only one chassis type is active for the local player.
		end
		if mVehiclePacket.Type == "Motorcycle" or mVehiclePacket.Type == "DuneBuggy" then
			Classes.Chassis2.UpdateStepped(mVehiclePacket)
		end
	end
end)
local mAreTiresPopped = false -- Local cache for the vehicle's tire-popped state, used to detect changes.
RunService.Heartbeat:Connect(function(p290) -- `Heartbeat` runs every physics frame, *after* `Stepped` and *before* `RenderStepped`. Suitable for general game logic and visual updates. `p290` is delta time (`dt`).
	debug.profilebegin("Vehicle Heartbeat") -- Starts a profiling session for this block.
	-- If the local player is currently driving a vehicle and is not a passenger.
	if mVehiclePacket and not mVehiclePacket.Passenger then
		-- Dispatches the main `Update` call to the appropriate vehicle module based on the vehicle's `Type` or `Make`.
		if mVehiclePacket.Type == "Chassis" then
			Classes.Chassis.Update(mVehiclePacket, p290)
		elseif mVehiclePacket.Type == "Heli" then
			Classes.Heli.Update(mVehiclePacket, p290)
		elseif mVehiclePacket.Type == "Custom" then
			if mVehiclePacket.Make == "Volt" then -- Specific update for "Volt" if it's a custom type.
				Classes.Volt.Update(mVehiclePacket, p290)
			end
		elseif mVehiclePacket.Type == "Motorcycle" or mVehiclePacket.Type == "DuneBuggy" then
			Classes.Chassis2.UpdateHQ(mVehiclePacket, p290) -- Calls a "High Quality" update for these types.
		end
	end
	debug.profileend() -- Ends the profiling session.
	-- Manages nitro consumption and updates the nitro UI.
	-- This block specifically excludes Helicopters and a "Chassis3" type from nitro mechanics.
	if mVehiclePacket and (not mVehiclePacket.Passenger and (mVehiclePacket.Type ~= "Heli" and mVehiclePacket.Type ~= "Chassis3")) then
		local AreTiresPopped = mVehiclePacket.AreTiresPopped -- Current tire-popped state from the vehicle packet.
		local UpdateNitro = false -- Flag to trigger a nitro UI update.
		if VehicleStuff.NitroForceUIUpdate then -- Checks if a UI update was explicitly requested (e.g., after server update).
			VehicleStuff.NitroForceUIUpdate = false
			UpdateNitro = true
		end
		if VehicleUtils._forceUpdateNitroBar then -- Checks for another internal flag to force UI update.
			VehicleUtils._forceUpdateNitroBar = false
			UpdateNitro = true
		end
		if mVehiclePacket.Nitro then -- If nitro is currently active.
			VehicleStuff.Nitro = VehicleStuff.Nitro - p290 * 5 -- Decreases nitro amount over time (5 units per second).
			UpdateNitro = true -- Forces UI update.
		end
		if VehicleStuff.Nitro < 0 then -- If nitro runs out.
			VehicleStuff.Nitro = 0 -- Clamp nitro to 0.
			StopNitro() -- Deactivate nitro.
			UpdateNitro = true -- Forces UI update.
		end
		-- Handles nitro state changes related to tires popping.
		if AreTiresPopped then
			StopNitro() -- If tires pop, stop nitro.
			UpdateNitro = true -- Forces UI update.
		elseif AreTiresPopped ~= mAreTiresPopped and mVehiclePacket._isNitroPressed then
			-- If tires just un-popped and nitro button is still pressed, re-start nitro.
			StartNitro()
			UpdateNitro = true
		end
		if AreTiresPopped ~= mAreTiresPopped then -- Updates the cached tire-popped state.
			mAreTiresPopped = AreTiresPopped
		end
		if UpdateNitro then -- If a UI update is needed.
			local Scale = VehicleStuff.Nitro / Settings.Scalar.NitroMax -- Calculate the nitro bar scale.
			VehicleUtils.updateSpdBarRatio(Scale) -- Updates a shared speed bar ratio (likely for a UI element).
		end
	end
end)

--// CHARACTER LOOKING ANIMATION //--
-- This system makes the local player's character's head and upper torso look towards the camera's direction,
-- and also animates other players' characters based on replicated data from the server.
local CurrentLooking = { -- Stores the current `Transform` CFrames for the local player's Waist and Neck joints.
	Waist = CFrame.new(),
	Neck = CFrame.new()
}
RunService.Stepped:Connect(function() -- `Stepped` is used as this animation needs to be in sync with physics.
	debug.profilebegin("Camera Looking") -- Starts a profiling session for this block.
	local t3 = tick() -- `t3`: Current `tick()` time, used for debouncing replication to the server.
	-- Smoothly interpolates the `TargetLookPosition` towards the current camera's look direction.
	-- This prevents jerky head movements from direct camera CFrame.
	TargetLookPosition = TargetLookPosition + (CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * 30 - TargetLookPosition) * 0.2
	local Character = LocalPlayer.Character
	if Character then
		local Humanoid = Character:FindFirstChild("Humanoid")
		-- Only animate if the player is alive, has a `HumanoidRootPart`, and is not in a vehicle (`mVehiclePacket` is nil).
		local HumanoidRootPart = Humanoid and Humanoid.Health > 0 and (not mVehiclePacket and Humanoid.RootPart)
		if HumanoidRootPart then
			local Head = Character:FindFirstChild("Head")
			local UpperTorso = Character:FindFirstChild("UpperTorso")
			if Head and UpperTorso then
				local Waist = UpperTorso:FindFirstChild("Waist") -- The `Motor6D` joint for the waist.
				local Neck = Head:FindFirstChild("Neck") -- The `Motor6D` joint for the neck.
				if Waist and Neck then
					local Heading = 0 -- Initial heading angle.
					local Pitch = 0 -- Initial pitch angle.
					debug.profilebegin("Calculate looking") -- Starts a profiling session for the calculation part.
					local WaistC1, NeckC1 -- Variables to store the calculated C1 transforms for the joints.
					-- Only calculate look direction if the player is not crawling.
					if not ShouldCrawl then
						local u = HumanoidRootPart.CFrame.lookVector -- The character's current forward vector.
						local v = (CurrentCamera.CFrame * cfa(0.2, 0, 0)).LookVector -- The camera's look vector, with a slight vertical offset (0.2 radians pitch).
						if m.IsNaNv3(v) then -- NaN check for the camera vector.
							v = v3(0, 0, -1) -- Default to looking forward if NaN.
						end
						-- Calculates `Heading` (yaw) and `Pitch` (vertical angle) from dot products between character's forward/up and camera's look vector.
						-- `Heading`: Dot product of character's forward and camera's sideways vector (cross product of camera look and world Y).
						-- `Pitch`: Arcsin of camera's Y component (vertical angle).
						local calculatedHeading, calculatedPitch = u:Dot(v:Cross(Vector3.new(0, 1, 0))), math.asin(v.Y)
						-- Disables looking animation if in a vehicle (and not a passenger or `NoLook` flag is set) or holding an item.
						if mVehiclePacket and (not mVehiclePacket.Passenger or mVehiclePacket.NoLook) then
							Heading = 0
							Pitch = 0
						elseif ItemSystem.GetLocalEquipped() then -- If an item is currently equipped.
							Heading = 0
							Pitch = 0
						else
							Heading = calculatedHeading
							Pitch = calculatedPitch
						end
						-- Sanitize NaN values for Heading and Pitch.
						Heading = m.IsNaN(Heading) and 0 or Heading
						Pitch = m.IsNaN(Pitch) and 0 or Pitch
						-- Creates the CFrame transformations (`C1`) for the Waist and Neck joints.
						-- These transformations apply rotations based on the calculated `Heading` and `Pitch`.
						WaistC1 = cfa(0, -Heading * 0.5 * 1, 0) * cfa(-Pitch * 0.2 * 1, 0, 0)
						NeckC1 = cfa(-Pitch * 0.5 * 1, 0, 0) * cfa(0, -Heading * 0.5 * 1, 0)
					else
						-- If crawling, set joint transforms to identity (no looking animation).
						WaistC1 = CFrame.identity
						NeckC1 = CFrame.identity
					end
					-- Sanitize CFrame values (`WaistC1`, `NeckC1`) if they somehow became NaN.
					if m.IsNaNcf(WaistC1) then WaistC1 = CFrame.identity end
					if m.IsNaNcf(NeckC1) then NeckC1 = CFrame.identity end
					-- Applies the calculated `Transform` to the `Motor6D` joints.
					-- It multiplies the current `Transform` by the inverse of the new `C1`, then by the new `C1`. This is a common pattern to apply a relative transform.
					-- The `if Waist.Transform ~= CurrentLooking.Waist` check debounces updates to prevent unnecessary writes.
					if Waist.Transform ~= CurrentLooking.Waist then
						Waist.Transform = Waist.Transform * WaistC1:Inverse()
						CurrentLooking.Waist = Waist.Transform
					end
					if Neck.Transform ~= CurrentLooking.Neck then
						Neck.Transform = Neck.Transform * NeckC1:Inverse()
						CurrentLooking.Neck = Neck.Transform
					end
					-- Replicates the player's look direction to the server with a cooldown (0.4 seconds) to save bandwidth.
					if t3 - t2 >= 0.4 then
						t2 = t3 -- Resets the replication timer.
						if m.IsNaN(Heading) then Heading = 0 end -- Final NaN check before sending.
						if m.IsNaN(Pitch) then Pitch = 0 end
						if em.hems then -- Checks if the encryption map has been received (meaning secure communication is active).
							-- Fires an obfuscated remote event to the server, sending `Heading` and `Pitch`.
							-- `x` + reversed (`tlqz4` sub `3,3`) -> "q" + reversed (`yza1xb9z2wp` sub `5,7`) -> "bz9" + "zjq".
							-- The final obfuscated name is "xqbzzjq".
							Event:FireServer("x" .. ("tlqz4"):sub(3, 3):reverse():reverse():reverse() .. ("yza1xb9z2wp"):sub(5, 7):reverse():reverse():reverse():reverse():reverse() .. "zjq", Heading, Pitch)
						end
					end
					debug.profileend() -- Ends the profiling session for calculation.
				end
			end
		end
	end
	-- Animates OTHER players' characters based on the looking data (`Packet`) received from the server.
	for PlayerName, Packet in pairs(Looking) do
		local Player = Players:FindFirstChild(PlayerName)
		if not ItemSystem.GetEquipped(Player) then -- Only animate if the other player is not holding an item (as items might override animations).
			-- Uses `Spring` objects (`HeadingSpring`, `PitchSpring`) for smooth, damped animation of head/neck rotation.
			local hp, hv = m.Spring(Packet.HeadingSpring) -- Gets current position (`hp`) and velocity (`hv`) from HeadingSpring.
			local pp, pv = m.Spring(Packet.PitchSpring) -- Gets current position (`pp`) and velocity (`pv`) from PitchSpring.
			local Waist = Packet.Waist -- Reference to the other player's Waist `Motor6D`.
			if Waist then
				local WaistC1 = cfa(-pp * 0.2, -hp * 0.5, 0) -- Calculates `C1` transform for the Waist based on spring positions.
				if m.IsNaNcf(WaistC1) then WaistC1 = cfb end -- NaN check for `WaistC1`.
				-- Applies the animated `Transform` to the `Waist` joint.
				-- This uses a trick: if `Waist.Transform` hasn't changed from `LastWaistTransform`, apply `WaistC1` directly.
				-- Otherwise, calculate a relative transformation to avoid fighting Roblox's animation system.
				if Waist.Transform == Packet.LastWaistTransform then
					Waist.Transform = WaistC1
				else
					Waist.Transform = Waist.Transform * WaistC1:Inverse()
				end
				Packet.LastWaistTransform = Waist.Transform -- Updates `LastWaistTransform` cache.
			end
			local Neck = Packet.Neck -- Reference to the other player's Neck `Motor6D`.
			if Neck then
				local NeckC1 = cfa(-pp * 0.5, -hp * 0.5, 0) -- Calculates `C1` transform for the Neck.
				if m.IsNaNcf(NeckC1) then NeckC1 = cfb end -- NaN check for `NeckC1`.
				-- Applies the animated `Transform` to the `Neck` joint, using the same logic as for the Waist.
				if Neck.Transform == Packet.LastNeckTransform then
					Neck.Transform = NeckC1
				else
					Neck.Transform = Neck.Transform * NeckC1:Inverse()
				end
				Packet.LastNeckTransform = Neck.Transform -- Updates `LastNeckTransform` cache.
			end
		end
	end
	debug.profileend() -- Ends the main profiling session for "Camera Looking".
end)

--// LOW-QUALITY VEHICLE UPDATES (PERFORMANCE) //--
-- These functions handle simplified visual updates for vehicles that are far away from the local player.
-- They run less frequently and with less detail to save performance on distant objects.
local TireSounds = { -- Table mapping tire sound names to their Roblox asset IDs.
	tire_pop = 4534995816,
	tire_leak = 4534995685
}
-- Updates all vehicle types with a common low-quality visual and sound logic, independent of chassis type.
local function UpdateAllLowQuality(Packet, dt) -- `Packet`: the vehicle data packet, `dt`: delta time.
	local Model = Packet.Model -- The vehicle's model.
	if not Model then
		warn("No model exists to update LowQuality")
		return
	end
	local Engine = Model:FindFirstChild("Engine") -- The vehicle's engine part.
	if Engine then -- This `if` condition seems inverted, likely intended `if not Engine then warn(...) return end`.
		warn("No engine exists to update LowQuality")
		return
	end
	local Velocity = Engine.CFrame:vectorToObjectSpace(Engine.Velocity) -- Vehicle's velocity in its own local space.
	local IsDrifting = Model:GetAttribute("VehicleIsDrifting") -- Checks if the vehicle is currently flagged as drifting.
	-- Updates drift sound volume based on lateral (sideways) velocity.
	if Packet.Sounds and Packet.Sounds.DriftSqueal then
		local mv = Packet.Type == "Motorcycle" and 2 or 10 -- Minimum lateral velocity threshold for drift sound (lower for motorcycles).
		local AbsVelocityX = abs(Velocity.X) -- Absolute lateral velocity.
		if AbsVelocityX > mv then
			Packet.Sounds.DriftSqueal.Volume = math.min((AbsVelocityX - mv) / 6, 1) * 0.3 -- Scales volume with velocity above threshold.
		else
			Packet.Sounds.DriftSqueal.Volume = 0 -- No drift sound if below threshold.
		end
	end
	-- Emits drift particles if the vehicle is drifting and on the ground.
	local Params = RaycastParams.new() -- Creates new raycast parameters.
	Params.FilterDescendantsInstances = { Model } -- Ignores the vehicle model itself in raycasts.
	Params.IgnoreWater = true -- Raycast ignores water.
	local Preset = Model:FindFirstChild("Preset") -- Attempts to find a "Preset" model within the vehicle.
	if Preset then
		for _, v in Preset:GetChildren() do -- Iterates through children of the "Preset" model.
			if v.Name == "Drift" then -- Checks if the child is named "Drift" (likely a part containing a particle emitter).
				local Drift = v:FindFirstChildOfClass("ParticleEmitter") -- Finds the `ParticleEmitter` within the "Drift" part.
				-- Emits particles if drifting (`IsDrifting` is true) and a raycast downwards from the particle emitter hits a collidable surface.
				if Drift and (IsDrifting and Raycast.collidable(v.Position + Vector3.new(0, 4, 0), Vector3.new(-0, -1, -0), 8, Params)) then
					Drift:Emit(2) -- Emits 2 particles.
				end
			end
		end
	end
end
-- Updates visual and sound aspects for distant `Chassis`-type vehicles (e.g., cars).
local function UpdateChassisLowQuality(Packet, dt) -- `Packet`: vehicle data, `dt`: delta time.
	local Model = Packet.Model -- The vehicle's model.
	local Height = Packet.Height -- The vehicle's suspension height.
	if not Model then
		warn("No model exists to update LowQuality") -- Warns if model is missing.
		return
	end
	local Engine = Model:FindFirstChild("Engine") -- The vehicle's engine part.
	if Engine then -- This `if` condition seems inverted, likely intended `if not Engine then warn(...) return end`.
		warn("No engine exists to update LowQuality")
		return
	end
	-- Calculates wheel rotation based on the vehicle's forward/backward velocity.
	local Velocity = Engine.CFrame:vectorToObjectSpace(Engine.Velocity) -- Vehicle velocity in its local space.
	local Distance = Velocity.Z * dt -- Distance traveled along the forward axis.
	-- `WheelRotation` is updated by adding distance traveled (scaled by wheel radius) and normalized to 0-2pi.
	local WheelRotation = (Packet.WheelRotation + Distance / (Packet.Wheels[1].Model.PrimaryPart.Size.Y / 2)) % 6.283185307179586 -- 6.283... is 2 * Pi.
	Packet.WheelRotation = WheelRotation -- Stores the new wheel rotation.
	local GarageSuspensionHeight = Model:GetAttribute("GarageSuspensionHeight") -- Retrieves suspension height from a `GarageSuspensionHeight` attribute.
	if GarageSuspensionHeight then
		Height = Height + GarageSuspensionHeight -- Adds garage upgrade height.
	end
	-- Iterates through each wheel and calls the low-quality wheel update function.
	for _, Thruster in pairs(Packet.Wheels) do
		Classes.Chassis.UpdateWheelLowQuality(Model, Height, Thruster, WheelRotation) -- Calls a simplified wheel update for visuals.
	end
	-- Updates engine sound based on speed and gears using a low-quality sound function.
	Classes.Chassis.UpdateSoundLowQuality(Packet, Packet.Gears, Velocity)
	-- Checks if tires are popped based on time since last pop and plays sounds accordingly.
	local VehicleTiresLastPop = Model:GetAttribute("VehicleTiresLastPop") -- Retrieves last tire pop timestamp from an attribute.
	local Scale = (Time.GetNowSync() - VehicleTiresLastPop) / Packet.DisableDuration -- Calculates a normalized scale (0-1) for tire health/duration.
	local AreTiresPopped = math.min(Scale, 1) < 0.999 -- Flags tires as popped if scale is very low.
	if Packet.AreTiresPopped ~= AreTiresPopped then -- Detects a change in tire pop state.
		if AreTiresPopped then
			local Options = { Volume = 1 } -- Options for playing sound.
			Audio.ObjectLocal(Engine, TireSounds.tire_pop, Options) -- Plays tire pop sound locally.
			Audio.ObjectLocal(Engine, TireSounds.tire_leak, Options) -- Plays tire leak sound locally.
		end
		Packet.AreTiresPopped = AreTiresPopped -- Updates the vehicle packet's tire pop state.
	end
end
-- Updates physics-related visuals for distant `Chassis`-type vehicles' drivers, specifically steering animation using IK.
local function UpdateChassisStepped(Packet) -- `Packet`: the vehicle data packet.
	-- `upvalues`: References to `Players`, `R15IKv2`, `cfa`, `v3` from outer scope.
	local IKP = Packet.IKP -- The Inverse Kinematics Packet for the driver's arms.
	local Model = Packet.Model -- The vehicle's model.
	local Engine = Model:FindFirstChild("Engine") -- The vehicle's engine part.
	if Engine then
		-- Builds an IK packet for the driver if it doesn't already exist for this vehicle (for other players).
		if not IKP then
			local Player = Players:FindFirstChild(Packet.PlayerName) -- Finds the player associated with the vehicle.
			if not Player then return end
			local Character = Player.Character
			if not Character then return end
			local Humanoid = Character:FindFirstChild("Humanoid")
			if not Humanoid then return false end
			if not Humanoid.RootPart then return false end
			IKP = R15IKv2.BuildPacketArms(Character) -- Builds the IK packet from the character.
			Packet.IKP = IKP -- Stores the created IK packet in the vehicle packet.
		end
		-- Animates the driver's arms to follow the steering wheel.
		local a = 0.5 * Engine.RotVelocity.Y -- Calculates a steering angle based on the engine's angular velocity around Y.
		if Packet.WeldSteer and IKP then -- Checks if steering weld and IK packet exist.
			Packet.WeldSteer.C0 = cfa(0, a, 0) -- Applies rotation to the steering wheel's `Motor6D` weld.
			local Offset = Model.Steer.Size.X * 0.5 - 0.2 -- Calculates an offset for hand positions based on steering wheel size.
			local SteerCFrame = Model.Steer.CFrame -- World CFrame of the steering wheel.
			IKP.RightArm = SteerCFrame * v3(Offset, 0.1, 0) -- Sets the target world position for the right arm.
			IKP.RightAngle = -a - 0.6 -- Sets the target angle for the right arm to match steering.
			IKP.LeftArm = SteerCFrame * v3(-Offset, 0.1, 0) -- Sets the target world position for the left arm.
			IKP.LeftAngle = -a + 0.6 -- Sets the target angle for the left arm.
			R15IKv2.Arms(IKP) -- Applies the Inverse Kinematics to animate the arms.
		end
	end
end
-- Low-quality update for `Heli`-type vehicles (e.g., spinning rotors) for distant helicopters.
local function UpdateHeliLowQuality(Packet, dt) -- `Packet`: vehicle data, `dt`: delta time.
	local Model = Packet.Model
	if not Model then return end
	if not Model:FindFirstChild("Engine") then return end
	-- Dispatches to specific spin functions based on helicopter type (prop, UFO, crew capsule, drone).
	if Packet.HasProp then
		Classes.Heli.SpinProp(Packet, dt)
		return
	elseif Packet.IsUFO then
		Classes.Heli.SpinUFO(Packet, dt)
		return
	elseif Packet.IsCrewCapsule then
		Classes.Heli.SpinCrewCapsule(Packet, dt)
	elseif Packet.IsDrone then
		Classes.Heli.SpinDrone(Packet, dt)
	end
end

--// VEHICLE HORN SYSTEM //--
-- This section handles client-side logic for vehicle horns, including playing sounds locally and replicating to the server.
local t3 = 0 -- `t3`: Debounce timer for horn activation.
-- Plays or stops a horn sound on a given source part.
local function playHorn(Source, Play, SoundId, Looped, Expire) -- `Source`: The part to parent the sound to, `Play`: true to play, false to stop, `SoundId`: Asset ID, `Looped`: true if looping, `Expire`: duration.
	Expire = Expire or 16 -- Default expiration time for sound if not specified.
	local Sound = Source:FindFirstChild("_HornSound") -- Checks if a horn sound is already playing on this source.
	if Sound then
		Sound:Destroy() -- Destroys any existing horn sound to prevent overlaps.
	end
	if Play then -- If the intention is to play the horn.
		local Sound = Audio.ObjectLocal(Source, SoundId, { -- Creates and plays a local sound instance.
			Looped = Looped
		})
		Sound.Name = "_HornSound" -- Assigns a specific name for easy lookup.
		Sound.Parent = Source -- Parents the sound to the source part.
		-- Schedules a task to destroy the sound after `Expire` seconds.
		task.delay(Expire, function()
			if Sound.Parent == Source then -- Double check sound hasn't been re-parented/destroyed elsewhere.
				Sound:Destroy()
			end
		end)
	end
end
-- Called when the local player presses the horn key/button.
local function HornStart()
	local t = os.clock() -- Current time.
	if t - t3 >= 0.05 then -- Debounce for 0.05 seconds to prevent rapid toggling.
		t3 = t -- Resets debounce timer.
		if mVehiclePacket and not mVehiclePacket.Passenger then -- If player is driving a vehicle.
			local Model = mVehiclePacket.Model -- The vehicle model.
			-- Plays the horn sound using attributes from the vehicle model (VehicleHornId, VehicleHornLoopable).
			playHorn(Model:FindFirstChild("BoundingBox"), true, Model:GetAttribute("VehicleHornId"), (Model:GetAttribute("VehicleHornLoopable")))
			-- Fires an obfuscated remote event to the server to notify it that the horn started.
			-- `d` + reversed (`ijeqwmtoja` sub `3,8`) -> "qwmtoja" + "z".
			-- The final obfuscated name is "dqwmtojaz".
			Event:FireServer("d" .. ("ijeqwmtoja"):sub(3, 8):reverse():reverse():reverse() .. "z", true)
		end
	end
end
-- Called when the local player releases the horn key/button.
local function HornStop()
	if mVehiclePacket and not mVehiclePacket.Passenger then -- If player is driving a vehicle.
		playHorn(mVehiclePacket.Model:FindFirstChild("BoundingBox"), false) -- Stops the horn sound.
		-- Fires an obfuscated remote event to the server to notify it that the horn stopped.
		-- `d` + reversed (`b4mtot1py` sub `3,5`) -> "tom" + "wqez".
		-- The final obfuscated name is "dtomwqez".
		Event:FireServer("d" .. ("b4mtot1py"):sub(3, 5):reverse():reverse():reverse() .. "wqez", false)
	end
end
-- Server command handler (`em.dotmwqez`) that tells this client to play another player's horn sound.
function em.dotmwqez(Player, Source, Play, SoundId, Looped) -- `dotmwqez` is an obfuscated event name (likely "PlayHornClient"). Arguments are player, sound source, play flag, ID, loop flag.
	playHorn(Source, Play, SoundId, Looped, 10) -- Plays the horn locally with an expiration of 10 seconds.
end

--// PLAYER MOVEMENT & ACTIONS (CRAWL, PUNCH) //--
-- This section defines client-side logic for player movement states (crawling) and actions (punching).
local CrawlAnimation = Instance.new("Animation") -- `Animation` instance for the crawling animation.
if RunUtils.getEnv() == RunConsts.QA_NAME then -- Checks if running in QA environment.
	CrawlAnimation.AnimationId = "rbxassetid://10866609111" -- Specific animation ID for QA.
else
	CrawlAnimation.AnimationId = "rbxassetid://685258011" -- Default animation ID for other environments.
end
local CrawlTrack, PunchAnimation -- `CrawlTrack`: `AnimationTrack` for crawling. `PunchAnimation`: table of `Animation` instances for punching.
PunchAnimation = {} -- Initializes `PunchAnimation` as an empty table.
do -- Block to populate `PunchAnimation` with different punch animation IDs.
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://758003506"
	table.insert(PunchAnimation, Anim)
	local Anim = Instance.new("Animation")
	Anim.AnimationId = "rbxassetid://758005053"
	table.insert(PunchAnimation, Anim)
end
local PunchTrack = nil -- `PunchTrack`: `AnimationTrack` for the currently playing punch animation.
local lastPunch = tick() -- `lastPunch`: `tick()` time of the last punch, used for cooldown.
local lastCrawl = tick() -- `lastCrawl`: `tick()` time of the last crawl toggle attempt, used for cooldown.
local Crawling = { 0, 0, 0 } -- `Crawling`: A table tracking recent crawl toggle attempts, used for a specific cooldown mechanism (length 3, with timestamps).
-- Toggles the crawling state for the local player. This involves manipulating joints and collision.
local function toggleCrawling()
	local Character = LocalPlayer.Character
	local Humanoid = Character:FindFirstChild("Humanoid")
	local HumanoidRootPart = Character.PrimaryPart -- Assuming PrimaryPart is `HumanoidRootPart`.
	ShouldCrawl = not CrawlTrack -- Toggles the `ShouldCrawl` flag based on whether a `CrawlTrack` is active.
	CharacterUtil.IsCrawling = ShouldCrawl -- Updates a shared utility flag for crawling state.
	local UpperTorso = Character:FindFirstChild("UpperTorso")
	local LowerTorso = Character:FindFirstChild("LowerTorso")
	local Joints = {} -- Table to store references to torso joints that will be temporarily broken.
	-- `Recurse` is a recursive helper function to find and temporarily "break" (set `Part0`/`Part1` to nil)
	-- the joints connected to the `UpperTorso` and `LowerTorso`. This allows forcing a prone animation.
	local function Recurse(m) -- `m` is the current model/part to recurse through.
		for _, v in next, m:GetChildren() do
			-- If `v` is a `JointInstance` and connects to either torso part.
			if v:IsA("JointInstance") and (v.Part1 == UpperTorso or (v.Part1 == LowerTorso or (v.Part0 == UpperTorso or v.Part0 == LowerTorso))) then
				table.insert(Joints, { -- Store joint details to re-connect later.
					Motor = v,
					Part0 = v.Part0,
					Part1 = v.Part1
				})
				v.Part0 = nil -- Break the joint temporarily.
				v.Part1 = nil
			end
			Recurse(v) -- Recurse into children.
		end
	end
	Recurse(Character) -- Starts recursion from the character model.
	if ShouldCrawl then
		-- When crawling, a dummy `Ball` part is created and welded to `HumanoidRootPart`.
		-- This changes the character's collision box to a lower, wider shape, simulating crawling collision.
		local b = Instance.new("Part")
		b.Shape = Enum.PartType.Ball
		b.Size = Vector3.new(2, 1, 4)
		b.Name = "Ball"
		b.CanCollide = true
		b.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 1, 1) -- Sets custom physical properties (e.g., low density for easier movement).
		b.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, 1) -- Positions slightly ahead of root part.
		b.Transparency = 1 -- Makes it invisible.
		b.Parent = Character -- Parents to character.
		Joint.CustomWeld(b, HumanoidRootPart, CFrame.new(0, 1, 0), cfb) -- Creates a custom weld between `Ball` and `HumanoidRootPart`.
	else
		-- When stopping crawling, the `Ball` part is destroyed.
		local b = Character:FindFirstChild("Ball")
		if b then
			b:Destroy()
		end
	end
	-- Re-enables the previously "broken" torso joints.
	for _, v in ipairs(Joints) do
		v.Motor.Part0, v.Motor.Part1 = v.Part0, v.Part1
	end
	Character.HumanoidRootPart.CanCollide = not ShouldCrawl -- Sets `HumanoidRootPart`'s `CanCollide` based on crawling state (can't collide when crawling to prevent getting stuck).
	if CrawlTrack then -- If `CrawlTrack` already exists (meaning player is currently crawling).
		CrawlTrack:Stop() -- Stops the animation.
		CrawlTrack = nil -- Clears the `CrawlTrack` reference.
		return -- Exits the function.
	end
	CrawlTrack = Humanoid:LoadAnimation(CrawlAnimation) -- Loads the `CrawlAnimation` onto the `Humanoid`.
	CrawlTrack:Play() -- Plays the crawling animation.
end
-- Sets the sprinting state for the player.
local function _setSprinting(Sprinting) -- `Sprinting` is a boolean.
	ShouldSprint = Sprinting -- Updates the `ShouldSprint` flag.
end
-- A wrapper function to `_setSprinting` that also updates the UI button state.
local function setSprinting(Sprinting) -- `Sprinting` is a boolean.
	_setSprinting(Sprinting) -- Calls the internal sprinting setter.
	-- This complex condition checks if the UI sprint button's state (`_pressed`) is out of sync with `Sprinting`
	-- and if the `_pressState` callback exists, then it calls `_pressState` to update the UI.
	if not not Sprinting ~= not not DefaultActions.sprintButton._pressed and DefaultActions.sprintButton._pressState then
		DefaultActions.sprintButton._pressState()
	end
end
-- Attempts to toggle the crawling state, with various checks to prevent it under certain conditions.
local function attemptToggleCrawling()
	local Character = LocalPlayer.Character
	if not Character then return end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then return end
	if not CrawlTrack and Humanoid.Sit then return end -- Cannot start crawling if sitting.
	if not CrawlTrack and Humanoid.PlatformStand then return end -- Cannot start crawling if on platform stand.
	if not Character.PrimaryPart then return end
	if Classes.Heli.Roped then return end -- Cannot crawl if roped to a helicopter.
	if Falling.IsRagdolling() then return end -- Cannot crawl if ragdolling.
	if Paraglide.IsFlying() then return false end -- Cannot crawl if paragliding.
	if not InventoryItemSystem.unequipAll() then return end -- Attempts to unequip all items; if it fails (e.g., locked item), cannot crawl.
	local ItemStack = ItemSystem.GetLocalEquipped()
	if ItemStack and ItemStack.ItemData.Locked then return end -- Cannot crawl if holding a locked item.
	if tick() - lastCrawl < 0.1 then return end -- Cooldown for rapid crawl toggling.
	if tick() - Crawling[#Crawling] < 2 then return end -- Additional cooldown mechanism based on `Crawling` table.
	lastCrawl = tick() -- Resets `lastCrawl` timer.
	if CrawlTrack then -- If already crawling (about to stop).
		table.remove(Crawling) -- Removes oldest entry from `Crawling` table.
		table.insert(Crawling, 1, lastCrawl) -- Inserts new timestamp at the beginning.
	end
	toggleCrawling() -- Calls the actual `toggleCrawling` function.
end
-- Attempts to perform a punch action.
local function attemptPunch()
	if tick() - lastPunch < 0.5 then return end -- Cooldown of 0.5 seconds between punches.
	local Character = LocalPlayer.Character
	if not Character then return end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then return end
	-- Can only punch if no item is currently equipped.
	if not ItemSystem.GetLocalEquipped() then
		if PunchTrack then
			PunchTrack:Stop() -- Stops any currently playing punch animation.
		end
		local v = table.remove(PunchAnimation, 1) -- Removes the first animation from the `PunchAnimation` table.
		table.insert(PunchAnimation, v) -- Inserts it at the end, effectively cycling animations.
		PunchTrack = Humanoid:LoadAnimation(v) -- Loads the next punch animation.
		PunchTrack:Play() -- Plays the animation.
		lastPunch = tick() -- Resets the punch cooldown timer.
		-- Fires an obfuscated remote event to the server to notify of the punch (for hit detection).
		-- `k` + reversed (`wvy8kck` sub `3,6`) -> "8kv" + reversed (`z4ue` sub `2,2`) -> "4" + "bs".
		-- The final obfuscated name is "k8kv4bs".
		Event:FireServer("k" .. ("wvy8kck"):sub(3, 6):reverse() .. ("z4ue"):sub(2, 2):reverse():reverse():reverse() .. "bs")
	end
end
-- Initializes the default action handlers for UI buttons (e.g., sprint, crawl, punch).
require(ReplicatedStorage.Game.DefaultActions).init({
	setSprinting = setSprinting,
	attemptToggleCrawling = attemptToggleCrawling,
	attemptPunch = attemptPunch
})

--// SERVER-DRIVEN EVENT HANDLERS (`em` table) //--
-- This section defines the functions within the `em` table that respond to specific obfuscated events fired by the server.
-- Server command handler (`em.v0i28uy1`) that updates the client about the current prison schedule.
function em.v0i28uy1(s, NoMessage) -- `v0i28uy1` is an obfuscated event name (likely "UpdateSchedule"). `s` is the schedule string, `NoMessage` is a boolean.
	GameUtil.Schedule = s -- Updates the shared `GameUtil.Schedule`.
	if ChinaPolicyService and ChinaPolicyService:IsActive() then -- If China policy is active.
		NoMessage = true -- Suppress messages.
	end
	if NoMessage then return end -- If `NoMessage` is true, exit.
	if GameUtil.Team == Settings.EnumTeam.Prisoner then -- Only display message for prisoners.
		em.ht9y5ngc({ -- Calls the general notification function.
			Text = Localization:FormatByKey("Schedule." .. s) -- Localized schedule message (e.g., "Schedule.Yard").
		})
	end
end
-- Server command handler (`em.xq9bxzjq`) that sends another player's look direction data to this client.
function em.xq9bxzjq(PlayerName, Heading, Pitch) -- `xq9bxzjq` is an obfuscated event name (likely "UpdatePlayerLook").
	local Packet = Looking[PlayerName] -- Retrieves the animation packet for this player from the `Looking` table.
	if not Packet then -- If no packet exists for this player yet.
		Packet = {} -- Create a new packet.
		Packet.HeadingSpring = m.MakeSpring(0, 10, 0.8) -- Creates a `Spring` object for smooth heading animation.
		Packet.PitchSpring = m.MakeSpring(0, 10, 0.8) -- Creates a `Spring` object for smooth pitch animation.
		Looking[PlayerName] = Packet -- Stores the new packet.
	end
	local Player = Players:FindFirstChild(PlayerName) -- Finds the player instance.
	if not Player then
		Looking[PlayerName] = nil -- If player not found, clean up entry from `Looking` table.
		return
	end
	local Character = Player.Character
	if not Character then
		Looking[PlayerName] = nil -- If character not found, clean up.
		return
	end
	local UpperTorso = Character:FindFirstChild("UpperTorso")
	if not UpperTorso then
		Looking[PlayerName] = nil -- If UpperTorso not found, clean up.
		return
	end
	-- Store references to the `Motor6D` joints (`Waist`, `Neck`) for the animation loop.
	local Waist = UpperTorso:FindFirstChild("Waist")
	local Neck = Character.Head:FindFirstChild("Neck")
	Packet.Waist = Waist
	Packet.Neck = Neck
	-- Sets the target for the `Spring` objects. The animation loop will then smoothly move towards these targets.
	m.SpringSetTarget(Packet.HeadingSpring, Heading)
	m.SpringSetTarget(Packet.PitchSpring, Pitch)
end
local CartBinder = require(ReplicatedStorage.Game.Cart.CartBinder) -- Binder for shopping carts.
-- Handles the jump action, which has multiple contexts (e.g., exiting a vehicle, detaching from a rope).
local function OnJump()
	if mVehiclePacket then -- If the player is currently in a vehicle.
		VehicleUtils.OnVehicleJumpExited:Fire(mVehiclePacket) -- Fires a signal indicating vehicle exit by jump.
		-- Fires an obfuscated remote event to the server to notify of vehicle exit.
		-- `b` + reversed (`wr1fr` sub `3,4`) -> "1r" + reversed (`rtue4od` sub `5,5`) -> "4" + reversed (`dnotnusm8` sub `4,5`) -> "tonu" + reversed (`gy1imhqh` sub `5,5`) -> "m" + "l".
		-- The final obfuscated name is "b1r4tonuml".
		Event:FireServer("b" .. ("wr1fr"):sub(3, 4):reverse():reverse():reverse():reverse():reverse() .. ("rtue4od"):sub(5, 5):reverse():reverse():reverse() .. ("dnotnusm8"):sub(4, 5):reverse() .. ("gy1imhqh"):sub(5, 5):reverse() .. "l")
		VehicleUtils.LastVehicleExit = tick() -- Records the time of last vehicle exit.
	else
		-- Checks if the player is in a shopping cart and sends a server event to exit it.
		for _, Cart in ipairs(CartBinder:GetAll()) do
			if LocalPlayer.Character ~= nil and Cart:GetOccupant() == LocalPlayer.Character then
				Event:FireServer("bf14ntml") -- Fires event to exit cart.
				break
			end
		end
	end
	-- If hanging from a helicopter rope, attempts to detach.
	if Classes.Heli.Roped then
		Classes.Heli.AttemptRopeDetach()
	end
end
CharacterUtil.OnJump = OnJump -- Assigns the `OnJump` function to `CharacterUtil` for broader use.

--// DEATH & RESPAWN VISUALS //--
-- This section manages visual effects (e.g., blur, color correction) and UI transitions related to player death and respawn.
local Lighting = game:GetService("Lighting") -- Reference to the `Lighting` service.
local ColorCorrection = Instance.new("ColorCorrectionEffect") -- `ColorCorrectionEffect` for visual style changes on death.
ColorCorrection.Enabled = false -- Initially disabled.
ColorCorrection.Parent = Lighting -- Parented to `Lighting` so it applies globally.
local Blur = Instance.new("BlurEffect") -- `BlurEffect` for blurring the screen on death.
Blur.Size = 0 -- Initially no blur.
Blur.Enabled = false -- Initially disabled.
Blur.Parent = Lighting -- Parented to `Lighting`.
do
	local b, a -- `b`: end state values (normal), `a`: start state values (death effects).
	-- Smoothly fades out the death lighting effects (blur and color correction) back to normal.
	local function removeDeathLighting()
		if a then -- Checks if death lighting effects were applied.
			local t = 0 -- `t`: Animation progress (0 to 1).
			local Event = nil -- Variable to hold the `RenderStepped` connection.
			local function Stepped(dt) -- Callback function for `RenderStepped` for animation.
				t = t + dt * 2 -- Increases animation progress, animating over 0.5 seconds (1 / 2).
				if t >= 1 then
					if Event then Event:Disconnect() end -- Disconnects the `RenderStepped` connection when animation is complete.
					local v = LerpTable(a, b, 1) -- Final interpolation to ensure end state is exact.
					ColorCorrection.Saturation = v.Saturation
					Blur.Size = v.Blur
					Blur.Enabled = false -- Disables blur.
					ColorCorrection.Enabled = false -- Disables color correction.
				end
				local v = LerpTable(a, b, 1) -- This line seems to be a copy-paste error or is intended to be `LerpTable(a, b, t)` here too.
				ColorCorrection.Saturation = v.Saturation
				Blur.Size = v.Blur
			end
			Event = RunService.RenderStepped:connect(Stepped) -- Connects to `RenderStepped` for per-frame animation.
		end
	end
	-- Hides the death GUI (`DeathGui`) with a small animation.
	local function removeDeathGui()
		-- Tweens the `DeathGui.Frame` size and position off-screen.
		DeathGui.Frame:TweenSizeAndPosition(UDim2.new(1, 40, 0, 0), UDim2.new(0, -20, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
			DeathGui.Frame.Visible = false -- Makes the GUI invisible after the tween.
		end)
	end
	GameUtil.removeDeathGui = removeDeathGui -- Exposes `removeDeathGui` through `GameUtil`.
	GameUtil.removeDeathLighting = removeDeathLighting -- Exposes `removeDeathLighting` through `GameUtil`.
	-- Server command handler (`em.yzwfqfqc`) that tells the client the player has respawned.
	function em.yzwfqfqc() -- `yzwfqfqc` is an obfuscated event name (likely "RespawnClient").
		wait() -- Waits one frame to ensure character is fully loaded.
		local Character = LocalPlayer.Character
		if not Character then return end
		local Humanoid = Character:FindFirstChild("Humanoid")
		if Humanoid then return end -- This `if` condition seems inverted, likely intended `if not Humanoid then return end`.
		-- A safety check: if player respawns while somehow still in a seated/crawling state, untoggle crawling.
		Humanoid.Seated:connect(function(IsSeated)
			if IsSeated and CharacterUtil.IsCrawling then
				toggleCrawling()
			end
		end)
		removeDeathGui() -- Hides death GUI.
		removeDeathLighting() -- Fades out death lighting effects.
		if TouchEnabled then -- If on a touch-enabled device.
			setSprinting(true) -- Automatically sets sprinting to true (common for mobile default movement).
		end
	end
	local Store = require(ReplicatedStorage.App.store) -- Module for a Redux-like data store.
	-- Server command handler (`em.f5iqslof`) that tells the client the player has died.
	function em.f5iqslof(NoGui) -- `f5iqslof` is an obfuscated event name (likely "DeathClient"). `NoGui` is boolean to suppress GUI.
		-- Resets various player states upon death.
		ShouldCrawl = false
		CharacterUtil.IsCrawling = false
		ShouldSprint = false
		-- Updates sprint button UI state if it was out of sync.
		if (DefaultActions.sprintButton._pressed and true or false) ~= false and DefaultActions.sprintButton._pressState then
			DefaultActions.sprintButton._pressState()
		end
		Stunned = false
		OnJump() -- Calls `OnJump` on death, which typically handles exiting vehicles or other active states.
		Store:dispatch({ -- Dispatches an action to the global data store to record death time.
			type = "setLastDiedAt",
			lastDiedAt = workspace:GetServerTimeNow()
		})
		-- Shows the death UI and applies visual effects if `NoGui` is not true.
		if not NoGui then
			DeathGui.Frame.TextLabel.Text = Localization:FormatByKey("DeathMessage." .. math.random(0, 13)) -- Sets random localized death message.
			Blur.Enabled = true -- Enables blur effect.
			ColorCorrection.Enabled = true -- Enables color correction effect.
			b = {Blur = 0, Saturation = 0} -- Defines the "normal" (end) state for effects.
			a = {Blur = 8, Saturation = -1} -- Defines the "death" (start) state for effects (blurry, desaturated).
			local t, Event = 0, nil -- `t`: animation progress, `Event`: RenderStepped connection.
			local function Finish() -- Called when the animation completes.
				if Event then Event:Disconnect() end
				local v = LerpTable(b, a, 1) -- Final interpolation to ensure exact end state.
				ColorCorrection.Saturation = v.Saturation
				Blur.Size = v.Blur
			end
			-- Animates the transition of blur and saturation over time.
			local function Stepped(dt)
				t = t + dt * 1 -- Progresses animation `t` over 1 second.
				if t >= 1 then
					return Finish() -- Calls `Finish` when animation completes.
				end
				local v = LerpTable(b, a, t) -- Interpolates values based on `t`.
				ColorCorrection.Saturation = v.Saturation
				Blur.Size = v.Blur
			end
			Event = RunService.RenderStepped:connect(Stepped) -- Connects to RenderStepped.
			-- Animates the death message frame onto the screen after a delay.
			delay(0.5, function()
				DeathGui.Frame.Size = UDim2.new(1, 40, 0, 0) -- Initial size.
				DeathGui.Frame.Position = UDim2.new(0, -20, 0.5, 0) -- Initial position.
				-- Tweens the frame to its visible position.
				DeathGui.Frame:TweenSizeAndPosition(UDim2.new(1, 40, 0, 150), UDim2.new(0, -20, 0.5, -75), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
				DeathGui.Frame.Visible = true -- Makes the frame visible.
			end)
		end
	end
end
local JetPack = require(ReplicatedStorage.Game.JetPack.JetPack) -- Re-require JetPack (already required once).
-- Server command handler (`em.y8qqnalp`) that stuns the player.
function em.y8qqnalp(Time) -- `y8qqnalp` is an obfuscated event name (likely "StunPlayerClient"). `Time` is stun duration.
	Time = Time or Settings.Time.Stunned -- Defaults stun duration if not provided.
	Stunned = true -- Sets local stunned flag.
	Falling.StartRagdolling(Time) -- Initiates ragdolling for the stun duration.
	JetPack.Stunned() -- Calls `Stunned` method on `JetPack` (disables it).
	task.wait(Time) -- Waits for the stun duration.
	Stunned = false -- Clears local stunned flag after duration.
end
-- Server command handler (`em.ht9y5ngc`) that tells the client to display a simple notification message.
function em.ht9y5ngc(n) -- `ht9y5ngc` is an obfuscated event name (likely "DisplayNotification"). `n` is a table containing notification details.
	assert(n ~= nil) -- Asserts `n` is not nil.
	assert(n.Text ~= nil) -- Asserts `n` contains a `Text` field.
	Notification.new({ -- Creates a new notification.
		Text = n.Text,
		Duration = n.Duration
	})
end
PlayerStuff.Notification = em.ht9y5ngc -- Exposes `em.ht9y5ngc` as `PlayerStuff.Notification`.
-- Server command handler (`em.i621n0r0`) that tells the client to display a system message in the chat.
function em.i621n0r0(m, Color) -- `i621n0r0` is an obfuscated event name (likely "DisplaySystemMessage"). `m` is the message, `Color` is optional.
	if Color then
		m = RichTextUtils.addColorToText(m, Color) -- Adds color formatting if `Color` is provided.
	end
	pcall(function() -- Uses `pcall` to safely attempt displaying the message.
		TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(m, "BadimoSystemMessage") -- Displays message in "RBXGeneral" channel with a custom tag.
	end)
end
local Store = require(ReplicatedStorage.App.store) -- Re-require the Redux-like global data store.
local HomeStore = require(ReplicatedStorage.Home.homeStore) -- Home-specific data store.
-- Server command handler (`em.bwzd8uls`) that updates the player's cash balance and related UI.
function em.bwzd8uls(d) -- `bwzd8uls` is an obfuscated event name (likely "UpdateCash"). `d` is a table containing `Cash` amount.
	assert(d ~= nil) -- Asserts `d` is not nil.
	ScreenGui.BuyVehicle.Money.Text = FormatMoney(abs(d.Cash)) -- Updates money text on `BuyVehicle` GUI.
	CashBuyUI.SetCash(d.Cash) -- Updates cash display in `CashBuyUI`.
	-- Dispatches the new cash value to the global data stores.
	Store:dispatch({
		type = "setCash",
		cash = d.Cash
	})
	HomeStore:dispatch({
		type = "setCash",
		cash = d.Cash
	})
end
local CashProxy = 0 -- Proxy counter for debouncing cash gain/loss notifications.
-- Server command handler (`em.rzxrjhjt`) that tells the client to show a cash gain/loss notification (e.g., "+$500" effect).
function em.rzxrjhjt(Amount, Desc) -- `rzxrjhjt` is an obfuscated event name (likely "DisplayCashChange"). `Amount` is the cash change, `Desc` is an optional description.
	local mProxy = CashProxy + 1 -- Increments proxy for this notification.
	CashProxy = mProxy -- Updates global proxy.
	-- Sets text color based on whether `Amount` is positive (green) or negative (red).
	if Amount > 0 then
		task.spawn(Fireworks, 2) -- Launches 2 fireworks for cash gain.
		ScreenGui.PlusCash.TextColor3 = Color3.fromRGB(68, 194, 93)
		ScreenGui.PlusCash.TextStrokeColor3 = Color3.fromRGB(33, 97, 44)
	else
		ScreenGui.PlusCash.TextColor3 = Color3.fromRGB(240, 30, 30)
		ScreenGui.PlusCash.TextStrokeColor3 = Color3.fromRGB(180, 0, 0)
	end
	if not ScreenGui.PlusCash.Visible then
		ScreenGui.PlusCash.Text = "" -- Clears text if not visible before appending.
	end
	ScreenGui.PlusCash.Visible = true -- Makes the notification visible.
	ScreenGui.PlusCash.TextSize = 28
	ScreenGui.PlusCash.Font = Enum.Font.SourceSansBold
	ScreenGui.PlusCash.RichText = true
	-- Appends the new message to the existing text (allows multiple notifications to stack).
	if Desc then
		ScreenGui.PlusCash.Text = ScreenGui.PlusCash.Text .. ("<font color=\"#FFFFFF\"><stroke color=\"#111111\" thickness=\"0.75\">%s: </stroke></font><b>%s</b>\n"):format(Desc, FormatMoney(abs(Amount)))
	else
		ScreenGui.PlusCash.Text = ScreenGui.PlusCash.Text .. ("<b>%s</b>\n"):format(FormatMoney(abs(Amount)))
	end
	-- Hides the notification after a delay (3 seconds), but only if it's still the most recent one (using proxy).
	task.delay(3, function()
		if CashProxy == mProxy then
			ScreenGui.PlusCash.Visible = false
		end
	end)
end

--// VEHICLE STATE BINDER & STREAMING //--
-- This section handles client-side logic for vehicles streaming in and out of the player's view.
-- Callback function when a `VehicleState` object (representing a vehicle) is added (streams in).
local function _added(VehicleState)
	VehicleState.maid:GiveTask(function() -- Adds a cleanup task to the `VehicleState`'s maid.
		local RemovedPacket = VehicleState.packet -- The vehicle packet associated with the removed state.
		-- When a vehicle streams out, ensure its sounds and specific effects are stopped/reset.
		if RemovedPacket.Sounds then
			for _, v in next, RemovedPacket.Sounds do
				v.Volume = 0 -- Sets all vehicle sounds to zero volume.
			end
		end
		if RemovedPacket.Type == "Heli" then -- Special cleanup for helicopters.
			RemovedPacket.PropAlpha = 0 -- Resets propeller alpha.
			UpdateHeliLowQuality(RemovedPacket, 0) -- Calls low-quality update with zero delta time for final state.
		end
	end)
end
-- Applies the `_added` function to all `VehicleState` objects already present when the script starts.
for _, VehicleState in VehicleStateBinder:GetAll() do
	_added(VehicleState)
end
VehicleStateBinder:GetClassAddedSignal():Connect(_added) -- Connects `_added` to the signal for new `VehicleState` objects streaming in.
-- Server command handler (`em.ai0rs5gw`) that tells the client a player has left the game, so their "looking" data can be cleaned up.
function em.ai0rs5gw(PlayerName) -- `ai0rs5gw` is an obfuscated event name (likely "PlayerLeft"). `PlayerName` is the name of the player who left.
	Looking[PlayerName] = nil -- Removes the entry for the left player from the `Looking` table.
end

--// VEHICLE PURCHASE & ENTRY LOGIC //--
-- This section manages the UI and logic for purchasing, renting, and entering/exiting vehicles.
local Cameras do -- Block to safely get the Cameras module.
	local PlayerModule = require(LocalPlayer.PlayerScripts.PlayerModule)
	Cameras = PlayerModule:GetCameras()
end
local Vehicle = nil -- Stores the `Name` of the vehicle currently being prompted for purchase/entry.
local BuyVehicleFrame = ScreenGui.BuyVehicle -- Reference to the vehicle purchase UI frame.
local function Cancel() -- Cancels the vehicle purchase/entry prompt.
	BuyVehicleFrame.Visible = false -- Hides the UI frame.
	OnJump() -- Calls `OnJump`, which can have side effects like exiting current vehicle or states.
end
do
	-- Function to buy a vehicle with in-game cash.
	local function Buy()
		if not Vehicle then -- If no vehicle is selected, cancel.
			Cancel()
			return
		end	
		-- Fires an obfuscated remote event to the server to request buying the vehicle.
		Event:FireServer("d2flkw5m", Vehicle) -- `d2flkw5m` is obfuscated event name (likely "BuyVehicleServer"). `Vehicle` is its name.
	end
	-- Function to rent a vehicle with Robux.
	local function Rent()
		if not Vehicle then -- If no vehicle is selected, cancel.
			Cancel()
			return
		end
		MarketplaceService:PromptProductPurchase(LocalPlayer, 437705749) -- Prompts a Robux product purchase (ID 437705749).
		-- Fires an obfuscated remote event to the server to notify of rent attempt.
		-- `u` + reversed (`vd9qpsigjacjsr` sub `5,10`) -> "igj" + "5".
		-- The final obfuscated name is "uigj5".
		Event:FireServer("u" .. ("vd9qpsigjacjsr"):sub(5, 10):reverse():reverse():reverse():reverse():reverse() .. "5", Vehicle)
	end
	-- Function to open the "buy cash with Robux" UI.
	local function BuyCash()
		Cancel() -- Closes the vehicle purchase UI.
		CashBuyUI.Open() -- Opens the `CashBuyUI`.
	end
	BuyVehicleFrame.Buy.MouseButton1Down:connect(Buy) -- Connects the "Buy" button to the `Buy` function.
	BuyVehicleFrame.Cancel.MouseButton1Down:connect(Cancel) -- Connects the "Cancel" button to the `Cancel` function.
	BuyVehicleFrame.Rent.MouseButton1Down:connect(Rent) -- Connects the "Rent" button to the `Rent` function.
	BuyVehicleFrame.BuyCash.MouseButton1Down:connect(BuyCash) -- Connects the "Buy Cash" button to the `BuyCash` function.
	-- Server command handler (`em.d2flkw5m`) for the result of a vehicle purchase attempt.
	function em.d2flkw5m(t) -- `d2flkw5m` is an obfuscated event name (likely "BuyVehicleClient"). `t` is a table containing purchase result.
		if t.Success then
			BuyVehicleFrame.Visible = false -- Hides the purchase UI.
			Fireworks(5) -- Launches 5 fireworks on successful purchase.
			return
		elseif t.NotEnoughMoney then -- If not enough in-game cash.
			BuyCash() -- Prompts to buy cash.
			return
		elseif t.LowLevel then -- If player's level is too low.
			em.ht9y5ngc({ -- Displays a notification.
				Title = "Vehicle",
				Text = Localization:FormatByKey("Vehicle.LowLevel", { t.LowLevel }) -- Localized message with required level.
			})
		else
			Cancel() -- For other failures, cancel the prompt.
		end
	end
	-- Server sends the list of vehicles the player owns.
	waitForChild(ReplicatedStorage, "UpdateOwnedCashBillboard"):andThen(function(Inst) -- Waits for a specific `RemoteEvent`.
		Inst.OnClientEvent:Connect(function(t) -- Connects to its `OnClientEvent`.
			VehicleStuff.VehiclesOwned = t -- Updates the local `VehiclesOwned` table.
		end)
	end)
	-- Server sends the list of vehicles the player has rented.
	function em.c4ijcqma(t) -- `c4ijcqma` is an obfuscated event name (likely "UpdateRentedVehicles"). `t` is a table of rented vehicles.
		VehicleStuff.VehiclesRented = t -- Updates the local `VehiclesRented` table.
	end
	-- Server command handler (`em.aynqvy9d`) that tells the client to show the vehicle purchase prompt.
	function em.aynqvy9d(Name, Pass, Rent) -- `aynqvy9d` is obfuscated event name (likely "ShowVehiclePurchasePrompt").
		Vehicle = Name -- Sets the `Vehicle` variable to the name of the vehicle.
		local Price = Settings.Price[Name] -- Retrieves the cash price from `Settings`.
		if Pass then -- If the vehicle requires a gamepass.
			PromptPurchase(Pass) -- Displays the gamepass purchase prompt.
		elseif Price then -- If the vehicle has a cash price.
			local ItemTable = ItemUtils.createVehicleItemTable(Name) -- Creates an item table for localization.
			local Title = ItemUtils.getTranslatedTitleFromItemTable(ItemTable) -- Gets translated title.
			local BuyVehicleFrame = ScreenGui.BuyVehicle -- Reference to the UI frame.
			BuyVehicleFrame.TextLabel.Text = Localization:FormatByKey("Vehicle.ConfirmBuy", { Title, FormatMoney(abs(Settings.Price[Name])) }) -- Sets localized confirmation text.
			BuyVehicleFrame.Rent.Visible = Rent -- Sets visibility of the "Rent" button.
			BuyVehicleFrame.Visible = true -- Makes the frame visible.
			EzUtils.selectIfGamepad(BuyVehicleFrame.Buy) -- Sets initial focus to "Buy" button if gamepad is active.
			return
		elseif Name == "EscapeBot" then -- Special case for "EscapeBot".
			em.ht9y5ngc({
				Text = "Defeat the CEO to pilot the EscapeBot!" -- Displays a specific notification.
			})
		else
			em.ht9y5ngc({
				Text = "This vehicle cannot be purchased!" -- Generic message for unpurchasable vehicles.
			})
		end
	end
	-- Server command handler (`em.b93r3bde`) that tells the client the vehicle is locked.
	function em.b93r3bde() -- `b93r3bde` is obfuscated event name (likely "VehicleLocked").
		local SimpleMessageFrame = ScreenGui.SimpleMessage -- Reference to a simple message UI.
		SimpleMessageFrame.Visible = true -- Makes it visible.
		SimpleMessageFrame.Text = Localization:FormatByKey("Vehicle.Locked") -- Sets localized "Vehicle Locked" message.
		delay(1, function()
			SimpleMessageFrame.Visible = false -- Hides after 1 second.
		end)
	end
	-- A game setting to toggle the vehicle follow camera behavior.
	local Setting = {
		name = "useVehicleFollowCamera",
		title = "Vehicle Follow Camera",
		type = gameSettingType.Checkbox,
		defaultValue = true,
		order = 50
	}
	GameSettingsService.add(Setting) -- Adds the setting to the game settings service.
	local function handleSetting(v) -- Callback function when the setting's value changes. `v` is the new value.
		local CameraSubject
		if mVehiclePacket then
			-- Prepares the camera subject for the vehicle based on the setting value.
			CameraSubject = VehicleUtils.prepareCameraSubject(mVehiclePacket, v)
		end
		if CameraSubject then
			CurrentCamera.CameraSubject = CameraSubject -- Sets the camera subject.
		end
	end
	handleSetting(Setting:getValue()) -- Applies the initial value of the setting.
	Setting.onChanged:Connect(handleSetting) -- Connects `handleSetting` to the setting's `onChanged` signal.
	local ActionButtonService = require(ReplicatedStorage.ActionButton.ActionButtonService) -- Module for managing on-screen action buttons.
	local VehicleLinkBinder = require(ReplicatedStorage.VehicleLink.VehicleLinkBinder) -- Binder for vehicle linking (e.g., towing).
	local Promise = require(ReplicatedStorage.Std.Promise) -- Standard library module for Promises.
	local function predicateWaitForMe(Player) -- Predicate function used in Promise.
		return Player == LocalPlayer.Name -- Returns true if player name matches local player name.
	end
	-- Server command handler (`em.ho309bhl`) to handle complex vehicle entry when vehicle data is streamed in.
	function em.ho309bhl(bv, p, _) -- `ho309bhl` is obfuscated event name (likely "StreamedVehicleEntry").
		-- `bv` (BinderValue) refers to the vehicle's `BinderValue` object in `VehicleStateBinder`.
		-- `p` is partial vehicle packet data.
		StreamingHelperUtils.yieldForObjValuePopulated(bv) -- Waits for the `BinderValue` object to be fully populated.
		local pv = bv.Value:WaitForChild("_Packet") -- Waits for the `_Packet` object inside the `BinderValue`.
		StreamingHelperUtils.yieldForAllValuesPopulated(pv) -- Waits for all values within `_Packet` to be populated.
		local rp = TableUtils.createTableFromObjectValues(pv) -- Creates a table from `_Packet` values.
		TableUtils.mergeDeepInPlace(rp, p) -- Merges streamed data with provided partial packet.
		em.gz08vu1r(rp) -- Calls the main vehicle entry function (`em.gz08vu1r`) with the complete packet.
	end
	-- The CORE function (`em.gz08vu1r`) for putting the local player into a vehicle. This is a crucial and complex function.
	function em.gz08vu1r(p) -- `gz08vu1r` is obfuscated event name (likely "EnterVehicleClient"). `p` is the full vehicle packet.
		local Seats = {} -- Table to collect Promises for seats the player can enter.
		-- Finds the specific seat the player is supposed to enter by checking `PlayerName` `StringValue` in seats.
		for _, Seat in p.Model:GetChildren() do
			if Seat:IsA("BasePart") and (Seat.Name == "Seat" or Seat.Name == "Passenger") then
				local PlayerName = Seat:FindFirstChild("PlayerName")
				if PlayerName then
					-- Creates a Promise that resolves when `PlayerName.Value` matches `LocalPlayer.Name`.
					local SeatPromise = RxInstanceUtils.waitForProperty(PlayerName, "Value", predicateWaitForMe)
					table.insert(Seats, SeatPromise:andThen(function()
						return Seat -- Promise resolves with the actual `Seat` part.
					end))
				end
			end
		end
		-- Waits for one of the `Seat` Promises to resolve (meaning a seat is ready) or times out after 5 seconds.
		local _, Seat = Promise.race(Seats):timeout(5):await()
		p.Seat = Seat -- Stores the determined `Seat` part in the vehicle packet.
		if CharacterUtil.IsCrawling then
			toggleCrawling() -- If player is crawling, untoggle it before entering vehicle.
		end
		local Make = p.Make -- Vehicle's make.
		-- Unequips all items if not a passenger or if the seat doesn't have "Items" (likely for specific passenger types).
		if not (p.Passenger and p.Seat:FindFirstChild("Items")) then
			InventoryItemSystem.unequipAll()
		end
		local Character = LocalPlayer.Character
		if not Character then return end
		local Humanoid = Character:FindFirstChild("Humanoid")
		if not Humanoid then return end
		assert(not p.seatMaid, "packet already has seat maid") -- Asserts that the vehicle packet doesn't already have a `seatMaid`.
		local seatMaid = Maid.new() -- Creates a new `Maid` object to manage all connections and objects created upon entering the vehicle.
		p.seatMaid = seatMaid -- Stores the `seatMaid` in the vehicle packet for later cleanup.
		p.wasSprintingBeforeEnteringVehicle = ShouldSprint and not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) -- Records if player was sprinting before entering.
		-- Disables standard player control buttons.
		ActionButtonService.setButtonPrimary(DefaultActions.jumpButton, false)
		ActionButtonService.setButtonEnabled(DefaultActions.punchButton, false)
		ActionButtonService.setButtonEnabled(DefaultActions.crawlButton, false)
		ActionButtonService.setButtonEnabled(DefaultActions.sprintButton, false)
		seatMaid:GiveTask(function() -- Adds a cleanup task to the maid to re-enable buttons on exit.
			ActionButtonService.setButtonPrimary(DefaultActions.jumpButton, true)
			ActionButtonService.setButtonEnabled(DefaultActions.punchButton, true)
			ActionButtonService.setButtonEnabled(DefaultActions.crawlButton, true)
			ActionButtonService.setButtonEnabled(DefaultActions.sprintButton, true)
			if p.wasSprintingBeforeEnteringVehicle then -- Restores sprinting state if it was active before entering.
				setSprinting(true)
			end
		end)
		-- Changes the camera subject to the vehicle.
		local CameraSubject = VehicleUtils.prepareCameraSubject(p, Setting:getValue()) -- Prepares camera subject based on vehicle and setting.
		if CameraSubject then
			local mCameraSubject = CurrentCamera.CameraSubject -- Stores current camera subject.
			CurrentCamera.CameraSubject = CameraSubject -- Sets new camera subject.
			seatMaid:GiveTask(function() -- Adds cleanup task to restore old camera subject.
				CurrentCamera.CameraSubject = mCameraSubject
			end)
		end
		seatMaid:GiveTask(function() -- Adds a cleanup task to reset camera distance.
			local activeCameraController = Cameras.activeCameraController
			if activeCameraController then
				activeCameraController:SetCameraToSubjectDistance(15) -- Resets camera distance.
			end
		end)
		-- If the player is the driver (`not p.Passenger`), add all the DRIVER-specific control buttons.
		if not p.Passenger then
			-- Adds driving controls (forward, backward, handbrake, etc.) based on vehicle `Type`.
			if p.Type == "Chassis" or (p.Type == "Motorcycle" or (p.Type == "DuneBuggy" or p.Make == "Volt")) then
				seatMaid:GiveTask(ActionButtonService.add({ -- Forward button.
					primary = true,
					priority = 1000,
					saturateTo = 0,
					image = "rbxassetid://7858765663",
					keyCodes = { Enum.KeyCode.W, Enum.KeyCode.Up },
					onPressed = function() p.setForward(true) end,
					onReleased = function() p.setForward(false) end
				}))
				seatMaid:GiveTask(ActionButtonService.add({ -- Backward button.
					primary = true,
					priority = 700,
					saturateTo = 0,
					image = "rbxassetid://7858764373",
					keyCodes = { Enum.KeyCode.S, Enum.KeyCode.Down },
					onPressed = function() p.setBackward(true) end,
					onReleased = function() p.setBackward(false) end
				}))
				if p.Make ~= "Volt" then -- Handbrake button (not for Volt).
					seatMaid:GiveTask(ActionButtonService.add({
						priority = 600,
						allowTouchSlide = true,
						image = "rbxassetid://4939737110",
						keyCodes = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift, Enum.KeyCode.ButtonX },
						onPressed = function() Classes.Chassis.setHandbrakeEnabled(true) end,
						onReleased = function() Classes.Chassis.setHandbrakeEnabled(false) end
					}))
				end
				seatMaid:GiveTask(ActionButtonService.add({ -- Vehicle flip/reset button.
					priority = 850,
					image = "rbxassetid://4939737424",
					keyCodes = { Enum.KeyCode.V, Enum.KeyCode.ButtonR1 },
					onPressed = function()
						-- Fires an obfuscated remote event to the server to request vehicle flip.
						-- `n` + reversed (`z8seq62mgy` sub `5,8`) -> "2mgy" + reversed (`pftyih` sub `3,3`) -> "f" + "2l".
						-- The final obfuscated name is "n2mgyf2l".
						Event:FireServer("n" .. ("z8seq62mgy"):sub(5, 8):reverse() .. ("pftyih"):sub(3, 3):reverse() .. "2l", p.Model)
					end
				}))
				seatMaid:GiveTask(ActionButtonService.add({ -- Nitro button.
					priority = 500,
					allowTouchSlide = true,
					image = "rbxassetid://4939740976",
					keyCodes = { Enum.KeyCode.Q, Enum.KeyCode.ButtonL1 },
					onPressed = function()
						StartNitro()
						if mVehiclePacket then mVehiclePacket._isNitroPressed = true end
					end,
					onReleased = function()
						StopNitro()
						if mVehiclePacket then mVehiclePacket._isNitroPressed = false end
					end
				}))
			elseif p.Type == "Heli" then
				-- Adds helicopter-specific controls (up, down, headlights).
				seatMaid:GiveTask(ActionButtonService.add({ -- Up button.
					primary = true,
					priority = 1000,
					saturateTo = 0,
					image = "rbxassetid://4939737716",
					keyCodes = { Enum.KeyCode.E, Enum.KeyCode.ButtonR2 },
					onPressed = function() Classes.Heli.setUp(true) end,
					onReleased = function() Classes.Heli.setUp(false) end
				}))
				seatMaid:GiveTask(ActionButtonService.add({ -- Down button.
					primary = true,
					priority = 950,
					saturateTo = 0,
					image = "rbxassetid://4939738083",
					keyCodes = { Enum.KeyCode.Q, Enum.KeyCode.ButtonL2 },
					onPressed = function() Classes.Heli.setDown(true) end,
					onReleased = function() Classes.Heli.setDown(false) end
				}))
				seatMaid:GiveTask(ActionButtonService.add({ -- Helicopter Headlights button.
					priority = 700,
					image = "rbxassetid://4939738413",
					keyCodes = { Enum.KeyCode.L, Enum.KeyCode.ButtonL1 },
					onPressed = function() Classes.Heli.toggleHeadlights(p) end
				}))
			end
			-- Adds headlight controls for cars if the vehicle model has a "Headlights" part.
			if p.Model and (p.Model:FindFirstChild("Model") and (p.Model.Model:FindFirstChild("Headlights") and p.Type ~= "Heli")) then
				seatMaid:GiveTask(ActionButtonService.add({
					priority = 450,
					image = "rbxassetid://4939738413",
					keyCodes = { Enum.KeyCode.L, Enum.KeyCode.ButtonY },
					onPressed = function() Classes.Chassis.toggleHeadlights() end
				}))
			end
			-- Adds horn controls if the vehicle model has a "BoundingBox" (common part).
			if p.Model and p.Model:FindFirstChild("BoundingBox") then
				seatMaid:GiveTask(ActionButtonService.add({
					priority = 800,
					image = "rbxassetid://4939742186",
					keyCodes = { Enum.KeyCode.H, Enum.KeyCode.ButtonL3 },
					onPressed = function() HornStart() end,
					onReleased = function() HornStop() end
				}))
			end
			-- Adds special action controls for specific emergency/utility vehicles (e.g., sirens for Ambulance).
			if Make == "Ambulance" or (Make == "Firetruck" or (Make == "Jeep" or (Make == "Boxer" or (Make == "PrisonBus" or (Make == "Longhorn" or (Make == "Laviolette" or (Make == "SWATVan" or Make == "Tanker"))))))) then
				seatMaid:GiveTask(ActionButtonService.add({
					priority = 400,
					image = "rbxassetid://4939741296",
					keyCodes = { Enum.KeyCode.G, Enum.KeyCode.DPadDown },
					onPressed = function() Classes.Chassis.runAction(true) end,
					onReleased = function() Classes.Chassis.runAction(false) end
				}))
			end
			-- Adds missile/bomb controls for vehicles that support them.
			if p.Type == "Chassis" or p.Type == "Heli" then
				if p.Missiles and p.Rockets then -- Missile button.
					seatMaid:GiveTask(ActionButtonService.add({
						priority = 350,
						image = "rbxassetid://4939740665",
						keyCodes = { p.Type == "Chassis" and Enum.KeyCode.G or Enum.KeyCode.F, Enum.KeyCode.ButtonX },
						onPressed = function()
							if p.Type == "Chassis" then
								Classes.Chassis.AttemptFireMissile(mVehiclePacket) -- For cars.
							else
								Classes.Heli.attemptFireMissile() -- For helicopters.
							end
						end
					}))
				end
				if p.Missiles and p.Bombs then -- Bomb button (likely helicopter specific).
					seatMaid:GiveTask(ActionButtonService.add({
						priority = 300,
						image = "rbxassetid://7893992893",
						keyCodes = { Enum.KeyCode.B, Enum.KeyCode.ButtonB },
						onPressed = function() Classes.Heli.attemptDropBomb() end
					}))
				end
			end
			-- Adds tow truck controls.
			if p.Make == "TowTruck" or p.Make == "FrostCrawler" then
				seatMaid:GiveTask(ActionButtonService.add({
					priority = 250,
					image = "rbxassetid://4939739616",
					keyCodes = { Enum.KeyCode.G, Enum.KeyCode.DPadDown },
					onPressed = function() VehicleLinkBinder:Get((p.Model:FindFirstChild("Preset"):FindFirstChild("Crane"):FindFirstChild("MetalHook"))):Unattach() end
				}))
			end
		end
		-- Adds helicopter rope controls if the vehicle has a "Winch" part.
		if p.Model and p.Model:FindFirstChild("Winch") then
			seatMaid:GiveTask(ActionButtonService.add({
				priority = 750,
				image = "rbxassetid://4939739616",
				keyCodes = { Enum.KeyCode.G, Enum.KeyCode.ButtonY },
				onPressed = function() Classes.Heli.attemptDropRope() end
			}))
		end
		-- Forces the `Humanoid` into the `Seated` state and adds cleanup to ensure it stays seated while in vehicle.
		Humanoid.Sit = true
		seatMaid:GiveTask(Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
			if not Humanoid.Sit and Humanoid.Health > 0 then
				Humanoid.Sit = true
			end
		end))
		seatMaid:GiveTask(function() -- Cleanup: set Humanoid.Sit to false when exiting.
			Humanoid.Sit = false
		end)
		-- Handles passengers in the vehicle: forces them to sit and applies special collision groups.
		if not p.Passenger then -- This block runs only if the current player is the driver.
			for _, v in ipairs(p.Model:GetChildren()) do -- Iterates through children of vehicle model.
				local PlayerName = v:FindFirstChild("PlayerName") -- Finds `PlayerName` value in seats.
				if PlayerName then
					local function handleSeat(PlayerName) -- Inner function to handle seating passengers.
						local Player = Players:FindFirstChild(PlayerName)
						if Player and Player ~= LocalPlayer then -- If it's another player (a passenger).
							local mMaid = Maid.new() -- Maid for this specific passenger's cleanup.
							seatMaid[v] = mMaid -- Stores passenger's maid within driver's maid for cleanup.
							local Humanoid = Player.Character:FindFirstChild("Humanoid")
							Humanoid.Sit = true -- Forces passenger to sit.
							mMaid:GiveTask(Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
								if not Humanoid.Sit and Humanoid.Health > 0 then
									Humanoid.Sit = true
								end
							end))
							if p.Make == "Hammerhead" then -- Special collision group for Hammerhead passengers.
								mMaid:GiveTask(PartUtils.setPropertyWithRollback(Player.Character, "CollisionGroup", "NoOtherVehicles"))
								return
							end
						else
							seatMaid[v] = nil -- Clear maid if player leaves seat.
						end
					end
					handleSeat(PlayerName.Value) -- Call initially for current occupant.
					seatMaid:GiveTask(PlayerName.Changed:Connect(handleSeat)) -- Connect to `PlayerName` changes for future occupants.
				end
			end
			-- Set special collision groups for certain vehicles (e.g., Hammerhead) and the driver.
			if p.Make == "Hammerhead" then
				seatMaid:GiveTask(PartUtils.setPropertyWithRollback(p.Model, "CollisionGroup", "NoOtherVehicles"))
				seatMaid:GiveTask(PartUtils.setPropertyWithRollback(Character, "CollisionGroup", "NoOtherVehicles"))
			end
		end
		-- Calls the vehicle-specific entry logic for the appropriate chassis/vehicle module.
		local Class = Classes[Make] -- Retrieves the specific vehicle class module.
		if Class and Class.vehicleEnter then
			Class.vehicleEnter(p)
		elseif p.Type == "Chassis" then
			Classes.Chassis.VehicleEnter(p)
		elseif p.Type == "Heli" then
			Classes.Heli.VehicleEnter(p)
		elseif p.Type == "Motorcycle" or p.Type == "DuneBuggy" then
			Classes.Chassis2.VehicleEnter(p)
		elseif p.Type == "Custom" and p.Make == "Volt" then
			Classes.Volt.VehicleEnter(p)
		end
		if p.Passenger then -- If player is a passenger, disable nitro on their vehicle packet.
			p.Nitro = false
		end
		-- Finally, sets the global `mVehiclePacket` to the current vehicle packet, making it accessible elsewhere.
		mVehiclePacket = p
		local PlayerSeat = mVehiclePacket.Seats ~= nil and VehicleSystem.GetPlayerSeat(mVehiclePacket, LocalPlayer) -- Determine player's seat type (driver/passenger).
		if PlayerSeat then
			mVehiclePacket.Passenger = PlayerSeat.Driver ~= true -- Updates `p.Passenger` flag based on seat.
		end
		VehicleUtils.OnVehicleEntered:Fire(p, p.Passenger) -- Fires a signal indicating vehicle entry.
	end
	-- This function runs after the main vehicle entry logic to add even more context-specific controls.
	VehicleUtils.OnVehicleEntered:Connect(function(p) -- `p` is the vehicle packet.
		local seatMaid = p.seatMaid -- Retrieves the `Maid` for the current vehicle session.
		if not p.Passenger then -- This block runs only if the player is the driver.
			-- Logic to dynamically add a siren button if the vehicle has siren lights.
			local function handleLights(Inst) -- `Inst` is the "Lights" part if found.
				if Inst then
					-- Adds the siren button action.
					seatMaid.sirensButton = ActionButtonService.add({
						priority = 450,
						image = "rbxassetid://4939739355",
						keyCodes = { Enum.KeyCode.F, Enum.KeyCode.ButtonB },
						onPressed = function() Classes.Chassis.toggleSirens() end
					})
				else
					seatMaid.sirensButton = nil -- Clears button reference if no lights.
				end
			end
			handleLights(nil) -- Call once initially to set default.
			if p.Model and p.Model:FindFirstChild("Model") then
				-- Observes for a child named "Lights" within the vehicle model, adding/removing the button dynamically.
				seatMaid:GiveTask(RxInstanceUtils.observeOneChildNamed(p.Model.Model, "Lights", handleLights))
			end
		end
		if not p.Passenger then -- This block runs only if the player is the driver.
			-- Logic to dynamically add an interior camera toggle button if the vehicle has an "InsideCamera" part.
			local function handleCamToggle(Inst) -- `Inst` is the "InsideCamera" part if found.
				if Inst then
					-- Adds the camera toggle button action.
					seatMaid.camToggleButton = ActionButtonService.add({
						priority = 550,
						image = "rbxassetid://4939741662",
						keyCodes = { Enum.KeyCode.C, Enum.KeyCode.ButtonR3 },
						onPressed = function() Classes.Chassis.toggleInsideCamera() end
					})
				else
					seatMaid.camToggleButton = nil -- Clears button reference if no camera part.
				end
			end
			handleCamToggle(nil) -- Call once initially to set default.
			-- Observes for a child named "InsideCamera" within the vehicle model, adding/removing the button dynamically.
			seatMaid:GiveTask(RxInstanceUtils.observeOneChildNamed(p.Model, "InsideCamera", handleCamToggle))
		end
	end)
	-- The CORE function (`em.hwav8tez`) for taking the local player out of a vehicle. It handles comprehensive cleanup.
	function em.hwav8tez() -- `hwav8tez` is an obfuscated event name (likely "ExitVehicleClient").
		if mVehiclePacket then
			local Type = mVehiclePacket.Type -- Stores vehicle type.
			local Make = mVehiclePacket.Make -- Stores vehicle make.
			local currentVehiclePacket = mVehiclePacket -- Cache the current packet for cleanup tasks.
			mVehiclePacket = nil -- Clears the global `mVehiclePacket` reference first.

			-- Stops any active vehicle effects.
			if currentVehiclePacket.Nitro then StopNitro() end
			currentVehiclePacket.Nitro = false
			if currentVehiclePacket.Nitrous then
				for _, v in next, currentVehiclePacket.Nitrous do
					v.Enabled = false
				end
			end
			if currentVehiclePacket.IsCameraLocked then
				Classes.Chassis.toggleInsideCamera(currentVehiclePacket) -- Toggles camera back to external if it was locked.
			end
			-- Calls the vehicle-specific leave logic for the appropriate chassis/vehicle module.
			local Class = Classes[Make]
			if Class and Class.vehicleLeave then
				Class.vehicleLeave(currentVehiclePacket)
			elseif Type == "Chassis" then
				Classes.Chassis.VehicleLeave(currentVehiclePacket)
			elseif Type == "Heli" then
				Classes.Heli.VehicleLeave(currentVehiclePacket)
			elseif Type == "Motorcycle" or Type == "DuneBuggy" then
				Classes.Chassis2.VehicleLeave(currentVehiclePacket)
			elseif Type == "Custom" and Make == "Volt" then
				Classes.Volt.VehicleLeave(currentVehiclePacket)
			end
			-- The power of the `Maid`: this single call cleans up all buttons, camera changes, connections,
			-- collision group changes, and other tasks given to the `seatMaid` during vehicle entry.
			currentVehiclePacket.seatMaid:Destroy()
			currentVehiclePacket.seatMaid = nil -- Clears the `seatMaid` reference.
			local ItemStack = ItemSystem.GetLocalEquipped()
			if ItemStack and ItemStack.IsLeaning then -- If player was leaning with an item (e.g., motorcycle).
				ItemStack:SetLeaning(false) -- Stops leaning animation.
			end
			VehicleUtils.OnVehicleExited:Fire(currentVehiclePacket, currentVehiclePacket.Passenger) -- Fires a signal indicating vehicle exit.
			em.ki6ka9n6() -- Calls a handler to reset player velocity.
			if TouchEnabled then -- If on touch-enabled device.
				setSprinting(true) -- Re-enables default sprinting.
			end
		end
	end
	-- This function runs when a player exits a vehicle by jumping (typically `Enum.KeyCode.Space`).
	VehicleUtils.OnVehicleJumpExited:Connect(function(p) -- `p` is the vehicle packet.
		local Character = LocalPlayer.Character
		if Character then
			-- Restores default joint C0/C1 values that might have been temporarily changed by vehicle animations.
			for _, v in Character:GetDescendants() do
				if v:IsA("JointInstance") then
					local JointC0 = v:FindFirstChild("JointC0") -- Finds original C0 value.
					if JointC0 then v.C0 = JointC0.Value end
					local JointC1 = v:FindFirstChild("JointC1") -- Finds original C1 value.
					if JointC1 then v.C1 = JointC1.Value end
				end
			end
		end
		local seatMaid = p.seatMaid -- Retrieves the `seatMaid`.
		if seatMaid then
			task.defer(seatMaid.DoCleaning, seatMaid) -- Defers the maid's cleanup to avoid interfering with current frame.
		end
		if Character then
			local HumanoidRootPart = Character.PrimaryPart
			local Humanoid = Character:FindFirstChild("Humanoid")
			if Humanoid and HumanoidRootPart then
				-- A trick to force the character out of the seat properly and stand up.
				local Event = Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
					if not Humanoid.Sit then
						Humanoid.Sit = true -- Force `Sit` back to true if it unexpectedly changes.
					end
				end)
				Humanoid.Sit = true -- Sets `Sit` to true to initiate the `GettingUp` state.
				task.delay(0.3, function() -- After a short delay.
					Event:Disconnect() -- Disconnects the temporary connection.
					Humanoid.Sit = false -- Sets `Sit` to false.
					Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) -- Explicitly sets Humanoid state to "GettingUp".
				end)
			end
		end
		if p.SeatWeld then -- If there was a `SeatWeld` created for the vehicle.
			p.SeatWeld:Destroy() -- Destroys the weld.
			p.SeatWeld = nil
		end
		-- Moves the character slightly upwards after exiting to prevent getting stuck inside the vehicle model.
		local BoundingBox = p.Model:FindFirstChild("BoundingBox")
		if Character then
			-- Calculates a vertical offset based on the vehicle's bounding box and character's position.
			local Offset = not (p.Model and BoundingBox) and 0 or Character.PrimaryPart.CFrame:ToObjectSpace(BoundingBox.CFrame * CFrame.new(0, BoundingBox.Size.Y * 0.5, 0)).Y
			Character:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame + Vector3.new(0, Offset + 6, 0)) -- Applies the offset.
		end
	end)
	-- Server command handler (`em.uzq295jz`) that sends updated data for the vehicle the player is currently in.
	function em.uzq295jz(p) -- `uzq295jz` is an obfuscated event name (likely "UpdateVehiclePacket"). `p` is a partial update packet.
		if mVehiclePacket then -- If the local player is in a vehicle.
			for k, v in next, p do -- Iterates through the keys and values in the incoming update packet.
				mVehiclePacket[k] = v -- Overwrites/updates corresponding values in the global `mVehiclePacket`.
			end
		end
	end
	-- Server command handler (`em.zt4kr5iy`) that tells the client their helicopter has been shot down.
	function em.zt4kr5iy() -- `zt4kr5iy` is an obfuscated event name (likely "HeliShotDownClient").
		if not mVehiclePacket then return end
		if mVehiclePacket.Type == "Heli" then -- Only applies if the current vehicle is a helicopter.
			Classes.Heli.FallOutOfSky(mVehiclePacket) -- Calls the helicopter-specific "fall out of sky" function.
		end
	end
	-- Server command handler (`em.xm6lmkug`) that tells the client their car has been spun out (e.g., by a PIT maneuver).
	function em.xm6lmkug() -- `xm6lmkug` is an obfuscated event name (likely "SpinOutVehicleClient").
		if mVehiclePacket then
			if mVehiclePacket.Type == "Chassis" then -- Only applies if the current vehicle is a "Chassis" type.
				Classes.Chassis.SpinOut(mVehiclePacket) -- Calls the chassis-specific `SpinOut` function.
			else
				error(("Cannot spin-out vehicle type: %s"):format(mVehiclePacket.Type)) -- Throws an error for unsupported vehicle types.
			end
		else
			error("no vehicle packet") -- Throws an error if no vehicle packet exists.
			return
		end
	end
	-- Server command handler (`em.wpgmidfk`) that tells the client to play crash particles.
	function em.wpgmidfk(inst) -- `wpgmidfk` is an obfuscated event name (likely "PlayCrashParticles"). `inst` is the instance where particles should appear.
		local Part = Instance.new("Part") -- Creates a new temporary `Part` to host the particles.
		Part.Name = "CrashParticles"
		Part.Transparency = 1 -- Invisible.
		Part.Anchored = true -- Static.
		Part.CanCollide = false
		Part.CFrame = inst.CFrame + inst.Parent.Engine.CFrame.LookVector * 5 -- Positioned slightly ahead of the crash point.
		Part.Size = inst.Size
		Part.Parent = workspace -- Parented to workspace.
		local CrashParticle = ReplicatedStorage.Resource.CrashParticle:Clone() -- Clones the particle emitter asset.
		CrashParticle.Parent = Part -- Parents it to the temporary part.
		CrashParticle:Emit(8) -- Emits particles.
		wait() -- Waits a frame.
		CrashParticle:Emit(8) -- Emits more particles.
		wait()
		CrashParticle:Emit(8) -- Emits more particles.
		wait()
		game.Debris:AddItem(Part, 5) -- Schedules the temporary part for destruction after 5 seconds.
	end
	-- Resets the character's velocity to zero.
	function em.ki6ka9n6() -- `ki6ka9n6` is an obfuscated event name (likely "ResetPlayerVelocity").
		local Character = LocalPlayer.Character
		if not Character then return end
		local HumanoidRootPart = Character.PrimaryPart
		if HumanoidRootPart then
			HumanoidRootPart.Velocity = Vector3.new() -- Sets linear velocity to zero.
			HumanoidRootPart.RotVelocity = Vector3.new() -- Sets rotational velocity to zero.
		end
	end
end
-- Server command handler (`em.rl5yii3u`) that tells the client an action failed (e.g., trying to use a key on the wrong door).
function em.rl5yii3u() -- `rl5yii3u` is an obfuscated event name (likely "ActionFailed").
	ScreenGui.FaultyAction.Visible = true -- Makes a "Faulty Action" message visible.
	wait(4) -- Waits for 4 seconds.
	ScreenGui.FaultyAction.Visible = false -- Hides the message.
end
-- A standard easing function (ease-in-out quadratic) for smooth animations.
local Ease_inOutQuad = function(t, b, c, d) -- `t`: current time, `b`: start value, `c`: change in value, `d`: duration.
	t = t / d * 2
	if t < 1 then
		return c * 0.5 * t * t + b
	else
		return -c * 0.5 * ((t - 1) * (t - 3) - 1) + b
	end
end

--// PROXIMITY INTERACTION & DOOR SYSTEM //--
-- This is a large, custom system for managing all proximity-based interactions (e.g., doors, pickups, buttons) in the game.
do
	local ProximityContext -- Table for the proximity context system.
	ProximityContext = {}
	do
		local insert, remove = table.insert, table.remove -- Aliases for table functions.
		local Buttons = {} -- Table to store currently active interactable "buttons" (parts).
		-- Registers a part that can be interacted with when the player is within a certain distance.
		function ProximityContext.AddPart(Part, Distance, f, Meta) -- `Part`: the interactable object, `Distance`: max interaction range, `f`: callback function, `Meta`: metadata table.
			local Button = {
				Part = Part,
				Distance = Distance,
				f = f, -- The callback function for interaction.
				Meta = Meta -- Additional metadata.
			}
			table.insert(Buttons, Button) -- Adds the button to the list.
			return Button -- Returns the created button packet.
		end
		-- Removes all registered parts that have a specific tag in their metadata.
		function ProximityContext.RemoveTag(Tag) -- `Tag`: The tag to remove.
			for i = #Buttons, 1, -1 do -- Iterates backwards to safely remove elements.
				if Buttons[i].Meta.Tag == Tag then
					table.remove(Buttons, i)
					return true -- Returns true if a button was removed.
				end
			end
			return false
		end
		local LoadQueue = {} -- Queue for objects that need to be "loaded" (their `f` callback called with `true`).
		local UnloadQueue = {} -- Queue for objects that need to be "unloaded" (their `f` callback called with `false`).
		-- The core internal function that checks which objects are in range of the player's `HumanoidRootPart`.
		local function UpdateInterest()
			local Character = LocalPlayer.Character
			if not Character then return end
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart then return end
			local Humanoid = Character:FindFirstChild("Humanoid")
			if not Humanoid then return end
			if Humanoid.Health <= 0 then return end
			local Position = HumanoidRootPart.Position -- Current player position.
			ProximityContext.UpdateInterest(Position) -- Calls the public `UpdateInterest` with player position.
		end
		-- The public-facing version of the update function. Can be called with a specific position `p`.
		function ProximityContext.UpdateInterest(p) -- `p`: The position to check interest around.
			UpdateInterest() -- Calls internal update to get player's current position.
			LoadQueue = {} -- Resets queues.
			UnloadQueue = {}
			-- Cleans up any buttons whose `Part` is no longer valid.
			for i = #Buttons, 1, -1 do
				if not Buttons[i].Part then
					table.remove(Buttons, i)
				end
			end
			-- For each registered object, checks its distance to the player and determines load/unload status.
			for _, Packet in next, Buttons do
				Packet.Center = Packet.Part.Position -- Center position of the interactable part.
				local d = (Packet.Center - p).magnitude -- Distance to player.
				Packet.Sort = d -- Stores distance for sorting (though sorting not explicit here).
				local ShouldLoad = d < Packet.Distance -- True if within interaction distance.
				if Packet.Locked then -- If marked as "locked", it should always be considered "loaded".
					ShouldLoad = true
				end
				local Loaded = Packet.Loaded -- Current loaded status.
				-- Adds the packet to `LoadQueue` or `UnloadQueue` if its loaded status has changed.
				if ShouldLoad and not Loaded then
					insert(LoadQueue, Packet)
				elseif not ShouldLoad and Loaded then
					insert(UnloadQueue, Packet)
				end
			end
		end
		-- Processes the `LoadQueue` and `UnloadQueue`, calling the appropriate callback functions.
		local function ProcessQueue()
			while #LoadQueue > 0 do -- Processes all items in the load queue.
				local Packet = remove(LoadQueue, 1)
				Packet.Loaded = true -- Marks as loaded.
				Packet:f(Packet.Loaded) -- Calls the callback function with `true`.
			end
			while #UnloadQueue > 0 do -- Processes all items in the unload queue.
				local Packet = remove(UnloadQueue)
				Packet.Loaded = false -- Marks as unloaded.
				Packet:f(Packet.Loaded) -- Calls the callback function with `false`.
			end
		end
		-- Connects the `ProcessQueue` function to the custom thread loop, to run periodically.
		function ProximityContext.Run(i) -- `i`: interval for running.
			ThreadLoopAdd(i, ProcessQueue, "Proximity Queue") -- Adds to the `ThreadLoopAdd` system.
		end
		ProximityContext.Run(0.1) -- Starts running `ProcessQueue` every 0.1 seconds.
	end
	-- This section adds a UI prompt (e.g., "Press Y") for the closest interactable object, using `UI.CircleAction`.
	local AddContextButton, RemoveContextButtonByTag, ContextProcessInput do
		local ButtonYGui = ReplicatedStorage.Resource.ButtonY:Clone() -- Clones a pre-made "Button Y" GUI.
		local Buttons = {} -- Table to store active `ProximityContext` packets that can show a UI button.
		-- `ProximityUpdate` is the callback function passed to `ProximityContext.AddPart`. It's fired when an object
		-- enters or leaves the interaction range (or when its `Locked` status changes).
		local function ProximityUpdate(self, Loaded) -- `self`: the `ProximityContext` packet, `Loaded`: boolean (true if in range).
			if Loaded then
				-- If the object entered range, add it to `Buttons` list, keeping it sorted by `Sort` (distance).
				local i = m.BinaryFind(Buttons, self.Sort) -- Finds insertion index.
				table.insert(Buttons, i, self)
			else
				-- If the object left range, remove it from `Buttons`.
				for i = #Buttons, 1, -1 do
					if Buttons[i] == self then
						table.remove(Buttons, i)
						break
					end
				end
			end
			-- Displays the "Button Y" GUI on the closest interactable object.
			local ClosestPacket = Buttons[1] -- The closest object is always at index 1.
			-- This condition `Enum.UserInputType.Gamepad1 == nil` seems like a typo or obfuscation.
			-- It probably intended to check if gamepad *is* active, or if it *is not* gamepad, to decide where to parent the button.
			if ClosestPacket and Enum.UserInputType.Gamepad1 == nil then -- If there's a closest packet and gamepad is *not* active.
				ButtonYGui.Parent = ClosestPacket.Meta.Button -- Parents the button to the specified UI element.
			else -- If no closest packet or gamepad is active (if the condition evaluates the other way).
				ButtonYGui.Parent = nil -- Hides the button.
			end
		end
		-- Adds a new context button (UI prompt) for a given part.
		function AddContextButton(Part, Distance, Callback, Tag)
			-- Adds the part to the `ProximityContext` system, using `ProximityUpdate` as its callback.
			return ProximityContext.AddPart(Part, Distance, ProximityUpdate, {
				Callback = Callback, -- The actual function to call when the button is pressed.
				Tag = Tag -- A tag for removal.
			})
		end
		-- Removes context buttons associated with a specific tag.
		function RemoveContextButtonByTag(n1) -- `n1`: The tag to remove.
			return ProximityContext.RemoveTag(n1)
		end
		-- Processes keyboard/gamepad input for the context button (typically the "Y" key/button).
		function ContextProcessInput(i) -- `i`: The `UserInputObject`.
			local IsPress = false -- Flag for "Y" button press.
			if i.UserInputType == Enum.UserInputType.Gamepad1 then
				local k = i.KeyCode
				if k == Enum.KeyCode.ButtonY then IsPress = true end
			elseif i.UserInputType == Enum.UserInputType.Keyboard then
				local k = i.KeyCode
				if k == Enum.KeyCode.Y then IsPress = true end
			end
			if not IsPress then return end -- If not the 'Y' button, ignore.
			local ClosestPacket = Buttons[1] -- Gets the closest interactable object.
			if not ClosestPacket then return end -- If no interactable object, ignore.
			-- Calls the callback for the closest button.
			for _, Packet in next, Buttons, nil do
				if Packet.Meta.Button == ClosestPacket.Meta.Button then -- This likely means if the UI button is associated with this particular packet.
					coroutine.resume(coroutine.create(function()
						Packet.Meta.Callback(LocalPlayer) -- Resumes a new coroutine to run the callback function.
					end))
				end
			end
		end
	end
	local function InputBegan(i, a) -- `i`: UserInputObject, `a`: `gameProcessedEvent` boolean.
		if a then return end -- If Roblox already processed the input, ignore.
		-- This condition `i.UserInputType == Enum.UserInputType.Gamepad1 and i.KeyCode == Enum.KeyCode.ButtonA or (i.KeyCode == Enum.KeyCode.Left or i.KeyCode == Enum.KeyCode.Right)` seems like a copy/paste error or an overly complex `and/or` chain.
		-- It's likely intended to check if the input is *not* one of the basic movement keys, to allow ContextProcessInput.
		if i.UserInputType == Enum.UserInputType.Gamepad1 and i.KeyCode == Enum.KeyCode.ButtonA or (i.KeyCode == Enum.KeyCode.Left or i.KeyCode == Enum.KeyCode.Right) then return end -- If it's a movement input, ignore.
		ContextProcessInput(i) -- Processes the input for context buttons.
	end
	UserInputService.InputBegan:connect(InputBegan) -- Connects to `InputBegan`.
	--// DOOR SYSTEM LOGIC //--
	-- This sub-section defines the client-side behavior for doors, building on the `ProximityContext` system.
	local ContextMeta = {} -- A table storing metadata for touch/button interactions associated with doors.
	-- Initiates the door opening sequence and notifies the server.
	local function DoorSequence(Door)
		if Door.Settings.SequenceRequireState and Door.State.Open then return end -- If door requires a specific state and is already open, exit.
		if Door.Resolved then -- If the door model is streamed in and resolved locally.
			Door.State.Open = true -- Sets local state to open.
			if Door.OpenFun then Door:OpenFun() end -- Calls the door's animation function.
		else
			-- If the door model is not yet resolved, set awaiting flags.
			Door.AwaitingDoorOpen = true
			Door.AwaitingDoorClose = false
		end
		-- Fires an obfuscated remote event to the server to synchronize door state.
		-- `d` + reversed (`f5b0vy3` sub `3,5`) -> "bov" + reversed (`lbp` sub `2,2`) -> "p" + "cci".
		-- The final obfuscated name is "dbovpcci".
		Event:FireServer("d" .. ("f5b0vy3"):sub(3, 5):reverse():reverse():reverse() .. ("lbp"):sub(2, 2):reverse():reverse():reverse() .. "cci", Door)
	end
	-- Checks if a `Player` has permission to open a specific `Door`.
	local function HasPerm(Door, Player, Character, Button) -- `Button`: boolean, true if interacting via a button click.
		if Door.Settings.ServerOnly then return false end -- If server-only door, client can't open.
		if Door.Settings.Locked then return false end -- If explicitly locked, client can't open.
		local InVehicle = (Character:FindFirstChild("Humanoid").Sit or Character:FindFirstChild("InVehicle")) and true or false -- Checks if player is in a vehicle.
		local HasPermission = false -- Initial permission.
		-- Checks vehicle/character specific requirements.
		if Door.Settings.Vehicle and not Door.Settings.Character then HasPermission = InVehicle
		elseif Door.Settings.Character and not Door.Settings.Vehicle then HasPermission = not InVehicle
		elseif Door.Settings.Character and Door.Settings.Vehicle then HasPermission = true end
		HasPermission = Button and true or InVehicle -- If interacting via button, always allow, else base on vehicle state.
		-- Checks for keycard or team requirements.
		if Door.Settings.Key then HasPermission = HasPermission and PlayerUtils.hasKey() end -- Requires a key.
		if Door.Settings.Team then HasPermission = HasPermission and Player.TeamValue.Value == Door.Settings.Team end -- Requires specific team.
		if Door.Settings.TeamBlacklist then HasPermission = HasPermission and Player.TeamValue.Value ~= Door.Settings.TeamBlacklist end -- Requires not being on blacklisted team.
		return HasPermission
	end
	-- Registers a `Door` with the `ProximityContext` and sets up interaction listeners.
	local function RegisterDoor(Door)
		assert(Door.Resolved) -- Asserts the door's model has been resolved.
		local Model = Door.Model -- The door's Roblox model.
		local TouchAt = tick() -- Debounce timer for touch interactions.
		local LastAttempt = tick() -- Debounce timer for any interaction attempt.
		-- `DoorPlayer` is the main function called when a player attempts to interact with the door.
		local function DoorPlayer(Button) -- `Button`: boolean, true if triggered by a button click.
			local t = tick()
			local Character = LocalPlayer.Character
			if not Character then return end
			if not Character.PrimaryPart then return end
			if t - LastAttempt < 0.1 then return end -- Debounce for 0.1 seconds.
			LastAttempt = t
			if Door.State.Open then return end -- If door is already open, ignore.
			if os.time() - Door.State.CloseTime < Door.Settings.Duration then return end -- Cooldown after last close.
			-- Checks for permissions.
			local HasPermission = HasPerm(Door, LocalPlayer, Character, Button)
			if Door.Settings.Character then -- If door has character requirements.
				if HasPermission then
					PlaySound("Door", { -- Play success sound.
						Source = Model.Closed,
						TimeStart = 1,
						Volume = 0.2
					})
				else
					PlaySound("Door", { -- Play failure sound.
						Source = Model.Closed,
						TimeStart = 0,
						MaxTime = 0.6,
						Volume = 0.2
					})
				end
			end
			if not HasPermission then return end -- If no permission, exit.
			-- For swinging doors, determines the swing direction based on player position relative to door.
			if Door.Settings.Type == "Swing" then
				local u = (Door.Model.Closed.Position - Character.HumanoidRootPart.Position).unit
				local v = Door.Model.Closed.CFrame.lookVector
				local p = u:Dot(v)
				local Direction = p > 0 and 1 or -1 -- 1 for forward, -1 for backward.
				Door.State.Direction = Direction
			end
			DoorSequence(Door) -- Initiates the door opening sequence.
		end
		-- `Touched` is the callback for touch interactions with the door.
		local function Touched(Player)
			local t = tick()
			if t - TouchAt >= 0.03333333333333333 then -- Debounce for 1/30th of a second.
				TouchAt = t
				DoorPlayer() -- Calls `DoorPlayer` without `Button` flag.
			end
		end
		-- `MouseClick` is the callback for ClickDetector interactions.
		local function MouseClick(Player)
			if Player == LocalPlayer then -- Only if clicked by local player.
				DoorPlayer(true) -- Calls `DoorPlayer` with `Button` flag true.
			end
		end
		if Door.doorMaid ~= nil then -- Error check for duplicate maid.
			print(Model:GetFullName())
			error("Door already has a door maid.. what happened?")
		end
		local doorMaid = Maid.new() -- Creates a new `Maid` for this door's connections.
		Door.doorMaid = doorMaid -- Stores maid in door packet.
		-- Iterates through door model's children to find interaction parts.
		for _, v in Model:GetChildren() do
			if v:IsA("BasePart") and v.Name == "Touch" then -- For `BasePart`s named "Touch".
				table.insert(ContextMeta, { -- Adds to `ContextMeta` for `CheckTouch` loop.
					Tag = Door.Tag,
					Part = v,
					Fun = Touched,
					_DEBUG = "DoorTouchPart"
				})
			elseif v:IsA("ObjectValue") and v.Name == "Touch" then -- For `ObjectValue`s named "Touch" (pointing to a part).
				local Door = { -- Creates a temp door packet for this specific touch object.
					Tag = Door.Tag,
					Part = v.Value,
					Fun = Touched,
					_DEBUG = "DoorTouchObjValue"
				}
				doorMaid:GiveTask(v.Changed:Connect(function(Part) Door.Part = Part end)) -- Updates `Part` if `ObjectValue` changes.
				table.insert(ContextMeta, Door)
			elseif v:IsA("ObjectValue") and v.Name == "Button" then -- For `ObjectValue`s named "Button" (pointing to a button part).
				local mMaid = Maid.new() -- Maid for button-specific connections.
				doorMaid:GiveTask(mMaid) -- Adds button maid to door maid.
				local function processButton() -- Processes button initialization.
					mMaid:DoCleaning() -- Cleans up previous button connections.
					if v.Value then
						local Button = v.Value -- The actual button part.
						assert(Button:IsA("BasePart"), "missing button part")
						local ClickDetector = Button:WaitForChild("ClickDetector", 5) -- Waits for ClickDetector.
						assert(ClickDetector, "missing button click detector")
						-- Adds the button to `ProximityContext` for "Y" button prompt.
						AddContextButton(Button, ClickDetector.MaxActivationDistance, MouseClick, Door.Tag).Meta.Button = Button
						doorMaid:GiveTask(ClickDetector.MouseClick:Connect(MouseClick)) -- Connects MouseClick event.
						doorMaid:GiveTask(function() RemoveContextButtonByTag(Door.Tag) end) -- Adds cleanup task to remove button from context.
					end
				end
				task.spawn(processButton) -- Spawns a new coroutine for initial processing.
				doorMaid:GiveTask(v.Changed:Connect(processButton)) -- Connects to changes in `ObjectValue`.
			end
		end
	end
	-- Unregisters a `Door` when it's removed or streamed out, cleaning up its associated listeners.
	local function UnregisterDoor(Door)
		assert(not Door.Resolved) -- Asserts that the door is currently unresolved.
		local Tag = Door.Tag
		-- Removes associated entries from `ContextMeta`.
		for i = #ContextMeta, 1, -1 do
			if ContextMeta[i].Tag == Tag then
				table.remove(ContextMeta, i)
			end
		end
		ProximityContext.RemoveTag(Tag) -- Removes from general `ProximityContext` buttons.
		if Door.doorMaid then
			Door.doorMaid:DoCleaning() -- Cleans up all connections using the door's maid.
			Door.doorMaid = nil
		end
	end
	local Doors = {} -- Global table to store all registered door packets.
	-- Visually opens a door, optionally without animation.
	local function OpenDoor(Door, NoAnimate)
		if Door.Resolved then
			if NoAnimate then Door.State.NoAnimate = true end
			Door.State.Open = true
			if Door.OpenFun then Door:OpenFun() end -- Calls the door's specific open animation function.
		else
			-- If not resolved, set awaiting flags.
			Door.AwaitingDoorOpen = true
			Door.AwaitingDoorClose = false
		end
	end
	-- Visually closes a door, optionally without animation.
	local function CloseDoor(Door, NoAnimate)
		if Door.Resolved then
			if NoAnimate then Door.State.NoAnimate = true end
			Door.State.Open = false
			Door.State.CloseTime = os.time() -- Records close time for cooldown.
			if Door.CloseFun then Door:CloseFun() end -- Calls the door's specific close animation function.
		else
			-- If not resolved, set awaiting flags.
			Door.AwaitingDoorOpen = false
			Door.AwaitingDoorClose = true
		end
	end
	-- Animation function for sliding doors.
	local function FunSlide(Door)
		local Open = Door.State.Open
		local Model = Door.Model
		RxInstanceUtils.yieldForProperty(Model.Model, "PrimaryPart") -- Waits for the door model's PrimaryPart to be ready.
		local Light = Model.Model:FindFirstChild("light") -- Finds a "light" part within the door model.
		if not Light then -- Alternative way to find the light (via ObjectValue).
			Light = Model:FindFirstChild("Light")
			if Light and Light:IsA("ObjectValue") then
				if Light.Value then
					Light = Light.Value.Parent:FindFirstChild("light")
				else
					Light = nil
				end
			end
		end
		local OpenCFrame, ClosedCFrame = Door.OpenCFrame, Door.ClosedCFrame -- Door's open and closed CFrames.
		local function Finished() -- Called when animation completes.
			if Open then Model.Model:SetPrimaryPartCFrame(OpenCFrame)
			else
				Model.Model:SetPrimaryPartCFrame(ClosedCFrame)
				if Light then Light.BrickColor = BrickColor.new("Dusty Rose") end -- Resets light color.
			end
		end
		if Door.State.NoAnimate then Door.State.NoAnimate = false; return Finished() end -- If no animation, jump to end state.
		if Open and Light then Light.BrickColor = BrickColor.new("Bright green") end -- Sets light color for open state.
		local doorMaid = Door.doorMaid
		local t = 0 -- Animation progress.
		local tm = Door.Settings.Duration -- Animation duration.
		-- Animates the door's CFrame over time using `Heartbeat`.
		local function onHeartbeat(dt)
			t = t + dt * 1 / tm -- Increments progress based on delta time and duration.
			local p = Ease_inOutQuad(t, 0, 1, 1) -- Applies easing function.
			if not Open then p = 1 - p end -- Reverses progress if closing.
			Model.Model:SetPrimaryPartCFrame(ClosedCFrame:lerp(OpenCFrame, p)) -- Interpolates door CFrame.
			if t >= 1 then
				doorMaid.Stepped = nil -- Disconnects this `Heartbeat` connection.
				Finished() -- Calls finish function.
			end
		end
		doorMaid.Stepped = RunService.Heartbeat:connect(onHeartbeat) -- Connects to Heartbeat.
	end
	-- Animation function for swinging doors.
	local function FunSwing(Door)
		local Open = Door.State.Open
		local Model = Door.Model
		local Light = Model.Model:FindFirstChild("light")
		RxInstanceUtils.yieldForProperty(Model.Model, "PrimaryPart")
		if not Light then
			Light = Model:FindFirstChild("Light")
			if Light and Light:IsA("ObjectValue") then
				if Light.Value then Light = Light.Value.Parent:FindFirstChild("light")
				else Light = nil end
			end
		end
		local Direction = Door.State.Direction * Door.Direction -- Combined direction for swinging.
		local ClosedCFrame, HingeRelativeCFrame = Door.ClosedCFrame, Door.HingeRelativeCFrame -- Door CFrames and hinge pivot.
		local TargetAxisAngle = v3(0, math.pi * 0.55 * Direction, 0) -- Target angle for swing (0.55 * Pi radians).
		local function Finished()
			if Open then Model.Model:SetPrimaryPartCFrame(ClosedCFrame * HingeRelativeCFrame * m.CFrameFromAxisAngle(TargetAxisAngle) * HingeRelativeCFrame:inverse())
			else
				Model.Model:SetPrimaryPartCFrame(ClosedCFrame)
				if Light then Light.BrickColor = BrickColor.new("Dusty Rose") end
			end
		end
		if Door.State.NoAnimate then Door.State.NoAnimate = false; return Finished() end
		if Open and Light then Light.BrickColor = BrickColor.new("Bright green") end
		local doorMaid = Door.doorMaid
		local t = 0 -- Animation progress.
		local tm = Door.Settings.Duration -- Animation duration.
		-- Animates the door's rotation over time.
		local function onHeartbeat(p766) -- `p766` is delta time (`dt`).
			t = t + p766 * 1 / tm
			local p = Ease_inOutQuad(t, 0, 1, 1)
			if not Open then p = 1 - p end
			-- Interpolates the angle and applies the rotation around the hinge.
			Model.Model:SetPrimaryPartCFrame(ClosedCFrame * HingeRelativeCFrame * m.CFrameFromAxisAngle((Vector3.new(0, 0, 0)):lerp(TargetAxisAngle, p)) * HingeRelativeCFrame:inverse())
			if t >= 1 then
				doorMaid.Stepped = nil
				return Finished()
			end
		end
		doorMaid.Stepped = RunService.Heartbeat:connect(onHeartbeat)
	end
	-- Registers other types of simple touch-based triggers using `CollectionService`.
	do
		local CircleAction = UI.CircleAction -- Alias for `UI.CircleAction`.
		local function AddedFun(Part) -- Callback for when a `TouchTrigger` part is added.
			local TouchAt = 0 -- Debounce timer for this trigger.
			local function Touched(_) -- Callback when `Part` is touched.
				if tick() - TouchAt >= 1 then -- Cooldown of 1 second.
					TouchAt = tick()
					-- Fires an obfuscated remote event to the server.
					-- `f` + reversed (`mahagtm1` sub `3,4`) -> "hag" + reversed (`e2llyf2` sub `4,4`) -> "l" + "o585".
					-- The final obfuscated name is "fhaglo585".
					Event:FireServer("f" .. ("mahagtm1"):sub(3, 4):reverse():reverse():reverse():reverse():reverse() .. ("e2llyf2"):sub(4, 4):reverse():reverse():reverse():reverse():reverse() .. "o585", Part)
				end
			end
			table.insert(ContextMeta, { -- Adds to `ContextMeta` for `CheckTouch` loop.
				Part = Part,
				Fun = Touched,
				_DEBUG = "OtherTrigger"
			})
		end
		local function RemovedFun(Part) -- Callback for when a `TouchTrigger` part is removed.
			for i = #ContextMeta, 1, -1 do
				if ContextMeta[i].Part == Part then
					table.remove(ContextMeta, i)
					break
				end
			end
			return true
		end
		for _, Part in next, CollectionService:GetTagged("TouchTrigger") do AddedFun(Part) end -- Applies to existing tags.
		CollectionService:GetInstanceAddedSignal("TouchTrigger"):Connect(AddedFun) -- Connects for new tags.
		CollectionService:GetInstanceRemovedSignal("TouchTrigger"):Connect(RemovedFun) -- Connects for removed tags.
		-- Special logic for Sewer Hatches.
		local function AddHatch(Tag) -- Callback for when a "SewerHatch" tagged model is added.
			local Part = assert(Tag:FindFirstChild("SewerHatch"), "missing SewerHatch") -- The hatch part.
			local function Action(Spec, a) -- Action callback for the hatch.
				if a then
					-- Fires an obfuscated remote event to the server.
					-- `s` + reversed (`co96xpz` sub `2,4`) -> "6xp" + reversed (`m5fg6siu` sub `4,6`) -> "6gf" + "y".
					-- The final obfuscated name is "s6xp6gfy".
					Event:FireServer("s" .. ("co96xpz"):sub(2, 4):reverse() .. ("m5fg6siu"):sub(4, 6):reverse():reverse():reverse():reverse():reverse() .. "y", "SewerHatch", Part)
				end
				return true
			end
			if Tag:FindFirstChild("FromTop").Value then -- If hatch can be opened from top.
				CircleAction.Add({ -- Adds "Pull Open" action.
					Part = Part,
					Name = "Pull Open",
					Timed = true,
					Duration = 3,
					Dist = 10,
					Callback = Action
				}, Tag)
			end
			local Spec = { -- Specifies the touch trigger for the hatch.
				Tag = Tag,
				Part = Tag:FindFirstChild("Touch"),
				Fun = function() return Action(nil, true) end, -- Directly calls Action on touch.
				_DEBUG = "SewerHatch"
			}
			table.insert(ContextMeta, Spec)
		end
		local function RemoveHatch(Tag) -- Callback for when a "SewerHatch" tagged model is removed.
			CircleAction.Remove(Tag) -- Removes circle action.
			for i = #ContextMeta, 1, -1 do
				if ContextMeta[i].Tag == Tag then
					table.remove(ContextMeta, i)
					return
				end
			end
		end
		for _, Tag in next, CollectionService:GetTagged("SewerHatch") do AddHatch(Tag) end -- Applies to existing tags.
		CollectionService:GetInstanceAddedSignal("SewerHatch"):Connect(AddHatch) -- Connects for new tags.
		CollectionService:GetInstanceRemovedSignal("SewerHatch"):Connect(RemoveHatch) -- Connects for removed tags.
	end
	-- The main loop for the simple touch trigger system, checks player position against touch parts.
	local function CheckTouch()
		local Character = LocalPlayer.Character
		if not Character then return end
		local HumanoidRootPart = Character.PrimaryPart
		if HumanoidRootPart then
			local p = HumanoidRootPart.Position -- Player's position.
			for _, Meta in next, ContextMeta do -- Iterates through all registered touch metadata.
				if Meta.Part and Meta.Part:IsDescendantOf(workspace) then -- Check if part is valid and in workspace.
					-- Uses a simple prism check for performance: if player is within the part's bounding box + margin.
					if m.IsPointInPrism(p, Meta.Part.CFrame, Meta.Part.Size + Vector3.new(4, 6, 4)) then
						Meta.Fun(HumanoidRootPart) -- Calls the touch function.
					end
				else
					warn("TouchQueue has invalid part", Meta._DEBUG) -- Warns about invalid parts.
				end
			end
		end
	end
	ThreadLoopAdd(0.16666666666666666, CheckTouch) -- Runs `CheckTouch` approximately every 1/6th of a second.
	--// DOOR DATA RECEPTION //--
	-- This sub-section handles receiving door data from the server and updating their local states and animations.
	-- Callback for when a `Door` model (tagged "Door") is added (streams in).
	local function AddedFun(Model)
		local Tag = Model:WaitForChild("Tag", 5).Value -- Waits for the door's Tag `StringValue`.
		for _, Door in next, Doors do -- Iterates through locally known door packets.
			if Door.Tag == Tag and Door.Model ~= Model then -- If a packet with matching tag exists but `Model` reference is different (new stream-in).
				assert(Door.Resolved ~= true, "Door was already resolved:" .. Model:GetFullName()) -- Assert door wasn't already resolved.
				Door.Resolved = true -- Mark as resolved.
				Door.Model = Model -- Assign the new model.
				if Door.AwaitingDoorOpen or Door.State.Open then OpenDoor(Door, true) -- Open if awaiting or already open.
				elseif Door.AwaitingDoorClose or not Door.State.Open then CloseDoor(Door, true) end -- Close if awaiting or already closed.
				RegisterDoor(Door) -- Register the door for interactions.
				return true
			end
		end
		return false
	end
	-- Callback for when a `Door` model is removed (streams out).
	local function RemovedFun(Model)
		for _, Door in next, Doors do
			if Door.Model == Model then
				assert(Door.Resolved == true, "Door was not resolved:" .. Model:GetFullName()) -- Assert door was resolved.
				Door.Resolved = false -- Mark as unresolved.
				Door.Model = nil -- Clear model reference.
				UnregisterDoor(Door) -- Unregister the door.
				return true
			end
		end
		return false
	end
	for _, Model in next, CollectionService:GetTagged("Door") do AddedFun(Model) end -- Applies to existing doors.
	CollectionService:GetInstanceAddedSignal("Door"):Connect(AddedFun) -- Connects for new doors.
	CollectionService:GetInstanceRemovedSignal("Door"):Connect(RemovedFun) -- Connects for removed doors.
	local DoorsUpdate = {} -- Temporary table to store door updates received before the door model is streamed in.
	local function ResolveRealDoor(Tag) -- Helper to find a door packet by its tag.
		for _, Door in next, Doors, nil do
			if Door.Tag == Tag then return Door end
		end
		return false
	end
	-- Receives data for a single door from the server.
	local function ReceiveDoor(Door, NoRegister) -- `Door`: door data packet, `NoRegister`: boolean to suppress registration.
		assert(Door.Tag)
		local RealDoor = ResolveRealDoor(Door.Tag) -- Finds existing door packet.
		if RealDoor then
			RealDoor.Settings = Door.Settings -- Updates settings.
			RealDoor.AwaitingDoorOpen = Door.AwaitingDoorOpen
			RealDoor.AwaitingDoorClose = Door.AwaitingDoorClose
		else
			-- If new door, set up animation functions.
			if Door.Settings.Type == "Swing" then Door.OpenFun = FunSwing; Door.CloseFun = FunSwing
			elseif Door.Settings.Type == "Slide" then Door.OpenFun = FunSlide; Door.CloseFun = FunSlide end
			if Door.State.Open then Door.AwaitingDoorOpen = true else Door.AwaitingDoorClose = true end -- Set initial awaiting state.
			table.insert(Doors, Door) -- Add new door to list.
			RealDoor = Door
		end
		local DoorUpdate = DoorsUpdate[RealDoor.Tag] -- Check for pending updates.
		DoorsUpdate[RealDoor.Tag] = nil
		if DoorUpdate then -- Apply pending updates.
			RealDoor.State = DoorUpdate.State
			RealDoor.Settings = DoorUpdate.Settings
			RealDoor.AwaitingDoorOpen = DoorUpdate.AwaitingDoorOpen
			RealDoor.AwaitingDoorClose = DoorUpdate.AwaitingDoorClose
		end
		if not NoRegister then
			for _, Model in next, CollectionService:GetTagged("Door") do AddedFun(Model) end -- Re-run AddedFun for existing doors to ensure registration.
		end
	end
	-- Receives data for a batch of doors from the server (e.g., on game join).
	local function ReceiveDoors(Doors)
		for _, Door in next, Doors do ReceiveDoor(Door, true) end -- Receive each door data without immediate registration.
		for _, Model in next, CollectionService:GetTagged("Door") do AddedFun(Model) end -- Then register all existing models.
	end
	-- Server command handler (`em.sr1b86nj`) that tells the client to open a door.
	function em.sr1b86nj(Door) -- `sr1b86nj` is an obfuscated event name (likely "OpenDoorClient").
		local Tag = Door.Tag
		local RealDoor = ResolveRealDoor(Tag)
		if not RealDoor then -- If door model not yet resolved, store pending update.
			Door.AwaitingDoorOpen = true; Door.AwaitingDoorClose = false
			DoorsUpdate[Tag] = Door
			return
		end
		RealDoor.State = Door.State -- Update state and settings.
		RealDoor.Settings = Door.Settings
		OpenDoor(RealDoor) -- Call `OpenDoor` on the actual door packet.
	end
	-- Server command handler (`em.ztad52xk`) that tells the client to close a door.
	function em.ztad52xk(Door) -- `ztad52xk` is an obfuscated event name (likely "CloseDoorClient").
		local Tag = Door.Tag
		local RealDoor = ResolveRealDoor(Tag)
		if not RealDoor then -- If door model not yet resolved, store pending update.
			Door.AwaitingDoorOpen = false; Door.AwaitingDoorClose = true
			DoorsUpdate[Tag] = Door
			return
		end
		RealDoor.State = Door.State -- Update state and settings.
		RealDoor.Settings = Door.Settings
		CloseDoor(RealDoor) -- Call `CloseDoor` on the actual door packet.
	end
	-- Server command handler (`em.jmqewycg`) to receive data for a single door.
	function em.jmqewycg(Door) ReceiveDoor(Door) end -- `jmqewycg` is obfuscated event name (likely "ReceiveSingleDoor").
	-- Server command handler (`em.rys3bxto`) to receive data for multiple doors.
	function em.rys3bxto(Doors) ReceiveDoors(Doors) end -- `rys3bxto` is obfuscated event name (likely "ReceiveMultipleDoors").
end

--// GAME SETTINGS DEFINITIONS //--
-- This section defines various in-game settings that the player can customize,
-- and connects them to the `GameSettingsService` for persistence and UI management.
do
	-- Robbery Music Volume Setting.
	local Setting = {
		name = "robberyMusic", -- Unique internal name for the setting.
		title = "Robbery Music", -- Display title for the setting in UI.
		type = gameSettingType.Slider, -- Type of UI control (slider).
		defaultValue = 100, -- Default value (100%).
		order = 10, -- Order in the settings list.
		min = 0, -- Minimum slider value.
		max = 100, -- Maximum slider value.
		step = 1, -- Step increment for slider.
		textMap = function(d) return ("%d%%"):format(d) end -- Function to format the display text (e.g., "50%").
	}
	GameSettingsService.add(Setting) -- Adds the setting to the `GameSettingsService`.
	local function handleSetting(v) -- Callback function for when this setting's value changes. `v` is the new value.
		SoundService.RobberyMusic.Volume = math.clamp(v / 100, 0, 1) -- Sets the volume of the `RobberyMusic` sound group, converting percentage to 0-1 range.
	end
	handleSetting(Setting:getValue()) -- Applies the initial value of the setting.
	Setting.onChanged:Connect(handleSetting) -- Connects `handleSetting` to the setting's `onChanged` signal.
end
do
	-- Other Players' Radio Volume Setting.
	local Setting = {
		name = "otherRadios",
		title = "Other Radios",
		type = gameSettingType.Slider,
		defaultValue = 100,
		order = 11,
		min = 0,
		max = 100,
		step = 1,
		textMap = function(d) return ("%d%%"):format(d) end
	}
	GameSettingsService.add(Setting)
	local function handleSetting(v)
		SoundService.OtherRadios.Volume = math.clamp(v / 100, 0, 1) -- Sets the volume of the `OtherRadios` sound group.
	end
	handleSetting(Setting:getValue())
	Setting.onChanged:Connect(handleSetting)
end
do
	-- Shadows from PointLights, SpotLights, etc. Setting.
	local Setting = {
		name = "lightShadows",
		title = "Light Shadows",
		type = gameSettingType.Checkbox,
		defaultValue = true,
		order = 500
	}
	GameSettingsService.add(Setting)
	local function handleSetting(v)
		-- Iterates through all `Light` instances in `workspace` and `ReplicatedStorage` to apply the shadow setting.
		for _, Light in ipairs(workspace:GetDescendants()) do
			if Light:IsA("Light") then Light.Shadows = v end
		end
		for _, Light in ipairs(ReplicatedStorage:GetDescendants()) do
			if Light:IsA("Light") then Light.Shadows = v end
		end
	end
	handleSetting(Setting:getValue())
	Setting.onChanged:Connect(handleSetting)
end
do
	-- Global shadows from the sun/moon setting.
	local Setting = {
		name = "sunShadows",
		title = "Sun Shadows",
		type = gameSettingType.Checkbox,
		defaultValue = true,
		noSave = true, -- This setting is not saved, likely client-only or overridden by server.
		order = 510
	}
	GameSettingsService.add(Setting)
	local function handleSetting(v)
		game:GetService("Lighting").GlobalShadows = v -- Sets the global shadows property.
	end
	handleSetting(Setting:getValue())
	Setting.onChanged:Connect(handleSetting)
end
do
	-- Level of Detail (LOD) distance multiplier setting.
	local WorldUnloadConsts = require(ReplicatedStorage.WorldUnload.WorldUnloadConsts) -- Constants for world streaming.
	local HumanoidUnloadConsts = require(ReplicatedStorage.HumanoidUnload.HumanoidUnloadConsts) -- Constants for humanoid streaming.
	local DestructibleConsts = require(ReplicatedStorage.Game.Destructible.DestructibleConsts) -- Constants for destructible objects streaming.
	local Setting = {
		name = "lodMaxDist",
		title = "Level of Detail Dist",
		type = gameSettingType.Slider,
		defaultValue = 1,
		order = 20,
		min = 0.5,
		max = 2,
		step = 0.1,
		textMap = function(d) return ("%.1fx"):format(d) end -- Formats as a multiplier (e.g., "1.0x").
	}
	GameSettingsService.add(Setting)
	local function handleSetting(v)
		-- Applies the multiplier `v` to the maximum loading/unloading distances for various systems.
		WorldUnloadUtils.setMaxDistToLoad(WorldUnloadConsts.MAX_DIST_TO_LOAD * v)
		HumanoidUnloadUtils.setMaxDistToLoad(HumanoidUnloadConsts.MAX_DIST_TO_LOAD * v)
		DestructibleUtils.setMaxDistToLoad(DestructibleConsts.MAX_DIST_TO_LOAD * v)
	end
	handleSetting(Setting:getValue())
	Setting.onChanged:Connect(handleSetting)
end
-- An empty, self-calling anonymous function. The purpose of this might be a subtle anti-tamper check,
-- as some exploit injectors might interact with `game.GetObjects` or global metatables.
-- If the string manipulation or table access within it were intercepted, it might detect tampering.
(function()
	return (""):sub(-1, 1) -- Returns an empty string.
end)()

--// AMBIENT SOUND & WEATHER SYSTEM //--
-- This section manages ambient background sounds and visual weather effects (like rain).
do
	local Sounds = {} -- Table to store references to ambient `Sound` instances.
	-- Creates and stores all ambient sound objects based on `Settings.AmbientIds`.
	-- Only runs if not in Studio, or if in Studio but `Settings.Test.Ambient` is true.
	if not IsStudio or IsStudio and Settings.Test.Ambient then
		for k, v in next, Settings.AmbientIds do
			local Sound = Instance.new("Sound")
			Sound.SoundId = "rbxassetid://" .. v
			Sound.Name = k
			Sound.Looped = true
			Sound.SoundGroup = SoundService.Ambient -- Assigns to the "Ambient" sound group.
			Sound.Parent = SoundService.Ambient -- Parents to the "Ambient" sound group.
			Sounds[k] = Sound
		end
	end
	-- Sets the volume of all ambient sounds based on a provided table of volume values.
	local function SetVolume(Values) -- `Values`: a table where keys are sound names and values are desired volumes.
		-- `upvalues`: Accesses the `Sounds` table from the outer scope.
		for k, v in next, Sounds do
			local Volume = Values[k] or 0 -- Gets desired volume, defaults to 0.
			if v.IsPlaying or Volume <= 0.01 then -- If sound is playing OR desired volume is very low.
				if v.IsPlaying and Volume <= 0.01 then v:Stop() end -- Stops if playing and target volume is near zero.
			else -- If sound is not playing and desired volume is above threshold.
				v:Play() -- Plays the sound.
			end
			v.Volume = Volume -- Sets the sound's volume.
		end
	end
	-- Applies initial ambient sound volumes (likely a default "Day" state).
	SetVolume((LerpTable(Settings.Ambient.Day, Settings.Ambient.Day, 1))) -- Uses `LerpTable` but with start and end as same table and `i=1`.
	local MinimapService = require(ReplicatedStorage.App.MinimapService) -- Module for minimap.
	-- Smoothly transitions between two ambient sound/visual profiles (e.g., day to night, or normal to storm).
	local function SetSettings(a, b) -- `a`: start profile (table of values), `b`: end profile.
		local Vig -- Reference to a "Vig" (vignette) UI element.
		do
			local Main = PlayerGui:FindFirstChild("Main")
			if Main then Vig = Main.Frame.Vig end
		end
		local t, e = 0, nil -- `t`: animation progress, `e`: `Heartbeat` connection.
		local t3 = os.clock() -- Timer for delta time within the Heartbeat loop.
		local function Heartbeat()
			local t2 = os.clock()
			local dt = t2 - t3
			t3 = t2
			t = t + dt * 1 / 4 -- Progresses animation `t` over 4 seconds.
			if t >= 1 then
				t = 1
				e:disconnect() -- Disconnects `Heartbeat` when animation completes.
			end
			local c = LerpTable(a, b, t) -- Interpolates all values (volumes, colors) in the profile.
			SetVolume(c) -- Applies interpolated volumes to ambient sounds.
			if Vig then Vig.ImageColor3 = c.Vig end -- Applies interpolated vignette color.
			MinimapService.updateMapImageColor3(c.Minimap) -- Updates minimap color.
		end
		e = RunService.Heartbeat:Connect(Heartbeat) -- Connects to `Heartbeat`.
	end
	-- Rain effect logic.
	local Rain = ReplicatedStorage.Resource.Rain -- Reference to the `Rain` model resource.
	Rain.Name = "Rain" -- Renames the resource instance.
	local Thread -- Variable to hold the `Heartbeat` connection for the rain update loop.
	-- Starts the rain visual and sound effects thread.
	local function StartRainThread()
		local Origin = Vector3.new() -- Initial origin for rain particles.
		for _, v in Rain:GetChildren() do -- Configures rain model's parts to not collide/touch.
			if v:IsA("BasePart") then v.CanCollide = false; v.CanTouch = false; v.CanQuery = false end
		end
		Rain.Parent = workspace -- Parents the rain model to `workspace`.
		-- `Thread` is the main `Heartbeat` loop for updating the rain particle effect's position and state.
		Thread = RunService.Heartbeat:Connect(function(dt)
			debug.profilebegin("Rain Update")
			local InVehicle = false
			if LocalPlayer.Character then
				local HumanoidRootPart = LocalPlayer.Character.PrimaryPart
				if HumanoidRootPart then
					-- Moves the origin of the rain effect to follow the player, with some velocity prediction.
					Origin = HumanoidRootPart.Position + HumanoidRootPart.Velocity * Vector3.new(1, 0, 1) * dt * 4
				end
				local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
				if Humanoid then
					InVehicle = Humanoid.Sit or Humanoid.PlatformStand -- Checks if player is in a vehicle/seated.
				end
			end
			local RainFall = Rain.RainFall:FindFirstChild("Rain") -- The main falling rain particle emitter.
			local RainDroplets = Rain.RainDroplets:FindFirstChild("Rain") -- Rain droplets on ground particle emitter.
			Rain.RainFall.CFrame = CFrame.new(Origin) + Vector3.new(0, 37, 0) -- Positions falling rain high above player.
			-- Raycasts down to find where the rain hits the ground.
			local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(RayNew(Origin, Vector3.new(0, -10, 0)), { workspace.Vehicles, LocalPlayer.Character, Rain })
			Rain.RainDroplets.CFrame = CFrame.new(Pos) + Vector3.new(0, 1.5, 0) -- Positions droplets slightly above hit position.
			-- Checks if the player is under a roof (by raycasting upwards).
			local Params = RaycastParams.new()
			Params.FilterDescendantsInstances = { workspace.Vehicles, LocalPlayer.Character, Rain, workspace:FindFirstChild("Clouds") }
			local Hit2 = Raycast.collidable(Origin, Vector3.new(0, 1, 0), 100, Params) ~= nil -- `Hit2` is true if ceiling/roof is hit.
			-- Enables/disables particle emitters based on whether the player is indoors or in a vehicle.
			if RainFall then RainFall.Enabled = not Hit2 end -- Falling rain is disabled if under a roof.
			SoundService.Ambient.CompressorSoundEffect.Enabled = not not Hit2 -- Enables a compressor sound effect if under a roof (muffles sound).
			if RainDroplets then RainDroplets.Enabled = not not Hit and not Hit2 and not InVehicle end -- Droplets enabled if hitting ground, not under roof, and not in vehicle.
			debug.profileend()
		end)
	end
	-- Stops the rain effects and cleans up the thread.
	local function StopRainThread()
		Rain.Parent = ReplicatedStorage.Resource -- Reparents rain model back to resources.
		if Thread then Thread:Disconnect() end -- Disconnects the `Heartbeat` connection.
		Thread = nil
	end
	local LastTimeOfDay = "Day" -- Caches the last time of day state.
	-- Server command handler (`em.sixobzoy`) that tells the client to change the time of day and weather.
	function em.sixobzoy(a) -- `sixobzoy` is an obfuscated event name (likely "UpdateTimeOfDay"). `a` is the new time of day string.
		if a == LastTimeOfDay then return end -- If already in this state, do nothing.
		if a == "Day" then SetSettings(Settings.Ambient[LastTimeOfDay], Settings.Ambient.Day) -- Transition to Day.
		elseif a == "Night" then SetSettings(Settings.Ambient[LastTimeOfDay], Settings.Ambient.Night) -- Transition to Night.
		elseif a == "Storm" then StartRainThread(); SetSettings(Settings.Ambient[LastTimeOfDay], Settings.Ambient.Storm) end -- Transition to Storm, start rain.
		if a ~= "Storm" then StopRainThread() end -- If not storm, stop rain.
		LastTimeOfDay = a -- Update cached time of day.
	end
end
--// NITRO SHOP UI //--
-- This section handles the functionality and display of the Nitro Shop UI.
do
	NitroShopGui = ReplicatedStorage.StarterGui.NitroShopGui -- Reference to the Nitro Shop GUI.
	NitroShopGui.Parent = LocalPlayer.PlayerGui -- Parents the GUI to the player's GUI.
	do
		local NitroWindow = AlexWM.MakeWindow() -- Creates a new UI window managed by `AlexWM`.
		function NitroWindow.OpenFun() -- Callback when the window is opened.
			NitroShopGui.Enabled = true -- Enables the GUI.
			EzUtils.selectIfGamepad(NitroShopGui.Container.Container.ContainerButtons.Tier1.Button) -- Sets initial gamepad focus.
		end
		function NitroWindow.CloseFun() -- Callback when the window is closed.
			NitroShopGui.Enabled = false -- Disables the GUI.
		end
		AlexWM.WindowGroupAdd(MainWindowGroup, NitroWindow) -- Adds the window to the main window group.
		NitroShopGui.Container.Close.MouseButton1Down:connect(function() AlexWM.WindowClose(NitroWindow) end) -- Connects close button.
		VehicleStuff.AtGasStation = false -- Initial state: not at gas station.
		-- Server command handler (`em.k9quu0id`) that tells the client they are at a gas station and can open the nitro shop.
		function em.k9quu0id(AtGasStation, NotInVehicle) -- `k9quu0id` is obfuscated event name (likely "ToggleNitroShop").
			if not AtGasStation then VehicleStuff.AtGasStation = false; AlexWM.WindowClose(NitroWindow); return end -- If not at gas station, close shop.
			if not NotInVehicle then VehicleStuff.AtGasStation = true end -- Update state if player is at gas station.
			AlexWM.WindowOpen(NitroWindow) -- Opens the nitro shop window.
		end
		VehicleUtils.NitroShopVisible = em.k9quu0id -- Exposes this handler through `VehicleUtils`.
	end
	-- Populates the nitro shop UI with products from `MarketplaceService`.
	local function AttemptUpdateGui()
		if not Settings.FetchedMarketplace then return false end -- Waits for marketplace products to be fetched.
		for _, Product in next, Settings.DevProduct do -- Iterates through all developer products from settings.
			if Product.Type == "Nitro" then -- If it's a "Nitro" type product.
				local Name = Product.Name
				local f = NitroShopGui.Container.Container.ContainerButtons:FindFirstChild(Name) -- Finds the corresponding UI button.
				if f then
					f.Button.Title.Text = Localization:FormatByKey("NitroShop.BuyAmount", { Product.Fuel }) -- Formats text: "+X".
					f.Button.MouseButton1Down:connect(function() -- Connects button click.
						if VehicleStuff.Nitro >= Settings.Scalar.NitroMax - 25 then
							em.ht9y5ngc({ Title = "Rocket Fuel", Text = "You have a lot of fuel, go use it!" }) -- Message if near full.
						else
							local CanBuy = true
							-- Checks if player can buy anywhere (Mobile Garage gamepass) or only at gas station.
							if not VehicleStuff.AtGasStation and not GamepassSystem.DoesPlayerOwn(GamepassUtils.EnumGamepass.PremiumGarage) then
								PromptPurchase(Settings.Gamepass.MobileGarage) -- Prompts to buy Mobile Garage if needed.
								CanBuy = false
							end
							if CanBuy then MarketplaceService:PromptProductPurchase(LocalPlayer, Product.Id) end -- Prompts purchase.
						end
					end)
				end
			end
		end
		return true -- Returns true if GUI was updated.
	end
	spawn(function()
		while not AttemptUpdateGui() do wait(1) end -- Loops until GUI is successfully updated.
	end)
end
-- Updates the player's "HasEscaped" status from a character attribute.
local function updateHasEscaped()
	PlayerStuff.HasEscaped = Players.LocalPlayer:GetAttribute("HasEscaped") == true
	if PlayerStuff.HasEscaped and not ChinaPolicyService:IsActive() then -- If escaped and not in China region.
		em.ht9y5ngc({ Text = Localization:FormatByKey("Banner.Escaped") }) -- Displays "Escaped" banner.
	end
end
updateHasEscaped() -- Call initially.
Players.LocalPlayer:GetAttributeChangedSignal("HasEscaped"):connect(updateHasEscaped) -- Connects to attribute change.
-- Server command handler (`em.yt4muuj6`) that tells the client to pop their vehicle's tires.
function em.yt4muuj6() -- `yt4muuj6` is obfuscated event name (likely "PopTiresClient").
	if mVehiclePacket then
		VehicleUtils.setTireHealth(mVehiclePacket.Model, 0) -- Sets tire health to 0.
	end
end
local _ = 1 -- Unused local variable, possibly a leftover from decompilation or a placeholder.
-- A generic remote event forwarder. It receives an event name and its arguments, then calls the corresponding function in the `em` table.
function em.g45qe3s1(n, ...) -- `g45qe3s1` is obfuscated event name (likely "ForwardClientEventToServer"). `n` is event name, `...` are args.
	if n == "ems" then -- Special case for "ems" event, adds a delay before firing.
		delay(0.5, function()
			-- `g` + reversed (`aveq54sz5l` sub `3,6`) -> "4sza" + `jps3i3rk` sub `3,4` -> "s" + "1".
			-- The final obfuscated name is "g4szajs1".
			Event:FireServer("g" .. ("aveq54sz5l"):sub(3, 6):reverse():reverse():reverse():reverse():reverse() .. ("jps3i3rk"):sub(3, 4):reverse() .. "1", n)
		end)
	else
		-- `g` + reversed (`oq3eq54w` sub `3,7`) -> "4weq" + "s1".
		-- The final obfuscated name is "g4weqs1".
		Event:FireServer("g" .. ("oq3eq54w"):sub(3, 7):reverse():reverse():reverse() .. "s1", n)
	end
	assert(em[n], n)(...) -- Asserts handler exists and calls it.
end
-- Initialize the team selection UI.
require(ReplicatedStorage.TeamSelect.TeamChooseUI).Init({
	Event = Event,
	em = em,
	OnJump = OnJump
})
-- Finally, connect the main generic remote event handler.
ConnectEvents()
-- A loop to update the visibility of vehicle price billboards (e.g., "$10,000" above a car).
local function UpdateVehicleUI()
	local Character = LocalPlayer.Character
	if Character then
		local HumanoidRootPart = Character.PrimaryPart
		if HumanoidRootPart then
			local CanEnterAnyCarForFree = LocalPlayer:GetAttribute("TutorialCanEnterAnyCarForFree") == true -- Check for tutorial flag.
			for _, Vehicle in next, workspace.Vehicles:GetChildren() do -- Iterates through all vehicles in workspace.
				local Seat = Vehicle:FindFirstChild("Seat")
				local BoundingBox = Vehicle:FindFirstChild("BoundingBox")
				local Make = Vehicle:FindFirstChild("Make")
				if BoundingBox and Seat then
					local Player = Seat:FindFirstChild("Player") -- Player occupying the seat.
					local d = (HumanoidRootPart.Position - BoundingBox.Position).magnitude -- Distance to vehicle.
					local MoneyBillboard = BoundingBox:FindFirstChild("MoneyBillboard") -- The billboard GUI.
					if MoneyBillboard and Make and Player then
						-- Shows the billboard if the vehicle is close, not occupied, and not owned/rented by local player.
						MoneyBillboard.Enabled = d < 50 and not Player.Value and not (VehicleStuff.VehiclesOwned[Make.Value] and not VehicleStuff.VehiclesRented[Make.Value])
					end
				end
			end
		end
	else
		return
	end
end
ThreadLoopAdd(0.1, UpdateVehicleUI) -- Runs `UpdateVehicleUI` every 0.1 seconds.
-- Attempts to enter a vehicle.
local function AttemptVehicleEnter(Vehicle)
	if not mVehiclePacket then -- Only allow if not already in a vehicle.
		-- Fires an obfuscated remote event to the server to request vehicle entry.
		-- `n` + reversed (`umlyk3u2` sub `3,4`) -> "yl" + reversed (`pfzw51` sub `2,3`) -> "wz" + reversed (`upxhrg` sub `5,5`) -> "r" + "uw".
		-- The final obfuscated name is "nylwzruw".
		Event:FireServer("n" .. ("umlyk3u2"):sub(3, 4):reverse() .. ("pfzw51"):sub(2, 3):reverse() .. ("upxhrg"):sub(5, 5):reverse():reverse():reverse() .. "uw", Vehicle.Parent, Vehicle)
	end
end
-- Server command handler (`em.cso3upr2`) that tells the client their action was not allowed.
function em.cso3upr2() -- `cso3upr2` is obfuscated event name (likely "ActionNotAllowed").
	wait() -- Waits a frame.
	UI.CircleAction.NotAllowed() -- Triggers "not allowed" animation on circle action UI.
end
-- This function dynamically calculates the player's walk speed based on many factors.
local function WalkSpeedFun()
	local Character = LocalPlayer.Character
	if Character then
		local Humanoid = Character:FindFirstChild("Humanoid")
		if Humanoid then
			local WalkSpeed = Humanoid.WalkSpeed -- Current walk speed.
			-- `Scalar`: Scales speed based on humanoid health (slower when low on health), clamped to 0.5 min.
			local Scalar = max(ln(Humanoid.Health + 1) / ln(101), 0.5)
			local ItemStack = ItemSystem.GetLocalEquipped()
			if ItemStack then
				ItemStack = InventoryItemUtils.getName(ItemStack.inventoryItemValue)
				if ItemStack == "Cuffed" then Scalar = 0 -- No movement when cuffed.
				elseif ItemStack == "ShieldSWAT" then Scalar = Scalar * 0.75 end -- Slower with shield.
			end
			if Stunned then Scalar = 0 end -- No movement when stunned.
			local Movement = Scalar * 16 -- Base movement speed.
			if ShouldCrawl then Movement = Movement * 0.4 end -- Slower when crawling.
			if Falling.IsSkydiving() then Movement = Movement * 4 -- Faster when skydiving.
			elseif ShouldSprint then Movement = Movement * 1.5 end -- Faster when sprinting.
			if CharacterUtil.IsJuiced then Movement = Movement + 20 end -- Speed boost from juice item.
			-- Slowed by police spotlights (if prisoner).
			if LocalPlayer.TeamValue.Value == Settings.Team.Prisoner then
				for Spotlight, _ in pairs(Classes.Heli.SpotlightBinder:GetAllSet()) do
					if Spotlight.IsLocalInSpotlight then Movement = Movement * 0.75 end
				end
			end
			if Character:FindFirstChild("IsInFloorCircle") ~= nil then Movement = Movement * 0.5 end -- Slower if in specific floor circle.
			if Humanoid:GetAttribute("IsInTrackingSpotlight") == true then Movement = Movement * 0.8 end -- Slower if in tracking spotlight.
			if Humanoid:GetAttribute(MovementConsts.NO_MOVEMENT_ATTR_NAME) then Movement = Movement * 0 end -- Zero movement if "no movement" attribute is set.
			local WalkSpeedSpring = CharacterUtil.WalkSpeedSpring:Update() -- Update WalkSpeedSpring.
			if WalkSpeedSpring < 0 then WalkSpeedSpring = 0 end
			if WalkSpeedSpring > 10 then WalkSpeedSpring = 10 end
			local RealWalkSpeed = Movement * WalkSpeedSpring -- Final calculated walk speed.
			if abs(RealWalkSpeed - WalkSpeed) > 0.1 then -- Apply if change is significant.
				Humanoid.WalkSpeed = RealWalkSpeed
			end
			-- Adjust crawl animation speed to match actual movement speed.
			if CrawlTrack then
				local HumanoidRootPart = Character.PrimaryPart
				if HumanoidRootPart then
					local RelativeSpeed = HumanoidRootPart.CFrame:vectorToObjectSpace(HumanoidRootPart.Velocity)
					CrawlTrack:AdjustSpeed(-RelativeSpeed.Z / 6) -- Adjusts speed based on forward velocity.
				end
			end
		end
	else
		return
	end
end
-- A utility function to determine how frequently to run updates based on distance.
local getUpdateRate = function(a, b, c) -- `a`: current distance, `b`: min distance for update, `c`: max distance for update.
	if a < b then return 0 -- Updates constantly if very close.
	else return (a - b) / (c - b) end -- Scales update frequency linearly with distance.
end
-- Dynamically updates the context for the vehicle interaction circle.
local function UpdateVehicle(Spec) -- `Spec`: The `CircleAction` specification for a vehicle seat.
	local Enabled = not mVehiclePacket -- Only enable interaction if player is not in a vehicle.
	local Seat = Spec.Part -- The vehicle seat part.
	if Seat and Seat.Parent then
		local ShouldHotwire = nil -- Flag to show hotwire option.
		local ShouldEject = nil -- Flag to show eject option.
		local ShouldAllowEntry = nil -- Flag to show generic enter option.
		-- Logic for criminals to hotwire police cars.
		if Team.Value == Settings.Team.Prisoner then
			local TeamRestrict = Seat.Parent:FindFirstChild("TeamRestrict")
			if TeamRestrict and (Seat.Name == "Seat" and TeamRestrict.Value ~= Team.Value) then
				ShouldHotwire = true
			end
			-- Logic for police to eject players from their car.
		elseif Team.Value == Settings.Team.Police then
			local ItemStack = ItemSystem.GetLocalEquipped()
			if ItemStack and ItemStack.__ClassName == "Handcuffs" then
				ShouldEject = true
			end
		end
		if not ShouldHotwire or not ShouldEject then ShouldAllowEntry = true end -- If no special action, allow generic entry.
		-- Update the interaction circle's properties (text, duration, etc.) based on determined action.
		local Distance = 10 -- Default interaction distance.
		local Changed -- Flag to track if any action-related property changed.
		if ShouldHotwire ~= Spec.ShouldHotwire then Spec.ShouldHotwire = ShouldHotwire; Changed = true
		else Changed = false end -- Set if hotwire state changed.
		if ShouldHotwire then Spec.Name = Localization:FormatByKey("Action.Hijack"); Spec.Timed = true; Spec.Duration = 8 end
		if ShouldEject ~= Spec.ShouldEject then Spec.ShouldEject = ShouldEject; Changed = true end -- Set if eject state changed.
		if ShouldEject then Spec.Name = Localization:FormatByKey("Action.Eject"); Spec.Timed = false; Spec.Duration = 1; Distance = 12 end
		if ShouldAllowEntry ~= Spec.ShouldAllowEntry then Spec.ShouldAllowEntry = ShouldAllowEntry; Changed = true end -- Set if allow entry state changed.
		if ShouldAllowEntry then Spec.Timed = false; Spec.Name = Seat.Name == "Seat" and Localization:FormatByKey("Action.EnterDriver") or Localization:FormatByKey("Action.EnterPassenger") end
		if Spec.ShouldAllowEntry then
			local PlayerValue = Seat:FindFirstChild("Player")
			if PlayerValue and PlayerValue.Value then Enabled = false end -- Disable if seat is occupied.
		end
		Spec.Dist = Distance -- Apply interaction distance.
	end
	if Enabled ~= Spec.Enabled then Spec.Enabled = Enabled end -- Apply final enabled state.
end
-- Dynamically updates the context for interacting with other players (arrest, pickpocket, trade).
local function UpdatePlayer(Spec) -- `Spec`: The `CircleAction` specification for a player.
	local ShouldArrest = nil -- Flag for arrest option.
	local ShouldPickpocket = nil -- Flag for pickpocket option.
	local ShouldBreakout = nil -- Flag for breakout option.
	local ShouldTrade = nil -- Flag for trade option.
	local ItemStack = ItemSystem.GetLocalEquipped() -- Currently equipped item.
	-- Check for trade eligibility.
	if RunUtils.isTradingEnabled() then
		local Player = Players:FindFirstChild(Spec.PlayerName)
		if Player and Player ~= LocalPlayer and TradeUtils.getPlayerTradeRequestsEnabled(Player) and TradeUtils.getPlayerTradeRequestsEnabled(LocalPlayer) and not TradeService.checkAlreadyInitiated(LocalPlayer, Player) and Player.Character and Player.Character:FindFirstChild("Humanoid") then
			ShouldTrade = true
		end
	end
	-- Check for arrest eligibility (if holding handcuffs and target is prisoner).
	if ItemStack and ItemStack.__ClassName == "Handcuffs" then
		if Team.Value == Settings.Team.Police then
			local Player = Players:FindFirstChild(Spec.PlayerName)
			if Player and (Player.TeamValue.Value == Settings.Team.Prisoner and (Player.Character and not Player.Character:GetAttribute("HasHandcuffs"))) then
				local Humanoid = Player.Character:FindFirstChild("Humanoid")
				if Humanoid and not (Humanoid.Sit or Humanoid.PlatformStand) then ShouldArrest = true end
			end
		end
		-- Check for pickpocket/breakout eligibility (if criminal).
	elseif Team.Value == Settings.Team.Prisoner then
		local Player = Players:FindFirstChild(Spec.PlayerName)
		if Player then
			if Player.TeamValue.Value == Settings.Team.Police then -- Pickpocket police.
				if Player.Character and LocalPlayer.Character then
					local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
					local HumanoidRootPart = LocalPlayer.Character.PrimaryPart
					local TargetRootPart = Player.Character.PrimaryPart
					if HumanoidRootPart and (TargetRootPart and (Humanoid and not (Humanoid.Sit or Humanoid.PlatformStand))) then
						-- Requires being behind the police officer.
						if HumanoidRootPart.CFrame.lookVector:Dot(TargetRootPart.CFrame.lookVector) < 1/3 then
							if TargetRootPart.CFrame.lookVector:Dot((TargetRootPart.CFrame.p - HumanoidRootPart.CFrame.p).unit) < 1/3 then
								ShouldPickpocket = true
							end
						end
					end
				end
			elseif Player.TeamValue.Value == Settings.Team.Prisoner and (Player.Character and LocalPlayer.Character) then -- Breakout other prisoners.
				if Player.Character:GetAttribute("HasHandcuffs") and not LocalPlayer.Character:GetAttribute("HasHandcuffs") then ShouldBreakout = true end
			end
		end
	end
	-- Update the interaction circle properties based on the determined action.
	local Changed -- Flag to indicate if any action state changed.
	if ShouldArrest ~= Spec.ShouldArrest then Spec.ShouldArrest = ShouldArrest; Changed = true else Changed = false end
	if ShouldPickpocket ~= Spec.ShouldPickpocket then Spec.ShouldPickpocket = ShouldPickpocket; Changed = true end
	if ShouldBreakout ~= Spec.ShouldBreakout then Spec.ShouldBreakout = ShouldBreakout; Changed = true end
	if ShouldTrade ~= Spec.ShouldTrade then Spec.ShouldTrade = ShouldTrade; Changed = true end
	if Changed then -- If state changed, update properties.
		if ShouldBreakout then Spec.Duration = 2; Spec.Timed = true; Spec.Dist = 10; Spec.Name = Localization:FormatByKey("Action.Breakout")
		elseif ShouldPickpocket then Spec.Duration = 2; Spec.Timed = true; Spec.Dist = 10; Spec.Name = Localization:FormatByKey("Action.Pickpocket")
		elseif ShouldArrest then Spec.Duration = 0.5; Spec.Timed = true; Spec.Dist = HandcuffsConfig.ArrestDistance; Spec.Name = Localization:FormatByKey("Action.Arrest")
		elseif ShouldTrade then Spec.Timed = false; Spec.Dist = 10; Spec.Name = Localization:FormatByKey("Action.Trade") end
	end
	local Enabled = ShouldArrest or ShouldPickpocket or ShouldBreakout or ShouldTrade -- Enable if any action is possible.
	if Enabled ~= Spec.Enabled then Spec.Enabled = Enabled end -- Update enabled state.
end
-- The main update loop for all interaction circles.
local function UpdateCircleActions()
	debug.profilebegin("UpdateCircleActions (game)")
	local Character = LocalPlayer.Character
	if Character then
		local HumanoidRootPart = Character.PrimaryPart
		if HumanoidRootPart then
			local p = HumanoidRootPart.Position -- Player's current position.
			local t = os.clock() -- Current time.
			for _, Spec in ipairs(UI.CircleAction.Specs) do -- Iterates through all registered circle actions.
				local Part = Spec.Part
				local d = ((Spec.WorldPosition or (Part and Part.Position or v3b)) - p).Magnitude -- Distance to action part.
				-- Only update the context if the player is close enough, and enough time has passed since last check.
				if getUpdateRate(d, 16, 64) < t - (Spec._lastUpdateCheck or 0) then -- Update less frequently for farther objects.
					Spec._lastUpdateCheck = t
					if Spec.IsVehicle then UpdateVehicle(Spec)
					elseif Spec.IsPlayer then UpdatePlayer(Spec)
					elseif Spec.IsRob then -- For robbing actions.
						local RoadSpike8 = Team.Value == Settings.Team.Prisoner -- Only enable if player is criminal.
						if Spec.Enabled ~= RoadSpike8 then Spec.Enabled = RoadSpike8 end
					end
				end
			end
			debug.profileend()
		end
	else
		return
	end
end
-- A `Stepped` loop for updating distant vehicle visuals and IK for other players.
RunService.Stepped:Connect(function()
	debug.profilebegin("LQVehicle Stepped")
	local t = os.clock()
	local p = CurrentCamera.CFrame.p -- Camera position.
	if LocalPlayer.Character then
		for VehicleState in VehicleStateBinder:GetAllSet() do -- Iterates through all streamed-in vehicle states.
			local Packet = VehicleState.packet
			if Packet then
				local Player = Players:GetPlayerByUserId(VehicleState.obj:GetAttribute("VehicleStateUserId")) -- Get owner player.
				if Player ~= LocalPlayer then -- If not the local player's vehicle.
					local ShouldUpdate = false
					local Model = Packet.Model
					if Model then
						local BoundingBox = Model:FindFirstChild("BoundingBox")
						if BoundingBox then
							local d = (BoundingBox.Position - p).Magnitude -- Distance to vehicle.
							-- Update less frequently for farther objects (from 256 to 4096 studs).
							if getUpdateRate(d, 256, 4096) < t - (Packet._lastUpdateStepped or 0) then
								Packet._lastUpdateStepped = t
								ShouldUpdate = true
							end
						end
					end
					if ShouldUpdate then
						if Packet.Type == "Chassis" then UpdateChassisStepped(Packet)
						elseif Packet.Type == "Motorcycle" or Packet.Type == "DuneBuggy" then
							if not Packet.IKP then -- If IK packet not built for this player/vehicle.
								if not Player then return end
								local Character = Player.Character
								if not Character then return end
								local Humanoid = Character:FindFirstChild("Humanoid")
								if not Humanoid then return end
								if not Humanoid.RootPart then return end
								Packet.IKP = R15IKv2.BuildPacketArms(Character) -- Build IK packet.
							end
							Classes.Chassis2.UpdateStepped(Packet) -- Update motorcycle chassis.
						end
					end
				end
			end
		end
	end
	debug.profileend()
end)
-- A `Heartbeat` loop for updating distant vehicle visuals (less critical than `Stepped`).
RunService.Heartbeat:Connect(function(dt) -- `dt` is delta time.
	debug.profilebegin("LQVehicle Heartbeat")
	local t = os.clock()
	local p = CurrentCamera.CFrame.p -- Camera position.
	if LocalPlayer.Character then
		for VehicleState in VehicleStateBinder:GetAllSet() do
			local Packet = VehicleState.packet
			if Packet and Players:GetPlayerByUserId(VehicleState.obj:GetAttribute("VehicleStateUserId")) ~= LocalPlayer then -- If not local player's vehicle.
				local ShouldUpdate = false
				local Model = Packet.Model
				if Model then
					local BoundingBox = Model:FindFirstChild("BoundingBox")
					if BoundingBox then
						local d = (BoundingBox.Position - p).Magnitude -- Distance to vehicle.
						-- Update less frequently for farther objects (from 768 to 4096 studs).
						if getUpdateRate(d, 768, 4096) < t - (Packet._lastUpdateHeartbeat or 0) then
							Packet._lastUpdateHeartbeat = t
							ShouldUpdate = true
						end
					end
				end
				if ShouldUpdate then
					if Packet.Type == "Heli" then UpdateHeliLowQuality(Packet, dt)
					elseif Packet.Type == "Chassis" then UpdateChassisLowQuality(Packet, dt)
					elseif Packet.Type == "Motorcycle" or Packet.Type == "DuneBuggy" then Classes.Chassis2.UpdateLQ(Packet, dt) end
					UpdateAllLowQuality(Packet, dt) -- Apply general LQ updates.
				end
			end
		end
	end
	debug.profileend()
end)

--// MAIN GAME LOOP //--
-- This `Heartbeat` loop handles core game logic that runs every physics frame, including team updates and UI elements.
do
	local LastHours = 0 -- Cached last displayed hour for the in-game clock.
	local LastSeconds = 0 -- Cached last displayed second (in 15-second increments) for the in-game clock.
	RunService.Heartbeat:Connect(function(dt) -- Connects to `RunService.Heartbeat`. The `dt` parameter is delta time, which is not directly used in this function's body.
		-- Calls the main update function for interaction circles (e.g., "Hold E to interact" prompts).
		UpdateCircleActions()
		local Team = Team.Value -- Retrieves the current raw team name (string) from `LocalPlayer.TeamValue`.
		local EnumTeam -- A variable to store the normalized team enum (e.g., Prisoner, Criminal, Police).
		if Team == Settings.Team.Prisoner then -- If the raw team is "Prisoner".
			if PlayerStuff.HasEscaped then -- Checks if the player has the "HasEscaped" attribute set to true.
				EnumTeam = Settings.EnumTeam.Criminal -- If escaped, their effective team is "Criminal".
			else
				EnumTeam = Settings.EnumTeam.Prisoner -- Otherwise, they remain "Prisoner".
			end
		elseif Team == Settings.Team.Police then -- If the raw team is "Police".
			EnumTeam = Settings.EnumTeam.Police -- Their effective team is "Police".
		end
		-- Updates the global `GameUtil.Team` state if the effective team has changed since the last frame.
		-- This typically triggers UI updates or other team-specific client-side logic.
		if GameUtil.Team ~= EnumTeam then
			GameUtil.Team = EnumTeam -- Updates the cached global team.
			GameUtil.OnTeamChanged:Fire(EnumTeam) -- Fires a signal to notify other modules about the team change.
		end
		WalkSpeedFun() -- Calls the function responsible for dynamically calculating and setting the player's walk speed.
		debug.profilebegin("Time/UI") -- Starts a profiling session for the time and UI update block.
		-- Updates the in-game clock displayed on the sidebar UI.
		local Time = workspace:FindFirstChild("Time") -- Retrieves the `Time` `NumberValue` object from the `workspace`. This value is typically server-synced.
		if Time then
			Time = Time.Value -- Gets the raw time value (e.g., 14.5 for 2:30 PM, 0.0 for 12:00 AM).
			local PM = Time >= 12 -- Determines if the time is PM (12:00 PM or later).
			local Seconds = Time % 1 -- Extracts the fractional part of the time value, representing seconds (e.g., 0.5 from 14.5).
			local Hours = Time - Seconds -- Extracts the integer part of the time value, representing hours (e.g., 14 from 14.5).
			Seconds = floor(Seconds * 60 + 0.5) -- Converts the fractional part to minutes, then rounds to the nearest minute.
			Seconds = floor(Seconds / 15) * 15 -- Quantizes the seconds/minutes to 15-minute intervals (0, 15, 30, 45).
			if Seconds >= 60 then -- Handles overflow if quantization results in 60 seconds.
				Seconds = Seconds - 60 -- Resets seconds to 0.
				Hours = Hours + 1 -- Increments hours.
			end
			if Hours > 12 then -- Converts hours from 24-hour format to 12-hour format if necessary.
				Hours = Hours - 12
			end
			if Hours == 0 then -- Converts 0 o'clock (midnight) to 12 o'clock in 12-hour format.
				Hours = 12
			end
			-- Updates the UI only if the calculated hours or seconds have changed since the last update.
			if Hours ~= LastHours or Seconds ~= LastSeconds then
				LastHours = Hours -- Caches the new hour.
				LastSeconds = Seconds -- Caches the new second.
				SidebarUI.SetTime(("%d:%02d %s"):format(Hours, Seconds, PM and "PM" or "AM")) -- Formats and sets the time string (e.g., "2:30 PM").
			end
		end
		debug.profileend() -- Ends the profiling session for the time/UI update block.
	end)
end

--// INPUT HANDLERS //--
-- These functions route player input events (`InputChanged`, `InputBegan`, `InputEnded`)
-- to the appropriate client-side system (e.g., vehicle controls, player actions).
local function InputChanged(i) -- `i`: The `UserInputObject` representing the input change.
	if mVehiclePacket then -- If the local player is currently in a vehicle.
		-- Routes the input to the specific vehicle type's `InputChanged` handler.
		if mVehiclePacket.Type == "Chassis" then
			Classes.Chassis.InputChanged(i, nil) -- `nil` is likely for a `gameProcessedEvent` boolean, which is not directly used here.
		elseif mVehiclePacket.Type == "Heli" then
			Classes.Heli.InputChanged(i, nil)
		elseif mVehiclePacket.Type == "Custom" and mVehiclePacket.Make == "Volt" then
			Classes.Volt.InputChanged(i, nil)
		end
	end
	if i.UserInputType == Enum.UserInputType.MouseMovement then -- If it's mouse movement input.
		v3b = i.Position -- Updates `v3b` (the zero vector, likely a typo or leftover for mouse position tracking).
	end
end
local function InputBegan(i, a) -- `i`: The `UserInputObject` for input start, `a`: `gameProcessedEvent` boolean (true if Roblox processed it).
	-- This `if` condition structure is somewhat complex, checking for `gameProcessedEvent` and specific gamepad/keyboard keys.
	-- It generally allows input to be processed if Roblox has NOT processed it (`not a`) OR if it's a specific gamepad/arrow key.
	if not a or i.UserInputType == Enum.UserInputType.Gamepad1 and i.KeyCode == Enum.KeyCode.ButtonA or (i.KeyCode == Enum.KeyCode.Left or i.KeyCode == Enum.KeyCode.Right) then
		if mVehiclePacket then -- If the local player is in a vehicle.
			-- Routes the input to the specific vehicle type's `InputBegan` handler.
			if mVehiclePacket.Type == "Chassis" then
				Classes.Chassis.InputBegan(i)
			elseif mVehiclePacket.Type == "Heli" then
				Classes.Heli.InputBegan(i)
			elseif mVehiclePacket.Type == "Custom" and mVehiclePacket.Make == "Volt" then
				Classes.Volt.InputBegan(i)
			end
		end
		-- "E" is a universal exit key for vehicles (except helicopters).
		if i.UserInputType == Enum.UserInputType.Keyboard and (i.KeyCode == Enum.KeyCode.E and (mVehiclePacket and mVehiclePacket.Type ~= "Heli")) then
			OnJump() -- Calls `OnJump`, which handles exiting the vehicle or other states.
		end
	end
end
local function InputEnded(i, a) -- `i`: The `UserInputObject` for input end, `a`: `gameProcessedEvent` boolean.
	-- Similar complex `if` condition structure as `InputBegan`.
	if not a or i.UserInputType == Enum.UserInputType.Gamepad1 and i.KeyCode == Enum.KeyCode.ButtonA or (i.KeyCode == Enum.KeyCode.Left or i.KeyCode == Enum.KeyCode.Right) then
		if mVehiclePacket then -- If the local player is in a vehicle.
			-- Routes the input to the specific vehicle type's `InputEnded` handler.
			if mVehiclePacket.Type == "Chassis" then
				Classes.Chassis.InputEnded(i)
				return -- Exits after handling chassis input.
			end
			if mVehiclePacket.Type == "Heli" then
				Classes.Heli.InputEnded(i)
				return
			end
			if mVehiclePacket.Type == "Custom" and mVehiclePacket.Make == "Volt" then
				Classes.Volt.InputEnded(i)
			end
		end
	end
end
UserInputService.InputBegan:connect(InputBegan) -- Connects `InputBegan` to `UserInputService.InputBegan`.
UserInputService.InputEnded:connect(InputEnded) -- Connects `InputEnded` to `UserInputService.InputEnded`.
UserInputService.InputChanged:connect(InputChanged) -- Connects `InputChanged` to `UserInputService.InputChanged`.

--// CIRCLE ACTION BINDERS //--
-- These blocks use `CollectionService` to automatically add and manage interactive "circle actions" (e.g., "Press Y to enter")
-- to specific tagged objects in the game world, based on player proximity and state.
do
	-- Binder for Vehicle Seats (`"VehicleSeat"` tag).
	local CircleAction = UI.CircleAction -- Alias for the `UI.CircleAction` module.
	local function Action(Spec, a) -- `Spec`: the `CircleAction` specification, `a`: boolean indicating if input was processed (e.g., held long enough).
		if a then -- If the action input was processed (e.g., button held for duration).
			if Spec.ShouldHotwire then
				AttemptVehicleHotwire(Spec.Part.Parent) -- If it's a hotwire action, call `AttemptVehicleHotwire`.
			elseif Spec.ShouldEject then
				local Vehicle = Spec.Part.Parent
				-- Fires an obfuscated remote event to the server for ejecting a player from a vehicle.
				-- `c` + reversed (`pp3v2gbly` sub `3,7`) -> "v2gb" + "cw".
				-- The final obfuscated name is "cv2gbcw".
				Event:FireServer("c" .. ("pp3v2gbly"):sub(3, 7):reverse():reverse():reverse() .. "cw", Vehicle)
			else
				AttemptVehicleEnter(Spec.Part) -- Otherwise, attempt to enter the vehicle.
			end
			return true -- Returns true to indicate the input was handled.
		end
		-- If input was NOT processed (e.g., not held long enough for timed action) but it was a hotwire action.
		if Spec.ShouldHotwire then
			em.ht9y5ngc({ -- Displays a notification message.
				Title = "Vehicle",
				Text = "You can\'t drive this. Hold to hijack it."
			})
		end
	end
	local function AddedFun(Part) -- Callback for when a part tagged "VehicleSeat" is added/streams in.
		local Spec = { -- Defines the `CircleAction` specification for vehicle seats.
			Part = Part, -- The `VehicleSeat` part itself.
			ValidRoot = Part.Parent, -- The parent model of the seat (the vehicle).
			Name = "Enter", -- Default display name.
			Timed = false, -- Default to not timed (for simple entry).
			Duration = 1, -- Default duration (if it becomes timed).
			Dist = 10, -- Maximum interaction distance.
			Callback = Action, -- The action callback function.
			IsVehicle = true -- Flag indicating this is a vehicle interaction.
		}
		CircleAction.Add(Spec, Part) -- Adds the `CircleAction` to the UI system.
	end
	local function RemovedFun(Part) -- Callback for when a part tagged "VehicleSeat" is removed/streams out.
		CircleAction.Remove(Part) -- Removes the `CircleAction` from the UI system.
	end
	for _, Part in next, CollectionService:GetTagged("VehicleSeat") do AddedFun(Part) end -- Applies `AddedFun` to any existing "VehicleSeat" parts when the script starts.
	CollectionService:GetInstanceAddedSignal("VehicleSeat"):Connect(AddedFun) -- Connects `AddedFun` to the signal for new "VehicleSeat" parts appearing.
	CollectionService:GetInstanceRemovedSignal("VehicleSeat"):Connect(RemovedFun) -- Connects `RemovedFun` to the signal for "VehicleSeat" parts being removed.
end
do
	-- Binder for Players (`Character` instances). Handles interactions like arrest, pickpocket, breakout, trade.
	local CircleAction = UI.CircleAction
	local function UseHandcuffs(Spec) -- Attempts to use handcuffs on a player.
		local ItemStack = ItemSystem.GetLocalEquipped() -- Gets the locally equipped item.
		if not ItemStack then return end
		if ItemStack.__ClassName ~= "Handcuffs" then return end -- Only proceed if handcuffs are equipped.
		if ItemStack.Reloading then return end -- Cannot use if reloading.
		if Team.Value ~= Settings.Team.Police then return end -- Only police can use handcuffs.
		local Player = Players:FindFirstChild(Spec.PlayerName) -- The target player.
		if not Player then return end
		local Team = Player.TeamValue.Value
		if mVehiclePacket then return end -- Cannot handcuff if in a vehicle.
		if Team ~= Settings.Team.Prisoner then return end -- Only handcuff prisoners.
		local Character = LocalPlayer.Character
		if not Character then return end
		local Humanoid = Character:FindFirstChild("Humanoid")
		if not Humanoid then return end
		if Humanoid.Health <= 0 then return end
		AttemptArrest(Player) -- Calls `AttemptArrest`.
		return true
	end
	local function UsePickpocket(Spec) -- Attempts to pickpocket a player.
		local Player = Players:FindFirstChild(Spec.PlayerName)
		if not Player then return end
		AttemptPickpocket(Player) -- Calls `AttemptPickpocket`.
		return true
	end
	local function UseBreakout(Spec) -- Attempts to break out a player.
		local Player = Players:FindFirstChild(Spec.PlayerName)
		if not Player then return end
		AttemptBreakout(Player) -- Calls `AttemptBreakout`.
		return true
	end
	local function UseTrade(Spec) -- Attempts to trade with a player.
		local Player = Players:FindFirstChild(Spec.PlayerName)
		if not Player then return end
		AttemptTrade(Player) -- Calls `AttemptTrade`.
		return true
	end
	local function Action(Spec, a) -- Main action callback for player interactions.
		if not a then return true end -- If input not processed (e.g., not held long enough), return true to consume it.
		local Action -- Variable to store the result of specific action attempts.
		if Spec.ShouldArrest then Action = UseHandcuffs(Spec) -- If arrest is possible, attempt it.
		elseif Spec.ShouldPickpocket then Action = UsePickpocket(Spec) -- If pickpocket is possible, attempt it.
		elseif Spec.ShouldBreakout then Action = UseBreakout(Spec) end -- If breakout is possible, attempt it.
		-- If trade is possible and either no other action was taken OR it's a trade world, attempt trade.
		if Spec.ShouldTrade and (RunUtils.isTradeWorld() or not Action) then Action = UseTrade(Spec) end
		return Action -- Returns true if any action was successfully initiated.
	end
	local function AddedFun(Character) -- Callback for when a player's `Character` model is added/streams in.
		if Character ~= LocalPlayer.Character then -- Only apply to other players' characters.
			local Spec = { -- Defines the `CircleAction` specification for player interactions.
				Part = Character:WaitForChild("UpperTorso", 3), -- The part to attach the action to (UpperTorso).
				ValidRoot = Character, -- The character model itself.
				Name = "Player", -- Default display name.
				Timed = true, -- Default to timed action.
				Duration = 0.5, -- Default duration.
				Dist = 15, -- Default interaction distance.
				Priority = 2, -- Priority for displaying multiple actions.
				Callback = Action, -- Action callback.
				PlayerName = Character.Name, -- Name of the player.
				IsPlayer = true -- Flag indicating player interaction.
			}
			CircleAction.Add(Spec, Character) -- Adds the `CircleAction`.
		end
	end
	local function RemovedFun(Character) -- Callback for when a player's `Character` model is removed/streams out.
		if Character.obj ~= LocalPlayer.Character then -- Ensure it's not the local player's own character.
			CircleAction.Remove(Character.obj) -- Removes the `CircleAction`.
		end
	end
	local function onCharacterAdded(Character) -- Wrapper for `AddedFun` for `CharacterBinder`'s signal.
		AddedFun(Character.obj) -- Call `AddedFun` with the actual character model.
		Character.maid:GiveTask(function() RemovedFun(Character) end) -- Add cleanup task using the character's maid.
	end
	for _, Character in CharacterBinder:GetAll() do onCharacterAdded(Character) end -- Apply to existing characters.
	CharacterBinder:GetClassAddedSignal():Connect(onCharacterAdded) -- Connect for new characters.
end
do
	-- Binder for Small Stores (`"SmallStore"` tag) (robbing action).
	local CircleAction = UI.CircleAction
	local function Action(Spec, a) -- `Spec`: `CircleAction` spec, `a`: processed input boolean.
		local Item = Spec.Part.Parent -- For robbing, the item is likely the store part.
		if a then -- If input processed.
			-- Fires an obfuscated remote event to the server to start robbing.
			-- `u` + reversed (`faxqg` sub `2,3`) -> "xq" + reversed (`ifo` sub `2,2`) -> "f" + reversed (`kpsou` sub `2,2`) -> "p" + reversed (`i5mg4necn` sub `4,5`) -> "g4" + "m".
			-- The final obfuscated name is "uxqfpg4m".
			Event:FireServer("u" .. ("faxqg"):sub(2, 3):reverse():reverse():reverse() .. ("ifo"):sub(2, 2):reverse():reverse():reverse() .. ("kpsou"):sub(2, 2):reverse() .. ("i5mg4necn"):sub(4, 5):reverse() .. "m", Spec.Part)
		else -- If input not processed (e.g., released early).
			-- Fires an obfuscated remote event to the server to stop robbing.
			-- `w` + reversed (`odvbpogk` sub `4,5`) -> "pb" + reversed (`fu9ivqynuvc4` sub `5,8`) -> "vqy" + "1".
			-- The final obfuscated name is "wpbqvyn1".
			Event:FireServer("w" .. ("odvbpogk"):sub(4, 5):reverse() .. ("fu9ivqynuvc4"):sub(5, 8):reverse():reverse():reverse() .. "1", Spec.Part)
		end
		return true -- Consumes input.
	end
	local function AddedFun(Part) -- Callback for when a "SmallStore" part is added.
		local Taser4 = { -- Named "Taser4" but this is a robbing action spec.
			Part = Part,
			Name = "Rob",
			Timed = true,
			Duration = 10,
			Dist = 8,
			Callback = Action,
			IsRob = true -- Flag indicating robbing action.
		}
		CircleAction.Add(Taser4, Part)
	end
	local function RemovedFun(Part) CircleAction.Remove(Part) end -- Callback for when removed.
	for _, Part in next, CollectionService:GetTagged("SmallStore") do AddedFun(Part) end
	CollectionService:GetInstanceAddedSignal("SmallStore"):Connect(AddedFun)
	CollectionService:GetInstanceRemovedSignal("SmallStore"):Connect(RemovedFun)
end
do
	-- Binder for Dropped Items (`ItemDropConsts.DROPPED_ITEM_TAG`).
	local CircleAction = UI.CircleAction
	local function Action(Spec, a) -- `Spec`: `CircleAction` spec, `a`: processed input boolean.
		local Item = Spec.Part.Parent -- The dropped item's model.
		if a then -- If input processed.
			-- Fires an obfuscated remote event to the server to pick up item.
			-- `w` + reversed (`kgdnd0` sub `3,4`) -> "nd" + reversed (`kvnvat83` sub `5,5`) -> "v" + reversed (`qhtrle` sub `3,5`) -> "trl" + "6".
			-- The final obfuscated name is "wndvtrl6".
			Event:FireServer("w" .. ("kgdnd0"):sub(3, 4):reverse() .. ("kvnvat83"):sub(5, 5):reverse():reverse():reverse() .. ("qhtrle"):sub(3, 5):reverse() .. "6", Item)
			return true
		end
	end
	local ItemDropConsts = require(ReplicatedStorage.Game.ItemSystem.ItemDropConsts) -- Constants for dropped items.
	local function AddedFun(Part) -- Callback for when a dropped item part is added.
		local ValidRoot = Part.Parent -- The dropped item model.
		local Spec = {
			Part = Part,
			ValidRoot = ValidRoot,
			Name = Localization:FormatByKey("Action.PickupItem", { ValidRoot.Name }), -- Localized "Pick up [Item Name]".
			Timed = true,
			Duration = 0.5,
			Dist = 5,
			Callback = Action
		}
		CircleAction.Add(Spec, Part)
	end
	local function RemovedFun(Part) CircleAction.Remove(Part) end -- Callback for when removed.
	for _, Part in next, CollectionService:GetTagged(ItemDropConsts.DROPPED_ITEM_TAG) do AddedFun(Part) end
	CollectionService:GetInstanceAddedSignal(ItemDropConsts.DROPPED_ITEM_TAG):Connect(AddedFun)
	CollectionService:GetInstanceRemovedSignal(ItemDropConsts.DROPPED_ITEM_TAG):Connect(RemovedFun)
end

--// MISCELLANEOUS & FINAL SETUP //--
local t4 = tick() -- Debounce timer for jump input.
local function onJumpDebounce() -- Debounced jump handler.
	local t = tick()
	if t - t4 < 0.1 then return false end -- 0.1s debounce.
	t4 = t
	OnJump() -- Calls the main `OnJump` handler.
end
require(ReplicatedStorage.Game.DefaultActions).onJumpPressed:Connect(onJumpDebounce) -- Connects to DefaultActions' jump signal.
-- Force ragdoll on death.
local function CharacterDied() Falling.StartRagdolling(10) end -- Starts ragdolling for 10 seconds.
local function CharacterAdded(Character)
	local Humanoid = Character:WaitForChild("Humanoid")
	local e do -- Scoped variable `e` for connection.
		e = Humanoid.Died:Connect(function() -- Connects to `Humanoid.Died`.
			e:Disconnect() -- Disconnects connection after death.
			CharacterDied()
		end)
	end
end
LocalPlayer.CharacterAdded:Connect(CharacterAdded) -- Connects for new characters.
-- Hooks up the core GUI reset button to a remote event to tell the server the player wants to reset.
do
	local ResetBindable = Instance.new("BindableEvent") -- Creates a `BindableEvent`.
	ResetBindable.Event:connect(function() -- Connects to its event.
		-- Fires an obfuscated remote event to the server to request a reset.
		-- `e` + reversed (`sup0hx` sub `4,4`) -> "0" + reversed (`t0upfv` sub `2,5`) -> "pvut" + "4b".
		-- The final obfuscated name is "e0pvut4b".
		Event:FireServer("e" .. ("sup0hx"):sub(4, 4):reverse():reverse():reverse() .. ("t0upfv"):sub(2, 5):reverse():reverse():reverse():reverse():reverse() .. "4b")
	end)
	delay(2, function() -- Delays connection to `SetCore` for 2 seconds.
		local s, m = pcall(function() StarterGui:SetCore("ResetButtonCallback", ResetBindable) end) -- Safely attempts to set reset button callback.
		if not s then print("MANUAL RESET ERROR"); print(m) end -- Log error if fails.
	end)
end
-- An invisible, non-archivable part with a `while true do` loop in its property changed signal.
-- This is a very old and aggressive anti-exploit technique designed to lag or crash exploit injectors that try to inspect workspace properties.
local TrapPart = Instance.new("Part")
TrapPart.Anchored = true
TrapPart.Transparency = 1
TrapPart.CanCollide = false
TrapPart.Size = Vector3.new(1, 1, 1)
TrapPart.Archivable = false -- Crucial: makes it not save or replicate by default.
TrapPart.Parent = workspace
TrapPart:GetPropertyChangedSignal("Archivable"):connect(function() -- Connects to its `Archivable` property changed signal.
	while true do end -- Infinite loop, designed to crash/freeze exploiters who inspect this part's properties.
end)
-- A small, fun easter egg for a specific developer/youtuber (KreekCraft).
delay(10, function()
	local KreeksTimeMachine = workspace:FindFirstChild("KreeksTimeMachine")
	if KreeksTimeMachine and LocalPlayer.UserId == 140258990 then -- Checks for KreekCraft's UserID.
		KreeksTimeMachine:Destroy() -- Destroys the time machine if it exists.
	end
end)

--// CLIENT-SIDE ANTI-CHEAT //--
-- This section contains various checks designed to detect common exploits on the client.
local Cheat = false -- Global flag: true if a cheat has been detected.
local StateConnection = nil -- Stores the `Humanoid.StateChanged` connection for noclip detection.
local TimeAccumulator = 0 -- Accumulates time spent in suspicious states (e.g., noclip).
local FrequencyAccumulator = 0 -- Accumulates frequency of suspicious events (e.g., rapid respawns).
local Died = false -- Flag to track if the character is currently dead.
do
	local function CharacterAdded(Character) -- Callback for when a character is added.
		local Humanoid = Character:WaitForChild("Humanoid", 1)
		if Humanoid then
			if Character:WaitForChild("HumanoidRootPart", 1) then
				Died = false -- Reset dead flag.
				FrequencyAccumulator = m.TimeAccumAdd(FrequencyAccumulator, 2) -- Add to frequency accumulator (less suspicious).
				if StateConnection then StateConnection:Disconnect(); StateConnection = nil end -- Disconnect old state connection.
				-- Watches for `HumanoidStateType.StrafingNoPhysics`, a state often used by noclip exploits.
				StateConnection = Humanoid.StateChanged:Connect(function(_, v) -- `_` is old state, `v` is new state.
					if v == Enum.HumanoidStateType.StrafingNoPhysics then
						TimeAccumulator = m.TimeAccumAdd(TimeAccumulator, 1) -- Accumulate time in this state.
						-- If the player spends too much time (over 10 units) in this state, flag as cheat.
						if m.TimeAccumDiff(TimeAccumulator) > 10 then
							TimeAccumulator = 0
							if Cheat then return end
							Cheat = true
							-- Fires an obfuscated remote event to the server, reporting the cheat.
							-- `h` + reversed (`gmzx` sub `3,3`) -> "m" + reversed (`dgaf2n` sub `3,3`) -> "a" + reversed (`swuoxi52p` sub `4,5`) -> "xo" + reversed (`j06tlnv8` sub `3,4`) -> "tl" + "f".
							-- The final obfuscated name is "hmtaxtlf".
							EventFireServer("h" .. ("gmzx"):sub(3, 3):reverse():reverse():reverse() .. ("dgaf2n"):sub(3, 3):reverse() .. ("swuoxi52p"):sub(4, 5):reverse() .. ("j06tlnv8"):sub(3, 4):reverse() .. "f", "NoClip StrafingNoPhysics", false)
						end
					end
				end)
			end
		else
			return
		end
	end
	if LocalPlayer.Character then CharacterAdded(LocalPlayer.Character) end -- Call initially if character exists.
	LocalPlayer.CharacterAdded:Connect(CharacterAdded) -- Connect for new characters.
	spawn(function()
		local s, m = pcall(function()
			-- Detect if any illicit tools are added to the player's backpack.
			LocalPlayer:WaitForChild("Backpack", 20).ChildAdded:Connect(function(v)
				if v:IsA("BackpackItem") then -- If a `BackpackItem` is added.
					if Cheat then return end
					Cheat = true
					-- Fires an obfuscated remote event to the server.
					-- `h` + reversed (`fxazpy` sub `2,4`) -> "xap" + "ot6f".
					-- The final obfuscated name is "hxapot6f".
					EventFireServer("h" .. ("fxazpy"):sub(2, 4):reverse() .. "ot6f", "BackpackTool", false)
				end
			end)
		end)
		if not s then warn("BACKPACK FAIL", m) end -- Log error if pcall fails.
	end)
	local _ = Instance.new("Model").FindFirstChildWhichIsA -- Unused alias, possibly a decompilation artifact.
	local mxpcall = xpcall -- Cache `xpcall` for integrity check.
	local FoundCheats = {} -- Table to track various cheat indicators.
	-- The main cheat detection function, run periodically.
	local function CheatCheck()
		if Cheat then return -- If already flagged, do nothing.
		else
			local Character = LocalPlayer.Character
			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")
				if Humanoid then
					if Humanoid.Health <= 0.001 then -- If player is essentially dead.
						if not Died then FrequencyAccumulator = m.TimeAccumAdd(FrequencyAccumulator, 3) end -- Add to frequency accumulator.
						Died = true
					else
						local Found, Reason -- `Found`: boolean, `Reason`: string if cheat found.
						-- Check for abnormal `JumpPower`.
						if Humanoid.JumpPower > 60 then Found = true; Reason = "JumpPower"
						else Found = false; Reason = nil end
						-- Check for illicitly added GUI elements (e.g., "Inf Nitro" scripts).
						local Nitrous = {
							{ "MainNitro", PlayerGui:FindFirstChild("Nitro"), "Inf Nitro" },
							{ "ProductNitro", ProductGui:FindFirstChild("Nitro"), "Inf Nitro" }
						}
						for _, v in next, Nitrous do
							local Name = v[1]; local Item = v[2]; local mReason = v[3]
							if Item then FoundCheats[Name] = true -- If item exists, mark as found.
							elseif FoundCheats[Name] then Reason = mReason; Found = true end -- If previously found, flag as cheat.
						end
						-- Check if core services have been renamed (a common exploit tactic).
						for _, v in next, { "Workspace", "Players", "ReplicatedStorage" } do
							if game:GetService(v).Name == v then -- If service name matches original.
								if FoundCheats[v] then Found = true; Reason = "Renamed Service" end
							else FoundCheats[v] = true end -- If renamed, mark as found.
						end
						-- Check if `game.GetObjects` exists, which is a deprecated and exploitable function.
						local GetObjectsExists, _ = pcall(function() local _ = game.GetObjects end)
						if not RunService:IsStudio() and GetObjectsExists then Found = true; Reason = "game.GetObjects" end
						-- Check for known global variables set by exploits.
						if _G.antiarrest ~= nil then Found = true; Reason = "_G.antiarrest" end
						-- Check if the `xpcall` function has been tampered with.
						if xpcall ~= mxpcall then Found = true; Reason = "Xpcall pointer changed" end
						-- A check for visibility exploits that tamper with metatables/indexing.
						local VisDetectFailed = false
						xpcall(function() return game[{}] end, function() VisDetectFailed = true end)
						if not VisDetectFailed then Found = true; Reason = "VisDetect" end
						-- Check if `debug.getupvalues` exists, which is a powerful debugging tool often used by exploiters.
						if debug.getupvalues then Found = true; Reason = "Getupvalues" end
						if Found then -- If any cheat is detected.
							Cheat = true
							-- Fires an obfuscated remote event to the server.
							-- `h` + reversed (`n9fizd86` sub `5,5`) -> "z" + reversed (`ga8zoxak` sub `5,7`) -> "xoa" + reversed (`eRifletvxyo` sub `4,5`) -> "fel" + "f".
							-- The final obfuscated name is "hzxoafelf".
							EventFireServer("h" .. ("n9fizd86"):sub(5, 5):reverse() .. ("ga8zoxak"):sub(5, 7):reverse() .. ("eRifletvxyo"):sub(4, 5):reverse():reverse():reverse() .. "f", Reason, false)
						end
					end
				else return end
			else return end
		end
	end
	-- Runs the `CheatCheck` periodically in a protected call (`pcall`).
	ThreadLoopAdd(1, function() -- Runs every 1 second.
		local s, _ = pcall(CheatCheck)
		if not s then -- If `CheatCheck` itself errors.
			Cheat = true
			-- Fires an obfuscated remote event to the server.
			-- `h` + reversed (`mkd6ziek8` sub `5,5`) -> "z" + reversed (`e8v9oxaoe` sub `5,7`) -> "aoe" + reversed (`usutx` sub `4,4`) -> "t" + "6f".
			-- The final obfuscated name is "hzaoet6f".
			EventFireServer("h" .. ("mkd6ziek8"):sub(5, 5):reverse():reverse():reverse() .. ("e8v9oxaoe"):sub(5, 7):reverse():reverse():reverse() .. ("usutx"):sub(4, 4):reverse():reverse():reverse() .. "6f", "FailedPcall", false)
		end
	end)
end
-- Initializes the final game system, `ImportantLocationMarkerSystem`.
require(ReplicatedStorage.App.ImportantLocationMarkerSystem).init()