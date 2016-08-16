
local properties = {
	[0] = { name="pass_go", PrintName="GO"},
	[1] = { name="old_kent_road", colour=Color(139,69,19,255), entity=NULL, cost=60, rent=2, houses={ [1]=10, [2]=30, [3]=90, [4]=160}, hotel=250, cost_to_build=50, mortgage=30, PrintName="Old Kent Road", Owner=nil },
	[2] = { name="community_chest_1", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Community Chest"},
	[3] = { name="white_chapel_road", colour=Color(139,69,19,255), entity=NULL, cost=60, rent=4, houses={ [1]=20, [2]=60, [3]=180, [4]=320}, hotel=450, cost_to_build=50, mortgage=30, PrintName="White Chapel Road", Owner=nil },
	[4] = { name="income_tax", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Income Tax"},
	--Station
	[5] = { name="kings_cross_station", colour=Color(0,0,0,255), entity=NULL, cost=200, rent=25, multi_property={ [1]=25, [2]=50, [3]=100, [4]=200}, mortgage=100, PrintName="Kings Cross Station", Owner=nil },
	[6] = { name="the_angel_islington", colour=Color(176, 196, 222, 255), entity=NULL, cost=100, rent=6, houses={ [1]=30, [2]=90, [3]=270, [4]=400}, hotel=550, cost_to_build=50, mortgage=50, PrintName="The Angel Islington", Owner=nil },
	[7] = { name="chance_1", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Chance"},
	[8] = { name="euston_road", colour=Color(176, 196, 222, 255), entity=NULL, cost=100, rent=6, houses={ [1]=30, [2]=90, [3]=270, [4]=400}, hotel=550, cost_to_build=50, mortgage=50, PrintName="Euston Road", Owner=nil },
	[9] = { name="pentonville_road", colour=Color(176, 196, 222, 255), entity=NULL, cost=120, rent=8, houses={ [1]=40, [2]=100, [3]=300, [4]=450}, hotel=600, cost_to_build=50, mortgage=60, PrintName="Pentonville Road", Owner=nil },
	[10] = { name="visiting_jail", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Visiting Jail"},
	[11] = { name="pall_mall", colour=Color(255, 20, 147, 255), entity=NULL, cost=140, rent=10, houses={ [1]=50, [2]=150, [3]=450, [4]=625}, hotel=750, cost_to_build=100, mortgage=70, PrintName="Pall Mall", Owner=nil },
	[12] = { name="electric_company", colour=nil, entity=NULL, cost=150, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Electric Company", Owner=nil },
	[13] = { name="whitehall", colour=Color(255, 20, 147, 255), entity=NULL, cost=140, rent=10, houses={ [1]=50, [2]=150, [3]=450, [4]=625}, hotel=750, cost_to_build=100, mortgage=70, PrintName="WhiteHall", Owner=nil },
	[14] = { name="northumberland_avenue", colour=Color(255, 20, 147, 255), entity=NULL, cost=160, rent=12, houses={ [1]=60, [2]=180, [3]=500, [4]=700}, hotel=900, cost_to_build=100, mortgage=80, PrintName="Northumberland Avenue", Owner=nil },
	--Station
	[15] = { name="marylebone_station", colour=nil, entity=NULL, cost=200, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Marylebone Station", Owner=nil },
	[16] = { name="bow_street", colour=Color(255, 140, 0, 255), entity=NULL, cost=180, rent=14, houses={ [1]=70, [2]=200, [3]=550, [4]=750}, hotel=950, cost_to_build=100, mortgage=90, PrintName="Bow Street", Owner=nil },
	[17] = { name="community_chest_2", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Community Chest"},
	[18] = { name="marlborough_street", colour=Color(255, 140, 0, 255), entity=NULL, cost=180, rent=14, houses={ [1]=70, [2]=200, [3]=550, [4]=750}, hotel=950, cost_to_build=100, mortgage=90, PrintName="Marlborough Street", Owner=nil },
	[19] = { name="vine_street", colour=Color(255, 140, 0, 255), entity=NULL, cost=200, rent=16, houses={ [1]=80, [2]=220, [3]=600, [4]=800}, hotel=1000, cost_to_build=100, mortgage=100, PrintName="Vine Street", Owner=nil },
	[20] = { name="free_parking", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Free Parking"},
	[21] = { name="the_strand", colour=Color(255, 0, 0, 255), entity=NULL, cost=220, rent=18, houses={ [1]=90, [2]=250, [3]=700, [4]=875}, hotel=1050, cost_to_build=150, mortgage=110, PrintName="The Strand", Owner=nil },
	[22] = { name="chance_2", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Chance"},
	[23] = { name="fleet_street", colour=Color(255, 0, 0, 255), entity=NULL, cost=220, rent=18, houses={ [1]=90, [2]=250, [3]=700, [4]=875}, hotel=1050, cost_to_build=150, mortgage=110, PrintName="Fleet Street", Owner=nil },
	[24] = { name="trafalgar_square", colour=Color(255, 0, 0, 255), entity=NULL, cost=240, rent=20, houses={ [1]=100, [2]=300, [3]=750, [4]=925}, hotel=1100, cost_to_build=150, mortgage=120, PrintName="Trafalgar Square", Owner=nil },
	--Station
	[25] = { name="fenchurch_st_station", colour=nil, entity=NULL, cost=200, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Fenchurch St Station", Owner=nil },
	[26] = { name="leicester_square", colour=Color(255, 255, 0, 255), entity=NULL, cost=260, rent=22, houses={ [1]=110, [2]=330, [3]=800, [4]=975}, hotel=1150, cost_to_build=150, mortgage=130, PrintName="Leicester Square", Owner=nil },
	[27] = { name="coventry_street", colour=Color(255, 255, 0, 255), entity=NULL, cost=260, rent=22, houses={ [1]=110, [2]=330, [3]=800, [4]=975}, hotel=1150, cost_to_build=150, mortgage=130, PrintName="Coventry Street", Owner=nil },
	[28] = { name="water_works", colour=nil, entity=NULL, cost=150, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Water Works", Owner=nil },
	[29] = { name="piccadilly", colour=Color(255, 255, 0, 255), entity=NULL, cost=280, rent=22, houses={ [1]=120, [2]=360, [3]=850, [4]=1025}, hotel=1200, cost_to_build=150, mortgage=140, PrintName="Piccadilly", Owner=nil },
	[30] = { name="go_to_jail", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Go to Jail"},
	[31] = { name="regent_street", colour=Color(60, 179, 113, 255), entity=NULL, cost=300, rent=26, houses={ [1]=130, [2]=390, [3]=900, [4]=1100}, hotel=1275, cost_to_build=200, mortgage=150, PrintName="Regent Street", Owner=nil },
	[32] = { name="oxford_street", colour=Color(60, 179, 113, 255), entity=NULL, cost=300, rent=26, houses={ [1]=130, [2]=390, [3]=900, [4]=1100}, hotel=1275, cost_to_build=200, mortgage=150, PrintName="Oxford Street", Owner=nil },
	[33] = { name="community_chest_3", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Community Chest"},
	[34] = { name="bond_street", colour=Color(60, 179, 113, 255), entity=NULL, cost=320, rent=28, houses={ [1]=150, [2]=450, [3]=1000, [4]=1200}, hotel=1400, cost_to_build=200, mortgage=160, PrintName="Bond Street", Owner=nil },
	--Station
	[35] = { name="liverpool_street_station", colour=nil, entity=NULL, cost=200, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Liverpool Street Station", Owner=nil },
	[36] = { name="chance_3", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Chance"},
	[37] = { name="park_lane", colour=Color(72, 61, 139, 255), entity=NULL, cost=350, rent=35, houses={ [1]=175, [2]=500, [3]=1100, [4]=1300}, hotel=1500, cost_to_build=200, mortgage=175, PrintName="Park Lane", Owner=nil },
	[38] = { name="luxury_tax", colour=nil, entity=NULL, cost=nil, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Luxury Tax"},
	[39] = { name="mayfair", colour=Color(72, 61, 139, 255), entity=NULL, cost=400, rent=50, houses={ [1]=200, [2]=600, [3]=1400, [4]=1700}, hotel=2000, cost_to_build=200, mortgage=200, PrintName="Mayfair", Owner=nil },
	[-1] = { name="in_jail", colour=nil, entity=NULL, cost=200, rent=nil, houses={ [1]=nil, [2]=nil, [3]=nil, [4]=nil}, hotel=nil, cost_to_build=nil, mortgage=nil, PrintName="Jail"}
}

Boards["GB"] = Board("GB", "Great Britian Monopoly", Vector(-1430.762451, 518.600586, 496.031250), Vector(-601.781738, 1049.196289, 512.031250), properties)