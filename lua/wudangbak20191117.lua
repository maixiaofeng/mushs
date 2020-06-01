--wudang
wdtongji_total = 0
wdtongji_cs = 0 --领取job次数统计
wdtongji_lasttime_total = 0 
wdtongji_zdcs = 0 --战斗次数
wdtongji_lasttime_lj = 0  --累计战斗时间
wdtongji_thistime = 0 --本次任务战斗时间
wdtongji_pingjun = 0 --平均时间
wdtongji_fangqi = 0 --失败次数
wdtongji_finish = 0 --完成次数
wdtongji_cgl = 0 --成功率
wdtosld=0
wdtomr=0
wdtoyzw=0
wdtomtl=0
wdtoszgf=0
wdtohssd=0
wdtoxct=0

--共计完成【'..wdtongji_cs'】次,平均战斗时间【】次,成功【】次，失败【】次，完成率【】
wdgostart=0
function wudangTrigger()
    DeleteTriggerGroup("wudangAsk")
    create_trigger_t('wudangAsk1',"^(> )*你向宋远桥打听有关",'','wudangAsk')
    create_trigger_t('wudangAsk2',"^(> )*这里没有这个人。$",'','wudangNobody')
    SetTriggerOption("wudangAsk1","group","wudangAsk")
    SetTriggerOption("wudangAsk2","group","wudangAsk")
    EnableTriggerGroup("wudangAsk",false)
    DeleteTriggerGroup("wudangAccept")
    create_trigger_t('wudangAccept1',"^(> )*宋远桥在你的耳边悄声说道：据说(江南|江北|西南|中原|西北|河南|河北|东北)(草寇|寨主|恶霸|山贼|土匪|飞贼|盗贼)(\\D*)正在(\\D*)捣乱",'','wudangConsider')
    create_trigger_t('wudangAccept2',"^(> )*宋远桥说道：「我不是告诉你了吗，有人在",'','wudangFangqi')
    create_trigger_t('wudangAccept3',"^(> )*宋远桥在你的耳边悄声说道(\\D*)尤为擅长(\\D*)的功夫。",'','wudangNpc')
    create_trigger_t('wudangAccept4',"^(> )*宋远桥说道：「你正忙着别的事情呢",'','wudangFail')
    create_trigger_t('wudangAccept5',"^(> )*宋远桥说道：「你刚做完(武当锄奸|惩恶扬善|大理送信|抗敌颂摩崖)任务",'','wudangFail')
    create_trigger_t('wudangAccept6',"^(> )*宋远桥说道：「现在暂时没有适合你的工作",'','wudangFail')
    create_trigger_t('wudangAccept7',"^(> )*宋远桥说道：「暂时没有任务需要做，你过一会儿再来吧",'','wudangFail')
    create_trigger_t('wudangAccept8',"^(> )*宋远桥说道：「\\D*，你太让我失望了，居然这么点活都干不好，先退下吧",'','wudangFail')
    create_trigger_t('wudangAccept9',"^(> )*宋远桥说道：「\\D*，你又没在我这里领任务，瞎放弃什么呀",'','wudangFail')
    create_trigger_t('wudangAccept10',"^(> )*宋远桥说道：「\\D*，这个任务确实比较难完成，下次给你简单的，先退下吧！",'','wudangFail')
    create_trigger_t('wudangAccepta',"^(> )*宋远桥在你的耳边悄声说道：此人的武功(\\D*)，",'','wudanglevel')
    create_trigger_t('wudangAcceptb',"^(> )*宋远桥\\D*你快去快回，一切小心啊。",'','wudangFindGo')
    create_trigger_t('wudangAccept31',"^(> )*宋远桥在你的耳边悄声说道：老头子已追查到(\\D*)是我武当出身，尤为擅长(\\D*)的功夫。",'','wudangNpc')
    SetTriggerOption("wudangAccept31","group","wudangAccept")
    SetTriggerOption("wudangAccept1","group","wudangAccept")
    SetTriggerOption("wudangAccept2","group","wudangAccept")
    SetTriggerOption("wudangAccept3","group","wudangAccept")
    SetTriggerOption("wudangAccept4","group","wudangAccept")
    SetTriggerOption("wudangAccept5","group","wudangAccept")
    SetTriggerOption("wudangAccept6","group","wudangAccept")
    SetTriggerOption("wudangAccept7","group","wudangAccept")
    SetTriggerOption("wudangAccept8","group","wudangAccept")
    SetTriggerOption("wudangAccept9","group","wudangAccept")
    SetTriggerOption("wudangAccept10","group","wudangAccept")
    SetTriggerOption("wudangAccepta","group","wudangAccept")
    SetTriggerOption("wudangAcceptb","group","wudangAccept")
    EnableTriggerGroup("wudangAccept",false)
    DeleteTriggerGroup("wudangFight")
    create_trigger_t('wudangFight1','^(> )*(\\D*)「啪」的一声倒在地上','','wudangBack')
    create_trigger_t('wudangFight2','^(> )*(\\D*)大喊一声：不好！！转身几个起落就不见了','','wudangBack')
    create_trigger_t('wudangFight3',"^(> )*这里没有(\\D*)。",'','wudangLost')
    create_trigger_t('wudangFight4',"^(> )*(\\D*)对着你发出一阵阴笑，说道",'','wudangKillAct')
	create_trigger_t('wudangFight5',"^(> )*(\\D*)大喊一声：老子不奉陪了！转身几个起落就不见了",'','wudangBack')
    create_trigger_t('wudangFight6','^>*\\s*一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……','','wudangFangqiGo')
    create_trigger_t('wudangFight7',"^(他|她)装备着：$",'','npcWeapon')
	create_trigger_t('wudangFight8',"^(他|她)穿戴着：$",'','npcWeapon')
    SetTriggerOption("wudangFight1","group","wudangFight")
    SetTriggerOption("wudangFight2","group","wudangFight")
    SetTriggerOption("wudangFight3","group","wudangFight")
    SetTriggerOption("wudangFight4","group","wudangFight")
	SetTriggerOption("wudangFight5","group","wudangFight")
    SetTriggerOption("wudangFight6","group","wudangFight")
    SetTriggerOption("wudangFight7","group","wudangFight")
	SetTriggerOption("wudangFight8","group","wudangFight")
    EnableTriggerGroup("wudangFight",false)
    DeleteTriggerGroup("wudangFinish")
    create_trigger_t('wudangFinish1','^(> )*宋远桥对着你竖起了右手大拇指，好样的。','','wudangFinishT')
    create_trigger_t('wudangFinish2',"^(> )*宋远桥被你气得昏了过去。",'','wudangFinish')
    create_trigger_t('wudangFinish3',"^(> )*宋远桥说道：「"..score.name.."你怎么搞的",'','wudangFinish')
    SetTriggerOption("wudangFinish1","group","wudangFinish")
    SetTriggerOption("wudangFinish2","group","wudangFinish")
    SetTriggerOption("wudangFinish3","group","wudangFinish")
    EnableTriggerGroup("wudangFinish",false)
    DeleteTriggerGroup("wudangdebug")
    create_trigger_t('wudangdebug1','^(> )*看来该找机会逃跑了','','wudangdebugFind')
    SetTriggerOption("wudangdebug1","group","wudangdebug")
    EnableTriggerGroup("wudangdebug",true)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["wudang"] = "wudangFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["wudang"] = "wudangFindFail"
