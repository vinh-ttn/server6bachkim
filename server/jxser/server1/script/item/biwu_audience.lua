--Include("\\script\\missions\\finalmatch\\wl_watchmatch.lua")
--Include("\\script\\missions\\finalmatch\\head.lua")
--GetExtPoint(1) == date(%y%m%d)	--050704
--PayExtPoint(extpoint, count);
GUANFANGRENYUAN = 5555
ZHANDIJIZHE = 4444
function main( nItemIdx )
SetLogoutRV(1);		--断线与死亡为一个重生点
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ngi l蕐 quan ch髇g l謓h c馻 ngi kh竎 s� d鬾g? ", 0)
		return
	end
	
	local matchtype = GetGlbValue( GLB_CURMATCHTYPE )
	local matchphase = GetGlbValue( GLB_MATCHPHASE )
	if ( matchtype == 0 ) then
		Say("Hi謓 t筰 ch璦 thi u, mu鑞 quan s竧 c莕 ph秈 i n l骳 b総 u thi u. Mu鑞 t譵 hi觰 c竎h s� d鬾g quan ch髇g l謓h kh玭g?", 3, "S� d鬾g quan ch髇g l謓h nh� th� n祇/#wl_onaudiencehelp(1)", "T譵 hi觰 th阨 gian s� d鬾g quan ch髇g l謓h/wl_getdeadline", "K誸 th骳 i tho筰/OnCancel")
		return 1
	end

	local messages = {
		"V祇 n琲 xem u/#want2audience("..matchtype..")",
		"Ch� nh t猲 nh﹏ v藅/watch_role",
		"Ch� nh t猲 i thi u/watch_league",
		"Theo s� ph﹏ chia khu v鵦 t譵 hi觰 i thi u/watch_zone",
		"S� d鬾g quan ch髇g l謓h nh� th� n祇/#wl_onaudiencehelp(1)",
		"T譵 hi觰 th阨 gian s� d鬾g quan ch髇g l謓h/wl_getdeadline",
		"Kh玭g l祄 g� h誸/OnCancel"
	};
	local curmapid = SubWorldIdx2ID( SubWorld )
	local flag = wl_mapid2watchnum( curmapid )
	if ( flag ) then
		tinsert( messages, 1, "T譵 hi觰 ng蓇 nhi猲 tuy觧 th� 產ng thi u/watch_rand_currently" )
	end
	Say("B筺 c� th� c╪ c� v祇 phng ph竝 sau  t譵 hi觰 thi u ng th阨 ti課 h祅h quan s竧.", getn( messages ), messages )
	return 1
end

-- 观看某个角色比赛
function watch_role()
	-- 判断是否已经在观战模式
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_role", "", 1, 20, "Xin nh藀 t猲 nh﹏ v藅 ngi ch琲 v祇");
	end
end


