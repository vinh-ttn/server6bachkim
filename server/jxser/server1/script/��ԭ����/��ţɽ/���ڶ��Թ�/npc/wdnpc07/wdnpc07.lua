--description: 武当派润娘　武当40级任务
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(13) == 1 then
		allbrother_0801_FindNpcTaskDialog(13)
		return 0;
	end
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+40) and (HaveItem(163) == 1) then		-- 已经打败老虎
		Talk(2, "L40_step", "�! V� c玭g c馻 V� ng ph竔 qu� nhi猲 qu� nhi猲 b蕋 ph祄! Ngay c� nh鱪g  t� cao th� c馻 ta c騨g u b� h緉 nh b筰. Чo Nh蕋 l穙 nhi l� g� c馻 ngi?", " Чo Nh蕋 Ch﹏ Nh﹏ l� t玭 s� c馻 t筰 h�, 玭g 蕐 sai t玦 giao b鴆 th� n祔 n cho ngi!")
	elseif (UTask_wd == 40*256+20) then
		Talk(1,""," Х nh譶 th蕐 5 con B筩h H� ch璦? C� b秐 l躰h th� h穣 nh b筰 ch髇g trc  r錳 m韎 n n鉯 chuy謓 v韎 ta! ")
		AddNote("T筰 ng K� Qu竛 � Ph鬰 Ng璾 s琻, t譵 Nhu薾 Nng. Ph秈 nh b筰 n╩ con B筩h Ng鋍 H� ")
		Msg2Player("T筰 ng K� Qu竛 � Ph鬰 Ng璾 s琻, t譵 Nhu薾 Nng. Ph秈 nh b筰 n╩ con B筩h Ng鋍 H� ")
	elseif (UTask_wd == 40*256+60) and (HaveItem(164) == 0) then						--已经打败五虎，尚未拿到回信
		Talk(1,"","Th� h錳 ﹎ c馻 ta   trong hang ng n祔, ngi c� b秐 l躰h th� h穣 v祇  m� l蕐!")
	elseif (UTask_wd >= 40*256+60) then						--拿到回信后
		Talk(1,"","Th� ra h緉 c騨g bi誸 xin l鏸 ta! S韒 h琻 m閠 ch髏 c� ph秈 hay h琻 kh玭g!")
	else
		Talk(1,"","Ngi l� ai? D竚 x玭g v祇 trong ng n祔, th藅 kh玭g bi誸 s鑞g ch誸 l� g�!")
	end
end;

function L40_step()
	Talk(1,"","Чo Nh蕋 th藅 bi誸 d箉  t�! Th� u! Лa ta xem! Th� ra l� h緉 xin l鏸 ta! S韒 bi誸 nh� bi誸 nh� v藋, h� t蕋 khi x璦! Ngi l�  t� c馻 玭g ta th� ta c騨g kh玭g l祄 kh� ngi. Ta c騨g c� m閠 phong th� mu鑞 nh� ngi mang v� cho 玭g 蕐. Th� ")
	DelItem(163)
	SetTask(5, 40*256+60)
	AddNote("Sau khi nh b筰 n╩ con B筩h Ng鋍 H�. M韎 bi誸 l� th� h錳 ﹎  b� Nhu薾 Nng gi蕌 trong ng ")
	Msg2Player("Th� h錳 ﹎  b� Nhu薾 Nng gi蕌 trong ng, t譵 n� v� giao cho chng m玭 ")
end;
