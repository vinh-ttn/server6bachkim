--description: 武当派出师任务 武当山宝箱1
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B秓 rng: Hi謓 nay ti襫 tuy課 phe T鑞g <color=Red>b謓h d辌h h筩h<color> k衞 d礽, h穣 n <color=Red>Tng Dng<color> t譵 <color=Red>Ch� dc 甶誱 <color> t譵 c竎h gu輕 ")
			Msg2Player("G莕 y b謓h d辌h h筩h lan tr祅 trong doanh tr筰 qu﹏ T鑞g, c莕 ph秈 n th祅h Tng Dng t譵 玭g ch� ti謒 thu鑓 nh� gi髉  gi秈 quy誸. ")
			SetTask(17, SetByte(GetTask(17),1,2))
			AddNote("L� b颽 tr猲 b秓 rng � Th竔 T� nham vi誸:: дn th祅h Tng Dng t譵 ch� ti謒 thu鑓 t譵 c竎h ng╪ ch苙 b謓h d辌h h筩h lan tr祅 trong doanh tr筰 qu﹏ T鑞g. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","B秓 rng: <color=Red>B謓h d辌h h筩h<color> v蒼 產ng k衞 d礽.....")
			Msg2Player("B謓h d辌h h筩h v蒼 產ng lan tr祅... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(69)
			Say("<color=Red>B謓h d辌h h筩h<color>  tr�, m� b秓 rng, ph竧 hi謓 1 quy觧 <color=Red>'Ng鋍 Thanh Ch﹏ Kinh'<color>.", 0)
			Msg2Player("B謓h d辌h h筩h 頲 ti猽 di謙, c� b� Ng鋍 Thanh Ch﹏ Kinh. ")
			SetTask(17, SetByte(GetTask(17),1,10))
			AddNote("M� B秓 rng c� Ng鋍 Thanh Ch﹏ Kinh. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(69) == 0) then
				AddEventItem(69)
			else
				Talk(1,"","B秓 rng  r鏽g")
			end
		end
	else
		Talk(1,"","Ch璦 nh薾 nhi謒 v�! B筺 kh玭g th� m� B秓 rng n祔!")
	end
end;
