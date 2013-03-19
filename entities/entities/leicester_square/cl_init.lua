include("shared.lua")

surface.CreateFont( "HostFont", 
                    {
                    font    = "coolvetica",
                    size    = 40,
                    weight  = 700,
                    antialias = true,
                    shadow = true
            })
			
surface.CreateFont( "PlayerFont", 
                    {
                    font    = "coolvetica",
                    size    = 40,
                    weight  = 700,
                    antialias = true,
                    shadow = false
            })

function ENT:Draw()
	
	for k, v in pairs( player.GetAll()) do

	if self:GetPos():Distance(v:GetPos()) <= 300 then	

	cam.Start3D2D(self:GetPos() - self:GetAngles():Forward() * 190 + self:GetAngles():Right() * 190, self:GetAngles() + Angle(90, 90, 90), 0.3)
			
	--Main layer
	draw.RoundedBox(0, 450, 270, 350, 400, Color(255,255,255,200))
		
	draw.RoundedBox(0, 460, 285, 330, 60, Color(0,0,0,255))
	draw.RoundedBox(0, 465, 290, 320, 50, Color(255, 255, 0, 255))
		
	--Line Border
	draw.RoundedBox(0, 452, 275, 5, 390, Color(0,0,0,255))
	draw.RoundedBox(0, 452, 275, 345, 5, Color(0,0,0,255))
	draw.RoundedBox(0, 792, 275, 5, 390, Color(0,0,0,255))
	draw.RoundedBox(0, 452, 660, 345, 5, Color(0,0,0,255))
			
	--Text
	draw.DrawText("   Leicester Square", "HostFont", 470, 295, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("Rent                    22", "PlayerFont", 465, 360, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("With 1 House	   110", "PlayerFont", 465, 390, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("With 2 House	   330", "PlayerFont", 465, 420, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("With 3 House	   800", "PlayerFont", 465, 450, Color(0 , 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("With 4 House	   975", "PlayerFont", 465, 480, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("With Hotel          1150", "PlayerFont", 465, 510, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("Cost to Build       150", "PlayerFont", 465, 570, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	draw.DrawText("Mortage Value     130", "PlayerFont", 465, 600, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	cam.End3D2D()
	
	end
	end

end