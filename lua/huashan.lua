-------华山
hstongji_total = 0
hstongjilasttime_total=0
hstongji_1 = 0
hstongji_2 = 0
hstongji_zh = 0 --任务时间总和
hstongji_lq = 0 --hs领取次数
hstongji_finish = 0 --hs任务成功次数
hstongji_fangqi = 0 --hs失败次数
hstongji_pingjun = 0 --平均时间 
hstongji_thistime = 0  --hs 本次战斗时间 
hstongjilasttime_l = 0 -- 累计hs2战斗时间
hstongjilasttime_l_2 = 0 --本次hs战斗时间
hstongjilasttime_l_1 = 0 --累计hs1战斗时间
hscheckhead=0
tosld=0
tocaidi=0
tomr=0
toyzw=0
tomtl=0
hstoszgf=0
hstohssd=0
hstoxct=0
hs2job=0
hs_egg_where=''
hs_egg_find=0
hs_egg_auto=tonumber(GetVariable('egg_auto'))
job.ori_where=nil

local huashanArea1={
	["菜地"]="华山村",
	["杂货铺"]="华山村",
	["民房"]="华山村",
	["酒肆"]="华山村",
	["铁匠铺"]="华山村",
	["东村口"]="华山村",
	["碎石路"]="华山村",
	["玄坛庙"]="华山村",
	["苍龙岭"]="华山",
	["侧廊"]="华山",
	["瀑布"]="华山",
	["朝阳峰"]="华山",
	["镇岳宫"]="华山",
	["猢狲愁"]="华山",
	["莎萝坪"]="华山",
	["千尺幢"]="华山",
	["百尺峡"]="华山",
	["青柯坪"]="华山",
	["舍身崖"]="华山",
	["松树林"]="华山",
	["玉女峰"]="华山",
	["玉泉院"]="华山",
	["思过崖"]="华山",
	["药房"]="华山",
	["后堂"]="华山",
	["山涧"]="华山",
	["小溪"]="华山",
	["祭坛"]="华山",
	["思过崖洞口"]="华山",
	["山路"]="华山",
	["石屋"]="华山",
	["树林"]="华山",
	["华山脚下"]="华山",
	["山洪瀑布"]="华山",
	["练武场"]="华山",
	["饭厅"]="华山",
	["书房"]="华山",
	["饭厅"]="华山",
	["剑房"]="华山",
	["前厅"]="华山",
	["台阶"]="华山",
	["正气堂"]="华山",
	["寝室"]="华山",
	["休息室"]="华山",
	["老君沟"]="华山",
	["小山路"]="华山",
}
job.list["huashan"] ="华山惩恶扬善"
function huashan()
    SetSpeedWalkDelay(speed_walk_delay)
    wdgostart=0
    hsjob2=0
	flag.searchArea=nil
	flag.searchRooms=nil
	job.ori_where=nil
    dis_all()
    huashan_trigger()
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	if hs_egg_auto == 1 then
        EnableTriggerGroup("huashan_egg",true)	
    else
	    EnableTriggerGroup("huashan_egg",false)	
    end  	
    job.name='huashan'
    job.target='任务目标'
    return huashan_start()
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["huashan"] = "huashanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["huashan"] = "huashanFindFail"
function huashanFindAgain()
   return check_busy(hsfindagain)    
end
function hsfindagain()
    SetSpeedWalkDelay(speed_walk_delay)
    print('hsfindagain.....flag.times:'..flag.times)
    EnableTriggerGroup("huashan_find",true)
    if flag.times==3 and dest.area=='襄阳城' and dest.room=='山间空地' then
		return go(huashanFindAct,'襄阳郊外','瀑布')
	end
	if flag.times==2 and dest.area=='明教' and (dest.room=="紫杉林" or string.find(dest.room,"字门")) then
		return go(huashanFindAct,'明教','练武场')
	end
	if flag.times==3 and job.area=='扬州城' and job.room=='南门' then
		return go(huashanFindAct,'扬州城','长江南岸')
	end
	if flag.times==3 and job.area=='兰州城' and job.room=='大道' then
		return go(huashanFindAct,'兰州城','永登')
	end
	if flag.times==3 and job.area=='铁掌山' and job.room=='山路' then
		return go(huashanFindAct,'铁掌山','中指峰')
	end
	if flag.times==3 and job.area=='杭州城' and job.room=='青石大道' then
		return go(huashanFindAct,'杭州城','飞来峰')
	end
	if flag.times==3 and job.area=='苗疆' and job.room=='山路' then
		return go(huashanFindAct,'苗疆','山洞')
	end
	if flag.times==3 and job.area=='杭州城' and job.room=='山路' then
		return go(huashanFindAct,'杭州城','雷峰塔')
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=='石板路' then
		return go(huashanFindAct,'嵩山少林','法堂')
	end
	if flag.times==3 and job.area=='兰州城' and job.room=='西城门' then
		return go(huashanFindAct,'兰州城','永登')
	end
	
	if flag.times==3 and job.area=='嵩山少林' and job.room=="罗汉堂" then
		return go(huashanFindAct,'嵩山少林','罗汉堂五部')
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=="般若堂" then
		return go(huashanFindAct,'嵩山少林','般若堂五部')
	end
	
	if flag.times==3 and job.area=='长乐帮'  then
	    flag.searchArea={[8]='city/',[300]='changle/'}
		return go(huashanFindAct,'长乐帮','大门')
	end
	
	if flag.times==3 and job.area=='神龙岛'  then
	    flag.searchArea={[300]='sld/'}
		--SetSpeedWalkDelay(30)
		return go(huashanFindAct,'神龙岛','渡口')
	end
	
	if flag.times==3 and job.area=='莆田少林'  then
	     flag.searchArea={[300]='putian/'}
		 --SetSpeedWalkDelay(30)
		return go(huashanFindAct,'莆田少林','山门')
	end
	
	if flag.times==3 and job.area=='昆仑山'  then
	    flag.searchArea={[300]='kunlun/',[301]='fairyland/'}
		--SetSpeedWalkDelay(30)
		return go(huashanFindAct,'昆仑山','镇远桥')
	end
	
	if flag.times==3 and job.area=='曼佗罗山庄' then
	    flag.searchArea={[300]='mtl/'}
		return go(huashanFindAct,'曼佗罗山庄','云锦楼')
	end
	
  go(huashanFindAct,job.area,job.room)
