
--OVERALL GAMEMODE.STAGES--
--PICK PLAYER
NOT_STARTED = -1
WAITING_FOR_PLAYERS = 0
GAME_STARTING = 1
PICK_RANDOM_START = 2
ROLL_DICE_TO_START = 3
PICK_HIGHEST = 4
--START TURN
ROLL_DICE = 5
DICE_LAND = 6
LAND_BOARD = 7
GOTO_JAIL = 8
BUY_YES_NO = 9
AUCTION = 10
TRADE = 11
CHECK_DOUBLE = 12
MANAGE_PROPERTY_STAGE = 13
NA = 14
END_TURN = 15
END_GAME = 16
--END TURN

function initMonopoly()


	GAMEMODE.GamePlayers = {}
	GAMEMODE.STAGE = NOT_STARTED
	GAMEMODE.currentPlayer = false
	currentPlayer = false
	first = true
	--Play some fancy music hehe
	BroadcastLua('surface.PlaySound("music/HL2_song23_SuitSong3.mp3")')

	-- MOVE EVERYONE TO STARTING POSITIONS
	
	positions[1] = 0
	positions[2] = 0
	positions[3] = 0
	positions[4] = 0

	GamePlayers = {}
	
	v = property[0].entity
	 
	red:SetPos(Vector(v:GetPos().x, v:GetPos().y + 70, v:GetPos().z + 15))
	blue:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y + 70, v:GetPos().z + 15))
	green:SetPos(Vector(v:GetPos().x, v:GetPos().y + 95, v:GetPos().z + 15))
	yellow:SetPos(Vector(v:GetPos().x + 25, v:GetPos().y + 95, v:GetPos().z + 15))
	
	-- Reset all properties
	for k,v in ipairs( ents.GetAll() ) do
		for i = -1,39 do 	
			if string.lower( v:GetName() ) == property[i].name then
				property[i].Owner = nil
				v:SetColor(Color(255,255,255,255)) 

			end
		end  
	end
	
	-- SET EVERYONES CASH to 1500
	for _,pl in pairs(player.GetAll())do
		pl:ChatPrint("A new game is starting...")
		pl:SetMoney(1500)
	end

	nextStage()
	
end

function printAll(message)
	for _,pl in pairs(player.GetAll())do
		pl:ChatPrint(message)
	end
end

function sendGameMessage(message)
	for pl,_ in pairs(GamePlayers)do
		pl:ChatPrint(message)
	end
end

util.AddNetworkString( "roll_dice_menu" )

function getnextPlayer()
	if(table.Count(GamePlayers) == 1)then
		print("Error only 1 player cant find next player!");
		return false;
	end

	if(currentPlayer == false)then
		local plstart = math.random(1,table.maxn(GamePlayers))
		local i = 1
		for pl,_ in pairs(GamePlayers)do
			if(i == plstart)then
				currentPlayer = pl
				return currentPlayer
			end
			i=i+1
		end
	end

	local found = false;
	for pl,_ in pairs(GamePlayers)do
		if(found)then
			currentPlayer = pl
			return pl;
		end
		if(currentPlayer == pl)then
			found = true;
		end
	end

	return table.GetFirstKey(GamePlayers);
	
end

function nextStage()
	GAMEMODE.STAGE = GAMEMODE.STAGE + 1;
	processStage()
end

