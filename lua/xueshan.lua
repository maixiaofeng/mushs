--雪山
xstongji_total = 0
xstongji_cs = 0 --领取job次数统计ok
xstongji_lasttime_total = 0 
xstongji_zdcs = 0 --战斗次数 ok
xstongji_lasttime_lj = 0  --累计战斗时间 ok
xstongji_thistime = 0 --本次任务战斗时间 ok
xstongji_pingjun = 0 --平均时间     ok
xstongji_fangqi = 0 --失败次数
xstongji_finish = 0 --完成次数
xstongji_cgl = 0 --成功率       ok
xstosld=0
xstomr=0
xstoyzw=0
xstomtl=0
xstohssd=0
xstoszgf=0
xstoxct=0
local XsIgnores = {
	["武当山院门"] = true,
	["武当山后山小院"] = true,
	["武当山小径"] = true,
	["曼佗罗山庄"] = true,
	--["武当后山烈火丛林"]=true,
	--["武当后山落叶丛林"]=true,
	--["武当后山阔叶丛林"]=true,
	--["武当后山积雪丛林"]=true,
}
local XsBugRoom = {
	["明教紫杉林"] = "mjMen_check",
	["武当山小径"] = "wdYm",
	["武当山院门"] = "wdYm",
	["武当山后山小院"] = "wdYm",
	["武当后山烈火丛林"]="outWdclCheck",
	["武当后山落叶丛林"]="outWdclCheck",
	["武当后山阔叶丛林"]="outWdclCheck",
	["武当后山积雪丛林"]="outWdclCheck",
	["明教树林"]="mjSloutCheck",
	["大雪山招财大车店"]="xsdcd_check",
	["大雪山正房"]="xsdcd_check",
}
function xueshan_triggerClose()
    EnableTriggerGroup("xueshan_debug",false)
    EnableTriggerGroup("xueshan_find",false)
    EnableTriggerGroup("xueshan_ask",false)
    EnableTriggerGroup("xueshan_accept",false)
    EnableTriggerGroup("xueshan_kill",false)
    EnableTriggerGroup("xueshan_guard",false)
    EnableTriggerGroup("xueshan_judge",false)
    EnableTriggerGroup("xueshan_f_ask",false)
    EnableTriggerGroup("xueshan_finish",false)
    EnableTriggerGroup("xueshan_fight",false)
    EnableTriggerGroup("xueshan_sa",false)
    EnableTriggerGroup("xueshan_safind",false)
    EnableTriggerGroup("xsbusydz",false)
    EnableTriggerGroup("xueshan_gderror",false)
end

