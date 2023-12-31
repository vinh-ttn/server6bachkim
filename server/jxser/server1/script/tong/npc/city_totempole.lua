--城市特技图腾NPC
--Edit by 子非鱼℃
--2006-06-20

Include("\\script\\tong\\tong_setting.lua")
-- 同伴系统的支持
IncludeLib("PARTNER");
IncludeLib("ITEM");
Include([[\script\lib\coordinate.lua]]);--支持设定文件访问
LINK_TONG_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>C閠 bi觰 tng bang: <link>"
LINK_CITY_TOTEMPOLE = "<link=image[0,0]:\\spr\\npcres\\building\\totempole_small.spr>C閠 bi觰 tng th祅h th�: <link>"

--城市图腾
function main()
	local _Name, nTongID = GetTongName()
	
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ngi ch璦 gia nh藀 bang, mu鑞 n y tham quan sao?")
		return
	end
	
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("Зy kh玭g ph秈 l� l穘h a c馻 qu� bang, ch� l� n tham quan th玦.")
		return
	elseif (nStuntID == 0) then
			totempole_dec("Bang h閕 qu� bang ch璦 m� k� n╪g th祅h th�, kh玭g th� s� d鬾g C閠 bi觰 tng. H穣 th玭g b竜 n c蕄 l穘h o bang, t筰 trang ch鴆 n╪g c� th� khai m� k� n╪g th祅h th�.")
			return
	end
		--执行对应特技
		getglobal(TB_STUNTID_INFO[nStuntID].func)(nTongID, nStuntID)
end



function IsTakeStunt(nTongID,nStuntRight)
	local _Name, nTongID = GetTongName()
	local aryDescribe = {}
	if (nTongID == 0) then
		totempole_dec("Ngi ch璦 gia nh藀 bang, mu鑞 n y tham quan sao?")
		return
	end
	local nStuntID = tong_GetCityStuntID(nTongID)
	if (nStuntID == 0) then
		print("Kh玭g ph秈 bang chi誱 th祅h!")
		return
	end
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		totempole_dec("Зy kh玭g ph秈 l� l穘h a c馻 qu� bang, ch� l� n tham quan th玦.")
		return
	elseif (TONG_GetWeek(nTongID) > TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD)) then
		totempole_dec("K� n╪g th祅h th�  qu� h筺 b秓 tr�, hi謓 t筰 kh玭g th� nh薾. H穣 th� l筰 th阨 gian b秓 tr� h玬 nay.")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if (nHour < 20 or nHour > 22) then
		totempole_dec("Th阨 gian ti誴 nh薾 k� n╪g th祅h th� l� 20:00 n 22:00, trong kho秐g th阨 gian n祔 h穣 n nh薾 k� n╪g.")
		return
	end
	
	if (nStuntRight == 1) then
	--管理特技的权限
		local nFigure = TONGM_CheckRight(nTongID, GetName(), 2006)
		if (nFigure == 1) then
			if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) > 0) then
				return 1
			else
				totempole_dec("K� n╪g th祅h th� trong tu莕 n祔  nh薾 h誸 r錳, h穣 i tu莕 sau m韎 c� th� nh薾 n鱝.")
			end
		else
			totempole_dec("K� n╪g th祅h th� n祔 ch� cho ph衟 c蕄 l穘h o bang ti誴 nh薾.")
		end
		return
	end
	
	if (GetTask(TASKID_STUNT_LASTWEEK) == TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) and GetTask(TASKID_CITYST_TAKED) >= TB_STUNTID_INFO[nStuntID].cntper) then
		totempole_dec("Trong tu莕 n祔  ti誴 nh薾 k� n╪g th祅h th� r錳, kh玭g th� nh薾 n鱝.")
		return
	elseif (GetTask(TASKID_STUNT_LASTWEEK) ~= TONG_GetWeek(nTongID)) then
		SetTask(TASKID_STUNT_TAKED, 0)
	end
	
	if (GetTask(TASKID_CITY_LASTDAY) == TONG_GetDay(nTongID)) then
		totempole_dec("K� n╪g bang h閕 m鏸 ng祔 ch� c� th� nh薾 1 l莕, ng祔 mai h誸 n nh�.")
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) <= 0) then
		totempole_dec("K� n╪g th祅h th� h玬 nay ti誴 nh薾 h誸 r錳, ng祔 mai h穣 n nh�.")
		return
	end
	
	--个人累积贡献度限制
	--if 个人累积贡献度 < MIN then return end
	return nTongID
