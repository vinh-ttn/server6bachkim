-- 文件名　：luckybox.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-15 10:47:37
--物品上的说明文字：“ 幸运礼盒里具有许多少见的棋碎片”
--使用方法：右键点击使用
--使用截止时间：2008年05月18日24点00分
Include("\\script\\lib\\awardtemplet.lua")
jiefang_0804_luckybox_Award = 
{
	{szName="M秐h c� 1", tbProp={6, 1, 1735, 1, 0, 0}, nRate = 50},
	{szName="M秐h c� 2", tbProp={6, 1, 1736, 1, 0, 0}, nRate = 30},
	{szName="M秐h c� 3", tbProp={6, 1, 1737, 1, 0, 0}, nRate = 15},
	{szName="M秐h c� 4", tbProp={6, 1, 1738, 1, 0, 0}, nRate = 5},
}
function main()
	if CalcFreeItemCellCount() < 1 then
		Say("T骾 h祅h trang  y, h穣 d鋘 d裵 h祅h trang  b秓 m an to祅 cho v藅 ph萴.",0)
		return 1;
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate > 20080518 then
		Say("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.", 0);
		return 0;
	end 
	tbAwardTemplet:GiveAwardByList(jiefang_0804_luckybox_Award, "use luckybox")
	return 0;
end