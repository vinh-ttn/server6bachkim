
-- ====================== 文件信息 ======================

-- 剑侠情缘online 经验补偿活动头文件
-- Edited by peres
-- 2005/12/21 AM 11:23

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- 升级所需的经验表

ID_2005EXPISPAY = 2333; -- 记录是否已经领取

-- 2005 年 12 月停机补偿经验的主入口
function getExpiationExp_200512()

local nYear  = tonumber(date("%y"));
local nMonth = tonumber(date("%m"));
local nDay   = tonumber(date("%d"));

	-- 判断是否冲卡
	if IsCharged()==0 then
		Say("Th藅 xin l鏸! Ho箃 ng b錳 thng n祔 ch� c� ngi ch琲 <color=yellow>n筽 th�<color> m韎 頲 tham gia!", 0);
		return
	end;
	
	-- 判断等级是否大于 50 级
	if GetLevel()<50 then
		Say("Th藅 xin l鏸! Ho箃 ng b錳 thng n祔 ch� c� ngi ch琲 <color=yellow>ng c蕄 t� 50 tr� l猲<color> m韎 頲 tham gia!", 0);
		return
	end;
	
	-- 判断是否已经领取过了
	if GetTask(ID_2005EXPISPAY)~=0 then
		Say("Uhm! Ta nh� kh玭g l莔 ngi  nh薾 qua kinh nghi謒 b錳 thng r錳, ng tham lam nh� v藋!", 0);
		return
	end;
	
	-- 判断是否符合日期：2005/12/23 ~ 2005/12/31
	if nYear==5 and nMonth==12 and nDay>=23 and nDay<=31 then
		compensateExp();
		return
	else
		Say("Th藅 xin l鏸! Ho箃 ng b錳 thng l莕 n祔 l� t� <color=yellow>23/12/2005<color> b総 u n <color=yellow>31/12/2005<color>, hi謓 nay <color=yellow> k誸 th骳<color>, ngi h穣 v� 甶!", 0);
		return	
	end;

end;


-- 补偿经验的主函数
function compensateExp()

local nExp = getRedeemeExp();

	SetTask(ID_2005EXPISPAY, 1);  -- 写入任务变量，先写变量再加经验，以防后面出错后会刷经验

	addPlayerExp(nExp);
	
	Say("Ho箃 ng b錳 thng l莕 n祔 c馻 b筺 nh薾 頲: <color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒!", 0);
	
	Msg2Player("Ho箃 ng b錳 thng l莕 n祔 c馻 b筺 nh薾 頲:<color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒!");
	
	WriteTaskLog("Trong ho箃 ng b錳 thng kinh nghi謒 nh薾 頲"..nExp.." 甶觤 kinh nghi謒!");

end;


-- 获取应该补偿的经验
function getRedeemeExp()

local nLevel = GetLevel();

	return nLevel * 8 * 20000;
	
end;


-- 给玩家加指定的经验，叠加类型
function addPlayerExp(myExpValue)
	tl_addPlayerExp(myExpValue)	
end;


--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog(" [K� l鬰 b錳 thng kinh nghi謒]"..date(" [%y n╩ %m th竛g %d ng祔  %H gi� %M ph髏]").." [m藅 m�:"..GetAccount().."] [nh﹏ v藅:"..GetName().."]"..strMain);
end;
