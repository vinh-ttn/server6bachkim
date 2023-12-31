Include("\\script\\global\\forbidmap.lua");

--tinhpn 20100803: Patch Request
local tbUseOnlyInMap = 
{
	586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,
}
local checkOnlyUseInMap = function()
	local nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn( %tbUseOnlyInMap ) do		--特殊地图禁用
		if( %tbUseOnlyInMap[i] == nMapId ) then
			return 1
		end
	end
	return 0
end


function main(nItemIdx)
--使用人限制？
	local ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}
	local GoldenBoss = {{562, "Чo Thanh Ch﹏ Nh﹏", 4,12},
					  {563, "Gia Lu藅 T� Ly", 3,12},
					  --{564, "完颜雪衣", 3,12},
					  {565, "an M閏 Du� ", 3,12},
					  {566, "C� B竎h", 0,12},
					  {567, "Chung Linh T� ", 2,12},
					  {568, "H� Linh Phi猽", 2,12},
					  {582, "Lam Y Y", 1,12},
					  {583, "M筺h Thng Lng", 3,12},
					  {739, "Vng T� ", 0,10},
					  {740, "Huy襫 Gi竎 Чi S� ", 0,12},
					  {741, "Л阯g B蕋 Nhi詍", 1,12},
					  {742, "B筩h Doanh Doanh", 1,12},
					  {743, "Thanh Hi觰 S� Th竔 ", 2,12},
					  {744, "Y猲 Hi觰 Tr竔", 2,12},
					  {745, "H� Nh﹏ Ng� ", 3,12},
					  --{746, "单思南", 4,10},
					  {747, "Tuy襫 C� T� ", 4,12},
					  {511, "Trng T玭g Ch輓h",5,270},
			  		  {513, "Di謚 Nh� ",5,270},
			  		  {523, "Li評 Thanh Thanh",5,270}}
			  		  
	local bosspro = {};
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("Kh玭g � trong tr筺g th竔 chi課 u th� kh玭g th� s� d鬾g");
		return 1
	end
	
	--tinhpn 20100803: Patch ReQuest
	if %checkOnlyUseInMap() ~= 1 then
		Msg2Player("Kh玭g th� s� d鬾g v藅 ph萴 n祔 t筰 y.")
		return 1
	end
	
	
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end
	for i = 1, getn( ForbiddenMap ) do		--特殊地图禁用
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
		return 1
	end
	
	for i = 1, getn(GoldenBoss) do
		bosspro[i] = GoldenBoss[i][4];
	end

		local numth = randomaward(bosspro);
		local GoldenBossId = GoldenBoss[numth][1];
		local GoldenBossName = GoldenBoss[numth][2];
		local GoldenBossSeries = GoldenBoss[numth][3];
		if (GoldenBossSeries == 5) then
			GoldenBossSeries = random( 0, 4);
		end
		local npcindex = AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		SetNpcDeathScript(npcindex, "\\script\\misc\\boss\\callbossdeath.lua");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] D飊g Ho祅g Kim l謓h  g鋓 ra 1 Boss Ho祅g Kim: "..GoldenBossName);
		Msg2Player("B筺 g鋓 ra 1 Boss: "..GoldenBossName);

	return 0	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end
