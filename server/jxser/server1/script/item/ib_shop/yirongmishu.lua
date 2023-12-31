-- 文件名　：yirongmishu.lua
-- 创建者　：wangjingjun
-- 内容　　：易容秘术 包含多个面具的礼包类物品
-- 创建时间：2011-07-11 09:36:28

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbMask = 
{
	{szName = "M苩 n� - B筩h Doanh Doanh", tbProp = {0,11,496,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - B筩h th祅h qu薾 ch�", tbProp = {0,11,497,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Chung Linh T� ", tbProp = {0,11,498,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - C� B竎h", tbProp = {0,11,499,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - o song ph鬾g", tbProp = {0,11,500,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Чo Thanh Ch﹏ Nh﹏", tbProp = {0,11,501,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Di謚 Nh� ", tbProp = {0,11,502,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - an M閏 Du� ", tbProp = {0,11,503,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Йng t�", tbProp = {0,11,504,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Л阯g B蕋 Nhi詍", tbProp = {0,11,505,1,0,0}, nExpiredTime = 48*60},	-- 10
	{szName = "M苩 n� - Л阯g th莕", tbProp = {0,11,506,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Л阯g Thi猲 T﹎", tbProp = {0,11,507,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Gia Lu藅 T� Ly", tbProp = {0,11,508,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - H� Linh Phi猽", tbProp = {0,11,509,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - H� Nh﹏ Ng� ", tbProp = {0,11,510,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - H� Th祅h", tbProp = {0,11,511,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Heo tr緉g", tbProp = {0,11,512,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Hu m", tbProp = {0,11,513,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Huy襫 Gi竎 Чi S� ", tbProp = {0,11,514,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Lam linh c玭g t�", tbProp = {0,11,515,1,0,0}, nExpiredTime = 48*60},	-- 20
	{szName = "M苩 n� - Lam Y Y", tbProp = {0,11,516,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Li評 Phi Y猲", tbProp = {0,11,517,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Li評 Thanh Thanh", tbProp = {0,11,518,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Long th藀 tam gia", tbProp = {0,11,519,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - M筺h Thng Lng", tbProp = {0,11,520,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - M� Dung Y課", tbProp = {0,11,521,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Nguy謙 dao dao", tbProp = {0,11,522,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Phi課 Kh竎h", tbProp = {0,11,523,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - T﹏ Ni猲 Hi謕 Kh竎h", tbProp = {0,11,524,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - T﹏ Ni猲 Hi謕 N� ", tbProp = {0,11,525,1,0,0}, nExpiredTime = 48*60},	-- 30
	{szName = "M苩 n� - Thanh Ni猲 H秈 Л阯g", tbProp = {0,11,526,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Th祅h Ni猲 H秈 Л阯g", tbProp = {0,11,527,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thanh Ni猲 H醓 Nh薾", tbProp = {0,11,528,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Th祅h Ni猲 H醓 Nh薾", tbProp = {0,11,529,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thanh Ni猲 Kim Phong", tbProp = {0,11,530,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Th祅h Ni猲 Kim Phong", tbProp = {0,11,531,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thanh Ni猲 L玦 Ki誱", tbProp = {0,11,532,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Th祅h Ni猲 L玦 Ki誱", tbProp = {0,11,533,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thanh Ni猲 Ti誹 Sng", tbProp = {0,11,534,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Th祅h Ni猲 Ti誹 Sng", tbProp = {0,11,535,1,0,0}, nExpiredTime = 48*60},	-- 40
	{szName = "M苩 n� - Thanh Tuy謙 S� Th竔", tbProp = {0,11,536,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thi誹 Ni猲 H秈 Л阯g", tbProp = {0,11,537,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thi誹 Ni猲 H醓 Nh薾", tbProp = {0,11,538,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thi誹 Ni猲 Kim Phong", tbProp = {0,11,539,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thi誹 Ni猲 L玦 Ki誱", tbProp = {0,11,540,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Thi誹 Ni猲 Ti誹 Sng", tbProp = {0,11,541,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - T� T� Hinh", tbProp = {0,11,542,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Trng T玭g Ch輓h", tbProp = {0,11,543,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - T� hi謕", tbProp = {0,11,544,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Tuy襫 C� T� ", tbProp = {0,11,545,1,0,0}, nExpiredTime = 48*60},		-- 50	
	{szName = "M苩 n� - Voi Ch﹗ � ", tbProp = {0,11,546,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Voi Ho祅g H� ", tbProp = {0,11,547,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Vng T� ", tbProp = {0,11,548,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Y猲 Hi觰 Tr竔", tbProp = {0,11,549,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� - Y課 tri謚", tbProp = {0,11,550,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� Chi誹 Nh藅 Mi謓", tbProp = {0,11,551,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� Di謚 Nh蕋", tbProp = {0,11,552,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� 筺 M閏 Ly", tbProp = {0,11,553,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� Л阯g H筼", tbProp = {0,11,554,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� h籲g nga", tbProp = {0,11,555,1,0,0}, nExpiredTime = 48*60},		-- 60	
	{szName = "M苩 n� L╪g Ti猽 T�", tbProp = {0,11,556,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� L� Chi誸 Mai", tbProp = {0,11,557,1,0,0}, nExpiredTime = 48*60},
	{szName = "M苩 n� Xu﹏ Ng璾", tbProp = {0,11,558,1,0,0}, nExpiredTime = 48*60},
}

function showMask(nIndex, nPlayerIndex, nItemIndex)
	local szTitle = "Xin h穣 l鵤 ch鋘 lo筰 m苩 n� m� ngi mu鑞"
	local tbOpt = {}
	local nMaskCount = getn(%tbMask)
	local nShowIndex = 0
	local nPerCount = 10
	
	nIndex = max(1, nIndex)
	nIndex = min(nIndex, nMaskCount)
	nShowIndex = nIndex
	
	for i=1,nPerCount do
		if nShowIndex > nMaskCount then
			break
		end
		tinsert(tbOpt, {%tbMask[nShowIndex].szName, queren, {nShowIndex, nPlayerIndex, nItemIndex}})
		nShowIndex = nShowIndex + 1	
	end
	
	tinsert(tbOpt, {"Trang trc", showMask, {nIndex - nPerCount, nPlayerIndex, nItemIndex}})
	if nShowIndex + 1 < nMaskCount then
		tinsert(tbOpt, {"Trang k� ", showMask, {nShowIndex, nPlayerIndex, nItemIndex}})
	end
	tinsert(tbOpt, {"R阨 kh醝", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function queren(nIndex, nPlayerIndex, nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nCount, nWidth, nHeight))
		return 
	end
	
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("H駓 b� D� Dung B� Thu藅 th蕋 b筰")
		return 
	end
	-- 赠送选定的面具
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbMask[nIndex], "S� d鬾g D� Dung B� Thu藅", 1)
end

function main(nItemIndex)
	showMask(1, PlayerIndex, nItemIndex)
	return 1
end