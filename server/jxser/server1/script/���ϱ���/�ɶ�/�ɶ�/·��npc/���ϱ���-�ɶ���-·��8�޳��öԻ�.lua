--西南北区 成都府 路人8邹长久对话
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_zouchangjiu()
	else
		Say("T� l﹗  nghe danh Xuy猲 Mu閕 T� l� c� nng v鮝 p l筰 v鮝 c� t礽, h玬 nay 頲 di謓 ki課 qu� l� l韎 n kh玭g sai. N誹 nh� m� ta ch璦 c� nng t� th�...",0)
	end
end;

