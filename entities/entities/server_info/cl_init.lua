include("shared.lua")

surface.CreateFont( "Arial120", 
                    {
                    font    = "Arial",
                    size    = 120,
                    weight  = 700,
                    antialias = true,
                    shadow = false
            })
			
surface.CreateFont( "Arial150", 
                    {
                    font    = "Arial",
                    size    = 150,
                    weight  = 700,
                    antialias = true,
                    shadow = false
            })
			
surface.CreateFont( "Arial160", 
                    {
                    font    = "Arial",
                    size    = 160,
                    weight  = 700,
                    antialias = true,
                    shadow = false
            })



//Colors["gm_construct"] = Color(51, 102, 255, 255)
//Colors["gm_flatgrass"] = Color(51, 102, 255, 255)

local	Rules = 	{
					{"Don't spam","Õ≈ —œ¿Ã‹ —” ¿"},
					{"Don't spam","Õ≈ —œ¿Ã‹ —” ¿"},
					{"Don't spam","Õ≈ —œ¿Ã‹ —” ¿"},
					{"Don't spam","Õ≈ —œ¿Ã‹ —” ¿"},
					{"Don't spam","—” ¿ Õ≈ —œ¿Ã‹"},
					{"So, don't spam","¡Û‰¸ Ú‡Í ‰Ó·, ÌÂ ÒÔ‡Ï¸."}
			}
				
		
		

lang = 1
function UseHook(ply,key)

	if key != IN_USE then return end
	
	
	
	local entsphere = ents.FindInSphere(ply:GetPos(),1024) 
	
	
	
		for k,v in pairs(entsphere) do
		
			if v:GetClass() == "server_info" then
			
				if lang == 1 then lang = 2 else lang = 1 end
				
			end
			
		end
		
		

end
hook.Add("KeyPress","ChangeLanguage",UseHook)




function ENT:Draw()
	
local hour = os.date("%H")
local minute = os.date("%M")
local second = os.date("%S")


local day = os.date("%d")	
local month = os.date("%b")
local year = os.date("%Y")

