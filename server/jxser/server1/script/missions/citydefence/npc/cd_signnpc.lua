----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	周末活动：卫国战争之烽火连城
--			功能：报名点报名官
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
CD_SIGNNPCNAME = "Tng qu﹏ th� th祅h"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "Phe T鑞g"
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "Phe Kim"
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."Tng qu﹏ th� th祅h"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": Ti觰 qu� t� u n? Kh玭g mu鑞 s鑞g �? Ъng c蕄 c遪 ch璦 !"..CD_LEVEL_LIMIT.."c蕄, ch箉 n ti襫 tuy課, ngi tng y l� u? ng c� m� 甶 lung tung, n誹 kh玭g ngi c� ch誸 c騨g kh玭g bi誸 t筰 sao!")
		Msg2Plalyer("Ъng c蕄 l韓 h琻"..CD_LEVEL_LIMIT.."c蕄 m韎 c� th� tham gia chi課 tranh v� qu鑓.")
		return
	end
	local oldSubWorld = SubWorld
	signmap = SubWorldIdx2ID( SubWorld )
	defencemap = signmap - 2
	defencesidx = SubWorldID2Idx( defencemap )
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": Chi課 trng ph輆 trc x秠 ra v蕁 , t筸 th阨 kh玭g th� v祇.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":Kh玭g c� g� b萴 c竜 ng n qu蕐 r莥 ta!", 0)
		Msg2Player("V� qu鑓 Phong H醓 li猲 th祅h"..cityname.."Ho箃 ng th� th祅h v蒼 ch璦 b総 u.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	SubWorld = oldSubWorld
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": Ngi l� ai?", CD_SIGNNPCNAME..": �! Ngi mu鑞 gi髉 ta ch鑞g l筰 k� ch? Ngi qu� l� y猽 nc! Binh l鵦 qu﹏ ta r蕋 y , ngi c� l遪g l� t鑤, nh璶g xin ngi h穣 v� 甶!")
		Msg2Player("Hi謓 nay s� ngi tham gia chi課 tranh v� qu鑓 li猲 th祅h  y"..MAX_MEMBERCOUNT.."ngi, kh玭g th� v祇 chi課 trng.")
		return
	end
	
	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--不允许报名
		Say(CD_SIGNNPCNAME..": Ho箃 ng chi課 tranh v� qu鑓 li猲 th祅h 1 ng祔 ch� c� th� tham gia 1 tr薾, l莕 sau h穣 quay l筰!", 0)
	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--允许报名
		Say(CD_SIGNNPCNAME..": L� Nh�! T猲 ti觰 t� nh� ngi mau 甶 k猽 T輓 S� l筰 y, qu﹏ ch l筰 nh n r錳! �? Ngi l� ai? B﹜ gi� l� l骳 n祇? C� ngi 產ng t蕁 c玭g th祅h c馻 ta, ngi c遪 k衞 d礽 qu﹏ c� s� b� ch衜 u bi誸 kh玭g?", 2, "Tng qu﹏! Ta n gi髉 th� th祅h!/want2joincd1", "厖 (B筺 kh玭g n鉯 l阨 g�, ch� ci nh箃 m閠 ti課g r錳 甶 ) /laughtoleave")
	else
		Say(CD_SIGNNPCNAME..": �? Ch糿g ph秈 ngi  v祇 chi課 trng sao? Hay l� ta bi hoa m総? enter> Th玦 頲 r錳! Ngi ch萿n b� v祇 trong  甶!", 2, "Ta mu鑞 gia nh藀/sure2joincd", "Ta ch� gh� qua xem/OnCancel")
	end
end

function sure2joincd()
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": Chi課 trng ph輆 trc x秠 ra v蕁 , t筸 th阨 kh玭g th� v祇.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	SetTask( TASKID_FIRE_DAY, tonumber(date("%m%d")) )
	SetTask( TASKID_FIRE_KEY, GetMissionV( MS_RANDKEY ) )
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1()
	Say(CD_SIGNNPCNAME..": �! Ngi mu鑞 gi髉 ch髇g ta ch鑞g l筰 k� ch? 竔 ch�! M蕐 t猲 n祔 kh玭g gi鑞g binh s� t莔 thng, b鋘 ch髇g v� ngh� cao cng, ci ng鵤 r蕋 t礽, l筰 c遪 bi誸 ph鉵g 竚 kh�.", 1, "Tng qu﹏! g kh玭g sao ch�?/want2joincd2")
end

function want2joincd2()
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": Л頲 r錳! Kh玭g c莕 n鉯 nhi襲, n鉯 chung ta c秏 th蕐 lai l辌h c馻 b鋘 h� r蕋 kh� nghi, trong l骳 chi課 u n誹 ngi nh苩 頲 th� h祄 th� h穣 甧m n ta xem, ta s� tr鋘g thng! S� ngi tham gia th� th祅h l�<color=yellow>"..cd_membercount.."<color>ngi. B筺  s絥 s祅g v祇 chi課 trng ch璦?", 2, "ng v藋!/sure2joincd", "в ta chu萵 b� !/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME..": (S� n to竧 m� h玦 tr竛")
end

function OnCancel()
end