end

function huashanFindFail()
  return check_busy(hsFindFail)
end
function hsFindFail()
    SetSpeedWalkDelay(speed_walk_delay)
    go(huashan_shibai,'华山','正气堂')
end
function huashan_start()
	map.rooms["village/zhongxin"].ways["northwest"]="village/caidi"
    map.rooms["village/zhongxin"].ways["northeast"]="village/caidi"
	DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
    DeleteTriggerGroup("huashan_find")
      flag.idle = nil
	 return check_busy(hs_start)
end
function hs_start()
go(hsaskjob,'华山','正气堂')
end
function hsaskjob()
    if newbie==1 then return zhunbeineili(job_huashan) else return job_huashan() end
end
function job_huashan()
    EnableTriggerGroup("huashan_ask",true)
	 exe('ask yue buqun about job')
      create_timer_s('walkWait4',3.0,'huashan_ask_test')
end
huashan_ask_test=function()
    exe('ask yue buqun about job')       
end

function huashan_trigger()
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    create_trigger_t('huashan_ask1',"^(> )*你向岳不群打听有关『job』的消息。$",'','huashan_ask')
    create_trigger_t('huashan_ask2',"^(> )*这里没有这个人。$",'','huashan_nobody')
    SetTriggerOption("huashan_ask1","group","huashan_ask")
    SetTriggerOption("huashan_ask2","group","huashan_ask")
    EnableTriggerGroup("huashan_ask",false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t('huashan_accept1',"^(> )*岳不群说道：「你不能光说呀，倒是做出点成绩给我看看！",'','huashan_shibai')
    create_trigger_t('huashan_accept2',"^(> )*岳不群说道：「你现在正忙着做其他任务呢！",'','huashan_busy')
    create_trigger_t('huashan_accept3',"^(> )*岳不群说道：「现在没有听说有恶人为害百姓",'','huashan_fangqi')
    create_trigger_t('huashan_accept4',"^(> )*岳不群给了你一块令牌。$",'','huashan_npc')
	create_trigger_t('huashan_accept5',"^(> )*岳不群对你说道：你还是先去思过崖面壁思过去吧。",'','huashanjjQuest')
	create_trigger_t('huashan_accept6',"^(> )*岳不群说道：「现在没有听说有恶人为害百姓，你自己去修习武功去吧！」",'','huashan_fangqi')
	SetTriggerOption("huashan_accept1","group","huashan_accept")
    SetTriggerOption("huashan_accept2","group","huashan_accept")
    SetTriggerOption("huashan_accept3","group","huashan_accept")
	SetTriggerOption("huashan_accept4","group","huashan_accept")
	SetTriggerOption("huashan_accept5","group","huashan_accept")
    SetTriggerOption("huashan_accept6","group","huashan_accept")
    EnableTriggerGroup("huashan_accept",false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t('huashan_npc1',"^(> )*(冷不防|突然|猛地|忽然|冷不丁)从树林\\D*你的令牌，向(\\D*)(处|方向)\\D*逃去。$",'','huashan_where')
    create_trigger_t('huashan_npc2',"^(> )*你一把抓向蒙面人试图抢回令牌，但被蒙面人敏捷得躲了过去，你顺手扯下蒙面人的面罩，发现原来是曾经名震江湖的(\\D*)。",'','huashan_find')
    create_trigger_t('huashan_npc3','^(> )*你把 "hsjob" 设定为 "闲逛中" 成功完成。','','huashan_npc_goon')
    SetTriggerOption("huashan_npc1","group","huashan_npc")
    SetTriggerOption("huashan_npc2","group","huashan_npc")
    SetTriggerOption("huashan_npc3","group","huashan_npc")
    EnableTriggerGroup("huashan_npc",false)
	DeleteTriggerGroup("huashanQuest")
	create_trigger_t('huashanQuest1',"^(> )*岳不群说道：「".. score.name .."你杀了不少恶人，未免杀气过重不如上思过崖面壁忏悔吧",'','huashanDgjj')
	SetTriggerOption("huashanQuest1","group","huashanQuest")
	EnableTriggerGroup("huashanQuest",false)
	
	DeleteTriggerGroup("huashan_egg")
	create_trigger_t('huashan_egg1','^(> )*\\s*(\\D*)\\s*-\\s*(north|east|south|west|northup|eastup|southup|westup|northdown|eastdown|southdown|westdown|northeast|southeast|northwest|southwest|enter|out)','','huashan_egg_ss')
	create_trigger_t('huashan_egg2','金蛋\\(Gold','','huashan_egg_find')
	SetTriggerOption("huashan_egg1","group","huashan_egg")
	SetTriggerOption("huashan_egg2","group","huashan_egg")
	--EnableTriggerGroup("huashan_egg",false)
	hs_egg_where=''
    hs_egg_find=0
	SetVariable('egg_dizi','no_find')
end

function huashan_egg_ss(n,l,w)
    print('huashan_egg_ss....')
    hs_egg_where=Trim(w[2])
end

function huashan_egg_find()
    print('huashan_egg_find.................')
    EnableTriggerGroup("huashan_egg",false)
    hs_egg_find=1
	SetVariable('egg_dizi',hs_egg_where)
end

function huashan_triggerDel()
	DeleteTriggerGroup("all_fight")
    DeleteTriggerGroup("huashan_find")
    DeleteTriggerGroup("huashan_ask")
    DeleteTriggerGroup("huashan_accept")
    DeleteTriggerGroup("huashan_npc")
    DeleteTriggerGroup("huashan_fight")
    DeleteTriggerGroup("huashan_cut")
    DeleteTriggerGroup("huashan_yls")
    DeleteTriggerGroup("huashan_yls_ask")
    DeleteTriggerGroup("huashan_over")
	DeleteTriggerGroup("huashanQuest")
end
function huashan_ask()
     dis_all()
	 hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end 
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("huashan_ask",false)
    EnableTriggerGroup("huashan_accept",true)
end
function huashan_nobody()
    print('huashan_nobody.........')
    EnableTriggerGroup("huashan_ask",false)
    return huashan_start()
end
function huashan_shibai()
    EnableTimer('walkWait4',false)
    EnableTriggerGroup("huashan_accept",false)
	kezhiwugongclose()
    return check_busy(huashan_shibai_b)
end
function huashan_shibai_b()
    EnableTimer('walkWait4',false)
	flag.idle = nil
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
    huashan_triggerDel()
    Execute('ask yue buqun about 失败')
	if job.where~=nil and string.find(job.where,"侠客岛") then
		mjlujingLog("侠客岛")
	end
    hstongji_fangqi=hstongji_fangqi+1
    messageShow('华山任务：任务失败!华山失败['..hstongji_fangqi..']次。')
    --return check_halt(check_food)
	return check_halt(check_xuexi)
end
faintFunc = faintFunc or {}
faintFunc["huashan"] = "huashanFindAgain"
function huashan_fangqi()
    EnableTimer('walkWait4',false)
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
    huashan_triggerDel()
    job.last="huashan"
    hsjob2=0
    exe('wield '.. Bag[weapon.first].fullid)
    --return check_halt(check_food)
	return check_halt(check_xuexi)
end
function huashan_busy()  
    EnableTimer('walkWait4',false)
    EnableTriggerGroup("huashan_accept",false)
	locate_finish='huashan_busy_dazuo'
    return check_busy(locate)
end
function huashan_busy_dazuo()
   locate_finish=0
    exe('#3s')
    return prepare_lianxi(check_heal)
end
function huashan_npc()
    EnableTimer('walkWait4',false)
    exe('nick 华山任务中')
    job.time.b=os.time()
	EnableTriggerGroup("huashan_accept",false)
	job.last="huashan"
    if hsjob2<1 then
                hstongji_lq=hstongji_lq+1
		messageShow('华山任务：开始任务。')
		--locate_finish='huashan_npc_go'
		--return check_busy(locate,0.2)
		--return check_busy(locate)
		return huashan_npc_go()
	else
	   --locate_finish='huashan_npc_go2'
		--return check_busy(locate,0.2)
		--return check_busy(locate)
		return huashan_npc_go2() 
	end
	
end
function huashan_npc_go()
   locate_finish=0
    go(huashan_npc_get,'华山','山脚下','huashan/zhengqi')
end
function huashan_npc_go2()
   locate_finish=0
    go(huashan_npc_get,'华山','山脚下','huashan/jitan')
end
function huashan_npc_get()
    EnableTriggerGroup("huashan_npc",true)
    exe('unset wimpy;set wimpycmd pfmpfm\\hp')
    exe('s')
    return check_bei(huashan_npc_goon)
end
function huashan_npc_goon()
    exe('n;e;e')
    locate()
    return check_busy(huashan_ssl,1)
end
function huashan_ssl()
    if locl.room=="石屋" or locl.room=="玉泉院" then
       return check_bei(huashan_npc_ssl)
    else
       return check_bei(huashan_npc_goon)
    end
end
function huashan_npc_ssl()
    huashan_npc_goon() 
    exe('w;s;s')
       
end
huashan_where=function(n,l,w)
    job.where=tostring(w[3])
	--print("1"..job.where)
end
--jiaosha_kill=0
huashan_find=function(n,l,w)
    --jiaosha_kill=0
    local flag_huashan=0
    dis_all()
	 hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end
    job.target=tostring(w[2])
	job.killer={}
	job.killer[job.target]=true
	DeleteTriggerGroup("huashan_find")
    create_trigger_t('huashan_find1','^( )*'..job.target..'\\((\\D*)\\)','','huashan_fight')
    create_trigger_t('huashan_find2','看起来'..job.target..'想杀死你！','','huashan_debug_fight')
    create_trigger_t('huashan_find3','^(> )*采花大盗正盯着你看，不知道打些什么主意。','','huashan_dadao')
    create_trigger_t('huashan_find4','^(> )*你对着'..job.target..'大喝一声：「臭贼！','','huashan_fight_kill')
	--特别添加防止hs npc 不主动拦人
	--create_trigger_t('huashan_find5','^(> )*这里没有 (\\D*)','','huashan_fight_lost')

       
	--SetTriggerOption("huashan_find4","sequence",1)
	
    SetTriggerOption("huashan_find1","group","huashan_find")
    SetTriggerOption("huashan_find2","group","huashan_find")
    SetTriggerOption("huashan_find3","group","huashan_find")
	SetTriggerOption("huashan_find4","group","huashan_find")
	--SetTriggerOption("huashan_find5","group","huashan_find")
	
	--[[
    if string.find(job.where,'神龙岛') then
      tosld=tosld+1
    end
    if string.find(job.where,'菜地') then
      tocaidi=tocaidi+1
    end
    if string.find(job.where,'姑苏慕容') then
       tomr=tomr+1
    end
    if string.find(job.where,'燕子坞') then
      toyzw=toyzw+1
    end
    if string.find(job.where,'曼佗罗山庄') then
      tomtl=tomtl+1
    end
    if string.find(job.where,'苏州城闺房') then
      hstoszgf=hstoszgf+1
    end
    if string.find(job.where,'华山石洞') then
       hstohssd=hstohssd+1
    end
    if string.find(job.where,'嵩山少林心禅堂') then
       hstoxct=hstoxct+1
    end
	]]--
	
---if string.find(job.where,'地下黑拳市') or string.find(job.where,'曼佗罗山庄') or string.find(job.where,'武当山小院') 
    --if string.find(job.where,'地下黑拳市') or string.find(job.where,'曼佗罗山庄') or string.find(job.where,'燕子坞') then
	if string.find(job.where,'地下黑拳市')   then
       messageShow('华山任务②：任务地点【'..job.where..'】不可到达，任务放弃。')
       return check_halt(huashanFindFail)
    end 
	
	local check_pot_point = check_pot_test()
	
	if string.find(job.where,'曼佗罗山庄') and check_pot_point==1  then
       messageShow('华山任务②：任务地点【'..job.where..'】 路程太远并且符合领悟学习条件，任务放弃。')
       return check_halt(huashanFindFail)
    end 

	
	if (string.find(job.where,"伊犁城铁铺") or string.find(job.where,"伊犁城客栈")  or string.find(job.where,"伊犁城商铺")  or string.find(job.where,"伊犁城巴依家院")  or string.find(job.where,"伊犁城城中心")) then
		job.ori_where=job.where
		job.where= "伊犁城南城门"
	end
	
	if string.find(job.where,"苏州城闺房") then
		job.where= "苏州城翰林府院"
	end
    	
	--print("2"..job.where)
	if huashanArea1[job.where] then
		job.room=job.where
		job.area=huashanArea1[job.where] 
	else
		job.room,job.area=getAddr(job.where)
	end	
	dest.room=job.room
	dest.area=job.area
    
    if not job.room then
		messageShow('华山任务：任务地点【'..job.where..'】不可到达，任务放弃。',"Plum")
		return check_halt(huashanFindFail)
	end	
	
	if not path_cal() then 
	   messageShow('华山任务：任务地点【'..job.where..'】无法推算路径，任务放弃',"Plum")
	  return check_halt(huashanFindFail)
	end 
	
	--[[if not job.room or not path_cal() then
		messageShow('华山任务：任务地点【'..job.where..'】不可到达，任务放弃。',"Plum")
		return check_halt(huashanFindFail)
	end
	]]--
	
	print(dest.room,dest.area,job.room,job.area)
	messageShow('华山任务：追杀逃跑到【'..job.where..'】的【'..job.target..'】。')
	locl.room='树林'
	--maixf 2020.1.30 modify
    --if job.room=='侧廊' then flag.times=2 end
	flag.times=1
	flag.hs_find_lost=0
	return check_busy(hsFindAct)
end
function hsFindAct()
go(huashanFindAct,job.area,job.room,"huashan/shulin")
end

function hsFindAct_test()
job.name='huashan'
go(huashanFindAct,'星宿海','山洞',"huashan/shulin")
end


function huashan_debug_fight()
   print('huashan_debug_fight................')
   EnableTrigger("huashan_find1",true)
   exe('look')
  --exe('kill '..job.id)
    
    --exe('unset no_kill_ap;yield no')
    --exe('follow '..job.id)
	--exe('kick '..job.id)
    --exe('kill '..job.id)
    --exe('set wimpycmd pfmpfm\\hp')
	--exe('set wimpy 100')
	--exe('look '..job.id)
  
  
end
function huashanFindAct()
    EnableTriggerGroup("huashan_find",true)
    job.flag()
    exe('look')
	wipe_kill=1
    return find()
end
function huashanFindKill()
    dis_all()
    EnableTrigger("huashan_find1",true)
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end
    exe('look')
end
huashan_dadao=function()
    dis_all()
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end
    exe('yes')
    return go(huashanFindAct,job.area,job.room)
end
heqi_count=0

function huashan_fight_kill()
   print('huashan_fight_kill....')
   EnableTrigger("huashan_find2",false)
   EnableTrigger("huashan_find4",false)
   --jiaosha_kill=1
   
end

function huashan_fight_lost(n,l,w)
   print('huashan_fight_lost.......................')
   --EnableTrigger("huashan_find5",false)
   flag.find=0
   local npcid = string.lower(w[2])
   if job.id == npcid then
       flag.hs_find_lost=1
   end
   
    SetSpeedWalkDelay(speed_walk_delay)
    print('hsfindagain.....flag.times:'..flag.times)
    EnableTriggerGroup("huashan_find",true)   	
    return go(huashanFindAct,job.area,job.room)
	
end

huashan_fight=function(n,l,w)
    print('huashan_fight...')
	flag.find=1
    DiscardQueue()
    EnableTrigger("huashan_find2",false)
    job.id=string.lower(w[2])
	job.killer[job.target]=job.id
	
	wait.make(function()
	    while true do
		    exe('unset no_kill_ap;yield no')
            exe('follow '..job.id)
	        exe('kick '..job.id)
            exe('kill '..job.id)
            exe('set wimpycmd pfmpfm\\hp')
	        exe('set wimpy 100')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*(你向梦中的情人抱去，结果落了个空|这里没有 (\\D*))',1)
			if l~=nil then 
			    if string.find(l,'梦中的情人抱') then 
                    return huashan_fight_kill_end()
                else 
                    return huashan_fight_lost(nil,l,w)
                end 				
			end
		end
		
	end)
    	
end

function huashan_fight_kill_end()
    dis_all()
	locate_finish=0
	--EnableTrigger("huashan_find5",true)
	
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end
	
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	 if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	 end
	
	EnableTrigger("huashan_find4",true)
	heqi_count=0
    kezhiwugong()
	kezhiwugongAddTarget(job.target,job.id)	
    fight.time.b=os.time()
    EnableTrigger("hpheqi1",true)
	DeleteTriggerGroup("huashan_fight")
    create_trigger_t('huashan_fight1','^(> )*'..job.target..'「啪」的一声倒在地上','','huashan_getget')
    create_trigger_t('huashan_fight2','^(> )*'..job.target..'神志迷糊，脚下一个不稳，倒在地上昏了过去。','','huashan_faint')
    create_trigger_t('huashan_fight3','^(> )*'..job.target..'匆匆离开。','','huashanFindFail')
    create_trigger_t('huashan_fight4','^(> )*这里没有 '..job.id..'。','','huashanFindAct')
	create_trigger_t('huashan_fight5',"^(他|她)穿戴着：$",'','npcWeapon')
	 create_trigger_t('huashan_fight6',"^(他|她)装备着：$",'','npcWeapon')
	 
    SetTriggerOption("huashan_fight1","group","huashan_fight") 
    SetTriggerOption("huashan_fight2","group","huashan_fight")
    SetTriggerOption("huashan_fight3","group","huashan_fight") 
	SetTriggerOption("huashan_fight4","group","huashan_fight") 
	SetTriggerOption("huashan_fight5","group","huashan_fight")
    SetTriggerOption("huashan_fight6","group","huashan_fight")
end

corpse_idx = 1
function huashan_getget()
    print('huashan_getget....')
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
	DeleteTriggerGroup("huashan_getnpc")
	hsgettime = 0
	create_trigger_t("huashan_getnpc1", "^(> )*你从(\\D*)的尸体身上搜出一块令牌。", "", "huashan_backgogo")
	--create_trigger_t("huashan_getnpc2", "^(> )*你将(\\D*)的尸体扶了起来背在背上。", "", "huashan_get_con")
	create_trigger_t("huashan_getnpc2", "^(> )*你将(\\D*)的尸体扶了起来背在背上。", "", "huashan_get_corpse_test")
    create_trigger_t("huashan_getnpc3", "^(> )*光天化日的想抢劫啊", "", "huashan_getagain")
    SetTriggerOption("huashan_getnpc1", "group", "huashan_getnpc")
	SetTriggerOption("huashan_getnpc2", "group", "huashan_getnpc")
	SetTriggerOption("huashan_getnpc3", "group", "huashan_getnpc")
	EnableTriggerGroup("huashan_getnpc",true)

    kezhiwugongclose()
	
	corpse_idx = 1
	
	if string.find(job.where,'绝情谷') or string.find(job.where,'姑苏慕容') or string.find(job.where,'燕子坞') or string.find(job.where,'曼佗罗山庄') then
	    hscheckhead = 1
        return check_busy(huashan_cut,0.5)
	else
	    --exe('get corpse '..corpse_idx)
		exe('get corpse')
        return    
    end

end
function huashan_get_lingpai()
print('huashan_get_lingpai....')
EnableTrigger("huashan_getnpc",true)
exe("get ling pai from corpse")
----for i = 1, 4 do
--print('i='..i)
--exe("get ling pai from corpse " .. i)
--end
end

function huashan_getagain()
    
    if hsgettime < 4 then
        hsgettime = hsgettime + 1
			
        wait.make(function()
                wait.time(0.5)
                EnableTriggerGroup("huashan_getnpc", true)
                return hs_getagain()
            end
        )
    else
        return check_busy(huashan_cut)
    end
end
function hs_getagain()
       print('hs_getagain....')
       for i = 1, 4 do
			exe("get corpse "..i)  
            --exe("get ling pai from corpse " .. i)
        end
    end   
huashan_faint=function()
    exe('kill '..job.id)
end

function huashan_get_corpse_test(n, l, w)
    print('huashan_get_corpse_test....')
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
	corpse_name = tostring(w[2])
	
	if corpse_name ~= job.target then 
	   check_busy(qiehuan_corpse)
	else 
	   return huashan_get_corpse_finish()  
    end 	
	
end 

function qiehuan_corpse()
   print('qiehuan_corpse....')
   exe('drop corpse')
   corpse_idx = corpse_idx + 1
   --exe('get corpse '..corpse_idx)
   return check_busy(qiehuan_corpse_get)
end 

function qiehuan_corpse_get()
    exe('get corpse '..corpse_idx)
end 

function huashan_get_corpse_finish()
    road.id=nil
	job.killer={}
    fight.time.e=os.time()
    fight.time.over=fight.time.e-fight.time.b
	hstongji_thistime=fight.time.over
	if hsjob2==1 then
	   --开始统计次数
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l=hstongjilasttime_l+hstongjilasttime_l_2
	   hstongji_2=hstongji_2+1
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l/hstongji_2)
	   
	   messageShowT('华山任务：【'..job.target..'】【'..job.id..'】。使用武功【'..npc_skill..'】，武功属性【'..npc_val..'】。')
	   messageShowT('华山任务：战斗用时:【'..fight.time.over..'】秒,搞定蒙面人：【'..job.target..'】,华山2共计【'..hstongji_2..'】次.平均用时【'..hstongji_pingjun..'】秒','aqua')
    end
	
	EnableTriggerGroup("huashan_npc", false)
    EnableTriggerGroup("huashan_cut", false)
    hscheckhead = 0
    return check_busy(huashan_get_lingpai)
	

end 



function huashan_get_con(n, l, w)
    print('huashan_get_con....')
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
	corpse_name = w[2]
	print('get corpse...'..corpse_name)
	
	--[[if  corpse_name ~= job.target then
	   exe('drop corpse')
	   
        	
	end]]--
	
	road.id=nil
	job.killer={}
    fight.time.e=os.time()
    fight.time.over=fight.time.e-fight.time.b
	hstongji_thistime=fight.time.over
	if hsjob2==1 then
	   --开始统计次数
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l=hstongjilasttime_l+hstongjilasttime_l_2
	   hstongji_2=hstongji_2+1
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l/hstongji_2)
	   
	   messageShowT('华山任务：【'..job.target..'】【'..job.id..'】。使用武功【'..npc_skill..'】，武功属性【'..npc_val..'】。')
	   messageShowT('华山任务：战斗用时:【'..fight.time.over..'】秒,搞定蒙面人：【'..job.target..'】,华山2共计【'..hstongji_2..'】次.平均用时【'..hstongji_pingjun..'】秒','aqua')
    end
	 if job.target == tostring(w[2]) then
        EnableTriggerGroup("huashan_npc", false)
        EnableTriggerGroup("huashan_cut", false)
        hscheckhead = 0
        return check_busy(huashan_get_lingpai)
    else
         exe('drop corpse')
        return check_busy(huashan_getagain)
    end
