Include("\\script\\lib\\common.lua")
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua")

--------------------SoldierTask--------------------
tbSoldier_TaskGroup = TaskManager:Create(6, 1);
tbSoldier_TaskGroup.TSK_STICK_EXP = 1;
tbSoldier_TaskGroup.TSK_HAT_EXP = 2;
tbSoldier_TaskGroup.TSK_SHOES_CLOTH_EXP = 3;
tbSoldier_TaskGroup.TSK_CLOTH_COUNT = 4;
tbSoldier_TaskGroup.TSK_COT_EXP = 5;

function tbSoldier_TaskGroup:GetStickExp()
	return self:GetTask(self.TSK_STICK_EXP)
end

function tbSoldier_TaskGroup:SetStickExp(nExp)
	return self:SetTask(self.TSK_STICK_EXP, nExp)
end

function tbSoldier_TaskGroup:AddStickExp(nExp)
	return self:AddTask(self.TSK_STICK_EXP, nExp)
end

function tbSoldier_TaskGroup:GetCotExp()
	return self:GetTask(self.TSK_COT_EXP)
end

function tbSoldier_TaskGroup:SetCotExp(nExp)
	return self:SetTask(self.TSK_COT_EXP, nExp)
end

function tbSoldier_TaskGroup:AddCotExp(nExp)
	return self:AddTask(self.TSK_COT_EXP, nExp)
end

function tbSoldier_TaskGroup:GetHatExp()
	return self:GetTask(self.TSK_HAT_EXP)
end

function tbSoldier_TaskGroup:SetHatExp(nExp)
	return self:SetTask(self.TSK_HAT_EXP, nExp)
end

function tbSoldier_TaskGroup:AddHatExp(nExp)
	return self:AddTask(self.TSK_HAT_EXP, nExp)
end

function tbSoldier_TaskGroup:GetShoesClothExp()
	return self:GetTask(self.TSK_SHOES_CLOTH_EXP)
end

function tbSoldier_TaskGroup:SetShoesClothExp(nExp)
	return self:SetTask(self.TSK_SHOES_CLOTH_EXP, nExp)
end

function tbSoldier_TaskGroup:AddShoesClothExp(nExp)
	return self:AddTask(self.TSK_SHOES_CLOTH_EXP, nExp)
end

function tbSoldier_TaskGroup:GetClothCount()
	return self:GetTask(self.TSK_CLOTH_COUNT)
end

function tbSoldier_TaskGroup:SetClothCount(nCount)
	return self:SetTask(self.TSK_CLOTH_COUNT, nCount)
end

function tbSoldier_TaskGroup:AddClothCount(nCount)
	return self:AddTask(self.TSK_CLOTH_COUNT, nCount)
end

--------------------FreedomEvent--------------------
if (Soldier2010 == nil) then
	Soldier2010 = {}
end

Soldier2010.SOLDIER_STICK_EXP_LIMIT = 10000 -- 单位10W
Soldier2010.SOLDIER_HAT_EXP_LIMIT = 5000 -- 单位10W
Soldier2010.SOLDIER_SHOES_CLOTH_EXP_LIMIT = 40000 -- 单位10W
Soldier2010.SOLDIER_COT_EXP_LIMIT = 12000 -- 单位10W
Soldier2010.SOLDIER_LVL_LIMIT = 50

