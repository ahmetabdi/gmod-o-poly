local meta = FindMetaTable("Player") --Get the meta table of player
 
function meta:AddMoney(amount)
	local current_cash = self:GetMoney()
	self:SetMoney( current_cash + amount )
end
 
function meta:SetMoney(amount)
	self:SetNetworkedInt( "Money", amount )
	--self:SaveMoney()
end
 
 
function meta:TakeMoney(amount)
   --Add money function here
   self:AddMoney(-amount)
end
 
function meta:GetMoney()
	return self:GetNetworkedInt( "Money" )
end