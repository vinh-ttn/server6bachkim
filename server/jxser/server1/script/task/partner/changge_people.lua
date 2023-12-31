-------------------------------------------------------------------------
-- FileName		:	changge_people.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-04 14:17:15
-- Desc			:  	各大城市长歌门门人
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的赖
Include("\\script\\task\\partner\\partner_head.lua") --包含了图象调用
Include("\\script\\task\\partner\\reward\\partner_reward.lua") --包含了交修炼任务的脚本
Include("\\script\\task\\partner\\reward\\partner_reward2.lua") 
Include("\\script\\task\\partner\\reward\\partner_reward3.lua") 
Include("\\script\\global\\titlefuncs.lua")  --包含更改称号的脚本
Include("\\script\\task\\partner\\train\\partner_changgejindi.lua")

function main()

	Describe(DescLink_ChangGeMen..": Giang h� mi n╩ gi� th鎖 l�, ci d礽 khi ca kh� l祄 ng鋞. N╩  c駃 m玭 ch� hi謕 ngh躠 t竛 t礽, qu秐g n筽 thi猲 h� h祇 ki謙, ta trng ca c鯽 ra sao ch� th辬h s�. Sau  m玭 ch� b� kim t芻 gi誸 h筰, ch髇g ta ngi trong c騨g ch璦 t鮪g m閠 ng祔 bu玭g tha cho thi猲 h� thng sinh v� m蕐 m nhi謒 t輓 s�. H玬 nay trng ca h錳 sinh, ch輓h l� mu鑞 c遪 ngi trong thi猲 h� m閠 c玭g o!",7, 
                "Nh薾 nhi謒 v� gi竜 hu蕁 B筺 уng H祅h/Getpartner_education", 
                "Nhi謒 v� tu luy謓 B筺 уng H祅h/Getpartner_allpractice", 
                "Nhi謒 v� c th� B筺 уng H祅h/Getpartner_especial", 
                "Thu� B筺 уng H祅h/Getpartner_paymoney", 
                "S鯽 i danh hi謚 ngi ch琲/change_title", 
                " Trng Ca M玭 C蕀 мa/Goto_jindichangge", 
                "Ta mu鑞 甶 V﹏ Trung Tr蕁 c� ch髏 chuy謓./Goto_townyunzhong", 
                "Ta ch糿g qua gh� th╩ th玦./no")
end

function Getpartner_allpractice()
	Describe(DescLink_ChangGeMen..": Ngi mu鑞 l祄 g� c飊g b筺 ng h祅h tu luy謓 nhi謒 v� ? ",5, 
               "Ta mu鑞 mua B筺 уng H祅h tu luy謓 nhi謒 v�./Getpartner_practice", 
               "Ta mu鑞 ng B筺 уng H祅h tu luy謓 nhi謒 v�./Getpartner_goonpractice", 
               "Ta l� t韎 h駓 b� B筺 уng H祅h tu luy謓 nhi謒 v�./Getpartner_finishpractice", 
               "Ta mu鑞 t譵 hi觰 r� tu luy謓 nhi謒 v� B筺 уng H祅h./Getpartner_knowpractice", 
               "Ta ch糿g qua gh� th╩ ch琲 th玦./no")
end

function Getpartner_goonpractice()
	if ( nt_getTask(1245) >=0 and nt_getTask(1245) <= 3 ) then
		reward_givetask()
	elseif ( nt_getTask(1245) == 4 ) then
		reward_givetask2()
	elseif ( nt_getTask(1245) == 5 ) then
		reward_givetask3()
	end
end

