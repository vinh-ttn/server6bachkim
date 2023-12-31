--description: 唐门唐不染 30级任务 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>T� T� ёnh n祔 l� n琲 t� li謙 t� li謙 t玭g c馻 b鎛 ph竔, ph祄 l� ngi thng ng c� m� b衝 m穘g v祇 y!"
	G_TASK:OnMessage("Л阯g M玭", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", main2)
	tbDailog:Show() 
end

function main2()
	UTask_tm = GetTask(2)
	Uworld123 = GetTask(123)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then		-- 唐门门派任务
		if (UTask_tm == 30*256) and (GetLevel() >= 30) then		--30级任务启动
			Talk(3, "L30_get", "<color=Red>ph遪g H醓 kh�<color> c馻 <color=Red>Л阯g V﹏<color> s� th骳 th藅 ng thng. Hai n╩ trc c� m閠 g� lai l辌h b蕋 minh b総 c鉩 Ti觰 Xuy猲, a con c nh蕋 c馻 玭g, mu鑞 衟 玭g giao ra B� ki誴 <color=Red>'H醓 Kh� Ph�'<color> c馻 b鎛 m玭.", "Л阯g V﹏ s� th骳 kh玭g d竚 quay l璶g l筰 v韎 m玭 quy. K誸 qu� l� ng祔 th� 2 g� kia a t韎 c竛h tay c馻 Ti觰 Xuy猲. S� th骳 ch� c� a con trai n祔, nh璶g l筰 kh玭g th� giao 'H醓 Kh� ph�' cho ch髇g 頲. N祇 ng�, l筰 i l蕐 thi th� c馻 Ti觰 Xuy猲. S� th骳 產u n t閠 c飊g, th� nh蕋 nh ph秈 tr� m鑙 th� s﹗ m!", "Nh璶g v� Л阯g V﹏ s� th骳 ti誸 l� Л阯g M玭 B� ki誴, n猲 ph秈 ch辵 s� tr鮪g ph箃 c馻 m玭 quy c� i kh玭g th� r阨 kh醝 Л阯g M玭 n鯽 bc. Th� h薾 kia e r籲g ki誴 n祔 kh玭g th� tr� 頲!")
		elseif (UTask_tm == 30*256+50) then
			Talk(2, "", "T筰 h�  t譵 頲 t猲 th� ph� b総 c鉩 con trai c馻 Л阯g V﹏ s� th骳, 畂箃 v� <color=Red> 'H醓 Kh� Ph�'<color>.", " T鑤 l緈,<color=Red>Л阯g V﹏<color> s� th骳 nh蕋 nh s� c秏 th蕐 an 駃 ph莕 n祇. H穣 giao <color=Red> 'H醓 Kh� Ph�'<color>cho 玭g 蕐. g ta � trong <color=Red>ph遪g H醓 kh�<color>.")
			Msg2Player("V� ph遪g t� t� t譵 Л阯g B蕋 Nhi詍, 頲 bi誸 Л阯g V﹏ s� th骳 產ng � H醓 Kh� ph遪g. ")
			SetTask(2,30*256+60)
		elseif (UTask_tm == 30*256+60) then
			Talk(1, "", "Л阯g V﹏ s� th骳 nh蕋 nh s� c秏 th蕐 an 駃 ph莕 n祇. H穣 n <color=Red>ph遪g H醓 kh�<color> n鉯 v韎 玭g 蕐 tin m鮪g n祔!")
		elseif (UTask_tm > 30*256) and (UTask_tm < 40*256) then					--已经接到30级任务，尚未完成
			Talk(1,""," Ta  ﹎ th莔 d� la, t猲 th� ph�  dng nh� thng xu蕋 hi謓 � <color=Red>B筩h V﹏ ng<color> ph輆 Йng Thanh Th祅h s琻.")
		elseif (UTask_tm >= 40*256) then					--已经完成30级任务，本门弟子
			Skill150Dialog("Ngi c� th� gi髉 Л阯g V﹏ s� th骳 x鉧 甶 n鏸 oan khu蕋. Xem ra, ta th藅 k輓h n� ngi!")
		else		
			Skill150Dialog("T� T� ёnh n祔 l� n琲 t� li謙 t� li謙 t玭g c馻 b鎛 ph竔, ph祄 l� ngi thng ng c� m� b衝 m穘g v祇 y!")
		end
	elseif (Uworld123 == 10) then											-- 唐门90级技能任务
		Say("C� th� thay ta chuy觧 m閠 b鴆 th� kh玭g?",2,"Tu﹏ l謓h!/Uworld123_get","Th藅 竬 n竬, m玭 ch� v鮝 m韎 g鋓 ta qua ch� 玭g 蕐. /L30_get_no")
	elseif (Uworld123 == 20) and (HaveItem(379) == 0) then		-- 唐不染任务，道具丢了
		Talk(1,"","Ngi th藅 l祬.., th� c遪 ch璦 c莔  v閕 v� ch箉 甶!")
		AddEventItem(379)
		Msg2Player("Nh薾 l筰 th� c馻 Л阯g B蕋 Nhi詍 ")
	elseif (Uworld123 == 30) and (HaveItem(380) == 1) then		-- 唐不染任务，开打
		Talk(3,"Uworld123_step2","Ha ha匭u� nhi猲 di謚 k�! S� khi課 Л阯g nh蕋 Tr莕 ch誸 c騨g kh玭g c� t dung th﹏!","H鰠? Ngi l� ai? Sao kh玭g ph秈 l� A T礽?","Ngi  nghe th蕐 甶襲 b� m藅, mu鑞 s鑞g c騨g kh玭g 頲, h穣 xem chi猽 c馻 ta y!")
	elseif (Uworld123 == 40) then											-- 没打完，继续打
		Talk(1,"Uworld123_step2","ng ch箉! H穣 coi y!")
	elseif (Uworld123 == 50) then
		if (GetSex() == 0) then
			sexstr = "Чi hi謕 "
		else
			sexstr = "N� hi謕"
		end
		Talk(8,"Uworld123_step3","C玭g t� h� t蕋 ph秈 lo l緉g. Tuy ta kh玭g th﹏ v韎 c玭g t� nh璶g c騨g ch糿g vi謈 g� l祄 h醤g chuy謓 c馻 c玭g t�. ","Ngi. Ngi. ","C玭g t� th﹏ l� thi誹 ch� Л阯g Gia B秓. Ta tuy b蕋 t礽 nh璶g kh玭g gi髉 c玭g t� ch糿g l� 甶 gi髉 ngi ngo礽. ","Kh玭g sai, ng nh� v� anh h飊g n祔 n鉯, xin cho h醝 cao danh qu� t竛h? ","T筰 h� "..GetName().."Ti謓 th�. ","�, Ra v藋 "..GetName()..sexstr.."Nghe danh  l﹗, nh璶g kh玭g ng� l莕 u g苝 m苩 l筰 trong ho祅 c秐h n祔. ","Чi hi謕  駈g h� t筰 h� nh� v藋, kh玭g bi誸 c� th� gi髉 ta mang quy觧 s竎h n祔 trao cho an M閏 Du� 頲 ch╪g? Quy觧 s竎h n祔 i v韎 t筰 h� l� m蕌 ch鑤 thu薾 l頸  n緈 gi� Л阯g M玭. S� vi謈 v� c飊g tr鋘g i, kh玭g th� nh� v� ngi kh竎 頲. ","Chuy謓 nh�, giao cho ta 頲 r錳. ")
	elseif (Uworld123 == 60) and (HaveItem(377) == 0) then		-- 秘笈丢了
		if (GetSex() == 0) then
			Talk(1,"","Чi hi謕 qu猲 mang B� ki誴 甶 r錳!")
		else
			Talk(1,"","N� hi謕 qu猲 mang B� ki誴 甶 r錳!")
		end
		AddEventItem(377)
		Msg2Player("L蕐 l筰 b� k輕 Л阯g m玭 ")
	elseif (Uworld123 == 70) or (Uworld123 == 75) then			-- 任务完成
		Talk(1,"Uworld123_prise","Ha ha ha. Ta s� i tin m鮪g c馻 ngi. Th藅 l遪g c秏 琻 ngi!")
	elseif (Uworld123 >= 10) and (Uworld123 < 80) then		-- 唐不染任务进行中
		Talk(1,"","Chuy謓 ta n鉯 ngi mau l祄 ngay 甶, kh玭g vi謈 g� th� ng l穘g ph� th阨 gian!")
	elseif (GetTask(51) >= 90) then		-- 一尘“洗清冤屈”任务之后，对话改变
		Talk(1,"","T筰 sao cu鑙 c飊g h緉 l筰 頲 s駈g 竔, c遪 ta th� b� i x� t� b筩? Qu� th藅 b蕋 c玭g!")
	elseif (Uworld123 >= 80) then									-- 唐不染任务已经完成
		Talk(1,"","Chuy謓 l莕 n祔 th藅 nh� c玭g c馻 ngi, khi ta tr� th祅h m玭 ch� nh蕋 nh s� kh玭g qu猲 c玭g lao c馻 ngi!")
	elseif (UTask_tm >= 70*256) then							--已经出师
		Skill150Dialog("Ta lu玭 mu鑞 ra 甶 nh璶g cha ta kh玭g ng �.")
	else
		Skill150Dialog("T� T� ёnh n祔 l� n琲 t� li謙 t� li謙 t玭g c馻 b鎛 ph竔, ph祄 l� ngi thng ng c� m� b衝 m穘g v祇 y!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Л阯g M玭", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get()
--	DelItem(42)							--防止重接任务后，玩家捡起任务道具
	Say(" Л阯g V﹏ s� th骳 t鮪g n鉯 b蕋 lu薾 l� ai, ch� c莕 c� th� gi髉 玭g tr� m鑙 th� gi誸 con, l蕐 v� <color=Red> H醓 Kh� Ph�<color>, 玭g s� mang n苙g 琻 s﹗!", 2, "Gi髉 玭g ta b竜 th�. /L30_get_yes", "Ta kh玭g quan t﹎!/L30_get_no")
end;

function L30_get_yes()
	Talk(1,""," Ta  ﹎ th莔 d� la, t猲 th� ph�  dng nh� thng xu蕋 hi謓 � <color=Red>B筩h V﹏ ng<color> ph輆 Йng Thanh Th祅h s琻.")
	SetTask(2, 30*256+20)
	AddNote("G苝 Л阯g B蕋 Nhi詍 � t� 阯g ( 514, 318) , nh薾 <color=Red>nhi謒 v� H醓 Kh� Ph�<color>, gi髉 Л阯g V﹏ s� th骳 畂箃 'H醓 Kh� Ph�' v�. ")
	Msg2Player("Nh薾 nhi謒 v� 'H醓 Kh� Ph�', gi髉 Л阯g V﹏ s� th骳 畂箃 'H醓 Kh� Ph�' v�. ")
end;

function Uworld123_get()
	Talk(1,"","T鑤! Mau k輕 thay ta trao b鴆 th� n祔 n Bi謓 Kinh cho B筩h C玭g T�.  s韒 v� s韒!")
	SetTask(123,20)
	Msg2Player("Nh薾 nhi謒 v�: Thay Л阯g B蕋 Nhi詍 甧m th� n trao cho B筩h c玭g t�. ")
	AddEventItem(379)
	Msg2Player("Nh薾 頲 th� c馻 Л阯g B蕋 Nhi詍 ")
end

function Uworld123_step2()
	DelItem(380)
	SetTask(123,40)
	SetFightState(1)
	NewWorld(229,1616,3195)
end

function Uworld123_step3()
	AddEventItem(377)
	SetTask(123,60)
	Msg2Player("L蕐 頲 b� k輕 Л阯g M玭. ")
end

function Uworld123_prise()
	AddRepute(10)
	Earn(20000)
	if (GetTask(123) == 70) then			-- 不是本门
		SetTask(123,245)
	else
		SetTask(123,255)
	end
	Msg2Player("Nhi謒 v� ho祅 th祅h, b筺 s� 頲 thng 20000 lng, thanh th� c馻 b筺 t╪g 10 甶觤. ")
	AddNote("Nhi謒 v� ho祅 th祅h, b筺 s� 頲 thng 20000 lng, thanh th� c馻 b筺 t╪g 10 甶觤. ")
end

function L30_get_no()
end;
