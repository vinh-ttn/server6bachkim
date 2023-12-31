-- FILE_LEVEL = "\\settings\\npc\\player\\level_exp.txt"
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

TV_LAST_APPLY_TIME = 1571 -- 上次申请传功时间
TV_CHUANGONG_TIMES = 1572 -- 已传功的次数
TV_CHUANGONG_EAT = 1573 --使用传功丹的次数

IncludeLib("FILESYS")
IncludeLib("LEAGUE")
IncludeLib("SETTING")
tabLevelRate = 
{
{100,119,95},--100至120级，传功经验为95%
{120,149,90},
{150,160,80},
}


function GetDesc(nItem)
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nP3 = GetItemParam(nItem,3);
	local nP4 = GetItemParam(nItem,4);
	local nRestExp = nP4
	nRestExp = SetByte(nRestExp, 3, GetByte(nP3,1))
	nRestExp = SetByte(nRestExp, 4, GetByte(nP3,2))
	nLevelFullExp = tl_getUpLevelExp(nEndLevel+ 1)
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp) )
	local str = "Ъng c蕄 Ti猲 n:"..fPerc.."\n Зy l� m閠 v� cao th� c蕄 <color=yellow>"..nEndLevel.." <color> v韎 to祅 b� v� c玭g m譶h h鉧 th﹏ th祅h ti猲 dc, nh鱪g ngi di c蕄 10 sau khi d飊g s� t╪g nhi襲 甶觤 kinh nghi謒! ";
	return str ..client_main(nEndLevel, nRestExp)
end

function main(nItem)
	if (gb_GetModule("Truy襫 c玭g") ~= 1) then
		Say("Xin l鏸! Ch鴆 n╪g truy襫 c玭g  ng l筰, th阨 gian m� l筰 xem trang ch�  bi誸 th猰 th玭g tin!", 0)
		return 1
	end
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("Sau khi h鋍 <B綾 u Trng Sinh Thu藅 - T﹎ Ph竝 Thi猲> th� kh玭g th� s� d鬾g Nguy猲 Th莕 Кn.", 0);
		return 1
	end;
	local nEndLevel = GetItemParam(nItem, 1);
	local nP2 = GetItemParam(nItem,2);
	local nNameId = GetItemParam(nItem,5)
	if (GetLevel() > 10 or GetLastFactionNumber() ~= -1) then
		Say("Xin l鏸! B筺  vt qu� c蕄 10 ho芻  gia nh藀 m玭 ph竔 kh玭g th� s� d鬾g Nguy猲 Th莕 n!",0) 
		return 1
	elseif (LG_GetLeagueObjByRole(1,GetName())  ~= 0) then
		Say("Xin l鏸! Ngi ch琲 c� quan h� s�  kh玭g th� s� d鬾g Nguy猲 Th莕 n!",0)
		return 1
	end
	local nowday = tonumber(date("%y%m%d"))
	WriteLog(" [Truy襫 c玭g]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." S� d鬾g th祅h c玭g Nguy猲 Th莕 n! Item: Level:"..nEndLevel.." Exp:"..nP2.." ItemParam5:"..nNameId)
	server_main(nEndLevel, nP2)
end
--Itemparam1 源玩家降级前的等级
--ItemParam2 源玩家降级前的经验
--ItemParam3 源玩家降级前的剩于经验高Word
--ItemParam4 源玩家降级前的剩于经验低Word

function client_main(nEndLevel, nRestExp)
	if (nEndLevel < 80 or nEndLevel > 200) then
		return 
	end
	if (nRestExp < 0) then
		nRestExp = 0
	end
	
	local str = ""
	local testlevel = 10;
	local testexp = 0;
	if (GetLevel() <= 10) then
		testlevel = GetLevel();
		testexp = GetExp();
		level, restexp = exp_clt_levelup(nEndLevel, GetLevel(), GetExp(), nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --本等级升级需要的经验最大值
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow>Sau khi s� d鬾g c� th� th╪g"..level.."c蕄 v� d� "..nPerc.."%甶觤 kinh nghi謒<color>";
	else
		level, restexp = exp_clt_levelup(nEndLevel, 10, 0, nRestExp)
		local fullexp = tl_getUpLevelExp(level+1) --本等级升级需要的经验最大值
		local nPerc = floor((restexp/fullexp)*100)
		str = "\n<color=yellow> Nh﹏ v藅 c蕄 10 c� th� th╪g n"..level.."c蕄 v� d� "..nPerc.."%甶觤 kinh nghi謒<color> ";
	end
	return str
end

function gw_item(level,restexp)
	
	nIt = AddItem(6,1,12,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	print(m,n)
	SyncItem(nIt)
end

function server_main(level,exp)
	exp_svr_levelup(level,exp)
end

function exp_getRate(endlevel)
	local nRate = 0
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1] and endlevel <= tabLevelRate[j][2] ) then
			nRate = tabLevelRate[j][3]
			return nRate
		end
	end
	return nRate
end

function exp_clt_levelup(endlevel, nowlevel, nowrestexp, restexp)
	if (endlevel > 200) then
		return
	end
	
	local lExp = 0;
	local nRate = exp_getRate(endlevel)
	
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1) * nRate / 100)
				nowlevel, nowrestexp = exp_addexp(nowrestexp, lExp, nowlevel)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	nowlevel, nowrestexp = exp_addexp(nowrestexp, restexp * nRate / 100, nowlevel)		
	return nowlevel, nowrestexp
