--description: 唐门普通弟子 竹海第三关
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(10) == 1 then
		allbrother_0801_FindNpcTaskDialog(10)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then					--入门任务
		if (HaveItem(33) == 0) then
			Talk(1,"","L蕐 頲 g藋 tr骳 m祏 xanh r錳 n t譵 ta!")
		elseif (HaveItem(34) == 0) then
			Talk(1,"","L蕐 頲 g藋 tr骳 m祏 tr緉g r錳 n t譵 ta!")
		else
			Talk(1,"enroll_V3_Q1","Цp ng 3 qu� c馻 ta, th� c� th� l蕐 頲 <color=Red>g藋 tr骳 m祏 t輒<color>. Nghe k� y:")
		end
	elseif (Uworld37 == 80) then						--已经过了三关
		if (HaveItem(35) == 1) then
			Talk(1,"","Mu鑞 qua 秈 thu薾 l頸, ngi ph秈 l蕐  3 c﹜ tr骳, sau  a cho ng m玭 � l鑙 ra.")
		else
			AddEventItem(35)
			Talk(1,"","T筰 sao ngi l筰 v鴗 g藋 tr骳 trong r鮪g? Ta s� gi髉 ngi nh苩 l筰, ng v鴗 lung tung n鱝! ")
		end
	elseif (GetFaction() == "tangmen") then
		Talk(1,"","M鋓 ngi u l� huynh  ng m玭, ngi kh玭g c莕 x玭g v祇 Tr骳 H秈 Tam Quan! ")
	else
		Talk(1,"","ng ch箉 lung tung, coi ch鮪g b� kh� c緉!")
	end
end;

function enroll_V3_Q1()
	Say("Qu� th� nh蕋 l� 'Ch輓h Nam v� Ch輓h Йng':", 3, "Li謙 H醓 Oanh L玦 /enroll_V3_Q2", "Ngh辌h nh� nc l鯽 /False1", "ф d莡 v祇 l鯽 /False1")
end;

function False1()
	Talk(1,"","Qu� th� nh蕋 p sai r錳, c� th� m蕐 con kh�  s� n鉯 cho ngi bi誸.")
end;

function enroll_V3_Q2()
	Say("ng r錳! Qu� th� 2 l� 'Йng Nam v� Ch輓h B綾':", 3, "N骾 cao s玭g d礽 /False2", "M璦 gi� kh雐 sinh /enroll_V3_Q3", "Th� nh� v� b穙 /False2")
end;

function False2()
	Talk(1,"","Kh玭g ng! Sao kh玭g h醝 m蕐 con kh�?")
end;

function enroll_V3_Q3()
	Say("ng r錳! Qu� cu鑙 l� 'T﹜ B綾 v� T﹜ Nam':", 3, "Phong H祅h Th駓 Thng /False3", "Thi猲 tai ch h鋋 /enroll_V3_prise", "Non s玭g g蕀 v鉩 /False3")
end;	

function False3()
	Talk(1,"","Sai r錳! ng tng ngi th玭g minh h琻 con kh�, kh玭g ch鮪g n� bi誸 nhi襲 h琻 y! ")
end;

function enroll_V3_prise()
	Talk(1,"","3 qu� ngi u p ng, y l� g藋 tr骳 m祏 t輒 c馻 ngi. N誹 l蕐  3 c﹜ g藋 tr骳 giao cho ng m玭 � l鑙 ra, s� thu薾 l頸 qua 秈.")
	AddEventItem(35)
	Msg2Player("T筰 秈 th� 3 tr� l阨 Л阯g M玭 tr竛g 甶nh c﹗  v� 8 qu� b鉯, c� 頲 g藋 tr骳 t輒. ")
	Uworld37 = SetByte(GetTask(37),1,80)
	SetTask(37,Uworld37)
	AddNote("T筰 秈 th� 3 tr� l阨 Л阯g M玭 tr竛g 甶nh c﹗  v� 8 qu� b鉯, c� 頲 g藋 tr骳 t輒. ")
end;	
