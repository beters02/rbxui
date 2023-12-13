local RBXUI = require(game:GetService("ReplicatedStorage"):WaitForChild("RBXUI"))
local config = require(script.Parent.Parent.Configuration)

return function(page, name, customprop)
    local prop = {
        Name = name,
        Position = config.DEF_MAIN_BUTTON_POS,
        Size = config.DEF_MAIN_BUTTON_SIZE,
        AnchorPoint = config.DEF_MAIN_BUTTON_ANCHOR,
        TextTransparency = 1,
        BackgroundTransparency = 0.9,
        BackgroundColor3 = Color3.fromRGB(96, 112, 139)
    }
    if customprop then
        for i, v in pairs(customprop) do
            prop[i] = v
        end
    end
    local textprop = {
        TextColor3 = Color3.fromRGB(227, 236, 250)
    }
    return RBXUI.ButtonLabel.new(page, prop, textprop)
end