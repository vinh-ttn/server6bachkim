-- 翠烟门 嫣晓倩 20级任务、40级任务
-- by：Dan_Deng(2003-07-26)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- 任务相关以及门派对话
		if (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--20级任务进行中
			if (GetTimerId() == 8) then
				StopTimer()								--解毒了
				Msg2Player("чc m� b筺 tr髇g v蒼 ch璦 gi秈 ")
				Talk(1,"L20_check","S� mu閕 mau qua y, ta gi髉 mu閕 gi秈 c.")
			else
				L20_check()
			end
		elseif (UTask_cy == 20*256) and (GetLevel() >= 20) then		--20级任务
			Say("B鎛 m玭 nu玦 r蕋 nhi襲 ong v祅g, m閠 s� ong v祅g n祔 ph秈 ╪ m閠 lo筰 m藅 hoa, m藅 hoa c馻 hoa Чi M筺 У La. G莕 y m藅 hoa  h誸, ngi c� th� gi髉 ta 甶 l蕐 10 b玭g hoa v� 頲 kh玭g? ",2,"Л頲!/L20_get_yes","е t� c玭g phu c遪 k衜, e r籲g kh� l祄 n猲 chuy謓 /L20_get_no")
		elseif (UTask_cy == 40*256+30) then							--40级任务完成
			L40_prise()
		elseif ((UTask_cy == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("Nghe n鉯 � th祅h Чi L� c� m閠 t猲 竎 b�, chuy猲 甶 cng hi誴 d﹏ n�, kh玭g bi誸  h筰 bi誸 bao nhi猽 thi誹 n�, ngi c� b籲g l遪g gi髉 ta 甶 ti猽 di謙 t猲 n m箃 n祔 kh玭g?",2,"L莕 n祔 ta s� v� d﹏ tr� h筰 /L40_get_yes","е t� v� c玭g y誹 k衜, s� kh玭g l祄 n鎖 chuy謓 n祔 /L40_get_no")
		elseif (UTask_cy > 40*256) and (UTask_cy < 50*256) then		--40级任务进行中
			Talk(1,"","Di tay h緉 c� nhi襲 thu閏 h�, s� mu閕 h穣 c萵 th薾!")
		else
			Talk(1,"","Уn 玭g kh玭g c� th� g� t鑤, mu閕 ph秈 c萵 th薾, nh鱪g vi謈 h緉 l祄 u th鑙 tha.")
		end
	else
		Talk(1,"","Уn 玭g kh玭g c� g� t鑤! ")
	end
end;

function L20_get_yes()
	Talk(3,"","Чi M筺 У La hoa m鋍 � tr猲 sn n骾 c馻 T﹜ B綾. L骳 m� ngi h竔 hoa ph秈 c萵 th薾, Чi M筺 У La c� c do  ph秈 h竔 hoa trong th阨 gian nh蕋 nh, n誹 kh玭g s� b� tr髇g c m� ch誸. ","Trong 1 th阨 gian ng緉 m� h竔 10 a hoa th� th藅 l� phi襫 ph鴆.","Cho n猲 S� mu閕 h竔  10 a mau ch鉵g 甧m v�.")
	SetTask(6,20*256+10)
	AddNote(" h竔 10 a hoa Чi Man У La. C萵 th薾 hoa c� c, trong m閠 th阨 gian ng緉 ph秈 l蕐 頲 10 a hoa 甧m v�. ")
	Msg2Player(" h竔 10 a hoa Чi Man У La. C萵 th薾 hoa c� c, trong m閠 th阨 gian ng緉 ph秈 l蕐 頲 10 a hoa 甧m v�. ")
end;

function L20_get_no()
end;

function L20_check()
	i = GetItemCount(1)
	for j = 1, i do DelItem(1) end			-- 检查有没有10朵花
	if (i >= 10) then		--如果有10个则完成任务
		Talk(1,"","<#> Y猲 Hi觰 Tr竔:"..i.."<#> Чi Man У La Hoa   r錳. S� mu閕 qu� l� c� b秐 l躰h, c� th� tr� th祅h Nh� Ph萴 Hoa S�.")
		SetTask(6,30*256)
		SetRank(33)
--		AddMagic(269)
		add_cy(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("Ch骳 m鮪g b筺! Х 頲 th╪g Th髖 Y猲 m玭 Nh� Ph萴 Hoa S�! H鋍 頲 v� c玭g B╪g T﹎ Tr竔 秐h. ")
		AddNote("H竔 頲 10 a Чi Man У La Hoa, ho祅 th祅h nhi謒 v� Чi Man У La Hoa. Л頲 th╪g l� Nh� Ph萴 Hoa S�. ")
	else
		Talk(2,"","Nh璶g ngi v蒼 ch璦 h竔  10 畂� Чi M筺 У La hoa, m閠 l莕 ch璦 h竔  10 畂� l� ch璦 d飊g 頲.","Xin s� mu閕 h穣 甶 th猰 m閠 chuy課 n鱝.")
		SetTask(6,20*256+10)
	end
end;

function L40_get_yes()
	Talk(1,"","Л頲! Vi謈 n祔 giao cho ngi.")
	SetTask(6,40*256+10)
	AddNote("Ti誴 nh薾 nhi謒 v�: Gi竜 hu蕁 t猲 竎 b� trong th祅h Чi L� ")
	Msg2Player("Ti誴 nh薾 nhi謒 v�: Gi竜 hu蕁 t猲 竎 b� trong th祅h Чi L� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(2,"","Y猲 s� t�! Ta  c鴘 頲 t蕋 c� nh鱪g ngi con g竔 b� t猲 竎 b� b総 甶, v�  cho h緉 m閠 b礽 h鋍, h緉 s� kh玭g d竚 l祄 chuy謓 x蕌 蕐 n鱝 u!","Ch� c莕  t� Thu� Y猲 M玭 ch髇g ta ra tay th� kh玭g c� vi謈 g� l� kh玭g th祅h, b秐 l躰h c馻 ngi ng祔 c祅g cao, ti誴 t鬰 n� l鵦 th猰 nh�!")
	SetTask(6,50*256)
	SetRank(77)
--	AddMagic(100)
	add_cy(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! Х 頲 th╪g l� Th髖 Y猲 m玭 Hoa Th莕 S� Gi�! H鋍 頲 v� c玭g H� Th� H祅 B╪g. ")
	AddNote("C鴘 tho竧 c竎 d﹏ n� b� t猲 竎 b� b総 c鉩, d箉 h緉 m閠 b礽 h鋍. Ho祅 th祅h nhi謒 v� c蕄 40. Л頲 th╪g l� Th髖 Y猲 m玭 Hoa Th莕 S� Gi�! ")
end;
