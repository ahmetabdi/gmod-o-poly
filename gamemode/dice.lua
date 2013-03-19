local meta = FindMetaTable("Player") --Get the meta table of player
 
function RollTheDice( ply )
	if(currentPlayer == ply)then
		if(GAMEMODE.STAGE == ROLL_DICE)then
			sendGameMessage(currentPlayer:Nick() .. " has rolled the dice")
			nextStage()
		end
	end
end
concommand.Add( "roll", RollTheDice )

function BuyProperty( ply )
	if(currentPlayer == ply)then
		if(GAMEMODE.STAGE == BUY_YES_NO)then
			ply:BuyProperty()
		end
	end
end
concommand.Add( "buy", BuyProperty )

function Auction( ply )
	ply:Auction()
end
concommand.Add( "auction", Auction )

function EndTurn( ply )
	ply:EndTurn()
end
concommand.Add( "end_turn", EndTurn )

function meta:EndTurn()

end

function meta:Auction()

end

function meta:MovePosition()

	local v = property[self:GetPosition(self:Team())].entity
	
	if self:GetPosition(self:Team()) == -1 then
		if current_colour == red then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y + 25, v:GetPos().z + 15)) end
		if current_colour == blue then current_colour:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y + 25, v:GetPos().z + 15)) end
		if current_colour == green then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y, v:GetPos().z + 15)) end
		if current_colour == yellow then current_colour:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y, v:GetPos().z + 15)) end
	end
	
	if self:GetPosition(self:Team()) > -1 then
		if current_colour == red then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y + 70, v:GetPos().z + 15)) end
		if current_colour == blue then current_colour:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y + 70, v:GetPos().z + 15)) end
		if current_colour == green then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y + 95, v:GetPos().z + 15)) end
		if current_colour == yellow then current_colour:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y + 95, v:GetPos().z + 15)) end
	end
	
	if self:GetPosition(self:Team()) > 10 then
		if current_colour == red then current_colour:SetPos(Vector(v:GetPos().x + 70, v:GetPos().y, v:GetPos().z + 15)) end
		if current_colour == blue then current_colour:SetPos(Vector(v:GetPos().x + 70, v:GetPos().y + 25, v:GetPos().z + 15)) end
		if current_colour == green then current_colour:SetPos(Vector(v:GetPos().x + 95, v:GetPos().y, v:GetPos().z + 15)) end
		if current_colour == yellow then current_colour:SetPos(Vector(v:GetPos().x + 95, v:GetPos().y + 25, v:GetPos().z + 15)) end
	end
	
	if self:GetPosition(self:Team()) > 20 then
		if current_colour == red then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y - 70, v:GetPos().z + 15)) end
		if current_colour == blue then current_colour:SetPos(Vector(v:GetPos().x - 25, v:GetPos().y - 70, v:GetPos().z + 15)) end
		if current_colour == green then current_colour:SetPos(Vector(v:GetPos().x, v:GetPos().y - 95, v:GetPos().z + 15)) end
		if current_colour == yellow then current_colour:SetPos(Vector(v:GetPos().x - 25, v:GetPos().y - 95, v:GetPos().z + 15)) end
	end
	
	if self:GetPosition(self:Team()) > 30 then
		if current_colour == red then current_colour:SetPos(Vector(v:GetPos().x - 70, v:GetPos().y, v:GetPos().z + 15)) end
		if current_colour == blue then current_colour:SetPos(Vector(v:GetPos().x - 70, v:GetPos().y - 25, v:GetPos().z + 15)) end
		if current_colour == green then current_colour:SetPos(Vector(v:GetPos().x - 95, v:GetPos().y, v:GetPos().z + 15)) end
		if current_colour == yellow then current_colour:SetPos(Vector(v:GetPos().x - 95, v:GetPos().y - 25, v:GetPos().z + 15)) end
	end

end

function meta:BuyProperty()
	local amount = property[self:GetPosition(self:Team())].cost
	local property_name = property[self:GetPosition(self:Team())].PrintName
	local owned_by = property[self:GetPosition(self:Team())].Owner
	
	if amount == nil then
		self:ChatPrint("You can't buy that.")
	elseif owned_by != nil && owned_by != self then
		self:ChatPrint("That property is already owned, try trading with the owner - " .. owned_by:Nick())
	elseif owned_by == self then
		self:ChatPrint("You already own this property")
	else
		self:TakeMoney(amount)
		property[self:GetPosition(self:Team())].Owner = self
		
		local locateplayers = player.GetAll( )
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( self:Nick() .. " bought " ..  property_name .. " for " .. amount .. ".\n" )
		end
		
		for k,v in ipairs( ents.GetAll() ) do
			if string.lower( v:GetName() ) == property[self:GetPosition(self:Team())].name then
				v:SetColor(team.GetColor(self:Team())) 
			end
		end
	end
	GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
	processStage()

