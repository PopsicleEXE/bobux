local hubs = {
	"https://raw.githubusercontent.com/PopsicleEXE/bobux/main/scripts/Impulse%20Hub.lua",
}
local list = {
	[6284583030] = "https://raw.githubusercontent.com/PopsicleEXE/bobux/main/scripts/Pet%20Sim%20X.lua"
}

local a=Instance.new"ScreenGui"
a.Name="ScriptGui"
a.ZIndexBehavior=1
local b=Instance.new"Frame"
b.Name="MainFrame"
b.AnchorPoint=Vector2.new(0,1)
b.Size=UDim2.new(0.25,0,0.3,0)
b.BackgroundTransparency=1
b.Position=UDim2.new(0,8,1,-8)
b.BorderSizePixel=0
b.BackgroundColor3=Color3.fromRGB(255,255,255)
b.Parent=a
local c=Instance.new"Frame"
c.Name="TopBar"
c.Size=UDim2.new(1,0,0.1,0)
c.BackgroundTransparency=1
c.BorderSizePixel=0
c.BackgroundColor3=Color3.fromRGB(41,47,62)
c.Parent=b
local d=Instance.new"TextButton"
d.Name="Button"
d.Size=UDim2.new(1,0,1,0)
d.BackgroundTransparency=1
d.BorderSizePixel=0
d.BackgroundColor3=Color3.fromRGB(255,255,255)
d.FontSize=5
d.TextSize=14
d.TextColor3=Color3.fromRGB(0,0,0)
d.Text=""
d.Font=3
d.Parent=c
local e=Instance.new"Frame"
e.Name="MainBox"
e.Size=UDim2.new(1,0,0.9,0)
e.BackgroundTransparency=1
e.Position=UDim2.new(0,0,0.1,0)
e.BorderSizePixel=0
e.BackgroundColor3=Color3.fromRGB(26,30,39)
e.Parent=b
local f=Instance.new"ScrollingFrame"
f.Size=UDim2.new(1,0,1,0)
f.BackgroundTransparency=1
f.Active=true
f.BorderSizePixel=0
f.BackgroundColor3=Color3.fromRGB(255,255,255)
f.ScrollBarImageColor3=Color3.fromRGB(0,0,0)
f.Parent=e
local g=Instance.new"UIGridLayout"
g.FillDirection = Enum.FillDirection.Vertical
g.SortOrder=2
g.CellSize=UDim2.new(1,-12,0,20)
g.CellPadding=UDim2.new(0,0,0,8)
g.Parent=f
local h=Instance.new"Frame"
h.Name="TemplateFrame"
h.Size=UDim2.new(0,100,0,100)
h.BorderSizePixel = 0
h.BackgroundColor3 = Color3.fromRGB(29,34,45)
h.BackgroundColor3=Color3.fromRGB(255,255,255)
h.Parent=e
local i=Instance.new"TextButton"
i.Name="Button"
i.Size=UDim2.new(1,0,1,0)
i.BackgroundTransparency=1
i.BorderSizePixel=0
i.BackgroundColor3=Color3.fromRGB(255,255,255)
i.FontSize=5
i.TextStrokeTransparency=0
i.TextSize=14
i.TextColor3=Color3.fromRGB(0,0,0)
i.TextWrap=true
i.Font=26
i.TextWrapped=true
i.TextStrokeColor3=Color3.fromRGB(255,255,255)
i.TextScaled=true
i.ZIndex = 100
i.Parent=h
local j=Instance.new"Frame"
j.Name="TopBg"
j.ZIndex=0
j.Size=UDim2.new(1,0,0.2,0)
j.BorderSizePixel=0
j.BackgroundColor3=Color3.fromRGB(41,47,62)
j.Parent=b
local k=Instance.new"UICorner"
k.Parent=j
local l=Instance.new"Frame"
l.Name="MainBg"
l.ZIndex=0
l.Size=UDim2.new(1,0,0.9,0)
l.Position=UDim2.new(0,0,0.1,0)
l.BorderSizePixel=0
l.BackgroundColor3=Color3.fromRGB(26,30,39)
l.Parent=b
local m=Instance.new"UICorner"
m.Parent=l

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        TS:Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

dragify(a.MainGui)


local curGame = list[game.PlaceId]
if curGame then
	local split = string.split(curGame,"/")
	local new = h:Clone()
	new.Button.Text = split[#split]
	new.BackgroundColor3 = Color3.new(0,1,.4)
	new.Parent = f
	list[game.PlaceId] = nil
	
	new.Button.MouseButton1Click:Connect(function()
		print("clicked "..split[#split])
		loadstring(game:HttpGet(curGame))()
	end)
end

for _,item in pairs(hubs) do
	local split = string.split(item,"/")
	local new = h:Clone()
	new.Button.Text = split[#split]
	new.Parent = f
	
	new.Button.MouseButton1Click:Connect(function()
		print("clicked "..split[#split])
		loadstring(game:HttpGet(item))()
	end)
end

for _,item in pairs(list) do
	local split = string.split(item,"/")
	local new = h:Clone()
	new.Button.Text = split[#split]
	new.Parent = f
	
	new.Button.MouseButton1Click:Connect(function()
		print("clicked "..split[#split])
		loadstring(game:HttpGet(item))()
	end)
end
h:Destroy()

game:GetService("UserInputService").InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.P then
        a.MainGui.Visible = not a.MainGui.Visible
    end
end)

if syn then
	a.Parent = game.Players.LocalPlayer.PlayerGui
	syn.protect_gui(a)
elseif get_hidden_gui then
	a.Parent = get_hidden_gui()
else
	a.Parent = game.Players.LocalPlayer.PlayerGui
end