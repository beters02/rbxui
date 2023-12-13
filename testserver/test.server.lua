--[[local rbxui = require(game:GetService("ReplicatedStorage").rbxui)

local Gui = rbxui.Gui
local Page = rbxui.Page
local Button = rbxui.Button

local testgui = Gui.new({Name = "TestGui"})
local mainpage = Page.new(testgui, {Name = "MainPage"})
local secpage = Page.new(testgui, {Name = "SecPage"})
local button1 = Button.new(mainpage, {Name = "Button1"})

button1:LinkPage("SecPage")

print(testgui)
print(mainpage)
print(button1)]]