end

function huashan_backgogo()
    print('huashan_backgogo...........')
    EnableTriggerGroup("huashan_getnpc", false)    
    weapon_unwield()
	dis_all()
	flag.hs_find_lost=0
	hs_egg_auto=tonumber(GetVariable('egg_auto'))
	if hs_egg_find == 0 and hs_egg_auto==1 then 
	    EnableTriggerGroup('huashan_egg',true)
	end 
	
	local egg_auto = tonumber(GetVariable('egg_auto'))
    local egg_num = tonumber(GetVariable('egg_num'))
    local egg_dizi = Trim(GetVariable('egg_dizi'))
	 
	if egg_auto == 1 and egg_num<10 and egg_dizi ~= 'no_find' and hs_egg_find==1 then 
        print('check_job... egg ...........................')
        egg()
	    local egg_area = huashan_jindan_area(egg_dizi)
	    return egg_go(egg_area .. egg_dizi)
    end 
		 
    bqcheck()
	locate_finish=0
	return check_busy(huashan_fanhui)
end

function huashan_jindan_area(jindan_room_name)
    
	local jindan_rooms = {}
	local jindan_citys = {}
	
	jindan_rooms = getRooms(jindan_room_name)
	   
	   if countTab(jindan_rooms)==1 then 
	     ---如果只有一个rooms，那么可以直接确定city
	      local jindan_city_name = getCity(jindan_rooms[1])
          return jindan_city_name
	   else
	      local cur_city = ''
	      for k,v in pairs(jindan_rooms) do
			cur_city = getCity(v)
			if cur_city ~= '' and jindan_citys[cur_city] == nil then 
			      jindan_citys[cur_city] = 1
			end 
	      end
		  --多个房间也能确定是一个城市，则更新
          if countTab(jindan_citys) == 1 and cur_city ~= '' then 
			 return cur_city
		  end 
            
       end 
	   
	   ---如果上面的判断失败，则
	   local area_name = '华山'
	    if jindan_room_name=='菜地' or  jindan_room_name=='碎石路' or jindan_room_name=='村中心' or jindan_room_name=='南村口' or jindan_room_name=='东村口' then 
	        print('区域为华山村..........')
		    area_name='华山村'
	    end
       	
       return area_name		
 
