-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:10:14
-- Desc			:  风之骑关卡的定点怪物死亡脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_exp"))  --定点小怪经验
FLYPOINT_MAPID= 388  --风之骑的地图id
FLYPOINT_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_jifen"))  --风之骑的定点小怪死亡获得信使积分

------信使任务风之骑定点杀怪表格--------------
--小地图坐标x，y，人物名字（60-79级）,
killfly ={
{193,194,"Чi Thi謓",1},
{181,183,"Чi Phng",2},
{197,179,"Ho祅 Nhan Minh",3},
{197,172,"Чi Di謚",4},
{198,163,"Ho祅 Nhan n",5},
{190,160,"Gia Lu藅 H筼 Nam",6},
{164,162,"Чi C� ",7},
{164,172,"Gia Lu藅 Minh",8},
{178,190,"Gia Lu藅 Kh鑓 Ba",9},
{178,187,"Ho祅 Nhan Thu﹏",10},
{169,190,"Чi Nan",11},
{172,193,"Чi L筰",12},
{165,191,"Ho祅 Nhan Ho� Y",13},
{178,2851,"Gia Lu藅 V� Nam",14},
{186,183,"Ho祅 Nhan Kh蕌",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --定点打怪开关
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	elseif ( Uworld1214 == 0 ) then  --没有定点杀怪的任务
		Msg2Player("T猲 n祔  b� ngi ta  ngi ta mua t r錳, ngi nh h緉 c騨g kh玭g 頲 ph莕 thng.")
		return
	elseif ( FLY_npcidex ~= killfly[Uworld1214][4]) then
		Msg2Player("T猲 n祔 kh玭g ph秈 l� ngi trong th� mu鑞 ngi 甶 t譵 sao? X竎 nh r� c� ph秈 l� ngi c馻 Kim C萿!")
	else
		messenger_killpoint()
	end
end