end

function meta:GetPosition(team)
	return positions[team]
end

function meta:SetPosition(team, position)
	positions[team] = position
	return positions[team]
end

function meta:PrintPosition()
	property_name = property[self:GetPosition(self:Team())].PrintName
	local locateplayers = player.GetAll( )
		for i = 1, table.getn( locateplayers ) do
		locateplayers[i]:ChatPrint( self:Nick() .. " landed on " .. property_name .. ".\n" )
	end
end

function meta:GoToJail()
	self.GoesInJail = 0
	BroadcastLua('surface.PlaySound("npc/metropolice/vo/criminaltrespass63.wav")')
	timer.Create( "SecondSoundClip", 1.4, 1, function()
		BroadcastLua('surface.PlaySound("npc/metropolice/vo/cprequestsallunitsreportin.wav")')
	end)
	
	timer.Create( "MoveToInJailTimer", 5, 1, function() 
		self:SetPosition(self:Team(), -1)
		self:MovePosition()
	end)
	
end

function meta:PassGo()
	self:AddMoney(200)
	self:ChatPrint("You Receive 200 for passing GO")
end

function meta:Roll()

	local playername = self:GetName()
	local firstroll = math.random(1,6)
	local secondroll = math.random(1,6)
	local sum = firstroll + secondroll
	GAMEMODE.STAGE = END_TURN
	--The Roll
	if sum == 8 || sum == 11 then
		roll = ( playername .. " rolled an " .. sum .. " (" .. firstroll .. " and " .. secondroll .. ")" )
	else
		roll = ( playername .. " rolled a " .. sum .. " (" .. firstroll .. " and " .. secondroll .. ")" )
	end

	sendGameMessage(roll)

	--Double Notification
	if firstroll == secondroll then
		sendGameMessage("Rolled a double! You can roll again.")

	end
	
	local current_team = self:Team()
	local position = 0
	--Set the teams position
	if current_team == 1 then
		current_colour = red
	elseif current_team == 2 then
		current_colour = blue
	elseif current_team == 3 then
		current_colour = green
	elseif current_team == 4 then
		current_colour = yellow
	end

	positions[current_team] = positions[current_team] + sum
	--Land on GO
	if positions[current_team] == 40 then 
		positions[current_team] = 0 
		self:PassGo()
	end
	--Reset when they go around the board
	if positions[current_team] > 0 && positions[current_team] > 39 then 
		positions[current_team] = 0 + sum - 1 
		self:PassGo()
	end 
	--Go to jail
	if positions[current_team] == 30 then 

		GAMEMODE.STAGE = GOTO_JAIL
	end
	--Chance
	if positions[current_team] == 7 || positions[current_team] == 22 || positions[current_team] == 36 then
		self:GiveChanceCard()
		GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
	end
	--Community Chest
	if positions[current_team] == 2 || positions[current_team] == 17 || positions[current_team] == 33 then
		self:GiveCommunityCard()
		
		GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
	end
	--Print the landing position to everyone
	self:PrintPosition()
	
	--If the owner is owned by someone AND the owner is not yourself we want to deduct money here
	--Need to add a check when the player disconnects - remove all the property they own and change its colour to white
	if property[self:GetPosition(self:Team())].Owner != nil && property[self:GetPosition(self:Team())].Owner != self then
		if(property[self:GetPosition(self:Team())].rent != nil)then
			local locateplayers = player.GetAll( )
			for i = 1, table.getn( locateplayers ) do

			locateplayers[i]:ChatPrint( self:Nick() .. " landed on " .. property[self:GetPosition(self:Team())].Owner:Nick() .. "'s property, and pays him " .. property[self:GetPosition(self:Team())].rent )
			end
			self:TakeMoney(property[self:GetPosition(self:Team())].rent)
			property[self:GetPosition(self:Team())].Owner:AddMoney(property[self:GetPosition(self:Team())].rent)
		else
			--station rents
		end
	else
		--not owned
		if(property[self:GetPosition(self:Team())].entity == nil)then
			GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
		else
			GAMEMODE.STAGE = BUY_YES_NO
		end

	end
	--Move there position
	self:MovePosition()

	processStage()
end