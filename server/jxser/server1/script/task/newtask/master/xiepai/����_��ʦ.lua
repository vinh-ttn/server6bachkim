
-- 与邪教相关人物扬州镖师脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

myTaskValue = GetTask(1003)

	if (myTaskValue==100) then
		task_level30_03();
		return
	elseif (myTaskValue==109) then
		task_level30_03_01(); -- 再判断一次等级是否达到 30 级
		return
	end

Say("Ngh� b秓 ti猽 l蕐 n骾 r鮪g l祄 nh�! M鏸 l莕 甶 l� m閠 l莕 kh玭g mong ng祔 v�! Nh璶g ta v蒼 y猽 n�!",0);

end