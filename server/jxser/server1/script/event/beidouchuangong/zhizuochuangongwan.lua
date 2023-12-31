-- 文件名　：zhizuochuangongwan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-22 17:16:36
--制作传功丸的脚本
IncludeLib("SETTING");
Include("\\script\\event\\BeiDouChuanGong\\lib\\compose.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function BeiDouChuanGong_main(nStep)
	local tbSay 
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>дn t譵 ta  luy謓 c竎 lo筰 Truy襫 c玭g ti猲 n c� ph秈 kh玭g?",
			"Ta n luy謓 c竎 lo筰 ti猲 產n/#BeiDouChuanGong_main(2)",
			"V� B綾 u truy襫 c玭g thu藅/#BeiDouChuanGong_main(3)",
			"Th玭g tin th阨 gian s� d鬾g/#BeiDouChuanGong_main(4)",
			"K誸 th骳 i tho筰/OnCancel",
		}
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>Ngi mu鑞 luy謓 lo筰 ti猲 n n祇?",
			"B筩h Ch﹏ Кn/#BeiDouChuanGong_zuodan([[bai]])",
			"Huy誸 Ch﹏ Кn/#BeiDouChuanGong_zuodan([[xue]])",
			"Huy襫 Ch﹏ Кn/#BeiDouChuanGong_zuodan([[xuan]])",
			"T� Kim Ch﹏ Кn/#BeiDouChuanGong_zuodan([[zijin]])",
			"K誸 th骳 i tho筰/OnCancel",
		}
	elseif nStep == 3 then
		tbSay = 
		{
			format("<dec><npc>襲 ki謓 c馻 ti猲 n: l骳 truy襫 c玭g cho c竎 lo筰 ti猲 n tr猲 ngi ph秈 c�  1 tri謚 kinh nghi謒. Ti猲 n c莕 nguy猲 li謚 nh� sau.<enter>B筩h Ch﹏ Кn: 1 b綾 u truy襫 c玭g thu藅, 1 th蕋 tinh th秓<enter>Huy誸 Ch﹏ Кn: 1 b綾 u truy襫 c玭g thu藅, 1 b竎h ni猲 th蕋 tinh th秓 <enter>Huy襫 Ch﹏ Кn: 1 b綾 u truy襫 c玭g thu藅, 1 thi猲 ni猲 th蕋 tinh th秓<enter>T� Kim Ch﹏ Кn: 1 b綾 u truy襫 c玭g thu藅, 1 v筺 ni猲 ng� th竔 hoa<enter>Ho祅g Ch﹏ Кn:  b� truy襫<enter>3 lo筰 ti猲 n u, ch� c莕  c蕄 50 v�  n筽 th� m韎 c� th� s� d鬾g v� ch� nh薾 頲 t鎛g kinh nghi謒 l� 3 t�, t n kinh nghi謒 cao nh蕋 ph秈 i %d ng祔 m韎 c� th� s� d鬾g l筰. Ch� c� ngi ch琲 chuy觧 sinh m韎 c� th� s� d鬾g T� Kim Ch﹏ Кn. T� Kim Ch﹏ Кn v� Ho祅g Kim Ch﹏ Кn nh薾 甶觤 kinh nghi謒 c� th� c閚g d錸 v� s� d鬾g xong th� ph秈 i 60 ng祔 m韎 c� th� s� d鬾g ti誴",floor( TSKV_BeiDouChuanGong_UseLimit/(60*60*24) ) ),
			"K誸 th骳 i tho筰/OnCancel",
		}
	elseif nStep == 4 then
		
		local nCurTime			= GetCurServerTime()
		local nTSKVExp			= GetBeiDouChuanGongExp();
		local nTSKVTime			= GetTask(TSK_BeiDouChuanGong_NIANYUE);
		local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);
		local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
		
		local szMsg_Common = "V韎 c玭g l鵦 hi謓 t筰, i hi謕 c� th� s� d鬾g ph� th玭g truy襫 c玭g ti猲 n.";
		local szMsg_ZiJin  = "V韎 c玭g l鵦 hi謓 t筰, i hi謕 c� th� s� d鬾g T� Kim Ch﹏ Кn.";
		local szMsg_Huang  = "V韎 c玭g l鵦 hi謓 t筰, i hi謕 c� th� s� d鬾g Ho祅g Ch﹏ Кn.";
		
		-- 普通真丹
		if nTSKVExp >= 30e8 and nTSKVTime + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Common = format("Hi謓 t筰 c竎 h� c莕 i th猰 <color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color> m韎 c� th� s� d鬾g ph� th玭g truy襫 c玭g ti猲 n.",nDay,nHour,nMin,nSec);
		end
		
		-- 紫金真丹
		if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_ZiJin = format("Hi謓 t筰 c竎 h� c莕 i th猰 <color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color> m韎 c� th� s� d鬾g T� Kim Ch﹏ Кn.",nDay,nHour,nMin,nSec);
		end
		
		-- 黄真丹
		if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Huang = format("Hi謓 t筰 c竎 h� c莕 i th猰 <color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color> m韎 c� th� s� d鬾g Ho祅g Ch﹏ Кn.",nDay,nHour,nMin,nSec);
		end		
		
		tbSay = 
		{
			format("<dec><npc>%s<enter>%s<enter>%s", szMsg_Common, szMsg_ZiJin, szMsg_Huang),
			"K誸 th骳 i tho筰/OnCancel",
		}
	end
	CreateTaskSay(tbSay)
