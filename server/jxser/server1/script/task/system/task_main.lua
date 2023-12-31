
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统回调函数处理文件
-- Edited by peres
-- 2005/07/04 PM 19:59

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 物品库支持
IncludeLib("ITEM");

-- 读入数据定义头文件
Include("\\script\\task\\system\\task_head.lua");

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

-- 读入对话字符处理文件
Include("\\script\\task\\system\\task_string.lua");

Include([[\script\tong\tong_award_head.lua]]);-- by志山，帮会周目标贡献度
-- 请求开始一个新任务
function ApplyTask(taskname)

	-- 检查任务是否满足开始条件
	local result = OnCheckTaskStart(taskname);
	if (result == 1) then
		OnTaskSay(taskname, 0);
		return 1;
	end
	return 0;
end

-- 检查任务是否可以开始的回调函数
function OnCheckTaskStart(taskName)
	
	local nRow, nCol = TaskConditionMatrix(taskName);
	local strType, strDesc = "","";
	local nCheck = 0;
	local i,j = 0,0;
	
	local nLevel = 0; -- 等级判断的条件获取
	
	CDebug:MessageOut("B総 u xem"..taskName.." 甶襲 ki謓");
		
		-- 如果任务根本不需要条件，则直接开始
		if nRow==0 or nRow==nil then return 1; end;
	
		-- 开始循环遍历整个任务条件表
		for i=1, nRow do
		
			strType = TaskCondition(taskName, i, Condition.TaskType_Row);
			strDesc = TaskCondition(taskName, i, Condition.TaskDesc_Row);
			
			-- 人物等级大于的条件判断
			if strType==Condition.LevelMore then
				nLevel = tonumber(strDesc);
				if GetLevel()>nLevel then
					CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 ng c蕄 l韓, th玭g qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 人物等级小于的条件判断
			if strType==Condition.LevelLess then
				nLevel = tonumber(strDesc);
				if GetLevel()<nLevel then
					CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 ng c蕄 nh�, th玭g qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- 人物等级等于的条件判断
			if strType==Condition.LevelEqual then
				nLevel = tonumber(strDesc);
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 ng c蕄, th玭g qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 任务是否已经开始的条件判断
			if strType==Condition.TaskStart then
				if GetTaskStatus(strDesc)==1 then
					CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 c� 甶襲 ki謓"..strDesc.."B総 u, th玭g qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- 任务是否已经结束的条件判断
			if strType==Condition.TaskEnd then
				if GetTaskStatus(strDesc)==3 then
					CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 c� 甶襲 ki謓"..strDesc.."K誸 th骳, th玭g qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			--任务是否可以重复开始
			if strType==Condition.CanRestart then
				if tonumber(strDesc)==1 then
					CDebug:MessageOut(taskName.." 襲 ki謓 b総 u c馻 nhi謒 v� l� c� th� b総 u l筰, th玭g qua");
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 如果什么都不填
			if strType=="" then
				CDebug:MessageOut(taskName.." nhi謒 v� n祔 頲 mi詎 v藅 ph萴, th玭g qua.");
				nCheck = nCheck + 1;
			end;
	
		end;
		
		-- 如果任务已经开始了，那则不能反复开始
		if GetTaskStatus(taskName)~=0 then
			CDebug:MessageOut(taskName.." nhi謒 v� n祔  b総 u, kh玭g th� quay l筰 n鱝");
			return 0;
		end;
		
		-- 如果全部条件符合，则返回 1
		if nCheck==nRow then
			CDebug:MessageOut(taskName.." nhi謒 v� n祔 to祅 b� 頲 th玭g qua");
			WriteTaskLog(taskName.." 襲 ki謓  p 鴑g, c� th� b総 u nhi謒 v�.");
			return 1;
		else
			return nil;
		end;

end;