function wudangFindAgain()
    wdgostart=1
	EnableTriggerGroup("wudangFind",true)
	if flag.times==3 and dest.area=='华山' then
		return go(wudangFindAct,'华山村','菜地')
	end
	if flag.times==3 and dest.area=='襄阳城' and job.room=='山间空地' then
		return go(wudangFindAct,'襄阳郊外','瀑布')
	end
	if flag.times==2 and dest.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) then
		return go(wudangFindAct,'明教','练武场')
	end
	if flag.times==3 and job.area=='扬州城' and job.room=='南门' then
		return go(wudangFindAct,'扬州城','长江南岸')
	end
        if flag.times==3 and job.area=='伊犁城' and job.room=='伊犁河' or job.room=='南城门' then
		return go(wudangFindAct,'伊犁城','城中心')
	end
        if flag.times==3 and job.area=='兰州城' and job.room=='大道' then
		return go(wudangFindAct,'兰州城','永登')
        end
	if flag.times==3 and job.area=='扬州城' and job.room=='西大街' or job.room=='西门' or job.room=='瘦西湖' or job.room=='瘦西湖边' or job.room=='大虹桥' or job.room=='丽春院' then
		return go(wudangFindAct,'扬州城','瘦西湖酒馆')
	end
	if flag.times==3 and job.area=='兰州城' and job.room=='永登' then
		return go(wudangFindAct,'大渡口','黄河渡船')
	end
	if flag.times==3 and job.area=='铁掌山' and job.room=='山路' then
		return go(wudangFindAct,'铁掌山','中指峰')
	end
	if flag.times==3 and job.area=='杭州城' and job.room=='青石大道' then
		return go(wudangFindAct,'杭州城','飞来峰')
	end
	if flag.times==3 and job.area=='苗疆' and job.room=='山路' then
		return go(wudangFindAct,'苗疆','山洞')
	end
	if flag.times==3 and job.area=='杭州城' and job.room=='山路' then
		return go(wudangFindAct,'杭州城','雷峰塔')
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=='石板路' then
		return go(wudangFindAct,'嵩山少林','法堂')
	end
	if flag.times==3 and job.area=='兰州城' and job.room=='西城门' then
		return go(wudangFindAct,'兰州城','永登')
	end
	
	if flag.times==3 and job.area=='嵩山少林' and job.room=="罗汉堂" then
		return go(wudangFindAct,'嵩山少林','罗汉堂五部')
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=="般若堂" then
		return go(wudangFindAct,'嵩山少林','般若堂五部')
	end
    return go(wudangFindAct,job.area,job.room)
