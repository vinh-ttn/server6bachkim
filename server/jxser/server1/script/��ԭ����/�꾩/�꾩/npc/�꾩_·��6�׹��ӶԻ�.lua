--中原北区 汴京府 路人6白公子对话

function main(sel)
	x = GetTask(12)
	Uworld123 = GetTask(123)
	if (x > 0) and (x < 256) and (HaveItem(231+x) == 1) and (GetLevel() >= 20) and (GetRepute() >= 20) then			-- 等级过20、声望过20、有任务、有信函能对应上，可以开始收买
		if (GetSex() == 0) then		-- 玩家是男角色
			Talk(2,"W12_sale_get","V� thi誹 hi謕 n祔 phong th竔 ung dung, l� ngi b蕋 ph祄. Kh緋 v飊g Ho祅g H� n祔 ai c騨g bi誸 ti課g. B鎛 thi誹 gia v鑞 c騨g ngng m�  l﹗. ","Gh衪. Ngi mu鑞 g� th� c� n鉯 ra 甶. ng c� r祇 trc n sau n鱝 ")
		else
			Talk(2,"W12_sale_get","V� c� nng n祔 xin p nh� hoa, chim sa nh筺 l筩. Kh緋 v飊g Ho祅g H� n祔 ai c騨g bi誸 ti課g. B鎛 thi誹 gia v鑞 c騨g ngng m�  l﹗. ","Gh衪. Ngi mu鑞 g� th� c� n鉯 ra 甶. ng c� r祇 trc n sau n鱝 ")
		end
	elseif (Uworld123 == 20) and (HaveItem(379) == 1) then		-- 唐不染任务：有任务并且有信函
		Talk(3,"Uworld123_step1","Th� c馻 b蕋 Nhi詍 c玭g t� cu鑙 c飊g  n! Х i l﹗ qu� r錳,  ta xem xem huynh n鉯 g�!","Th� ra l� v藋! Th藅 hay qu�! Qu� l� tr阨 kh玭g ph� l遪g ngi! ьi , ta s� l藀 t鴆 vi誸 th� cho huynh 蕐!","Xong r錳! Xin chuy觧 b鴆 th� n祔 cho B蕋 Nhi詍 c玭g t�.")
	elseif (Uworld123 == 30) and (HaveItem(380) == 0) then		-- 信丢了
		Talk(1,"","Ngi l祄 vi謈 nh� th� �? Th� ch璦 l蕐 m�  v閕 v祅g 甶 r錳?")
		AddEventItem(380)
		Msg2Player("Quay l筰  nh薾 th� c馻 B筩h C玭g t� ")
	else
		Talk(1,"","Tr╩ v筺 thi誸 m� c馻 ch髇g ta m閠 khi  Nam h� th� b鋘 ngi T鑞g kia l祄 sao c� th� ch鑞g  頲? L骳  th� c� giang s琻, g蕀 v鉩 v� m� n� c馻 b鋘 ch髇g u thu閏 v� b� t閏 N� Ch﹏ c馻 ta! ha ha ha! ")
	end
end;

function W12_sale_get()
	Say("N誹  nh� v藋 T筰 h� xin n鉯 th糿g. Xin h醝 ngi c� th� cho ta xem b鴆 m藅 h祄 trong ngi c馻 ngi kia 頲 kh玭g? � y t筰 h� c� 20000 lng g鋓 l� c� ch髏 l遪g th祅h.",2,"Th� l鏸. Ta ph秈 nghe theo l阨 d苙 c馻 D辌h quan, kh玭g giao b鴆 m藅 h祄 n祔 cho ngi kh竎 /W12_sale_no","V藋 n誹 nh� ta t苙g ngi 20000 lng b筩 v� t蕀 竜 da n祔 th� th� n祇? /W12_sale_yes")
end

function W12_sale_yes()
	if (GetSex() == 0) then
		Talk(1,"","Huynh i ng l� ngi r閚g r穒! Sau n祔 khi Чi Kim c玭g ph� 頲 L﹎ An nh蕋 nh s� m阨 huynh n t� x�  u鑞g tr�! ")
	else
		Talk(1,"","C� nng th藅 l� ngi r閚g r穒!.Sau n祔 khi Чi Kim c玭g ph� 頲 L﹎ An nh蕋 nh s� m阨 c� nng n t� x�  u鑞g tr�! ")
	end
	x = GetTask(12)
	DelItem(231 + x)		-- 删除道具
	SetTask(12,GetGameTime()+7200)			-- 在线时间2小时后可以重复送信任务
	Earn(20000)
	Msg2Player("Ngi 甧m b鴆 m藅 h祄 c馻 D辌h quan, b竛 cho ngi Kim. Danh ti課g c馻 ngi  b� gi秏 xu鑞g ")
	AddNote("Ngi 甧m b鴆 m藅 h祄 c馻 D辌h quan, b竛 cho ngi Kim. Danh ti課g c馻 ngi  b� gi秏 xu鑞g ")
	i = GetRepute()
	if (i >= 20) then			-- 扣声望20点，不够20就扣光（小于10的话前面已设定不让做）
		AddRepute(-1 * 20)
	else
		AddRepute(-1 * i)
	end
end

function W12_sale_no()
	Talk(1,"","H� t蕋 ph秈 c� ch蕄 nh� v藋?Nh鱪g k� kh玭g hi觰 頲 th阨 th�, li謚 c� 輈h g�? T薾 trung b竜 qu鑓 kh玭g b籲g vinh hoa ph� qu� hng su鑤 i! Cho d� l� Nh筩 Phi c騨g nh nu鑤 h薾 � Phong Ba ёnh!")
end

function Uworld123_step1()
	AddEventItem(380)
	SetTask(123,30)
	DelItem(379)
	Msg2Player("Nh薾 頲 th� c馻 B筩h c玭g t� ")
end

function no()
end
