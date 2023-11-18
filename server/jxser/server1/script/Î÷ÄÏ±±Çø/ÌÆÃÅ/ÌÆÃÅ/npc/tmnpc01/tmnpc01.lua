--description: 唐门普通弟子 竹海三关入口
--author: yuanlan	
--date: 2003/3/7
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(8) == 1 then
		allbrother_0801_FindNpcTaskDialog(8)
		return 0;
	end
	UTask_tm = GetTask(2)
	UTask_wu = GetTask(10)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 0) and (GetLevel() >=10) and (GetFaction() ~= "tangmen") then		--入门任务启动
		Say("Mu鑞 tr� th祅h е t� K� danh b鎛 m玭 ph秈 th玭g qua <color=Red>Tr骳 H秈 Tam Quan<color>, ngi mu鑞 th� kh玭g?", 2, "X玭g tr薾 /enroll_get_yes", "Kh玭g x玭g /no")
	elseif (Uworld37 > 0) and (Uworld37 < 20) then			--任务中
		Talk(1,"","Mu鑞 l蕐 頲 <color=Red>g藋 tr骳 m祏 xanh<color> ph秈 nh b筰 <color=Red>Чi M� h莡<color> trong 秈 th� nh蕋.")
--，想得到<color=Red>白色竹杖<color>你必须去第二关找一个<color=Red>庄丁<color>，最后一柄<color=Red>紫色竹杖<color>在第三关的<color=Red>庄丁<color>手上。得到三柄竹杖后交给<color=Red>出口的庄丁<color>，才能算是过关。
--	elseif (GetFaction() == "tangmen") then			--已经入门，尚未出师
--		Talk(1,"","唐门庄丁：大家都是同门兄弟，你不必再闯这里面的竹海三关了！")
	elseif (UTask_tm >= 70*256) then						--已经出师
		Talk(1,"","竚 kh� v� c筸 b蓎 c馻 B鎛 m玭 c b� thi猲 h�, ngi tr猲 giang h� kh玭g ai d竚 xem thng ch髇g ta. Sau n祔 h祅h t萿 giang h� kh玭g 頲 l祄 m蕋 uy phong b鎛 m玭! ")
	else
		Talk(1,"","B鎛 m玭 kh玭g hoan ngh猲h ngi l� t� � ra v祇.")
	end
end;

function enroll_get_yes()
	Talk(2, "", "L蕐 頲 3 c﹜ <color=Red>g藋 tr骳 xanh, tr緉g, t輒<color> trong <color=Red>Tr骳 H秈 Tam Quan<color> a cho ng m玭 � l鑙 ra, coi nh� qua 秈.", "Mu鑞 l蕐 頲<color=Red>g藋 tr骳 m祏 xanh<color> ph秈 nh b筰 <color=Red>Чi M� h莡<color> trong 秈 th� nh蕋, <color=Red>g藋 tr骳 m祏 tr緉g<color> ph秈 qua 秈 th� hai t譵 <color=Red>Tr竛g nh<color>, <color=Red>G藋 tr骳 m祏 t輒<color> � trong tay c馻 <color=Red>Tr竛g nh<color> � 秈 th� ba.")
	Uworld37 = SetByte(GetTask(37),1,20)
	SetTask(37,Uworld37)
	AddNote("дn Tr骳 H秈 Tam quan, g苝 Л阯g M玭 tr竛g 甶nh, nh薾 nhi謒 v� <color=red>K� Danh е T�<color>, vt qua Tr骳 H秈 Tam Quan  l蕐 3 c﹜ g藋 tre m祏 xanh, tr緉g, t輒. ")
--	AddNote("到唐门记名弟子任务：闯过竹海三关并得到青、白、紫三柄竹杖。")
end;

function no()
end;
