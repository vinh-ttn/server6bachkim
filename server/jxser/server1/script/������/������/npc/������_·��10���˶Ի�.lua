--两湖区 巴陵县 路人10沈九对话
--巴陵县新手任务：阿芳的嫁妆
--suyu
-- Update: Dan_Deng(2003-08-10)
--注意：越南只有一种元宝，相当于我们的银元宝，名称叫金元宝，千万注意，编号用 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- 符合买箱子的条件，允许购买附加储物箱
		Say("Ta c� 1 rng th莕 k�, kh玭g nh鱪g gi� 頲 nhi襲 v藅 m� c遪 c� th� kh鉧 l筰 an to祅. C� Trung Nguy猲 ch� m譶h ta c�. C� mu鑞 xem th� kh玭g?   ",4,"в ta xem th� /buy_addibox", "H醝 th╩ m閠 ch髏/task_ring","V� vi謈 rng m� r閚g/box_help", "Kh玭g h鴑g th� /no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say("Ta c� 1 rng th莕 k�, kh玭g nh鱪g gi� 頲 nhi襲 v藅 m� c遪 c� th� kh鉧 l筰 an to祅. C� Trung Nguy猲 ch� m譶h ta c�. C� mu鑞 xem th� kh玭g?   ",3,"в ta xem th� /buy_addibox", "V� vi謈 rng m� r閚g/box_help", "Kh玭g h鴑g th� /no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("Mu鑞 mua gi飉 c� nng 蕐 c馻 h錳 m玭 �? H祅g h遖 c遪 l筰 c馻 ta kh玭g nhi襲, ch� c遪 l筰 i b玭g tai v祅g n祔 l� kh� r�, ch� c� 200 lng",2,"Mua/yes", "T竛 g蓇/other_chat","Kh玭g mua/no")
	end
end

function other_chat()
	Talk(3,"", "Ta t� T� Xuy猲 n, tr猲 阯g c� r蕋 nhi襲 th� ph�,th藅 l� nguy hi觤!", "Th藅 kh玭g th� ng� 頲 ta c� th� n khu v鵦 h� чng ёnh n祔 m� kh玭g h� b� cp! Ngi th蕐 c� l� kh玭g?", "ta nghe ngi ta n鉯 m韎 bi誸, � y kh玭g ch辵 s� qu秐 l� c馻 quan ph�, m� t� m閠 ph竔 t猲 Thi猲 Vng Bang g� , h蘮 g� � y th藅 y猲 b譶h!")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","Khuy猲 tai  g鉯 l筰 r錳! Xin gi� l蕐!")
		Pay(200);
		AddEventItem(181);
		Msg2Player("B筺 頲 m閠 i b玭g tai");
		AddNote("B筺 mua 頲 m閠 i b玭g tai � ch� thng nh﹏ 甧m v� giao cho A Phng")
--		SetTask(48, 2);
	else
		Talk(1,"","Kh竎h quan ch璦  ti襫! Khi n祇 c�  ti襫 h穣 quay l筰. ")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"Th萴 C鰑: Зy l� chi誧 rng 頲 l祄 t�  san h� xanh, c� th� cho ngi b� th猰 v藅 ph萴, c遪 c� th� kh鉧 l筰 m閠 c竎h an to祅.",	--1
				"D飊g 40 ti襫 ng  mua./#buy_addibox_yes(40)",	--2
				"D飊g 20 ti襫 ng  mua./#buy_addibox_yes(20)",	--3
				"Ьt qu�! L莕 sau s� mua! /no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--春节活动期间内
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			--Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","Kh竎h quan ch璦  ti襫! Khi n祇 c�  ti襫 h穣 quay l筰.")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: T鑞 %d Ti襫 ng, nh薾 頲 1 rng m� r閚g.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	SaveNow(); -- 立即存盘
	  	
	Talk(1,"","T鑤 qu�! я ti襫 r錳! Ta s� l藀 t鴆 l緋 t rng! V� sau kh竎h quan ch� c莕 n n琲 c� rng ch鴄  c馻 m譶h m� <color=yellow>rng m� r閚g<color> l� c� th� d飊g 頲. ")
	Msg2Player("B筺  mua ch鴆 n╪g m� r閚g rng, kh玭g gian l璾 tr�  t╪g l猲! M� rng ra b筺 s� s� d鬾g 頲 ch鴆 n╪g n祔. ")
end


function box_help()
	str=
	{
	"<#> M鏸 nh﹏ v藅 ch� mua 頲 m閠 ch鴆 n╪g m� r閚g rng th玦. N� s� theo b筺 su鑤, g錷 c� 60 �, ch鴆 n╪g v� nguy猲 l� s� d鬾g gi鑞g nh� rng ban u ch� kh玭g th� c蕋 gi� ti襫 b筩.",
	"<#> Sau khi mua ch鴆 n╪g m� r閚g rng, b筺 nh薾 頲 m閠 m藅 m� d飊g  b秓 v� c竎 trang b� tr猲 ngi c騨g nh� trong rng.",
	"<#> Sau khi nh蕁 v祇 m藅 m� s� kh鉧 l筰, c遪 trong t譶h tr筺g th竔 kh鉧, trang b� tr猲 ngi kh玭g 頲 m芻 l猲 c騨g nh� c雐 b�, nh璶g n� s� kh玭g 秐h hng n ch鴆 n╪g s絥 c� (Nh� 甶觤 s� PK qu� cao th� s� r韙 c竎 trang b� tr猲 ngi) .",
	"<#> Vi謈 thi誸 l藀 m藅 m�: nh蕁 v祇 giao di謓 rng ch鴄  n琲 <color=yellow>thi誸 l藀 m藅 m�<color>, s� hi謓 ra m閠 � nh�, tr猲  c� t� 0-9 s�  nh藀 v祇.",
	"<#> L莕 u ti猲 thi誸 l藀 m藅 m� ta nh蕁 v祇 h祅g , c遪 n誹 b筺  thi誸 l藀 qua khi nh蕁 v祇 s� l� ch豱h s鯽 m藅 m�.",
	"<#> Khi ch豱h s鯽 m藅 m� trc ti猲 ta nh藀 m藅 m� c� v祇 sau  nh蕁 hai l莕 m藅 m� m韎, x竎 nh薾 ch豱h s鯽 th祅h c玭g. ч d礽 m藅 m� 輙 nh蕋 m閠 k� t� s� d礽 nh蕋 l� 9 k� t� s�.",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;
