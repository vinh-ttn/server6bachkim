-- 临安　路人　丁磊
-- by：Dan_Deng(2003-09-16)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");

function main()

	-- 剧情篇
	if taskProcess_003_02:doTaskEntity()~=0 then return end;
	if taskProcess_003_04:doTaskEntity()~=0 then return end;

	-- 修炼篇
	if rewindProcess_003_02:doTaskEntity()~=0 then return end;
	if rewindProcess_003_04:doTaskEntity()~=0 then return end;


	Talk(1,"","L� ngi Kim ch� l� m閠 m man di m鋓 r�, h鱱 d騨g v� m璾. L祄 sao ch髇g c� th� l祄 i th� c馻 Чi T鑞g? Vi謈 g� ch髇g ta c� ph秈 khinh s� ch髇g, t� h� d鋋 m譶h? Х c� Ho祅g Thng � y, ta tin tng b鋘 ngi Kim kia s� kh玭g th� t蕁 c玭g n L﹎ An n祔. ")

end;
