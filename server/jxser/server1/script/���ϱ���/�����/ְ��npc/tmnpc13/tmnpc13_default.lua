--description: 唐门江津村唐元 非任务对话
--author: yuanlan	
--date: 2003/3/12


function tmnpc13_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 56) then  
	Say("Tam s� huynh c� th� 甶 <color=Red>Hng Th駓 ng<color>, nghe n鉯 c� v礽 ngi b筺 c馻 huynh � .", 0)
else
	Say("Cha m� ta m蕋 s韒, nh� ngi c藆 nu玦 n蕁g n猲 ngi, c藆 l� ngi th﹏ thu閏 nh蕋 c馻 ta.", 0)
end

end;


