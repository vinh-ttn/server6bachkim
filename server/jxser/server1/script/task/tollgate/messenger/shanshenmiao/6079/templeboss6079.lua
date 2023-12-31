-------------------------------------------------------------------------
-- FileName		:	templeboss6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   山神庙关卡的标志boss脚本[60-79级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格


NPC_PARAM_ID = 1;        --用在boss死亡后刷出怪物的特殊事件中，增加npc的时候作为GetNpcParam的第二位，意思是该函数取出的是代表目前死亡bossID的数字   
TEMBOSS_RELIVE=120       --每个标志的重生时间
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_exp"))  --小怪经验
TEMBOSS_MAPID=390        --当前玩家所在地图风之骑的地图编号？？是多少？？
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,5 ,"boss_jifen"))  --小怪经验

templeboss=
{
{834,70,390,1520,2625,1,"o Y猽 Huynh е L﹎ Чt",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",1},
{834,70,390,1519,2718,1,"o Y猽 Huynh е Trng Tam",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",2},
{834,70,390,1465,2795,1,"o Y猽 Huynh е Cao Чt",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",3},
{834,70,390,1436,2955,1,"o Y猽 Huynh е Thi誸 Ch秓",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",4},
{834,70,390,1379,3056,1,"o Y猽 Huynh е уng T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",5},
{834,70,390,1412,3091,1,"o Y猽 Huynh е Cng Nha",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",6},
{834,70,390,1499,2996,1,"o Y猽 Huynh е Trng Tu",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",7},
{834,70,390,1530,2836,1,"o Y猽 Huynh е Vng Nh� Ma T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",8},
{834,70,390,1581,2701,1,"o Y猽 Huynh е B祅 L� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",9},
{834,70,390,1360,2979,1,"o Y猽 Huynh е H� B� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",10},
{834,70,390,1404,2810,1,"o Y猽 Huynh е H錸g C玭",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",11},
{834,70,390,1404,2688,1,"o Y猽 Huynh е Li評 Qu竧",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",12},
{834,70,390,1463,2706,1,"o Y猽 Huynh е L� Чi Ni猲",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",13},
{834,70,390,1465,3136,1,"o Y猽 Huynh е U玭g Ng璾",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",14},
{834,70,390,1558,3151,1,"o Y猽 Huynh е Thi誸 Nha",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",15},
{834,70,390,1572,3000,1,"o Y猽 Huynh е L� Ti觰 Ch駓",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",16},
{834,70,390,1572,2843,1,"o Y猽 Huynh е M筺 Чp",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",17},
{834,70,390,1333,2774,1,"o Y猽 Huynh е S琻 Phong",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",18},
{834,70,390,1344,2669,1,"o Y猽 Huynh е B竧 чc",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",19},
{834,70,390,1485,2625,1,"o Y猽 Huynh е Xa Tri謙",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\6079\\templebro6079.lua",20},
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

