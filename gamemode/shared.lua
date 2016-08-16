GM.Name = "Gmodopoly"
GM.Author = "greenarrow and Bentech"
GM.Email = "Good luck with that"
GM.Website = "None"

function GM:Initialize()
	self.BaseClass.Initialize( self )
end


----------Colors---------
local clrTable = {} //Color table
clrTable["Green"] = Color(0, 255, 0, 255)
clrTable["Blue"] = Color(0, 0, 255, 255)
clrTable["Red"] = Color(255, 0, 0, 255)
clrTable["Yellow"] = Color(255, 255, 0, 255)
-------------------------

 
team.SetUp( 1, "Team 1", clrTable["Red"] ) 
team.SetUp( 2, "Team 2", clrTable["Blue"] ) 
team.SetUp( 3, "Team 3", clrTable["Green"] ) 
team.SetUp( 4, "Team 4", clrTable["Yellow"] )
