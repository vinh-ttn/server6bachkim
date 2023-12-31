--情人节礼盒
--并滚动公告祝福语
IL("SETTING")
TEMPSK_ITEM_PID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
tbTeacherDay200711CardBless = 
{
	[1588] = {szName = "Thi謕 ch骳 s� ph�", GreetingWord = "D飊g  g鰅 l阨 ch骳 n s� ph�", szBless = "<color=green>%s<color>  ch骳 s� ph� <color=green>%s<color> ti襫 t礽 nh� nc, l猲 c蕄 v蘯 v蘯."},
	[1589] = {szName = "Thi謕 ch骳  t�", GreetingWord = "D飊g  g鰅 l阨 ch骳 n  t�", szBless = "<color=green>%s<color> ch骳  t� <color=green>%s<color> h鋍 ngh� tinh th玭g, r筺g danh m玭 ph竔."},
	[1590] = {szName = "Thi謕 ch骳 h秓 h鱱", GreetingWord = "D飊g  g鰅 l阨 ch骳 n h秓 h鱱", szBless = "<color=green>%s<color> ch骳 h秓 h鱱 <color=green>%s<color> c玭g th祅h danh to筰, rng y nguy猲 b秓."},
	[1591] = {szName = "Thi謕 ch骳 c鮱 nh﹏", GreetingWord = "D飊g  g鰅 l阨 ch骳 n c鮱 nh﹏", szBless = "<color=green>%s<color> ch骳 c鮱 nh﹏ <color=green>%s<color> b竛 th﹏ b蕋 to筰, to祅 th﹏ b蕋 ng."},
	[1592] = {szName = "Thi謕 ch骳 bang h閕", GreetingWord = "D飊g  g鰅 l阨 ch骳 n bang h閕", szBless = "<color=green>%s<color> ch骳 bang h閕 <color=green>%s<color> tr╩ tr薾 tr╩ th緉g, may m緉 Ho祅g Kim."},
	[1593] = {szName = "Thi謕 ch骳 gi竜 ch�", GreetingWord = "D飊g  g鰅 l阨 ch骳 n gi竜 ch�", szBless = "<color=green>%s<color> ch骳 gi竜 ch� <color=green>%s<color> v� c玭g c竔 th�, nh蕋 th鑞g thi猲 h�."},
	[1594] = {szName = "Thi謕 ch骳 s� mu閕", GreetingWord = "D飊g  g鰅 l阨 ch骳 n s� mu閕", szBless = "<color=green>%s<color> ch骳 s� mu閕 <color=green>%s<color> xinh x緉 d� thng, s韒 ng祔 xu蕋 gi�."},
	[1595] = {szName = "Thi謕 ch骳 bang ch�", GreetingWord = "D飊g  g鰅 l阨 ch骳 n bang ch�", szBless = "<color=green>%s<color> ch骳 bang ch� <color=green>%s<color> th莕 c玭g h� th�, thi猲 h� v� i."},
	[1596] = {szName = "Thi謕 ch骳 s� ", GreetingWord = "D飊g  g鰅 l阨 ch骳 n s� ", szBless = "<color=green>%s<color> ch骳 s�  <color=green>%s<color> th玭g minh lanh l頸, s韒 ng祔 th祅h th﹏."},
	[1597] = {szName = "Thi謕 ch骳 s� huynh", GreetingWord = "D飊g  g鰅 l阨 ch骳 n s� huynh", szBless = "<color=green>%s<color> ch骳 s� huynh <color=green>%s<color> h鋍 頲 th莕 c玭g, h祅h hi謕 trng ngh躠."},
}

function TeacherDay200711_card_main(nParti)
	SetTaskTemp(TEMPSK_ITEM_PID, nParti);
	Say(tbTeacherDay200711CardBless[nParti].GreetingWord, 2,"G鰅 t苙g/TeacherDay200711_card_want2present", "H駓 b� /TeacherDay200711_card_OnCancel");
	return 1
end

function TeacherDay200711_card_want2present()
	AskClientForString("TeacherDay200711_card_PlayerSelect", "", 1, 16, "Xin nh藀 t猲 i phng");
end

function TeacherDay200711_card_PlayerSelect(szRoleName)
	if (ST_CheckTextFilter(szRoleName) ~= 1) then
		Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szRoleName, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l鏸! T猲 b筺 nh藀 v祇 c� ch� kh玭g h頿 l�, h穣 th� l筰 l莕 n鱝!", 0)
			return
		end
	end
	local nParti = GetTaskTemp(TEMPSK_ITEM_PID)
	if (nParti == 0) then
		return
	end
	SetTaskTemp(TEMPSK_ITEM_PID,0)
	local szBless = format(tbTeacherDay200711CardBless[nParti].szBless,GetName(),szRoleName);	
	if (CalcEquiproomItemCount(6, 1, nParti, -1) >= 1) then
		ConsumeEquiproomItem(1, 6, 1, nParti, -1);
		AddGlobalNews(szBless,1);
		SetTask(TSK_TeacherDay200711_CardUseTime,GetCurServerTime());
	else
		Say(format("T譵 kh玭g th蕐 %s, h穣 th� l筰!",tbTeacherDay200711CardBless[nParti].szName), 0)
	end
end

function TeacherDay200711_card_BlessPlayerOnline(szBless)
	
end

function TeacherDay200711_card_OnCancel()
	SetTaskTemp(TEMPSK_ITEM_PID,0)
end