end

function OnCancel()
end

--城市特技：黄金令
function stunt_huangjinling(nTongID, nStuntID)

	TB_STUNT_HUANGJINLING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_HUANGJINLING.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_HUANGJINLING.describe.."<color>"..
	"<enter>Th阨 gian hi謚 l鵦 k� n╪g l� 7 ng祔. H玬 nay v蒼 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
	"Ti誴 nh薾 k� n╪g/stunt_huangjinling1",
	"R阨 kh醝/OnCancel")
end

function stunt_huangjinling1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H祅h trang c莕 <color=yellow>%d<color> � tr鑞g.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_HUANGJINLING.right)) then
		return
	end
	if (AddItem(6, 1, 1107, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		--这两句在这里其实不必要
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh薾 頲 1 <color=yellow>Ho祅g Kim L謓h!<color>")
		Msg2Tong(nTongID, GetName().."Nh薾 頲 1 Ho祅g Kim L謓h k� n╪g th祅h th�")
		TONG_ApplyAddEventRecord(nTongID, GetName().."Nh薾 頲 1 Ho祅g Kim L謓h k� n╪g th祅h th�")
	end
end

--城市特技：灵参力
function stunt_lingshenli(nTongID, nStuntID)
	TB_STUNT_LINGSHENLI = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(
	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_LINGSHENLI.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_LINGSHENLI.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_LINGSHENLI.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
	"Ti誴 nh薾 k� n╪g/stunt_lingshenli1",
	"R阨 kh醝/OnCancel")
	
end

function stunt_lingshenli1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_LINGSHENLI.right)) then
		return
	end
	if (AddItem(6, 1, 1110, 1, 1, 1) > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh薾 頲 m閠 <color=yellow>H閜 nh﹏ s﹎<color>, m� ra l藀 t鴆 nh薾 頲 linh l鵦 c馻 nh﹏ s﹎ ng祅 n╩.")
	else
		Msg2Player("Nh薾 linh s﹎ l鵦 th蕋 b筰!")
	end
end

--112
function stunt_shiweiying(nTongID, nStuntID)
	TB_STUNT_SHIWEIYING = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_SHIWEIYING.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_SHIWEIYING.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_SHIWEIYING.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
	"Ti誴 nh薾 k� n╪g/stunt_shiweiying1",
	"R阨 kh醝/OnCancel")
end

function stunt_shiweiying1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	if (PARTNER_Count() >= 5) then
		totempole_dec("S� lng b筺 ng h祅h  t gi韎 h筺, ch� c� x鉧 b� 1 b筺 ng h祅h m韎 c� th� nh薾 k� n╪g n祔. Nh璶g x鉧 b� 1 b筺 ng h祅h r蕋 t祅 nh蒼, ngi h穣 suy ngh� cho k�.")
		return
	end
	totempole_dec("Ch鋘 ng� h祅h cho b筺 ng h祅h.",
	"h� Kim/stunt_shiweiying2",
	"h� M閏/stunt_shiweiying2",
	"h� Th駓/stunt_shiweiying2",
	"h� H醓/stunt_shiweiying2",
	"h� Th� /stunt_shiweiying2",
	"Ta mu鑞 suy ngh� l筰/OnCancel"	)
end

