--中原北区 汴京府 衙门卫兵1对话

--function main(sel)
--Say("衙门卫兵：任何人只要说出对大金国不敬的言辞，就立刻抓起来！", 0);
--end;

--通缉系统专用样例脚本(BlackBay.2003.12.30)

FESTIVAL06_NPCNAME = "<color=yellow>V� binh Nha m玭:<color>";
Include([[\script\global\路人_衙门卫兵.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	--下面这个指令向系统询问当前Player的通缉相关状态信息
	--查询的结果返回以后，系统回调参数中指定的函数名
	Say("B蕋 c� ai bu玭g l阨 b蕋 k輓h v韎 Чi Kim, l藀 t鴆 b総 ngay! ", 0);
	--AskRelayForKillerStatus("KillerCallBack")
end;

--下面这个函数是查询结果的回调函数，参数个数和顺序不允许改变
function KillerCallBack(RewardMoney, RewardTaskID, CancelMoney, CancelTaskID, OwnCount, MyTaskCount)
	if (RewardMoney > 0) then
		--下面这个函数通知系统玩家已经领取了赏金，注意第一个参数0表示领赏金，第二个参数表示为哪个任务领赏金
		GetTaskMoney(0, RewardTaskID)
		Earn(RewardMoney)
	elseif (CancelMoney > 0) then
		--下面这个函数通知系统玩家已经领取了退回的标的金，注意第一个参数1表示领退金，第二个参数表示为哪个任务领退金
		GetTaskMoney(1, CancelTaskID)
		Earn(CancelMoney)
	elseif (OwnCount + MyTaskCount > 0) then
		Say("Gan ngi to th� �? T閕 danh x玭g v祇 C玭g 阯g v� Nha m玭 ngi g竛h n鎖 kh玭g v藋?", 4, "Thi誸 l藀 nhi謒 v� truy n� /CreateTask", "Ti誴 nh薾 nhi謒 v� truy n� /QueryTask", "Xem l筰 nhi謒 v� c馻 m譶h /ModifyTask", "Kh玭g l祄 g� c� /DoNothing")
	else
		Say("Gan ngi to th� �? T閕 danh x玭g v祇 C玭g 阯g v� Nha m玭 ngi g竛h n鎖 kh玭g v藋?", 3, "Thi誸 l藀 nhi謒 v� truy n� /CreateTask", "Ti誴 nh薾 nhi謒 v� truy n� /QueryTask", "Kh玭g l祄 g� c� /DoNothing")
	end
end;

function CreateTask()
	--下面这个函数通知客户端打开创建任务的界面
	OpenCreateTask()
end;

function QueryTask()
	--下面这个函数将所有能领取的任务传送给玩家客户端
	OpenAllTask()
end;

function ModifyTask()
	--下面这个函数将所已领取的任务以及已创建的任务传送给玩家客户端
	OpenOwnTask()
end;

function DoNothing()
	Say("B蕋 c� ai bu玭g l阨 b蕋 k輓h v韎 Чi Kim, l藀 t鴆 b総 ngay! ", 0)
end;