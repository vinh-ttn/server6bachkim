--西南南区 点苍山to沧浪客居所
--Trap ID：沧浪客 1

function main(sel)
	Uworld42 = GetTask(42)
--	Msg2Player("沧浪客居所")
	if (Uworld42 == 60) then
		SetTask(42,70)
		Talk(15,"U42_go","Hi hi! ","Hi hi hi! ","Ch竨 ngoan! дn y 玭g c鈔g n祇.....Ai cha, n苙g qu�!","g n閕! Ch竨 mu鑞 ╪ k裲.","Con c騨g mu鑞.","g n閕! T鬷 n� c�, c遪 c馻 con th� sao?","Л頲 r錳! Ai c騨g c� ph莕.","Xin h醝 c� ph秈 Thng L穘g Kh竎h trong ph遪g?","K� n祇 b猲 ngo礽?","V穘 b鑙 xin b竔 ki課!","Ta 產ng vui v莥 v韎 con ch竨, kh玭g r秐h ti誴 ngi, v� 甶!","Th藅 kh玭g d竚 gi蕌, m� c馻 m蕐 a tr� n祔 c騨g r蕋 lo l緉g, m蕋 ╪ m蕋 ng�, xin Ti襫 b鑙 tha cho b鋘 ch髇g.","M蕐 a n祔 u l� ch竨 c馻 ta, ngi n鉯 c竔 g� m� b鋘 ch髇g ch�? Th籲g nh鉩 n祔 d竚 n y tr猽 ta �?","Ti襫 b鑙! ng a v韎 ta n鱝. Th玭g c秏 gi飉 甶!","Th玭g c秏 gi飉! Ti觰 t� to gan, ti誴 chi猽!")
	elseif (Uworld42 == 70) then
		Talk(1,"U42_go","Ti觰 t� kh玭g bi誸 s鑞g ch誸, c遪 kh玭g ch辵 甶! ")
	end
end;

function U42_go()
	NewWorld(231,1611,3193)
end
