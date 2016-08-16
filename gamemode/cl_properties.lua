hook.Add( "InitPostEntity", "MapStartTrigger",function ()

end)
	print("initpost")
	for k,v in ipairs( ents.GetAll() ) do
		for i = -1,39 do 	
			if string.lower( v:GetClass() ) ==  string.Replace(property[i].name, " ", "_") then
				property[i].entity = v
			end
		end  
	end
	
for k,v in pairs(ents.FindByClass( "class C_BaseFlex" ))do

	v:Remove()

end

stuff = {}

for i=1,5 do

for k,v in pairs(property)do
	if(v.entity and v.entity != NULL)then
		for b=1,4 do
		local cube = ClientsideModel("models/hunter/blocks/cube05x05x05.mdl", 
						RENDERGROUP_OPAQUE)
						cube:SetPos(v.entity:GetPos() + Vector(60-(b*30),0,(i*50)-50))
						cube.pos = cube:GetPos()
						cube.b = b
						cube.i = i
						cube.topos = cube:GetPos()
						cube:SetColor(255,255,0,255)
						table.insert(stuff, cube)
						end
						
		end
	end
end

i = 1
ii=1
ib=1
timer.Create( "stuff", 0.001, 0, function()


	for k,v in pairs(stuff)do
		if(ib > 4)then
			ib = 1
		end
		
		if(ii > 11)then
			ii = 1
		end
		if(ib == v.b || ii == v.i)then
			v.topos = v.pos + Vector(500 *math.cos(i ), 500 *math.sin(i ),0)
		end
	end


	i = i+1
end)

timer.Create( "stuff2", 0.1, 0, function()

	ib = ib + 1
			ii = ii + 1
end)

hook.Add( "Think", "thinky",function ()
	for k,v in pairs(stuff)do
		v:SetPos(LerpVector(0.05, v:GetPos(), v.topos))
	end
end)