end
function wudangFindFail()
    EnableTriggerGroup("wudangFight",false)   
    return check_busy(wdFindFail)	
end
faintFunc = faintFunc or {}
faintFunc["wudang"] = "wudangFindAgain"
function wudangFaint()
    return wudangFindFail()
end
function wdFindFail()
locate_finish=0
fastLocate()
go(wudangFangqi,"武当山","三清殿")
end
function wudanglevel(n,l,w)
    job.level=w[2]
    --messageShow('WD job level:【'..job.level..'】')
end
function wudangTriggerDel()
    DeleteTriggerGroup("wudangdebug")
    DeleteTriggerGroup("wudangAsk")
    DeleteTriggerGroup("wudangAccept")
    DeleteTriggerGroup("wudangFight")
    DeleteTriggerGroup("wudangFinish")
    DeleteTriggerGroup("wudangFind")
end
function wudangNobody()
    EnableTriggerGroup("wudangAsk",false)
    wudang()
end
job.list["wudang"] ="武当杀恶贼"
function wudang()  
    wudangTrigger()
    job.level=nil
    job.lost=0
    job.name='wudang'
	return check_busy(wudangGo)
end
function wudangGo()
    --locate_finish=0
    return go(wudangBegin,"武当山","三清殿")
end
function wudangBegin()
    if newbie==1 then return zhunbeineili(wdstart) else return wdstart() end
end
function wdstart()
    locate_finish=0
    return prepare_lianxi(wudangStart)
end
function wudangStart()   
    wdgostart=1
    EnableTriggerGroup("wudangAsk",true)
    flag.idle = nil
    return wudangAsk11()
end
function wudangAsk11()
        wdsearch_get=0
        flag.wipe=1
        wudang_canagain=0
        EnableTriggerGroup("wudangAsk",true)
         return check_busy(wudang_check_ask)
		end
function wudang_check_ask()
    exe('ask song yuanqiao about job')
        create_timer_s('walkWait4',3.0,'wudang_ask_test')
end
wudang_ask_test=function()
    exe('ask song yuanqiao about job')       
end
function wudangAsk()
     dis_all()
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("wudangAsk",false)
    EnableTriggerGroup("wudangAccept",true)
end
function wudangBusy()
    EnableTriggerGroup("wudangAccept",false)
	job.last='wudang'
    return check_bei(wudangBusyDazuo)
end

function wudangBusyDazuo()
    exe('n')
    return prepare_lianxi(wudang)
end
function wudangFail()
      wdgostart=0
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("wudangAccept",false)
   if job.level=='已入化境' then
      job.level='未知'
    messageShow('武当任务：当前接到【已入化境】任务，现在开始化任务等级为【'..job.level..'】！','red')
		return check_busy(wudangHuajing_GoAgain)
	 end
    wudangTriggerDel()
    job.lost=0   
   setLocateRoomID='wudang/sanqing'
    if score.party=='华山派' and hp.shen<0 then
    return clb()
   end
	if job.last=="songxin" then
		return huashan()  
	else
		return songxin()
	end