local players = player.GetAll()
local AllEnts = ents.GetAll()
local TotalEntsCount = table.Count(AllEnts)



	cam.Start3D2D(self:GetPos(), self:GetAngles() + Angle( 0,0,90 ), 0.1)
			--Welcome title
			
				draw.RoundedBox( 6, 0, 0, 3600, 150, Color( 0, 148, 255, 100 ) )
				
				
				if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then
				local welcome_txt_data = {}
					welcome_txt_data.pos = { 1800 + math.sin(CurTime()/2)*40, 60 } 
					welcome_txt_data.color = Color(220, 240, 220, 255)
					welcome_txt_data.text = "W e l c o m e   t o   o u r g a r r y s . r u"
					welcome_txt_data.font = "Arial120" 
					welcome_txt_data.xalign = TEXT_ALIGN_CENTER 
					welcome_txt_data.yalign = TEXT_ALIGN_CENTER 
				draw.TextShadow( welcome_txt_data,10,150 )
				end
			
			
				

			
			--The clock
				draw.RoundedBox( 8, 3000, 200, 600, 600, Color( 0, 148, 255, 100 ) )
				
				
				
				if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then
				local clock_txt_data = {}
					clock_txt_data.pos = { 3000 + 300, 200 + 450 } 
					clock_txt_data.color = Color(220, 255, 220, 255)
					clock_txt_data.text = tostring(hour) .. ":" .. tostring(minute) .. ":" .. tostring(second)
					clock_txt_data.font = "Arial120" 
					clock_txt_data.xalign = TEXT_ALIGN_CENTER 
					clock_txt_data.yalign = TEXT_ALIGN_CENTER 
				draw.TextShadow( clock_txt_data,10,150 )
				
					--Shaaaadooow
								surface.SetDrawColor(0,0,0,100)
								surface.DrawRect(3000+30,200+60,30+hour*22,50)
								surface.DrawRect(3000+30,200+160,30+minute*9,50)
								surface.DrawRect(3000+30,200+260,30+second*9,50)
				end

				
				
				surface.SetDrawColor(220,240,220,255)
				surface.DrawRect(3000+20,200+50,30+hour*22,50)
				surface.DrawRect(3000+20,200+150,30+minute*9,50)
				surface.DrawRect(3000+20,200+250,30+second*9,50)
		
		--Teh date
				draw.RoundedBox( 8, 3000, 900, 600, 600, Color( 0, 148, 255, 100 ) )
				
				
			if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then	
				local data_day_txt_data = {}
					data_day_txt_data.pos = { 3000 + 300, 900 + 150 } 
					data_day_txt_data.color = Color(220, 255, 220, 255)
					data_day_txt_data.text = tostring(day)
					data_day_txt_data.font = "Arial120" 
					data_day_txt_data.xalign = TEXT_ALIGN_CENTER 
					data_day_txt_data.yalign = TEXT_ALIGN_CENTER 
				draw.TextShadow( data_day_txt_data,10,150 )
				
				local data_month_txt_data = {}
					data_month_txt_data.pos = { 3000 + 300, 900 + 300 } 
					data_month_txt_data.color = Color(220, 255, 220, 255)
					data_month_txt_data.text = tostring(month)
					data_month_txt_data.font = "Arial120" 
					data_month_txt_data.xalign = TEXT_ALIGN_CENTER 
					data_month_txt_data.yalign = TEXT_ALIGN_CENTER 
				draw.TextShadow( data_month_txt_data,10,150 )
				
				local data_year_txt_data = {}
					data_year_txt_data.pos = { 3000 + 300, 900 + 450 } 
					data_year_txt_data.color = Color(220, 255, 220, 255)
					data_year_txt_data.text = tostring(year)
					data_year_txt_data.font = "Arial120" 
					data_year_txt_data.xalign = TEXT_ALIGN_CENTER 
					data_year_txt_data.yalign = TEXT_ALIGN_CENTER 
				draw.TextShadow( data_year_txt_data,10,150 )
			end
		
		--Teh players list
				draw.RoundedBox( 8, 0, 200, 2950, 1300, Color( 0, 148, 255, 100 ) )
				
				--Endless loop omfg
			if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then	
				for k,v in pairs(players) do
					local nick = v:Nick()
					local ping = v:Ping()
					--local props = v:GetCount( "props" )
					
				local player_txt_data = {}
					player_txt_data.pos = { 50 , 100 + 120*k } 
					player_txt_data.color = Color(220, 255, 220, 255)
					player_txt_data.text = tostring(k) .. ". " .. string.Left(nick,20)
					player_txt_data.font = "Arial120" 
					player_txt_data.xalign = TEXT_ALIGN_LEFT 
					player_txt_data.yalign = TEXT_ALIGN_LEFT 
				draw.TextShadow( player_txt_data,10,150 )
				
				local player_txt_data = {}
					player_txt_data.pos = { 1400 , 100 + 120*k } 
					player_txt_data.color = Color(220, 255, 220, 255)
					player_txt_data.text =  "Ping: " .. tostring(ping) .. "ms         " .. "Props: " .. tostring(props) 
					player_txt_data.font = "Arial120" 
					player_txt_data.xalign = TEXT_ALIGN_LEFT 
					player_txt_data.yalign = TEXT_ALIGN_LEFT 
				draw.TextShadow( player_txt_data,10,150 )
				
				end --of loop
			end
				
		
		
		
		
		
		
		
		
		--Total ents on the server
		
		draw.RoundedBox( 6, 0, 1600, 3600, 150, Color( 0, 148, 255, 100 ) )
			
		if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then	
		local total_ents_txt_data = {}
					total_ents_txt_data.pos = { 1800, 1600 + 75 } 
					total_ents_txt_data.color = Color(220, 240, 220, 255)
					total_ents_txt_data.text = "Ents count: " .. tostring(TotalEntsCount)
					total_ents_txt_data.font = "Arial120" 
					total_ents_txt_data.xalign = TEXT_ALIGN_CENTER 
					total_ents_txt_data.yalign = TEXT_ALIGN_CENTER 
		draw.TextShadow( total_ents_txt_data,10,150 )
		end
				
				
				
		--OMFG RULES
		
		draw.RoundedBox( 32, 0, 1850, 3600, (#Rules * 150), Color( 0, 148, 255, 100 ) )
		
		if LocalPlayer():GetPos():Distance(self:GetPos()) < 4096 then
			for k,v in pairs(Rules) do
				local data = {}
				data.text = tostring(k) .. ". " .. v[lang]
				data.pos = {15, 1800 + k * 120}
				data.font = "Arial120"
				data.color = Color(220, 240, 220, 255)
				draw.TextShadow(data,10,150)
			end
		end
		
		
		
		
	cam.End3D2D()

end
























