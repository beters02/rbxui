local RBXUI = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxui"))
local config = require(script.Parent.Parent.Configuration)

return {
    Button = function(page, name, customProp) -- define a componentBase for influence on the x axis
        local size = UDim2.fromScale(
            config.DEF_MAIN_BUTTON_SIZE.X.Scale,
            config.DEF_MAIN_BUTTON_SIZE.Y.Scale * config.DEF_HEADER_SIZE_Y_MOD
        )
        local pos = UDim2.fromScale(
            config.DEF_MAIN_BUTTON_POS.X.Scale,
            config.DEF_MAIN_BUTTON_POS.Y.Scale + config.DEF_HEADER_PAD_Y + config.DEF_MAIN_BUTTON_SIZE.Y.Scale
        )
        local ap = config.DEF_MAIN_BUTTON_ANCHOR
        if customProp then
            size = customProp.Size or size
            pos = customProp.Position or pos
            ap = customProp.AnchorPoint or ap
        end
    
        local button = RBXUI.Button.new(page, {
            Name = name,
            Size = size,
            Position = pos,
            AnchorPoint = ap,
            TextTransparency = 1
        })
        button.FitText = RBXUI.FitText.new(button, {
            BackgroundTransparency = 1
        })
        button.FitText:SetText(name)
        button.SetText = function(self, str)
            self.FitText:SetText(str)
        end
        return button
    end,
    Label = function(page, name, customProp)
        local size = UDim2.fromScale(
            config.DEF_MAIN_BUTTON_SIZE.X.Scale,
            config.DEF_MAIN_BUTTON_SIZE.Y.Scale * config.DEF_HEADER_SIZE_Y_MOD
        )
        local pos = UDim2.fromScale(
            config.DEF_MAIN_BUTTON_POS.X.Scale,
            config.DEF_MAIN_BUTTON_POS.Y.Scale + config.DEF_HEADER_PAD_Y + config.DEF_MAIN_BUTTON_SIZE.Y.Scale
        )
        local ap = config.DEF_MAIN_BUTTON_ANCHOR
        if customProp then
            size = customProp.Size or size
            pos = customProp.Position or pos
            ap = customProp.AnchorPoint or ap
        end
    
        local label = RBXUI.Button.new(page, {
            Name = name,
            Size = size,
            Position = pos,
            AnchorPoint = config.DEF_MAIN_BUTTON_ANCHOR,
        })
        label:SetText(name)
        return label
    end
}