end
function wudangConsider(n,l,w)
    local x
    nobusy=1
    job.time.b=os.time()
    job.last='wudang'
    job.target=Trim(w[4])
    job.killer={}
    job.killer[job.target]=true
    job.where=Trim(w[5])
	--Note(job.where)
	if string.find(job.where,"周围") then
	   local l_cnt = string.find(job.where,"周围")
	   job.where=string.sub(job.where,1,l_cnt-1)
	   Note(job.where)
	end
   if string.find(Trim(w[3]),"里之内") then
                x=string.find(Trim(w[3]),"里之内")
                wd_distance=trans(string.sub(Trim(w[3]),x-2,x-1))
        else
            wd_distance=4
        end
 if string.find(job.where,'神龙岛') then
wdtosld=wdtosld+1
end
if string.find(job.where,'姑苏慕容') then
wdtomr=wdtomr+1
end
if string.find(job.where,'燕子坞') then
wdtoyzw=wdtoyzw+1
end
if string.find(job.where,'曼佗罗山庄') then
wdtomtl=wdtomtl+1
end
if string.find(job.where,'苏州城闺房') then
wdtoszgf=wdtoszgf+1
end
if string.find(job.where,'华山石洞') and not Bag['绳子'] then
job.where= "华山山涧"
wdtohssd=wdtohssd+1
end
if string.find(job.where,'少林心禅堂') then
wdtoxct=wdtoxct+1
job.where= "嵩山少林心禅坪"
end
if string.find(job.where,"萧府大厅") or string.find(job.where,"萧府书房") or string.find(job.where,"萧府厨房") or string.find(job.where,"萧府后院") then
		job.where= "萧府萧府大门"
	end
if string.find(job.where,"苏州城闺房") and not Bag["铜钥匙"] then
		job.where= "苏州城翰林府院"
	end	
	if (string.find(job.where,"瘦西湖酒馆") or string.find(job.where,"瘦西湖雅楼") or string.find(job.where,"珠宝店")) then
		job.where= "扬州城西大街"
	end
	messageShow('武当地点统计：神龙岛【'..wdtosld..'】次 ！慕容【'..wdtomr..'】次 ！燕子坞【'..wdtoyzw..'】次 ！曼佗罗山庄【'..wdtomtl..'】次 ！',"cyan")
	messageShow('武当不可到达地点统计：华山石洞【'..wdtohssd..'】次 ！苏州闺房【'..wdtoszgf..'】次 ！心禅堂【'..wdtoxct..'】次 ！',"cyan")
    job.room,job.area=getAddr(job.where)
     
end
function wudangNpc(n,l,w)
    EnableTriggerGroup("wudangAccept",false)
    EnableTrigger("wudangAccepta",true)
    EnableTrigger("wudangAcceptb",true)
	sxjob.skills=tostring(w[3])
	--开始统计
	wdtongji_cs=wdtongji_cs+1
end
function wudangFindGo()
    EnableTriggerGroup("wudangAccept",false)
    dest.room=job.room
    dest.area=job.area
	job.wdtime=os.time() + 8*60
      exe('nick 武当任务'..job.where)
      exe('set no_kill_ap')
	--pfmjineng()
	setLocateRoomID='wudang/sanqing'
		if not job.room or not path_cal() then
       messageShow('武当任务：任务地点【'..job.where..'】不可到达，任务放弃。')
       --return check_busy(wudangFangqi)
	   return checkWait(wudangFangqi,1)
    end
	if skillIgnores[sxjob.skills] then
       messageShow('武当任务：'.. job.target ..'使用的武功是【'..sxjob.skills..'】不可力敌，任务放弃。')
	   --return check_busy(wudangFangqi)
	   return checkWait(wudangFangqi,1)
	end
	
	if job.level=='已入化境' then
		--return check_busy(wudangHuajing_Fangqi)
		return checkWait(wudangHuajing_Fangqi,1)
	end
	   --messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！')
	messageShow('武当任务：现在开始前往【'..job.where..'】！')
	
        ---return check_busy(wudangFind)
		return checkWait(wudangFind,1)