end

BeiDouChuanGong_tbItem = 
{
	[1] = {szName="B綾 u truy襫 c玭g thu藅", tbProp={6, 1, 1672}, nCount = 1},      
	[2] = {szName="Th蕋 tinh th秓", tbProp={6, 1, 1673}, nCount = 1},          
	[3] = {szName="B竎h ni猲 th蕋 tinh th秓", tbProp={6, 1, 1674}, nCount = 1},      
	[4] = {szName="Thi猲 ni猲 th蕋 tinh th秓", tbProp={6, 1, 1675}, nCount = 1},      
	[5] = {szName="B筩h Ch﹏ Кn", tbProp={6, 1, 1676, 1, 0, 0}, nCount = 1},          
	[6] = {szName="Huy誸 Ch﹏ Кn", tbProp={6, 1, 1677, 1, 0, 0}, nCount = 1},          
	[7] = {szName="Huy襫 Ch﹏ Кn", tbProp={6, 1, 1678, 1, 0, 0}, nCount = 1},
	[8] = {szName="V筺 Ni猲 Ng� Th竔 Hoa", tbProp={6, 1, 2265, 1, 0, 0}, nCount = 1},
	[9] = {szName="T� Kim Ch﹏ Кn", tbProp={6, 1, 2263, 1, 0, 0}, nCount = 1},
}
BeiDouChuanGong_tbRecipe = 
{
	bai		= {tbItemList = {1,2}, nExp = 5e8, tbAwardItem = 5},
	xue		= {tbItemList = {1,3}, nExp = 10e8, tbAwardItem = 6},
	xuan	= {tbItemList = {1,4}, nExp = 15e8, tbAwardItem = 7},
	zijin	= {tbItemList = {1,8}, nExp = 20e8,tbAwardItem = 9},
}
function BeiDouChuanGong_zuodan(szDanType,nStep)
	local tbRecipe = BeiDouChuanGong_tbRecipe[szDanType]
	local tbAwardItem = BeiDouChuanGong_tbItem[tbRecipe.tbAwardItem]
	if nStep ~= 1 then
		local szTitle = format("C竎 h� c� ng � luy謓 <color=yellow>%s<color> kh玭g? N誹 ch蕄 nh薾 kinh nghi謒 hi謓 t筰 c馻 c竎 h� s� b� t鎛 hao.", tbAwardItem.szName)
		local tbOpt = {}
		tbOpt[1] = format("уng �!/#BeiDouChuanGong_zuodan([[%s]],1)", szDanType)
		tbOpt[2] = "H駓 b� /OnCancel"
		return Say(szTitle,getn(tbOpt),tbOpt);
	end
	
	if GetExp() < 1000000 then
		return Say("Xin l鏸, kinh nghi謒 hi謓 t筰 v蒼 ch璦  1 tri謚, kh玭g th� luy謓 產n.", 0)
	end
	
	local tbMaterial = {};
	for i=1, getn(tbRecipe.tbItemList) do
		tinsert(tbMaterial, i, BeiDouChuanGong_tbItem[tbRecipe.tbItemList[i]]);
	end
	BeiDouChuanGong_ComposeClass:Compose(tbMaterial,0,BeiDouChuanGong_zuodan_complished, tbRecipe.nExp, tbAwardItem)
	
end

function BeiDouChuanGong_zuodan_complished(nMaxExp, tbAwardItem)
	local nPlayerCurExp = GetExp();
	local nExp = nMaxExp;
	if nPlayerCurExp < nMaxExp then
		nExp = nPlayerCurExp
	end
	ReduceOwnExp(nExp);
	local nItemIndex = BeiDouChuanGong_lib_AddAward(tbAwardItem, "B綾 u truy襫 c玭g")
	SetSpecItemParam(nItemIndex, 1, mod(nExp, 1e8));	--设置物品能得到的经验
	SetSpecItemParam(nItemIndex, 2, nExp / 1e8);		--设置物品能得到的经验
	SyncItem(nItemIndex);
end
