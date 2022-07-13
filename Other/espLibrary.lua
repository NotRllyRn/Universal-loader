--[[

    Mediorce ESP library

    By NotRllyRn <3>

]]

local espLib = {
    DrawToTarget = function(target, properties)
        

        local target = (target and (type(target) == "vector") and target) or (target and target.Position) or nil
        if not target then
            return
        end
    
        local vector = getPoint(target)
        if vector then
            local Line = Drawing.new("Line")
            Line.Visible = true
            Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
            Line.To = vector
            Line.Color = Color_1
            Line.Thickness = Thick
            Line.Transparency = 1
    
            return Line
        end
    end
}

function DrawText(Text_1, Point, Color_1, Thick) --// draws a text at point
    local Text_1 = Text_1 and tostring(Text_1) --// sets text to something
    local Point = Point and Point.X and Point.Y and Vector2.new(Point.X, Point.Y) --// sets point to something
    
    if Text_1 and Point then
        local Text = Drawing.new("Text") --// makes a new text
        Text.Visible = true --// sets properties of text
        Text.Text = Text_1
        Text.Color = Color_1
        Text.Position = Point
        Text.Size = 24
        Text.Outline = true

        return Text
    end

    return nil
end
