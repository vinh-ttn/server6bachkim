--两湖区 巴陵县 天王将领对话 巴陵小渔任务、天王入门
--suyu
-- Update: Dan_Deng(2003-08-10)
-- Update: Dan_Deng(2003-08-21) 加入免费送本门弟子回门派
-- Update：Dan_Deng(2003-09-05) 重新整理任务变量控制

Include("\\script\\global\\各派接引弟子\\天王接引弟子.lua")

function main(sel)
	UTask_world18 = GetTask(46);
	if(UTask_world18 == 1) and (HaveItem(180) == 0) then
		Talk(1,"","T� b� ho祅? D� nhi猲 l�  c鴘 ngi! T苙g ngi 1 vi猲")
		AddEventItem(180)
--		SetTask(46, 2)				-- 为方便重做任务，只给道具不加变量值
		Msg2Player("B筺 nh薾 頲 m閠 vi猲 T� B� ho祅. ")
		AddNote("T譵 g苝  t� Thi猲 Vng, l蕐 頲 m閠 vi猲 T� B� ho祅. ")
	else
		default_talk()
	end
end;
