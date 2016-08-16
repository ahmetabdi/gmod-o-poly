
for k,v in ipairs( ents.GetAll() ) do
	for i = -1,39 do 	
		if string.lower( v:GetClass() ) ==  string.Replace(Boards["GB"].properties[i].name, " ", "_") then
			Boards["GB"].properties[i].entity = v
		end
	end  
end

for k,v in pairs(ents.FindByClass( "class C_BaseFlex" ))do

	v:Remove()

end



local cube = ClientsideModel("models/hunter/blocks/cube05x05x05.mdl", 
	RENDERGROUP_OPAQUE)
cube:SetColor(255,255,0,255)

cur = 0

timer.Create( "stuff2", 0.5, 0, function()

	if(cur >= 39)then
		cur = 0;
	else
		cur = cur + 1
	end
	local v = Boards["GB"].properties[cur]
	if(v.entity and v.entity != NULL)then
		cube:SetPos(v.entity:GetPos())
	end
end)