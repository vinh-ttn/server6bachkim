----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能1：活动头文件自定义常量
-----------------------------------------------------------------
IncludeLib("FILESYS");
--IncludeLib("BATTLE");
IncludeLib("TITLE");
IncludeLib("RELAYLADDER")
Include( "\\script\\task\\system\\task_string.lua" );

--print(date("%w"))				--获得当前服务器星期 1--Monday；2--Tuesday；3--Wednesday；4--Thursday；5--Frieday；6--Saturday；0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--最低参加守城等级
TASKID_FIRE_KEY = 1185;--random(1000000);					--每场次的关键字，由此判断是否为本轮次参加的玩家
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--玩家一天只能参加一场卫国战争，记录日期
TASKID_FIRE_ADDR = 1187;--传入的的城市ID
--1189
TSKID_FIRE_SIGNLVL = 1867	--报名时等级
TSKID_FIRE_SIGNEXP = 1868	--报名时经验值
TSKID_FIRE_SUMEXP = 1869	--获得的经验值
TSKID_PLAYER_ZHANGONG = 1879 --获得的战功值
FIRE_JOINUP_FEE = 100000;			--报名费用10w两
PL_TOTALPOINT = 1
--LADDER_ID_TEMP = 10255	--暂存排行榜
--LADDER_ID_FANIEL = 10256--最终排行

MAX_NPC_COUNT = 500--1000--5000;	--限制地图中最多有5000个npc

FIRE_1RSTNPC_COUNT = 13500--15000;
FIRE_2CNDNPC_COUNT = 3000--2000;
FIRE_3RDNPC_COUNT = 1500--1000;
FIRE_4THNPC_COUNT = 120;
FIRE_5THNPC_COUNT = 10;

TNPC_DOCTOR1 = 55;			--宋军医的Npc模板ID号
TNPC_DOCTOR2 = 49;			--金军医的Npc模板ID号
TNPC_DEPOSIT = 625;			--储物箱NPC模板ID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
RANK_SKILL = 661;		--称号光环
					--列兵	小队长	副将	大将	元帅 炸弹车
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080, 1337},	--宋
										{1072,	1073,	1074,	1075,	1090, 1337}}	--金
tbSOLDIER_NAME = {	"Ti觰 hi謚", "чi trng", "Ti猲 phong", "Ch� tng", "Ch� so竔", "C玭g Th祅h Chi課 Xa"	}
tbPlAYERER_NAME 		= {"Binh s� ","Hi謚 髖 ","Th鑞g L躰h ","Ph� tng ","Чi tng "} --战功达到称谓光环
tbPlAYERER_ZHANGONG = {     0,   300,   500,  1000,  2000} --大于0为士兵，大于300为校尉....
tbPlAYERER_GUANGHUAN= { {89,   90,   91,   92,   93}, --宋称号ID
												{94,   95,   96,   97,   98}} --金
					--卫兵	将军 守城部分的固定npc
tbTNPC_SOLDIER1 = {	{1067,	1068},	--宋
					{1072,	1073}}	--金
tbSOLDIER_NAME1 = {	"V� binh", "Tng qu﹏"}

tbSOLDIER_LEVEL = {	95, 95, 95, 100, 100 ,95}
tbSOLDIER_LEVEL1 = {	95, 95}--守城官兵的级别
                  --小校	队长	先锋	主将	主帅 炸弹车 取宝
tbKILLNPC_AWARD = {2,8,10,40,60,30,10}	--杀死npc获得战功
tbKILLNPC_SHAREAWARD = {1,5,5,20,30,15,0}--队友获得战功
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\newcitydefence\\npcdeath_1.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_2.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_3.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_4.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_5.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_6.lua",	
	};
FILE_SHOUCHENG_DEATH = {
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath1.lua",
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath2.lua",
	}

tbDEFENCE_MAPID = { 580, 581 }	--新宋金地图，by廖志山
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1528,3321},
					{1557,3330},
					{1567,3358},
					{1537,3369},
				}
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}


tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Phng Tng Ph� ", 2 },	--凤翔
						[11] = { 3018,5089, "Th祅h Й Ph� ", 1 },	--成都
						[37] = { 1632,3185, "Bi謓 Kinh Ph� ", 2 },	--汴京
						[78] = { 1439,3214, "Tng Dng Ph� ", 1 },	--襄阳
						[80] = { 1593,3197, "Dng Ch﹗ Ph� ", 1 },	--扬州
						[162] = { 1470,3269, "Чi L�", 1 },	--大理
						[176] = { 1392,3313, "L﹎ An Ph� ", 1 },	--临安
					}
					
tbDEFENCE_ANNOUNCE = {
			"Ngi ch琲 c� th� n Th祅h Й ph�, Tng Dng ph�, L﹎ An ph�, Чi L� ph�, Dng Ch﹗ ph� i tho筰 v韎 V� binh th祅h m玭  tham gia th� th祅h phe T鑞g.",
			"Ngi ch琲 c� th� n Phng Tng ph�, Bi謓 Kinh ph� i tho筰 v韎 V� binh th祅h m玭  tham gia th� th祅h phe Kim."
}

FILE_PLAYERDEATH = 		"\\script\\missions\\newcitydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\newcitydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap2.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\newcitydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18帧游戏时间相当于1秒钟
MISSIONID = 27;					--mission编号
MAX_MEMBERCOUNT = 400;			--攻城地图最大人数限制

SMALLTIMERID = 52;				--计时器编号
TOTALTIMERID = 53;				--计时器编号