function xueshan_trigger()
    DeleteTriggerGroup("xueshan_find")
    DeleteTriggerGroup("xueshan_ask")
    create_trigger_t('xueshan_ask1',"^(> )*你向宝象打听有关",'','xueshan_ask')
    create_trigger_t('xueshan_ask2',"^(> )*这里没有这个人。$",'','xueshan_nobody')
    SetTriggerOption("xueshan_ask1","group","xueshan_ask")
    SetTriggerOption("xueshan_ask2","group","xueshan_ask")
    EnableTriggerGroup("xueshan_ask",false)
    DeleteTriggerGroup("xueshan_accept")
    create_trigger_t('xueshan_accept1',"^(> )*(宝象说道：「这么简单的任务你怎么可以放弃呢！快去干！」|宝象说道：「你小子没完成，就想到老祖爷爷这里来骗吃骗喝啊？」)",'','xueshan_shibai')
    create_trigger_t('xueshan_accept2',"^(> )*宝象说道：「这个任务是比较困难，你完不成也不能全怪你。」",'','xueshan_fangqi_heal')
    create_trigger_t('xueshan_accept3',"^(> )*宝象说道：「我不是叫你",'','xueshan_finish')
    create_trigger_t('xueshan_accept4',"^(> )*宝象说道：「身体是革命的本钱啊，同志！你还是先歇息一会儿吧。」",'','xueshan_busy')
    create_trigger_t('xueshan_accept5',"^(> )*宝象说道：「你要累死你老祖爷爷啊！一边呆着去！」",'','xueshan_rest')
    create_trigger_t('xueshan_accept7',"^(> )*宝象说道：「你(根本就没任务|好好反省)",'','xueshan_busy')
    create_trigger_t('xueshan_accept8',"^(> )*宝象说道：「拜托，有点专业精神好不好？",'','xueshan_shibai')
    create_trigger_t('xueshan_accept9',"^(> )*宝象开始考虑是否要杀了你。",'','xueshan_busy')
    create_trigger_t('xueshan_accept10',"^(> )*宝象说道：「我看你不够心狠手辣，爷爷我不喜欢。」",'','xueshan_xieqi')
    create_trigger_t('xueshan_accept6',"^(> )*宝象在你的耳边悄声说道：听说最近(\\D*)附近来了个漂亮的小妞，你去给我弄来。",'','xueshan_consider')
    SetTriggerOption("xueshan_accept1","group","xueshan_accept")
    SetTriggerOption("xueshan_accept2","group","xueshan_accept")
    SetTriggerOption("xueshan_accept3","group","xueshan_accept")
    SetTriggerOption("xueshan_accept4","group","xueshan_accept")
    SetTriggerOption("xueshan_accept5","group","xueshan_accept")
    SetTriggerOption("xueshan_accept6","group","xueshan_accept")
    SetTriggerOption("xueshan_accept7","group","xueshan_accept")
    SetTriggerOption("xueshan_accept8","group","xueshan_accept")
    SetTriggerOption("xueshan_accept9","group","xueshan_accept")
    SetTriggerOption("xueshan_accept10","group","xueshan_accept")
    EnableTriggerGroup("xueshan_accept",false)
    DeleteTriggerGroup("xueshan_kill")
    create_trigger_t('xueshan_kill1',"^(> )*你对着(\\D*)(嘿嘿一笑|说道|猛吼|大喝|吼道|喝道|啐了一口)",'','xueshan_kill_who')
    create_trigger_t('xueshan_kill2','^(> )*(\\D*)说道：「光天化日也敢抢劫！」','','xueshan_kill_judge')
    create_trigger_t('xueshan_kill3','^(> )*这里没有这个人。','','xueshan_kill_nobody')
    create_trigger_t('xueshan_kill4','^(> )*这里不准战斗。','','xueshan_kill_nofight_new')
    create_trigger_t('xueshan_kill5','^(> )*你正要有所动作，突然身旁有人将你一拍','','xueshan_kill_nofight')
	create_trigger_t('xueshan_kill6',"^(他|她)装备着：$",'','npcWeapon')
	create_trigger_t('xueshan_kill7',"^(他|她)穿戴着：$",'','npcWeapon')
	SetTriggerOption("xueshan_kill1","group","xueshan_kill")
    SetTriggerOption("xueshan_kill2","group","xueshan_kill")
    SetTriggerOption("xueshan_kill3","group","xueshan_kill")
    SetTriggerOption("xueshan_kill4","group","xueshan_kill")
    SetTriggerOption("xueshan_kill5","group","xueshan_kill")
	SetTriggerOption("xueshan_kill6","group","xueshan_kill")
    SetTriggerOption("xueshan_kill7","group","xueshan_kill")
    EnableTriggerGroup("xueshan_kill",false)
    DeleteTriggerGroup("xueshan_guard")
    create_trigger_t('xueshan_guard1',"^(> )*(京城|扬州|江南|江北|西南|中原|西北|河南|河北|东北)(镖头|大侠|捕头|护院|保镖) (\\D*)\\((\\D*)\\)",'','xueshan_guard_check')
    --create_trigger_t('xueshan_guard2',"^(> )*这位高手似乎来自(\\D*)。",'','xueshan_judge_party')
    create_trigger_t('xueshan_guard3',"^最近治安不太好，这个保镖是特别从京城请来的，据说还曾经是大内高手呢！",'','xueshan_judge_super')
    --create_trigger_t('xueshan_guard6',"^  □(竹棒|长剑|长鞭|一块铁令|钢刀|箫)\\(",'','xueshan_judge_weapon')
    create_trigger_t('xueshan_guard5','^(> )*你要看什么？','','xueshan_kill_nobody')
    --create_trigger_t('xueshan_guard4',"^(他|她)装备着：$",'','npcWeapon')
    SetTriggerOption("xueshan_guard1","group","xueshan_guard")
    --SetTriggerOption("xueshan_guard2","group","xueshan_guard")
    SetTriggerOption("xueshan_guard3","group","xueshan_guard")
    --SetTriggerOption("xueshan_guard4","group","xueshan_guard")
    SetTriggerOption("xueshan_guard5","group","xueshan_guard")
    --SetTriggerOption("xueshan_guard6","group","xueshan_guard")
    EnableTriggerGroup("xueshan_guard",false)
    DeleteTriggerGroup("xueshan_f_ask")
    create_trigger_t('xueshan_f_ask1',"^(> )*你向宝象打听有关",'','xueshan_f_ask')
    create_trigger_t('xueshan_f_ask2',"^(> )*这里没有这个人。$",'','xueshan_f_nobody')
    SetTriggerOption("xueshan_f_ask1","group","xueshan_f_ask")
    SetTriggerOption("xueshan_f_ask2","group","xueshan_f_ask")
    EnableTriggerGroup("xueshan_f_ask",false)
    DeleteTriggerGroup("xueshan_finish")
    create_trigger_t('xueshan_finish1',"^(> )*宝象说道：「不错不错，今天又有事情干了",'','xueshan_over')
    create_trigger_t('xueshan_finish2',"^(> )*宝象说道：「你什么意思？」",'','xueshan_over')
    create_trigger_t('xueshan_finish3',"^(> )*宝象说道：「你小子没完成，就想到老祖爷爷",'','xueshan_fangqi')
    SetTriggerOption("xueshan_finish1","group","xueshan_finish")
    SetTriggerOption("xueshan_finish2","group","xueshan_finish")
    SetTriggerOption("xueshan_finish3","group","xueshan_finish")
    EnableTriggerGroup("xueshan_finish",false)
    DeleteTriggerGroup("xueshan_fight")
    create_trigger_t('xueshan_fight1','^(> )*(\\D*)「啪」的一声倒在地上','','xueshan_sa')
    create_trigger_t('xueshan_fight2','^(> )*(\\D*)神志迷糊，脚下一个不稳，倒在地上昏了过去。','','xueshan_faint')
    --create_trigger_t('xueshan_fight3',"^(> )*(\\D*)(哈哈大笑，说道|双手一拱，笑着说道|胜了这招，向后跃开|向后一纵，说道|向后一纵，躬身做揖|向后退了几步，说道|脸色微变，说道：佩服，佩服)",'','xueshan_fight_over')
    SetTriggerOption("xueshan_fight1","group","xueshan_fight")
    SetTriggerOption("xueshan_fight2","group","xueshan_fight")
    SetTriggerOption("xueshan_fight3","group","xueshan_fight")
    EnableTriggerGroup("xueshan_fight",false)
    DeleteTriggerGroup("xueshan_sa")
    create_trigger_t('xueshan_sa1','^(> )*你嘿嘿阴笑了几声','','xueshan_finish')
    create_trigger_t('xueshan_sa2','^(> )*你要撒谁？','','xueshan_finish_error')
    create_trigger_t('xueshan_sa3','^(> )*hmm，你似乎在利用BUG！','','xueshan_find')
    SetTriggerOption("xueshan_sa1","group","xueshan_sa") 
    SetTriggerOption("xueshan_sa2","group","xueshan_sa")
    SetTriggerOption("xueshan_sa3","group","xueshan_sa")
    EnableTriggerGroup("xueshan_sa",false)
    DeleteTriggerGroup("xueshan_debug")
    create_trigger_t('xueshan_debug1','^(> )*看来该找机会逃跑了','','xs_guard_check')
    SetTriggerOption("xueshan_debug1","group","xueshan_debug")
    EnableTriggerGroup("xueshan_debug",true)
