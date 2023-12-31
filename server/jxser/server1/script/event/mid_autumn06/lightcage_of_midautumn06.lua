--by 廖志山 [2006-09-12]
--2006中秋活动之做灯笼活动,打怪得到灯笼,灯笼换取经验和月饼.
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

--中秋活动入口函数
function au06_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� tham gia ho箃 ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta mu鑞 l祄 l錸g n bm bm [c莕 2 gi蕐 ki課g v祅g, 1 thanh tre, 1 d﹜ c鉯, 1 n課  v� 1000 lng]/#determine_process( 1 )",
		"Ta mu鑞 l祄 l錸g n ng玦 sao [c莕 2 gi蕐 ki課g lam, 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� 2000 lng]/#determine_process( 2 )",
		"Ta mu鑞 l祄 l錸g n 鑞g [c莕 2 gi蕐 ki課g l鬰, 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� 3000 lng]/#determine_process( 3 )",
		"Ta mu鑞 l祄 l錸g n tr遪 [c莕 2 gi蕐 ki課g , 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� 4000 lng]/#determine_process( 4 )",
		"Ta mu鑞 l祄 l錸g n c� ch衟 [c莕 1 gi蕐 ki課g cam, 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� 5000 lng]/#determine_process( 5 )",
		"Ta mu鑞 l祄 l錸g n k衞 qu﹏ [c莕 5 lo筰 gi蕐 ki課g, 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� 5000 lng]/sure_colorfulcage",
		"Ch� n th╩ 玭g ch髏 th玦!/oncancel"
	};
	Say("L錸g n ta l祄 n鎖 danh kh緋 n琲, ngi ngi u th輈h. Kh竎h quan mu鑞 l祄 l錸g n g�?", getn(tab_Content), tab_Content);
end;

--确定制造(普通灯笼)
function determine_process(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5};
	local szCageName = tab_Lightcage[nIndex][3];
	Say("L祄 "..szCageName.."c莕 <color=yellow>"..tab_Lightcage[nIndex][9].."M� "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� <color=red>"..tab_Lightcage[nIndex][5].."<color> lng ti襫 c玭g, l祄 ch�?", 2, "ng! Xin l穙 b鑙 tr� t礽!/#process_lightcage("..tab_Index[nIndex]..")", "Ta s� quay l筰 sau!/oncancel");
	
end;

--制造灯笼(普通灯笼制造)
function process_lightcage(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	
	local szCageName = tab_Lightcage[nIndex][3];
	local bEnough = 1;
	--检查材料
	if (GetCash() < tab_Lightcage[nIndex][5]) then
		bEnough = 0;
	end;
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][2], -1) < tab_Lightcage[nIndex][9]) then
		bEnough = 0;
	end

	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh竎h quan kh玭g  v藅 li謚, <color=red>"..szCageName.."<color> c莕 <color=yellow>"..tab_Lightcage[nIndex][9].."M� "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d﹜ c鉯, 1 n課 v� <color=red>"..tab_Lightcage[nIndex][5].."<color> lng ti襫 c玭g.", 1, "в ta 甶 chu萵 b� !/oncancel");
		return
	end;
	
	--删除材料
	if (Pay(tab_Lightcage[nIndex][5]) == 0) then
		return
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	if (ConsumeEquiproomItem(tab_Lightcage[nIndex][9], 6, 1, tab_Lightcage[nIndex][2], -1) ~= 1) then
		return
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
	--给予物品
		AddItem(6, 1, tab_Lightcage[nIndex][1], 1, 0, 0, 0);
	--公告
		Say("<color=red>"..szCageName.."<color>  l祄 xong, Kh竎h quan v鮝 � ch�?!", 0);
		Msg2Player("B筺 nh薾 頲 <color=yellow>"..szCageName.."(".."c bi謙"..")<color>");
	else
	--给予物品
		local iIdx = AddItem(6, 1, tab_Lightcage[nIndex][6], 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--公告
		Say("<color=red>"..szCageName.."<color>  l祄 xong, nh璶g kh玭g 頲 nh� �. Th藅 ng筰 qu�!", 0);
		Msg2Player("B筺 nh薾 頲 <color=yellow>"..szCageName.."<color>");
	end;
end;

--确定制造(五彩灯笼)
function sure_colorfulcage()
	Say("<color=red>l錸g n Ng� s綾<color><color> c莕 c� <color=yellow>5 lo筰 gi蕐 ki課g, 1 thanh tre, 1 d﹜ c鉯, 1 n課<color> v� <color=red>5000 lng<color> ti襫 c玭g, l祄 ch�?", 2, "ng! Xin l穙 b鑙 tr� t礽!/make_colorfulcage", "Ta s� quay l筰 sau!/oncancel");
end;

--制造五彩灯笼
function make_colorfulcage()
	local szCageName = "L錸g n k衞 qu﹏";
	--检查是否已经做了300个
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local w = GetWorldPos();
	local szCityLGName = "midautumn2006_city_"..tostring(w);
	local n_wc_Count = gb_GetTask(szCityLGName, 2);
	if (gb_GetTask(szCityLGName, 1) ~= nDate) then
		gb_SetTask(szCityLGName, 1, nDate);
		n_wc_Count = 0;
	end;
	
	if (n_wc_Count >= AU06_COLORED_LIMITED) then
		Say("H玬 nay ta  l祄<color=yellow>3000 c竔 l錸g n k衞 qu﹏<color> r錳, ta  qu� m謙, h玬 kh竎 quay l筰 nh�.", 0);
		return
	end;
	
	--检查材料
	local bEnough = 1;
	if (GetCash() < 5000) then
		bEnough = 0;
	end;
	for i = 1221, 1225 do
		if (CalcEquiproomItemCount(6, 1, i, -1) < 1) then
			bEnough = 0;
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh竎h quan kh玭g  v藅 li謚, <color=red>"..szCageName.."<color> c莕 <color=yellow>5 lo筰 gi蕐 ki課g, 1 thanh tre, 1 d﹜ c鉯, 1 n課<color> v� <color=red>5000 lng<color> ti襫 c玭g.", 1, "в ta 甶 chu萵 b� !/oncancel");
		return
	end;
	
	--删除材料
	if (Pay(5000) == 0) then
		return
	end;
	for i = 1221, 1225 do
		if (ConsumeEquiproomItem(1, 6, 1, i, -1) ~= 1) then
			return
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
		gb_SetTask(szCityLGName, 2, n_wc_Count + 1);
	--给予物品
		AddItem(6, 1, 1234, 1, 0, 0, 0);
	--公告
		Say("<color=red>"..szCageName.."<color>  l祄 xong, Kh竎h quan v鮝 � ch�?!", 0);
		Msg2Player("B筺 nh薾 頲 <color=yellow>"..szCageName.."(".."c bi謙"..")<color>");
	else
	--给予物品
		local iIdx = AddItem(6, 1, 1246, 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--公告
		Say("<color=red>"..szCageName.."<color>  l祄 xong, nh璶g kh玭g 頲 nh� �. Th藅 ng筰 qu�!", 0);
		Msg2Player("B筺 nh薾 頲 <color=yellow>"..szCageName.."<color>");
	end;
end;