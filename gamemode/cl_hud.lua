local function HideHUDElements( HUD ) 
	local Elements = { "CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo" }
	if table.HasValue( Elements, HUD ) then return false end
end 
hook.Add( "HUDShouldDraw", "HideHUDElements", HideHUDElements )

surface.CreateFont("Trebuchet19", {font="TabLarge", size=13, weight=700})

local function PaintHUD()
	//Time Variable
	local TimeString = os.date("%I") .. ":" .. os.date("%M") .. " " .. os.date("%p")
	local Clock  = Material( "materials/icon16/user.png" )
	local Heart  = Material( "materials/icon16/heart.png" )
	local Money = Material( "materials/icon16/money.png" )

	if LocalPlayer():Alive() && LocalPlayer():IsValid() then
		--Images Area Box
		draw.RoundedBox( 0, 4, ScrH() - 63, 20, 60, Color( 0, 0, 0, 200 ) )
		--Main Area Box
		draw.RoundedBox( 0, 26, ScrH() - 63, 78, 60, Color( 0, 0, 0, 200 ) )
		--Inner Boxes
		draw.RoundedBox( 0, 26, ScrH() - 63, 78, 17, Color( 0, 0, 0, 200 ) )
		draw.RoundedBox( 0, 26, ScrH() - 41, 78, 17, Color( 0, 0, 0, 200 ) )
		draw.RoundedBox( 0, 26, ScrH() - 20, 78, 17, Color( 0, 0, 0, 200 ) )
		--Clock Texture
		surface.SetMaterial( Clock )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( 6, ScrH() - 62, 16, 16 )	
		--Heart Texture
		surface.SetMaterial( Heart )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( 6, ScrH() - 41, 16, 16 )
		--Money Texture
		surface.SetMaterial( Money )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( 6, ScrH() - 21, 16, 16 )
		--Time Label
		draw.SimpleText( TimeString, "Trebuchet19", 31, ScrH() - 62, Color( 255, 255, 255, 255 ) )
		--Health Label
		draw.SimpleText( LocalPlayer():Health(), "Trebuchet19", 31, ScrH() - 40, Color( 255, 255, 255, 255 ) )
		--Money Label
		draw.SimpleText( LocalPlayer():GetMoney(), "Trebuchet19", 31, ScrH() - 20, Color( 255, 255, 255, 255 ) )

	end
end
hook.Add( "HUDPaint", "PaintHUD", PaintHUD )

hook.Add("HUDPaint", "Property", function()
		for _, ent in pairs(ents.GetAll()) do
				local rpepos = ent:GetPos()
				if rpepos:ToScreen().x > 0 and
				rpepos:ToScreen().y > 0 and
				rpepos:ToScreen().x < ScrW() and
				rpepos:ToScreen().y < ScrH() then
	                local rppos1 = (ent:LocalToWorld( Vector(0,0,0)) ):ToScreen()
					
					local pos = ent:GetPos()
					
					if string.find(ent:GetClass(), "prop_physics") then 
						effects.halo.Add({ent}, Color(255, 255, 255), 1, 1, 1, true, true)
					end
					
					
					--draw.DrawText(ent:GetClass(), "Trebuchet19", rppos1.x, rppos1.y, Color(0, 0, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
					--draw.DrawText("x " .. pos.x .. " y " .. pos.y .. " z " .. pos.z, "Trebuchet19", rppos1.x, rppos1.y + 25, Color(0, 0, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                    
					if ent:GetModel() == "models/props/cs_assault/money.mdl" then
					end
					
				end
		end
end)


	

