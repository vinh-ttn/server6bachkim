--description: 唐门普通弟子 竹海三关出口
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(11) == 1 then
		allbrother_0801_FindNpcTaskDialog(11)
		return 0;
	end
	UTask_tm = GetTask(2);
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 80) then			--入门任务
		if (HaveItem(33) == 1) and (HaveItem(34) == 1) and (HaveItem(35) == 1) then
			Uworld37_prise()
		else
			Talk(1,"","B筺 ph秈 l蕐 頲 3 c﹜ tr骳 xanh, tr緉g, t輒 qua 秈 m韎 頲!")
		end
	elseif (Uworld37 < 80) then						--尚未入门
		Talk(1,"","Mu鑞 qua Tr骳 H秈 Tam Quan, ph秈 l蕐 頲 3 c﹜ g藋 tr骳 m祏 xanh, tr緉g, t輒.")
--	elseif (GetFaction() == "tangmen") then			--已经入门，尚未出师
--		Talk(1,"","唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！")
	elseif (UTask_tm >= 70*256) and (GetFaction() ~= "tangmen") then						--已经出师
		Talk(1,"","竚 kh� v� c筸 b蓎 c馻 B鎛 m玭 c b� thi猲 h�, ngi tr猲 giang h� kh玭g ai d竚 xem thng ch髇g ta. Sau n祔 h祅h t萿 giang h� kh玭g 頲 l祄 m蕋 uy phong b鎛 m玭! ")
	else
		Talk(1,"","Tr骳 h秈 nguy hi觤, ph秈 h誸 s鴆 c萵 th薾!")
	end
end;

function Uworld37_prise()
	Talk(1,"","Ngi  thu薾 l頸 qua 秈, tr� th祅h е t� k� danh c馻 b鎛 m玭! ")
	DelItem(33)
	DelItem(34)
	DelItem(35)
	UTask_world37 = SetByte(GetTask(37),1,127)
	i = ReturnRepute(25,19,4)		-- 缺省声望，最大无损耗等级，每级递减率
	SetTask(37,UTask_world37)
	AddRepute(i)		-- 加声望
	Msg2Player("Mang 3 c﹜ tr骳 n Tr骳 H秈 Tam Quan xu蕋 kh萿 giao cho ph遪g ngh� s� Л阯g m玭, ho祅 th祅h nhi謒 v� K� Danh  t�. Tr� th祅h Л阯g m玭 K� Danh  t�, thanh th� t╪g l猲"..i.."甶觤.")
	AddNote("T筰 l鑙 ra c馻 Tr骳 H秈 Tam Quan, giao 3 c﹜ tre cho Л阯g M玭 tr竛g 甶nh, ho祅 th祅h nhi謒 v� k� danh  t�. ")
end;
