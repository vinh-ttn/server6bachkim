
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本实体处理文件 - 总索引文件
-- Edited by peres
-- 2005/09/09 PM 11:19

-- 只有他和她两个人
-- 他们系爱
-- 她记得
-- 他的手抚摩在她的皮肤上的微情
-- 他的亲吻像鸟群在天空⒂过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充Ⅹ纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 同伴系统的头文件
IncludeLib("PARTNER");

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main_01.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_02.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_04.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_05.lua");

-- 与龙五对话的总选项
taskProcess_000 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
	
		local strMain = { 
                               "<npc> t鑞g kim lo筺 chi課 , M玭g C� qu藅 kh雐, nhi襲 l莕 c飊g nam t鑞g th莔 th玭g kho秐 kh骳 ch m藅 m璾 , c騨g b� kim qu鑓 cp l蕐 頲 , t﹜ h� qu鑓 ch� r鑤 c鬰 ph竧 gi竎 ta i T鑞g vng hng  t� t� hng 甶 ph骳 m蕋 ch l籲 ranh . v� v藋 h緉 b� khi課/sai nh蕋 ph萴 阯g v� s� ti課 v祇 Trung Nguy猲 , t譵 ki誱 m閠 m鉵 m蕋 t輈h  l﹗  . c� th� l� th� g� kh玭g bi誸 頲 , b蕋 qu� ch髇g ta l筰 t� chuy謓 n祔 thu薾 ng s� d璦 t譵 ra li評 m閠 輙 u m鑙 . b蕋 qu� ngh躠 qu﹏ c l鵦 ki謓 tng r鑙 r輙 � c竎 tr猲 chi課 trng tr� gi髉 tri襲 nh ch鑞g l筰 kim qu鑓 , trc m総 ta b﹜ gi� nh﹏ th� thi誹 h魌 . hy v鋘g ngi c� th� gi髉 b薾 r閚 l祄 m蕐 m鉵 甶襲 tra . nh鱪g nhi謒 v� n祔 chia ra li謙 c� xu鑞g . � ngi ho祅 th祅h tng 鴑g k辌h t譶h nhi謒 v� sau , sau n祔 m鏸 ng祔 , m鏸 v� ng b筺 c騨g c� th� l鵤 ch鋘 hai  ho祅 th祅h k辌h t譶h nhi謒 v� ti誴 t鬰 l祄 m閠 l莕 , hy v鋘g ngi ng祅 v筺 gi髉 ta m閠 c竔 !", 
                            "Th� lang chi t�/#taskProcess_001:doTaskEntity()", 
                            "Kh鑞g x� nh﹏ chi b�/#taskProcess_002_01:doTaskEntity()", 
                            "Ch﹗ b竨 thng nh﹏ /#taskProcess_003_Main:doTaskEntity()", 
                            "D� t閏 v� s� /#taskProcess_004_Main:doTaskEntity()", 
                            "Ta u kh玭g mu鑞 nh薾, sau n祔 tr� l筰./OnTaskExit"}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	
	end,

});

