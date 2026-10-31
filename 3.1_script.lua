local P=game.Players.LocalPlayer;local C=P.Character or P.CharacterAdded:Wait();local H=C:WaitForChild("Humanoid")
P.CharacterAdded:Connect(function(nc)C=nc;H=nc:WaitForChild("Humanoid")end)
local G=Instance.new("ScreenGui",P:WaitForChild("PlayerGui"))G.ResetOnSpawn=false
local F=Instance.new("Frame",G)F.Size=UDim2.new(0,500,0,350)F.Position=UDim2.new(0.5,-250,0.5,-175)F.BackgroundColor3=Color3.fromRGB(30,30,30)F.Active=true;F.Draggable=true
local T=Instance.new("TextLabel",F)T.Size=UDim2.new(1,0,0,30)T.BackgroundColor3=Color3.fromRGB(20,20,20)T.Text=" Delta Custom Menu v5 "
T.TextColor3=Color3.fromRGB(255,255,255)T.TextSize=16;T.Font=Enum.Font.SourceSansBold
local S=Instance.new("Frame",F)S.Size=UDim2.new(0,120,1,-30)S.Position=UDim2.new(0,0,0,30)S.BackgroundColor3=Color3.fromRGB(25,25,25)
local M=Instance.new("ScrollingFrame",F)M.Size=UDim2.new(1,-120,1,-30)M.Position=UDim2.new(0,120,0,30)M.BackgroundTransparency=1;M.CanvasSize=UDim2.new(0,0,2.2,0)
local E=M:Clone()E.Parent=F;E.Visible=false
local L1,L2=Instance.new("UIListLayout",M),Instance.new("UIListLayout",E)L1.Padding,L2.Padding=UDim.new(0,6),UDim.new(0,6)
local function cB(t,p)local b=Instance.new("TextButton",p)b.Size=UDim2.new(1,-10,0,32)b.BackgroundColor3=Color3.fromRGB(50,50,50)b.TextColor3=Color3.fromRGB(255,255,255)b.Text=t;b.Font=Enum.Font.SourceSans;b.TextSize=14;return b end
local tM=cB("Легкие ф-ии",S)tM.Position=UDim2.new(0,5,0,10)tM.Size=UDim2.new(1,-10,0,35)tM.MouseButton1Click:Connect(function()M.Visible=true;E.Visible=false end)
local tE=cB("Тяжелые ф-ии",S)tE.Position=UDim2.new(0,5,0,50)tE.Size=UDim2.new(1,-10,0,35)tE.MouseButton1Click:Connect(function()M.Visible=false;E.Visible=true end)

local Tgl=Instance.new("TextButton",G)Tgl.Size=UDim2.new(0,50,0,50)Tgl.Position=UDim2.new(0,10,0,10)Tgl.BackgroundColor3=Color3.fromRGB(0,80,150)Tgl.TextColor3=Color3.fromRGB(255,255,255)Tgl.Text="Delta"Tgl.Font=Enum.Font.SourceSansBold;Tgl.TextSize=14;Tgl.Active=true;Tgl.Draggable=true
Instance.new("UICorner",Tgl).CornerRadius=UDim.new(1,0)Tgl.MouseButton1Click:Connect(function()F.Visible=not F.Visible end)

local UpB=Instance.new("TextButton",G)UpB.Size=UDim2.new(0,60,0,60)UpB.Position=UDim2.new(1,-80,0.5,-50)UpB.BackgroundColor3=Color3.fromRGB(0,80,0)UpB.TextColor3=Color3.fromRGB(255,255,255)UpB.Text="ВВЕРХ"UpB.Font=Enum.Font.SourceSansBold;UpB.Visible=false
Instance.new("UICorner",UpB).CornerRadius=UDim.new(0,10)
local DnB=Instance.new("TextButton",G)DnB.Size=UDim2.new(0,60,0,60)DnB.Position=UDim2.new(1,-80,0.5,20)DnB.BackgroundColor3=Color3.fromRGB(80,0,0)DnB.TextColor3=Color3.fromRGB(255,255,255)DnB.Text="ВНИЗ"DnB.Font=Enum.Font.SourceSansBold;DnB.Visible=false
Instance.new("UICorner",DnB).CornerRadius=UDim.new(0,10)
local up,dn=false,false
UpB.MouseButton1Down:Connect(function()up=true end)UpB.MouseButton1Up:Connect(function()up=false end)
DnB.MouseButton1Down:Connect(function()dn=true end)DnB.MouseButton1Up:Connect(function()dn=false end)

local fly,nc,spd,jmp,imgS,chS=false,false,false,false,false,false
local bV,bG;local b1=cB("Админ полет: ВЫКЛ",M)b1.MouseButton1Click:Connect(function()fly=not fly;if fly then b1.Text="Админ полет: ВКЛ"b1.BackgroundColor3=Color3.fromRGB(0,120,0)UpB.Visible=true;DnB.Visible=true;bG=Instance.new("BodyGyro",C.HumanoidRootPart)bG.P=9e4;bG.maxTorque=Vector3.new(9e5,9e5,9e5)bG.cframe=C.HumanoidRootPart.CFrame;bV=Instance.new("BodyVelocity",C.HumanoidRootPart)bV.velocity=Vector3.new(0,0.1,0)bV.maxForce=Vector3.new(9e5,9e5,9e5)task.spawn(function()while fly and C and C:FindFirstChild("HumanoidRootPart") do local cam=workspace.CurrentCamera.CFrame;local vel=H.MoveDirection*60;if H.Jump or up then vel=vel+Vector3.new(0,50,0)elseif dn then vel=vel+Vector3.new(0,-50,0)end;bV.velocity=vel;bG.cframe=cam;task.wait()end end)else b1.Text="Админ полет: ВЫКЛ"b1.BackgroundColor3=Color3.fromRGB(50,50,50)UpB.Visible=false;DnB.Visible=false;up=false;dn=false;nc=false;if bV then bV:Destroy()end;if bG then bG:Destroy()end end end)

