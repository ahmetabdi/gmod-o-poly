local meta = FindMetaTable("Player") --Get the meta table of player

community = {
	[1] = { ["description"]="INCOME TAX REFUND COLLECT 20" },
	[2] = { ["description"]="IT IS YOUR BIRTHDAY COLLECT 10 FROM EACH PLAYER" },
	[3] = { ["description"]="DOCTOR'S FEE PAY 50" },
	[4] = { ["description"]="YOU INHERIT 100" },
	[5] = { ["description"]="RECEIVE INTREST ON 7% PREFERENCE SHARE 25" },
	[6] = { ["description"]="ANNUITY MATURES COLLECT 100" },
	[7] = { ["description"]="GET OUT OF JAIL FREE - This card may be kept until needed or sold" },
	[8] = { ["description"]="From sale of stock you get 50" },
	[9] = { ["description"]="ADVANCE TO GO" },
	[10] = { ["description"]="GO BACK TO OLD KENT ROAD" },
	[11] = { ["description"]="BANK ERROR IN YOUR FAVOUR COLLECT 200" },
	[12] = { ["description"]="PAY YOUR INSURANCE PREMIUM 50" },
	[13] = { ["description"]="PAY A 10 FINE OR TAKE A CHANCE" },
	[14] = { ["description"]="PAY HOSPITAL 100" },
	[15] = { ["description"]="YOU HAVE WON SECOND PRIZE IN A BEAUTY CONTEST COLLECT 10" },
	[16] = { ["description"]="GO TO JAIL - MOVE DIRECTLY TO JAIL - DO NOT PASS GO - DO NOT COLLECT 200" }
	}

function meta:GiveCommunityCard()
	local random_card = math.random(1,16)
	local locateplayers = player.GetAll( )
		
	for i = 1, table.getn( locateplayers ) do
		locateplayers[i]:ChatPrint( community[random_card].description )
	end
	
	if random_card == 1 then
		self:AddMoney(20)
	end
	if random_card == 2 then
		
	end
	if random_card == 3 then
		self:TakeMoney(50)
	end
	if random_card == 4 then
		self:AddMoney(100)
	end
	if random_card == 5 then
		self:AddMoney(25)
	end
	if random_card == 6 then
		self:AddMoney(100)
	end
	if random_card == 7 then
		--GET OUT OF JAIL FREE CARD
	end
	if random_card == 8 then
		self:AddMoney(50)
	end
	if random_card == 9 then
		self:AddMoney(200)
		self:SetPosition(self:Team(), 0)
	end
	if random_card == 10 then
		--Set position X (Old Kent Road)
	end
	if random_card == 11 then
		self:AddMoney(200)
	end
	if random_card == 12 then
		self:TakeMoney(50)
	end
	if random_card == 13 then
		--PAY 10 or take a chance
	end
	if random_card == 14 then
		self:TakeMoney(100)
	end
	if random_card == 15 then
		self:AddMoney(10)
	end
	if random_card == 16 then
		--send to jail
	end
end