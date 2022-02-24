pcall(function()
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i,v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end
    for i,e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

pcall(function()
    local Lighting = game:GetService("Lighting")
    local NetworkSettings = settings():GetService("NetworkSettings")
    local RenderSettings = settings():GetService("RenderSettings")
    local GameSettings = settings():GetService("GameSettings")
    local UserGameSettings = UserSettings():GetService("UserGameSettings")
    local Closure = newcclosure or function(Function) return Function end
    local SetProperty = sethiddenproperty or set_hidden_property or set_hidden_prop or function(Instance, Property, Value) pcall(Closure(function() Instance[Property] = Value end)) end
    local GetProperty = gethiddenproperty or get_hidden_property or get_hidden_prop or function(Instance, Property) pcall(Closure(function() return Instance[Property] or nil end)) end
    local Configuration = {
    QualityLevel = Enum.QualityLevel.Level01, -- Upto Level21
    SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1, -- Upto QualityLevel10
    LightingTechnology = Enum.Technology.Legacy,
    ModelLevelOfDetail = Enum.ModelLevelOfDetail.Disabled,
    InterpolationThrottlingMode = Enum.InterpolationThrottlingMode.Disabled,
    MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01,
    MeshPartHeads = Enum.MeshPartHeads.Disabled,
    EagerBulkExecution = false, -- Rendering budget limit
    GlobalShadows = false, -- Shadows off
    TerrainDecoration = false, -- Grass off
    IncomingReplicationLag = -1000, -- lagn't
    HasEverUsedVR = true, -- funni
    VREnabled = false -- funni
    }
    spawn(Closure(function()
        SetProperty(UserGameSettings, "SavedQualityLevel", Configuration["SavedQualityLevel"])
        SetProperty(UserGameSettings, "HasEverUsedVR", Configuration["HasEverUsedVR"])
        SetProperty(UserGameSettings, "VREnabled", Configuration["VREnabled"])
        SetProperty(RenderSettings, "QualityLevel", Configuration["QualityLevel"])
        SetProperty(RenderSettings, "MeshPartDetailLevel", Configuration["MeshPartDetailLevel"])
        SetProperty(RenderSettings, "EagerBulkExecution", Configuration["EagerBulkExecution"])
        SetProperty(NetworkSettings, "IncomingReplicationLag", Configuration["IncomingReplicationLag"])
        SetProperty(Lighting, "GlobalShadows", Configuration["GlobalShadows"])
        SetProperty(Lighting, "Technology", Configuration["LightingTechnology"])
        SetProperty(workspace.Terrain, "Decoration", Configuration["TerrainDecoration"])
        SetProperty(workspace, "LevelOfDetail", Configuration["ModelLevelOfDetail"])
        SetProperty(workspace, "MeshPartHeads", Configuration["MeshPartHeads"])
        SetProperty(workspace, "InterpolationThrottling", Configuration["InterpolationThrottlingMode"])
        if syn then pcall(function() setfpscap(999) end) end
    end))
end)

pcall(function()
    local sethiddenproperty = sethiddenproperty or  sethiddenprop or set_hidden_prop or set_hidden_property
    sethiddenproperty(game.Lighting, "Technology", "Compatibility")
    sethiddenproperty(workspace.Terrain, "Decoration", true)
    game.Lighting.GlobalShadows = false
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Union") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
            sethiddenproperty(v, "RenderFidelity", "Automatic")
        end
    end
end)

pcall(function()
    for i,e in pairs(workspace:GetDescendants()) do
        if e:IsA("Model") then
            sethiddenproperty(e, "LevelOfDetail", "Automatic")
        end
    end
end)

pcall(function()
    settings().Rendering.QualityLevel = "Level01"
    local Terrain = game:GetService("Workspace").Terrain
    local set = sethiddenproperty 
    set(Terrain,"Decoration",false)
    set(game:GetService("Lighting"),"Technology",2)
    Terrain.WaterTransparency = 0
    game:GetService("Lighting").GlobalShadows = false 
    for _,v in pairs(game:GetService("Lighting"):GetChildren()) do 
        if v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") and v.Name ~= "" then 
            v.Enabled = false 
        end
    end
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
            v.Material = "SmoothPlastic"
        end
    end
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("Light") or v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end
end)
