-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 龙凤尾
-- 文件名　：longfeng_wei.lua
-- 创建者　：子非魚
-- 创建时间：2009-05-21 12:05:35

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if 20090619 > nCurDate or nCurDate > 20090727 then	
		Talk(1, "", "Ho箃 ng  k誸 th骳.");
		return 0;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == tbBirthday0905.tbTask.nmaxexpfromzhuhe) then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
		Msg2Player("N﹏g c蕄 thu 頲 gi韎 h筺 kinh nghi謒 c馻 hai v藅 ph萴 [T﹏ B秐 C鎉 v� [T﹏ B秐 K鷀 l� 3000000000 Exp")
	else
		
		Talk(1, "", "Kh玭g 頲 s� d鬾g v藅 ph萴 n祔.");
		return 1;
		
	end
end