end


function huashan_fanhui()
SetSpeedWalkDelay(speed_walk_delay)
print('huashan_fanhui........')
EnableTriggerGroup("wipe",false) 
--go(huashan_yls, "华山", "祭坛")
go(huashan_yls_fanhui_confirm,'华山','祭坛')
end
huashan_cut=function()
    hscheckhead = 1
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
    DeleteTriggerGroup("huashan_cut")
    road.id=nil
    create_trigger_t('huashan_cut1','^(> )*只听“咔”的一声，你将(\\D*)的首级斩了下来，提在手中。','','huashan_cut_con')
    create_trigger_t('huashan_cut2','^(> )*(乱切别人杀的人干嘛啊|你手上这件兵器无锋无刃|你得用件锋利的器具才能切下这尸体的头来)','','huashan_cut_weapon')
    SetTriggerOption("huashan_cut1","group","huashan_cut") 
    SetTriggerOption("huashan_cut2","group","huashan_cut")
	job.killer={}
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
	hstongji_thistime=fight.time.over
    if hsjob2==1 then
	   --开始统计次数
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l=hstongjilasttime_l+hstongjilasttime_l_2
	   hstongji_2=hstongji_2+1
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l/hstongji_2)
	   messageShowT('华山任务：【'..job.target..'】【'..job.id..'】。使用武功【'..npc_skill..'】，武功属性【'..npc_val..'】。')
	   messageShowT('华山任务：战斗用时:【'..fight.time.over..'】秒,搞定蒙面人：【'..job.target..'】,华山2共计【'..hstongji_2..'】次.平均用时【'..hstongji_pingjun..'】秒','aqua')	   
	return check_halt(huashan_cut_act)	  
	   else
	   --开始统计次数
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l_1=hstongjilasttime_l_1+hstongjilasttime_l_2
	   hstongji_1=hstongji_1+1 
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l_1/hstongji_1)
	messageShowT('华山任务：战斗用时:【'..fight.time.over..'】秒,搞定蒙面人：【'..job.target..'】,华山1共计【'..hstongji_1..'】次.平均用时【'..hstongji_pingjun..'】秒','aqua')
    return check_halt(huashan_cut_act)