end
function xueshan_triggerDel()   
    DeleteTriggerGroup("xueshan_debug")
    DeleteTriggerGroup("xueshan_find")
    DeleteTriggerGroup("xueshan_ask")
    DeleteTriggerGroup("xueshan_accept")
    DeleteTriggerGroup("xueshan_kill")
    DeleteTriggerGroup("xueshan_guard")
    DeleteTriggerGroup("xueshan_judge")
    DeleteTriggerGroup("xueshan_f_ask")
    DeleteTriggerGroup("xueshan_finish")
    DeleteTriggerGroup("xueshan_fight")
    DeleteTriggerGroup("xueshan_sa")
    DeleteTriggerGroup("xueshan_safind")
    DeleteTriggerGroup("xsbusydz")
    DeleteTriggerGroup("xueshan_gderror")
end
job.list["xueshan"] = "雪山抢美女"
function xueshan()
    SetSpeedWalkDelay(speed_walk_delay)
    if hp.shen>=0 then
	   return turnShen('-')
	end
    xueshan_trigger()
    job.name='xueshan'
    job.flag()
    flag.xueshan=1
    job.target='任务目标'
    return xueshan_start()
end
function xueshan_xieqi()
 return go(xieqiwan,"大理城","药铺")
end
function xieqiwan()
   exe('buy xieqi wan;fu xieqi wan')
   return check_busy(xueshan)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["xueshan"] = "xueshanFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["xueshan"] = "xueshanFindFail"
function xueshanFindAgain()
    locate_finish=0
	fastLocate()
	if flag.times==2 and dest.area=='华山' then
		return go(xueshan_find_act,'华山村','菜地')
	end
	if flag.times==2 and dest.area=='襄阳城' and dest.room=='山间空地' then
		return go(xueshan_find_act,'襄阳郊外','瀑布')
	end
	
	if flag.times==2 and dest.area=='明教' and (dest.room=='紫杉林'  or string.find(dest.room,"字门")) then
		--job.room='练武场'
		flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3},{'小厅','明教',3}}
		return go(xueshan_find_act,'明教','烈火旗') 
	end
	
	if flag.times==3 and dest.area=='明教' and (dest.room=='紫杉林'  or string.find(dest.room,"字门")) then
		--job.room='练武场'
		flag.searchRooms = {{'聚议厅','明教',6},{'光明顶','明教',6}}
		return go(xueshan_find_act,'明教','聚议厅') 
	end
	
	
	--[[
	if flag.times==2 and dest.area=='明教' and job.room=='天字门' then
		job.room='天字门'
	end
	if flag.times==2 and dest.area=='明教' and job.room=='地字门' then
		job.room='地字门'
	end
	if flag.times==2 and dest.area=='明教' and job.room=='雷字门' then
		job.room='雷字门'
	end
	if flag.times==2 and dest.area=='明教' and job.room=='风字门' then
		job.room='风字门'
	end
	]]--
	if flag.times==3 and job.area=='嵩山少林' and job.room=="罗汉堂" then
	   job.room='罗汉堂五部'
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=="般若堂" then
	   job.room='般若堂五部'
	end
	if flag.times==2 and job.area=='扬州城' and job.room=='南门' then
		return go(xueshan_find_act,'扬州城','长江南岸')
	end
	if flag.times==2 and job.area=='兰州城' and job.room=='大道' then
		return go(xueshan_find_act,'兰州城','永登')
	end
	if flag.times==2 and job.area=='铁掌山' and job.room=='山路' then
		return go(xueshan_find_act,'铁掌山','中指峰')
	end
	if flag.times==2 and job.area=='杭州城' and job.room=='青石大道' then
		return go(xueshan_find_act,'杭州城','飞来峰')
	end
	if flag.times==2 and job.area=='苗疆' and job.room=='山路' then
		return go(xueshan_find_act,'苗疆','山洞')
	end
	if flag.times==2 and job.area=='杭州城' and job.room=='山路' then
		return go(xueshan_find_act,'杭州城','雷峰塔')
	end
	if flag.times==2 and job.area=='嵩山少林' and job.room=='石板路' then
		return go(xueshan_find_act,'嵩山少林','法堂')
	end
	if flag.times==2 and job.area=='兰州城' and job.room=='西城门' then
		return go(xueshan_find_act,'兰州城','永登')
	end
	if tmp.kill then
        EnableTrigger("xueshan_safind1",true)
        return go(xueshan_find_saact,job.area,job.room)
	else
        EnableTriggerGroup("xueshan_find",false)
        return go(xueshan_find_act,dest.area,dest.room)
	   end
