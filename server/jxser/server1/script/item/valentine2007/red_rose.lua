--2007年情人节--玫瑰花
--完美的红玫瑰	6,1,1362,1,0,0
--普通的红玫瑰	6,1,1363,1,0,0
--红玫瑰花蕾	6,1,1364,1,0,0

Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070306) ~= 1) then
		Say("Hoa h錸g n祔   l﹗, b﹜ gi�  kh� h衞", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("Th藅 ng筰 qu�, ch� c� ngi ch琲 c蕄 tr猲 80 <color=yellow> n筽 th�<color> m韎 c� th� s� d鬾g hoa h錸g.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1362) then
		nexp = 1500000;
	elseif (np == 1363) then
		nexp = 1000000;
	elseif (np == 1364) then
		nexp = 500000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_VALENTINE_ROSE_ADDEXP);
	if (ncurexp >= 100000000) then
		Say("B筺  s� d鬾g qu� nhi襲 hoa h錸g, kh玭g th� s� d鬾g ti誴 t鬰!", 0);
		Msg2Player("M鏸 ngi s� d鬾g hoa h錸g ch� nh薾 頲 t鑙 產 l� 100 tri謚 甶觤 kinh nghi謒.");
		return 1;
	elseif ((ncurexp + nexp) > 100000000) then
		nexp = 100000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_VALENTINE_ROSE_ADDEXP, ncurexp + nexp)
	Msg2Player(format("B筺 nh薾 頲 %d 甶觤 kinh nghi謒", nexp));
	local szlog = format("[L� t譶h nh﹏ 2007]\t%s\tName:%s\tAccount:%s\t s� d鬾g %s nh薾 頲 %d 甶觤 kinh nghi謒",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;