TB_SERIES_NAME = {"Kim", "M閏", "Th駓 ", "H醓", "Th� "}
TB_CHARACTOR = {"D騨g M穘h","V� Ch�  ","L璾 Mang ","N鋋 Nhc"}
function stunt_shiweiying2(nSel)
	SetTaskTemp(112, nSel)
	totempole_dec("Х l鵤 ch鋘 ng� h祅h b筺 ng h祅h l� h� "..TB_SERIES_NAME[nSel+1].." , h穣 ti誴 t鬰 ch鋘 l鵤 t輓h c竎h.",
	TB_CHARACTOR[1].."/stunt_shiweiying3",
	TB_CHARACTOR[2].."/stunt_shiweiying3",
	TB_CHARACTOR[3].."/stunt_shiweiying3",
	TB_CHARACTOR[4].."/stunt_shiweiying3",
	"K誸 th骳 i tho筰/OnCancel"	)
end

function stunt_shiweiying3(nSel)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_SHIWEIYING.right)) then
		return
	end
	local nseries = GetTaskTemp(112)
	local ncharactor = nSel + 1
	if (nseries == 0) then
		partnerIndex = PARTNER_AddFightPartner(5, 0, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 1) then
		partnerIndex = PARTNER_AddFightPartner(4, 1, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 2) then
		partnerIndex = PARTNER_AddFightPartner(2, 2, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	elseif (nseries == 3) then
		partnerIndex = PARTNER_AddFightPartner(3, 3, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	else
		partnerIndex = PARTNER_AddFightPartner(1, 4, ncharactor, random(5,10), random(5,10), random(5,10), random(5,10), random(5,10), random(5,10))
	end
	if (partnerIndex == -1) then
		totempole_dec("Ti誴 nh薾 b筺 ng h祅h th蕋 b筰, h穣 th� l筰 sao.")
		return
	end
	PARTNER_SetCurPartner(partnerIndex)
	PARTNER_CallOutCurPartner(1)
	local nlevel = random(1,49)
	for i = 1, nlevel do
		PARTNER_AddExp(partnerIndex, 825500)	--50级需要经验
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("Nh薾 頲 1 b筺 ng h祅h h� <color=yellow>"..TB_SERIES_NAME[nseries+1].."<color>, lo筰 h譶h <color=yellow>"..TB_CHARACTOR[ncharactor].."<color>.")
end

--陶朱钱袋
function stunt_moneybox(nTongID, nStuntID)
	TB_STUNT_MONEYBOX = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_MONEYBOX.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_MONEYBOX.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_MONEYBOX.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
	"Ti誴 nh薾 k� n╪g/stunt_moneybox1",
	"R阨 kh醝/OnCancel")
end

function stunt_moneybox1()
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_RIGHT_DS.right)) then
		return
	end
	
	local ntime = floor(GetCurServerTime()/60) + 2 * 24 * 60
	SetTask(TASKID_MONEYBOX_LASTTIME, ntime)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
	totempole_dec("B筺 nh薾 頲 1 <color=yellow>Уo Chu Ti襫<color>, c� hi謚 qu� trong 2 ng祔!")

end

--无双杀阵--------------------------------
function stunt_wushuang(nTongID, nStuntID)
	TB_STUNT_WSSZ = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WSSZ.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_WSSZ.describe.."<color>"..
	"<enter>Th阨 h筺 k� n╪g n祔 l� 7 ng祔.", 
	"Ti誴 nh薾 k� n╪g/wsh_getwushuangshazhen",
	"Lo筰 h譶h V� song s竧 tr薾/wsh_typewushuangshazhen",
	"R阨 kh醝/OnCancel")
end

