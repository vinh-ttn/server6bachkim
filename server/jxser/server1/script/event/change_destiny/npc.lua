IncludeLib("ITEM")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\change_destiny\\head.lua");

function main()
	return tbChangeDestiny:talk()
end

function callBack_giveZhenDan_sure(nCount)
	return tbChangeDestiny:giveZhenDan_sure(nCount)
end


-- 加载NPC
function tbChangeDestiny:addNpc() 

--	if tonumber(GetLocalDate("%Y%m%d")) > self.nCloseDate then
--		 return 
--	end
	-- L2TH OFF
	for i=1,getn(self.tbNpcPos) do
		npcindex = AddNpc(self.nNpcResIdx, 1, SubWorldID2Idx(self.tbNpcPos[i][1]), self.tbNpcPos[i][2] * 32, self.tbNpcPos[i][3] * 32);
		if npcindex > 0 then
			SetNpcScript(npcindex, "\\script\\event\\change_destiny\\npc.lua");
		end
	end
	
end

-- 检查基本的参与条件
function tbChangeDestiny:checkBaseCondition()
	
--	if self:isCarryOn() ~= 1 then
--		CreateTaskSay({"<dec><npc>大侠来晚了一步，老夫正打算回乡种田了。", "真是遗憾啊，您老多多保重。/Cancel"});
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		CreateTaskSay({"<dec><npc>Чi hi謕 c� c玭g l鵦 ch璦  th﹎ h藆, m玭 ph竝 tu h祅h ngh辌h thi猲 n祔 kh玭g d� tu luy謓 u.", "Th� ra l� v藋, 產 t� cao nh﹏ ch� 甶觤/Cancel"});
		return 0;
	end
	
	return 1;
end

-- NPC对话
function tbChangeDestiny:talk() 
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if self.bDeBug == 1 then
		Msg2Player("*************************")
		Msg2Player(format("DayGiveCount:%d  DayGiveDate:%d", self:getTask(self.nTask_ZhenDan_GiveCount), self:getTask(self.nTask_ZhenDan_GiveDate)));
		Msg2Player(format("TotalGive:%d  Receive:%d  Used:%d", self:getTask(self.nTask_ZhenDan_TotalCount), self:getTask(self.nTask_GaiMing_HasReceive), self:getTask(self.nTask_GaiMing_HasUsed)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Battle, self:getMissionInfo(self.nMissionID_Battle)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_NieShiChen, self:getMissionInfo(self.nMissionID_NieShiChen)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_WaterThief, self:getMissionInfo(self.nMissionID_WaterThief)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Killer, self:getMissionInfo(self.nMissionID_Killer)));
		Msg2Player(" ")
	end
	
	CreateTaskSay({
		"<dec><npc>V� i hi謕 n祔 c� duy猲 v韎 ta, l穙 phu kh玭g gi蕌 di誱 g� ngi. Ta c� bi誸 m閠 m玭 ph竝 tu luy謓 ngh辌h thi猲 h祅h, i hi謕 c� h鴑g th� t譵 gi髉 ta <color=green>180<color> vi猲 <color=green>th莕 n玭g ch﹏ n<color> v� giao cho l穙 phu. Ta s� truy襫 m鉵 ngh� n祔 cho ngi. L穙 ch� d鮪g t筰 y n鱝 th竛g, i hi謕 h穣 nhanh ch﹏ l猲 nh�.", 
		"Ta  t譵 頲 m閠 s� th莕 n玭g ch﹏ n, xin m阨 l穙 nh薾 l蕐./#tbChangeDestiny:giveZhenDan()",
		"Xin h醝 ta  n閜  th莕 n玭g ch﹏ n ch璦?/#tbChangeDestiny:queryTotalCount()",
--		"请问如何得到神农真丹？/#tbChangeDestiny:zhenDanTask()",
		"Ta  ho祅 th祅h theo y猽 c莡 c馻 l穙, c� th� d箉 ta m玭 ph竝 n祔 頲 kh玭g?/#tbChangeDestiny:awardGaiMingJue()",
		"Л頲 r錳,  ta th� xem./Cancel",
		});
end

