-- 昆仑 弟子 丫环 10级任务
-- by：Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 10*256+10) then		--10级任务进行中
			if (HaveItem(112)==1) and (HaveItem(113)==1) and (HaveItem(114)==1) and (HaveItem(115)==1) and (HaveItem(116)==1) then
				L10_prise()
			else
				Talk(1,"","Thu鑓  頲 h竔  ch璦?")
			end
		elseif ((UTask_kl == 10*256) and (GetLevel() >= 10)) then		--10级任务
			Say("Ti觰 th� c馻 ch髇g ta t� b�  mang nhi襲 b謓h, m鏸 ng祔 u ph秈 u鑞g 1 ch衝 linh chi b竎h th秓 m� vi sinh. Lo筰 dc th秓 n祔 ng祔 h玬 qua  h誸, l筰 ng v祇 l骳 ngay t猲 dc ng chuy猲 ph� tr竎h h竔 thu鑓 ng� b謓h, b﹜ gi� ph秈 l祄 sao y?",2,"Gi髉 甶 h竔 thu鑓 /L10_get_yes","L鵦 b蕋 t遪g t﹎ /L10_get_no")
		else
			Talk(1,"","Th� ch蕋 c馻 ti觰 th� v蒼 y誹 畊鑙 nh� v藋, ph秈 l祄 sao y?")
		end
	else
		Talk(1,"","Trong C玭 L玭 ph竔, n琲 s筩h s� nh蕋 ch輓hh l� ph遪g c馻 ti觰 th� ch髇g ta!")
	end
end;

function L10_get_yes()
	Talk(3,"L10_get_talk","Xin c� nng ng lo l緉g,ta s� 甶 h竔 thu鑓 v� y!","Th藅 kh玭g? N誹 th� th� qu� t鑤 r錳!","Kh玭g bi誸 c莕 nh鱪g lo筰 dc li謚 n祇?")
end

function L10_get_talk()
	Talk(1,"","C莕 c�: T� M鬰 T骳, мa C萴 Th秓, Thi課 Th秓, H� Nh� th秓 v� Linh Chi. Linh Chi l� kh� t譵 nh蕋!  v� hng Йng B綾 c馻 Long M玭 tr蕁 l� Dc Vng C鑓. Trong  c� th� t譵 頲!")
	SetTask(9,10*256+10)
	AddNote("дn Dc Vng C鑓 t筰 ph輆 ng b綾 c馻 Long M玭 tr蕁  h竔 5 lo筰 dc li謚 T� M鬰 T骳, мa C萴 Th秓, Thi課 Th秓, H� Nh� Th秓 v� Linh Chi. ")
	Msg2Player("дn Dc Vng C鑓 t筰 ph輆 ng b綾 c馻 Long M玭 tr蕁  h竔 5 lo筰 dc li謚 T� M鬰 T骳, мa C萴 Th秓, Thi課 Th秓, H� Nh� Th秓 v� Linh Chi. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","Ngi th藅 gi醝! Ta s� n鉯 ti觰 th�  b箃 ngi")
	DelItem(112)
	DelItem(113)
	DelItem(114)
	DelItem(115)
	DelItem(116)
	SetTask(9,20*256)
	SetRank(20)
--	AddMagic(167)
--	AddMagic(168)
--	AddMagic(392)
--	AddMagic(171)
	add_kl(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g B筺! Х tr� th祅h C玭 L玭 ph竔 Ph鬾g Ki誱  t�! H鋍 頲 C玭 L玭 o ph竝, C玭 L玭 ki誱 ph竝, Th輈h Phc Ch�, b颽 thanh Phong. ")
	AddNote("H竔 thu鑓 v�, g苝 Ti觰 H祅 ph鬰 m謓h, ho祅 th祅h nhi謒 v� h竔 thu鑓, th╪g c蕄 th祅h Ph鬾g ki誱  t�. ")
end;
