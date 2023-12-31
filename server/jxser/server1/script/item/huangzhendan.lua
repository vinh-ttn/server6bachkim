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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color>",nDay,nHour,nMin,nSec);
	end		

	local szTitle;
	local tbOpt;
	
	if szMsg_Huang ~= nil then
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, trong th阨 gian 60 ng祔 ch� 頲 s� d鬾g 1 l莕 Ho祅g Ch﹏ Кn, i hi謕 i th猰 %s r錳 h穣 th� l筰.",GetName(), szMsg_Huang);
		tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
	else
		szTitle	= format("Xin ch祇 <color=yellow>%s<color>, s� d鬾g ho祅g ch﹏ n c� th� nh薾 頲 <color=yellow>%s<color> kinh nghi謒. X竎 nh薾 mu鑞 s� d鬾g?",GetName(), 2000000000)
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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d ng祔 %d gi� %d ph髏 %d gi﹜<color>",nDay,nHour,nMin,nSec);
	end			
	
	if szMsg_Huang ~= nil then
		local szTitle = format("Xin ch祇 <color=yellow>%s<color>, trong th阨 gian 60 ng祔 ch� 頲 s� d鬾g 1 l莕 Ho祅g Ch﹏ Кn, i hi謕 i th猰 %s r錳 h穣 th� l筰.",GetName(), szMsg_Huang)
		local tbOpt = 
		{
			"X竎 nh薾/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
		
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tbAwardTemplet:GiveAwardByList({nExp_tl = 2000000000;}, format("%s s� d鬾g ho祅g ch﹏ n", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	return format("\nCh鴄 <color=yellow>%s<color> kinh nghi謒", 2000000000);
end