function Soldier2010:SongjinSoldier(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	PlayerIndex = nPlayerIdx;
	if (PlayerFunLib:CheckBT_PL_BATTLEPOINT(3000, ">=") == 1) then
		tbAwardTemplet:GiveAwardByList(FreedomEvent2010.tbSongjinSoldier, format("%s\t%s","Ho箃 ng t蕀 竜 chi課 s�","Ph莕 thng khi c� 甶觤 t輈h l騳 T鑞g Kim tr猲 3000"));
	end
	PlayerIndex = nOldIdx;
end

function Soldier2010:MonsterDrop(nNpcIndex, nPlayerIndex)
	if (NpcFunLib:CheckNormalMonster("10,20,30,40,50,60,70,80,90", nNpcIndex) == 1) then
		for i=1,getn(FreedomEvent2010.tbMonsterDrop) do
			tbDropTemplet:GiveAwardByList(nNpcIndex, nPlayerIndex, FreedomEvent2010.tbMonsterDrop[i], format("%s\t%s","Ho箃 ng t蕀 竜 chi課 s�","Qu竔 ph� th玭g r琲"), 1);
		end
	end
end

function Soldier2010:SoldierLimit()
	if (PlayerFunLib:CheckLevel(self.SOLDIER_LVL_LIMIT, "default", ">=") == 1 and
		PlayerFunLib:IsCharged("default") == 1) then
		
		return 1;
	end
	
	return 0;
end

function Soldier2010:UseSoldierBag()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") == 1) then
		tbAwardTemplet:GiveAwardByList(FreedomEvent2010.tbSoldierToolBag, format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","T骾 D鬾g C�"));
		return 1;
	end
	return 0;
end

function Soldier2010:UseSoldierStick()
	local nCurExp = tbSoldier_TaskGroup:GetStickExp();
	local nTransLife = ST_GetTransLifeCount();
	if (nCurExp >= (nTransLife+1)*self.SOLDIER_STICK_EXP_LIMIT) then
		Talk(1, "", format("Th玭g qua s� d鬾g [%s] nhi襲 nh蕋 ch� 頲 %s kinh nghi謒","Chi誧 g藋 Trng S琻",format("<color=green>%0.f<color=green>",(nTransLife+1)*self.SOLDIER_STICK_EXP_LIMIT*100000)));
		return 0;
	end
	tbSoldier_TaskGroup:AddStickExp(500);
	PlayerFunLib:AddExp(50000000,0,format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","Chi誧 g藋 Trng S琻"));
	return 1;
end

function Soldier2010:UseSoldierCot()
	if (self:SoldierLimit() ~= 1) then
		return 0;
	end
	local nCurExp = tbSoldier_TaskGroup:GetCotExp();
	if (nCurExp >= self.SOLDIER_COT_EXP_LIMIT) then
		Talk(1, "", format("Th玭g qua s� d鬾g [%s] nhi襲 nh蕋 ch� 頲 %s kinh nghi謒","Chi誧 v鈔g Trng S琻",format("<color=green>%d<color=green>",self.SOLDIER_COT_EXP_LIMIT*100000)));
		return 0;
	end
	tbSoldier_TaskGroup:AddCotExp(150);
	PlayerFunLib:AddExp(15000000,0,format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","Chi誧 v鈔g Trng S琻"));
	return 1;
end

function Soldier2010:UseSoldierHat()
	if (self:SoldierLimit() ~= 1) then
		return 0;
	end
	
	local nCurExp = tbSoldier_TaskGroup:GetHatExp();
	if (nCurExp >= self.SOLDIER_HAT_EXP_LIMIT) then
		Talk(1, "", format("Th玭g qua s� d鬾g [%s] nhi襲 nh蕋 ch� 頲 %s kinh nghi謒","Chi誧 M� Chi課 S�",format("<color=green>%d<color=green>",self.SOLDIER_HAT_EXP_LIMIT*100000)));
		return 0;
	end
	tbSoldier_TaskGroup:AddHatExp(8);
	PlayerFunLib:AddExp(800000,0,format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","Chi誧 M� Chi課 S�"));
	return 1;
end

function Soldier2010:UseSoldierShoes()
	if (self:SoldierLimit() ~= 1) then
		return 0;
	end
	local nCurExp = tbSoldier_TaskGroup:GetShoesClothExp();

	if (nCurExp >= self.SOLDIER_SHOES_CLOTH_EXP_LIMIT) then
		Talk(1, "", format("Th玭g qua s� d鬾g [%s] nhi襲 nh蕋 ch� 頲 %s kinh nghi謒",format("%s v� %s","Йi Gi祔 B� чi","T蕀 竜 Chi課 S�"),format("<color=green>%0.f<color=green>",self.SOLDIER_SHOES_CLOTH_EXP_LIMIT*100000)));
		return 0;
	end
	tbSoldier_TaskGroup:AddShoesClothExp(20);
	PlayerFunLib:AddExp(2000000,0,format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","Йi Gi祔 B� чi"));
	return 1;
end

function Soldier2010:UseSoldierCloth()
	if (self:SoldierLimit() ~= 1) then
		return 0;
	end
	if (PlayerFunLib:CheckFreeBagCell(3,"default") ~= 1) then
		return 0;
	end
	local nCurExp = tbSoldier_TaskGroup:GetShoesClothExp();
	local nExp = 0;
	local nClothCount = tbSoldier_TaskGroup:GetClothCount();

	if (nCurExp >= self.SOLDIER_SHOES_CLOTH_EXP_LIMIT) then
		Talk(1, "", format("Th玭g qua s� d鬾g [%s] nhi襲 nh蕋 ch� 頲 %s kinh nghi謒",format("%s v� %s","Йi Gi祔 B� чi","T蕀 竜 Chi課 S�"),format("<color=green>%0.f<color=green>",self.SOLDIER_SHOES_CLOTH_EXP_LIMIT*100000)));
		return 0;
	else
		if (mod((nClothCount+1),50) == 0) then
			nExp = 100;
		else
			nExp = FreedomEvent2010.tbClothExp.exp[random_range(FreedomEvent2010.tbClothExp.rate)];
		end
	end
	if (nExp > 0) then	
		tbSoldier_TaskGroup:AddShoesClothExp(nExp);
		PlayerFunLib:AddExp(nExp*100000,0,format("Ho箃 ng t蕀 竜 chi課 s黒tS� d鬾g %s","T蕀 竜 Chi課 S�"));
	end
	local tbItem = FreedomEvent2010.tbClothAwardNormal;
	if (mod((nClothCount+1),50) == 0) then
		tbItem = FreedomEvent2010.tbClothAwardSpecial;
	end
	tbSoldier_TaskGroup:AddClothCount(1);
	nClothCount = nClothCount + 1;
	tbAwardTemplet:GiveAwardByList(tbItem, format("Ho箃 ng t蕀 竜 chi課 s� \tS� d鬾g l莕 %d %s", nClothCount, "T蕀 竜 Chi課 S�"));
	return 1;
end

function OnExit()

end;
