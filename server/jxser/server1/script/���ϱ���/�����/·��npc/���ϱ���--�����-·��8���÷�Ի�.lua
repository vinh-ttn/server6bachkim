--西南北区 江津村 路人8吴红梅对话
--江津村新手任务：吴老爹的药
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world21 = GetTask(49);
	if (UTask_world21 == 3) then
		Talk(1,""," t� ngi  h鑤 thu鑓 cho cha ta! Зy l� i gi祔 ta m韎 v鮝 may xong, n誹 ngi kh玭g ch� xin h穣 c莔 l蕐!")
		SetTask(49, 10)
		AddRepute(6)
		AddNote("Ho祅 th祅h nhi謒 v� gi髉 Ng� l穙 gia b鑓 thu鑓 ")
		Msg2Player("Ho祅 th祅h nhi謒 v� gi髉 Ng� l穙 gia b鑓 thu鑓 ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0)then
			AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh薾 頲 m閠 i gi祔 c� ")
		else
			AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("Nh薾 頲 m閠 i gi祔 th猽 ")
		end
		Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 6 甶觤 ")
	else
		Talk(1,"","M� ta mu鑞 ╪ th辴 heo lu閏 t醝, nh璶g ngi b竛 th辴 h譶h nh� ch璦 d鋘 ra, v藋 ph秈 l祄 th� n祇 m韎 頲 y!?")
	end
end;
