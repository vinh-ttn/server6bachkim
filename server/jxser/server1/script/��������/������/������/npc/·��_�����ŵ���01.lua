-- 翠烟门 翠烟门弟子1 入门任务
-- by：Dan_Deng(2003-07-25)

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--入门任务进行中
		Talk(1,"U36_enter","Sau khi v祇 tr薾, nh薾 頲 Hoa T譶h, n <color=Red>l鑙 ra c馻 Hoa Kh玦<color> giao cho S� t� l� 頲.")
	elseif (Uworld36 == 0) and (GetLevel() >=10) and (GetFaction() ~= "cuiyan") then		--入门任务
		Say("Theo m玭 quy, mu鑞 tr� th祅h  t� k� danh ph秈 qua <color=Red>Hoa Kh玦 tr薾<color>, d鵤 v祇 s� d騨g c秏 v� t礽 tr� l蕐 頲 <color=Green>Hoa T譶h<color>, ngi c� mu鑞 th� kh玭g?",2,"Л頲,  ta th� /enroll_yes","Kh玭g, ta ch� n tham quan. /no")
	elseif (GetFaction() == "cuiyan") then			-- 同门
		Say("S� mu閕 mu鑞 n Hoa Kh玦 tr薾 luy謓 c玭g �?",2,"ng v藋, xin t� h穣  cho mu閕 v祇 /U36_enter","Ta ch� n th╩ t� /no")
	elseif (UTask_cy == 70*256) then
		Talk(1,"","S� t� l莕 n祔 v� l�  th╩ vi課g c竎 t� mu閕, c� g� thay i kh玭g?")
	else
		Talk(1,"","Hoan ngh猲h t玭 kh竎h gi� l﹎, xin 甶 v祇 con 阯g b猲 c筺h Hoa Kh玦 tr薾.")
	end
end;

function enroll_yes()
	Talk(1, "U36_enter", "� y l� <color=Red>c鎛g v祇<color>. Sau khi v祇 tr薾 l蕐 頲 Hoa T譶h n Hoa Kh玦 tr薾 giao cho S� t� l� 頲.")
	Uworld36 = SetByte(GetTask(36),2,10)
	SetTask(36,Uworld36)
	AddNote("Ti誴 nh薾 nhi謒 v� Hoa Kh玦 tr薾 ti課 v祇 Hoa Kh玦 tr薾 v� l蕐 頲 Hoa T譶h mang giao cho  t� Th髖 Y猲 m玭 � l鑙 ra ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� Hoa Kh玦 tr薾 ti課 v祇 Hoa Kh玦 tr薾 v� l蕐 頲 Hoa T譶h mang giao cho  t� Th髖 Y猲 m玭 � l鑙 ra ")
end;

function U36_enter()
--	SetPos(207,1693)
	SetPos(210,1622)
end

function no()
end;