--领取 无双杀阵
function wsh_getwushuangshazhen()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H祅h trang c莕 <color=yellow>%d<color> � tr鑞g.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WSSZ.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	local nItem = AddItem(6, 1, 1106, 1, 0, 0, 0); --得到一个 无双杀阵
	
	if (nItem > 0) then
		SetSpecItemParam(nItem, 1, 120);
		SyncItem(nItem)
		totempole_dec("Nh薾 頲 <color=yellow>Vo song s竧 tr薾<color>.")
		Msg2Player("Nh薾 th祅h c玭g 1 <color=yellow>V� song s竧 tr薾<color>.");
		Msg2Tong(nTongID, GetName().."Nh薾 頲 k� n╪g th祅h th� - V� song s竧 tr薾")
		TONG_ApplyAddEventRecord(nTongID, GetName().."Nh薾 頲 k� n╪g th祅h th� - V� song s竧 tr薾")
	end;
	
	SetTaskTemp(193, 0);
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
MAPFILE = [[\settings\item\004\mask.txt]];
function wsh_typewushuangshazhen()
	local nMaskIdx;
	local szMaskName;
	local szContent = "khu玭 m蓇 v� song s竧 tr薾 c馻 qu� bang hi謓 t筰 l�: <color=yellow>"; 
	local tab_mask = {};
	
	local _, nTongID = GetTongName()
	local nFigure = TONGM_CheckRight(nTongID, GetName(), RIGHTID_STUNT);
	if (nFigure ~= 1) then
		SetTaskTemp(193, 0);
		totempole_dec("<color=yellow>khu玭 m蓇<color> v� song s竧 tr薾 ch� c� c蕄 l穘h o bang h閕 m韎 c� th� thay i.");
		return
	end
	
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_mask, szMaskName);
		end;
	end;
	
	if (getn(tab_mask) > 0) then
		szContent = szContent..tab_mask[1];
		for i = 2, getn(tab_mask) do
			szContent = szContent..", "..tab_mask[i];
		end;
		szContent = szContent.."<color>.";
	else
		szContent = "V� song s竧 tr薾 c馻 qu� bang v蒼 ch璦 c� khu玭 m蓇 g�, ";
	end;
	
	Say(szContent.."Ngi mu鑞 ti課 h祅h thao t竎 g�?", 3, 
		"Ta mu鑞 th猰 v祇 khu玭 m蓇/add_face", 
		"Ta mu鑞 b� b韙 khu玭 m蓇/removeface", 
		"R阨 kh醝/OnCancel");
end;

function add_face()
	local nFaceCount = getfacecount();
	if (nFaceCount >= 10) then
		Say("B筺  l鵤 ch鋘 10 khu玭 m蓇, n誹 mu鑞 th猰 khu玭 m蓇 m韎 c莕 ph秈 b� b韙 1 khu玭 m蓇, c� mu鑞 ti誴 t鬰 kh玭g?", 2, "Ta mu鑞 th猰 v祇 khu玭 m蓇 m韎./removeface", "в ta suy ngh� l筰/no")
		return
	end;
	
	--写一个放入界面
	GiveItemUI("H穣 a v祇 1 m苩 n�", "Х a v祇 1 m苩 n�, sau khi V� song s竧 tr薾 ph竧 huy t竎 d鬾g s� bi課 th祅h h譶h d竛g mong mu鑞?", "add_ui_confirm", "no");
end;

function add_ui_confirm(nCount)
	if (nCount ~= 1) then
		Say("S� lng v藅 ph萴 b� v祇 kh玭g ng.", 0);
		return
	end;
	
	local nItemIdx = GetGiveItemUnit(1);
	nItemGenre, nDetailType, nParticualrType = GetItemProp(nItemIdx);
	
	if (nItemGenre ~= 0 or nDetailType ~= 11) then
		Say("V藅 ph萴 b� v祇 kh玭g ph秈 l� m苩 n�.", 0);
		return
	end;
	
	if (nParticualrType == 366) then
		Say("<color=yellow>M苩 n� ng魕 trang<color> kh玭g th� l祄 khu玭 m蓇 V� song s竧 tr薾.", 0);
		return
	end;
	
	if (itemcheck(nParticualrType) == 0) then
		Say("khu玭 m蓇 m苩 n� n祔  c� r錳.", 0);
		return
	end;
	
	addoneface(nParticualrType); --增加一个外形
	Msg2Player("B筺  th猰 v祇 khu玭 m蓇 V� song s竧 tr薾 cho bang h閕.");
end;

function itemcheck(nParticualrType)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == nParticualrType) then
			return 0;
		end;
	end;
	return 1;
end;