end
end
huashan_cut_act=function()
    EnableTriggerGroup("huashan_getnpc",false)
    DeleteTimer('perform')
    weapon_unwield()
    weaponWieldCut()
       exe('wield taiji sword') 
	return check_busy(huashan_qiecropse,0.5)
end
function huashan_qiecropse()
    for i=1,5 do
       exe('halt;get ling pai from corpse '..i)
       exe('qie corpse '..i)
end   
end
huashan_cut_weapon=function()
    return check_busy(huashan_cut_act,1)
end
huashan_cut_con=function(n,l,w)
    DeleteTriggerGroup("all_fight")
	kezhiwugongclose()
	--exe('pfmset')
	Execute('pfmset')
		flag.find=1
    if job.target~=tostring(w[2]) then
       exe('drop head')
       return check_halt(huashan_cut_act)
    else
       EnableTriggerGroup("huashan_cut",false)   
       return check_busy(hs_cut,1.0)
	 end
end
function hs_cut()
SetSpeedWalkDelay(speed_walk_delay)
locate_finish=0
 ---go(huashan_yls,'华山','祭坛')
 go(huashan_yls_fanhui_confirm,'华山','祭坛')
end

function huashan_yls_fanhui_confirm()
   print('huashan_yls_fanhui_confirm..........,room name:'..locl.where)
    if locl.where == '华山祭坛' then 
	   return huashan_yls()
	else
	   return go(huashan_yls_fanhui_confirm,'华山','祭坛')
	end 

