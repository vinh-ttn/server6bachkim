
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务任务卷轴触发脚本
-- Edited by peres
-- 2005/09/01 PM 16:40

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 同伴系统的支持
IncludeLib("PARTNER");

-- 读入任务系统头文件，包含随机任务
Include("\\script\\task\\system\\task_main.lua");

strPublic       = "<color=green>M藅  nhi謒 v�<color>:";

function main(nIndex)

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出

local nTaskID = GetItemMagicLevel(nIndex, 1);

local nNowTaskID = GetTask(ID_RANDOMBOOK);  -- 获取当前卷轴任务的 ID

local nTaskState = 0;  -- 当前卷轴任务的状态

	if (GetProductRegion() == "cn") then
		-- 判断是否召唤出同伴
		if partnerindex==0 or partnerstate==0 then
			Msg2Player(strPublic.."<color=yellow>B筺 kh玭g c� ng h祅h tri謚 g鋓 kh玭g th� c n閕 dung trong m藅 .<color>");
			return 1;
		end;
	end;
	
	-- 判断每天 8 次的限制是否符合
	if checkTaskBookEnable()~=1 then
		Msg2Player(strPublic.."<color= v筺hite>B筺 h玬 nay qu� m謙 r錳,  ng祔 mai l祄 ti誴 nhi謒 v� 甶!<color>");
		return 1;
	end;
	
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)));
	end;
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>M藅  nhi謒 v�<color>: Hi謓 t筰 b筺 ch璦 ho祅 th祅h m藅  nhi謒 v�, b筺 x竎 nh l祄 nhi謒 v� m韎 kh玭g?",
			2,
			"Ph秈, ta mu鑞 b� qua m藅  nhi謒 v� trc /#_confirmRandomBookTask("..nIndex..")",
			"Kh玭g ph秈, i m閠 l竧 !/OnTaskExit");
		return 1;
	else
		
		-- 清空任务卷轴里面记载的任务，否则不能用任务引擎开始
		SetTaskStatus(TaskName(nTaskID), 0);
		local nResult = CloseTask(TaskName(nTaskID));

		-- 存储物品 INDEX 在任务变量中
		SetTask(ID_RANDOMBOOKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );

		if nResult~=1 then
			WriteTaskLog("[Tr筺g th竔 d� thng] � Task ID:"..nTaskID..", kh玭g 頲 ng l筰 ng c竎h! Process l�: TaskBook Main().");
		end;
		
		return 1;
	end;

end;


-- 确认接受卷轴任务
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- 清空当前正在做的卷轴任务
	SetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMBOOK)));

	-- 清空任务卷轴里面记载的任务，否则不能用任务引擎开始
	SetTaskStatus(TaskName(nTaskID), 0);
	local nResult = CloseTask(TaskName(nTaskID));
	
	-- 存储物品 INDEX 在任务变量中
	SetTask(ID_RANDOMBOOKTEMP, nIndex)
	
	ApplyTask( TaskName(nTaskID) );
	
	if nResult~=1 then
		WriteTaskLog("[Tr筺g th竔 d� thng] � Task ID:"..nTaskID..", kh玭g 頲 ng l筰 ng c竎h! Process l�: _confirmRandomBookTask, tham s� a v祇 l�:"..nIndex);
	end;
	
	return
	
end;