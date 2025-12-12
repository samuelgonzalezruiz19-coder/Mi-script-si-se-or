# Mi-script-si-se-or
Script para roblox
-- LocalScript dentro de ScreenGui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")

local savedPosition = nil

-- Referencias a los botones
local gui = script.Parent
local guardarBtn = gui:WaitForChild("GuardarPosBtn")
local teleportBtn = gui:WaitForChild("TeleportBtn")

-- GUARDAR POSICIÓN
guardarBtn.MouseButton1Click:Connect(function()
	savedPosition = humanoidRoot.Position
	print("Posición guardada:", savedPosition)
end)

-- TELETRANSPORTAR
teleportBtn.MouseButton1Click:Connect(function()
	if savedPosition then
		humanoidRoot.CFrame = CFrame.new(savedPosition)
	else
		print("No has guardado posición todavía.")
	end
end)
