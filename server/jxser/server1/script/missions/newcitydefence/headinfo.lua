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

TB_CD_AWARDEXP = {600, 700, 800, 900, 1000}
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
				{"M秐h Hi謕 C鑤 Thi誸 Huy誸 Sam (1/4) /4)",0.0001,{ 903 }},
				{"M秐h Hi謕 C鑤 Thi誸 Huy誸 Sam (2/4) /4)",0.0001,{ 904 }},
				{"M秐h Hi謕 C鑤 Thi誸 Huy誸 Sam (3/4) /4)",0.0001,{ 905 }},
				{"M秐h Hi謕 C鑤 Thi誸 Huy誸 Sam (4/4) /4)",0.0001,{ 906 }},
				{"M秐h Hi謕 C鑤  T譶h Ho祅 (1/4) /4)",0.0002,{ 907 }},
				{"M秐h Hi謕 C鑤  T譶h Ho祅 (2/4) /4)",0.0002,{ 908 }},
				{"M秐h Hi謕 C鑤  T譶h Ho祅 (3/4) /4)",0.0002,{ 909 }},
				{"M秐h Hi謕 C鑤  T譶h Ho祅 (4/4) /4)",0.0002,{ 910 }},
				{"M秐h Hi謕 C鑤 n Tam Gi韎 (1/4) /4)",0.0002,{ 911 }},
				{"M秐h Hi謕 C鑤 n Tam Gi韎 (2/4) /4)",0.0002,{ 912 }},
				{"M秐h Hi謕 C鑤 n Tam Gi韎 (3/4) /4)",0.0002,{ 913 }},
				{"M秐h Hi謕 C鑤 n Tam Gi韎 (4/4) /4)",0.0002,{ 914 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (1/6) /6)",0.00002,{ 771 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (2/6) /6)",0.00002,{ 772 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (3/6) /6)",0.00002,{ 773 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (4/6) /6)",0.00002,{ 774 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (5/6) /6)",0.00002,{ 775 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (6/6) /6)",0.00002,{ 776 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (1/6) /6)",0.00001,{ 777 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (2/6) /6)",0.00001,{ 778 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (3/6) /6)",0.00001,{ 779 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (4/6) /6)",0.00001,{ 780 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (5/6) /6)",0.00001,{ 781 }},
				{"M秐h C﹏ Qu鑓 Ngh� Thng (6/6) /6)",0.00001,{ 782 }},
				{"M秐h Nhu T譶h Th鬰 N� H筺g Li猲 (1/4) /4)",0.0002,{ 915 }},
				{"M秐h Nhu T譶h Th鬰 N� H筺g Li猲 (2/4) /4)",0.0002,{ 916 }},
				{"M秐h Nhu T譶h Th鬰 N� H筺g Li猲 (3/4) /4)",0.0002,{ 917 }},
				{"M秐h Nhu T譶h Th鬰 N� H筺g Li猲 (4/4) /4)",0.0002,{ 918 }},
				{"M秐h Nhu T譶h  Ph鬾g Nghi Gi韎 Ch� (1/4) /4)",0.0002,{ 919 }},
				{"M秐h Nhu T譶h  Ph鬾g Nghi Gi韎 Ch� (2/4) /4)",0.0002,{ 920 }},
				{"M秐h Nhu T譶h  Ph鬾g Nghi Gi韎 Ch� (3/4) /4)",0.0002,{ 921 }},
				{"M秐h Nhu T譶h  Ph鬾g Nghi Gi韎 Ch� (4/4) /4)",0.0002,{ 922 }},
				{"M秐h Nhu T譶h  Tu� T﹎ Ng鋍 B閕 (1/4) /4)",0.00002,{ 923 }},
				{"M秐h Nhu T譶h  Tu� T﹎ Ng鋍 B閕 (2/4) /4)",0.00002,{ 924 }},
				{"M秐h Nhu T譶h  Tu� T﹎ Ng鋍 B閕 (3/4) /4)",0.00002,{ 925 }},
				{"M秐h Nhu T譶h  Tu� T﹎ Ng鋍 B閕 (4/4) /4)",0.00002,{ 926 }},
				{"M秐h мnh Qu鑓 Thanh Sa Trng Sam (1/4) /4)",0.0001,{ 927 }},
				{"M秐h мnh Qu鑓 Thanh Sa Trng Sam (2/4) /4)",0.0001,{ 928 }},
				{"M秐h мnh Qu鑓 Thanh Sa Trng Sam (3/4) /4)",0.0001,{ 929 }},
				{"M秐h мnh Qu鑓 Thanh Sa Trng Sam (4/4) /4)",0.0001,{ 930 }},
				{"M秐h мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa (1/4) /4)",0.0002,{ 931 }},
				{"M秐h мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa (2/4) /4)",0.0002,{ 932 }},
				{"M秐h мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa (3/4) /4)",0.0002,{ 933 }},
				{"M秐h мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa (4/4) /4)",0.0002,{ 934 }},
				{"M秐h мnh Qu鑓 T� Щng H� uy觧 (1/4) /4)",0.0002,{ 935 }},
				{"M秐h мnh Qu鑓 T� Щng H� uy觧 (2/4) /4)",0.0002,{ 936 }},
				{"M秐h мnh Qu鑓 T� Щng H� uy觧 (3/4) /4)",0.0002,{ 937 }},
				{"M秐h мnh Qu鑓 T� Щng H� uy觧 (4/4) /4)",0.0002,{ 938 }},
				{"M秐h мnh Qu鑓 Ng﹏ T祄 Y猽 i (1/4) /4)",0.0002,{ 939 }},
				{"M秐h мnh Qu鑓 Ng﹏ T祄 Y猽 i (2/4) /4)",0.0002,{ 940 }},
				{"M秐h мnh Qu鑓 Ng﹏ T祄 Y猽 i (3/4) /4)",0.0002,{ 941 }},
				{"M秐h мnh Qu鑓 Ng﹏ T祄 Y猽 i (4/4) /4)",0.0002,{ 942 }},
				{"M秐h Tr輈h Tinh Ho祅 (1/6) /6)",0.00005,{ 711 }},
				{"M秐h Tr輈h Tinh Ho祅 (2/6) /6)",0.00005,{ 712 }},
				{"M秐h Tr輈h Tinh Ho祅 (3/6) /6)",0.00005,{ 713 }},
				{"M秐h Tr輈h Tinh Ho祅 (4/6) /6)",0.00005,{ 714 }},
				{"M秐h Tr輈h Tinh Ho祅 (5/6) /6)",0.00005,{ 715 }},
				{"M秐h Tr輈h Tinh Ho祅 (6/6) /6)",0.00005,{ 716 }},
				{"M秐h Л阯g Ngh� Gi竝 (1/6) /6)",0.00005,{ 717 }},
				{"M秐h Л阯g Ngh� Gi竝 (2/6) /6)",0.00005,{ 718 }},
				{"M秐h Л阯g Ngh� Gi竝 (3/6) /6)",0.00005,{ 719 }},
				{"M秐h Л阯g Ngh� Gi竝 (4/6) /6)",0.00005,{ 720 }},
				{"M秐h Л阯g Ngh� Gi竝 (5/6) /6)",0.00005,{ 721 }},
				{"M秐h Л阯g Ngh� Gi竝 (6/6) /6)",0.00005,{ 722 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (1/6) /6)",0.000005,{ 723 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (2/6) /6)",0.000005,{ 724 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (3/6) /6)",0.000005,{ 725 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (4/6) /6)",0.000005,{ 726 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (5/6) /6)",0.000005,{ 727 }},
				{"M秐h L鬰 Ph� Th髖 H� Th﹏ Ph� (6/6) /6)",0.000005,{ 728 }},
				{"M秐h B筩h Kim Y猽 i (1/6) /6)",0.00001,{ 729 }},
				{"M秐h B筩h Kim Y猽 i (2/6) /6)",0.00001,{ 730 }},
				{"M秐h B筩h Kim Y猽 i (3/6) /6)",0.00001,{ 731 }},
				{"M秐h B筩h Kim Y猽 i (4/6) /6)",0.00001,{ 732 }},
				{"M秐h B筩h Kim Y猽 i (5/6) /6)",0.00001,{ 733 }},
				{"M秐h B筩h Kim Y猽 i (6/6) /6)",0.00001,{ 734 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 735 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 736 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 737 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 738 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 739 }},
				{"M秐h Thi猲 T祄 H� Uy觧 (1/6) /6)",0.00001,{ 740 }},
				{"M秐h Thi猲 T祄 Ngoa (1/6) /6)",0.00001,{ 741 }},
				{"M秐h Thi猲 T祄 Ngoa (2/6) /6)",0.00001,{ 742 }},
				{"M秐h Thi猲 T祄 Ngoa (3/6) /6)",0.00001,{ 743 }},
				{"M秐h Thi猲 T祄 Ngoa (4/6) /6)",0.00001,{ 744 }},
				{"M秐h Thi猲 T祄 Ngoa (5/6) /6)",0.00001,{ 745 }},
				{"M秐h Thi猲 T祄 Ngoa (6/6) /6)",0.00001,{ 746 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (1/6) /6)",0.0001,{ 747 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (2/6) /6)",0.0001,{ 748 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (3/6) /6)",0.0001,{ 749 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (4/6) /6)",0.0001,{ 750 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (5/6) /6)",0.0001,{ 751 }},
				{"M秐h B╪g Tinh Th筩h H筺g Li猲 (6/6) /6)",0.0001,{ 752 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (1/6) /6)",0.0001,{ 753 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (2/6) /6)",0.0001,{ 754 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (3/6) /6)",0.0001,{ 755 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (4/6) /6)",0.0001,{ 756 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (5/6) /6)",0.0001,{ 757 }},
				{"M秐h C骳 Hoa Th筩h Ch� Ho祅 (6/6) /6)",0.0001,{ 758 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (1/6) /6)",0.0001,{ 759 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (2/6) /6)",0.0001,{ 760 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (3/6) /6)",0.0001,{ 761 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (4/6) /6)",0.0001,{ 762 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (5/6) /6)",0.0001,{ 763 }},
				{"M秐h 襫 Ho祅g Th筩h Ng鋍 B閕 (6/6) /6)",0.0001,{ 764 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (1/6) /6)",0.0001,{ 765 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (2/6) /6)",0.0001,{ 766 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (3/6) /6)",0.0001,{ 767 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (4/6) /6)",0.0001,{ 768 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (5/6) /6)",0.0001,{ 769 }},
				{"M秐h K� Huy誸 Th筩h Gi韎 Ch� (6/6) /6)",0.0001,{ 770 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (1/6) /6)",0.0001,{ 783 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (2/6) /6)",0.0001,{ 784 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (3/6) /6)",0.0001,{ 785 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (4/6) /6)",0.0001,{ 786 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (5/6) /6)",0.0001,{ 787 }},
				{"M秐h Hi謕 C鑤 T譶h � K誸 (6/6) /6)",0.0001,{ 788 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (1/6) /6)",0.00001,{ 789 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (2/6) /6)",0.00001,{ 790 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (3/6) /6)",0.00001,{ 791 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (4/6) /6)",0.00001,{ 792 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (5/6) /6)",0.00001,{ 793 }},
				{"M秐h Kim Ti Ch輓h H錸g C� Sa (6/6) /6)",0.00001,{ 794 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (1/6) /6)",0.00001,{ 795 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (2/6) /6)",0.00001,{ 796 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (3/6) /6)",0.00001,{ 797 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (4/6) /6)",0.00001,{ 798 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (5/6) /6)",0.00001,{ 799 }},
				{"M秐h Huy襫 V� Ho祅g Kim Kh秈 (6/6) /6)",0.00001,{ 800 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (1/6) /6)",0.00001,{ 801 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (2/6) /6)",0.00001,{ 802 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (3/6) /6)",0.00001,{ 803 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (4/6) /6)",0.00001,{ 804 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (5/6) /6)",0.00001,{ 805 }},
				{"M秐h T葃 Tng Ng鋍 Kh蕌 (6/6) /6)",0.00001,{ 806 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (1/6) /6)",0.00001,{ 807 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (2/6) /6)",0.00001,{ 808 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (3/6) /6)",0.00001,{ 809 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (4/6) /6)",0.00001,{ 810 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (5/6) /6)",0.00001,{ 811 }},
				{"M秐h H錸g Truy Nhuy詎 Th竝 H礽 (6/6) /6)",0.00001,{ 812 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (1/6) /6)",0.00001,{ 813 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (2/6) /6)",0.00001,{ 814 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (3/6) /6)",0.00001,{ 815 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (4/6) /6)",0.00001,{ 816 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (5/6) /6)",0.00001,{ 817 }},
				{"M秐h Thanh T﹎ Hng Thi謓 Ch﹗ (6/6) /6)",0.00001,{ 818 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (1/6) /6)",0.00001,{ 819 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (2/6) /6)",0.00001,{ 820 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (3/6) /6)",0.00001,{ 821 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (4/6) /6)",0.00001,{ 822 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (5/6) /6)",0.00001,{ 823 }},
				{"M秐h B輈h H秈 H錸g Linh Ba (6/6) /6)",0.00001,{ 824 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (1/6) /6)",0.00001,{ 825 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (2/6) /6)",0.00001,{ 826 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (3/6) /6)",0.00001,{ 827 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (4/6) /6)",0.00001,{ 828 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (5/6) /6)",0.00001,{ 829 }},
				{"M秐h U Lung Kim X� Ph竧 Цi (6/6) /6)",0.00001,{ 830 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (1/6) /6)",0.00001,{ 831 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (2/6) /6)",0.00001,{ 832 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (3/6) /6)",0.00001,{ 833 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (4/6) /6)",0.00001,{ 834 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (5/6) /6)",0.00001,{ 835 }},
				{"M秐h U Lung M芻 Th� Nhuy詎 L� (6/6) /6)",0.00001,{ 836 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (1/6) /6)",0.00001,{ 837 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (2/6) /6)",0.00001,{ 838 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (3/6) /6)",0.00001,{ 839 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (4/6) /6)",0.00001,{ 840 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (5/6) /6)",0.00001,{ 841 }},
				{"M秐h Ch� Phc Di謙 L玦 C秐h Ph� (6/6) /6)",0.00001,{ 842 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (1/6) /6)",0.00001,{ 843 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (2/6) /6)",0.00001,{ 844 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (3/6) /6)",0.00001,{ 845 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (4/6) /6)",0.00001,{ 846 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (5/6) /6)",0.00001,{ 847 }},
				{"M秐h мa Ph竎h H綾 Di謒 Xung Thi猲 Li猲 (6/6) /6)",0.00001,{ 848 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (1/6) /6)",0.00001,{ 849 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (2/6) /6)",0.00001,{ 850 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (3/6) /6)",0.00001,{ 851 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (4/6) /6)",0.00001,{ 852 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (5/6) /6)",0.00001,{ 853 }},
				{"M秐h уng C鮱 Gi竛g Long C竔 Y (6/6) /6)",0.00001,{ 854 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (1/6) /6)",0.00001,{ 855 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (2/6) /6)",0.00001,{ 856 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (3/6) /6)",0.00001,{ 857 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (4/6) /6)",0.00001,{ 858 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (5/6) /6)",0.00001,{ 859 }},
				{"M秐h уng C鮱 Kh竛g Long H� Uy觧 (6/6) /6)",0.00001,{ 860 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (1/6) /6)",0.00001,{ 861 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (2/6) /6)",0.00001,{ 862 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (3/6) /6)",0.00001,{ 863 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (4/6) /6)",0.00001,{ 864 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (5/6) /6)",0.00001,{ 865 }},
				{"M秐h Ma Ho祅g Kim Gi竝 Kh玦 (6/6) /6)",0.00001,{ 866 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (1/6) /6)",0.00001,{ 867 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (2/6) /6)",0.00001,{ 868 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (3/6) /6)",0.00001,{ 869 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (4/6) /6)",0.00001,{ 870 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (5/6) /6)",0.00001,{ 871 }},
				{"M秐h Ma Ho祅g 竛 Xu蕋 H� H筺g Khuy猲 (6/6) /6)",0.00001,{ 872 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 873 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 874 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 875 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 876 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 877 }},
				{"M秐h Ma Th� S琻 H秈 Phi H錸g L� (1/6) /6)",0.00001,{ 878 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (1/6) /6)",0.00001,{ 879 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (2/6) /6)",0.00001,{ 880 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (3/6) /6)",0.00001,{ 881 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (4/6) /6)",0.00001,{ 882 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (5/6) /6)",0.00001,{ 883 }},
				{"M秐h L╪g Nh筩 V� C鵦 Huy襫 Ng鋍 B閕 (6/6) /6)",0.00001,{ 884 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (1/6) /6)",0.00001,{ 885 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (2/6) /6)",0.00001,{ 886 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (3/6) /6)",0.00001,{ 887 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (4/6) /6)",0.00001,{ 888 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (5/6) /6)",0.00001,{ 889 }},
				{"M秐h C藀 Phong Tam Thanh Ph� (6/6) /6)",0.00001,{ 890 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (1/6) /6)",0.00001,{ 891 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (2/6) /6)",0.00001,{ 892 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (3/6) /6)",0.00001,{ 893 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (4/6) /6)",0.00001,{ 894 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (5/6) /6)",0.00001,{ 895 }},
				{"M秐h L玦 Khung Thi猲 мa H� ph� (6/6) /6)",0.00001,{ 896 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (1/6) /6)",0.00001,{ 897 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (2/6) /6)",0.00001,{ 898 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (3/6) /6)",0.00001,{ 899 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (4/6) /6)",0.00001,{ 900 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (5/6) /6)",0.00001,{ 901 }},
				{"M秐h V� 秓 B綾 Minh Чo Qu竛 (6/6) /6)",0.00001,{ 902 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (1/9) /9)",0.000002,{ 540 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (2/9) /9)",0.000002,{ 541 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (3/9) /9)",0.000002,{ 542 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (4/9) /9)",0.000002,{ 543 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (5/9) /9)",0.000002,{ 544 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (6/9) /9)",0.000002,{ 545 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (7/9) /9)",0.000002,{ 546 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (8/9) /9)",0.000002,{ 547 }},
				{"M秐h trang b� B綾 Kinh chi M閚g (9/9) /9)",0.000002,{ 548 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (1/9) /9)",0.000002,{ 549 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (2/9) /9)",0.000002,{ 550 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (3/9) /9)",0.000002,{ 551 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (4/9) /9)",0.000002,{ 552 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (5/9) /9)",0.000002,{ 553 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (6/9) /9)",0.000002,{ 554 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (7/9) /9)",0.000002,{ 555 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (8/9) /9)",0.000002,{ 556 }},
				{"M秐h Ng� S綾 Ng鋍 B閕 (9/9) /9)",0.000002,{ 557 }},
				{"M秐h Nh� 觧 Chi H錸 (1/9) /9)",0.000002,{ 558 }},
				{"M秐h Nh� 觧 Chi H錸 (2/9) /9)",0.000002,{ 559 }},
				{"M秐h Nh� 觧 Chi H錸 (3/9) /9)",0.000002,{ 560 }},
				{"M秐h Nh� 觧 Chi H錸 (4/9) /9)",0.000002,{ 561 }},
				{"M秐h Nh� 觧 Chi H錸 (5/9) /9)",0.000002,{ 562 }},
				{"M秐h Nh� 觧 Chi H錸 (6/9) /9)",0.000002,{ 563 }},
				{"M秐h Nh� 觧 Chi H錸 (7/9) /9)",0.000002,{ 564 }},
				{"M秐h Nh� 觧 Chi H錸 (8/9) /9)",0.000002,{ 565 }},
				{"M秐h Nh� 觧 Chi H錸 (9/9) /9)",0.000002,{ 566 }},
				{"M秐h B玭 L玦 To祅 Long thng (1/9) /9)",0.000004,{ 567 }},
				{"M秐h B玭 L玦 To祅 Long thng (2/9) /9)",0.000004,{ 568 }},
				{"M秐h B玭 L玦 To祅 Long thng (3/9) /9)",0.000004,{ 569 }},
				{"M秐h B玭 L玦 To祅 Long thng (4/9) /9)",0.000004,{ 570 }},
				{"M秐h B玭 L玦 To祅 Long thng (5/9) /9)",0.000004,{ 571 }},
				{"M秐h B玭 L玦 To祅 Long thng (6/9) /9)",0.000004,{ 572 }},
				{"M秐h B玭 L玦 To祅 Long thng (7/9) /9)",0.000004,{ 573 }},
				{"M秐h B玭 L玦 To祅 Long thng (8/9) /9)",0.000004,{ 574 }},
				{"M秐h B玭 L玦 To祅 Long thng (9/9) /9)",0.000004,{ 575 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (1/9) /9)",0.00001,{ 576 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (2/9) /9)",0.00001,{ 577 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (3/9) /9)",0.00001,{ 578 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (4/9) /9)",0.00001,{ 579 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (5/9) /9)",0.00001,{ 580 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (6/9) /9)",0.00001,{ 581 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (7/9) /9)",0.00001,{ 582 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (8/9) /9)",0.00001,{ 583 }},
				{"M秐h Ph鬰 Ma T� Kim C玭 (9/9) /9)",0.00001,{ 584 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (1/9) /9)",0.00001,{ 585 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (2/9) /9)",0.00001,{ 586 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (3/9) /9)",0.00001,{ 587 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (4/9) /9)",0.00001,{ 588 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (5/9) /9)",0.00001,{ 589 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (6/9) /9)",0.00001,{ 590 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (7/9) /9)",0.00001,{ 591 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (8/9) /9)",0.00001,{ 592 }},
				{"M秐h T� Kh玭g Gi竛g Ma Gi韎 產o (9/9) /9)",0.00001,{ 593 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (1/9) /9)",0.000004,{ 594 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (2/9) /9)",0.000004,{ 595 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (3/9) /9)",0.000004,{ 596 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (4/9) /9)",0.000004,{ 597 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (5/9) /9)",0.000004,{ 598 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (6/9) /9)",0.000004,{ 599 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (7/9) /9)",0.000004,{ 600 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (8/9) /9)",0.000004,{ 601 }},
				{"M秐h Чi Nh穘 Th莕 Ch飝 (9/9) /9)",0.000004,{ 602 }},
				{"M秐h B玭 L玦 To祅 Long Thng (1/9) /9)",0.000004,{ 603 }},
				{"M秐h B玭 L玦 To祅 Long Thng (2/9) /9)",0.000004,{ 604 }},
				{"M秐h B玭 L玦 To祅 Long Thng (3/9) /9)",0.000004,{ 605 }},
				{"M秐h B玭 L玦 To祅 Long Thng (4/9) /9)",0.000004,{ 606 }},
				{"M秐h B玭 L玦 To祅 Long Thng (5/9) /9)",0.000004,{ 607 }},
				{"M秐h B玭 L玦 To祅 Long Thng (6/9) /9)",0.000004,{ 608 }},
				{"M秐h B玭 L玦 To祅 Long Thng (7/9) /9)",0.000004,{ 609 }},
				{"M秐h B玭 L玦 To祅 Long Thng (8/9) /9)",0.000004,{ 610 }},
				{"M秐h B玭 L玦 To祅 Long Thng (9/9) /9)",0.000004,{ 611 }},
				{"M秐h Lng Ng﹏ B秓 o (1/9) /9)",0.00001,{ 612 }},
				{"M秐h Lng Ng﹏ B秓 o (2/9) /9)",0.00001,{ 613 }},
				{"M秐h Lng Ng﹏ B秓 o (3/9) /9)",0.00001,{ 614 }},
				{"M秐h Lng Ng﹏ B秓 o (4/9) /9)",0.00001,{ 615 }},
				{"M秐h Lng Ng﹏ B秓 o (5/9) /9)",0.00001,{ 616 }},
				{"M秐h Lng Ng﹏ B秓 o (6/9) /9)",0.00001,{ 617 }},
				{"M秐h Lng Ng﹏ B秓 o (7/9) /9)",0.00001,{ 618 }},
				{"M秐h Lng Ng﹏ B秓 o (8/9) /9)",0.00001,{ 619 }},
				{"M秐h Lng Ng﹏ B秓 o (9/9) /9)",0.00001,{ 620 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (1/9) /9)",0.00001,{ 621 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (2/9) /9)",0.00001,{ 622 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (3/9) /9)",0.00001,{ 623 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (4/9) /9)",0.00001,{ 624 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (5/9) /9)",0.00001,{ 625 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (6/9) /9)",0.00001,{ 626 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (7/9) /9)",0.00001,{ 627 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (8/9) /9)",0.00001,{ 628 }},
				{"M秐h V� Gian � Thi猲 Ki誱 (9/9) /9)",0.00001,{ 629 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (1/9) /9)",0.00001,{ 630 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (2/9) /9)",0.00001,{ 631 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (3/9) /9)",0.00001,{ 632 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (4/9) /9)",0.00001,{ 633 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (5/9) /9)",0.00001,{ 634 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (6/9) /9)",0.00001,{ 635 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (7/9) /9)",0.00001,{ 636 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (8/9) /9)",0.00001,{ 637 }},
				{"M秐h T� Ho祅g Ph鬾g Ngh躠 o (9/9) /9)",0.00001,{ 638 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (1/9) /9)",0.00001,{ 639 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (2/9) /9)",0.00001,{ 640 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (3/9) /9)",0.00001,{ 641 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (4/9) /9)",0.00001,{ 642 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (5/9) /9)",0.00001,{ 643 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (6/9) /9)",0.00001,{ 644 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (7/9) /9)",0.00001,{ 645 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (8/9) /9)",0.00001,{ 646 }},
				{"M秐h B輈h H秈 Uy猲 Μng Li猲 Ho祅 產o (9/9) /9)",0.00001,{ 647 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (1/9) /9)",0.00001,{ 648 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (2/9) /9)",0.00001,{ 649 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (3/9) /9)",0.00001,{ 650 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (4/9) /9)",0.00001,{ 651 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (5/9) /9)",0.00001,{ 652 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (6/9) /9)",0.00001,{ 653 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (7/9) /9)",0.00001,{ 654 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (8/9) /9)",0.00001,{ 655 }},
				{"M秐h Minh 秓 T� S竧 чc Nh薾 (9/9) /9)",0.00001,{ 656 }},
				{"M秐h Hoa V� M筺 Thi猲 (1/9) /9)",0.00001,{ 657 }},
				{"M秐h Hoa V� M筺 Thi猲 (2/9) /9)",0.00001,{ 658 }},
				{"M秐h Hoa V� M筺 Thi猲 (3/9) /9)",0.00001,{ 659 }},
				{"M秐h Hoa V� M筺 Thi猲 (4/9) /9)",0.00001,{ 660 }},
				{"M秐h Hoa V� M筺 Thi猲 (5/9) /9)",0.00001,{ 661 }},
				{"M秐h Hoa V� M筺 Thi猲 (6/9) /9)",0.00001,{ 662 }},
				{"M秐h Hoa V� M筺 Thi猲 (7/9) /9)",0.00001,{ 663 }},
				{"M秐h Hoa V� M筺 Thi猲 (8/9) /9)",0.00001,{ 664 }},
				{"M秐h Hoa V� M筺 Thi猲 (9/9) /9)",0.00001,{ 665 }},
				{"M秐h Phi Tinh 箃 H錸 (1/9) /9)",0.00001,{ 666 }},
				{"M秐h Phi Tinh 箃 H錸 (2/9) /9)",0.00001,{ 667 }},
				{"M秐h Phi Tinh 箃 H錸 (3/9) /9)",0.00001,{ 668 }},
				{"M秐h Phi Tinh 箃 H錸 (4/9) /9)",0.00001,{ 669 }},
				{"M秐h Phi Tinh 箃 H錸 (5/9) /9)",0.00001,{ 670 }},
				{"M秐h Phi Tinh 箃 H錸 (6/9) /9)",0.00001,{ 671 }},
				{"M秐h Phi Tinh 箃 H錸 (7/9) /9)",0.00001,{ 672 }},
				{"M秐h Phi Tinh 箃 H錸 (8/9) /9)",0.00001,{ 673 }},
				{"M秐h Phi Tinh 箃 H錸 (9/9) /9)",0.00001,{ 674 }},
				{"M秐h L鬰 Ng鋍 Trng (1/9) /9)",0.00001,{ 675 }},
				{"M秐h L鬰 Ng鋍 Trng (2/9) /9)",0.00001,{ 676 }},
				{"M秐h L鬰 Ng鋍 Trng (3/9) /9)",0.00001,{ 677 }},
				{"M秐h L鬰 Ng鋍 Trng (4/9) /9)",0.00001,{ 678 }},
				{"M秐h L鬰 Ng鋍 Trng (5/9) /9)",0.00001,{ 679 }},
				{"M秐h L鬰 Ng鋍 Trng (6/9) /9)",0.00001,{ 680 }},
				{"M秐h L鬰 Ng鋍 Trng (7/9) /9)",0.00001,{ 681 }},
				{"M秐h L鬰 Ng鋍 Trng (8/9) /9)",0.00001,{ 682 }},
				{"M秐h L鬰 Ng鋍 Trng (9/9) /9)",0.00001,{ 683 }},
				{"M秐h U Minh Thng (1/9) /9)",0.00001,{ 684 }},
				{"M秐h U Minh Thng (2/9) /9)",0.00001,{ 685 }},
				{"M秐h U Minh Thng (3/9) /9)",0.00001,{ 686 }},
				{"M秐h U Minh Thng (4/9) /9)",0.00001,{ 687 }},
				{"M秐h U Minh Thng (5/9) /9)",0.00001,{ 688 }},
				{"M秐h U Minh Thng (6/9) /9)",0.00001,{ 689 }},
				{"M秐h U Minh Thng (7/9) /9)",0.00001,{ 690 }},
				{"M秐h U Minh Thng (8/9) /9)",0.00001,{ 691 }},
				{"M秐h U Minh Thng (9/9) /9)",0.00001,{ 692 }},
				{"M秐h Ch﹏ V� Ki誱 (1/9) /9)",0.000004,{ 693 }},
				{"M秐h Ch﹏ V� Ki誱 (2/9) /9)",0.000004,{ 694 }},
				{"M秐h Ch﹏ V� Ki誱 (3/9) /9)",0.000004,{ 695 }},
				{"M秐h Ch﹏ V� Ki誱 (4/9) /9)",0.000004,{ 696 }},
				{"M秐h Ch﹏ V� Ki誱 (5/9) /9)",0.000004,{ 697 }},
				{"M秐h Ch﹏ V� Ki誱 (6/9) /9)",0.000004,{ 698 }},
				{"M秐h Ch﹏ V� Ki誱 (7/9) /9)",0.000004,{ 699 }},
				{"M秐h Ch﹏ V� Ki誱 (8/9) /9)",0.000004,{ 700 }},
				{"M秐h Ch﹏ V� Ki誱 (9/9) /9)",0.000004,{ 701 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (1/9) /9)",0.00001,{ 702 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (2/9) /9)",0.00001,{ 703 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (3/9) /9)",0.00001,{ 704 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (4/9) /9)",0.00001,{ 705 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (5/9) /9)",0.00001,{ 706 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (6/9) /9)",0.00001,{ 707 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (7/9) /9)",0.00001,{ 708 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (8/9) /9)",0.00001,{ 709 }},
				{"M秐h Thi猲 Ni猲 H祅 Thi誸 (9/9) /9)",0.00001,{ 710 }},
	}