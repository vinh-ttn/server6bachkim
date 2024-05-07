-------------------------------------------------------------------------
-- FileName		:	tmpbug8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:57:14
-- Desc			:   山神庙关卡的小怪脚本[80-89级]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_tembugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --获得同伴修练的表格

TEMBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,6 ,"bug_exp"))  --小怪经验
TEMBUGBEAR_MAPID= 391  --山神庙的地图id
TEMBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,6 ,"bug_jifen"))  --小怪经验


function OnDeath()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --玩家在地图中的时间
		Msg2Player("Xin l鏸! "..name.."! B筺  h誸 th阨 gian th鵦 hi謓 nhi謒 v� T輓 s�! Nhi謒 v� th蕋 b筰!.")
		losemessengertask()
	else
		temple_killbugbear()
	end
end