-- 上交神农真丹
function tbChangeDestiny:giveZhenDan()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Чi hi謕  ho祅 th祅h y猽 c莡 c馻 l穙 r錳, kh玭g c莕 ph秈 n閜 th猰 th莕 n玭g ch﹏ n n鱝 u!", "Л頲 r錳./Cancel"});
		return
	end
	
	if nGiveCount >= self.nLimit_DayGive then
		CreateTaskSay({format("<dec><npc>H玬 nay i hi謕  n閜 cho l穙 %d Th莕 N玭g Ch﹏ Кn r錳, i ng祔 mai h穣 quay l筰 nh�!", self.nLimit_DayGive), "Л頲 r錳./Cancel"});
		return 
	end
	
	GiveItemUI("N閜 Th莕 N玭g Ch﹏ Кn", format("M鏸 ng祔 nhi襲 nh蕋 ch� n閜 頲 %d vi猲 Th莕 N玭g Ch﹏ Кn, h玬 nay i hi謕  n閜 %d vi猲 r錳.", self.nLimit_DayGive, nGiveCount), "callBack_giveZhenDan_sure", "Cancel", 1);
end

-- 核实上交神农真丹
function tbChangeDestiny:giveZhenDan_sure(nCount)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if nCount <= 0 then
		CreateTaskSay({"<dec><npc>Чi hi謕 產ng a ta �, l穙 phu v蒼 ch璦 th蕐 i hi謕 n閜 v藅 ph萴 g� c�.", "He he./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= self.tbItem_ShenLongZhenDan[1] or d ~= self.tbItem_ShenLongZhenDan[2] or p ~= self.tbItem_ShenLongZhenDan[3]) then
			CreateTaskSay({"<dec><npc>Чi hi謕 kh玭g c莕 n閜 v藅 ph萴 g� kh竎, ch� c莕 a ta <color=yellow> Th莕 N玭g Ch﹏ Кn <color> l� 頲 r錳.", "Л頲 r錳./Cancel"});
			return 
		end
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	local nCanGive = self.nLimit_DayGive - nGiveCount;
	
	if nCount > nCanGive or nCanGive <= 0 then
		CreateTaskSay({format("<dec><npc>H玬 nay i hi謕 ch� c莕 a ta %d vi猲 Th莕 N玭g Ch﹏ Кn l� 頲, kh玭g c莕 nhi襲 h琻 u.", nCanGive), "Л頲 r錳./Cancel"});
		return 
	end
	
	local nCanGive_Total = self.nLimit_TotalGive - nTotalCount;
	
	if nCount > nCanGive_Total or nCanGive_Total <= 0 then
		CreateTaskSay({format("<dec><npc>Чi hi謕 ch� c莕 n閜 cho ta %d Th莕 N玭g Ch﹏ Кn l�  ho祅 th祅h y猽 c莡 c馻 ta r錳, kh玭g c莕 nhi襲 h琻 u.", nCanGive_Total), "Л頲 r錳./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;

	nGiveCount  = nGiveCount  + nCount;
	nTotalCount = nTotalCount + nCount;
	
	self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
	self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	self:setTask(self.nTask_ZhenDan_TotalCount, nTotalCount);
	
	local szMsg = format("[ChangeDestiny]GiveZhenDan: %s give %d ZhenDan On %d. Now the DayCount is %s and TotalCount is %s.",GetName(), nCount, nGiveDate, nGiveCount, nTotalCount);
	WriteLog(szMsg);
	
	CreateTaskSay({format("<dec><npc>H玬 nay i hi謕  n閜 cho ta %d vi猲 Th莕 N玭g Ch﹏ Кn r錳, t鎛g c閚g  n閜 %d, ch� c莕 i hi謕 kh玭g ng鮪g n� l鵦 sau n祔 s� th祅h c玭g nhanh m�.", nGiveCount, nTotalCount), "Ta s� tr� l筰 sau./Cancel"});
end

-- 查询缴纳了多少神农真丹
function tbChangeDestiny:queryTotalCount()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Ch骳 m鮪g i hi謕, i hi謕  ho祅 th祅h y猽 c莡 c馻 l穙 phu r錳!", "Th藅 kh玭g l穙? Th藅 l� kh玭g d� d祅g g� t 頲!/Cancel"});
		return
	else
		CreateTaskSay({format("<dec><npc>Чi hi謕  n閜 cho l穙 %d Th莕 N玭g Ch﹏ Кn r錳, ch� c莕 s� c� g緉g th� nh蕋 nh s� t 頲 th醓 nguy謓.", nTotalCount), "Ta s� c� g緉g n� l鵦!/Cancel"});
		return
	end
	
end

-- 发放逆天改命诀
function tbChangeDestiny:awardGaiMingJue()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nHasAward	  = self:getTask(self.nTask_GaiMing_HasReceive);
	
	if nTotalCount < self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>L祄 ngi ph秈 c� l遪g trung th鵦, kh玭g d� g� l鮝 頲 l穙 phu u.", "Ta ch� a ngi th玦, ng tng th藅 nh�!/Cancel"});
		return
	end
	
	if nHasAward ~= 0 then
		CreateTaskSay({"<dec><npc>L穙 phu b譶h sinh r蕋 gh衪 b鋘 ti觰 nh﹏ c� l遪g tham v� y, kh玭g ph秈 ngi  nh薾 r錳 hay sao?", "L穙 phu gi竜 hu蕁 ch� ph秈, v穘 b鑙 bi誸 l鏸 r錳!/Cancel"});
		return
	end
	
	local free = FindFreeRoomByWH(1, 1)
	if (free ~= 1) then
		CreateTaskSay({"<dec><npc>H祅h trang kh玭g  � tr鑞g, xin m阨 s緋 x誴 h祅h trang r錳 quay tr� l筰 nh�.", "Л頲 r錳./Cancel"});
		return
	end
	
	local item = AddItem(self.tbItem_GaiMingJue[1],self.tbItem_GaiMingJue[2],self.tbItem_GaiMingJue[3],1,0,0)
	if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give GaiMingJue to %s", GetName()));
			CreateTaskSay({"<dec><npc>Ta c秏 nh薾 c� g� kh玭g 鎛, v藅 ph萴 tuy謙 th� n祔 t筸 th阨 kh玭g th� giao ph� cho ngi 頲.", "T筰 sao?/Cancel"});
			return
	else
--			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)

			self:setTask(self.nTask_GaiMing_HasReceive, 1);
			WriteLog(format("[ChangeDestiny]Give GaiMingJue to %s", GetName()))
			CreateTaskSay({"<dec><npc>Зy l� ph莕 thng cho ngi! T� nay v� sau ngi h穣 c� r蘮 luy謓 v� c玭g  kh玭g ph� l遪g l穙 phu nh�.", " t� ti襫 b鑙!/Cancel"});
			return
	end
end

-- 神农真丹任务
function tbChangeDestiny:zhenDanTask()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Чi hi謕  ho祅 th祅h y猽 c莡 c馻 l穙 phu r錳, v藅 ph萴 th莕 n玭g ch﹏ n n祔 ta kh玭g c莕 th猰 n鱝 u.", "Ta  hi觰 r錳!/Cancel"});
		return
	end
	
	CreateTaskSay({
		"<dec><npc>L穙 phu tu鎖 ta  cao, c� nh鱪g vi謈 mu鑞 m� kh玭g l祄 頲, i hi謕 c� mu鑞 gi髉 l穙 phu m閠 phen kh玭g, th莕 n玭g ch﹏ n n祔 l� t苙g ph萴 n誹 ngi gi髉 ta.",
		"Ti襫 b鑙 qu� l阨 r錳, y l� vi謈 ta c莕 l祄, xin l穙 phu c� giao ph�!/#tbChangeDestiny:zhenDanTask_accepte()",
		"Nh鱪g vi謈 ti襫 b鑙 giao ph� ta  l祄 xong r錳./#tbChangeDestiny:zhenDanTask_delivery()",
		"T筰 h�  r� r錳./Cancel",
		});
	
end

-- 神农真丹任务 接受任务
function tbChangeDestiny:zhenDanTask_accepte()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>Ta y c� m閠 s� nhi謒 v�, phi襫 i hi謕 m閠 phen.",
		format("T筰 h� mu鑞 nh薾 nhi謒 v� �3000 甶觤 t輈h l騳 T鑞g Kim�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Battle),
		format("T筰 h� mu鑞 nh薾 nhi謒 v� 摟竛h b筰 Nhi誴 Th� Tr莕�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_NieShiChen),
		format("T筰 h� mu鑞 nh薾 nhi謒 v� 摟竛h b筰 Th駓 T芻 u l躰h�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_WaterThief),
		format("T筰 h� mu鑞 nh薾 nhi謒 v� 摟� b筰 t� i s竧 th駭./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Killer),
		"C� m閠 s� nhi謒 v� h琲 kh�, xin h穣  t筰 h� c� th阨 gian chu萵 b�./Cancel",
		});
end

-- 神农真丹任务 处理接受申请
function tbChangeDestiny:zhenDanTask_accepte_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	
	if nMissionStep ~= self.nStep_free then
		CreateTaskSay({format("<dec><npc>Чi hi謕  nh薾 nhi謒 v� r錳, xin h穣 c� g緉g ho祅 th祅h nhi謒 v�. M鬰 ti猽 nhi謒 v� c馻 i hi謕 l�: <color=green>%s<color>, ho祅 th祅h xong thu 頲 <color=green>%d<color> vi猲 Th莕 N玭g Ch﹏ Кn!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "Л頲 r錳./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>Чi hi謕 h玬 nay  ho祅 th祅h lo筰 nhi謒 v� n祔 r錳, ng祔 mai quay l筰 nh�!", "Л頲 r錳./Cancel"});
		return
	end
	
	self:setMissionInfo(nMissionID, self.nStep_accepted , nMissionDate);
	CreateTaskSay({format("<dec><npc>M鬰 ti猽 nhi謒 v� c馻 i hi謕 l�: <color=green>%s<color>, ho祅 th祅h xong thu 頲 <color=green>%d<color> Th莕 N玭g Ch﹏ Кn!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "Ta s� l猲 阯g ngay!/Cancel"});
	Msg2Player(self.tbMissionInfo[nMissionID][3]);
end

-- 神农真丹任务 交付任务
function tbChangeDestiny:zhenDanTask_delivery()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>Чi hi謕 qu� nhi猲 kh玭g l祄 ta th蕋 v鋘g, ngi  ho祅 th祅h nhi謒 v� n祇 r錳?",
		format("T筰 h� n giao nhi謒 v� �3000 甶觤 t輈h l騳 T鑞g Kim�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Battle),
		format("T筰 h� n giao nhi謒 v� 摟竛h b筰 Nhi誴 Th� Tr莕�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_NieShiChen),
		format("T筰 h� n giao nhi謒 v� 摟竛h b筰 Th駓 T芻 u l躰h�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_WaterThief),
		format("T筰 h� n giao nhi謒 v� 摟� b筰 t� i s竧 th駭./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Killer),
		"T筰 h� nh� nh莔, t筸 th阨 v蒼 ch璦 xong nhi謒 v�./Cancel",
		});
end

-- 神农真丹任务 处理交付申请
function tbChangeDestiny:zhenDanTask_delivery_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	
	if nMissionStep ~= self.nStep_completed then
		CreateTaskSay({"<dec><npc>Ta tuy gi� nh璶g kh玭g hay qu猲 u, ngi ng h遪g l鮝 g箃 ta", "V穘 b鑙 bi誸 l鏸 r錳./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>Чi hi謕 h玬 nay  ho祅 th祅h lo筰 nhi謒 v� n祔 r錳, ng祔 mai quay l筰 nh�!", "Л頲 r錳./Cancel"});
		return
	end
	
	local nFree = CalcFreeItemCellCount();
	local nAwardCount = self.tbMissionInfo[nMissionID][1];
	
	if (nFree < nAwardCount) then
		CreateTaskSay({"<dec><npc>H祅h trang kh玭g  � tr鑞g, xin m阨 s緋 x誴 h祅h trang r錳 quay tr� l筰 nh�.", "Л頲 r錳./Cancel"});
		return
	end
	
	for i=1,nAwardCount do
		local item = AddItem(self.tbItem_ShenLongZhenDan[1],self.tbItem_ShenLongZhenDan[2],self.tbItem_ShenLongZhenDan[3],1,0,0);
		if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give ShenLongZhenDan to %s", GetName()));
		else
			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)
			WriteLog(format("[ChangeDestiny]Give ShenLongZhenDan to %s", GetName()))
		end
	end
	 
	self:setMissionInfo(nMissionID, self.nStep_free , nDate);
	CreateTaskSay({"<dec><npc>Зy l� ph莕 thng c馻 i hi謕!", " t� ti襫 b鑙!/Cancel"});
end