end
function xueshanFindFail()
    EnableTriggerGroup("xueshan_find",false)
    return check_halt(xueshan_find_fangqi)
end
function xueshan_start()
    DeleteTriggerGroup("xsbusydz")
    return check_busy(xueshan_job)
end
function xueshan_job()
go(xsaskjob,'大雪山','入幽口')
end
function xsaskjob()
    if newbie==1 then return zhunbeineili(job_xueshan) else return job_xueshan() end
end
function job_xueshan()
    DeleteTriggerGroup("check_job")
    EnableTriggerGroup("xueshan_ask",true)
	flag.wipe=1
    exe('set po 掌')
    flag.idle = nil
	return check_busy(xueshan_baoxiang)
end
function xueshan_baoxiang()
    exe('ask bao xiang about job')
    create_timer_s('walkWait4',1.0,'xueshan_ask_test')
end
xueshan_ask_test=function()
    exe('ask bao xiang about job')       
end
function xueshan_ask()
    dis_all()
    EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_ask",false)
    EnableTriggerGroup("xueshan_accept",true)
end
function xueshan_nobody()
    EnableTriggerGroup("xueshan_ask",false)
    return xueshan_start()
end
function xueshan_busy()
    EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_accept",false)
	prepare_neili_stop()
	 condition={}
    exe('cond')
    return check_busy(xueshan_busy_dazuo,1)
end

function xueshan_busy_dazuo()
    if not condition.busy or condition.busy == 0 then
      if score.party=='华山派' or job.last=='huashan' then
        DeleteTriggerGroup("xsbusydz")
        create_trigger_t('xsbusydz1',"^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",'','xueshan_start')
	      SetTriggerOption("xsbusydz1","group","xsbusydz")
	      ---return exe('yun jing;yun jingli;yun qi;dazuo '..hp.dazuo)
		  return xueshan_busy_dazuo_timer()
      else
       xueshan_triggerDel()
       return huashan()
      end
    end
    return prepare_lianxi(xueshan_start)
end

function xueshan_busy_dazuo_timer()
     wait.make(function()
	     exe('yun jing;yun jingli;yun qi')
		 while true do
		     wait.time(0.5)
		     exe('dazuo '..hp.dazuo)
		     local l,w = wait.regexp('^(> )*你盘腿坐下，双目微闭，双手掌心相向成虚握太极，天人合一，练气入虚。',1)
		     if l~= nil then break end
		 end
	 end)
end


faintFunc = faintFunc or {}
faintFunc["xueshan"] = "xueshan_fangqi_go"
function xueshan_fangqi_go()
    return go(xueshan_fangqi,'大雪山','入幽口')
end
function xueshan_fangqi()
   EnableTimer('walkWait4',false)
   nobusy=0
   locate_finish=0
	exe('nick 雪山任务放弃;unset no_kill_ap')
   xueshan_triggerClose()
	flag.idle = nil
    EnableTriggerGroup("xueshan_finish",false)
    EnableTriggerGroup("xueshan_accept",false)
    return check_busy(xueshan_fangqi_ask)
end
function xueshan_fangqi_ask()
    EnableTimer('walkWait4',false)
    xstongji_fangqi=xstongji_fangqi+1
    EnableTriggerGroup("xueshan_ask",true)
    messageShow('雪山任务：任务放弃!','blue')
    exe('ask bao xiang about 放弃')
    create_timer_s('walkWait4',1.0,'xueshan_fangqi_ask1')
end
function xueshan_fangqi_ask1()
	exe('ask bao xiang about 放弃')
	exe('unset no_kill_ap')
end
function xueshan_find_fangqi()
    jobfailLog()
    return go(xueshan_shibai_ask,'大雪山','入幽口')
end
function xueshan_shibai()
    EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_accept",false)
    return check_busy(xueshan_shibai_ask)
end
function xueshan_shibai_ask()
    EnableTriggerGroup("xueshan_ask",true)
    exe('ask bao xiang about 失败')
    DeleteTimer("walkWait4")
	create_timer_s('walkWait4',1.0,'xueshan_shibai_ask1')
	if job.where~=nil and string.find(job.where,"侠客岛") then
		mjlujingLog("侠客岛")
	end
end
function xueshan_shibai_ask1()
	exe('ask bao xiang about 失败')
end
function xueshan_fangqi_heal()
   EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_accept",false)
    job.last = "xueshan"
    return check_food()
end
function xueshan_rest()
    EnableTriggerGroup("xueshan_accept",false)
    job.last = "xueshan"
    return check_food()
