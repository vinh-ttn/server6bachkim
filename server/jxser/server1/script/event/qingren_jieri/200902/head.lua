Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\task\\system\\task_string.lua");

VALENTINE2009_START					= 20090213	-- 活动开始日期
VALENTINE2009_END					= 20090215	-- 活动结束日期
VALENTINE2009_ITEM_END				= 20090216	-- 物品有效期
VALENTINE2009_MAX_DRAW_NUM			= 9			-- 最大领取数量
VALENTINE2009_MAX_USE_NUM			= 9			-- 最大使用数量
VALENTINE2009_START_TIME			= 200000	-- 活动开始时间
VALENTINE2009_END_TIME				= 210000	-- 活动结束时间
VALENTINE2009_LEVEL_LIMIT			= 50		-- 等级限制
VALENTINE2009_AWARD_ROSENUM			= 9			-- 奖励的玫瑰数
VALENTINE2009_AWARD_EXP				= 2000000	-- 奖励的经验值
VALENTINE2009_AWARD_EXP_LIMIT		= 54000000	-- 最大的奖励经验

VALENTINE2009_TIME_GROW_B			= 20*18		-- 第一次成长时间			
VALENTINE2009_TIME_WATER_START		= 40*18		-- 开始浇水时间
VALENTINE2009_TIME_WATER_END		= 50*18		-- 结束浇水时间
VALENTINE2009_TIME_GROW_C			= 70*18		-- 第二次成长时间
VALENTINE2009_TIME_GROW_D			= 90*18		-- 开花时间
VALENTINE2009_TIME_DISAPPEAR		= 120*18	-- 消失时间

VALENTINE2009_EDITION				= 1552		-- 活动版本号
VALENTINE2009_DATE					= 1553		-- 活动日期
VALENTINE2009_DRAW_NUM				= 1560		-- 当日领取的数目
VALENTINE2009_USE_NUM				= 1561		-- 当日使用的数目
VALENTINE2009_EXPERIENCE			= 1562		-- 总共获得的经验

VALENTINE2009_NPC_NAME_BOY			= 1			-- 男孩名
VALENTINE2009_NPC_NAME_GIRL			= 2			-- 女孩名
VALENTINE2009_NPC_HAS_WATER			= 3			-- 是否已经浇水
VALENTINE2009_NPC_STEP				= 4			-- 目前处于的步骤
VALENTINE2009_NPC_NAME_BOY2			= 5		-- 男孩名2
VALENTINE2009_NPC_NAME_GIRL2		= 6			-- 女孩名2
VALENTINE2009_NPC_STEP_A			= 1			-- 形态A
VALENTINE2009_NPC_STEP_B			= 2			-- 形态B
VALENTINE2009_NPC_STEP_WATER_START	= 3			-- 开始浇水
VALENTINE2009_NPC_STEP_WATER_END	= 4			-- 结束浇水
VALENTINE2009_NPC_STEP_C			= 5			-- 形态C
VALENTINE2009_NPC_STEP_D			= 6			-- 形态D

VALENTINE2009_ITEM_ZHONGZI		= {6, 1, 1927, 1, 0, 0}		-- 情人种子
VALENTINE2009_ITEM_TIANXIAN		= {6, 1, 1928, 1, 0, 0}		-- 天仙水
VALENTINE2009_ITEM_ROSE			= {6, 0, 20  , 1, 0, 0}		-- 玫瑰花
VALENTINE2009_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPC的ID
VALENTINE2009_AREA 				= {11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,54,175,55} -- 活动开放的地图

VALENTINE2009_TALK_MAIN = 
{
	"<color=green>20:00 n 21:00<color> m鏸 ng祔 t� 13-02-2009 n 15-02-2009, c竎 v� v� l﹎ nh﹏ s� nh薾 nhi襲 nh蕋 <color=green>9<color> h箃 gi鑞g t譶h y猽 ho芻 Thi猲 Ti猲 Th駓, c竎 h� c� mu鑞 nh薾 kh玭g?",
	"Ta mu鑞 nh薾 h箃 c﹜ t譶h nh﹏.",
	"Ta mu鑞 nh薾 Thi猲 Ti猲 Th駓.",
	"Ta ch� ti謓 阯g n ch琲.",
}

VALENTINE2009_TALK_GOODS = 
{
	"H箃 c﹜ t譶h nh﹏",
	"Thi猲 Ti猲 Th駓",
	"Hoa H錸g",
}

VALENTINE2009_TALK_TREENAME			= "C﹜ t譶h nh﹏"
VALENTINE2009_TALK_PLANT			= "Tr錸g 頲 1 C﹜ T譶h Nh﹏"
VALENTINE2009_TALK_WATER			= "Ti nc th祅h c玭g"

VALENTINE2009_TALK_ERROR_ANSWER 	= "Ta  bi誸 r錳. "
VALENTINE2009_TALK_ERROR_SEX		= "Hi謕 kh竎h ch� c� th� nh薾 h箃 c﹜ t譶h nh﹏, n� hi謕 ch� c� th� nh薾 Thi猲 Ti猲 Th駓, ngi ng c� nh薾 nh莔 nh�!"
VALENTINE2009_TALK_ERROR_LEVEL		= "Ch� c� ngi ch琲 c蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng, xin h穣 c� g緉g h琻 n鱝!"
VALENTINE2009_TALK_ERROR_PAY		= "Ch� c� ngi ch琲  n閜 th� m韎 c� th� tham d� ho箃 ng."
VALENTINE2009_TALK_ERROR_MAXNUM		= "M鏸 ng祔 ch� nh薾 nhi襲 nh蕋 9 l莕, xin h穣 i ng祔 mai r錳 nh薾 ti誴."
VALENTINE2009_TALK_ERROR_DATE		= "Ch� c� th� nh薾 � th阨 甶觤 ho箃 ng t� 13-02-2009 n 15-02-2009."
VALENTINE2009_TALK_ERROR_TIME		= "Ch� c� th� nh薾 t� 20:00 n 21:00"
VALENTINE2009_TALK_ERROR_NOTMAN		= "Ch� hi謕 kh竎h m韎 c� th� s� d鬾g h箃 c﹜ t譶h nh﹏!"
VALENTINE2009_TALK_ERROR_DIE		= "H箃 c﹜ t譶h nh﹏ n祔  � tr筺g th竔 kh� h衞 r錳."
VALENTINE2009_TALK_ERROR_MAXUSE		= "M鏸 ng祔 ch� c� th� s� d鬾g 9 l莕, xin m阨 i ng祔 mai r錳 h穣 ti誴 t鬰."
VALENTINE2009_TALK_ERROR_TEAM		= "Ch� c� 1 t� i g錷 nh﹏ v藅 nam v� n� m韎 c� th� s� d鬾g!"
VALENTINE2009_TALK_ERROR_AREA 		= "Ch� tr錸g c﹜ 頲 � t筰 th玭 tr蕁 v� th祅h th�!"
VALENTINE2009_TALK_ERROR_FIGHT		= "Kh玭g th� tr錸g c﹜ � tr筺g th竔 chi課 u!"
VALENTINE2009_TALK_ERROR_ARID		= "B譶h Thi猲 Ti猲 Th駓  c筺 nc r錳!"
VALENTINE2009_TALK_ERROR_NOWATER	= "H祅h trang c馻 ngi v蒼 ch璦 c� Thi猲 Ti猲 Th駓, xin h穣 ki觤 tra l筰 nh�!"