end

function exp_svr_levelup(endlevel, restexp)
	if (endlevel > 200) then
		return
	end

	local lExp = 0;
	
	local nRate = exp_getRate(endlevel)
	if (nRate == 0) then
		return
	end
	-- LLG_ALLINONE_TODO_20070802
	local nleveladd = 80
	for j = 1, getn(tabLevelRate) do 
		if (endlevel >= tabLevelRate[j][1]) then
			nRate = tabLevelRate[j][3]
			local nlevelend = tabLevelRate[j][2]
			
			if ( tabLevelRate[j][2] >= (endlevel - 1) ) then
				nlevelend = endlevel - 1
			else
				nlevelend = tabLevelRate[j][2]
			end
			
			for i = nleveladd, nlevelend  do 
				--print("-----:add level:["..i.."->"..(i+1).."] exp:"..tonumber(GetTabFileData(FILE_LEVEL, i + 1, 2)).." nRate:"..nRate)
				lExp = floor(tl_getUpLevelExp(i + 1, 2)* nRate / 100)
				nowlevel, nowrestexp = exp_svr_addexp(lExp)	
			end
			nleveladd = nlevelend + 1
		else
			break
		end
	end
	
	exp_svr_addexp(restexp * nRate / 100)
	
	return nowlevel, nowrestexp
end

function exp_addexp(curexp, n_exp, curlel)--当前准备升级的玩家的经验、需要增加的经验、当前的等级;返回值为升到的等级、不够升下一级所剩的经验
	--print("addexp "..curexp..":"..n_exp)
	
	while( n_exp > 0 ) do
		local fullexp = tl_getUpLevelExp(curlel+1) --本等级升级需要的经验最大值
		
		local needexp = fullexp - curexp --实际需要的经验值
	--	print(curexp .."/"..fullexp..":+"..n_exp)
		
		if (needexp <= n_exp) then --如果足够升本级
			curlel= curlel + 1           --升级
			n_exp = n_exp - needexp	    --计算还剩多少经验
			curexp = 0
	--		print("levelup:"..curlel)
		else
		   	return curlel , curexp + n_exp
		end
	end

	return curlel , curexp + n_exp 
	
end

function exp_svr_addexp(n_exp)
	tl_addPlayerExp(n_exp)
end



---------------------------------------------------------------------------------------
function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end


