local args = ({...})

local effect = 0
local props = 0

local Toggles = {
    Transparency = true,
    GUI = true,
    SurfaceGui = true,
}

local function ClassCheck(pa,ch)
    local s = false
    pcall(function()
        if not (Toggles[ch] == nil) and not Toggles[ch] then
            return false
        end
        if pa:IsA(ch) then
            effect = effect + 1
            s = true
        end
    end)
    return s
end
local function ChangeIf(pa,pr,ch)
    local s = false
    pcall(function()
        if not (Toggles[pr] == nil) and not Toggles[pr] then
            return false
        end
        pa[pr] = ch
        props = props + 1
        s = true
    end)
    return s
end

settings().Rendering.QualityLevel = "Level01"
sethiddenproperty(game:GetService("Workspace").Terrain,"Decoration",false)
sethiddenproperty(game:GetService("Lighting"),"Technology","Compatibility")
sethiddenproperty(settings():GetService("RenderSettings"),"MeshPartDetailLevel",Enum.MeshPartDetailLevel.Level01)
sethiddenproperty(game:GetService("Workspace"),"LevelOfDetail",Enum.ModelLevelOfDetail.Disabled)
game:GetService("Workspace").Terrain.WaterTransparency = 0
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").FogEnd = 9e9
game:GetService("Lighting").Brightness = 0
game:GetService("Workspace").Terrain.WaterWaveSize = 0
game:GetService("Workspace").Terrain.WaterWaveSpeed = 0
game:GetService("Workspace").Terrain.WaterReflectance = 0
game:GetService("Workspace").Terrain.WaterTransparency = 0

local function RunCheck(v)
    if ((ClassCheck(v,"BasePart")) or (ClassCheck(v,"MeshPart"))) and (not (v:IsA("GuiObject"))) then
        ChangeIf(v,"RenderFedelity","Automatic")
        ChangeIf(v,"MeshId","")
        ChangeIf(v,"CastShadow",false)
        ChangeIf(v,"DoubleSided",false)
        ChangeIf(v,"Material","SmoothPlastic")
        ChangeIf(v,"TextureId","")
        ChangeIf(v,"Transparency",1)
        ChangeIf(v,"Reflectance",0)
    elseif ClassCheck(v,"Texture") then
        ChangeIf(v,"Texture","")
        ChangeIf(v,"Transparency",1)
    elseif ClassCheck(v,"Light") then
        ChangeIf(v,"Brightness",0)
        ChangeIf(v,"Range",0)
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"Shadows",false)
    elseif ClassCheck(v,"Lighting") then
        pcall(function()
            sethiddenproperty(v, 'Technology', 2)
            v.GlobalShadows = false
            v.FogEnd = 9e9
            v.Brightness = 0
        end)
    elseif ClassCheck(v,"Beam") then
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"Transparency",1)
        ChangeIf(v,"LightEmmision",0)
        ChangeIf(v,"LightInfluence",0)
        ChangeIf(v,"Transparency",1)
    elseif ClassCheck(v,"Decal") then
        ChangeIf(v,"Transparency",1)
        ChangeIf(v,"Texture",1)
    elseif ClassCheck(v,"NetworkClient") then
        v:SetOutgoingKBPSLimit(100)
    elseif ClassCheck(v,"Smoke") or ClassCheck(v,"Fire") or ClassCheck(v,"Sparkles") then
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"Heat",0)
        ChangeIf(v,"Opacity",0)
    elseif ClassCheck(v,"SpecialMesh") then
        ChangeIf(v,"MeshId","")
        ChangeIf(v,"TextureId","")
    elseif ClassCheck(v,"ParticleEmmiter") or ClassCheck(v,"Trail") then
        ChangeIf(v,"Lifetime",NumberRange.new(0))
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"Transparency",1)
        ChangeIf(v,"LightEmmision",0)
        ChangeIf(v,"LightInfluence",0)
        ChangeIf(v,"Texture","")
        ChangeIf(v,"Size",0)
    elseif ClassCheck(v.Parent,"Lighting") then
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"Intensity",false)
        ChangeIf(v,"Enabled",false)
    elseif ClassCheck(v,"Shirt") or ClassCheck(v,"Pants") then
        ChangeIf(v,v.ClassName.."Template","")
    elseif ClassCheck(v,"ShirtGraphic") then
        ChangeIf(v,"Graphic","")
    elseif ClassCheck(v,"BillboardGui") then
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"AlwaysOnTop",false)
        ChangeIf(v,"Active",false)
    elseif ClassCheck(v,"SurfaceGui") then
        ChangeIf(v,"Enabled",false)
        ChangeIf(v,"AlwaysOnTop",false)
        ChangeIf(v,"LightInfluence",0)
        ChangeIf(v,"Active",false)
    end
end

for _,v in pairs(game:GetDescendants()) do 
    local s = true
    if ClassCheck(v.Parent,"PlayerGui") and Toggles.GUI then
        ChangeIf(v,"Enabled",false)
        s = false
    end
    if not v:FindFirstAncestorOfClass("CoreGui") and s then
        RunCheck(v)
    end
end

if Toggles.GUI then
    for _,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
        if ChangeIf(v,"Enabled",false) then
            v.Changed:Connect(function()
                v.Enabled = false
            end)
        end
    end
end

game.DescendantAdded:Connect(function(v)
    RunCheck(v) 
    for _,c in pairs(v:GetDescendants()) do 
        RunCheck(c)
    end
end)

return effect,props