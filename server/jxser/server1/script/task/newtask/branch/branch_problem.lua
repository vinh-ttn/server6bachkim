--宋金问答 （偶用了一种愚蠢的写法，哎）
--by xiaoyang
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function branch_songjinproblem()

	Describe("Di y l� c竎 c﹗ h醝 v� Chi課 trng T鑞g Kim. H穣 chu萵 b� tinh th莕 nh�! B総 u 頲 ch璦?<enter>",2,"B総 u!/branch_problemstart","в ta suy ngh� k� l筰 xem/no")
end

function branch_problemstart()
	Describe(DescLink_SongJinProblem.."1.Khi  bi課 th祅h NPC gi� c�, l祄 sao  bi誸 頲 t鋋  c莕 n v� c緈 頲 So竔 k�?<enter>"
	.."A: Sau khi 畂箃 頲 So竔 K�, � th玭g b竜 s� b竜 t鋋  m鬰 ti猽 c莕 n, ho芻 t飝 � nh蕄 v祇 c� hi謚  bi誸 頲 t鋋  m鬰 ti猽. C� hi謚 s� kh玭g m蕋 cho n khi n 頲 m鬰 ti猽, ti誴 t鬰 nh蕄 v祇 c� hi謚  c緈 So竔 K� v� m蕋 甶 C� hi謚.<enter>" --y
	.."B: Sau khi 畂箃 頲 So竔 K�, � th玭g b竜 s� b竜 t鋋  m鬰 ti猽 c莕 n, ho芻 t飝 � nh蕄 v祇 c� hi謚  bi誸 頲 t鋋  m鬰 ti猽, nh璶g c� hi謚 s� m蕋 甶. Sau khi n 頲 m鬰 ti猽, ti誴 t鬰 nh蕄 v祇 c� hi謚  c緈 So竔 K� v� m蕋 甶 C� hi謚.<enter>"
	.."C: Sau khi 畂箃 頲 So竔 K�, � th玭g b竜 s� b竜 t鋋  m鬰 ti猽 c莕 n, ho芻 t飝 � nh蕄 v祇 c� hi謚  bi誸 頲 t鋋  m鬰 ti猽. Sau khi n 頲 m鬰 ti猽, ti誴 t鬰 nh蕄 v祇 C� hi謚  c緈 So竔 K�. C� hi謚 b蕋 lu薾 s� d鬾g th� n祇 c騨g kh玭g m蕋 甶.<en"
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem1a","B/branch_problem1b","C/branch_problem1c")
end

function branch_problem1a()
		Describe(DescLink_SongJinProblem.."2.Th阨 gian b総 u T鑞g Kim i chi課 c馻 phi猲 b秐 m韎 l� m蕐 gi�?<enter>"
	.."A: B総 u b竜 danh t� 12:00 n 24:00  m鏸 ng祔. Th阨 gian b竜 danh l� 30 ph髏. Sau khi k誸 th骳 b竜 danh s� ch輓h th鴆 khai chi課, th阨 gian chi課 u l� 60 ph髏 <enter>"
	.."B: Kh玭g c� th阨 gian c� nh m� s� do h� th鑞g th玭g b竜.<enter>"
	.."C: M鏸 ng祔 b総 u b竜 danh v祇 l骳 11h:00, 13h:00; 15h:00; 17h:00; 19h:00; 21h:00. Th阨 gian b竜 danh l� 30 ph髏. B竜 danh k誸 th骳 ch輓h th鴆 khai chi課. Th阨 gian chi課 u 60 ph髏.<enter>" --y
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem2a","B/branch_problem2b","C/branch_problem2c")
	
end

function branch_problem1b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem1c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem2a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem2b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem2c()
		Describe(DescLink_SongJinProblem.."3. Sau khi v祇 khu v鵦 chi課 u, l祄 th� n祇  bi誸 頲 t譶h h譶h chi課 s� hi謓 t筰? <enter>"
	.."A:Ngi ch琲 c� th� t飝 l骳 s� d鬾g ph輒 ~ ( ph輒 n籱 tr猲 ph輒 tab)  ng ho芻 m� giao di謓 chi課 b竜, s� t譶h h譶h chi課 cu閏 hi謓 t筰.<enter>"--y
	.."B:Ngi ch琲 ch� c� th� bi誸 頲 t譶h h譶h chi課 s� trong � th玭g b竜 � g鉩 tr竔 b猲 di <enter>"
	.."C:Ngi ch琲 c� th� n Qu﹏ Nhu Quan � h藆 doanh  h醝 t譶h h譶h chi課 s�<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem3a","B/branch_problem3b","C/branch_problem3c")
end

function branch_problem3a()
	Describe(DescLink_SongJinProblem.."4. B竜 danh T鑞g Kim i chi課 phi猲 b秐 m韎 c蕁 nh鱪g 甶襲 ki謓 g�? <enter>"
	.."A: Kh玭g h筺 ch� ng c蕄, ch� c莕 ng ph� b竜 danh 3000 lng l� c� th� tham gia. Sau khi b竜 danh k誸 th骳, kh玭g th� b竜 danh n鱝.<enter>"
	.."B:Ngi ch琲 c莕 t 頲 ho芻 vt qua c蕄 40 v� ng ph� b竜 danh 3000 lng l� c� th� tham gia. Sau khi th阨 gian b竜 danh k誸 th骳 nh璶g s� ngi b竜 danh tham chi課 ch璦 n 400 ngi, v蒼 c� th� ti誴 t鬰 b竜 danh tham gia.<enter>"--y
	.."C:Ngi ch琲 c莕t 頲 ho芻 vt qua c蕄 40 v� ng ph� b竜 danh 3000 lng l� c� th� tham gia. Sau khi th阨 gian b竜 danh k誸 th骳, kh玭g th� b竜 danh n鱝.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem4a","B/branch_problem4b","C/branch_problem4c")
end

function branch_problem3b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem3c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem4a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem4b()
	Describe(DescLink_SongJinProblem.."5.Ngi ch琲 畂箃 頲 So竔 K�, bi課 th祅h qu﹏ c莔 c�, c竎 gi� tr� thu閏 t輓h c� thay i kh玭g?<enter>"
	.."A: C�. C竎 thu閏 t輓h c馻 ngi ch琲 nh� kh竛g t輓h v� l鵦 t蕁 c玭g u 頲 t╪g.<enter>"
	.."B: Kh玭g c� thay i g�.<enter>"
	.."C: C�. T鑓  ch箉 c馻 ngi ch琲 s� b� gi秏 theo, c竎 thu閏 t輓h kh竎 kh玭g thay i.<enter>" --y
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem5a","B/branch_problem5b","C/branch_problem5c")
end

function branch_problem4c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem5a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem5b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem5c()
	Describe(DescLink_SongJinProblem.."6. Khi tham gia T鑞g Kim i chi課, b� r韙 m筺g ph秈 l祄 th� n祇?<enter>"
	.."A: Sau khi b竜 danh b� r韙 m筺g gi鱝 ch鮪g ho芻 產ng tham chi課 b� r韙 m筺g, v祇 m筺g l筰 c� th� tr鵦 ti誴 甶 b竜 danh b籲g c竎h i tho筰 xin gia nh藀, kh玭g c蕁 ph秈 ng th猰 ph� b竜 danh.<enter>"--y
	.."B: Sau khi b竜 danh b� r韙 m筺g gi鱝 ch鮪g ho芻 產ng tham chi課 b� r韙 m筺g, v祇 m筺g l筰 c� th� tr鵦 ti誴 i tho筰 xin gia nh藀, nh璶g ph秈 ng th猰 ph� b竜 danh.<enter>"
	.."C: Sau khi b竜 danh b� r韙 m筺g gi鱝 ch鮪g ho芻 產ng tham chi課 b� r韙 m筺g, v祇 m筺g l筰 kh玭g th� gia nh藀 n鱝, ch� c� th� i ttr薾 sau.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem6a","B/branch_problem6b","C/branch_problem6c")
end

function branch_problem6a()
	Describe(DescLink_SongJinProblem.."7. Phi猲 b秐 T鑞g Kim m韎 c� t鎛 th蕋 khi t� vong hay kh玭g?<enter>"
	.."A: C� t鎛 th蕋 nh蕋 nh khi t� vong, s� m蕋 甶 m閠 s� 甶觤 kinh nghi謒 nh蕋 nh, sau khi t� vong 頲 chuy觧 n h藆 doanh c馻 chi課 trng, c� th� ti誴 t鬰 x玭g l猲 chi課 tuy課.<enter>"
	.."B: Kh玭g c� b蕋 k� t鎛 th蕋 n祇, sau khi t� vong 頲 chuy觧 n h藆 doanh chi課 trng, ngi ch琲 c� th� ti誴 t鬰 x玭g l猲 chi課 tuy課.<enter>"--y
	.."C: C�. Sau khi t� vong s� kh玭g th� gia nh藀 chi課 trng nh璶g s� kh玭g m蕋 甶觤 kinh nghi謒 v� ti襫.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem7a","B/branch_problem7b","C/branch_problem7c")
end

function branch_problem6b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem6c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem7a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem7b()
	Describe(DescLink_SongJinProblem.."8.C� th� mua C玭g c� T鑞g Kim chuy猲 d飊g kh玭g?<enter>"
	.."A: C� th�. Trc khi khai chi課, ngi ch琲 c� th�  d飊g 甶觤 t輈h l騳  i c玭g c� chuy猲 d鬾g t筰 Qu﹏ Nhu Quan.<enter>"--y
	.."B: C� th�. Ngi ch琲  c� th� n Qu﹏ Nhu Quan b蕋 c� l骳 n祇  mua c玭g c� T鑞g Kim chuy猲 d飊g, c莕 ph秈 t鑞 m閠 s� ti襫 nh蕋 nh.<enter>"
	.."C: Kh玭g th�. Ngi ch琲 ch� c� th� nh薾 頲 khi h� g鬰 m閠 NPC  trong chi課 trng.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem8a","B/branch_problem8b","C/branch_problem8c")
end

function branch_problem7c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem8a()
	Describe(DescLink_SongJinProblem.."9. Sau khi gia nh藀 chi課 trng c� th� b祔 b竛 v藅 ph萴 kh玭g?<enter>"
	.."A: Ngi ch琲 ch� c� th� b祔 b竛 �  甶觤 b竜 danh T鑞g Kim.<enter>"
	.."B: Ngi ch琲 kh玭g th� b祔 b竛 trong chi課 trng v� 甶觤 b竜 danh T鑞g Kim.<enter>"
	.."C: Ngi ch琲 c� th� b祔 b竛 trong chi課 trng v� 甶觤 b竜 danh T鑞g Kim.<enter>" --y
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem9a","B/branch_problem9b","C/branch_problem9c")	
end

function branch_problem8b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem8c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem9a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem9b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem9c()
	Describe(DescLink_SongJinProblem.."10. Trong chi課 trng T鑞g Kim, c� th� t飝 � i phe 頲 kh玭g? <enter>"
	.."A: Kh玭g 頲. Ngi ch琲  khi tham gia b竜 danh b猲 n祇, sau n祔 trong t蕋 c� c竎 chi課 d辌h ngi ch琲 nh蕋 thi誸 ph秈 tham gia b猲 .<enter>"
	.."B: Kh玭g! M鏸 ngi trong 1 l莕 chi課 d辌h ch� c� th� tham gia 1 phe. <enter>"
	.."C: Л頲! Tr薾 u tham gia phe n祔, tr薾 sau c� th� tham gia phe kia. <enter>"--y
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem10a","B/branch_problem10b","C/branch_problem10c")	
end

function branch_problem10a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem10b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem10c()
	Describe(DescLink_SongJinProblem.."11. L祄 th� n祇  v祇 chi課 trng T鑞g Kim?<enter>"
	.."A:  C� th� n 甶觤 b竜 danh phe T鑞g t筰 Tng Dng, 甶觤 b竜 danh phe Kim t筰 Chu Ti猲 Tr蕁 ho芻 s� d鬾g T鑞g Kim Chi猽 th�  tr鵦 ti誴 n 甶觤 b竜 danh.<enter>"--y
	.."B: дn Xa phu tr� m閠 kho秐 ti襫 nh蕋 nh  n 甶觤 b竜 danh.<enter>"
	.."C: дn v� binh th祅h m玭 n閜 5000 lng  tr鵦 ti誴 a n chi課 trng T鑞g Kim.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem11a","B/branch_problem11b","C/branch_problem11c")	
end

function branch_problem11a()
	Describe(DescLink_SongJinProblem.."12. L祄 th� n祇 c� 頲 T鑞g Kim Chi猽 th�?<enter>"
	.."A: Цnh qu竔 v藅 c� 頲.<enter>"
	.."B: C� th� n ti謒 t筽 h鉧  mua, m鏸 c竔 5000 lng.<enter>"--y
	.."C: C莕 d飊g v藅 ph萴 c bi謙  i.<enter>" 
	.."Trong 3 p 竛 b猲 tr猲, p 竛 n祇 ch輓h x竎?<enter>",
	3,"A/branch_problem12a","B/branch_problem12b","C/branch_problem12c")	
end

function branch_problem11b()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem11c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem12a()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problem12b()
	Describe("Ch骳 m鮪g b筺  p ch輓h x竎! B筺  qua 秈!",1,"K誸 th骳 i tho筰/branch_problemend")
end

function branch_problem12c()
	Talk(1,"","Xin l鏸! B筺  tr� l阨 sai! Th� l筰 nh�!")
	return
end

function branch_problemend()
	Uworld1053 = nt_getTask(1053)
	Uworld1057 = nt_getTask(1057)
	Uworld1061 = nt_getTask(1061)
	AddOwnExp(200000)
	if ( Uworld1053 == 30 ) then
		nt_setTask(1053,40)
	elseif ( Uworld1057 == 50 ) then
		nt_setTask(1057,60)
	elseif ( Uworld1061 == 50 ) then
		nt_setTask(1061,60)
	end
	Msg2Player("B筺  qua 秈 th祅h c玭g! C� th� nh薾 nhi謒 v� ti誴 theo!")
end