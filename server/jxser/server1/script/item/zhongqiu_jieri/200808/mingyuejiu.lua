--zhongchaolong
--明月酒
--角色使用明月酒后会两倍扩展通过2中月饼【 见月月饼 】和【 赏月月饼 】的经验限制 （从15亿到30亿经验。
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("V藅 ph萴 n祔  qu� h筺.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Y猽 c莡 ng c蕄 ph秈 tr猲 50 v�  qua n筽 th�.", 0)
		return 1
	end
	if GetTask(zhongqiu0808_TSK_mingyuejiu) == 1 then
		Say("B筺  s� d鬾g o c� n祔 r錳.")
		return 1
	end
	
	SetTask(zhongqiu0808_TSK_mingyuejiu, 1)
	Msg2Player("Sau khi s� d鬾g Minh Nguy謙 t鰑, m鴆 gi韎 h筺 kinh nghi謒 t� 2 lo筰 b竛h Trung thu Ki課 Nguy謙 v� b竛h Trung thu Thng Nguy謙 s� t╪g l猲 m鴆 3 t� 甶觤.")
end