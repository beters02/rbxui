--[[TODO]]
-- Change MainMenu Button Component CustomProp to take in Arrays and convert them into UDims for easier editing.
-- Add more functions for Header and Footer sizing

-- [[ MODULE ]]
local MainMenu = {didInit = false}
local config = require(script:WaitForChild("Configuration"))

-- [[ COMPONENTS ]]
local Components = script:WaitForChild("Components")
local Header = require(Components.Header)
local Footer = require(Components.Footer)
local Button = require(Components.Button)
local RBXUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxui"))
local Enum = RBXUI.Enum

function MainMenu.Init()
    if MainMenu.didInit then
        return
    end

    -- main gui
    local gui = RBXUI.Gui.new({Name = "MainMenu"})
    gui:Parent()

    local BGImageLabel = gui:SetBackgroundImage("rbxassetid://11335093179")
    BGImageLabel.ImageColor3 = Color3.fromRGB(63, 85, 104)
    
    -- MAIN PAGE DEF [[
    local mainPage = RBXUI.Page.new(gui, {
        Name = "MainPage",
        SizePreset = "Full",
        PositionPreset = "Middle"
    })

    local SoloButton = Button(mainPage, "Solo")

    local CasualButton = Button(mainPage, "Casual")
    local caspos = CasualButton.Instance.Position
    CasualButton.Instance.Position = UDim2.fromScale(
        caspos.X.Scale + CasualButton.Instance.Size.X.Scale + config.DEF_PAD,
        caspos.Y.Scale
    )

    -- main header & footer takes two main buttons sizes and one pad for x
    local mainHeaderSize = UDim2.fromScale(
        (config.DEF_MAIN_BUTTON_SIZE.X.Scale * 2) + config.DEF_PAD,
        config.DEF_MAIN_BUTTON_SIZE.Y.Scale * config.DEF_HEADER_SIZE_Y_MOD
    )

    local PlayHeaderLabel = Header.Label(mainPage, "Play", {
        Size = mainHeaderSize
    })
    local PlayFooterButton = Footer.Button(mainPage, "MainFooter", {
        Size = mainHeaderSize
    })
    PlayFooterButton:SetText("Join Deathmatch")
    -- ]]

    -- SOLO PAGE DEF [[
    local soloPage = RBXUI.Page.new(gui, {
        Name = "SoloPage",
        SizePreset = "Full",
        PositionPreset = "Middle"
    })

    local StableButton = Button(soloPage, "Stable", {
        Position = UDim2.fromScale(Enum.Pos.Middle.Position.X.Scale, config.DEF_MAIN_BUTTON_POS.Y.Scale),
        AnchorPoint = Vector2.new(0.5, 0),
    })

    -- solo footer takes 1 button size for
    local SoloCancelFooter = Footer.Button(soloPage, "Cancel", {
        Position = UDim2.fromScale(
            StableButton.Instance.Position.X.Scale,
            config.DEF_MAIN_BUTTON_POS.Y.Scale + config.DEF_HEADER_PAD_Y + config.DEF_MAIN_BUTTON_SIZE.Y.Scale
        ),
        Size = UDim2.fromScale(
            (config.DEF_MAIN_BUTTON_SIZE.X.Scale),
            config.DEF_MAIN_BUTTON_SIZE.Y.Scale * config.DEF_HEADER_SIZE_Y_MOD
        ),
        AnchorPoint = StableButton.Instance.AnchorPoint,
    })
    --]]

    -- CASUAL PAGE DEF [[
    
    --]]

    -- BUTTON PAGE LINKING [[
    SoloButton:LinkPage("SoloPage")
    SoloCancelFooter:LinkPage("MainPage")
    -- ]]

    gui:Enable()

    MainMenu.didInit = true
end

return MainMenu