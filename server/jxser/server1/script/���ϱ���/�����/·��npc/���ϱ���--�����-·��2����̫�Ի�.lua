----西南北区 江津村 路人2吴老太对话

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_wulaotai()
	else
		Say("Tuy ta kh玭g c� con trai, nh璶g  c� m閠 a con g竔 ngoan hi襫 hi誹 thu薾, ngi ta u n鉯 b� nh� ta c� ph骳!",0)
	end
end;