end
function wudangHuajing_Fangqi()
    EnableTriggerGroup("wudangAccept",false)
    messageShow('武当任务：假装放弃已入化境!','greenyellow')
    return check_busy(wudangFangqiAsk)
end
function wudangHuajing_GoAgain()
	job.wdtime=os.time() + 5*60
	--messageShow('武当任务概要：任务地点【'..job.where..'】，人物姓名【'..job.target..'】，使用技能【'..sxjob.skills..'】！','greenyellow')
  messageShow('武当任务：现在开始前往【'..job.where..'】！','greenyellow')
      
       return check_busy(wudangFind)
end
function wudangFangqiGo()
    locate_finish=0
	fastLocate()
    DeleteTimer("wudang")
    messageShow('被武当任务NPC打晕了，任务放弃！')
  go(wudangFangqi,'武当山','三清殿')
end
function wudangFangqi()
    wdtongji_fangqi=wdtongji_fangqi+1
	exe('nick 武当任务放弃')
    exe('unset no_kill_ap')
	locate_finish=0
	fastLocate()
    dis_all()
	kezhiwugongclose()
	flag.idle = nil
	job.level = nil
	job.lost = 0
	nobusy=0
    EnableTriggerGroup("wudangAccept",false)
    check_bei(wudangFangqiAsk)
end
function wudangFangqiAsk()
    
	--- pumkmai add ,防 flood
    EnableTriggerGroup("wudangAsk",true)
    wait.make(function() 
	                wait.time(1)
				    exe('ask song yuanqiao about 放弃')
	                setLocateRoomID='wudang/sanqing'
			    end)	 
  
    
end