-- 任务开始时的细节处理
function OnTaskStart(taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local nOldRow, nOldCol = 0, 0;  -- 上一次随机任务的维度
	
	local szOldTaskName = "";  -- 上一次随机任务的名字
	
	local strType = ""
	local nKillEvent = 0;
	local nEventResult = 0;
	local i=0;
	
	local nDelItemResult = 0;  -- 删除随机任务卷轴物品的返回值
	
	local nEvent = GetTaskEventID(taskName); -- 判断是哪一个事件的开始
	
		-- 如果是随机任务的开始
		if nEvent==3 then

			-- 如果是通过帮会任务令牌启动的
			if GetTask(ID_RANDOMTASKTEMP)~=0 then
				
				nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMTASKTEMP));

				-- 将临时变量清零
				SetTask(ID_RANDOMTASKTEMP, 0);
								
				-- 异常处理，删除不成功
				if nDelItemResult~=1 then
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					return 0;
				end;
				
			end;

			szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	
			-- 如果新的随机任务与旧的不同，则清空正在进行的随机任务
			if szOldTaskName~=taskName then
				SetTaskStatus( szOldTaskName, 0 );
				CloseTask( szOldTaskName );
			end;
			
			-- 获得之前的维度
			nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
			
			-- 如果当前正在进行的任务有杀怪计数，则清空计数器
			for i=1, nRow do
				nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
				if nKillEvent~=nil or nKillEvent~="" then
					RemovePlayerEvent(tonumber(nKillEvent));
				end;
			end;
		
			-- 将当前正在进行的任务ID储存
			SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
			
			-- 将任务进程设置为已经接了任务
			setRandomTaskState(2);
			
			-- 同步任务变量
			SyncTaskValue(ID_RANDOMTASK);
			
			-- 写入随机任务完成的时间和次数
			writeRandomTaskEnable();

		end;
	
		-- 如果是卷轴任务的开始则删除任务物品
		if nEvent==4 then
			
			nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMBOOKTEMP));
			
			-- 异常处理，删除不成功
			if nDelItemResult~=1 then
				SetTaskStatus(taskName, 0);
				CloseTask(taskName);
				return 0;
			end;
			
			SetTask(ID_RANDOMBOOKTEMP, 0);
			
			-- 将当前正在进行的随机任务ID储存
			SetTask(ID_RANDOMBOOK, TaskNo(taskName));
			
			-- 同步任务变量
			SyncTaskValue(ID_RANDOMBOOK);

			-- 写入每天开启的时间与次数
			writeTaskBookTimes();
			
		end;
	
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			nKillEvent = TaskEntity(taskName, i, Entity.KillNpcName_Row);
			nNpcItemRate = TaskEntity(taskName, i, Entity.DropItemRate_Row);
			
			-- 如果是收集物品任务，则预先占据一个临时变量
			if strType==Entity.Collect then
				CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 ki誱 lo筰 v藅 ph萴, ph秈 giao n筽 k辮 l骳");	
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- 如果是收集黄金装备任务，则预先占据一个临时变量
			if strType==Entity.CollectGoldItem then
				CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 ki誱 trang b� ho祅g kim, ph秈 giao n筽 k辮 l骳");
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- 如果是收集怪物掉落物品任务，则预先占据一个临时变量，变量内容为计数器的编号
			if strType==Entity.CollectNpcItem then
				CDebug:MessageOut(taskName.." Nhi謒 v� y猽 c莡 gi誸 qu竔 thu th藀 v藅 ph萴, c莕 s� d鬾g bi課 s� t筸 th阨");
				SetTmpValue(taskName, TmpType.ItemNpc, tonumber(nKillEvent));
				
				CDebug:MessageOut(taskName.."Nhi謒 v� y猽 c莡 gi誸 qu竔 thu th藀 v藅 ph萴, thi誸 l藀 x竎 su蕋 v藅 ph萴:"..nNpcItemRate);
				SetTmpValue(taskName, TmpType.ItemRate, tonumber(nNpcItemRate));
				
				nEventResult = AddPlayerEvent(tonumber(nKillEvent));
				
				if nEventResult==0 then
					CDebug:MessageOut(taskName.."Kh雐 ng b� m s� qu竔 b� gi誸 ph竧 sinh l鏸, id l�:"..nKillEvent);
				end;
				
			end;
			
			-- 如果有杀怪计数的话则开启一个计数器，并也占用一个临时变量
			if nKillEvent~="" and strType==Entity.KillNpc then
				CDebug:MessageOut(taskName.." c莕 m� ch鴆 n╪g s竧 qu竔. S� hi謚 l� "..nKillEvent);
				SetTmpValue(taskName, TmpType.KillNpc, 0);
				AddPlayerEvent(tonumber(nKillEvent));
			end;
			
			-- 如果有与 NPC 对话的话则占用一个临时变量
			if strType==Entity.TalkNpc then
				CDebug:MessageOut(taskName.." nhi謒 v� n祔 c莕 i tho筰 v韎 NPC, ph秈 ti課 h祅h k辮 th阨.");
				SetTmpValue(taskName, TmpType.TalkNpc, 0);
			end;
			
		end;
		
		-- 如果任务开始后的对话不为空的话则说一段话
		if TaskTalk(taskName, 1, 2)~="" then
			CreateTaskSay({TaskTalk(taskName, 1, 2),
						   "K誸 th骳 i tho筰/OnTaskExit"}
						  );
		end;
		
		-- 提示玩家任务已经开始
		Msg2Player("B筺 ti誴 nh薾<color=yellow>"..GetTaskText(taskName).."<color>");