end

huashan_yls=function()
    EnableTriggerGroup("huashan_qigai",false)
    DeleteTriggerGroup("huashan_yls")
    create_trigger_t('huashan_yls1','^(> )*(这里没有这个人。|你身上没有这样东西。|这人好象不是你杀的吧？|你的令牌呢|你还没有去找恶贼，怎么就来祭坛了？)','','huashan_yls_fail')
    create_trigger_t('huashan_yls2','^(> )*岳灵珊在你的令牌上写下了一个 (一|二) 字。','','huashan_yls_ask')
	create_trigger_t('huashan_yls3','^(> )*这好象不是你领的令牌吧？','','huashan_yls_lingpai')
    SetTriggerOption("huashan_yls1","group","huashan_yls")
    SetTriggerOption("huashan_yls2","group","huashan_yls")
	SetTriggerOption("huashan_yls3","group","huashan_yls")
	if hscheckhead==1 then 
	exe('give head to yue lingshan')
	create_timer_s('walkWait4',1.0,'ylsgive_test1')
	else
	exe('give corpse to yue lingshan')
	create_timer_s('walkWait4',1.0,'ylsgive_test')
end
end
ylsgive_test1=function()
exe('give head to yue lingshan')
end
ylsgive_test=function()
exe('give corpse to yue lingshan')
end
huashan_yls_fail=function()
    EnableTriggerGroup("huashan_yls",false)
	if locl.room~="祭坛" then
	   return go(huashan_yls,'华山','祭坛')
	end
    exe('out;w;s;se;su;su;s')
    return check_halt(huashan_shibai_b)