function wudangFind()
    
    DeleteTriggerGroup("wudangFind")
    create_trigger_t('wudangFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','wudangTarget')
    create_trigger_t('wudangFind2',"^(> )*".. job.target .."对着你发出一阵阴笑，说道",'','wudangFindKill')
    SetTriggerOption("wudangFind1","group","wudangFind")
    SetTriggerOption("wudangFind2","group","wudangFind")
    flag.times=1
    flag.robber=false
	print('wudangFind........111111111111111')
	if kezhiDesc["正"][sxjob.skills] then
	local tmppfm = GetVariable("pmiao")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	if kezhiDesc["奇"][sxjob.skills] then
	local tmppfm = GetVariable("pxian")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["刚"][sxjob.skills] then
	local tmppfm = GetVariable("pkuai")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["柔"][sxjob.skills] then
	local tmppfm = GetVariable("pman")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["快"][sxjob.skills] then
	local tmppfm = GetVariable("prou")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["慢"][sxjob.skills] then
	local tmppfm = GetVariable("pgang")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["妙"][sxjob.skills] then
	local tmppfm = GetVariable("pqi")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["险"][sxjob.skills] then
	local tmppfm = GetVariable("pzhen")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(2,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["空"][sxjob.skills] then
	local tmppfm = GetVariable("pkong")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["无"][sxjob.skills] then
	local tmppfm = GetVariable("pwu")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	print('wudangFind........2222222222222222')
	return check_busy(wdFindAct)
end

function wdFindAct()
--locate_finish=0
go(wudangFindAct,job.area,job.room) 
end   
function wudangdebugFind()
    DeleteTriggerGroup("wudangFind")
    create_trigger_t('wudangFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','wudangTarget')
    SetTriggerOption("wudangFind1","group","wudangFind")
    flag.times=1
    flag.robber=false
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
    go(wudangFinddebug,job.area,job.room)    
end
function wudangFinddebug()
    EnableTriggerGroup("wudangFind",true)
    DeleteTimer("wudang")
    job.flag()
    exe('look')
    find()
    messageShow('武当任务：开始重新寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
end
function wudangFindAct()
    EnableTriggerGroup("wudangFind",true)
    DeleteTimer("wudang")
    job.flag()
    exe('look')
    --find()	
    messageShow('武当任务：已到达任务地点【'..job.where..'】，开始寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
    return check_busy(find)
end
function wudangFindKill()
    wdgostart=0
    dis_all()
    flag.robber=true
    EnableTriggerGroup("wudangdebug",true)
    EnableTrigger("wudangFind1",true)
    exe('look')
end
function wudangTarget(n,l,w)
    EnableTriggerGroup("wudangFind",false)
    dis_all()
    EnableTriggerGroup("wudangdebug",true)
    EnableTriggerGroup("wudangFight",true)
    EnableTrigger("hpheqi1",true)
    job.id=string.lower(w[2])
    job.killer[job.target]=job.id
    exe('follow '..job.id)
	--exe('look '..job.id)
    exe('unset no_kill_ap')
       wudangKillAct()
      create_timer_s('wudang',5,'wudangMove')
end
function wudangMove()
	if job.id then
	   exe('kick '..job.id)
	   exe('kill '..job.id)
	end
end
function wudangLost(n,l,w)
     wdgostart=0
	 locate_finish=0
	 fastLocate()
    job.lost=job.lost+1
    if job.lost>4 then
       job.lost=0
    messageShow('武当任务：搜索丢失【'.. job.target ..'】两次！回去放弃！')
       return check_halt(wudangFindFail)
    end
    if job.id==Trim(w[2]) then
       dis_all()
    EnableTriggerGroup("wudangdebug",true)
       return wudangFind()
    end
end
function wudangKill()
    wait.make(function()
         wait.time(0.3)
	 wudangKillAct()
    end)
end
function wudangKillAct()
fight.time.b=os.time()
    flag.robber=true
    exe('set wimpy 100;yield no')
	exe('kill '..job.id)
	return wdkill_npc()
end
function wdkill_npc()	
	kezhiwugong()
	kezhiwugongAddTarget(job.target,job.id)
end
function wudangBack(n,l,w)
   EnableTriggerGroup("wipe",false) 
    wdgostart=0
    DeleteTimer("wudang")	
    if w[2]==job.target then
       EnableTriggerGroup("wudangFight",false)
       EnableTriggerGroup("wudangFinish",true)
       tmp.number=0
       DeleteTimer("perform")
	   DeleteTimer("wudang")
	   kezhiwugongclose()
       check_busy(wudangBackGet)	   
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
       wdtongji_thistime=fight.time.over
	   --开始统计
       wdtongji_zdcs=wdtongji_zdcs+1	   
	   wdtongji_lasttime_lj=wdtongji_lasttime_lj+wdtongji_thistime
	   wdtongji_pingjun=string.format("%0.2f",wdtongji_lasttime_lj/wdtongji_zdcs)
	   messageShowT('武当任务：【'..job.target..'】【'..job.id..'】。使用武功【'..npc_skill..'】，武功属性【'..npc_val..'】。')
       messageShowT('武当任务：搞定'..'【'.. job.target ..'】！战斗用时:【'..fight.time.over..'】秒。')
	   
    end
end
function wudangBackGet()
  wipe_kill = 0
  
   wudangCk=0
   flag.wipe=0
   dis_all()
	weapon_unwield()
	bqcheck()
    EnableTriggerGroup("wudangFinish",true)
    return wudang_wc()		
end
function wudang_wc()

go(wudangFinishC,'武当山','三清殿')
end
function wudangFinishWait()
    if locl.id["宋远桥"] then
	   return wudangFinishC()
        else
	   return go(wudangFinishWait,'武当山','三清殿')
    end
end
function wudangFinishT()
    wdtongji_finish=wdtongji_finish+1
	wudang_cs=wudang_cs+1
	print('老宋夸我干得好。')
	--setLocateRoomID='wudang/sanqing'
end
function wudangFinishC()
	print('等待老宋发奖励。')
    if wudangjobok==0 and wudangCk<5 then
    wait.make(function()
         wait.time(1)
	wudangCk=wudangCk+1
	exe('out;enter')
	return wudangFinishC()
    end)
    else
	return wudangFangqi()
    end
end
function wudangFinish()
    EnableTriggerGroup("wudangFinish",false)
    wudangTriggerDel()
    wudangjobok=0
	wudangcss=1	
	wudangcs=wudangcss+1
    job.wdtime=0
    wudangCk=0
    nobusy=0
	locate_finish=0
    job.lost=0
    job.last='wudang'
	kezhiwugongclose()
   quick_locate=1	
	if wudang_cs>6 then
	wudang_cs=0
	exe('score;ask song yuanqiao about 杂役')  
	return check_halt(wudang_chifan)
	else
	
	return check_halt(check_jobx)
	end	
end