end
function xueshan_finish()
        gdcname='不知道'
        guard_id=0
    EnableTriggerGroup("xueshan_accept",false)
    EnableTriggerGroup("xueshan_sa",false)
	EnableTimer('walkWait4',false)
        for i=1,3 do
    end
    flag.times=1
--检查地点是否去看星星 照搬 sx后的判断
    if score.party=="姑苏慕容" and need_dzxy=="yes" and string.find(jiangnan_area,locl.area) and hp.pot > 0 and hp.food>50 and hp.water>50 then
       messageShow("任务监控：送信任务完成，当前区域【"..locl.area.."】，顺路检查是否去慕容领悟斗转星移！")
       return check_halt(checkdzxy)
    end
	dis_all()
	weapon_unwield()
	 bqcheck()
	 return checkNext(xueshan_wc)
end
function xueshan_wc()
SetSpeedWalkDelay(speed_walk_delay)
EnableTriggerGroup("wipe",false) 
flag.wipe = nil
go(xueshan_finish_ask,'大雪山','入幽口')
end
function xueshan_finish_error()
	gdcname='不知道'
	guard_id=0
    messageShow('雪山任务：Beauty不见了，任务放弃！','blue')
    EnableTriggerGroup("xueshan_sa",false)
    return xueshan_fangqi_go()

end
function xueshan_finish_ask()
    EnableTriggerGroup("xueshan_accept",false)
    EnableTriggerGroup("xueshan_f_ask",true)
    return check_busy(xueshan_finish_ask1,1)
end
function xueshan_finish_ask1()
   exe('ask bao xiang about finish;unset no_kill_ap')
   create_timer_s('walkWait4',1.0,'xs_finish_test')
end
function xs_finish_test()
exe('ask bao xiang about finish')
end
function xueshan_f_ask()
    EnableTriggerGroup("xueshan_f_ask",false)
    EnableTriggerGroup("xueshan_finish",true)
end
function xueshan_f_nobody()
    EnableTriggerGroup("xueshan_f_ask",false)
    xueshan_finish()
end
function xueshan_over()
    
   locate_finish=0
	nobusy=0
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
	xstongji_finish=xstongji_finish+1
	xswc_cs=xswc_cs+1
	EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_finish",false)
    xueshan_triggerDel()
    --print('雪山job完成，检查food...')
    messageShowT('雪山任务：任务完成，用时:【'..job.time.over..'】秒。','gold')
    setLocateRoomID='xueshan/shanlu4'
	dis_all()
	if xswc_cs>5 then 
	  xswc_cs=0
	return check_busy(wudang_chifan,1)
	else
	return check_busy(check_jobx,1)
	end
end
function xsgosongxin()
      songxin_trigger()
 return songxin_start()
end
function xueshan_consider(n,l,w)
    nobusy=1
    job.time.b=os.time()
    xstongji_cs=xstongji_cs+1
    EnableTriggerGroup("xueshan_accept",false)
    EnableTriggerGroup("xsbusydz",false)
    DeleteTriggerGroup("xsbusydz")
    job.where=tostring(w[2])
    if XsIgnores[job.where] then
       messageShow('雪山任务：任务地点【'..job.where..'】容易出错，任务放弃。','blue')
       return check_busy(xueshan_fangqi)
    end
if string.find(job.where,'神龙岛') then
xstosld=xstosld+1
end
if string.find(job.where,'姑苏慕容') then
xstomr=xstomr+1
end
if string.find(job.where,'燕子坞') then
xstoyzw=xstoyzw+1
end
if string.find(job.where,'曼佗罗山庄') then
xstomtl=xstomtl+1
end
if string.find(job.where,'苏州城闺房') then
xstoszgf=xstoszgf+1
end
if string.find(job.where,'华山石洞') then
xstohssd=xstohssd+1
end
if string.find(job.where,'嵩山少林心禅堂') then
xstoxct=xstoxct+1
end
	job.room,job.area=getAddr(job.where)
    dest.room=job.room
    dest.area=job.area
    job.last = "xueshan"
	    if not job.room or not path_cal() then
       messageShow('雪山任务：任务地点【'..job.where..'】不可到达，任务放弃。','blue')
       return check_busy(xueshan_fangqi)
    end

    exe('nick 美女在'..job.where)
	
	--messageShow('雪山任务地点统计：神龙岛【'..xstosld..'】次 ！慕容【'..xstomr..'】次 ！燕子坞【'..xstoyzw..'】次 ！蔓佗罗山庄【'..xstomtl..'】次 ！',"cyan")
	--messageShow('雪山不可到达地点统计：华山石洞【'..xstohssd..'】次 ！苏州闺房【'..xstoszgf..'】次 ！心禅堂【'..xstoxct..'】次 ！',"cyan")
    messageShow('雪山任务：开始前往【'..job.where..'】，寻找美女！')
	return checkNext(xueshan_find)
