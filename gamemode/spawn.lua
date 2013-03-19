local Map = game.GetMap()
local SpawnPositions = {}
local SpawnAngles = {}

function SpawnScoreboard()

	--local score_board = ents.Create("score_board")
	--score_board:SetPos(SpawnPositions[Map])
	--score_board:SetAngles(SpawnAngles[Map])
 	--score_board:Spawn() 
		
	local old_kent_road = ents.Create("old_kent_road")
	old_kent_road:SetPos(Vector(property[1].entity:GetPos().x, property[1].entity:GetPos().y + 220, property[1].entity:GetPos().z + 20))
	old_kent_road:SetAngles(Angle(90, 90, 180))
 	old_kent_road:Spawn() 
	
	local white_chapel_road = ents.Create("white_chapel_road")
	white_chapel_road:SetPos(Vector(property[3].entity:GetPos().x, property[3].entity:GetPos().y + 220, property[3].entity:GetPos().z + 20))
	white_chapel_road:SetAngles(Angle(90, 90, 180))
 	white_chapel_road:Spawn()
	
	local king_cross_station = ents.Create("king_cross_station")
	king_cross_station:SetPos(Vector(property[5].entity:GetPos().x, property[5].entity:GetPos().y + 220, property[5].entity:GetPos().z + 20))
	king_cross_station:SetAngles(Angle(90, 90, 180))
 	king_cross_station:Spawn()
	
	local the_angel_islington = ents.Create("the_angel_islington")
	the_angel_islington:SetPos(Vector(property[6].entity:GetPos().x, property[6].entity:GetPos().y + 220, property[6].entity:GetPos().z + 20))
	the_angel_islington:SetAngles(Angle(90, 90, 180))
 	the_angel_islington:Spawn()
	
	local euston_road = ents.Create("euston_road")
	euston_road:SetPos(Vector(property[8].entity:GetPos().x, property[8].entity:GetPos().y + 220, property[8].entity:GetPos().z + 20))
	euston_road:SetAngles(Angle(90, 90, 180))
 	euston_road:Spawn()
	
	local pentonville_road = ents.Create("pentonville_road")
	pentonville_road:SetPos(Vector(property[9].entity:GetPos().x, property[9].entity:GetPos().y + 220, property[9].entity:GetPos().z + 20))
	pentonville_road:SetAngles(Angle(90, 90, 180))
 	pentonville_road:Spawn()
	
	local pall_mall = ents.Create("pall_mall")
	pall_mall:SetPos(Vector(property[11].entity:GetPos().x + 220, property[11].entity:GetPos().y, property[11].entity:GetPos().z + 20))
	pall_mall:SetAngles(Angle(90, 0, 180))
 	pall_mall:Spawn()
	
	local electric_company = ents.Create("electric_company")
	electric_company:SetPos(Vector(property[12].entity:GetPos().x + 220, property[12].entity:GetPos().y, property[12].entity:GetPos().z + 20))
	electric_company:SetAngles(Angle(90, 0, 180))
 	electric_company:Spawn()
	
	local whitehall = ents.Create("whitehall")
	whitehall:SetPos(Vector(property[13].entity:GetPos().x + 220, property[13].entity:GetPos().y, property[13].entity:GetPos().z + 20))
	whitehall:SetAngles(Angle(90, 0, 180))
 	whitehall:Spawn()
	
	local northumberland_avenue = ents.Create("northumberland_avenue")
	northumberland_avenue:SetPos(Vector(property[14].entity:GetPos().x + 220, property[14].entity:GetPos().y, property[14].entity:GetPos().z + 20))
	northumberland_avenue:SetAngles(Angle(90, 0, 180))
 	northumberland_avenue:Spawn()
	
	local marylebone_station = ents.Create("marylebone_station")
	marylebone_station:SetPos(Vector(property[15].entity:GetPos().x + 220, property[15].entity:GetPos().y, property[15].entity:GetPos().z + 20))
	marylebone_station:SetAngles(Angle(90, 0, 180))
 	marylebone_station:Spawn()
	
	local bow_street = ents.Create("bow_street")
	bow_street:SetPos(Vector(property[16].entity:GetPos().x + 220, property[16].entity:GetPos().y, property[16].entity:GetPos().z + 20))
	bow_street:SetAngles(Angle(90, 0, 180))
 	bow_street:Spawn()
	
	local marlborough_street = ents.Create("marlborough_street")
	marlborough_street:SetPos(Vector(property[18].entity:GetPos().x + 220, property[18].entity:GetPos().y, property[18].entity:GetPos().z + 20))
	marlborough_street:SetAngles(Angle(90, 0, 180))
 	marlborough_street:Spawn()
	
	local vine_street = ents.Create("vine_street")
	vine_street:SetPos(Vector(property[19].entity:GetPos().x + 220, property[19].entity:GetPos().y, property[19].entity:GetPos().z + 20))
	vine_street:SetAngles(Angle(90, 0, 180))
 	vine_street:Spawn()
	
	local the_strand = ents.Create("the_strand")
	the_strand:SetPos(Vector(property[21].entity:GetPos().x, property[21].entity:GetPos().y - 220, property[21].entity:GetPos().z + 20))
	the_strand:SetAngles(Angle(90, -90, 180))
 	the_strand:Spawn()
	
	local fleet_street = ents.Create("fleet_street")
	fleet_street:SetPos(Vector(property[23].entity:GetPos().x, property[23].entity:GetPos().y - 220, property[23].entity:GetPos().z + 20))
	fleet_street:SetAngles(Angle(90, -90, 180))
 	fleet_street:Spawn()
	
	local trafalgar_square = ents.Create("trafalgar_square")
	trafalgar_square:SetPos(Vector(property[24].entity:GetPos().x, property[24].entity:GetPos().y - 220, property[24].entity:GetPos().z + 20))
	trafalgar_square:SetAngles(Angle(90, -90, 180))
 	trafalgar_square:Spawn()
	
	local fenchurch_st_station = ents.Create("fenchurch_st_station")
	fenchurch_st_station:SetPos(Vector(property[25].entity:GetPos().x, property[25].entity:GetPos().y - 220, property[25].entity:GetPos().z + 20))
	fenchurch_st_station:SetAngles(Angle(90, -90, 180))
 	fenchurch_st_station:Spawn()
	
	local leicester_square = ents.Create("leicester_square")
	leicester_square:SetPos(Vector(property[26].entity:GetPos().x, property[26].entity:GetPos().y - 220, property[26].entity:GetPos().z + 20))
	leicester_square:SetAngles(Angle(90, -90, 180))
 	leicester_square:Spawn()
	
	local coventry_street = ents.Create("coventry_street")
	coventry_street:SetPos(Vector(property[27].entity:GetPos().x, property[27].entity:GetPos().y - 220, property[26].entity:GetPos().z + 20))
	coventry_street:SetAngles(Angle(90, -90, 180))
 	coventry_street:Spawn()
	
	local water_works = ents.Create("water_works")
	water_works:SetPos(Vector(property[28].entity:GetPos().x, property[28].entity:GetPos().y - 220, property[28].entity:GetPos().z + 20))
	water_works:SetAngles(Angle(90, -90, 180))
 	water_works:Spawn()
	
	local piccadilly = ents.Create("piccadilly")
	piccadilly:SetPos(Vector(property[29].entity:GetPos().x, property[29].entity:GetPos().y - 220, property[29].entity:GetPos().z + 20))
	piccadilly:SetAngles(Angle(90, -90, 180))
 	piccadilly:Spawn()
	
	local regent_street = ents.Create("regent_street")
	regent_street:SetPos(Vector(property[31].entity:GetPos().x - 220, property[31].entity:GetPos().y, property[31].entity:GetPos().z + 20))
	regent_street:SetAngles(Angle(90, 180, 180))
 	regent_street:Spawn()
	
	local oxford_street = ents.Create("oxford_street")
	oxford_street:SetPos(Vector(property[32].entity:GetPos().x - 220, property[32].entity:GetPos().y, property[32].entity:GetPos().z + 20))
	oxford_street:SetAngles(Angle(90, 180, 180))
 	oxford_street:Spawn()
	
	local bond_street = ents.Create("bond_street")
	bond_street:SetPos(Vector(property[34].entity:GetPos().x - 220, property[34].entity:GetPos().y, property[34].entity:GetPos().z + 20))
	bond_street:SetAngles(Angle(90, 180, 180))
 	bond_street:Spawn()
	
	local liverpool_street_station = ents.Create("liverpool_street_station")
	liverpool_street_station:SetPos(Vector(property[35].entity:GetPos().x - 220, property[35].entity:GetPos().y, property[35].entity:GetPos().z + 20))
	liverpool_street_station:SetAngles(Angle(90, 180, 180))
 	liverpool_street_station:Spawn()
	
	local park_lane = ents.Create("park_lane")
	park_lane:SetPos(Vector(property[37].entity:GetPos().x - 220, property[37].entity:GetPos().y, property[37].entity:GetPos().z + 20))
	park_lane:SetAngles(Angle(90, 180, 180))
 	park_lane:Spawn()
	
	local mayfair = ents.Create("mayfair")
	mayfair:SetPos(Vector(property[39].entity:GetPos().x - 220, property[39].entity:GetPos().y, property[39].entity:GetPos().z + 20))
	mayfair:SetAngles(Angle(90, 180, 180))
 	mayfair:Spawn()

end
hook.Add("InitPostEntity", "SpawnScoreboard", SpawnScoreboard)