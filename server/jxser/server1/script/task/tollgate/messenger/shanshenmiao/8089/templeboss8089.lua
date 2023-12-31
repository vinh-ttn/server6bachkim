-------------------------------------------------------------------------
-- FileName		:	templeboss8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   山神庙关卡的标志boss脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

NPC_PARAM_ID = 1;        --用在boss死亡后刷出怪物的特殊事件中，增加npc的时候作为GetNpcParam的第二位，意思是该函数取出的是代表目前死亡bossID的数字   
TEMBOSS_RELIVE=120        --每个标志的重生时间
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_exp"))  --小怪经验
TEMBOSS_MAPID=391        --当前玩家所在地图风之骑的地图编号？？是多少？？
TEMBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_jifen"))  --小怪经验

templeboss2=
{
--刀妖兄弟80-89级
{837,85,391,1520,2625,1,"o Y猽 Huynh е L� L穙 Ti猰",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",1},
{837,85,391,1519,2718,1,"o Y猽 Huynh е Ho箃 C鑤 Nh薾",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",2},
{837,85,391,1465,2795,1,"o Y猽 Huynh е Tam Ti猰 o",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",3},
{837,85,391,1436,2955,1,"o Y猽 Huynh е C竔 L鵦 V╪",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",4},
{837,85,391,1379,3056,1,"o Y猽 Huynh е Di猽 L� T祅g",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",5},
{837,85,391,1412,3091,1,"o Y猽 Huynh е L﹎ Thng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",6},
{837,85,391,1499,2996,1,"o Y猽 Huynh е L筩 o B輓h",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",7},
{837,85,391,1530,2836,1,"o Y猽 Huynh е L璾 Khu誧h T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",8},
{837,85,391,1581,2701,1,"o Y猽 Huynh е Lng B蕋 B譶h",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",9},
{837,85,391,1360,2979,1,"o Y猽 Huynh е Vng Kh雐 Di",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",10},
{837,85,391,1404,2810,1,"o Y猽 Huynh е L� Tinh Tinh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",11},
{837,85,391,1404,2688,1,"o Y猽 Huynh е Li猽 S莔 Ch﹏",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",12},
{837,85,391,1463,2706,1,"o Y猽 Huynh е Tri謚 Ti觰 V╪",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",13},
{837,85,391,1465,3136,1,"o Y猽 Huynh е Ti誹 S竔",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",14},
{837,85,391,1558,3151,1,"o Y猽 Huynh е Ti誹 Thu莕 Dng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",15},
{837,85,391,1572,3000,1,"o Y猽 Huynh е Qu竎h Чt L� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",16},
{837,85,391,1572,2843,1,"o Y猽 Huynh е Tr莕 Ph鑙",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",17},
{837,85,391,1333,2774,1,"o Y猽 Huynh е Chu Song",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",18},
{837,85,391,1344,2669,1,"o Y猽 Huynh е L� Kim",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",19},
{837,85,391,1485,2625,1,"o Y猽 Huynh е M� C玭",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",20},

}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("Чi hi謕  ti猽 di謙 頲 %d t猲 o Y猽", GetTask(Task_KillNPC)))
		else
		Msg2Player("Чi hi謕  ho祅 th祅h nhi謒 v� ti猽 di謙 o Y猽, H穣 n Chi課 t﹎ T玭 Gi� ho祅 th祅h nhi謒 v�")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		Msg2Player("B筺 th祅h c玭g h� t猲 o Y猽.")
		messenger_templego(NpcIndex)
	end
end

