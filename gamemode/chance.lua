local meta = FindMetaTable("Player") --Get the meta table of player

chance = {
	[1] = { ["description"]="Advance to Pall Mall - If you pass go collect 200" },
	[2] = { ["description"]="Make general repairs on all of your buildings - For each house pay 25 - For each hotel pay 100" },
	[3] = { ["description"]="Speeding Fine 15" },
	[4] = { ["description"]="Pay school fees of 150" },
	[5] = { ["description"]="Go back three spaces" },
	[6] = { ["description"]="You are assessed for street repairs - 40 per house - 115 per hotel" },
	[7] = { ["description"]="You have won a crossword competition collect 100" },
	[8] = { ["description"]="Your building loan matures receive 150" },
	[9] = { ["description"]="Advance to mayfair" },
	[10] = { ["description"]="Drunk in charge Fine 20" },
	[11] = { ["description"]="Advance to GO" },
	[12] = { ["description"]="Advance to trafalgar square - If you pass GO collect 200" },
	[13] = { ["description"]="Get out of jail free - This can be kept until needed or sold" },
	[14] = { ["description"]="Take a trip to marylebone station and if you pass GO collect 200" },
	[15] = { ["description"]="GO TO JAIL - MOVE DIRECTLY TO JAIL - DO NOT PASS GO - DO NOT COLLECT 200" },
	[16] = { ["description"]="BANK PAYS YOU DIVIDEND OF 50" }
	}

function meta:GiveChanceCard()
	local random_card = math.random(1,16)
	local locateplayers = player.GetAll( )
		
	for i = 1, table.getn( locateplayers ) do
		locateplayers[i]:ChatPrint( chance[random_card].description )
	end

	if random_card == 1 then
		--move to pall mall
	end
	if random_card == 2 then
		
	end
	if random_card == 3 then
		self:TakeMoney(15)
	end
	if random_card == 4 then
		self:TakeMoney(150)
	end
	if random_card == 5 then
		--back three spaces
	end
	if random_card == 6 then
		
	end
	if random_card == 7 then
		self:AddMoney(100)
	end
	if random_card == 8 then
		self:AddMoney(150)
	end
	if random_card == 9 then
		--move to mayfair
	end
	if random_card == 10 then
		self:TakeMoney(20)
	end
	if random_card == 11 then
		--advance to go
	end
	if random_card == 12 then
		--advance to travalgar square
	end
	if random_card == 13 then
		--Get out of jail free
	end
	if random_card == 14 then
		--marylebone station
	end
	if random_card == 15 then
		--go to jail
	end
	if random_card == 16 then
		self:AddMoney(50)
	end
end