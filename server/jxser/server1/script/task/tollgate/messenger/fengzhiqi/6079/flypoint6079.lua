-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 19:39:14
-- Desc			:   风之骑关卡的定点怪物死亡脚本[60-79级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_exp"))  --定点小怪经验
FLYPOINT_MAPID= 387  --风之骑的地图id
FLYPOINT_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_jifen"))  --风之骑的定点小怪死亡获得信使积分

------信使任务风之骑定点杀怪表格--------------
--小地图坐标x，y，人物名字（60-79级）,
killfly ={
{193,194,"Ho祅 Nhan Xung",1},
{181,183,"Ho祅 Nhan V� Lo筰",2},
{197,179,"Чi Cao",3},
{197,172,"Ho祅 Nhan T� ",4},
{198,163,"Чi M閏",5},
{190,160,"Ho祅 Nhan Nguy謙",6},
{164,162,"Gia Lu藅 M穘h",7},
{164,172,"Чi H綾",8},
{178,190,"Ho祅 Nhan Ni猲",9},
{178,187,"Чi V� ",10},
{169,190,"Gia Lu藅 B輓h Trng",11},
{172,193,"Ho祅 Nhan H筼",12},
{165,191,"Gia Lu藅 L藀 Ph萴",13},
{178,2851,"Ho祅 Nhan An",14},
{186,183,"Чi Tr� ",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --定点打怪开关
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if ( messenger_middletime() == 10 ) then --玩家在地图中的时间
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