end
function xueshan_find()
    DeleteTriggerGroup("xueshan_find")
    create_trigger_t('xueshan_find1','^\\s*\\D*(格格|公主|小姐|姑娘|夫人|郡主)\\(Beauty\\)','','xueshan_look')
    create_trigger_t('xueshan_find2','^(> )*你要看什么？','','xueshan_goon')
    create_trigger_t('xueshan_find3','^看来就是血刀老祖要求(\\D*)\\(\\D*\\)强抢的美女。','','xueshan_add')
    --create_trigger_t('xueshan_find4','^(> )*这里没有 beauty','','xueshan_goon')
    --create_trigger_t('xueshan_find5','^(> )*你决定跟随(\\D*)一起行动。','','xueshan_guard')
    --create_trigger_t('xueshan_find6','^(> )*你已经这样做了。','','xueshan_guard')
	
    SetTriggerOption("xueshan_find1","group","xueshan_find")
    SetTriggerOption("xueshan_find2","group","xueshan_find")
    SetTriggerOption("xueshan_find3","group","xueshan_find")
    --SetTriggerOption("xueshan_find4","group","xueshan_find")
    --SetTriggerOption("xueshan_find5","group","xueshan_find")
    --SetTriggerOption("xueshan_find6","group","xueshan_find")
	
    EnableTriggerGroup("xueshan_find",false)
    flag.times=1
	flag.wait=0
	--jiaosha_kill=0
	--[[local tmppfm = GetVariable("pfmsanqing")	 --古墓派合气最高大招设置防止遇到kezhiwugong.lua识别不了的npc招式
	--create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)]]
	--exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
	--exe('kezhiwugongpfm;set wimpy 100;set wimpycmd pfmpfm\\hp;yield no')
    return xueshan_find_go()
end
function xueshan_find_go()
     EnableTimer('walkWait4',false)
	 if job.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) then
	   job.room="紫杉林"
	end
    go(xueshan_find_act,job.area,job.room,'xueshan/shanlu4')    
end
function xueshan_find_act()
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("xueshan_find",true)
    job.flag()
    exe('look')
	messageShow('雪山任务：开始寻找【'..dest.area .. dest.room ..'】的美女！')
    return find()
end
function xueshan_look()
    print('xueshan_look..........')
    create_timer_s('walkWait4',3.0,'xs_lookmv')
    print("flag.wait="..flag.wait)
    if flag.wait==0 then
       flag.wait=1
       job.cnt=1
	   wait.make(function() 
		   
		   wait.time(0.5)
	       exe('look beauty')
	       locate_finish='xs_look'
	   --return check_busy(locate,1)
	       wait_busy()
		   
		   return fastLocate()

	   end)
    end	   
end
function xs_look()
locate_finish=0
flag.wait=0
end
function xs_lookmv()
print('xs_lookmv...........')
exe('look beauty')
end
function xueshan_add(n,l,w)
     EnableTimer('walkWait4',false)
    if w[1]==score.name then
	    --locate_finish='xushan_look1'
	    --return check_busy(locate,1)
	    --return check_busy(fastLocate,1)
		return xueshan_look1_new()
    else
	    return check_busy(xushan_look2,1)
    end
end

function xueshan_look1_new()
   wait.make(function()
       wait_busy()
       while true do 
          exe('follow beauty '.. job.cnt)
          local l,w = wait.regexp('^(> )*(你决定跟随(\\D*)一起行动|你已经这样做了|这里没有 beauty)',1)
		  if l~=nil then 
		     if string.find(l,'这里没有') then
                 return xueshan_goon()		 
			 else
			     return xueshan_guard()
			 end
		  end
          wait.time(0.5)		  
       end 	   
       --return xueshan_guard()
   end)
end

function xushan_look1()
locate_finish=0
exe('follow beauty '.. job.cnt)
end
function xushan_look2()
job.cnt=job.cnt + 1
exe('look beauty '.. job.cnt)
end
function xueshan_goon()
    print('xueshan_goon........')
    EnableTrigger("xueshan_find1",true)
    flag.wait=0
    flag.find=0
	job.cnt=0
	print(locl.area.."|locl|"..locl.room)
	if XsBugRoom[locl.area..locl.room] then
		print("run "..XsBugRoom[locl.area..locl.room])
		return _G[XsBugRoom[locl.area..locl.room]]()
	else
		return walk_wait()
	end
end
function xueshan_fight()
    print('xueshan_fight..........')
    DeleteTimer('xs_look')
    --EnableTimer('xueshan_look',false)
    if tmp.kill then
	   return
	end
    EnableTriggerGroup("xueshan_find",false)
    EnableTriggerGroup("xueshan_kill",true)
    job.guard = job.guard or {}
	exe('jifa all;unset wimpy;set wimpycmd pfmpfm\\hp')
	messageShow('雪山任务：开始Fight保镖【'..job.target..'】！')
    for i=1,3 do
       exe('fight guard '.. i)
    end
	exe('alias action fight')
end
function xueshan_fight_unaccept(n,l,w)
    job.guard[w[2]]=nil
end
    
function xueshan_fight_judge()
    DeleteTimer('xs_look')
    EnableTriggerGroup("xueshan_kill",false)
	--EnableTimer('xueshan_look',false)
    if countTab(job.guard)==1 then
	   EnableTriggerGroup("xueshan_fight",true)
	   for p in pairs(job.guard) do
	       job.target = p
		   create_timer_s('xsfight',3,'xueshan_fight')
	   end
	else
	   return check_busy(xueshan_kill,1)
	end
end
function xueshan_fight_over(n,l,w)
    if w[2]==job.target or w[2]=="你" then
	   DeleteTimer('xsfight')
	   -- ain
	   
	   return check_busy(xueshan_fight,1)
	end
end
function xueshan_kill_act()
       
       exe('kill '.. guard_id)
