--两湖区 巴陵县 路人5游客对话
--巴陵县新手任务：古老太的宝贝
--suyu
-- Update: Dan_Deng(2003-08-10)

function main(sel)
	UTask_world19 = GetTask(47);
	if (UTask_world19 == 2) then
		if HaveItem(183) == 1 then
			Say("� � �! C竔 g� kia! B筺 tr� c� b鴆 th� ph竝 kia, c� th� nhng l筰 cho ta 頲 kh玭g, gi� c� c� th� thng lng, b鴆 th� ph竝 n祔 l� c馻 Ph筸 V╪ Ch輓h C玭g n鎖 ti課g y!",2,"B竛 /yes","Kh玭g b竛 /no")
		else
			Talk(1,"","!...Bao gi� th� ta m韎 c� th� t譵 頲 m閠 b鴆 th� ph竝 qu� nh� th� n祔?")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","чng ёnh h� n祔 c遪 頲 g鋓 l� 'V﹏ M閚g Tr筩h', ph輆 B綾 gi竝 Trng Giang, Nam gi竝 b鑞 con s玭g Tng, T�, Nguy猲, Phong, danh hi謚 l� 'B竧 B竎h L� чng ёnh H�'. ")
		elseif (i == 1) then
			Talk(1,"","чng ёnh h� r閚g m猲h m玭g, n骾 non ch鉻 v鉻, c 甶觤 l韓 nh蕋 l� ngo礽 h� c� h�, trong h� c� n骾,c� nhi襲 v� s�, lau s藋 um t飉, nc tr阨 m閠 s綾, h秈 ﹗ bay ln. Xu﹏ thu t� qu� lu玭 thay i. ")
		elseif (i == 2) then
			Talk(1,"","Du kh竎h?Ph筸 V╪ Ch輓h C玭g trong b礽 'Nh筩 dng l莡 k�' c� vi誸?'D� quan phu Ba L╪g th緉g tr筺g,t筰 чng ёnh nh蕋 h�. H祄 vi詎 s琻, Th玭 Trng Giang, h筼 h筼 thang thang, ho祅h v� t� nhai?tri襲 huy t辌h ﹎, kh� tng v筺 thi猲',чng ёnh h� n祔 x鴑g ng 頲 t玭 l� 'Thi猲 h�  nh蕋 чng'!")
		else
			Talk(1,"","!...Bao gi� th� ta m韎 c� th� t譵 頲 m閠 b鴆 th� ph竝 qu� nh� th� n祔?")
		end
	end
end;

function yes()
	i = 100 * (random(0,5)+10)
	Talk(2,"","N誹 ngi  ng � b竛 cho ta, th� kh玭g 頲 i � y! в xem ta c遪 bao nhi猽 ti襫, 5, 10, 15, 20... ","T鑤 r錳, a ngi "..i.."ng﹏ lng.")
	DelItem(183)
	Earn(i)
	SetTask(47, 3)
	Msg2Player("Лa b鴆 th� ph竝 cho ngi du kh竎h, l蕐 頲 "..i.."ng﹏ lng.")
	AddNote("Лa b鴆 th� ph竝 cho ngu阨 du kh竎h, ho祅 th祅h nhi謒 v�. ")
end;

function no()
	Talk(1,"","C� th� ngh� l筰 kh玭g? Ta th藅 l遪g r蕋 mu鑞 c� b鴆 th� ph竝 n祔. ")
end;
