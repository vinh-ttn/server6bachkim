--by 廖志山 [2006-09-12]
--2006中秋活动之做对话奖励,新手村小孩对话奖励
--Illustration: 灯笼 -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--领奖入口
function main()
	if (au06_is_inperiod() == 0) then --
		Say("Ho箃 ng  k誸 th骳.", 0);
		return 1;
	end;
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ngi ch琲 n筽 th� m韎 c� th� tham gia ho箃 ng Trung thu", 0);
		return
	end;
	local str_Content = {
		"T苙g l錸g n bm bm c bi謙./#determine_get( 1 )",
		"T苙g l錸g n ng玦 sao c bi謙./#determine_get( 2 )",
		"T苙g l錸g n 鑞g c bi謙./#determine_get( 3 )",
		"T苙g l錸g n tr遪 c bi謙./#determine_get( 4 )",
		"T苙g l錸g n c� ch衟 c bi謙./#determine_get( 5 )",
		"T苙g l錸g n k衞 qu﹏ c bi謙./#determine_get( 6 )",
		"Hi謓 t筰 ta 產ng r蕋 b薾!/oncancel"
	};
	Say("<color=yellow>L錸g n<color> n祔 p qu�! C� th� t苙g cho mu閕 l祄 qu� cho c竎 em nh�  kh玭g? Mu閕 s� t苙g l筰 i hi謕 b竛h Trung Thu do ch輓h tay mu閕 l祄.", getn(str_Content), str_Content);
end;

--确定领奖
function determine_get(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5, 6};
	Say("Чi hi謕 mu鑞 t苙g l錸g n n祔 cho c竎 em nh� sao?", 2, "Uhm! Hy v鋘g mu閕 kh玭g ch�!/#getaward("..tab_Index[nIndex]..")", "Ch璦 頲! L錸g n n祔 ta c遪 產ng d飊g/oncancel");
end;

--最终得奖
function getaward(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	local szCageName = tab_Lightcage[nIndex][3];
	
	--如果没有物品
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][1], -1) < 1) then
		Say("Sao h鴄 l� t苙g mu閕 l錸g n m� v蒼 ch璦 th蕐 v藋!?", 1, "Ah! Ta  qu猲 � rng ch鴄 ./oncancel");
		return
	end;
	
	--如果经验达到上限
	if (GetTask(AU06_TK_EXP) >= EXP_AWARD_LIMIT) then
		Say(" t�! Nh璶g mu閕  c�  l錸g n r錳.", 1, "H� h�!  ch琲 h閕 nh� c萵 th薾 nh�!/oncancel");
		return
	end;
	
	--扣除东西
	if (ConsumeEquiproomItem(1, 6, 1, tab_Lightcage[nIndex][1], -1) ~= 1) then
		return
	end;
	--给予物品
	AddItem(6, 1, tab_Lightcage[nIndex][7], 1, 0, 0, 0);
	--公告
	Say("C秏 琻! Зy l� b竛h trung thu do mu閕 l祄, xin h穣 nh薾 l蕐.", 0);
	Msg2Player("B筺 nh薾 頲 <color=yellow>"..tab_Lightcage[nIndex][8].."<color>.");
end;
