Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")

TV_LAST_APPLY_TIME = 1571 -- 上次申请传功时间
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>чc C� Ki誱:<link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then 
			Describe(strimg.."Ngi trc m総 <color=yellow>truy襫 c玭g  chu萵 b�<color>, t飝 th阨 c� th� t韎 ta ch� truy襫 c玭g !", 2,
			"V﹏g, ta bi誸, n l骳  ta s� t韎 b竔. /cg_OnCancel",
			"Kh玭g, minh ch�, ta kh玭g mu鑞 truy襫 c玭g li評, ta mu鑞 h駓 b� truy襫 c玭g th﹏ th豱h !/cg_undo"); 
		else 
			Describe(strimg.."Ngi trc m総 <color=yellow>  truy襫 c玭g , "..(num2datestr(applytime)).." <color> sau l� 頲 truy襫 c玭g !", 2,
			"C竚 琻 minh ch� nh綾 nh�, v穘 b鑙 � ch� n祔 c竚 琻 !/cg_OnCancel",
			"Kh玭g , minh ch�, ta kh玭g mu鑞 truy襫 c玭g, ta mu鑞 h駓 b� truy襫 c玭g!/cg_undo"); 
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then 
			Msg2Player("Ngi trc m総 <color=yellow>  truy襫 c玭g  chu萵 b� ho祅 th祅h <color>, t飝 th阨 c� th� n c c� ki誱 ch� ch輓h th鴆 truy襫 c玭g ! truy襫 c玭g c莕 t鑞 hao 2 t蕀 ng﹏ phi誹, xin m阨 c騨g n鉯 trc chu萵 b� xong.") 
		else 
			Msg2Player("Ngi trc m総 <color=yellow>  truy襫 c玭g , truy襫 c玭g th阨 gian � "..(num2datestr(applytime)).."<color>Sau, truy襫 c玭g c莕 t鑞 hao 2 t蕀 ng﹏ phi誹 , xin m阨 c騨g n鉯 trc chu萵 b� xong.") 
		end
	end
end

function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
return "N╩ "..year.." th竛g "..month.." ng祔 "..day; end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then 
		Describe(strimg.."Ta n "..num2datestr(nowday).." li襫 c� th� chu萵 b� xong gi髉 ngi truy襫 c玭g, ngi th藅 kh玭g mu鑞 truy襫 sao ? ",2,
		"ng v藋, ta kh玭g mu鑞 truy襫 c玭g!/cg_undo_sure",
		"Kh玭g, ta c遪 l� mu鑞 truy襫, m韎 v鮝 r錳 nh蕋 th阨 kh萵 trng n鉯 sai r錳 m� th玦. /cg_OnCancel") 
	else 
		Describe(strimg.."Ngi kh玭g c�  n鉯 v韎 ta mu鑞 truy襫 c玭g a. Ch璦 n鉯 qua nh� th� n祇 h駓 b� y ? ",1,"K誸 th骳 i tho筰 /cg_OnCancel") 
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."Л頲 r錳, v藋 nh鱪g nguy猲 li謚 n祔 ta thulaij, n誹 nh� l莕 sau mu鑞 truy謓 l阨 c馻 n鱝 chu萵 b� 甶 !",1,"K誸 th骳 i tho筰/cg_OnCancel")
end

function cg_OnCancel()
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
