-- 华山派箭头对话脚本

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","Nghe n鉯 V� L﹎ Truy襫 K� c� nhi謒 v� Ho祅g Kim, е t� Hoa S琻 ph竔  xu鑞g n骾 l祄 nhi謒 v�, sau n祔 ngi h穣 quay l筰!");
	end
end