function removeface()
	local tab_sel = {};
	_, nTongID = GetTongName();
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_sel, "H駓 b�"..szMaskName.."T筼 khu玭/#deloneface("..i..")");
		end;
	end;
	tinsert(tab_sel, "в ta suy ngh� k� l筰 xem/OnCancel");
	if (getn(tab_sel) <= 0) then
		Say("Ch璦 ch鋘 khu玭 m蓇 V� song s竧 tr薾 n祇.", 0);
		return
	end;
	Say("Mu鑞 h駓 b� khu玭 m蓇 n祇?", getn(tab_sel), tab_sel);
end;

function getfacecount()
	_, nTaskID = GetTongName();
	local nCount = 0;
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) ~= 0) then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

function addoneface(nValue)
	_, nTaskID = GetTongName();
	for i = 1, 10 do
		if (TONG_GetTaskValue(nTaskID, TTK_FACE[i]) == 0) then
			TONG_ApplySetTaskValue(nTaskID, TTK_FACE[i], nValue);
			return
		end;
	end;
end;

function deloneface(nIdx)
	_, nTaskID = GetTongName();
	if (nIdx < 1 or nIdx > 10) then
		return
	end;
	TONG_ApplySetTaskValue(nTaskID, TTK_FACE[nIdx], 0);
	Msg2Player("H駓 b� 1 khu玭 m蓇 V� song s竧 tr薾 c馻 bang h閕.");
end;
-------------------------------------------------------------
--锻武魂-----
REPAREATT = 40; --每次增加多少耐久度
function stunt_duanwuhun(nTongID, nStuntID)
	TB_STUNT_DWH = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_DWH.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_DWH.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_DWH.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_DWH.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
		"ng v藋, d飊g Luy謓 v� h錸  gia c� v� kh�./dwh_Enhance", 
		"Sau n祔 h穣 n鉯!/OnCancel");
end

function dwh_Enhance()
	TRepair("EnhanceRepair( %d )");
end;

--进行强化武器
function EnhanceRepair(nItemIdx)
	
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang b� n祔 kh玭g th� cng h鉧.")
	end
	local nDur = GetCurDurability(nItemIdx);
	local nRepairDur = nDur + REPAREATT;
	if (nRepairDur > 255) then
		nRepairDur = 255;
	end;
	
	totempole_dec("<#>S鯽 gia c� trang b� n祔 c� th� n﹏g cao  b襫, m鏸 l莕 t╪g th猰 <color=yellow>"..REPAREATT.."<color> 甶觤,  b襫 cao nh蕋 l� <color=yellow>"..(255).."<color> 甶觤,  b襫 hi謓 t筰 c馻 trang b� l� <color=yellow>"..nDur.."<color>, sau khi gia c�  b襫 s� l� <color=yellow>"..nRepairDur.."<color>, ngi mu鑞 s鯽 ch鱝 kh玭g?",
		"S鯽 ch鱝/#Enhance_Repair("..nItemIdx..", "..nRepairDur..")", 
		"Kh玭g c莕 u/cancel")
end

function Enhance_Repair(nItemIdx, nRepairDur)
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_DWH.right)) then
		return
	end
	local nQuality = GetItemQuality(nItemIdx)
	
	if nQuality == 4 then
		Talk(1, "", "Trang b� n祔 kh玭g th� cng h鉧.")
	end

	if (nItemIdx > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		
		EH_SetCurDurability(nItemIdx, nRepairDur);
		Msg2Player("Trang b�  頲 gia c�.");
	end;
end

function stunt_fenghuang(nTongID, nStuntID)
	TB_STUNT_FHY = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_FHY.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_FHY.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_FHY.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_FHY.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
		"ng v藋, ta mu鑞 nh薾 Ph鬾g Ho祅g 蕁/fhy_getfenghuangyin", 
		"Sau n祔 h穣 n鉯!/OnCancel");
end

function fhy_getfenghuangyin()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H祅h trang c莕 <color=yellow>%d<color> � tr鑞g.",5))
		return
	end
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_FHY.right)) then
		SetTaskTemp(193, 0);
		return
	end
	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
	SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
	SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
	SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)

	AddItem(6, 1, 1105, 1, 0, 0, 0);
	totempole_dec("B筺 nh薾 頲 1 <color=yellow>Ph鬾g Ho祅g 蕁<color>.")
	Msg2Player("Nh薾 th祅h c玭g 1<color=yellow>Ph鬾g Ho祅g 蕁<color>.");
	
	SetTaskTemp(193, 0);
