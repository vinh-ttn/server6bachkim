-- 寻花打虎 黄金莲
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main(nItemIndex)
	return tbBeatTiger:OnUse(nItemIndex);
end

-- 使用
function tbBeatTiger:OnUse(nItemIndex)
	
	-- 活动结束
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if  nDate >= self.nFlowerDisappearDate then
		Msg2Player("Hoa sen c筺 b� h� v� th阨 gian t錸 t筰 qu� l﹗");
		return 0;
	end
	
	-- 等级不够
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"Ъng c蕄 c馻 c竎 h� kh玭g !",  "Л頲!/Cancel",});
		return 1;
	end 
	
	-- 没有充值
	if GetExtPoint(0) <= 0  then
		CreateTaskSay({"Ch� c� ngi ch琲 n閜 th� m韎 c� th� s� d鬾g!",  "Л頲!/Cancel",});
		return 1;	
	end
	
	-- 超过使用限制
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"Vt qu� gi韎 h筺 nh薾 頲 kinh nghi謒 cho ph衟 c馻 ho箃 ng",  "Л頲!/Cancel",});
		return 1;		
	end
	
	nUseCount = nUseCount + 1;
	self.tbTaskGroup:SetTask(self.nTaskID_UseCount, nUseCount);
	
	-- 发放经验
	local tbAwardItem = {nExp = self.nLimit_ExpAward};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "S� d鬾g hoa sen c筺");
	return 0;
end
