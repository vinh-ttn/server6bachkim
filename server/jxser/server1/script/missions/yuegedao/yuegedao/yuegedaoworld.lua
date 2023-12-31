Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

YueGeDaoWorld = Game:new()
YueGeDaoWorld.szMapType = "Nguy謙 Ca Фo" --改变地图表示

YueGeDaoWorld.tbForbitItemType = --重载 违禁道具
{
	"TRANSFER","MATE"
}

YueGeDaoWorld.Player = {
	szPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaoplayer.lua",
	szClassName = "YueGeDaoPlayer",
}

YueGeDaoWorld.PlayerEnterTrapTime = {
}

YueGeDaoWorld.tbNpcTypeList = --npc的类型
{
	["Nguy謙 Ca V� V� 1"] = 
	{
		nNpcId = 1847,
		szName = "Nguy謙 Ca V� V�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei1.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei1.lua",
	},
	["Nguy謙 Ca V� V� 2"] = 
	{
		nNpcId = 1847,
		szName = "Nguy謙 Ca V� V�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei2.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei2.lua",
	},
	["Nguy謙 Ca Фo Ch�"] = 
	{
		nNpcId = 1849,
		szName = "Nguy謙 Ca Фo Ch�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegedaozhu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaozhu.lua",
	},
	["Th� M閏"] = 
	{
		nNpcId = 1861,
		szName = "Th� M閏",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shumu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shumu.lua",
	},
	["Nguy謙 Ca Ki誱 Th�"] = 
	{
		nNpcId = 1848,
		szName = "Nguy謙 Ca Ki誱 Th�",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegejianshi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegejianshi.lua",
	},
	["Bia Ц"] = 
	{
		nNpcId = 1865,
		szName = "Bia Ц",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibei.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibei.lua",
	},
	["Bia Ц Ki誱 Gia"] = 
	{
		nNpcId = 1860,
		szName = "Bia Ц Ki誱 Gia",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibeiex.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibeiex.lua",
	},
	["Ki誱 Si"] = 
	{
		nNpcId = 1853,
		szName = "Ki誱 Si",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jianchi.txt",
	},
	["Ki誱 Cu錸g"] = 
	{
		nNpcId = 1854,
		szName = "Ki誱 Cu錸g",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jiankuang.txt",
	},
	["V� l﹎ nh﹏ s� c馻 Th莕 tr� b蕋 thanh"] = 
	{
		nNpcId = 1854,
		szName = "V� l﹎ nh﹏ s� c馻 Th莕 tr� b蕋 thanh",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shenzhibuqingdewulingrenshi.txt",
	},
	["Thuy襫 Phu Nguy謙 Ca Фo"] = 
	{
		nNpcId = 240,
		szName = "Thuy襫 Phu Nguy謙 Ca Фo",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\chuanfu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\chuanfu.lua",
	},
}
YueGeDaoWorld.tbTrapList = 
{
--	["A1"] =
--	{
--		szPosPath = "",--Trap点的坐标文件
--		szTrapFile = "",--Trap脚本的路径
--	},
}

function YueGeDaoWorld:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function YueGeDaoWorld:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

YueGeDaoWorld:AssociateMap(968)
YueGeDaoWorld:SetForbitItem()