end
function xueshan_kill()
    print('xueshan_kill...............')
    --EnableTimer('xueshan_look',false)
	fight.time.b=os.time()
    EnableTriggerGroup("xueshan_find",false)
    EnableTriggerGroup("xueshan_kill",true)
    job.guard={}
	xueshan_kill_act()
	create_timer_s('xskill',1.0,'xskill')
	heqi_count=0
	kezhiwugong()
	kezhiwugongAddTarget(gdcname,guard_id)
	print(gdcname..guard_id)
end
function xskill()--xs flood后kill命令出不来的workaround by joyce@tj
	exe('unset no_kill_ap')
    exe('kill '..guard_id)
end
function xueshan_kill_error()
    EnableTriggerGroup("xueshan_gderror",false)
    DeleteTriggerGroup("xueshan_gderror")
    EnableTriggerGroup("xueshan_kill",false)
    EnableTriggerGroup("xueshan_find",true)
    job.party=nil
    guard_id=nil
    gdcname=nil
    flag.wait=0
    flag.find=0
    return walk_wait()
end
function xueshan_kill_who(n,l,w)
    print('xueshan_kill_who..............')
    DeleteTimer("xskill")
    job.guard[w[2]]=true
end
function xueshan_kill_judge(n,l,w)
   DeleteTimer("xskill")
    for i=1,countTab(job.guard) do
        if job.guard[w[2]] and w[2]~= "白衣武士" and w[2]~= "红衣武士" and w[2]~= "青衣武士" then
	       job.target=w[2]
	       xueshan_triggerClose()
	       EnableTriggerGroup("xueshan_debug",true)
	       EnableTriggerGroup("xueshan_kill",false)
	       EnableTriggerGroup("xueshan_fight",true)
    	   EnableTrigger("hpheqi1",true)
	       break
	    end
    end
end
function xueshan_kill_nobody()
    look_guard_finish=1
    EnableTriggerGroup("xueshan_guard",false)
    EnableTriggerGroup("xueshan_judge",false)
    EnableTriggerGroup("xueshan_find",false)
    EnableTriggerGroup("xueshan_kill",false)
    if flag.xueshan > 1 then
       return check_halt(xueshan_fangqi_go)
    else
       flag.xueshan = flag.xueshan + 1
	   if tmp.kill then
	      return check_busy(xueshan_sa_act,1)
	   else
          return check_busy(xueshan_find_go,1)
	   end
    end
end
function xueshan_kill_nofight()
   print('xueshan_kill_nofight................')
	wait.make(function()
		 wait.time(3)
		 exe('askk '.. guard_id ..' about fight')
		return check_busy(xueshan_judge,2)
		--return check_busy(xueshan_kill,1)
	end)
end


function xueshan_kill_nofight_new()
   print('xueshan_kill_nofight_new................')
	wait.make(function()
		 wait.time(3)
		 exe('ask '.. guard_id ..' about fight')
		--return check_busy(xueshan_judge,2)
		return check_busy(xueshan_kill,2)
	end)
end


function xueshan_faint(n,l,w)
    if w[2]==job.target then
       tmp.kill=true
       DeleteTimer('xsfight')
       --messageShow('雪山任务：开始解决保镖【'..job.target..'】！')
       exe('kill '.. guard_id)
    end  
end




function xueshan_sa(n,l,w)
  print('xueshan_sa.................')
  --print('fqyytmp.goArmorD.....:'..fqyytmp.goArmorD)
       --开始统计
       xstongji_zdcs=xstongji_zdcs+1
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
    xstongji_thistime=fight.time.over
	   xstongji_lasttime_lj=xstongji_lasttime_lj+xstongji_thistime
	   xstongji_pingjun=string.format("%0.2f",xstongji_lasttime_lj/xstongji_zdcs)
    if job.target==w[2] then
       tmp.kill=true
       EnableTriggerGroup("xueshan_fight",false)
	   messageShowT('雪山任务：【'..gdcname..'】【'..guard_id..'】。使用武功【'..npc_skill..'】，武功属性【'..npc_val..'】。')   
       messageShow('雪山任务：搞定保镖【'..job.target..'】！战斗用时:【'..fight.time.over..'】秒。','azure')
       geta()	   
       --exe('pfmset')
       -- ain
    DeleteTriggerGroup("xueshan_safind")
    create_trigger_t('xueshan_safind1','^\\s*\\D*(格格|公主|小姐|姑娘|夫人|郡主)\\(Beauty\\)','','xueshansa_look')
    create_trigger_t('xueshan_safind2','^(> )*你要看什么？','','xueshansa_goon')
    create_trigger_t('xueshan_safind3','^看来就是血刀老祖要求(\\D*)\\(\\D*\\)强抢的美女。','','xueshansa_add')
    create_trigger_t('xueshan_safind4','^(> )*这里没有 beauty','','xueshansa_goon')
    SetTriggerOption("xueshan_safind1","group","xueshan_safind")
    SetTriggerOption("xueshan_safind2","group","xueshan_safind")
    SetTriggerOption("xueshan_safind3","group","xueshan_safind")
    SetTriggerOption("xueshan_safind4","group","xueshan_safind")
    EnableTriggerGroup("xueshan_safind",true)
    flag.times=1
	--locate_finish='xueshansa_look'
       --return check_busy(locate)
	   return check_halt(xueshansa_look)
    end