end
huashan_yls_lingpai=function()
    EnableTriggerGroup("huashan_yls",false)
	exe('drop ling pai')
    return check_halt(huashan_yls)
end
huashan_yls_ask=function(n,l,w)
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("huashan_yls",false)    
    DeleteTriggerGroup("huashan_yls_ask")
    create_trigger_t('huashan_yls_ask1','^(> )*你向岳灵珊打听有关『力不从心』的消息。','','huashan_yls_back')
	create_trigger_t('huashan_yls_ask2','^(> )*你给岳灵珊一颗(\\D*)的首级。','','huashan_yls_back1')
    SetTriggerOption("huashan_yls_ask1","group","huashan_yls_ask")
	SetTriggerOption("huashan_yls_ask2","group","huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask",false)
    if w[2]=='二' then
	   hs2job=1
	   --locate_finish='huashan_yls_back'
       --return check_busy(locate)
	   return check_busy(huashan_yls_back)
    end
    if w[2]=='一' and dohs2==0 then
	  --locate_finish='huashan_yls_lbcx'
       --return check_busy(locate,0.5)
	   --return check_busy(locate)
	   return check_busy(huashan_yls_lbcx)
	   --return checkWait(locate,1)
    else
       return check_busy(huashan_heal)
    end
end
huashan_yls_back1=function()
return check_halt(huashan_yls_back,1)
end
huashan_heal=function()
    exe('set no_kill_ap')
    return check_bei(huashan_neili)
