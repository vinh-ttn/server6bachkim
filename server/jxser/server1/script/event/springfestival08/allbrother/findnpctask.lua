-- 文件名　：findnpctask.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-19 14:54:47
--找到npc对话的脚本
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
function allbrother_0801_FindNpcTaskDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if nTaskState == 0 then
		Say("B筺 dng nh� v蒼 ch璦 ti誴 nh薾 nhi謒 v� c馻 B綾 u M玭.", 0)
	end
	if nTaskState > 1073741824 then
		Say("H穣 mau n g苝 B綾 u L穙 Nh﹏ ph鬰 m謓h.", 0)
	end
	if nTaskId == nTaskState then
		allbrother_0801_CompleteTask()
	end
end

function allbrother_0801_CheckIsDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	if allbrother_0801_IsAct() ~= 1 then
		return 0;
	end
	if nTaskState == 0 then
		return 0;
	end
	if nTaskId ~= nTaskState then
		return 0
	end
	return 1;
end

