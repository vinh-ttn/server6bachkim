-- 凯旋鼓声 头文件
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc对话
function tbTriumphDrum:NpcTalk()
	
	if tbTriumphDrum:CheckCondition_BuyDrum() ~= 1 then
		CreateTaskSay({"C竎 h� kh玭g c� quy襫 h筺  mua tr鑞g kh秈 ho祅!",  "Л頲 r錳./Cancel",});
		return
	end
	
	if GetCash() < self.nLimit_Money then
		CreateTaskSay({"Mua Tr鑞g Kh秈 Ho祅 c莕 304 v筺 lng",  "Л頲 r錳./Cancel",});
		return		
	end
	
	if Pay(self.nLimit_Money) ~= 1 then
		Msg2Player("Tr� ng﹏ lng th蕋 b筰")
		return
	end
		
	local tbAwardItem = 
	{
		szName="Tr鑞g Kh秈 Ho祅", 
		tbProp={6,1, 2309, 1,0,0},
		nCount = 1,
		nExpiredTime=60,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Mua Tr鑞g Kh秈 Ho祅");
end
