--description: 峨嵋派叶冰痕
--author: yuanlan	
--date: 2003/3/3
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
--update: Dan_Deng(2003-07-24), 加“重返门派”任务
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）
-- Update: Dan_Deng(2004-01-13)重新设计入门任务，改为记名弟子任务

function main()
	UTask_em = GetTask(1)
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "emei") then			-- 任务启动
		Say("Nga Mi s琻 l� v飊g t thi猲g li猲g m閠 c鈏 c馻 Nga Mi, kh玭g n ti誴 k� ph祄 tr莕 dung t鬰.Ngi c� h鴑g th� x玭g v祇 Li猲 Ho祅 quan sao?", 2, "в ta th� xem. /Uworld36_get_yes", "Ta ch蕄 nh薾 thua cu閏 /no")
	elseif (Uworld36 == 20) then 					--完成第一关
		Talk(1,"","Ngi c� th� ti誴 t鬰 th� th竎h, v� ti誴 theo l� S� mu閕 <color=Red>T莕 � Phong<color> � <color=Red>Ngh猲h Kh竎h Th筩h<color>")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--尚未入门（可取消入门任务）
--		Say("叶冰痕：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？",2,"我不想加入峨嵋派了/enroll_cancel","继续接受考验/no")
	elseif (GetFaction() == "emei") then   				--已经入门，尚未出师
		Talk(1,"","S� mu閕! C� th輈h u鑞g tr� kh玭g?")
	else							--其它对话
		Talk(1,"","Th筩h chi觧 khinh phi s総 s総 tr莕; Nh� hng phanh xu蕋 ti課 kh� xu﹏; Th� gian tuy謙 ph萴 nh﹏ nan th鴆; Nh祅 i tr� kinh 鴆 c� nh﹏..")
	end
end;

function Uworld36_get_yes()
	AddNote("G苝 Di謕 B╪g Ng﹏, nh薾 nhi謒 v� x玭g Li猲 Ho祅 Quan ")
	Msg2Player("G苝 Di謕 B╪g Ng﹏, nh薾 nhi謒 v� x玭g Li猲 Ho祅 Quan ")
	Talk(3, "select", "Kh� l緈! Mu閕 c莕 qua <color=Red>4 秈<color>, ch� c馻 ta l� <color=Red>秈 th� 1<color>.", "Ta r蕋 th輈h u鑞g tr�, n祇 c飊g ta u鑞g 3 ly! Ch� c莕 mu閕 c� th� tr� l阨 3 c﹗ h醝 v� tr�, l� c� th� qua 秈 thu薾 l頸!.", "N誹 kh玭g tr� l阨 頲, h穣 quay v� 甶! Nga Mi S琻 kh玭g hoan ngh猲h nh鱪g k� t莔 thng!")
end;

function no()
end;

------------------- 入门任务问答 -----------------------
function select()
	Msg2Player("D飊g xong ch衝 tr� th� nh蕋, tr� l阨 c﹗ h醝 th� nh蕋. ")
	Say("Ly th� nh蕋 l� Thi誸 Quan , mu閕 c� bi誸 Thi誸 Quan  thu閏 lo筰 tr� n祇 kh玭g?", 3, "H錸g tr� /False1", "L鬰 tr� /False1", "� Long tr�. /True1");
end;

function False1()
	Say("Kh玭g ng r錳! Cho mu閕 th猰 1 l莕 c� h閕, suy ngh� th藅 k� nh�!.", 3, "H錸g tr� /False1", "L鬰 tr� /False1", "� Long tr�. /True1");
end;

function True1()
	Msg2Player("D飊g xong ch衝 tr� th� 2, tr� l阨 c﹗ h醝 th� 2. ")
	Say("Kh� l緈! M阨 u鑞g ly tr� th� 2: Ly n祔 l� B竎h Hoa Tr� 頲 ph鑙 h頿 v韎 l鬰 tr� v� c竎 lo礽 hoa nh礽, hoa h錸g, tng vi, thu c骳, chi t�, m閏 t�...Hng tr� h遖 quy謓 v韎 hng hoa th祅h m閠 th�. Mu閕 c� bi誸 d飊g lo筰 nc g�  pha tr� kh玭g?", 3, "Nc m璦 th竛g 3 /False2", "Su鑙 � Th﹎ s琻 /False2", "Tuy誸 tr猲 hoa mai /True2");
end;

function False2()
	Say("Tr� l阨 sai r錳, h穣 th� l筰 甶!", 3, "Nc m璦 th竛g 3 /False2", "Su鑙 � Th﹎ s琻 /False2", "Tuy誸 tr猲 hoa mai /True2");
end;

function True2()
	Msg2Player("Ngi h穣 u鑞g ly tr� cu鑙 c飊g 甶 r錳 tr� l阨 c﹗ h醝 th� 3 ")
	Say("Xem ra mu閕 c騨g c遪 ch髏 th玭g minh. Ly cu鑙 c飊g l� H莡 Kh玦 Tr�, lo筰 tr� n祔 m鋍 tr猲 n骾 cao ch鉻 v鉻 r鮪g s﹗ n骾 th糾.Con ngi kh玭g th� h竔 v�, ch� c� th� hu蕁 luy謓 lo礽 kh� l猲 n骾 h竔 v�, t�  m韎 c� c﹗ chuy謓 l� H莡 kh玦, v韎 mu玭 v祅 v蕋 v� m韎 c� 頲 lo筰 l鬰 tr� qu� hi誱. Mu閕 c� bi誸 n琲 s秐 xu蕋 H莡 Kh玦 Tr� � u kh玭g?", 3, "Th竔 B譶h, Huy Ch﹗ /True3", "N骾 чng ёnh Qu﹏ /False3", "T﹜ H�, H祅g Ch﹗ /False3");
end;

function False3()
	Say("C� ph秈 mu閕 nh� nh莔 ch╪g? H穣 ngh� l筰 甶!", 3, "Th竔 B譶h, Huy Ch﹗ /True3", "N骾 чng ёnh Qu﹏ /False3", "T﹜ H�, H祅g Ch﹗ /False3");
end;

function True3()
	Talk(1,"","Ngi c� th� ti誴 t鬰 th� th竎h, v� ti誴 theo l� S� mu閕 <color=Red>T莕 � Phong<color> � <color=Red>Ngh猲h Kh竎h Th筩h<color>")
	Uworld36 = SetByte(GetTask(36),1,20)
	SetTask(36, Uworld36)
	AddNote("B筺 tr� l阨 ch輓h x竎 3 c﹗ h醝 v� tr�, qua 秈 th� nh蕋. ")
	Msg2Player("Tr� l阨 ng 3 c﹗ h醝 v� tr� coi nh� ngi  qua c鯽 秈 th� nh蕋, h穣 n ' Ngh猲h Kh竎h Th筩h' g苝 s� mu閕 T莕 � Phong  nh薾 th� th竎h ti誴 theo ")
end;