end;

function totempole_dec(szMsg, ...)
	if (szMsg == nil) then
		return
	end	
		
	szMsg = LINK_CITY_TOTEMPOLE..szMsg
	if (getn(arg) == 0) then
		Describe(szMsg, 1, "K誸 th骳 i tho筰/OnCancel")
	else
		Describe(szMsg, getn(arg), arg)
	end
end

function stunt_wushenbless(nTongID, nStuntID)
	TB_STUNT_WUSHENBLESS = TB_STUNTID_INFO[nStuntID]
	local _, nCityID = tong_GetCityStuntID(nTongID)
	local nlastDay = getRelativeDay(nTongID) - TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) + 7
	totempole_dec(	"<enter>"..GetCityAreaName(nCityID).."K� n╪g th祅h th�: "..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.name.."<color>"..
	"<enter>Quy襫 ti誴 nh薾 k� n╪g: "..
	"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNT_WUSHENBLESS.right].."<color>"..
	"<enter>T竎 d鬾g c馻 k� n╪g c bi謙:"..
	"<enter><color=yellow>    "..TB_STUNT_WUSHENBLESS.describe.."<color>"..
	"<enter>Th阨 h筺 c馻 k� n╪g n祔 l� 7 ng祔, trong th阨 h筺 n祔 cho ph衟 t鑙 產 "..TB_STUNT_WUSHENBLESS.maxmem.." ngi ti誴 nh薾 k� n╪g, m鏸 ng祔 m閠 ngi ch� nh薾 頲 1 l莕. H玬 nay c遪 cho ph衟 "..TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT).." ngi n鱝 n nh薾 k� n╪g n祔.", 
	"Ti誴 nh薾 k� n╪g/stunt_wushenbless1",
	"R阨 kh醝/OnCancel")
end;

function stunt_wushenbless1()
	local nFreeBag = CalcFreeItemCellCount()
	if (nFreeBag < 5) then
		Talk(1,"",format("H祅h trang c莕 <color=yellow>%d<color> � tr鑞g.",5))
		return
	end
	local _, nTongID = GetTongName()
	if (not IsTakeStunt(nTongID, TB_STUNT_WUSHENBLESS.right)) then
		return
	end
	local nItemIdx = AddItem(6, 1, 1264, 1, 1, 1);
	if (nItemIdx > 0) then
		local nlasttime = getExpiredTime2DayEnd() * 60;
		local nlastday = 7 - tonumber(GetLocalDate("%w"));
		if (nlastday == 7) then
			nlastday = 0;
		end;
		local ntime = GetCurServerTime() + nlasttime + nlastday * 24 * 60 * 60;
		
		SetSpecItemParam(nItemIdx, 1, ntime);
		SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
		SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
		SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
		SyncItem(nItemIdx);
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, -1)
		SetTask(TASKID_STUNT_LASTWEEK, TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD))
		SetTask(TASKID_CITY_LASTDAY, getRelativeDay(nTongID))
		SetTask(TASKID_CITYST_TAKED, GetTask(TASKID_CITYST_TAKED) + 1)
		totempole_dec("Nh薾 頲 <color=yellow>V� Th莕 T� Ph骳<color>, sau khi s� d鬾g s� nh薾 頲 2 gi� nh﹏ i 甶觤 c鑞g hi課 (ch� v韎 ho箃 ng T鑞g Kim, nhi謒 v� t輓 s�, th� th竎h th阨 gian, v� l﹎ li猲 u, D� T萿, m Huy Ho祅g).")
	else
		Msg2Player("Nh薾 V� th莕 t� ph骳 th蕋 b筰!")
	end
end;

-------获得到本日24时的时间差，单位：分
function getExpiredTime2DayEnd()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMin = tonumber(GetLocalDate("%M"));
	
	return (24 - nNowHour - 1) * 60 + (60 - nNowMin);
end;