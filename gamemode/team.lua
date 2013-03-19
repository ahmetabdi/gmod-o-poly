function Team1( ply )
	ply:UnSpectate()
	ply:SetGamemodeTeam( 1 )
	ply:Spawn()
	ply:ChatPrint("Your on Team 1.")
end
concommand.Add( "team_1", Team1 )

function Team2( ply )
	ply:UnSpectate()
	ply:SetGamemodeTeam( 2 )
	ply:Spawn()
	ply:ChatPrint("Your on Team 2.")
end
concommand.Add( "team_2", Team2 )

function Team3( ply )
	ply:UnSpectate()
	ply:SetGamemodeTeam( 3 )
	ply:Spawn()
	ply:ChatPrint("Your on Team 3.")
end
concommand.Add( "team_3", Team3 )

function Team4( ply )
	ply:UnSpectate()
	ply:SetGamemodeTeam( 4 )
	ply:Spawn()
	ply:ChatPrint("Your on Team 4.")
end
concommand.Add( "team_4", Team4 )

function LeaveTeam( ply )
	ply:SetGamemodeTeam( 0 )
	ply:Spawn()
	ply:ChatPrint("Your now spectating.")
end
concommand.Add( "leave_team", LeaveTeam )

function Position( ply )
	pos = ply:GetPos()
	print(pos)
end
concommand.Add( "position", Position )