if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_NEWBIELEVELUP = 1080	--本次活动需要用到的任务变量编号
TKVAL_NEWBIELEVELUP_OPEN = 1 --接任务以后，1080号任务变量设为1

ENewbieLevelUp = {
	To20Level = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			return
		end
		local level = GetLevel()
		if(level ==1) then
			for i=1,19 do
				AddOwnExp(100000)
			end
			SetTask(TKID_NEWBIELEVELUP,TKVAL_NEWBIELEVELUP_OPEN)
		end
	end,
	PayDoubleExp = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			Talk(1,"","Xin l鏸! Th阨 gian di詎 ra ho箃 ng  ch蕀 d鴗 r錳!")
			return
		end
		local ret = ENewbieLevelUp.validate()
		if(ret ==1) then
			Talk(1,"","Xin l鏸! Ъng c蕄 c馻 b筺  vt qu� c蕄 60 kh玭g th� nh薾 ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 2 gi�.")
			return
		end
		if(ret == 2) then
			Talk(1,"","Xin l鏸! B筺 kh玭g ph秈 nh﹏ v藅 m韎 t筼 n猲 kh玭g th� nh薾 ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 2 gi�.")
			return
		end
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461, 1, 1,2*60*60*18)
		Talk(1,"","Hoan ngh猲h b筺 tham gia 'Ho箃 ng t﹏ th� luy謓 c蕄', y l� ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 2 gi�.")
		Msg2Player("B筺 nh薾 頲 ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 2 gi� ")
		return
	end,
	validate = function()
		local level = GetLevel()
		if (level > 60) then
			return 1
		end
		local flag = GetTask(TKID_NEWBIELEVELUP)
		if (flag ~= TKVAL_NEWBIELEVELUP_OPEN) then
			return 2
		end
		return 0
	end
}

function BTNNewbieLevelUp()
	local msg = "Hoan ngh猲h tham gia 'Ho箃 ng t﹏ th� luy謓 c蕄'."
	local btns = {
		"Ta n nh薾 t╪g i 甶觤 kinh nghi謒 trong 2 gi� /PayDoubleExp",
		"T譵 hi觰 ho箃 ng l莕 n祔/AboutNewbieLevelUp",
	}
	Say(msg,getn(btns),btns)
end

function PayDoubleExp()
	ENewbieLevelUp.PayDoubleExp() 
end

function AboutNewbieLevelUp()
	local msg = ": Trong th阨 gian ho箃 ng, ch� c莕 nh﹏ v藅 m韎 t筼 l猲 n c蕄 20 v� di c蕄 60 c� th� n L� Quan nh薾 t╪g i 甶觤 kinh nghi謒 trong 2 gi�."
	local btns = {
		"Tr� l筰/BTNNewbieLevelUp",
		"Tho竧 ra/Quit"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end
