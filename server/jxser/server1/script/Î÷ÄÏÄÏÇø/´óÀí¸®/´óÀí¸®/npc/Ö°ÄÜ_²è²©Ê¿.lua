-- 大理　职能　茶博士
-- by：Dan_Deng(2003-09-16)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

function main()
	
	-- 控蛇人之秘的任务处理
	if taskProcess_002_02:doTaskEntity()~=0 then return end;
	if taskProcess_002_11:doTaskEntity()~=0 then return end;
	
	Talk(3,"","Tr� c馻 ch髇g ta n鎖 ti課g nh蕋 V﹏ Nam, Чi L� ch髇g ta n鎖 ti課g l� tr� H� Quan У Tr�.","H� Quan У Tr� h譶h th鴆 kh玭g gi鑞g nhau, lo筰 l韓 nh� ch衝 c琺, lo筰 nh� nh� n髏 竜.","X璦 c� c﹗ 'H� Quan Tr�, У Giang Th駓' H� Quan Tr� nh蕋 ph秈 d飊g nc s玭g pha m韎 ng. Tr� pha xong c� m祏 v祅g cam, m飅 v� th琺 n錸g, tr� pha  l﹗ v蒼 l� c鵦 ph萴.")
end;
