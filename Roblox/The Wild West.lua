local Luminosity = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()
local ESPLibrary = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua", true))()

local Window = Luminosity.new("BlankHack", "By Sora_Blanks", 4370345701)

local HttpService = game:GetService("HttpService")
OreDeposits = {}
for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits:GetChildren()) do
     if v.ClassName == "Folder" and v:FindFirstChildOfClass("Model") then
        table.insert(OreDeposits, v.Name)
    end
end

local Tab1 = Window.Tab("Visual", 3926307971)
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local PlayerEsp = Tab1.Folder("Player", "Возможно получить Бан")
PlayerEsp.Switch("Player Esp", function(State)
    ESP:Toggle(State)
end)
PlayerEsp.Switch("Boxes Esp", function(State)
    ESP.Boxes = State
end)
PlayerEsp.Switch("Name Esp", function(State)
    ESP.Name = State
end)
PlayerEsp.Switch("Tracers Esp", function(State)
    ESP.Tracers = State
end)

Tab1.Cheat("Ore Esp", "Руда", function(State)
    getgenv().esp = State
    local function esp(v)
        local T = Drawing.new("Text")
        T.Visible = false
        T.Center = true
        T.Outline = true
        T.Font = 2
        T.Text = "Ore"
        T.Size = 14
        T.Color = Color3.fromRGB(203, 214, 73)
        local function update()
            local Re
            Re =
                game:GetService('RunService').Stepped:Connect(
                function()
                    if v and v:FindFirstChildOfClass("MeshPart") then wait()
                        local Vector, Screen = workspace.CurrentCamera:WorldToViewportPoint(v:FindFirstChildOfClass("MeshPart").Position)
                        if getgenv().esp and Screen then
                            T.Position = Vector2.new(Vector.X, Vector.Y)
                            T.Visible = true
                            T.Text = v:FindFirstChildOfClass("MeshPart").Name
                        else
                            T.Visible = false
                        end
                    elseif v:FindFirstChildOfClass("MeshPart") == nil then
                        T:Remove()
                        Re:disconnect()
                    end
                end
            )
        end
        update()
    end
    for i, v in pairs(game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits:GetChildren()) do
        if table.find(OreDeposits, v.Name) then
            for i, v in pairs(v:GetChildren()) do
                if v:FindFirstChildOfClass("MeshPart").Name:match("Ore") then
                    esp(v)
                end
            end
        end
    end
end)