function processStage()

	

	if(GAMEMODE.STAGE > END_GAME)then
		GAMEMODE.STAGE = NOT_STARTED;
	end

	if(GAMEMODE.STAGE == NOT_STARTED)then
		printAll("The Game has ended");
	elseif(GAMEMODE.STAGE == WAITING_FOR_PLAYERS)then
		printAll("A game is starting, please join");
		timer.Simple( 6, function()
			nextStage()
		end)
	elseif(GAMEMODE.STAGE == GAME_STARTING)then
			
		for _,pl in pairs(player.GetAll())do--Check for players in area or ready
			GamePlayers[pl] = 0;
		end

		nextStage()

		
	elseif(GAMEMODE.STAGE == PICK_RANDOM_START)then
		sendGameMessage("The game has started, dices will roll to decide who goes first");
		
		nextStage()
	elseif(GAMEMODE.STAGE == ROLL_DICE_TO_START)then

		highestNumber = 0;
		startPlayer = false;
		higestPlayer = false;
		timer.Create( "pickaplayertostart", 0.55, table.Count(GamePlayers) + 1, function()
			local pl = getnextPlayer();
			print(pl)
			if(pl != false)then
				if(startPlayer == false || startPlayer != pl)then
					if(startPlayer == false)then
						startPlayer = pl
					end
					local roll = math.random(4,256)
					math.randomseed( os.time() + pl:UserID() )
					if(highestNumber < roll)then
					   highestNumber = roll
					   higestPlayer = pl
					end
				
					sendGameMessage(pl:Nick().." rolled a "..math.Round(math.sqrt(roll)))
				else
					nextStage()
					timer.Stop( "pickaplayertostart" )
				end
			end
			
		end )
		--randomplayer:ChatPrint("Roll the dice, Bitch..")
		--randomplayer:Roll();
	elseif(GAMEMODE.STAGE == PICK_HIGHEST)then
		currentPlayer = higestPlayer
		sendGameMessage(higestPlayer:Nick() .. " rolled the higest number and now can start first!")

		timer.Simple( 2, function()
			nextStage()
		end)
		
	elseif(GAMEMODE.STAGE == ROLL_DICE)then
		local pl = false
		if(first == true)then
			pl = currentPlayer
			first = false
		else
			pl = getnextPlayer()
			sendGameMessage("It is " .. pl:Nick() .. " turn!")
		end

		currentPlayer = pl

		pl:ConCommand( "roll_dice_menu open")
		--net.Start( "roll_dice_menu" )
		--	net.WriteBit( true )
		--net.Send(pl)
		timer.Create("rolltimer", 7, 1, function()
			if(GAMEMODE.STAGE == ROLL_DICE)then
				sendGameMessage(currentPlayer:Nick() .. " has rolled automatically, hurry up next time!")
				nextStage()
			end
		end)
	elseif(GAMEMODE.STAGE == DICE_LAND)then
		sendGameMessage("roll " .. currentPlayer:Nick() .. " roll!")
		timer.Destroy("rolltimer")
		currentPlayer:ConCommand( "roll_dice_menu close")
		--net.Start( "roll_dice_menu" )
		--	net.WriteBit( false )
		--net.Send(pl)
		
		currentPlayer:Roll()
	elseif(GAMEMODE.STAGE == LAND_BOARD)then

	elseif(GAMEMODE.STAGE == GOTO_JAIL)then
		currentPlayer:GoToJail() 
		sendGameMessage(currentPlayer:Nick() .. " has been sent to jail!")
		timer.Simple( 3, function()
			GAMEMODE.STAGE = END_TURN
		processStage()
		end)

		
	elseif(GAMEMODE.STAGE == BUY_YES_NO)then
		sendGameMessage(currentPlayer:Nick() .. " can choose to buy!")
		currentPlayer:ConCommand( "buy_property_menu "..currentPlayer:GetPosition(currentPlayer:Team()))
		timer.Create("propertypass", 20, 1, function()
			if(GAMEMODE.STAGE == BUY_YES_NO)then
				GAMEMODE.STAGE = END_TURN
				processStage()
			end
		end)
	elseif(GAMEMODE.STAGE == AUCTION)then
	
		sendGameMessage(currentPlayer:Nick() .. " is actioning!")
		GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
		processStage()
	elseif(GAMEMODE.STAGE == TRADE)then
	
		sendGameMessage(currentPlayer:Nick() .. " can trade!")
		GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
		processStage()
	elseif(GAMEMODE.STAGE == CHECK_DOUBLE)then

		sendGameMessage(currentPlayer:Nick() .. " has doubles!")
		GAMEMODE.STAGE = MANAGE_PROPERTY_STAGE
		processStage()
	elseif(GAMEMODE.STAGE == MANAGE_PROPERTY_STAGE)then
	
		sendGameMessage(currentPlayer:Nick() .. " is managing!")
		GAMEMODE.STAGE = END_TURN
		processStage()
	elseif(GAMEMODE.STAGE == END_TURN)then
		--CHECK GAME END

		timer.Destroy("propertypass")
		GAMEMODE.STAGE = ROLL_DICE--auto next player
		processStage()
	end

end

function StartGame()
	initMonopoly()
end
concommand.Add( "init_game", StartGame )