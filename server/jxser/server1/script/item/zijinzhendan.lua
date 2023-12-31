-- 文件名　：chuangongdan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("Ch� c� nh﹏ v藅  tr飊g sinh m韎 c� th� s� d鬾g T� Kim Ch﹏ Кn", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d鬾g ch﹏ 產n n祔 kh玭g th� nh薾 頲 kinh nghi謒.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color>",nDay,nHour,nMin,nSec);
	end
		
	local szTitle;
	local tbOpt;
	
	if szMsg_ZiJin ~= nil then
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, trong th阨 gian 60 ng祔 ch� 頲 s� d鬾g 1 l莕 T� Kim Ch﹏ Кn, i hi謕 i th猰 %s r錳 h穣 th� l筰.",GetName(),szMsg_ZiJin)
		tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
	else
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, s� d鬾g ti猲 n n祔 c� th� nh薾 頲 <color=yellow>%s<color> kinh nghi謒. X竎 nh薾 mu鑞 s� d鬾g?",GetName(), nContainExp)
		tbOpt = 
		{
			format("X竎 nh薾/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"H駓 b� /OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("Ch� c� nh﹏ v藅  tr飊g sinh m韎 c� th� s� d鬾g T� Kim Ch﹏ Кn", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d鬾g ch﹏ 產n n祔 kh玭g th� nh薾 頲 kinh nghi謒.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color>",nDay,nHour,nMin,nSec);
	end	
	
	
	if szMsg_ZiJin ~= nil then
		local szTitle = format("Xin ch祇 <color=yellow>%s<color>, trong th阨 gian 60 ng祔 ch� 頲 s� d鬾g 1 l莕 T� Kim Ch﹏ Кn, i hi謕 i th猰 %s r錳 h穣 th� l筰.",GetName(),szMsg_ZiJin)
		local tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			
			tbAwardTemplet:GiveAwardByList({nExp_tl = nContainExp;}, format("%s s� d鬾g T� Kim Ch﹏ Кn", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
			
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nCh鴄 <color=yellow>%s<color> kinh nghi謒", nContainExp);
end
