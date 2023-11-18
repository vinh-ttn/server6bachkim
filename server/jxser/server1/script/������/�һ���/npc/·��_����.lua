-- 江南区 桃花岛 路人_船夫.lua
-- by: Dan_deng(2004-05-15)

Include("\\script\\missions\\autohang\\head.lua")
g_mapList = {235, 236, 237, 238, 239, 240, 241};
function main()
	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		Say("G莕 y linh kh� c馻 Уo Hoa Фo r蕋 th辬h. Kh玭g c莕 d飊g ch竜 L筽 B竧 c騨g c� th� luy謓 c玭g. C� h閕 t鑤 th� n祔. C莕 ph秈 bi誸 t薾 d鬾g. N誹 nh� mu鑞 tr� v� ph秈 tr� 1800 ng﹏ lng. ", 2, "V� th祅h/go_yes", "Ch璦 v� /no")		
		return 1;
	end
	
	nValue = GetTask(AEXP_TASKID);
	if (nValue > AEXP_TIME_UPDATE) then -- 仍有挂机时间
		Say("V� kh竎h n祔! Xem th莕 kh� c馻 ngi nh� v藋, nh蕋 nh l�  d飊g th� ch竜 truy襫 thuy誸 L筽 B竧 � y r錳 ph秈 kh玭g? Nghe n鉯 ch竜 L筽 B竧 ch� c� � Уo Hoa o n祔 m韎 c� c玭g hi謚. Ch� c� m閠 gi�, c莕 ph秈 t薾 d鬾g. N誹 nh� mu鑞 v� th祅h th� ph秈 tr� 1800 ng﹏ lng.", 2, "V� th祅h/go_yes", "Ch璦 v� /no")
	else 
		Say("V� kh竎h n祔! Xem th莕 kh� c馻 ngi nh� v藋, nh蕋 nh l�  d飊g th� ch竜 truy襫 thuy誸 L筽 B竧 � y r錳 ph秈 kh玭g? Nghe n鉯 ch竜 L筽 B竧 ch� c� � Уo Hoa o n祔 m韎 c� c玭g hi謚. Ch� c� m閠 gi�, c莕 ph秈 t薾 d鬾g. N誹 nh� mu鑞 v� th祅h th� ph秈 tr� 1800 ng﹏ lng.",2,"V� th祅h/go_yes","Ch璦 v� /no")
	end
end

function go_yes()
	if (GetCash() >= 1800) then
		Pay(1800)
		Msg2Player("Ng錳 ch綾 nh�! Ch髇g ta v� th祅h ")
		SetAutoHangMapFlag(0) -- 设置退出挂机地图标记(放开原来被屏蔽的公聊、回城等功能)
		
		-- 记录离开时的在线时间
		nOLTime = GetGameTime();
		SetTask(AEXP_OLTIME_TASKID, nOLTime);
		
		back_home();
		SetFightState(1)
	else
		Talk(1,"","Mu鑞 v� th祅h ph秈 tr� 1800 ng﹏ lng. Mau l蕐 ti襫 ra y")
	end
end;

function back_home()
	nSubWorldID = SubWorldIdx2ID();

	if (nSubWorldID == g_mapList[1]) then
		NewWorld(176, 1614, 2561) -- 临安
	elseif (nSubWorldID == g_mapList[2]) then
		NewWorld(80, 1345, 3359) -- 扬州
	elseif (nSubWorldID == g_mapList[3]) then
		NewWorld(78, 1299, 3483) -- 襄阳
	elseif (nSubWorldID == g_mapList[4]) then
		NewWorld(37, 1938, 2459) -- 汴京
	elseif (nSubWorldID == g_mapList[5]) then
		NewWorld(162, 1642, 2935) -- 大理
	elseif (nSubWorldID == g_mapList[6]) then
		NewWorld(11,3100,4822) -- 成都
	elseif (nSubWorldID == g_mapList[7]) then
		NewWorld(1, 1528, 2733) -- 凤翔
	else
		Msg2Player("B竜 l鏸! B筺  甶 t� th祅h th� n祇 n Уo Hoa o? Xin l藀 t鴆 li猲 h� v韎 GM  ph秐 秐h!");
	end	
end;

function no()
end;