end


function xueshansa_look()
    print('xueshansa_look..............')
	print('fqyytmp.goArmorD.....:'..fqyytmp.goArmorD)
	EnableTriggerGroup("xueshan_safind",true)
    EnableTrigger("xueshan_safind1",false)
	   locate_finish=0
       flag.wait=1
       job.cnt=1
	   exe('look beauty')    
end
function xueshansa_add(n,l,w)
    print('xueshansa_add.............')
    if w[1]==score.name then
       return check_busy(xueshan_sa_act,1)
    else
       job.cnt=job.cnt + 1
       exe('look beauty '.. job.cnt)
    end
end
function xueshansa_goon()
    EnableTrigger("xueshan_safind1",true)
    flag.wait=0
    flag.find=0
    return go(xueshan_find_saact,job.area,job.room)
end
function xueshan_find_saact()
    EnableTriggerGroup("xueshan_safind",true)
    job.flag()
    exe('look')
	messageShow('雪山任务：开始寻找【'..dest.area .. dest.room ..'】的美女！')
    return find()
end
function xueshan_sa_act()
   print('xueshan_sa_act.............')
   create_timer_s('walkWait4',2.0,'xueshan_sa_test')
    EnableTriggerGroup("xueshan_safind",false)
       EnableTriggerGroup("xueshan_sa",true)
          exe('sa beauty '.. job.cnt)	  
end
xueshan_sa_test=function()
exe('sa beauty '.. job.cnt)
end
function xueshan_guard()
     EnableTimer('walkWait4',false)
	EnableTrigger("xueshan_find1",false)
    EnableTriggerGroup("xueshan_find",false)
    EnableTriggerGroup("xueshan_guard",true)
    flag.wait=1
    flag.find=1
    --thread_resume(lookfor)
	--locate()
    job.weapon='unarmed'
	--return check_busy(xslook_mv,1)
	
	look_guard_finish=0
	wait.make(function()
	    while true do 
		    wait_busy()
			exe('look guard '.. job.cnt)
			wait.time(1)
			if look_guard_finish==1 then break end
		end 
	end)
	
end
function xslook_mv()
exe('look guard '.. job.cnt)
end
function xueshan_guard_check(n,l,w)
    look_guard_finish=1
    guard_id=string.lower(w[5])
    gdcname=w[4]
    --xueshan_guard_look()
    --exe('compare '.. guard_id)
	xueshan_judge()
    end
function xs_guard_check()
    --xueshan_guard_look()
    --exe('compare '.. guard_id)
	xueshan_judge()
    end
function xueshan_guard_look()
    DeleteTriggerGroup("xueshan_judge")
    create_trigger_t('xueshan_judge1',"^(> )*你仔细的上前打量了".. gdcname .."一番。",'','xueshan_judge')
    create_trigger_t('xueshan_judge2',"^(> )*".. guard_id .." 不在这里$",'','xueshan_kill_nobody')	
    SetTriggerOption("xueshan_judge1","group","xueshan_judge")
    SetTriggerOption("xueshan_judge2","group","xueshan_judge")	
    EnableTriggerGroup("xueshan_judge",true)
end
function xueshan_judge_party(n,l,w)
    job.party=w[2]
end
function xueshan_judge_super()
    look_guard_finish=1
    tmp.super=true
	exe('set wimpycmd pfmpower\\pfmpfm\\hp')
end
function xueshan_judge_weapon(n,l,w)
    if w[1]=='竹棒' then
       job.weapon='stick'
    elseif w[1]=='长剑' then
       job.weapon='sword'
    elseif w[1]=='钢刀' then
       job.weapon='blade'
    elseif w[1]=='长鞭' then
       job.weapon='whip'
    elseif w[1]=='箫' then
       job.weapon='xiao'
    elseif w[1]=='一块铁令' then
       job.weapon='dagger'
    else
       job.weapon='unarmed'
    end
 end
function xueshan_judge()
    print('xueshan_judge...........')
	xueshan_triggerClose()
	--dis_all()
	--DeleteTimer("xskill")
    DeleteTriggerGroup("xueshan_gderror")
    create_trigger_t('xueshan_gderror1',"^(> )*".. gdcname .."说道：「快逃啊！」",'','xueshan_kill_error')
	create_trigger_t('xueshan_gderror2','^(> )*你对着".. gdcname .."一脚踢了过去。','','xueshan_kill')	
    SetTriggerOption("xueshan_gderror1","group","xueshan_gderror")
	SetTriggerOption("xueshan_gderror2","group","xueshan_gderror")	
    EnableTriggerGroup("xueshan_gderror",true)
    EnableTrigger("hpheqi1",true)
    --exe('unset no_kill_ap')
    job.skill='无'
    --messageShow('雪山任务：保镖来自【'..job.party..'】！')
	if tmp.super then
	   messageShow('雪山任务：遇到大内高手。')
	end
	job.guard = {}
     exe('kick '.. guard_id)
     return check_busy(xueshan_kill)
end
function waitcd()
     mytime=os.time()
     if not wait_cd or mytime>wait_cd+8 then
     return check_busy(xueshan_kill)
     else
     wait.make(function() 
       wait.time(1)
       exe("alias acton 等待首饰冷却！")
       return waitcd()
    end)
   end
end