function wl_sure2watch_role(rolename,position,matchtype)
oldSubWorld = SubWorld
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	
	local bpassed = 0
	bpassed = wl_findroleinmatchmap( rolename,tab_matchmap )
	if ( bpassed == 0 ) then
		Say("B筺 t譵 hi觰 t猲 tuy觧 th� nh﹏ v藅 l� '"..rolename.."', hi謓 t筰 kh玭g c� trong u trng thi u, xin ch鋘 c竎 tuy觧 th� kh竎 xem thi u.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_league()
	-- 判断是否已经在观战模式
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_league", "", 1, 20, "Xin nh藀 t猲 i thi u");
	end
end

function wl_sure2watch_lgname(leaguename,position,leaguetype)
oldSubWorld = SubWorld
	local matchtype = leaguetype - 10
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	local lid = LG_GetLeagueObj( leaguetype, leaguename )
	local lgcount = LG_GetMemberCount(lid)
	local lgmem = {}
	local rolename = ""
	local bpassed = 0
	for i = 0, lgcount - 1 do
		lgmem[ getn(lgmem)+1 ] = LG_GetMemberInfo( lid, i )
	end
	for i = 1, getn( lgmem ) do
		bpassed = wl_findroleinmatchmap( lgmem[i],tab_matchmap )
		if ( bpassed == 1 ) then
			rolename = lgmem[i]
			break
		end
	end
	if ( bpassed == 0 ) then
		Say("B筺 t譵 hi觰 t猲 i thi u l� '"..leaguename.."', hi謓 t筰 kh玭g c� trong u trng thi u, kh玭g th� quan s竧 i thi u , xin ch鋘 i thi u kh竎 quan s竧.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_zone()
	local opp = {}
	opp = get_zone(0)
	Say("B筺 mu鑞 t譵 hi觰 khu v鵦 n祇 c� i thi u h玬 nay?", getn(opp), opp)
end

function wl_sure2go_seat(rolesignmap, name, flag)
	local str = ""
	local position = wl_getwatchmap( rolesignmap )
	if( not position ) then
		print("the signmap of role who the play want to watch is not exist!!!!mapid =="..rolesignmap)
		return
	end
	local num = random(1, 2)
	local watchmap = WL_TABWATCHMAPS[position][num]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	if ( flag == 1 ) then
		str = "B筺 v鮝 t譵 hi觰 t猲 i thi u l� "..name..", xin h穣 s� d鬾g quan ch髇g l謓h ho芻 qua b猲 Quan vi猲 t譵 hi觰 l筰."
	else
		str = "B筺 v鮝 t譵 hi觰 t猲 tuy觧 th� l� "..name..", xin h穣 s� d鬾g quan ch髇g l謓h ho芻 qua b猲 Quan vi猲 t譵 hi觰 l筰."
	end
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player(str)
	Say(str, 0)
end

function wl_mapideqmapid( mapid1, mapid2 )
	local flag = 0
	for i = 1, getn( WL_TABWATCHMAPS ) do
		for j = 1, getn( WL_TABWATCHMAPS[i] ) do
			if ( WL_TABWATCHMAPS[i][j] == mapid1 ) then
				flag = i
				break
			end
		end
	end
	if ( flag == 0 ) then
		return
	end
	for i = 1, getn( WL_TABWATCHMAPS[ flag ] ) do
		if( WL_TABWATCHMAPS[ flag ][ i ] == mapid2 ) then
			return i
		end
	end
	return nil
end


OnAudience = {
"C� th� s� d鬾g 4 h譶h th鴆 sau  t譵 hi觰 thi u ng th阨 quan s竧: 1, ch� nh t猲 nh﹏ v藅; 2, ch� nh t猲 i thi u; 3, c╪ c� theo s� ph﹏ chia khu v鵦 t譵 hi觰 i thi u; 4, t譵 hi觰 ng蓇 nhi猲 v� tuy觧 th� 產ng thi u. T譵 hi觰 nh﹏ v藅 ho芻 i thi u c莕 ph秈 l� i thi u ng祔 h玬  ng th阨 i thi u  產ng ti課 h祅h thi u.",
"Trong vai tr� kh竛 gi�, n誹 ta 頲 ph衟 t譵 hi觰 nh﹏ v藅 ho芻 頲 ph衟 quan s竧 i thi u, c� ngh躠 l� t猲 nh﹏ v藅 ho芻 i thi u 產ng ti課 h祅h thi u. Khi nh﹏ v藅 thi u r阨 m筺g ho芻 t� vong th� l藀 t鴆 k誸 th骳",
"Trong m� th鴆 quan s竧, n誹 ta mu鑞 quan s竧 nh﹏ v藅 ho芻 i thi u kh玭g c� tr猲 b秐  hi謓 t筰, h� th鑞g s� a b筺 n n琲 quan s竧 tng 鴑g, sau  ngi ch琲 t譵 hi觰 l筰 t猲 nh﹏ v藅 ho芻 i thi u",
}
function wl_onaudiencehelp(count)
	if ( count >= getn( OnAudience ) ) then
		Say(OnAudience[getn( OnAudience )], 1, "сng/OnCancel")
	else
		local ncount = count + 1
		Say(OnAudience[count], 2, "Trang k� /#wl_onaudiencehelp("..ncount..")", "сng/OnCancel")
	end
end


function wl_getdeadline()
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ngi l蕐 quan ch髇g l謓h c馻 ngi kh竎 s� d鬾g? ", 0)
		return 1
	end

	Say("Trong th阨 gian di詎 ra i h閕 v� l﹎ kh竛 gi� c� th� v祇 h� th鑞g v� l﹎ i h閕, s� kh玭g b� h筺 ch� v� th阨 gian s� d鬾g quan ch髇g l謓h.", 0)
end
function want2audience( matchtype )
	if ( matchtype == 9999 ) then
		Say("Bu鎖 thi u h玬 nay l� n u m玭 ph竔, u trng v� m玭 ph竔 thi u tng 鴑g:", 6, "u trng 1 (Thi誹 L﹎, Thi猲 Vng) /#want2watchseat(1)", "u trng 2 (Л阯g M玭, Ng� чc) /#want2watchseat(2)","u trng 3 (Th髖 Y猲, Nga My) /#want2watchseat(3)","u trng 4 (C竔 Bang, Thi猲 Nh蒼) /#want2watchseat(4)","u trng 5 (V� ng, C玭 L玭) /#want2watchseat(5)", "Kh玭g c莕 u/OnCancel")
	elseif( matchtype == 11 ) then
		Say("Bu鎖 thi u h玬 nay l� song u, sau y m� ra 3 u trng, b筺 mu鑞 甶:", 4, "u trng 1/#want2watchseat(1)", "u trng 2/#want2watchseat(2)","u trng 3/#want2watchseat(3)", "Kh玭g c莕 u/OnCancel")
	elseif( matchtype == 12 ) then
		Say("Bu鎖 thi u h玬 nay l� Ng� h祅h u, sau y m� ra 6 u trng, b筺 mu鑞 甶:", 7, "u trng 1/#want2watchseat(1)", "u trng 2/#want2watchseat(2)","u trng 3/#want2watchseat(3)","u trng 4 /#want2watchseat(4)","u trng 5/#want2watchseat(5)", "u trng 6/#want2watchseat(6)","Kh玭g c莕 u/OnCancel")
	elseif( matchtype == 13 or matchtype == 14 ) then
		Say("Bu鎖 thi u h玬 nay l� thi u i nh鉳, sau y m� ra 4 u trng, b筺 mu鑞 甶:", 5, "u trng 1/#want2watchseat(1)", "u trng 2/#want2watchseat(2)","u trng 4 /#want2watchseat(4)","u trng 5/#want2watchseat(5)","Kh玭g c莕 u/OnCancel")
	elseif( matchtype == 15 ) then
		Say("Bu鎖 thi u h玬 n祔 l� u khu v鵦, sau y m� ra 6 u trng, b筺 mu鑞 甶:", 7, "u trng 1/#want2watchseat(1)", "u trng 2/#want2watchseat(2)","u trng 3/#want2watchseat(3)","u trng 4 /#want2watchseat(4)","u trng 5/#want2watchseat(5)", "u trng 6/#want2watchseat(6)","Kh玭g c莕 u/OnCancel")
	else
		Say("u trng hi謓 產ng s鯽 ch鱝, xin i gi﹜ l竧 quay l筰 sau.", 0)
	end
end
function want2watchseat(position)
	local watchmap = WL_TABWATCHMAPS[position][1]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player("B筺  n u trng, xin h穣 s� d鬾g quan ch髇g l謓h ho芻 qua b猲 Quan vi猲 u trng t譵 hi觰 thi u")
end