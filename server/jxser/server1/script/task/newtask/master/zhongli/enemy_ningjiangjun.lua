-------------------------------------------------------------------------
-- FileName		:	enemy_ningjiangjun.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:05:42
-- Desc			:	战斗_宁将军
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 30) then
		SetMemberTask(1002,30,40,zhongtask1) --环节3end
	end
end

function zhongtask1()
	AddOwnExp(20000)
	AddExp_Skill_Extend(20000)
	Msg2Player("B筺 h穣 quay v� t譵 Ph� Nam B╪g.")
	Talk(1,"","T� l骳 nh� v� Kim qu鑓 n nay, ta bi誸 s� c� ng祔 n祔! Ch� kh玭g ng� n� n nhanh nh� v藋!")
end

