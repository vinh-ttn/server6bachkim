--========文件定义==================================--
--文件名：/script/event/evnethead.lua
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：2005-3-22
--功能叙述：
--	市场活动的头文件，该文件存储各种市场活动的开关，
--市场活动的开关，在这里控制。
--
--游戏脚本·剑侠情缘网㈢版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--

if not EVENTHEAD_LUA then
EVENTHEAD_LUA = 1

--========函数定义==================================--
--函数原形：validateDate(startt,endt)
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	验证当前时间是否在市场活动时间内
--参数：
--	startt：市场活动起盛时间，为整数，精确到小时，市场
--活动必须从某天的某时0分启动，格式为YYMMDDHH
--	endt：市场活动的终止时间，为整数，精确到消失，市场
--活动必须在某天的某时0分之前终止，格式为YYMMDDHH
--返回值：
--	nil表示当前时间不在市场活动日期内。否则表示在市场活
--动日期内。
--==================================================--
function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 0
	end
	return nil
end

--========函数定义==================================--
--函数原形：Quit()
--作者：yfeng
--创建日期：2005-3-22
--最后修改日期：
--功能叙述：
--	对话框通用关闭函数
--==================================================--
function Quit()
	return
end

--========函数定义==================================--
--函数原形：LIGUAN_TAG(msg)
--作者：yfeng
--创建日期：2005-3-21
--最后修改日期：
--功能叙述：
--	用于图形对话框中礼官图片的链接
--参数：
--	msg：图片后跟的文本信息
--==================================================--
function LIGUAN_TAG(msg)
	return "<link=image[0,20]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>L� Quan<link>"..msg
end

DATESNEWBIELEVELUP = 05032400 --孝手疯狂经验翻倍活动于2005-3-24日0点0分启动
DATEENEWBIELEVELUP = 19040100 --孝手疯狂经验翻倍活动于2005-4-1日0点0分关闭

DATESPLAYERLEVELUP = 05032600 --全区闪电冲级行动于2004-3-24日0时0分启动(开启)
DATEEPLAYERLEVELUP = 19040300 --全区闪电冲级行动于2004-4-1日0时0分关闭(开启)

DATESKILLER = 05041200
DATEEKILLER = 19042600

--update:2005-03-21
YEARCARD_EX_XUANJING = 1 --剑网年卡活动
REVIVAL_PLAYER = nil
GREAT_NIGHT = 1
end