local bNc=cB("Ноуклип: Только при полете",M)task.spawn(function()while task.wait() do if fly then bNc.Text=nc and "Ноуклип: ВКЛ" or "Ноуклип: ВЫКЛ" bNc.BackgroundColor3=nc and Color3.fromRGB(0,120,0) or Color3.fromRGB(100,100,0) else bNc.Text="Ноуклип: Только при полете" bNc.BackgroundColor3=Color3.fromRGB(50,50,50) nc=false end;if nc and C then for _,p in pairs(C:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end end)
bNc.MouseButton1Click:Connect(function()if fly then nc=not nc end end)

local b3=cB("Бег на Макс: ВЫКЛ",M)b3.MouseButton1Click:Connect(function()spd=not spd;H.WalkSpeed=spd and 300 or 16;b3.Text=spd and"Бег на Макс: ВКЛ"or"Бег на Макс: ВЫКЛ"b3.BackgroundColor3=spd and Color3.fromRGB(0,120,0)or Color3.fromRGB(50,50,50)end)
local b4=cB("Прыжок на Макс: ВЫКЛ",M)b4.MouseButton1Click:Connect(function()jmp=not jmp;H.JumpPower=jmp and 400 or 50;b4.Text=jmp and"Прыжок на Макс: ВКЛ"or"Прыжок на Макс: ВЫКЛ"b4.BackgroundColor3=jmp and Color3.fromRGB(0,120,0)or Color3.fromRGB(50,50,50)end)

-- РЕАЛЬНАЯ СМЕНА КОМАНД ДЛЯ RP
local bCh=cB("RP Смена команды",M)
bCh.MouseButton1Click:Connect(function()
    local done = false
    -- 1. Пробуем найти кастомные кнопки выбора команд в UI игры
    for _, gui in pairs(P.PlayerGui:GetDescendants()) do
        if gui:IsA("TextButton") and (gui.Name:lower():find("team") or gui.Text:lower():find("team") or gui.Name:lower():find("job")) then
            if gui.Visible and gui.AbsoluteSize.X > 0 then
                -- Симулируем клик по оригинальной кнопке игры, чтобы сработал серверный скрипт плейса
                local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                for _, ev in ipairs(events) do
                    if gui[ev] then
                        for _, connection in pairs(getconnections(gui[ev])) do
                            connection:Fire()
                            done = true
                        end
                    end
                end
            end
        end
    end
    -- 2. Если кнопок нет, пробуем через RemoteEvents (часто используется в RP)
    if not done then
        for _, remote in pairs(game:GetDescendants()) do
            if remote:IsA("RemoteEvent") and (remote.Name:lower():find("team") or remote.Name:lower():find("job") or remote.Name:lower():find("change")) then
                -- Пытаемся отправить запрос на случайную команду из списка сервера
                local ts = game:GetService("Teams"):GetTeams()
                if #ts > 0 then
                    remote:FireServer(ts[math.random(1, #ts)].Name)
                    done = true
                    break
                end
            end
        end
    end
    if done then bCh.Text = "Команда изменена!" task.wait(1) bCh.Text = "RP Смена команды" else bCh.Text = "Режим не поддерживается автоматически" end
end)

local bRs=cB("Принудительный ресет",M)bRs.BackgroundColor3=Color3.fromRGB(150,0,0)bRs.MouseButton1Click:Connect(function()if H then H.Health=0 end end)

local sG;local b5=cB("Спам картинок: ВЫКЛ",E)b5.MouseButton1Click:Connect(function()imgS=not imgS;if imgS then b5.Text="Спам картинок: ВКЛ"b5.BackgroundColor3=Color3.fromRGB(120,0,0)sG=Instance.new("ScreenGui",P.PlayerGui)task.spawn(function()while imgS do local im=Instance.new("ImageLabel",sG)im.Size=UDim2.new(0,math.random(100,300),0,math.random(100,300))im.Position=UDim2.new(math.random(0,90)/100,0,math.random(0,90)/100,0)im.Image="rbxassetid://6073173046"im.BackgroundTransparency=1;task.wait(0.2)end end)else b5.Text="Спам картинок: ВЫКЛ"b5.BackgroundColor3=Color3.fromRGB(50,50,50)if sG then sG:Destroy()end end end)
local b6=cB("Локальный спам чата: ВЫКЛ",E)b6.MouseButton1Click:Connect(function()chS=not chS;b6.Text=chS and"Локальный спам чата: ВКЛ"or"Локальный спам чата: ВЫКЛ"b6.BackgroundColor3=chS and Color3.fromRGB(120,0,0)or Color3.fromRGB(50,50,50)if chS then task.spawn(function()while chS do game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{Text="[Delta]: Спам-тест!",Color=Color3.fromRGB(255,0,0),Font=Enum.Font.SourceSansBold,TextSize=18})task.wait(0.4)end end)end end)
local tI=Instance.new("TextBox",M)tI.Size=UDim2.new(1,-10,0,60)tI.BackgroundColor3=Color3.fromRGB(20,20,20)tI.TextColor3=Color3.fromRGB(255,255,255)tI.PlaceholderText="Введи Lua-код сюда..."tI.Text=""tI.TextWrapped=true;tI.Font=Enum.Font.Code
local bEx=cB("Выполнить код (Execute)",M)bEx.BackgroundColor3=Color3.fromRGB(0,80,150)bEx.MouseButton1Click:Connect(function()local f,e=loadstring(tI.Text)if f then task.spawn(f)else tI.Text="Ошибка: "..tostring(e)end end)
