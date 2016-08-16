include("shared.lua")
include("player.lua")
include("money.lua")
include("dice.lua")
include("team.lua")
include("spawn.lua")
include("community.lua")
include("chance.lua")
include("turn.lua")

include("sh_boards.lua")
include("sh_board_gb.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_nametags.lua")
AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("money.lua")
AddCSLuaFile("cl_properties.lua")

--AddCSLuaFile("team.lua")
AddCSLuaFile("sh_boards.lua")
AddCSLuaFile("sh_board_gb.lua")
--AddCSLuaFile("spawn.lua")
--AddCSLuaFile("community.lua")
--AddCSLuaFile("chance.lua")
--AddCSLuaFile("turn.lua")

MONEY_STARTAMOUNT = 1500 --Can be changed to your starting amount

function GM:ShowHelp( ply ) -- F1 is pressed.
    ply:ConCommand( "team_menu" )
end

function GM:ShowTeam( ply ) -- F2 is pressed.
    ply:ConCommand( "control_menu" )
end

function GM:PlayerInitialSpawn( ply )
	ply:ConCommand( "team_menu" )
	ply:SetGamemodeTeam( 0 )
	
	ply:SetMoney( MONEY_STARTAMOUNT )
	
end
 
function GM:PlayerSpawn( ply )
	ply:SetModel("models/player/group01/male_07.mdl")
	ply:GiveGamemodeWeapons()
	GAMEMODE:SetPlayerSpeed(ply, 500, 750)
end

function GM:SpawnMenuEnabled()
	return true	
end

function SpawnBoardPieces()

	for k,v in ipairs( ents.GetAll() ) do
		for i = -1,39 do 	
			if string.lower( v:GetName() ) == property[i].name then
				property[i].entity = v
			end
		end  
	end
	
	local start_x_pos = -680
	--These are the initial places on the board on the GO sign when the gamemode starts up
	blue = ents.Create("prop_physics")
	blue:SetName("bluepiece")
	blue:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	blue:SetPos(Vector(start_x_pos - 60,1088,525))
	blue:SetColor(Color(0, 0, 255, 255))
	blue:SetMoveType(MOVETYPE_FLY)
	
	green = ents.Create("prop_physics")
	green:SetName("greenpiece")
	green:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	green:SetPos(Vector(start_x_pos - 30,1088,525))
	green:SetColor(Color(0, 255, 0, 255))
	green:SetMoveType(MOVETYPE_FLY)
	
	yellow = ents.Create("prop_physics")
	yellow:SetName("yellowpiece")
	yellow:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	yellow:SetPos(Vector(start_x_pos,1088,525))
	yellow:SetColor(Color(255, 255, 0, 255))
	yellow:SetMoveType(MOVETYPE_FLY)
	
	red = ents.Create("prop_physics")
	red:SetName("redpiece")
	red:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	red:SetPos(Vector(start_x_pos + 30,1088,525))
	red:SetColor(Color(255, 0, 0, 255))
	red:SetMoveType(MOVETYPE_FLY)
	
	-- STARTING POSITIONS
	positions={};
	
	positions[1] = 0 //red
	positions[2] = 0 //blue
	positions[3] = 0 //green
	positions[4] = 0 //yellow
end
hook.Add( "InitPostEntity", "SpawnBoardPieces", SpawnBoardPieces)