function Getpartner_knowpractice()
Describe(DescLink_ChangGeMen..":<color=yellow> Nhi謒 v� b筺 ng h祅h tu luy謓 l� c鯽 Trng Ca v� thay v� l﹎ di謙 tr� nguy h筰 m� ban b� m閠 lo箃 nhi謒 v�. Khi ngi mua tu luy謓 quy觧 tr鬰 sau li襫 c� th� x骳 ph竧 甶 tng 鴑g a phng  nhi謒 v� gi誸 qu竔. Gi誸 tr竎h quy觧 tr鬰 trc m総 chia l祄 <color=red>50 ch�, 100 ch�, c飊g 150 ch� <color> ba lo筰. L骳 m韎 b総 u ngi ch� c� th� mua 頲 gi誸 <color=red>50<color> ch�  th鮝 quy觧 tr鬰, h琻 n鱝 m鏸 ng祔 nhi襲 nh蕋 ho祅 th祅h <color=red>5<color> l莕. Ho祅 th祅h sau n祔 ngi c飊g b筺 ng h祅h ngi s� l蕐 頲 <color=red> phong ph� h錳 b竜 <color>. уng th阨, theo ngi ho祅 th祅h nhi謒 v� <color=red> s� l莕 <color> c祅g nhi襲, c鯽 trng ca s� cho ngi <color=red>Thanh Long V� S� , Thanh Long Ki誱 S竧<color> danh hi謚. Theo nh鱪g th� n祔 t� c竎h t╪g l猲, ngi 甧m c� th� mua gi誸 ch誸 nhi襲 h琻 qu竔 v藅 quy觧 tr鬰, ng th阨 m鏸 ng祔 ho祅 th祅h s� l莕 c騨g 甧m nhi襲 h琻. цi 鴑g, l蕐 頲 h錳 b竜 c騨g 甧m c祅g l骳 c祅g l韓. <color>",2,
                     "Tr� v�/Getpartner_allpractice","R阨 kh醝/no")
end

function Getpartner_education()    --我想做领取同伴的教育任务
	Describe(DescLink_ChangGeMen..": T鑤, n誹 nh� ngi ngh� l祄 tho筰, nh� v藋 n V﹏ Trung Tr蕁 sau n祔 t譵 ki誱 Ho祅g у е i tho筰, h緉 s� ch� d蒼 cho ngi.",2, 
           "T鑤, ta  r� r祅g. в cho ta 甶 V﹏ Trung Tr蕁. /Goto_townyunzhong", 
           "Cho ta suy ngh� l筰 ch髏/no")
end


function Getpartner_paymoney()
	Describe(DescLink_ChangGeMen..": Th藅 xin l鏸, nh鉳 l韓 tinh nhu� v� s� c遪 � trong khi hu蕁 luy謓, trc m総 kh玭g c� c� th� cung ngi thu� b筺 ng h祅h, xin m阨 sau n祔 tr� l筰. C竚 琻. ",1," K誸 th骳 i tho筰/no")
end

function Getpartner_especial()
	Describe(DescLink_ChangGeMen..": H綾 H綾, nh鱪g th� kia ki誱 thu藅 th莕 th玭g b筺 ng h祅h c騨g kh玭g ph秈 l� d� d祅g li襫 c� th� t 頲. Ngi c莕 n鱝 h鋍 h醝 kinh nghi謒, ch髏 n鱝 tr� l筰 甶. ",1,"K誸 th骳 i tho筰 /no")
end

function Goto_townyunzhong()
	local i = random(8);
	local pos = {{1682,3290},{1694,3306},{1669,3320},{1655,3332},{1650,3340}};
	local j = random(5);
	if (random(2) == 1) then
		i = -i;
	end
	NewWorld(512,pos[j][1] + i,pos[j][2])   --去云中镇？？？
	--blackScreen();
end

function blackScreen()
	if(GetGameTime() <= 1800) then
		Say("Quan Phng б K� : N誹 nh� ngi n V﹏ Trung Tr蕁 b秐  b� 甧n, xin h穣 v祇 <enter><color=yellow>http://jx.kingsoft.com/zt1/2ye/2005/09/08/64217.shtml<color> k� ti誴 th� ba t礽 li謚 phi課. N誹 nh� i v韎 ng b筺 h� th鑞g c� b蕋 k� � ki課 c飊g � tng, m阨 頲 <color=yellow>bbs.jx.kingsoft.com<color> ph竧 bi觰.",0);
	end
end

function Getpartner_practice()
	local Name = GetName()
	Describe(DescLink_ChangGeMen..":"..Name.."Чi nh﹏, ngi ngh� mua lo筰 n祇 tu luy謓 quy觧 tr鬰 y ? ",4, 
            "Gi誸 qu竔 50 ch� /practice_kill50", 
            "Gi誸 qu竔 100 ch� /practice_kill100", 
            "Gi誸 qu竔 150 ch� /practice_kill150", 
            "Ch髏 n鱝 ta tr� l筰/no")
