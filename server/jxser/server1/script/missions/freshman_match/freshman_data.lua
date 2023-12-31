LEVELTOP10 = "\\data\\bestlevel.dat"
MISSIONID_OUTER = 18
MISSIONID_INNER = 19

FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

TITLETIME = 30 * 24 * 60 * 60 * 18

TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TRYOUT_TIMER_2 = 3 * 60 * 60 * FRAME2TIME; --为4小时
TIMERID_SMALL_OUTER = 33
TIMERID_TOTAL_OUTER = 34


MATCH_TIMER_1 = 10 * FRAME2TIME; --5秒公布一下战况
MATCH_TIMER_2 = 15 * 60 * FRAME2TIME; --为10分钟
TIMERID_SMALL_INNER = 35
TIMERID_TOTAL_INNER = 36


CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

FactionData = {
			{	"\\data\\shaolin_fresh.dat", "ShaoLin_Top5", "Thi誹 L﹎"	},
			{	"\\data\\tianwang_fresh.dat", "TianWang_Top5", "Thi猲 Vng"	},
			{	"\\data\\tangmen_fresh.dat", "TangMen_Top5", "Л阯g M玭"	},
			{	"\\data\\wudu_fresh.dat", "Wudu_Top5", "Ng� чc"	},
			{	"\\data\\emei_fresh.dat", "EMei_Top5", "Nga Mi"	},
			{	"\\data\\cuiyan_fresh.dat", "CuiYan_Top5", "Th髖 Y猲"	},
			{	"\\data\\gaibang_fresh.dat", "GaiBang_Top5", "C竔 Bang"	},
			{	"\\data\\tianren_fresh.dat", "TianRen_Top5", "Thi猲 Nh蒼"	},
			{	"\\data\\wudang_fresh.dat", "WuDang_Top5", "V� ng"	},
			{	"\\data\\kunlun_fresh.dat", "KunLun_Top5", "C玭 L玭"	}
		  }

FactionTitle = {
				"Thi誹 L﹎ ki謙 xu蕋",
				"Thi猲 Vng ki謙 xu蕋",
				"Л阯g M玭  ki謙 xu蕋",
				"Ng� чc ki謙 xu蕋",
				"Nga Mi  ki謙 xu蕋",
				"Th髖 Y猲 ki謙 xu蕋",
				"C竔 Bang ki謙 xu蕋",
				"Thi猲 Nh蒼  ki謙 xu蕋",
				"V� ng  ki謙 xu蕋",
				"C玭 L玭  ki謙 xu蕋"
				}
				
CP_MAPTAB = {
				{	396, 397, "Thi誹 L﹎"	},
				{	398, 399, "Thi猲 Vng"	},
				{	400, 401, "Л阯g M玭"	},
			 	{	402, 403, "Ng� чc"	},
			 	{	404, 405, "Nga Mi"	},
			 	{	406, 407, "Th髖 Y猲"	},
			 	{	408, 409, "C竔 Bang"	},
			 	{	410, 411, "Thi猲 Nh蒼"	},
			 	{	412, 413, "V� ng"	},
			 	{	414, 415, "C玭 L玭"	}
			 }

CP_TASKID_REGIST = 1095		--1：报过名；9：取消了预选赛资格
CP_TASKID_POINT = 1096		--记录预选赛得分
CP_TASKID_TITLE = 1097		--9：记录已取得决赛圈资格
CP_TASKID_BID = 1098		--
CP_TASKID_ENEMY = 1099		--预赛时对手的阵营号
CP_TASKID_ROUND = 1100		--参赛的次数
CP_TASKID_WIN = 1101		--赢的次数
CP_TASKID_LOSE = 1102		--输的次数；掉线判输，但无法记录
CP_TASKID_TIE = 1103		--平局的次数
CP_TASKID_FLAG = 1104		--正常退出赛场的标记，在下一入场时刷新
CP_TASKID_BACKCONT = 1105	--对于参与投标的玩家根据投标总金额，判断能取几次
CP_TASKID_LOGOUT = 1094		--为 0 时表明正常退出，为 1 时表示非正常退出（如当机、未保存数据、服务器原因）
CP_CASH = 100000
CP_MAXROUND = 40
CP_PLNUM_LIMT = 4
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}

