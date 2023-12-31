-- 文件名　：npc_trans.lua
-- 创建者　：wangjingjun
-- 内容　　：150级技能山洞地图传送者
-- 创建时间：2011-07-28 10:48:34

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Ngi mu鑞 甶 u, ta a ngi 甶 kh玭g l蕐 ti襫:"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"Phng Tng Ph� ", wlls_want2go,{1}});
	tinsert(tbDailog, {"Th祅h Й Ph� ", wlls_want2go,{11}});
	tinsert(tbDailog, {"Чi L�", wlls_want2go,{162}});
	tinsert(tbDailog, {"Bi謓 Kinh Ph� ", wlls_want2go,{37}});
	tinsert(tbDailog, {"Tng Dng Ph� ", wlls_want2go,{78}});
	tinsert(tbDailog, {"Dng Ch﹗ Ph� ", wlls_want2go,{80}});
	tinsert(tbDailog, {"L﹎ An Ph� ", wlls_want2go,{176}});
	tinsert(tbDailog, {"H駓 b� "})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end



tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Phng Tng Ph� " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th祅h Й Ph� " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "Bi謓 Kinh Ph� " },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "Tng Dng Ph� " },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "Dng Ch﹗ Ph� " },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "Чi L�" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L﹎ An Ph� " }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end

	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("Ng錳 y猲 ch璦? Ch髇g ta 甶 "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
	
	SetLogoutRV(0);
end
