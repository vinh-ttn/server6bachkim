--月饼
--zhongchaolong
--性质：
--可以：丢弃，交易，摆摊，卖店（0两），叠加 
--物品上的说明：
--“一种普通的月饼”
--使用方法： 右键点击使用
--使用截止时间： 2008年10月31日24点
--限制： 
--50级以上的充值玩家才能使用
--每个角色最多只能通过使用【 望月月饼 】获得2亿经验 





Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("V藅 ph萴 n祔  qu� h筺.",0)
		return 0;
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("в tr竛h m蕋 m竧 t礽 s秐, h穣 b秓 m h祅h trang c遪  %d � tr鑞g.", nCellFreeLimit),0)
		return 1
	end
	
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Y猽 c莡 ng c蕄 ph秈 tr猲 50 v�  qua n筽 th�.", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_jiansanyue)
	
	if nCurExp >= zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) then
		Say(format("S� d鬾g v藅 ph萴 n祔  t gi韎 h筺 %u kinh nghi謒.", 1e6 * zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) ), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(zhongqiuyubing_tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_jiansanyue, nCurExp + floor(zhongqiuyubing_tbAward[1].nExp/1e6))
end