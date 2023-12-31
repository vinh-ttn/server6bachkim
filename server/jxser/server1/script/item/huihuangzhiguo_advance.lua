Include("\\script\\activitysys\\playerfunlib.lua");

huihuangzhiguo_advance = {}

huihuangzhiguo_advance.nDailyCountLimit = 5;
huihuangzhiguo_advance.nLevelLimit = 120;
huihuangzhiguo_advance.tbEXP =  --果子对应经验表
{
	{15000000, "B竎h Ni猲 Huy Ho祅g qu�"},
	{23000000, "Thi猲 Ni猲 Huy Ho祅g qu�"},
	{30000000, "V筺 Ni猲 Huy Ho祅g qu�"},
};

huihuangzhiguo_advance.tbZhenLuTSK =  --使用珍露TSKID和给予对应物品表
{
	{2669, {tbProp={6,1,2269,1,0,0}}, "B竎h Ni猲 Tr﹏ L�", "B竎h Ni猲 Huy Ho祅g qu�"},
	{2670, {tbProp={6,1,2270,1,0,0}}, "Thi猲 Ni猲 Tr﹏ L�", "Thi猲 Ni猲 Huy Ho祅g qu�"},
	{2671, {tbProp={6,1,2271,1,0,0}}, "V筺 Ni猲 Tr﹏ L�", "V筺 Ni猲 Huy Ho祅g qu�"},
};

function huihuangzhiguo_advance:UseGuoZi(nGuoziLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	if (self:CheckCountLimit() ~= 1) then
		return 0;
	end
	
	if (self.tbEXP[nGuoziLevel] == nil) then
		return 0;
	end
	
	PlayerFunLib:AddExp(self.tbEXP[nGuoziLevel][1], 0, format("%s ph莕 thng",self.tbEXP[nGuoziLevel][2]));
	SetTask(2313, GetTask(2313) + 1)
	return 1;
end

function huihuangzhiguo_advance:UseZhenLu(nZhenLuLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	self:AddZhenLuCount(nZhenLuLevel);
	Msg2Player(format("Чi hi謕  s� d鬾g %d %s, l骳 nh苩 qu� huy ho祅g c遪 c� th� thu 頲 %d %s, tr筺g th竔 n祔 s� m蕋 v祇 0 gi�", 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][3], 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][4]));
	return 1;
end

function huihuangzhiguo_advance:CheckLevelLimit()
	if (GetLevel() < self.nLevelLimit) then
		lib:ShowMessage(format("C蕄 %d tr� l猲 (k� c� %d) m韎 c� th� s� d鬾g!", self.nLevelLimit, self.nLevelLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:CheckCountLimit()
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (GetTask(2313) >= self.nDailyCountLimit) then
		lib:ShowMessage(format("H玬 nay c竎 h�  s� d鬾g %d qu� huy ho祅g r錳, c玭g l鵦 t╪g qu� nhanh c騨g s� b� ph秐 t竎 d鬾g . ьi ng祔 mai r錳 h穣 d飊g nh�.", self.nDailyCountLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:AddZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], 1);
	end
end

function huihuangzhiguo_advance:ReduceZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], -1);
	end
end

function huihuangzhiguo_advance:GetGuoZiAvd()
	local nCount = 0;
	for i=getn(self.tbZhenLuTSK),1,-1 do --从高级到低级遍历
		local nZhenLu = PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[i][1]);
		if (nZhenLu > 0) then
			tbAwardTemplet:GiveAwardByList(self.tbZhenLuTSK[i][2], "Nh苩 qu� huy ho祅g");
			self:ReduceZhenLuCount(i);
			nCount = 1;
			break;
		end
	end
	
	return nCount;
end