end;


--取消原有任务的函数
function delorgtask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	-- 清空正在进行的随机任务
	SetTaskStatus( szOldTaskName, 0 );
	CloseTask( szOldTaskName );
	-- 获得之前的维度
	nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
	-- 如果当前正在进行的任务有杀怪计数，则清空计数器
	for i=1, nRow do
		nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
		if nKillEvent~=nil or nKillEvent~="" then
			RemovePlayerEvent(tonumber(nKillEvent));
		end;
	end;
end;

-- 将当前正在进行的任务ID储存
function setnewtask()
	SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
	
	setRandomTaskState(2);	-- 将任务进程设置为已经接了任务
	SyncTaskValue(ID_RANDOMTASK);	-- 同步任务变量
	writeRandomTaskEnable();	-- 写入随机任务完成的时间和次数
end;

-- 检测任务是否完成的回调函数
function OnCheckTaskFinish(taskName, nType)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local i=0;
	
	local strType = "";
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local nQuality, nGoodsNum, nDelGoods = 0,0,0;
	local nMoney = 0;
	local strKillNpcName = "";
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local nRightCheck = GetTaskFinishConditionNum(taskName);  -- 完成任务所需要达成的条件量
	local nCheck = 0;
	
		CDebug:MessageOut(taskName.." C� s� 甶襲 ki謓 nhi謒 v� c莕 t n l�:"..nRightCheck);
	
		-- 如果是对话触发条件完成
		if nType==1 and CheckTalkCanFinish(taskName)==1 then
			CDebug:MessageOut(taskName.." nhi謒 v� t n m鬰 ti猽");
			SetTmpValue(taskName, TmpType.TalkNpc, 1);
		end;
		
		-- 如果是杀怪计数触发完成
		if nType==2 then
			if GetTmpValue(taskName, TmpType.ItemNpc)~=0 and GetTmpValue(taskName, TmpType.ItemNpc)~=nil then
				-- 如果是由杀怪掉落的任务触发，则调用选择物品
				SelectCollectItemTask(taskName);
			else
				CDebug:MessageOut(taskName.." nhi謒 v� gi誸 qu竔 t n m鬰 ti猽");
				Msg2Player(GetTaskText(taskName).."甶襲 ki謓 gi誸 qu竔  t 頲");
				SetTmpValue(taskName, TmpType.KillNpc, 1);
			end;
		end;
		
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			-- 如果是收集物品的任务
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				if GetTmpValue(taskName, TmpType.Collect)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 如果是杀怪计数的任务
			if strType==Entity.KillNpc then
				if GetTmpValue(taskName, TmpType.KillNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- 如果是与 NPC 对话的任务
			if strType==Entity.TalkNpc then
				if GetTmpValue(taskName, TmpType.TalkNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		-- 如果全部条件符合，则返回 1
		if nCheck==nRightCheck then
			CDebug:MessageOut(taskName.." M鬰 ti猽 t蕋 c� nhi謒 v�  t 頲!");
			return 1;
		else
			return nil;
		end;
	
end;


-- 任务对话的入口
function OnTaskSay(taskName, nState)

	if nState==0 or nState>=2 then
		OnTaskSay_Call(taskName, nState);
		return
	end;
	
	if CreateTalkTask()~=1 then
		OnTaskSay_Call(taskName, nState);
	end;
	
end;


-- 任务对话时的回调函数
function OnTaskSay_Call(taskName, nState)
	local entityRow, entityCol = TaskEntityMatrix(taskName);
	local nRow, nCol = TaskTalkMatrix(taskName);
	local strInfo = ""; -- 任务说明字段
	
	local nIsGoods = 0; -- 是否有要提交物品
	local i=0;
	
	local aryTaskSay = {};
	local strTalk = "";
	
		-- 判断任务是否有需要提交的物品
		for i=1, entityRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				nIsGoods = 1;
			end;
			
		end;
	
		-- 任务开始时的对话处理
		if nState==0 then
		
			CDebug:MessageOut(taskName.." цi tho筰 khi nhi謒 v� b総 u");
			
			strInfo = TaskTalk(taskName, 1, 6);
			strTalk = TaskTalk(taskName, 1, 1);
			
			-- 如果任务开始对话没有的话直接开始
			if strTalk=="" then
				CreateTaskSay({TaskTalk(taskName, 1, 2),
							  "сng/OnTaskExit"}
					          );
				SelectTaskStart(TaskNo(taskName));
				return
			end;
			
			if strInfo=="" then
				CreateTaskSay({strTalk,
							  "Ti誴 nh薾 nhi謒 v� /#SelectTaskStart("..TaskNo(taskName)..")",
							  "Kh玭g ti誴 nh薾/#OnTaskExit("..TaskNo(taskName)..")"}
							  );
			else
				CreateTaskSay({strTalk,
								"Ti誴 nh薾 nhi謒 v� /#SelectTaskStart("..TaskNo(taskName)..")",
								"Xem thuy誸 minh nhi謒 v� /#ShowTaskInfo("..TaskNo(taskName)..")",
								"Kh玭g ti誴 nh薾/#OnTaskExit("..TaskNo(taskName)..")"}
								);
			end;
			return
		end;
	
		-- 任务结束提交时的对话处理
		if nState==1 then
			
			CDebug:MessageOut(taskName.." цi tho筰 khi ti課 h祅h nhi謒 v� ");
			
			if nIsGoods==0 then
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					
					aryTaskSay = {strTalk,
								   "Ho祅 th祅h nhi謒 v� /#SelectTaskFinish("..TaskNo(taskName)..")",
								   "V蒼 ch璦 ho祅 th祅h/OnTaskExit"};
								   
					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "H駓 b� nhi謒 v�/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;
					
					CreateTaskSay(aryTaskSay);
					
				else
					SelectTaskFinish(TaskNo(taskName));
				end;
				return
			else
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					CDebug:MessageOut(taskName.." C莕 ph秈 giao v藅 ph萴  ho祅 th祅h nhi謒 v�! Nh蕄 v祇 giao di謓 'giao n筽'");
					-- 将任务号储存在临时变量中
					SetTaskTemp(TASK_TEMP_ID, TaskNo(taskName));
					
					aryTaskSay = {strTalk,
								  "Ho祅 th祅h nhi謒 v� /OnShowGiveUI",
								  "V蒼 ch璦 ho祅 th祅h/OnTaskExit"};

					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "H駓 b� nhi謒 v�/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;			
					
					CreateTaskSay(aryTaskSay);

				end;
				return
			end;
			
		end;
		
		-- 任务发奖时的对话处理
		if nState==2 then
			CDebug:MessageOut(taskName.." цi tho筰 khi nh薾 ph莕 thng trong nhi謒 v� ");
			strTalk = TaskTalk(taskName, 1, 4);
			if strTalk ~="" then
				CreateTaskSay({strTalk,
							   "Nh薾 l穘h ph莕 thng/#SelectTaskAward("..TaskNo(taskName)..")",
							   "T筸 th阨 ch璦 l蕐/OnTaskWait"}
							  );			
			else
				SelectTaskAward(TaskNo(taskName));
			end;
		end;
		
		-- 任务已经完成，则不用再与 NPC 有其它对话
		if nState==3 then
			NpcDialog();
			return
		end;
end;


function OnShowGiveUI()
	GiveItemUI("Giao v藅 ph萴","H穣  nh鱪g v藅 ph萴 c莕 thi誸 v祇","OnCheckGoods","OnTaskWait");
end;


function OnCheckGoods(nCount)

	-- 获取临时变量里任务的名称
	local taskName = TaskName(GetTaskTemp(TASK_TEMP_ID));
	
	-- 获取任务的行数和列数
	local nRow, nCol = TaskEntityMatrix(taskName);
	
	-- 任务行数所对应的内容类型
	local strType = "";
	
	-- 任务所需要物品的 MAP
	local aryNeed = {};
	
	-- 所需要删除物品的数组
	local aryDelItem = {};
	
	-- 任务所需要的物品总数
	local nNeed = GetTaskCollectNum(taskName);
	
	-- 任务所要的物品编号
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
	-- 玩家传进来的物品编号
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- 真实的物品数量
	local nRealCount, nCheckCount = 0, 0;
	
	-- 如果物品需要记录随机种子，则记录序号
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- 如果物品数量与要找的数量不符，直接返回
	if nRealCount ~= nNeed then
		CDebug:MessageOut(taskName.."S� v藅 ph萴 c莕:"..nNeed.." t v祇"..nRealCount.." t v祇 kh玭g ph� h頿!");
		SelectTaskFinish(TaskNo(taskName));
		Say("S� lng v藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
		return
	end;
	
	-- 构造任务所需要物品的 MAP
	for i=1, nRow do
		
		w_Genre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
		w_Detail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
		w_Particular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
		w_Level      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
		w_GoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
		w_GoodsNum   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		w_DelGoods   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
		
		w_Quality    = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
		
		nRandomSeedRecord = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_RecordSeed_Row));
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			tmpNeedKey = tostring(w_Quality)..","..
						 tostring(w_Genre)..","..
						 tostring(w_Detail)..","..
						 tostring(w_Particular);
			
			-- 如果没有这个 MAP KEY 则初始化
			if aryNeed[tmpNeedKey] then
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			else
				aryNeed[tmpNeedKey]={};
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			end;

			-- CDebug:MessageOut("构成的任务物品数组：["..tmpNeedKey.."]："..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
		end;
		
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
			
				-- 如果任务物品不需要判断五行或者等级的
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				-- 如果相对应的 KEY 的五行和等级都符合的话
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- 如果符合条件的物品需要记录随机种子，则记录
					-- 记录的格式为：[任务名][随机种子序号][随子种子数]
					if aryNeed[tmpGetKey][j][5]~=-1 then
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTmpValue(taskName, 
									TmpType.ItemSeed..aryNeed[tmpGetKey][j][5], 
									nRandomSeed);
						CDebug:MessageOut(taskName.." v藅 ph萴"..tmpGetKey.." S� ng蓇 nhi猲 c莕 ghi l筰:"..nRandomSeed);
					end;
					
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- 清空符合条件的数组
			aryDelItem = {};
			
			Say("V藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
			return
		end;
		
	end;
	
	-- 检查是不是所有的物品都正确
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("V藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 0);
				return
			end;
		end;
	end;
		
	-- 记录一共有多少个物品需要删除
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("Li謙 k� nh鱪g v藅 ph萴 c莕 lo筰 b�:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("C莕 ph秈 lo筰 b�:"..aryDelItem[i]);
	end;

	SetTmpValue(taskName, TmpType.Collect, 1);
	SelectTaskFinish(TaskNo(taskName));
	
	return

end;


-- 检测此人物是否为相应任务的对话者
function OnTaskNpcTalk(npcName, npcMap, taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local i=0;
	
	CDebug:MessageOut("Ph竛 畂竛"..npcMap.." trong b秐 "..npcName.." c� ph秈 do"..taskName.." i tho筰 v韎 nh﹏ v藅 trong nhi謒 v� ");
	
		for i=1, nRow do
		
			strTalkNpcName = TaskEntity(taskName, i, Entity.TalkNpcName_Row);
			strTalkNpcMap = TaskEntity(taskName, i, Entity.TalkNpcMap_Row);
			
			CDebug:MessageOut(taskName.." Nh﹏ v藅 y猽 c莡:"..strTalkNpcName.." B秐  khu v鵦 y猽 c莡:"..strTalkNpcMap);
			
			if strTalkNpcName==npcName and strTalkNpcMap==npcMap then
				return 1;
			end;
			
		end;
		
		return nil;
	
end;

-- 任务结束时的处理
function OnTaskFinish(taskName)
	local nEvent = GetTaskEventID(taskName); -- 判断是哪一个事件的开始

	-- 获取杀怪掉落物品的杀怪事件
	local nKillEventID = tonumber(GetTmpValue(taskName, TmpType.ItemNpc));

	-- 如果随机任务的开始
	if (nEvent==3) then
		tongaward_randomevent();--by志山，帮会周目标
	end;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- 是否删除物品正确
	local i=0;
		
		CDebug:MessageOut(taskName.."Lo筰 b� v藅 ph萴 khi k誸 th骳 nhi謒 v�, g錷:"..nItem.."c竔");
		
		-- 如果一个物品也不需要删除，则直接返回
		if nItem==0 then return end;
	
		-- 删除任务所需要的物品
		for i=1, nItem do
			nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
			
			-- 异常处理，如果有删除不成功，则直接将任务变成还没完成
			if nResult~=1 then
				SetTaskStatus(taskName, 1);
				return
			end;
			
		end;
		
		-- 将所需物品个数的临时变量给清了
		SetTaskTemp(TASK_CHECKITEM_NUM, 0);
		
		-- 如果有杀怪计数器则将其删除
		if nKillEventID~=0 then
			RemovePlayerEvent(nKillEventID);
		end;
		
		return
	
end;


-- 任务发奖处理
function OnAward(taskName)
	
	-- 如果此任务本来就已经领过奖的话则直接跳出此过程，防止刷奖励
	if GetTaskStatus(taskName)==3 then
		return
	end;

	local nResult = PayAwardMain(taskName);
		return nResult;

end;


-- 什么都不做的空函数
function OnTaskWait()
	return
end;


-- 选择退出后的处理
function OnTaskExit(taskID)
	
local nTaskID_Now = GetTask(ID_RANDOMTASK);

local nEvent = 0; -- 判断是哪一个事件的取消过程
	
	-- 如果传进来的 taskID 是空值，则表示是不需要特殊处理的任务调用
	if taskID==nil or taskID==0 then return end;
	
	nEvent = GetTaskEventID(TaskName(taskID));
	
	-- 如果是随机任务的调用
	if nEvent==3 then
		
		setRandomTaskState(2);
	
		-- 清空目前正在进行的随机任务
		SetTaskStatus(TaskName(nTaskID_Now), 0);
		CloseTask( TaskName(nTaskID_Now) );
		
		--[DinhHQ]
		--20110401: Fix bug l謓h b礽 bang h閕
		local nItemIdx = GetTask(ID_RANDOMTASKTEMP)
		if nItemIdx ~= 0 then
			local nG, nD, nP = GetItemProp(nItemIdx)
			if ((nG == 6 and nD == 2 and nP == 1020) or (nG == 6 and nD == 1 and nP == 30106) or (nG == 6 and nD == 1 and nP == 30107) or (nG == 6 and nD == 1 and nP == 30108)) and (GetTask(2589) >= 0) then				
				SetTask(2589, GetTask(2589) - 1);
			end	
		end
		
		Msg2Player("<color=yellow>Х l鵤 ch鋘 kh玭g ti誴 nh薾 nhi謒 v�.<color>");
		return
	end;
	
	-- 如果是卷轴任务的调用
	if nEvent==4 then
		return
	end;

end;