local AnimalEsp = Tab1.Folder("Animal", "Животные")
AnimalEsp.Switch("Animal Esp", function(State)
    getgenv().esp3 = State
    local function esp(v)
        local T = Drawing.new("Text")
        T.Visible = false
        T.Center = true
        T.Outline = true
        T.Font = 2
        T.Text = "Ore"
        T.Size = 14
        T.Color = Color3.fromRGB(102, 0, 0)
        local function update()
            local Re
            Re =
                game:GetService("RunService").Stepped:Connect(
                function()
                    pcall(
                        function()
                            if v and v:FindFirstChildOfClass("MeshPart") then wait()
                                local Vector, Screen =workspace.CurrentCamera:WorldToViewportPoint(v:FindFirstChildOfClass("MeshPart").Position)
                                if getgenv().esp3 and Screen then
                                    T.Position = Vector2.new(Vector.X, Vector.Y)
                                    T.Visible = true
                                    T.Text = v:FindFirstChildOfClass("MeshPart").Name
                                else
                                    T.Visible = false
                                end
                            elseif v:FindFirstChildOfClass("MeshPart") == nil then
                                T:Remove()
                                Re:disconnect()
                            end
                        end
                    )
                end
            )
        end
        update()
    end
    for i, v in pairs(game.Workspace.WORKSPACE_Entities.Animals:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChildOfClass("MeshPart") and not v.Name:match("Horse") then
            esp(v)
        end
    end
    game.Workspace.WORKSPACE_Entities.Animals.ChildAdded:Connect(
        function(v)
            if v:IsA("Model") and not v.Name:match("Horse") then
                esp(v)
            end
        end
    )
end)
AnimalEsp.Switch("Legendary Animal Esp/Thunderstruck", function ()
    local function check()
        local objects = {}
        local exists = false
        local c = 0
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            local health = v:WaitForChild("Health")
            if health and health.Value > 200 then
                c = c + 1
                objects[c] = {"Legendary", v}
                exists = true
            end
        end
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Geometry"]:GetDescendants()) do
            if v:IsA("ParticleEmitter") and v.Name == "Strike2" then
                c = c + 1
                objects[c] = {"Thunderstruck", v, v.Parent.Parent}
                exists = true
            end
        end
        return exists, objects
    end
    local exists, objects = check()
    if exists then
        local Camera = workspace.CurrentCamera
        local Player = game:GetService("Players").LocalPlayer
        local RS = game:GetService("RunService")
        local RGB = Color3.fromRGB
        local V2 = Vector2.new
        local ROUND = math.round
        local ESP = {}
        function ESP:add(object, name, col)
            local NAME = Drawing.new("Text")
            NAME.Text = name
            NAME.Size = 16
            NAME.Color = col
            NAME.Center = true
            NAME.Visible = true
            NAME.Transparency = 1
            NAME.Position = V2(0, 0)
            NAME.Outline = true
            NAME.OutlineColor = RGB(10, 10, 10)
            NAME.Font = 3
            
            local DISTANCE = Drawing.new("Text")
            DISTANCE.Text = "[]"
            DISTANCE.Size = 14
            DISTANCE.Color = RGB(255, 255, 255)
            DISTANCE.Center = true
            DISTANCE.Visible = true
            DISTANCE.Transparency = 1
            DISTANCE.Position = V2(0, 0)
            DISTANCE.Outline = true
            DISTANCE.OutlineColor = RGB(10, 10, 10)
            DISTANCE.Font = 3

            local function Update()
                local c
                c = RS.RenderStepped:Connect(function()
                    if object.Parent ~= nil and object.Parent.Parent ~= nil and object.PrimaryPart ~= nil then
                        local p, vis = Camera:WorldToViewportPoint(object.PrimaryPart.Position)
                        if vis then
                            NAME.Position = V2(p.X, p.Y)
                            
                            if Player.Character ~= nil and Player.Character.PrimaryPart ~= nil then
                                DISTANCE.Position = NAME.Position + V2(0, NAME.TextBounds.Y/1.2)
                                DISTANCE.Text = "["..ROUND((Player.Character.PrimaryPart.Position - object.PrimaryPart.Position).magnitude).."m]"
                                DISTANCE.Visible = true
                            else
                                DISTANCE.Visible = false
                            end
                            
                            NAME.Visible = true
                        else
                            NAME.Visible = false
                            DISTANCE.Visible = false
                        end
                    else
                        NAME.Visible = false
                        DISTANCE.Visible = false
                        if object.Parent == nil or object.Parent.Parent == nil then
                            NAME:Remove()
                            DISTANCE:Remove()
                            c:Disconnect()
                        end
                    end
                end)
            end
            coroutine.wrap(Update)()
        end
        for i,v in pairs(objects) do
            if v[1] == "Legendary" then
                print("Found Legendary "..v[2].Name.." !\n")
                ESP:add(v[2], "Legendary "..v[2].Name)
            elseif v[1] == "Thunderstruck" then
                print("Found Thunderstruck "..v[2].Name.." !\n")
                ESP:add(v[2], "Thunderstruck "..v[2].Name)
            end
        end
    end
end)
-- Tab 2 --
local Tab2 = Window.Tab("Other", 9930002961)
local Cheat = Tab2.Folder("More", "Дополнительно")
Cheat.Button("Rejoin", "Перезайти", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) end)

-- Tab 3 --
local Tab2 = Window.Tab("Misc/Credits", 9929921922)
Tab2.Folder("About", "Добро пожаловать в чит BlankHack, этот чит будет продвигаться и дальше, надеюсь вы поддержите меня :3")
local Credits = Tab2.Folder("Credits", "Credits Sora_Blanks\nCredits Sora#2339")
Credits.Button("Discord Server", "Перейти", function ()
    OpenUrl("https://discord.gg/4pxMCj5epf")
end)

game:GetService("UserInputService").InputBegan:Connect(function(Input)
if Input.KeyCode == Enum.KeyCode.LeftAlt then
Window:Toggle()
end
end)
