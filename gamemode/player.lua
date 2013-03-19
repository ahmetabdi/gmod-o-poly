local ply = FindMetaTable("Player")

local teams = {}

teams[0] = {name = "None", color = Vector( .2, .2, .2 ), weapons = {"weapon_physgun"} }
teams[1] = {name = "Red", color = Vector( 1.0, .2, .2 ), weapons = {"weapon_physgun"} }
teams[2] = {name = "Blue", color = Vector( .2, .2, 1.0 ), weapons = {"weapon_physgun"} }
teams[3] = {name = "Green", color = Vector( .2, 1.0, .2 ), weapons = {"weapon_physgun"} }
teams[4] = {name = "Yellow", color = Vector( 2.0, 2.0, .2 ), weapons = {"weapon_physgun"} }

function ply:SetGamemodeTeam( n )
	if not teams[n] then return end
	
	self:SetTeam( n )
	
	self:SetPlayerColor( teams[n].color )
	
	self:GiveGamemodeWeapons()
	
	return true
end

function ply:GiveGamemodeWeapons()
	local n = self:Team()
	self:StripWeapons()
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
	end
end