CP_AWARD_ITEM = {
					{"T� Th駓 Tinh", {4, 239}, 2},
					{"Lam Th駓 Tinh", {4, 238}, 2},
					{"L鬰 Th駓 Tinh", {4, 240}, 2},
					{"Tinh H錸g B秓 Th筩h", {4, 353}, 2},
					{"Huy襫 Tinh Kho竛g Th筩h c蕄 4", {6, 1, 147, 4, 0, 0}, 200},
					{"Huy襫 Tinh Kho竛g Th筩h c蕄 5", {6, 1, 147, 5, 0, 0}, 50},
					{"Huy襫 Tinh Kho竛g Th筩h c蕄 6", {6, 1, 147, 6, 0, 0}, 1},
					{"Чi Ph骳 Duy猲 L� ", {6, 1, 124, 1, 0, 0}, 50},
					{"Trung  Ph骳 Duy猲 L� ", {6, 1, 123, 1, 0, 0}, 100},
					{"Ti觰 Ph骳 Duy猲 L� ", {6, 1, 122, 1, 0, 0}, 200},
					{"Ti猲 Th秓 L� ", {6, 1, 71, 1, 0, 0}, 1500},
					{"Thi猲 s琻  B秓 L� ", {6, 1, 72, 1, 0, 0}, 1991},
					{"Чi B筩h C﹗ ho祅", {6, 1, 130, 1, 0, 0}, 100},
					{"Hoa h錸g", {6, 0, 20, 1, 0, 0}, 2000},
					{"T﹎ T﹎ Tng 竛h ph� ", {6, 1, 18, 1, 0, 0}, 2000},
					{"L謓h b礽 Phong L╪g ч", {4, 489}, 100},
					{"Ph竜 Hoa", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"C玭g T鑓 ho祅", {6, 1, 218, 1, 0, 0}, 511	},
					{	"B祇 T鑓 ho祅", {6, 1, 219, 1, 0, 0}, 512	},
					{	"Ph� Ph遪g ho祅", {6, 1, 220, 1, 0, 0}, 513	},
					{	"чc Ph遪g ho祅", {6, 1, 221, 1, 0, 0}, 514	},
					{	"B╪g Ph遪g ho祅", {6, 1, 222, 1, 0, 0}, 515	},
					{	"H醓 Ph遪g ho祅", {6, 1, 223, 1, 0, 0}, 516	},
					{	"L玦 Ph遪g ho祅", {6, 1, 224, 1, 0, 0}, 517	},
					{	"Gi秏 Thng ho祅", {6, 1, 225, 1, 0, 0}, 518	},
					{	"Gi秏 H玭 ho祅", {6, 1, 226, 1, 0, 0}, 519	},
					{	"Gi秏 чc ho祅", {6, 1, 227, 1, 0, 0}, 520	},
					{	"Gi秏 B╪g ho祅", {6, 1, 228, 1, 0, 0}, 521	},
					{	"Ph� C玭g ho祅", {6, 1, 229, 1, 0, 0}, 522	},
					{	"чc C玭g ho祅", {6, 1, 230, 1, 0, 0}, 523	},
					{	"B╪g C玭g ho祅", {6, 1, 231, 1, 0, 0}, 524	},
					{	"H醓 C玭g ho祅", {6, 1, 232, 1, 0, 0}, 525	},
					{	"L玦 C玭g ho祅", {6, 1, 233, 1, 0, 0}, 526	},
					{	"Trng M謓h ho祅", {6, 1, 234, 1, 0, 0}, 527	},
					{	"Trng N閕 ho祅", {6, 1, 235, 1, 0, 0}, 528	},
					{	"Y猲 H錸g 產n", {6, 1, 115, 1, 0, 0}, 450	},
					{	"X� Lam 產n", {6, 1, 116, 1, 0, 0}, 451	},
					{	"N閕 Ph� ho祅", {6, 1, 117, 1, 0, 0}, 453	},
					{	"N閕 чc ho祅", {6, 1, 118, 1, 0, 0}, 454	},
					{	"N閕 B╪g ho祅", {6, 1, 119, 1, 0, 0}, 455	},
					{	"N閕 H醓 ho祅", {6, 1, 120, 1, 0, 0}, 456	},
					{	"N閕 L玦 ho祅", {6, 1, 121, 1, 0, 0}, 457	},
					{	"Trng M謓h ho祅", {6, 0, 1, 1, 0, 0}, 256	},
					{	"Gia B祇 ho祅", {6, 0, 2, 1, 0, 0}, 257	},
					{	"Чi L鵦 ho祅", {6, 0, 3, 1, 0, 0}, 258	},
					{	"Cao Thi觤 ho祅", {6, 0, 4, 1, 0, 0}, 259	},
					{	"Cao Trung ho祅", {6, 0, 5, 1, 0, 0}, 260	},
					{	"Phi T鑓 ho祅", {6, 0, 6, 1, 0, 0}, 261	},
					{	"B╪g Ph遪g ho祅", {6, 0, 7, 1, 0, 0}, 262	},
					{	"L玦 Ph遪g ho祅", {6, 0, 8, 1, 0, 0}, 263	},
					{	"H醓 Ph遪g ho祅", {6, 0, 9, 1, 0, 0}, 264	},
					{	"чc Ph遪g ho祅", {6, 0, 10, 1, 0, 0}, 265	},
					{	"B竛h ch璶g H箃 d� ", {6, 0, 60, 1, 0, 0}, 401	},
					{	"B竛h ch璶g Th辴 heo", {6, 0, 61, 1, 0, 0}, 402	},
					{	"B竛h ch璶g Th辴 b� ", {6, 0, 62, 1, 0, 0}, 403	},
					{	"B竎h Qu� L� ", {6, 1, 73, 1, 0, 0}, 442	},
					{	"C竧 tng h錸g bao", {6, 1, 19, 1, 0, 0}, 442	},
					{"Ho祅g Kim B秓 rng",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\freshman_match\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\freshman_match\\trap\\trap_placetolinan.lua"


CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023