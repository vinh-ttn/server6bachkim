--description: 唐门唐云 30级任务 
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 1)) then		--30级任务
			L30_prise()
		elseif (UTask_tm >= 40*256) and (GetFaction() == "tangmen") then					--已经完成30级任务，尚未出师
			Talk(1,"","Ngi  gi髉 ta b竜 m鑙 th� n祔, ngi c莕 g�? Ta nh蕋 nh gi髉 ngi!")
		else								--没有完成30级任务（缺省对话）
			Talk(1,"","Ti觰 Xuy猲, a con t閕 nghi謕 c馻 ta�.Th� h薾 n祔厖ng祔 n祇 ch璦 tr�, ta ch誸 kh玭g nh緈 m総!")
		end
	elseif (UTask_tm >= 70*256) then							--已经出师
		Talk(1,"","Giang h� hi觤 竎, m閠 m譶h h祅h hi謕 giang h� ph秈 h誸 s鴆 c萵 th薾! ")
	else
		Talk(1,"","B譶h sinh ta v鑞 th� h薾 b鋘 th� ph� gi誸 ngi cp b鉩!")
	end
end;

function L30_prise()
	Talk(2, "", "Л阯g V﹏ s� th骳, t筰 h�  t譵 頲 nh鱪g t猲 Th� Ph� b竜 th� cho 玭g v� 畂箃 v� 'H醓 Kh� Ph�'. Ch� c莕 玭g giao cho Chng m玭 s� kh玭g ph秈 ch辵 h譶h ph箃 n鱝!", "Ta lu玭 i n ng祔 n祔. Ngi n鉯 xem ngi c莕 g�? Ta s� p 鴑g!")
	DelItem(42)
	SetRank(28)
	SetTask(2, 40*256)
--	AddMagic(50)
--	AddMagic(54)
--	AddMagic(47)
--	AddMagic(343)
	add_tm(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("Ch骳 m鮪g b筺! B筺  頲 th╪g l祄 Л阯g M玭 Gi韎 Ti襫 H� V�, h鋍 頲: Truy T﹎ Ti詎, M筺 Thi猲 Hoa V�, Xuy猲 T﹎ Th輈h. ")
	AddNote("V� n H醓 Kh� ph遪g, giao Ho� Kh� Ph� cho Л阯g V﹏, ho祅 th祅h nhi謒 v� Ho� Kh� Ph�, th╪g l�: Gi韎 Ti襫 H� V�. ")
end;
