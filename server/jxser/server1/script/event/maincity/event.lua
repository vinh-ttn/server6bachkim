--七大城市 服务器
--主城城主奖励

Include("\\script\\lib\\gb_taskfuncs.lua");		--gb_Task
Include("\\script\\misc\\league_cityinfo.lua")
TB_MAINCITY_CITYWAR_T = {
--[城市编号]={攻城星期，城市Map，城市名}
	{4, 1, "Phng Tng"},
	{2, 11, "Th祅h Й"},
	{3, 162, "Чi L�"},
	{6, 37, "Bi謓 Kinh"},
	{5, 78, "Tng Dng"},
	{1, 80, "Dng Ch﹗"},
	{7, 176, "L﹎ An"},
}

TB_MAINCITY_AWARDARY = {
--g,d,p,l,s,luck, count, free
	[1] = {6,1,1339,1,1,1, 10, 10},
	[2] = {6,1,1340,1,1,1, 100, 50},
}

--GetCityOwner()
function maincity_award_entry()
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (GetTongMaster() ~= GetName() or GetCityOwner(city_id) ~= GetTongName()) then
		Say("<#>Ngi kh玭g ph秈 l� Th竔 th� c馻 <"..GetCityAreaName(city_id).."Ph�>, kh玭g th� nh薾 ph莕 thng!", 0);
		return 0;
	end;
	
	Say("<#>Nh薾 ph莕 thng d祅h cho Th竔 Th� ",
	3,
	"<#>Nh薾 Th祅h ch� L� bao/take_maincity_award",
	"<#>Nh薾 Th祅h ch� L� ph萴/take_maincity_award",
	"<#> T筸 th阨 ta kh玭g l穘h u/OnCancel");
end;

function take_maincity_award(nSel)
	local nlg_tsk = nSel + 1;
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (check_award_condition(city_id, nlg_tsk, 1) ~= 1) then
		return 0;
	end;
	
	local ncount = TB_MAINCITY_AWARDARY[nlg_tsk][8];
	local ncurcount = get_citybonus_task(city_id, nlg_tsk);
	if (CalcFreeItemCellCount() < ncount) then
		Say("<#>H祅h trang c馻 ngi kh玭g  ch� tr鑞g, xin h穣 s緋 x誴 l筰!", 0);
		return 0;
	end;
	local ng, nd, np, nl, ns, nluck = TB_MAINCITY_AWARDARY[nlg_tsk][1],TB_MAINCITY_AWARDARY[nlg_tsk][2],TB_MAINCITY_AWARDARY[nlg_tsk][3],
																		TB_MAINCITY_AWARDARY[nlg_tsk][4],TB_MAINCITY_AWARDARY[nlg_tsk][5],TB_MAINCITY_AWARDARY[nlg_tsk][6];
	
	
	local szLogmsg = "";
	if (nlg_tsk == 1) then
		szLogmsg = " nh薾 Th祅h ch� L� bao";
	else
		szLogmsg = "Th祅h ch� L� ph萴";
		if (ncurcount >= ncount) then
			szLogmsg = "Nh薾 t th� 2: "..szLogmsg;
		else
			szLogmsg = "Nh藅 t th� 1: "..szLogmsg;
		end;
	end;
	
	set_citybonus_task(city_id, nlg_tsk, ncount+ncurcount);
	for i = 1, ncount do
		AddItem(ng, nd, np, nl, ns, nluck);
	end;
	WriteLog("[Ph莕 thng server Th蕋 Чi Th祅h Th轢\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t").."Name:"..GetName().." Account:"..GetAccount()..szLogmsg..ncount.."c竔");
	Say("<#>Ngi "..szLogmsg..". Xin ch骳 m鮪g!", 0);
end;

function check_award_condition(city_id, nlg_tsk, show_talk)
	if (city_id > 7 or city_id < 1) then
		if (show_talk) then
			Say("<#>Ch� nh Th竔 th� sai s鉻, xin li猲 l筩 v韎 ngi qu秐 l�!", 0);
		end;
		return 0
	end;
	local nDeadline = get_maincity_deadline(city_id);
	
	local ncurweek = tonumber(GetLocalDate("%w"));
	if (ncurweek == 0) then
		ncurweek = 7;
	end;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == ncurweek and tonumber(GetLocalDate("%H%M")) >= 2000 and tonumber(GetLocalDate("%H%M")) < 2230) then
		Say("<#>ng th阨 gian c玭g th祅h, Th祅h ch� kh玭g th� nh薾 ph莕 thng.", 0);
		return 0;
	end;
	local nTskDate = get_maincitybonus_date(city_id);
	if (nDeadline ~= nTskDate) then
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_BONUS, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_GIFT, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_DATE, nDeadline);
	end;
	local ntskvalue = get_citybonus_task(city_id, nlg_tsk);
	
	if (ntskvalue >= TB_MAINCITY_AWARDARY[nlg_tsk][7]) then
		if (show_talk) then
			Say("<#>Ngi ch糿g ph秈  nh薾 ph莕 thng tu莕 n祔 r錳 sao?", 0);
		end;
		return 0;
	end;
	return 1;
end;

function get_maincity_deadline(city_id)
	local nServerTime = GetCurServerTime();
	local nCurWeek = tonumber(GetLocalDate("%w"));
	if (nCurWeek == 0) then
		nCurWeek = 7;
	end;
	local nCurDate = floor(FormatTime2Number(nServerTime) / 10000);
	local nCurTime = mod(FormatTime2Number(GetCurServerTime()) , 10000);
	local naddtime = 0;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == nCurWeek) then
		if (nCurTime < 2000) then
			return nCurDate;
		else
			naddtime = 7;
		end;
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] < nCurWeek) then
		naddtime = (7 - nCurWeek + TB_MAINCITY_CITYWAR_T[city_id][1]);
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] > nCurWeek) then
		naddtime = (TB_MAINCITY_CITYWAR_T[city_id][1] - nCurWeek);
	end;
	return floor(FormatTime2Number(nServerTime + naddtime * 24 * 60 * 60) / 10000)
end;