end


function practice_kill50()
	if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
		Sale(110)
	elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
		Sale(113)
	elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
		Sale(116)
	elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
		Sale(119)
	elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
		Sale(122)
	elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
		Sale(125)
	elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
		Sale(128)
	end
end

function practice_kill100()
	if ( nt_getTask(1245) < 2 ) then
		Describe(DescLink_ChangGeMen..": Th藅 xin l鏸, ng礽 trc m総 danh hi謚 c遪 kh玭g c� t t韎 <color=red>Thanh Long V� S�<color> t韎 c秐h gi韎, kh玭g c竎h n祇 mua gi誸 <color=red>100<color> ch� t韎 quy觧 tr鬰. Ph秈 l蕐 g鋓 頲 Thanh Long V� S�, nh蕋 nh ph秈 輙 nh蕋 � <color=red>5<color> ng祔 b猲 trong ho祅 th祅h m鏸 ng祔 t蕋 c� tu luy謓 nhi謒 v�. M鏸 ng祔 t蕋 c� tu luy謓 nhi謒 v� s� l莕 v� <color=red>5<color> l莕. ",2,"Tr� v�/Getpartner_practice","K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1245) >= 2 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(111)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(114)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(117)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(120)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(123)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(126)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(129)
		end
	end
end

function practice_kill150()
	if ( nt_getTask(1245) < 3 ) then
		Describe(DescLink_ChangGeMen..": Th藅 xin l鏸, ng礽 trc m総 danh hi謚 c遪 kh玭g c� t t韎 <color=red> Thanh Long ki誱 s竧 <color> ch c秐h gi韎, kh玭g c竎h n祇 mua <color=red>150<color> ch�  th鮝 ch quy觧 tr鬰. Ph秈 l蕐 g鋓 頲 Thanh Long ki誱 s竧, nh蕋 nh ph秈 輙 nh蕋 � <color=red>20<color> ng祔 b猲 trong ho祅 th祅h m鏸 ng祔 t蕋 c� tu luy謓 nhi謒 v�. M鏸 ng祔 t蕋 c� tu luy謓 nhi謒 v� s� l莕 v� <color=red>5<color> l莕. ",2,"Tr� v�/Getpartner_practice","K誸 th骳 i tho筰 /no")
	elseif ( nt_getTask(1245) >= 3 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(112)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(115)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(118)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(121)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(124)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(127)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(130)
		end
	end
end

function Getpartner_finishpractice()
	local Uworld1237 = nt_getTask(1237)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then
		Msg2Player("Ngi kh玭g c� mang b筺 ng hanh, kh玭g th� h駓 nhi謒 v� ?")
	end
	
	if ( Uworld1237 ~= 0 ) then
		if ( PARTNER_GetTaskValue(partnerindex, 2) ~= 0  )  then
			RemovePlayerEvent(Uworld1237) --取消该盛件
			nt_setTask(1237,0)
			PARTNER_SetTaskValue(partnerindex,2,0) 
			Msg2Player("Ngi  h駓 b� nhi謒 v� tu luy謓.")
		elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0  ) then
			local j = 0
			for i=1, NpcCount do
				if (PARTNER_GetTaskValue(i,2) ~= 0 ) then
					Msg2Player("Ngi mang theo l祄 tu luy謓 nhi謒 v� l� th� "..i.." s� b筺 ng h祅h. ")
					j = j+1
				end
			end
			if ( j == 0 ) then
				RemovePlayerEvent(Uworld1237) --取消该盛件
				nt_setTask(1237,0)
				nt_setTask(1244,0)
				Msg2Player("Ngi  h駓 b� nhi謒 v� tu luy謓.")
			end
		end
	else
		Describe(DescLink_ChangGeMen..": Ngi kh玭g c� b総 u tu luy謓 nhi謒 v�, th� n祇 h駓 b� y ?",1,"K誸 th骳 i tho筰/no")
	end
end

function no()
end
