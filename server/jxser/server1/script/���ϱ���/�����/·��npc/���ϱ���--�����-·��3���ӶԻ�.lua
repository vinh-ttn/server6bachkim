--西南北区 江津村 路人3虎子对话
--江津村新手任务：虎子的弹弓
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	if ((UTask_world45 == 0) and (GetLevel() >= 5)) then		-- 任务启动，需要5级以上
		if(GetSex() == 0)then
			Say("Чi ca! Th� r蘮 h鴄 t苙g ta m閠 c﹜ gi祅 n�, kh玭g bi誸  l祄 xong ch璦, h穣 h醝 玭g 蕐 d飉 ta!", 2 , "Gi髉 /yes", "Kh玭g gi髉 /no")
		else
			Say("Чi t�, Th� r蘮 s� t苙g ta m閠 c﹜ gi祅 n�, kh玭g bi誸  l祄 xong ch璦, h穣 h醝 玭g 蕐 d飉 ta!", 2 , "Gi髉 /yes", "Kh玭g gi髉 /no")
		end
	elseif(UTask_world45 == 10) then
		Talk(1,"","Mau 甶 h醝 i th骳 l祄 xong ch璦?")
	elseif(UTask_world45 == 20) then
		if(HaveItem(176) == 1) then
			Talk(1,"","T鑤 l緈, T鑤 l緈! Ch髏 n鱝 ta s� 甶 t譵 Thi猲 Thi猲 ch琲. Thanh v� kh� n祔 ta t譵 頲 ngo礽 th玭, ta gi� � y ch糿g l祄 g�, th玦 th� g鰅 t苙g ngi!")
			DelItem(176)
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			AddItem(0,0,random(0,5),2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)		-- 一把随机二级武器
			SetTask(45, 100)
			AddRepute(8)
			AddNote("Ho祅 th祅h nhi謒 v� mang gi祅 n� v� cho H� t� ")
			Msg2Player("Mang gi祅 n� v� cho H� t�, nhi謒 v� ho祅 th祅h ")
			Msg2Player("Nh薾 頲 m閠 binh kh� ")
			Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 8 甶觤 ")
		else
			Talk(1,"","ьi i th骳 gi髉 ta l祄 xong n�, ta mu鑞 甶 ra ngo礽 th玭 b緉 chim, nh璶g kh玭g mu鑞  m� ta bi誸, b� nh蕋 nh s� kh玭g cho ta 甶!")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","t筰 ao tuy誸 v蒼 ch璦 r琲 nh�? Ta th輈h nh蕋 l� ch箉 a tr猲 tuy誸!")
		else
			Talk(1,"","Ai da! Kh玭g bi誸 th骳 th骳 Th� r蘮  l祄 n� xong ch璦? Tay ngh� c馻 i th骳 r蕋 gi醝. Ti謒 thi誸 ki誱 n鎖 ti課g c馻 玭g g莕 xa u bi誸 ti課g, t筼 ra nh鱪g lo筰 v� kh� tuy謙 v阨!")
		end
	end
end;

function yes()
	Talk(1,"","Ti謒 c馻 th骳 th骳 Th� r蘮 n籱 ngay c鯽 th玭, r蕋 d� t譵!")
	SetTask(45, 10)
	AddNote("Ti誴 nh薾 nhi謒 v� thay H� t� n h醝 ngi th� r蘮  l祄 xong c﹜ gi祅 n� ch璦 ")
	Msg2Player("Ti誴 nh薾 nhi謒 v� thay H� t� n h醝 ngi th� r蘮  l祄 xong c﹜ gi祅 n� ch璦 ")
end;

function no()
	Talk(1,"","Ta 甶 t譵 ngi kh竎 甶 h醝 d飉 ta!")
end;
