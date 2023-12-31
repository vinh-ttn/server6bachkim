--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,公共数据
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_06__) then
	__H_MIDAUTUMN_06__ = 1;

Include([[\script\lib\pay.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

EXP_AWARD_LIMIT = 50000000;
AU06_TK_EXP = 1776;

AU06_BEGINDATE = 20060930;
AU06_ENDDATE = 20061013;

AU06_COLORED_LIMITED = 3000;


--灯笼数据表
tab_Lightcage = {
--		1	2		3		4		5		6		7	8		9
	{1229, 1221, "L錸g n bm bm", "Gi蕐 ki課g v祅g (V藅 li謚 l祄 l錸g n)", 1000, 1241, 1235, "B竛h trung thu thng", 2},
	{1230, 1222, "L錸g n ng玦 sao", "Gi蕐 ki課g lam (V藅 li謚 l祄 l錸g n)", 2000, 1242, 1236, "B竛h trung thu u xanh", 2},
	{1231, 1223, "L錸g n 鑞g", "Gi蕐 ki課g l鬰 (V藅 li謚 l祄 l錸g n)", 3000, 1243, 1237, "B竛h trung thu nh﹏ tr鴑g", 2},
	{1232, 1224, "L錸g n tr遪", "Gi蕐 ki課g  (V藅 li謚 l祄 l錸g n)", 4000, 1244, 1238, "B竛h trung thu c bi謙", 2},
	{1233, 1225, "L錸g n c� ch衟", "Gi蕐 ki課g cam (V藅 li謚 l祄 l錸g n)", 5000, 1245, 1239, "B竛h trung thu h箃 sen", 1},
	{1234, 1225, "L錸g n k衞 qu﹏", "Gi蕐 ki課g cam (V藅 li謚 l祄 l錸g n)", 5000, 1245, 1240, "B竛h trung thu con heo", 5},
}

tab_BasicMaterial = {
	{1226, "Thanh tre (V藅 li謚 l祄 l錸g n)"},
	{1227, "D﹜ c鉯 (V藅 li謚 l祄 l錸g n)"},
	{1228, "N課"},
}

--是否在活动期间 返回：1在 ,0 不在活动期间
function au06_is_inperiod()
	if (gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		return 0
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= AU06_BEGINDATE and nDate <= AU06_ENDDATE) then --
		return 1;
	end;
	return 0;
end;

--是否为50级充值用户
function au06_IsPayed_player()
	if (IsCharged() == 0) then
		return 0;
	end;
	return 1;
end;

function oncancel()
end;

end;	--//end of __H_MIDAUTUMN_06__