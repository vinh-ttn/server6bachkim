Include("\\script\\activitysys\\config\\38\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "add npc when server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "right click item named NewYear-Gift",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {"return {tbProp={6,1,3086,-1,-1,0},}"},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_USED_NEWYEAR_GIFT_DAILY,MAX_USED_NEWYEAR_GIFT_DAILY,"S� l莕 s� d鬾g c馻 ngi h玬 nay  , ng祔 mai h穣 quay l筰 nh�!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewYearGift",	{nil} },
		{"ThisActivity:AddTaskDaily",	{TSK_USED_NEWYEAR_GIFT_DAILY,1} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "right click item named NewYear-Fireworks",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {"return {tbProp={6,1,3087,-1,-1,0},}"},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_USED_NEWYEAR_FIREWORKS,MAX_USED_NEWYEAR_FIREWORKS,"Ngi  nh薾 頲 qu� nhi襲 ph莕 thng, xin h穣 th� c竔 kh竎 甶!","<"} },
		{"ThisActivity:CheckFireworksUseTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseNewYearFireworks",	{nil} },
		{"ThisActivity:AddTask",	{TSK_USED_NEWYEAR_FIREWORKS,1} },
	},
}
