--中原北区 朱仙镇 路人小熊的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 1) then
		Talk(2,"","Ti觰 huynh , c� th蕐 chi誧 nh蒼 c馻 Song Song t� t� kh玭g?","Ta th蕐 ngi ╪ m祔 ph輆 T﹜ tr蕁 nh苩 頲 m閠 chi誧 nh蒼, kh玭g bi誸 c� ph秈 c馻 Song Song t� t� kh玭g?")
		AddNote("Chi誧 nh蒼 c馻 Song Song c� nng c� th�  b� ngi ╪ m祔 l蕐 甶. ")
		SetTask(68,2)
		Msg2Player("Chi誧 nh蒼 c馻 Song Song c� nng c� th�  b� ngi ╪ m祔 l蕐 甶. ")
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","Song Song t� t� r蕋 t鑤 v韎 ta.")
		else
			Talk(1,"","a c秏 th蕐 ngi ╪ m祔 � ph輆 T﹜ tr蕁 c� c竔 g�  h琲 k� qu竔.")
		end
	end
end;
