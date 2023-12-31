-- 16.	钰龙医仙柳药师：每个人对话后获得一张字条，根据字条的谜面采集地上的药材（20个箱子，每个箱子代表一种药材），
-- 然后把字条和药材交还，要求所有人都回答正确1题才能过关，如有错误则继续回答，如果答对就不能再继续对话了。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK16_RIDDLE = {
	{"C� Hng", 		"Th鬰 мa"},
	{"D� Qu鑓", 		"Sinh мa"},
	{"L穙 Th鵦 Trung H藆", 	"Hau Ph竎"},
	{"b謓h nh藀 cao hoang ",	"M玦 Dc"},
	{"V� T遪g S竧 T萿",	"Xuy猲 T﹎ Li猲"},
	{"H礽 nhi tham ki課 ph� vng","Th竔 T� Tham"},
	{"Ьng cay chua ng鋞 nh箃",	"Ng� V� T�"},
	{"L穙 B筺g Sinh Ch﹗",	"B鑙 M閡"},
	{"L鬰 L﹎ H秓 H竛", 	"Th秓 Kh蕌 "},
	{"Tam T豱h Ng� Th﹏", 	"Ph遪g D�"},
	{"C鰑 Quy Nh蕋", 	"B竎h H頿"},
	{"Kh� Ng筼 Tam C鰑", 	"nh蒼 ng "},
	{"C鑤 Khoa Y Sanh",	"t鬰 畂筺 "},
	{"M璾 S� Nan Л琻g", 	"Kh� Tham"},
	{"H錸g S綾 C� V蕁", 	"Кn Tham"},
	{"Thi猲 Ph� Chi B秓",	"Xuy猲 B鑙"},
	{"Gi� K� Chi Ho祅",	"Л琻g Quy "},
	{"L穘g Ph� Ti襫 T礽",	"Kim Ng﹏ Hoa"},
	{"H綾 S綾 Ho祅 T�",	"� Dc"},
	{"H錸g Tr莕", 		"Chu Sa "},
}

pTask = Task:New(16)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_npc = self:GetPosition().t16_npc
	local pos_box = self:GetPosition().t16_box
	self.m_NpcIndex = DlgNpcManager:AddNpc("Li評 Dc S�", 1718, mapid, pos_npc.x, pos_npc.y, self, 0)
	self.m_Box = {}
	for i = 1, 20 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK16_RIDDLE[i][2], 1698, mapid, pos_box[i].x, pos_box[i].y, self, i)
		tinsert(self.m_Box, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Box) then
		for i = 1, getn(self.m_Box) do
			DlgNpcManager:DelNpc(self.m_Box[i])
		end
		self.m_Box = nil
	end
end

function pTask:Say(player, index)
	if (index == 0) then
		local caption = "Xin c竎 ch� v� h穣 n ch� c馻 l穙 phu nh薾 m閠 Кn Dc, c╪ c� theo l阨 b� 萵 tr猲 Кn Dc l蕐 m閠 lo筰 Dc Li謚, sau  c竎 ch� v� h穣 h穣 l蕐 Кn Dc v� Dc Li謚 th輈h h頿 giao cho ta, n誹 nh� m鏸 ngi u t譵 ng Dc Li謚 th� c� th� qua 秈, t譵 sai th� h穣 畂竛 l筰"
		-- TODO: local options = {""}
	end
end