SMALL_TIME = 20 * FRAME2TIME;				--每20秒计时一次
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150分钟计时一次，活动结束
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --报名30分钟之后，启动
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--守城最后5分钟没分钟，提示一次时间
CALLBOSS_ZHUSHUAI = 120 * 60 * FRAME2TIME / SMALL_TIME;	--主帅出现时间

NHOMEDEFENCE = 24 --城防初始值
NHOMEDEFENCE_DAMAGE = 1  --城防伤害值，攻城车对城防

MS_STATE = 1;				--任务中记录任务状态的变量ID
MS_RANDKEY = 2;				--记录当前任务下的key，随机数
MS_OPENDAY = 3;				--记录当前任务开始的月，日
MS_CITYCAMP = 4;			--记录本张地图的阵营，宋-1；金-2
MS_SMALL_TIME = 5;			--记录smalltimer计时器的次数
MS_BOSS4_DOWN = 6;			--为1已产生小boss，0还未
MS_BOSS5_DOWN	=	7;		--为1已产生大boss，0还未
MS_TLCOUNT_COMMON = 8;		--杀死的普通怪的总数
MS_CITYDEFENCE = 9;			--为0表示到时间没有完成任务，为1表示任务完成
MS_MISSIONID = 10;			--存入当前mission的ID

MS_MAXCOUNTNPC_1 = 11;		--小校剩余数量
MS_MAXCOUNTNPC_2 = 12;		--队长剩余数量
MS_MAXCOUNTNPC_3 = 13;			--先锋剩余数量
MS_MAXCOUNTNPC_4 = 14;			--主将剩余数量
MS_MAXCOUNTNPC_5 = 15;			--主帅剩余数量

MS_RESTCOUNTNPC_1 = 16;		--记录一共杀死的白怪数量
MS_RESTCOUNTNPC_2 = 17;		--记录一共杀死的兰怪数量
MS_RESTCOUNTNPC_3 = 18;		--记录一共杀死的杀手级怪数量
MS_RESTCOUNTNPC_4 = 19;		--记录一共杀死的小BOSS数量
MS_RESTCOUNTNPC_5 = 20;		--记录一共杀死的大BOSS数量

MS_HOMEOUT_X1 = 21;			--野外往大营的传送坐标X，第一类Trap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--野外往大营的传送坐标X，第二类Trap
MS_HOMEOUT_Y2 = 24;

MS_CENTER_X1 = 27;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y2 = 30;

MS_SHOUCHENGWEIBING = 33
MS_SHOUCHENGJIANGJUN = 34

MS_HOMEDEFENCE = 35	--城防

MS_S_GUAI1 = 1;			--记录第一个刷怪点
MS_S_GUAI2 = 2;			--记录第二个刷怪点
MS_S_GUAI3 = 3;			--记录第三个刷怪点
MS_S_CD_NAME = 4;			--当前守城战役的名字

CD_BASE_VALUE = 1000000

TB_CD_AWARDEXP = {200, 300, 400, 500, 600}
TB_CD_AWARDITEM = {
			--{ itemname, itemvalue, itemlist},
				{"Ti猲 Th秓 L� ",0.719012,{ 6,1,71,0,1,1,1 }},
				{"B竎h Qu� L� ",0.02,{ 6,1,73,0,1,1,1 }},
				{"Thi猲 s琻  B秓 L� ",0.02,{ 6,1,72,0,1,1,1 }},
				{"Huy襫 Tinh c蕄 4",0.02,{ 6,1,147,0,4,1,1 }},
				{"Huy襫 Tinh c蕄 5",0.003,{ 6,1,147,0,5,1,1 }},
				{"Huy襫 Tinh c蕄 6",0.001,{ 6,1,147,0,6,1,1 }},
				{"Huy襫 Tinh c蕄 7",0.0003,{ 6,1,147,0,7,1,1 }},
				{"Huy襫 Tinh c蕄 8",0.0001,{ 6,1,147,0,8,1,1 }},
				{"Чi L鵦 ho祅",0.02,{ 6,0,3,0,1,1,1 }},
				{"Phi T鑓 ho祅",0.02,{ 6,0,6,0,1,1,1 }},
				{"чc Ph遪g ho祅",0.02,{ 6,0,10,0,1,1,1 }},
				{"B╪g Ph遪g ho祅",0.02,{ 6,0,7,0,1,1,1 }},
				{"H醓 Ph遪g ho祅",0.02,{ 6,0,9,0,1,1,1 }},
				{"L玦 Ph遪g ho祅",0.02,{ 6,0,8,0,1,1,1 }},
				{"Cao Trung ho祅",0.02,{ 6,0,5,0,1,1,1 }},
				{"Gia B祇 ho祅",0.02,{ 6,0,2,0,1,1,1 }},
				{"Cao Thi觤 ho祅",0.02,{ 6,0,4,0,1,1,1 }},
				{"Trng M謓h ho祅",0.02,{ 6,0,1,0,1,1,1 }},
				{"B祅 Nhc T﹎ Kinh",0.0005,{ 6,1,12,0,1,1,1 }},
				{"Lam Th駓 Tinh",0.001,{ 238 }},
				{"L鬰 Th駓 Tinh",0.001,{ 240 }},
				{"T� Th駓 Tinh",0.001,{ 239 }},
				{"V� L﹎ M藅 T辌h",0.0001,{ 6,1,26,0,1,1,1 }},
				{"T葃 T駓 Kinh",0.0001,{ 6,1,22,0,1,1,1 }},
	}