Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")

function main()
dofile("script/西南南区/大理府/大理府/npc/路人_龙追舞.lua")
	Uworld42 = GetTask(42)
	Uworld1057 = nt_getTask(1057)
		branch_longzhuiwu()
	if (Uworld42 == 50) then
		Talk(12,"aaa","Long Truy V�: Kh玭g c莕 ph秈 n鉯, ta bi誸 t蕋 c� m鋓 chuy謓. Ti觰 huynh , ba mi n╩ trc Trung Nguy謓  t鮪g c� b鑞 v� nh﹏, c竎 b籲g h鱱 kh竎h kh� x璶g l� 'V� l﹎ t� k�' ngi c� t鮪g nghe n鉯?","Ngi ch琲: t筰 h� xu蕋 o r蕋 mu閚 n猲 kh玭g r� l緈.","Long Truy V�: Giang h� r閚g l韓, kh玭g th� tr竎h ngi 頲. Trong b鑞 ngi ta b� nh蕋, l祄  long 畂箃 ph竝. C飊g 2 huynh  Чo Nh﹏ Qu� v� V� Danh Th莕 T╪g. L穙 Чi c馻 ch髇g ta l� Thng Lng Kh竎h, trong tay n緈 tuy謙 k�, l骳 蕐 kh玭g i th�.","Ngi ch琲: H鉧 ra ti襫 b鑙 t鮪g l� V� M鬰 Tng l躰h, th蕋 k輓h th蕋 k輓h","Long Truy V�: Kh玭g c� g� ph秈 ngng m�. Ho祅g Thng d飊g kim b礽 l謓h ti詎 chi猽 gi誸 nguy猲 so竔 t筰 Phong Ba ёnh, ch髇g ta b� T莕 Qu竔 th� h� truy s竧. L穙 i th秏 nh蕋, c� gia nh  b� gi誸 s筩h, ph秈 r琲 v祇 c秐h c� c m閠 m譶h.","Ngi ch琲: Th� s�  r� L穙 i c馻 huynh nh� th� n祇 r錳?","Long Truy V�:Hi謓 gi� l穙 i  n鱝 t豱h n鱝 甶猲, b総 gi� con ngi kh竎 xem l� con m譶h.Ngi kh玭g bi誸 l蕐 c秈 n衜 h緉, h緉 c騨g kh玭g n�. Ngi kh玭g gi鑞g ngi.�","Ngi ch琲: H糿 l� a tr� b� Thng L筺g Kh竎h b総 甶?","Long Truy V�: ng. в k� ni謒 sinh th莕 90 c馻 m譶h, h緉  b総 m閠 v礽 a b� l祄 con ch竨, kh玭g c� � nh l祄 h筰 ch髇g. Ngi 甶 t譵 ngi, kh玭g 頲 l祄 h筰 l穙 i ta.","Ngi ch琲: Long i hi謕 n鉯 a, v� c玭g c馻 t筰 h� sao so s竛h 頲 v韎 Thng L筺g Kh竎h ti襫 b鑙.","Long Truy V�: C竎 h� qu� khi猰 t鑞, ta th蕐 ngi r� r祅g l� m閠 cao th�. L穙 i h玬  v� thng t﹎ qu�  d蒼 n t萿 h醓 nh藀 ma, c玭g l鵦 suy gi秏. Huynh 蕐 b﹜ gi� 產ng 萵 c� � 觤 Thng S琻. Ngi c� th� 甶 n .","Ngi ch琲: 產 t� ti襫 b鑙.")
		SetTask(42,60)
		AddNote("Ti誴 nh薾 nhi謒 v�: n 觤 Thng S琻 t譵 Thng Lng Kh竎h th╩ d� tin t鴆 a b� m蕋 t輈h.")
		Msg2Player("Ti誴 nh薾 nhi謒 v�: n 觤 Thng S琻 t譵 Thng Lng Kh竎h th╩ d� tin t鴆 a b� m蕋 t輈h.")
	elseif (Uworld42 >= 60) then
		Talk(1,"","Long Truy V�: Ngi kh玭g l祄 h筰 L穙 Чi c馻 ta ch�?")
	else
		Talk(1,"","ng c� su鑤 ng祔 phi襫 ta.")
	
	end
end



function aaa()
Talk(12,"","Long Truy V�:...Hi謓 gi� l穙 i  n鱝 t豱h n鱝 甶猲, b総 gi� con n輙 xem l� con ch竨 m譶h...Ngi kh玭g bi誸 l蕐 c秈 n衜 h緉, h緉 c騨g kh玭g n�. Ngi kh玭g gi鑞g ngi..�","Ngi ch琲: H糿 l� a tr� b� Thng L筺g Kh竎h b総 甶?","Long Truy V�: ng. в k� ni謒 sinh th莕 90 c馻 m譶h, h緉  b総 m閠 v礽 a b� l祄 con ch竨, kh玭g c� � nh l祄 h筰 ch髇g. Ngi 甶 t譵 ngi, kh玭g 頲 l祄 h筰 l穙 i ta.","Ngi ch琲: Long i hi謕 n鉯 a, v� c玭g c馻 t筰 h� sao so s竛h 頲 v韎 Thng L筺g Kh竎h ti襫 b鑙.","Long Truy V�: C竎 h� qu� khi猰 t鑞, ta th蕐 ngi r� r祅g l� m閠 cao th�. L穙 i h玬  v� thng t﹎ qu�  d蒼 n t萿 h醓 nh藀 ma, c玭g l鵦 suy gi秏. Huynh 蕐 b﹜ gi� 產ng 萵 c� � 觤 Thng S琻. Ngi c� th� 甶 n .","Ngi ch琲: 產 t� ti襫 b鑙.")
end

