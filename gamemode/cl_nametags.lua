local function MESPCheck(v)
	if v:Alive() == true && v:Health() ~= 0 && v:Health() >= 0 && LocalPlayer():Alive() then
		return true
	else
		return false
	end
end

hook.Add("HUDPaint", "L4DGlow", function()
	for k,v in pairs(player.GetAll()) do
		if(MESPCheck(v)) then
			effects.halo.Add({v}, team.GetColor(v:Team()), 1, 1, 5, true, true)
		end
	end
end)

function NameTag()
for k, v in pairs( player.GetAll()) do
teamcolor = team.GetColor(v:Team())
	if v:Alive() then
		if !v:InVehicle() then
		    if v:Nick() != LocalPlayer():Nick() then
				if LocalPlayer():GetPos():Distance(v:GetPos()) <= 2000 then
					pos = v:GetPos()
					pos.z = pos.z + 70
					pos = pos:ToScreen()
					
					surface.SetTexture(surface.GetTextureID("gui/silkicons/user"))
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect( pos.x - 25, pos.y - 38, 16, 16 )	

					surface.SetTexture(surface.GetTextureID("gui/silkicons/money"))
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawTexturedRect( pos.x - 25, pos.y - 23, 16, 16 )
					
					draw.DrawText(v:Name(), "Trebuchet19", pos.x - 10, pos.y -38, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
					draw.DrawText(v:GetMoney(), "Trebuchet19", pos.x - 10, pos.y -23, team.GetColor(v:Team()), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
					

					end
				end
			end
		end
	end
end
hook.Add("HUDPaint", "NameTags", NameTag)