end
huashan_neili=function()
    hsjob2=1 
        if newbie==1 then
    return zhunbeineili(huashan_npc)
        else
        print("不是新手不打坐！")
        return check_bei(huashan_npc)
        end
end
huashan_yls_lbcx=function()
     locate_finish=0
    EnableTriggerGroup("huashan_yls_ask",true)	
    ---return exe('drop head;ask yue lingshan about 力不从心')
	---pumkmai add 防止 flood
	
	
	wait.make(function() 
	                wait.time(1)
				    exe('drop head')
					exe('ask yue lingshan about 力不从心')
			    end)	 
	
	
end
huashan_yls_back=function()
    locate_finish=0
    EnableTriggerGroup("huashan_yls_ask",false)
	EnableTriggerGroup("huashanQuest",true)
    DeleteTriggerGroup("huashan_over")
    create_trigger_t('huashan_over1','^(> )*你给岳不群一块令牌。','','huashan_finish')
    create_trigger_t('huashan_over2','^(> )*这里没有这个人。','','')
    SetTriggerOption("huashan_over1","group","huashan_over")
    SetTriggerOption("huashan_over2","group","huashan_over")
    return check_busy(hsfinish)
end
function hsfinish()

go(huashan_over,'华山','正气堂','huashan/jitan')
end
huashan_over=function() 
    SetSpeedWalkDelay(speed_walk_delay)
	EnableTriggerGroup("huashanQuest",true)
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
    --开始统计
	hstongji_finish=hstongji_finish+1
	hs2job=0
	flag.hs_find_lost=0
	messageShowT('华山任务：完成任务，用时:【'..job.time.over..'】秒。','aqua')
	exe('give ling pai to yue buqun')
	create_timer_s('walkWait4',1.0,'hsybq_test')
end
hsybq_test=function()
exe('give ling pai to yue buqun')
end
huashan_finish=function()
    map.rooms["village/zhongxin"].ways["northwest"]="village/caidi"
    map.rooms["village/zhongxin"].ways["northeast"]="village/caidi"
    EnableTriggerGroup("huashan_over",false)
	EnableTriggerGroup("huashanQuest",true)
	EnableTimer('walkWait4',false)
    flag.times=1
	flag.hs_find_lost=0
    hsjob2=0
	exe('drop ling pai')
	huashan_triggerDel()
	setLocateRoomID='huashan/zhengqi'
	--messageShow('华山任务地点统计：神龙岛【'..tosld..'】次 ！菜地【'..tocaidi..'】次 ！慕容【'..tomr..'】次 ！燕子坞【'..toyzw..'】次 ！曼佗罗山庄【'..tomtl..'】次 ！',"cyan")
	--messageShow('华山2不可到达地点统计：华山石洞【'..hstohssd..'】次 ！苏州闺房【'..hstoszgf..'】次 ！心禅堂【'..hstoxct..'】次 ！',"cyan")
	
	--return check_halt(check_jobx)
	
	
	hswc_cs=hswc_cs+1
	max_hs_cs=tonumber(GetVariable("hs_cs"))
	print('hswc_cs....'..hswc_cs)
	
	
	
	if hswc_cs>max_hs_cs or Bag['绳子']==nil then
	    hswc_cs=0
	    return check_halt(check_food)
	else
	    return check_halt(check_jobx)
    end
	
	
end
function huashanDgjj()
    if score.party and score.party=="华山派" then messageShow ('华山任务：出现面壁提示了！') end
    return huashan_finish()
end
function huashanjjQuest()
    EnableTriggerGroup("huashan_accept",false)
 if score.party and score.party=="华山派" then
    messageShow ('华山任务：提示要求面壁思过，停止做华山任务')
	job.zuhe["huashan"] = nil
	return check_heal()
 else
    return huashan_finish()
 end
end



