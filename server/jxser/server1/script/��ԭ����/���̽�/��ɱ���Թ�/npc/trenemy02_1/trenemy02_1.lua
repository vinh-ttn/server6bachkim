--description: 七杀洞死囚1　天忍10级任务
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(51) == 0)) then			--取消对任务物品有无的判断，以便重做任务
		AddEventItem(51)
		Msg2Player("L蕐 頲 m秐h th� nh蕋 c馻 l謓h b礽. ")
		AddNote("L蕐 頲 m秐h th� nh蕋 c馻 l謓h b礽 trong Th蕋 S竧 ng. ")
	end
end;
