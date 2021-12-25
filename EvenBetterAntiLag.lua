do
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
end

