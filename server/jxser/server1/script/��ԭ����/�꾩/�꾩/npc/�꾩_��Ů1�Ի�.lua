--中原北区 汴京府 妓女1对话

-- 修改后与邪教主线相关的汴京如玉脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==300) then -- 在汴京与如玉的对话
		task_level50_03();
		return
	end

	
-- 新任务系统与邪教主线相关的脚本 --

if ( GetSex() == 0 ) then      -- 玩家性别为男
Say("C玭g t�! Л阯g xa m鈏 m謙! V祇 u鑞g v韎 ti觰 n� 1 ly ru 甶!",0)
else			       -- 玩家性别为女
Say("Xem d竛g c玭g t� phong tr莕 thanh nh�! Cho ph衟 ti觰 n� ng錳 c筺h nh�!", 0)
end;

end;


