-- 🔥 TELETRANSPORTE LIBRE | By ChatGPT

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")

local distancia = 50 -- 📏 Distancia del teletransporte (puedes aumentar)

local cooldown = 2 -- ⏳ tiempo entre usos
local lista = false

local function Teleport()
    if lista then return end
    lista = true

    local character = player.Character
    local root = character:WaitForChild("HumanoidRootPart")

    -- Dirección donde mira el mouse o el personaje
    local direccion = (mouse.Hit.p - root.Position).Unit

    -- Nueva posición
    local nuevaPos = root.Position + direccion * distancia

    -- Teletransportar
    root.CFrame = CFrame.new(nuevaPos)

    print("⚡ Teletransporte realizado!")

    task.wait(cooldown)
    lista = false
end

-- Activación con tecla E
uis.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        Teleport()
    end
end)
