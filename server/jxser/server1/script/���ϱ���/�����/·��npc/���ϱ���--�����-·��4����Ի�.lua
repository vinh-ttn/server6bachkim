--西南北区 江津村 路人4天天对话
--江津村新手任务：虎子的弹弓
--suyu
-- Update: Dan_Deng(2003-08-11)

function main(sel)
	UTask_world18 = GetTask(46);
	if(UTask_world8 == 1) then
		Talk(1,"","H� t� ca n鉯 i khi huynh 蕐 c� n�, s� d蒼 ch竨 甶 b緉 chim, th藅 th輈h qu�!")
	elseif(UTask_world18 == 2) then
		Talk(1,"","N� c馻 H� T� ca ch璦 l祄 xong sao?")
	elseif(UTask_world18 >= 10) then
		Talk(1,"","Hay l緈, l竧 n鱝 H� T� Ca s� n t譵 ch竨!")
	else
		Talk(1,"","H� T� ca lu玭 g箃 g蒻 ch竨! Ch竨 ph秈 m衏 m� huynh 蕐!")
	end
end;
