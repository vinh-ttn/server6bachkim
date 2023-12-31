-- 凯旋鼓
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\drum_npc.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\global\\judgeoffline_limit.lua");
IncludeLib("TONG");

function main(nItemIndex)
	return tbTriumphDrum:OnUse(nItemIndex);
end

-- 使用
function tbTriumphDrum:OnUse(nItemIndex)
	
	-- 活动结束
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		Msg2Player("Tr鑞g kh秈 ho祅 b� h� b雐 v� l璾 gi� qu� l﹗");
		return 0;
	end
	
	-- 等级不够
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"Ъng c蕄 c馻 c竎 h� kh玭g !",  "Л頲 r錳./Cancel",});
		return 1;
	end 
	
	-- 没有帮会
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		CreateTaskSay({"C竎 h� v蒼 ch璦 gia nh藀 bang h閕!",  "Л頲 r錳./Cancel",});
		return 1;
	end
	
	-- 没有职位
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		CreateTaskSay({"Чi hi謕 kh玭g ph秈 l� bang ch� ho芻 l� trng l穙!",  "Л頲 r錳./Cancel",});
		return 1;
	end
	
	-- 战斗状态
	if GetFightState() == 1 then
		CreateTaskSay({"Xin h穣 s� d鬾g t筰 khu v鵦 phi chi課 u!",  "Л頲 r錳./Cancel",});
		return 1;
	end
	
	-- 限制区域
	if offlineCheckPermitRegion() ~= 1 then
		CreateTaskSay({"Xin h穣 s� d鬾g t筰 khu v鵦 輙 ngi!",  "Л頲 r錳./Cancel",});
		return 1;
	end	
	
	-- 非使用时间
	local nTime = tonumber(GetLocalDate("%H%M"));
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		CreateTaskSay({"Xinh h穣 s� d鬾g trong th阨 gian ho箃 ng!",  "Л頲 r錳./Cancel",});
		return 1;
	end
	
	-- 本帮今天使用过
	local nTask_LastUseDay = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay);
	local nTask_BeUsed = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	
	if nCurDay ~= nTask_LastUseDay then 
		nTask_LastUseDay = nCurDay;
		nTask_BeUsed = 0;
	end
	
	if nTask_BeUsed >= self.nLimit_DayUse then
		CreateTaskSay({"Vt qu� gi韎 h筺 s� d鬾g cho ph衟",  "Л頲 r錳./Cancel",});
		return 1;		
	end
	
	nTask_BeUsed = nTask_BeUsed + 1;
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay, nTask_LastUseDay);
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed, nTask_BeUsed);
	
	-- 出现鼓
	tbDrumNpc:New(szTongName, nTongId);
	return 0;
end
