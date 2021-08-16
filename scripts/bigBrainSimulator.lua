local run = true

local nextBooks = {
    ["Starter Book"] = "Blue Book",
    ["Blue Book"] = "Green Book",
    ["Green Book"] = "Yellow Book",
    ["Yellow Book"] = "Purple Book",
    ["Purple Book"] = "Orange Book",
    ["Orange Book"] = "Lime Book",
    ["Lime Book"] = "Violet Book",
    ["Violet Book"] = "Magenta Book",
    ["Magenta Book"] = "White Book",
    ["White Book"] = "Black Book",
    ["Black Book"] = "Bronze Book",
    ["Bronze Book"] = "Silver Book",
    ["Silver Book"] = "Gold Book",
    ["Gold Book"] = "Platinum Book",
    ["Platinum Book"] = "Titanium Book",
    ["Titanium Book"] = "Glass Book",
    ["Glass Book"] = "Rainbow Book",
    ["Rainbow Book"] = "Shadow Book",
    ["Shadow Book"] = "Glowing Book",
    ["Glowing Book"] = "The Dictionary",
    ["The Dictionary"] = "OOF Book",
    ["OOF Book"] = "Fire Book",
    ["Fire Book"] = "Cosmic Book"
}

local rs = game:GetService("ReplicatedStorage")

local plr = game.Players.LocalPlayer
local char = plr.Character

local function getBook()
    return char:FindFirstChildWhichIsA("Tool")
end

local function useBook()
    local tool = getBook(char).Name
    rs.Remotes.BookClicked:FireServer(tool)
end

local function equipBook(name)
    for _,tool in pairs (game.Players.LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            tool.Parent = char
        end
    end
end

local function nextBrain()
    rs.Remotes.UpgradeCapacity:FireServer()
end

local function nextBook()
    local tool = getBook(char).Name
    local nextBook = nextBooks[tool]
    if nextBook then
        rs.Remotes.BuyBook:FireServer(nextBook)
        equipBook()
    end
end

_G.run = run

while _G.run == true do
    wait()
    if getBook() then
        useBook()
        nextBook()
        nextBrain()
    else
        equipBook()
    end
end