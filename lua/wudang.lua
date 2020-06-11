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
wd_ask_fangqi=0
last_wdjob_status=nil
job_suspend=nil

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
    --create_trigger_t('wudangFight3',"^(> )*这里没有(\\D*)。",'','wudangLost')
    create_trigger_t('wudangFight4',"^(> )*(\\D*)对着你发出一阵阴笑，说道",'','wudangKillAct')
	create_trigger_t('wudangFight5',"^(> )*(\\D*)大喊一声：老子不奉陪了！转身几个起落就不见了",'','wudangBack')
    create_trigger_t('wudangFight6','^>*\\s*一股暖流发自丹田流向全身，慢慢地你又恢复了知觉……','','wudangFangqiGo')
    create_trigger_t('wudangFight7',"^(他|她)装备着：$",'','npcWeapon')
	create_trigger_t('wudangFight8',"^(他|她)穿戴着：$",'','npcWeapon')
    SetTriggerOption("wudangFight1","group","wudangFight")
    SetTriggerOption("wudangFight2","group","wudangFight")
    --SetTriggerOption("wudangFight3","group","wudangFight")
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

---------------------- wudang job 挂起 -----------------

-- HugJob class ---- 



function clone(org)
    local function copy(org, res)
        for k,v in pairs(org) do
            if type(v) ~= "table" then
                res[k] = v;
            else
                res[k] = {};
                copy(v, res[k])
            end
        end
    end

    local res = {}
    copy(org, res)
    return res
end



---------------------- end  --------------------------------

jobFindAgain = jobFindAgain or {}
jobFindAgain["wudang"] = "wudangFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["wudang"] = "wudangFindFail"
function wudangFindAgain()
    --如果是归途中晕倒
	if dest.area=='武当山' and dest.room=='三清殿' then 
	    jobfailLog()
	    EnableTriggerGroup("wudangFinish",true)
        return wudang_wc() 
	end 
	
    print('wudangFindAgain......flag.times:'..flag.times)
	flag.searchRooms = nil
    wdgostart=1
	EnableTriggerGroup("wudangFind",true)
	--[[
	if flag.times==3 and dest.area=='华山' or dest.area=='华山村' then
		return go(wudangFindAct,'华山村','菜地')
	end
	]]--
	--[[if flag.times==3 and dest.area=='襄阳城' and job.room=='山间空地' then
		return go(wudangFindAct,'襄阳郊外','瀑布')
	end]]--
	
	--[[
	if flag.times==2 and dest.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) then
		return go(wudangFindAct,'明教','练武场')
	end
	]]--
	
	if flag.times==2 and dest.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,job.area,job.room) 
		
		-- flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3},{'小厅','明教',3}}
		 --return go(wudangFindAct,'明教','烈火旗') 
		
	end
	
	if flag.times==3 and dest.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) then
	    flag.searchRooms = {{'聚议厅','明教',6},{'光明顶','明教',6}}
		return go(wudangFindAct,'明教','聚议厅')
	end
	
	if flag.times==2 and dest.area=='明教' and  (job.room=="烈火旗" or  job.room=="厚土旗" or  job.room=="洪水旗" or job.room=="锐金旗") then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','紫杉林') 
	end
		
	if flag.times==3 and dest.area=='明教' and  (job.room=="烈火旗" or  job.room=="厚土旗" or  job.room=="洪水旗" or job.room=="锐金旗") then
	    flag.searchRooms = {{'聚议厅','明教',6},{'光明顶','明教',6}}
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','聚议厅')
	end
	
	
	if flag.times==2 and dest.area=='明教' and  job.room=="圣火堂" then
	    flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3}}
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','厚土旗') 
	end
		
	if flag.times==3 and dest.area=='明教' and job.room=="圣火堂" then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','紫杉林') 
	end
	
	
	if flag.times==2 and dest.area=='明教' and  job.room=="龙王殿" then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','紫杉林') 
	end
	
	if flag.times==3 and dest.area=='明教' and  job.room=="龙王殿" then
	    flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3}}
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,'明教','厚土旗') 
	end
	
	
	
	
	if flag.times==2 and dest.area=='峨嵋山' and  (job.room=="福寿庵" or job.room=="清音阁" or job.room=="神水庵" or job.room=="灵文阁") then
	    flag.searchRooms = {{'福寿庵','峨嵋山',4},{'清音阁','峨嵋山',6},{'炭窑','峨嵋山',6}}
		--return go(wudangFindAct,'明教','紫杉林')
		return go(wudangFindAct,job.area,job.room) 
	end 
	
		
	if flag.times==3 and job.area=='扬州城' and job.room=='南门' then
		return go(wudangFindAct,'扬州城','长江南岸')
	end
    
	--[[if flag.times==3 and job.area=='伊犁城' and (job.room=='伊犁河' or job.room=='南城门') then
		return go(wudangFindAct,'伊犁城','城中心')
	end]]--
    
	if flag.times==3 and job.area=='兰州城' and job.room=='大道' then
		return go(wudangFindAct,'兰州城','永登')
    end
    if flag.times==3 and job.area=='兰州城' and job.room=='永登' then
		return go(wudangFindAct,'兰州城','大渡口')
	end
	
	--[[
	if flag.times==3 and job.area=='扬州城' and (job.room=='西大街' or job.room=='西门' or job.room=='瘦西湖' or job.room=='瘦西湖边' or job.room=='大虹桥' or job.room=='丽春院') then
		return go(wudangFindAct,'扬州城','瘦西湖酒馆')
	end
	]]--
	
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
	    job.where='嵩山少林罗汉堂五部'
		job.room='罗汉堂五部'
		return go(wudangFindAct,'嵩山少林','罗汉堂五部')
	end
	if flag.times==3 and job.area=='嵩山少林' and job.room=="般若堂" then
		return go(wudangFindAct,'嵩山少林','般若堂五部')
	end
	
	if flag.times==3 and job.area=='长乐帮'  then
	    flag.searchArea={[8]='city/',[300]='changle/'}
		return go(wudangFindAct,'长乐帮','大门')
	end
	
	if flag.times==3 and job.area=='神龙岛'  then
	    flag.searchArea={[300]='sld/'}
		return go(wudangFindAct,'神龙岛','渡口')
	end
	
	if flag.times==3 and job.area=='莆田少林'  then
	     flag.searchArea={[300]='putian/'}
		return go(wudangFindAct,'莆田少林','山门')
	end
	
	if flag.times==2 and job.area=='昆仑山' and (job.room=='灵獒宫' or job.room=='暖阁' or job.room=='红梅山庄')  then
	    flag.searchRooms = {{'红梅山庄','昆仑山',4},{'悬崖','昆仑山',4},{'昆仑派山门','昆仑山',4}}
		return go(wudangFindAct,'昆仑山','红梅山庄')
	end
	
	if flag.times==3 and job.area=='昆仑山' and (job.room=='灵獒宫' or job.room=='暖阁' or job.room=='红梅山庄')  then
         flag.searchRooms = {{'红梅山庄','昆仑山',4},{'悬崖','昆仑山',4},{'昆仑派山门','昆仑山',4},{'石屏风','昆仑山',4},{'铁琴居','昆仑山',4},{'三圣堂','昆仑山',4}}
		return go(wudangFindAct,'昆仑山','红梅山庄')
	end
	
	if flag.times==3 and job.area=='昆仑山'  then
	    flag.searchArea={[300]='kunlun/',[301]='fairyland/'}
		return go(wudangFindAct,'昆仑山','镇远桥')
	end
	
	if flag.times==3 and (job.area=='华山' or job.area=='华山村' ) then
	    flag.searchArea={[300]='huashan/',[301]='village/'}
		return go(wudangFindAct,'华山','玉女峰')
	end
	
	if flag.times==3 and job.area=='长安城' then
	    flag.searchArea={[300]='changan/'}
		return go(wudangFindAct,'长安城','钟楼')
	end
	
	if flag.times==3 and job.area=='曼佗罗山庄' then
	    flag.searchArea={[300]='mtl/'}
		return go(wudangFindAct,'曼佗罗山庄','云锦楼')
	end
	
	
    return go(wudangFindAct,job.area,job.room)
end
--真正搜索失败
function wudangFindFail()
    EnableTriggerGroup("wudangFight",false)  
    job.ori_where=nil
    job_suspend=nil	
	
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
	DeleteTriggerGroup("wudangFind_MayBeLost")
end
function wudangNobody()
    EnableTriggerGroup("wudangAsk",false)
    wudang()
end
job.list["wudang"] ="武当杀恶贼"
function wudang()  
    SetSpeedWalkDelay(speed_walk_delay)
    wudangTrigger()
    job.level=nil
    job.lost=0
	wd_ask_fangqi=0
    job.name='wudang'
	flag.searchArea=nil
	flag.searchRooms=nil
	job.ori_where=nil
	job_suspend=nil
	--last_wdjob_status=nil
	return check_busy(wudangGo)
end
function wudangGo()
    locate_finish=0
    return go(wudangBegin,"武当山","三清殿")
	--return go(wudangGo_confirm,"武当山","三清殿")
end

function wudangGo_confirm()
    locate_finish=0
	fastLocate()
    if locl.room=='三清殿' then 
	    return wudangBegin()
	else
	    go(wudangBegin,"武当山","三清殿")
	end
end

function wudangBegin()
    if newbie==1 then return zhunbeineili(wdstart) else return wdstart() end
end
function wdstart()
    locate_finish=0
    ---return prepare_lianxi(wudangStart)
	return wudangStart()
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
      wd_ask_fangqi=1
      wdgostart=0
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("wudangAccept",false)
   if job.level=='已入化境' then
      job.level='未知'
      messageShow('武当任务：当前接到【已入化境】任务，现在开始化任务等级为【'..job.level..'】！','red')
	  wdgostart=1
		return check_busy(wudangHuajing_GoAgain)
	end
    wudangTriggerDel()
    job.lost=0   
    setLocateRoomID='wudang/sanqing'
    if score.party=='华山派' and hp.shen<0 then
      return clb()
    end
	
	if last_wdjob_status==0 then 
		
	  wait.make(function()
	    local self = coroutine.running()
		local async_continue = function()       
            print("async resume")
			--print('self='..self)
            coroutine.resume(self)
        end
		
		local check_pot_point = check_pot_test()
		if check_pot_point == 1 then 
		    check_pot(async_continue)
		    coroutine.yield() 
		end

		print('wdjob resum.......')
		if job.last=="songxin" then
		    return huashan()  
	    else
		    return songxin()
	    end
	  end)
	
	else
	
	    if job.last=="songxin" then
		    return huashan()  
	    else
		    return songxin()
	    end
	
	end 
	
end





function wudangConsider_test()
    local x
    nobusy=1
    job.time.b=os.time()
    job.last='wudang'
	job.name='wudang'
    job.target='沙忠'
	print('job.target..'..job.target)
    job.killer={}
    job.killer[job.target]=true
    job.where='星宿海山洞周围方圆三里之内'
	local ori_where = job.where
	print('job.where..'..job.where)
	if string.find(job.where,"周围") then
	   local l_cnt = string.find(job.where,"周围")
	   job.where=string.sub(job.where,1,l_cnt-1)
	   Note(job.where)
	end
	--print('计算距离..'..w[5])
	 
	 if string.find(ori_where,"里之内") then
                x=string.find(ori_where,"里之内")
                wd_distance=trans(string.sub(ori_where,x-2,x-1))
				print('wd_distance..'..wd_distance)
        else
            wd_distance=4
        end
	 
    job.room,job.area=getAddr(job.where)
	print('job.room,job.area..'..job.room..','..job.area)

end


function wudangConsider(n,l,w)
    local x
    nobusy=1
    job.time.b=os.time()
    job.last='wudang'
	print('任务地点打印...:...'..w[1]..';'..w[2]..';'..w[3]..';'..w[4]..';'..w[5])
    job.target=Trim(w[4])
	print('job.target..'..job.target)
    job.killer={}
    job.killer[job.target]=true
    job.where=Trim(w[5])
	print('job.where..'..job.where)
	--Note(job.where)
	if string.find(job.where,"周围") then
	   local l_cnt = string.find(job.where,"周围")
	   job.where=string.sub(job.where,1,l_cnt-1)
	   Note(job.where)
	end
	print('计算距离..'..w[5])
   ---if string.find(Trim(w[3]),"里之内") then
   if string.find(Trim(w[5]),"里之内") then
                x=string.find(Trim(w[5]),"里之内")
                wd_distance=trans(string.sub(Trim(w[5]),x-2,x-1))
				print('wd_distance..'..wd_distance)
        else
            wd_distance=4
        end
	

if string.find(job.where,"萧府大厅") or string.find(job.where,"萧府书房") or string.find(job.where,"萧府厨房") or string.find(job.where,"萧府后院") then
		job.where= "萧府萧府大门"
	end
if string.find(job.where,"苏州城闺房") and not Bag["铜钥匙"] then
		job.where= "苏州城翰林府院"
	end	
 --if string.find(job.where,'地下黑拳市') or string.find(job.where,'武当山院门') or string.find(job.where,'武当山后山小院') then
    if string.find(job.where,'地下黑拳市')  then
       messageShow('武当任务②：任务地点【'..job.where..'】不可到达，任务放弃。')
       return check_halt(wudangFindFail)
    end 

	
	if (string.find(job.where,"伊犁城铁铺") or string.find(job.where,"伊犁城客栈")  or string.find(job.where,"伊犁城商铺")  or string.find(job.where,"伊犁城巴依家院")  or string.find(job.where,"伊犁城城中心")) then
		job.ori_where=job.where
		job.where= "伊犁城南城门"
	end
	
	if (string.find(job.where,"扬州城珠宝店") or string.find(job.where,"扬州城瘦西湖酒馆")  or string.find(job.where,"扬州城瘦西湖雅楼")  ) then
		job.ori_where=job.where
		job.where= "扬州城西大街"
	end
	
	if string.find(job.where,"嵩山少林心禅堂") then
		job.where= "嵩山少林心禅坪"
	end
	
	if (string.find(job.where,"武当山院门") or string.find(job.where,"武当山后山小院")) then
		job.where= "武当山小径"
	end
	
		
	--messageShow('武当地点统计：神龙岛【'..wdtosld..'】次 ！慕容【'..wdtomr..'】次 ！燕子坞【'..wdtoyzw..'】次 ！曼佗罗山庄【'..wdtomtl..'】次 ！',"cyan")
	--messageShow('武当不可到达地点统计：华山石洞【'..wdtohssd..'】次 ！苏州闺房【'..wdtoszgf..'】次 ！心禅堂【'..wdtoxct..'】次 ！',"cyan")
    job.room,job.area=getAddr(job.where)
	print('job.room,job.area..'..job.room..','..job.area)
     
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
	  exe('score')
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

function wudangYiliFindFail()
    print('wudangYiliFindFail........')
	--jobfailLog()
    if job_suspend == nil then 
	    job_suspend = clone(job)
		job_suspend.npcskill = sxjob.skills
		messageShow('wudang 任务'..job_suspend.ori_where..'搜索失败，返回放弃!')
        return go(wudangFangqi,'武当山','三清殿')
	else
        return check_jobx()	
	end
end

function wudangSpecailLocationFindFail()
    print('wudangSpecailLocationFindFail........')
	--jobfailLog()
    if job_suspend == nil then 
	    job_suspend = clone(job)
		job_suspend.npcskill = sxjob.skills
		job_suspend.trytimes = 0
		messageShow('wudang 任务'..job_suspend.where..'搜索失败，返回放弃!')
        return go(wudangFangqi,'武当山','三清殿')
	else
        return check_jobx()	
	end
end



function wudangFangqiGo()
    print('wudangFangqiGo......')
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
	last_wdjob_status=0
    EnableTriggerGroup("wudangAccept",false)
    check_bei(wudangFangqiAsk)
end
function wudangFangqiAsk()
    wd_ask_fangqi = 0
	--- pumkmai add ,防 flood
    EnableTriggerGroup("wudangAsk",true)
    wait.make(function() 
	       while true do
		      exe('ask song yuanqiao about 放弃')
	          setLocateRoomID='wudang/sanqing'
		      wait.time(1)
			  if wd_ask_fangqi==1 then break end 
		   end 
	end)	      
end

function wudang_fight_kill()
    EnableTrigger('wudangFind3',false)
	--jiaosha_kill=1
end 

function wudangSuspendFind()
    print('wudangSuspendFind.....................')
	
		
    DeleteTriggerGroup("wudangFind")
	
	job.target = job_suspend.target
	job.area = job_suspend.area
	job.room = job_suspend.room
	sxjob.skills = job_suspend.npcskill
	job.where = job_suspend.where
	job.name = 'wudang'
	job.last = 'wudang'
	if job_suspend.ori_where~=nil then job.ori_where = job_suspend.ori_where end
	if job_suspend.trytimes ~= nil then 
	    job_suspend.trytimes = job_suspend.trytimes + 1
	end
	wudangTrigger()
	
    create_trigger_t('wudangFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','wudangTarget')
    create_trigger_t('wudangFind2',"^(> )*".. job.target .."对着你发出一阵阴笑，说道",'','wudangFindKill')
	create_trigger_t('wudangFind3','你对着'..job.target..'大喝一声：「臭贼！'..job.target..'，','','wudang_fight_kill')
	
	
    SetTriggerOption("wudangFind1","group","wudangFind")
    SetTriggerOption("wudangFind2","group","wudangFind")
	SetTriggerOption("wudangFind3","group","wudangFind")
	
	DeleteTriggerGroup("wudangFind_MayBeLost")
	create_trigger_t('wudangFind_MayBeLost1',""..job.target.."见势不妙，奋力一挣，向外逃窜",'','wudangTarget_maybelost1')
	create_trigger_t('wudangFind_MayBeLost2',"^(> )*你要对谁做这个动作？",'','wudangTarget_maybelost2')
	create_trigger_t('wudangFind_MayBeLost3',"^(> )*这里没有这个人。",'','wudangTarget_maybelost3')
	SetTriggerOption("wudangFind_MayBeLost1","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost2","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost3","group","wudangFind_MayBeLost")
	EnableTriggerGroup("wudangFind_MayBeLost",false)
	
	
    flag.times = 1
    flag.robber=false
	print('wudangSuspendFind........111111111111111')
	
		
	if kezhiDesc["正"][sxjob.skills] then
	     tmppfm = GetVariable("pmiao")  
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["奇"][sxjob.skills] then
        tmppfm = GetVariable("pxian")
		---local tmppfm = GetVariable("pxian")
	    create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	    exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	    DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["刚"][sxjob.skills] then
	     tmppfm = GetVariable("pkuai")
	---local tmppfm = GetVariable("pkuai")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["柔"][sxjob.skills] then
	     tmppfm = GetVariable("pman")
	---local tmppfm = GetVariable("pman")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["快"][sxjob.skills] then
	     tmppfm = GetVariable("prou")
	---local tmppfm = GetVariable("prou")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["慢"][sxjob.skills] then
	     tmppfm = GetVariable("pgang")
	---local tmppfm = GetVariable("pgang")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["妙"][sxjob.skills] then
	     tmppfm = GetVariable("pqi")
	---local tmppfm = GetVariable("pqi")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["险"][sxjob.skills] then
	     tmppfm = GetVariable("pzhen")
	---local tmppfm = GetVariable("pzhen")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(2,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["空"][sxjob.skills] then
	     tmppfm = GetVariable("pkong")
	---local tmppfm = GetVariable("pkong")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["无"][sxjob.skills] then
	     tmppfm = GetVariable("pwu")
	---local tmppfm = GetVariable("pwu")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(0.5,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["坑"][sxjob.skills] then
	     tmppfm = GetVariable("pkeng")
	---local tmppfm = GetVariable("pwu")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(0.5,'kezhiwugongpfm',10)
	end
	
	
	print('wudangSuspendFind........2222222222222222')
	return check_busy(wdFindAct)
end




--wudangTarget_lost_num = 0
function wudangFind()
    --jiaosha_kill=0
    DeleteTriggerGroup("wudangFind")
    create_trigger_t('wudangFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','wudangTarget')
    create_trigger_t('wudangFind2',"^(> )*".. job.target .."对着你发出一阵阴笑，说道",'','wudangFindKill')
	create_trigger_t('wudangFind3','你对着'..job.target..'大喝一声：「臭贼！'..job.target..'，','','wudang_fight_kill')
	
	
    SetTriggerOption("wudangFind1","group","wudangFind")
    SetTriggerOption("wudangFind2","group","wudangFind")
	SetTriggerOption("wudangFind3","group","wudangFind")
	
	DeleteTriggerGroup("wudangFind_MayBeLost")
	create_trigger_t('wudangFind_MayBeLost1',""..job.target.."见势不妙，奋力一挣，向外逃窜",'','wudangTarget_maybelost1')
	create_trigger_t('wudangFind_MayBeLost2',"^(> )*你要对谁做这个动作？",'','wudangTarget_maybelost2')
	create_trigger_t('wudangFind_MayBeLost3',"^(> )*这里没有这个人。",'','wudangTarget_maybelost3')
	SetTriggerOption("wudangFind_MayBeLost1","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost2","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost3","group","wudangFind_MayBeLost")
	EnableTriggerGroup("wudangFind_MayBeLost",false)
	--wudangTarget_lost_num=0
	
	
	if job.lost == 0 or job.lost==nil then
	   flag.times = 1
	else
	   flag.times = job.lost
	end 
	print(flag.times)
    ---flag.times=1
    flag.robber=false
	print('wudangFind........111111111111111')
	

	local use_wxb_sq = tonumber(GetVariable('use_wxb_sq'))
	
	if kezhiDesc["正"][sxjob.skills] then
	  if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pmiao")  
	  else
	     tmppfm = GetVariable("pmiao")
	  end 
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["奇"][sxjob.skills] then
	  
	  if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pxian")  
	  else
	     tmppfm = GetVariable("pxian")
	  end 
	   
	---local tmppfm = GetVariable("pxian")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["刚"][sxjob.skills] then
	  if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pkuai")  
	  else
	     tmppfm = GetVariable("pkuai")
	  end 
	---local tmppfm = GetVariable("pkuai")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["柔"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pman")  
	  else
	     tmppfm = GetVariable("pman")
	  end 
	---local tmppfm = GetVariable("pman")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["快"][sxjob.skills] then
	  
	  if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_prou")  
	  else
	     tmppfm = GetVariable("prou")
	  end 
	---local tmppfm = GetVariable("prou")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["慢"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pgang")  
	  else
	     tmppfm = GetVariable("pgang")
	  end 
	---local tmppfm = GetVariable("pgang")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["妙"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pqi")  
	  else
	     tmppfm = GetVariable("pqi")
	  end 
	---local tmppfm = GetVariable("pqi")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["险"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pzhen")  
	  else
	     tmppfm = GetVariable("pzhen")
	  end 
	---local tmppfm = GetVariable("pzhen")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(2,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["空"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pkong")  
	  else
	     tmppfm = GetVariable("pkong")
	  end 
	---local tmppfm = GetVariable("pkong")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["无"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pwu")  
	  else
	     tmppfm = GetVariable("pwu")
	  end 
	---local tmppfm = GetVariable("pwu")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(0.5,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["坑"][sxjob.skills] then
	   if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pkeng")  
	  else
	     tmppfm = GetVariable("pkeng")
	  end 
	---local tmppfm = GetVariable("pwu")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(0.5,'kezhiwugongpfm',10)
	end
	
	
	print('wudangFind........2222222222222222')
	return check_busy(wdFindAct)
end

function wdFindAct()
--locate_finish=0

  if job.area=='明教' and (job.room=="紫杉林" or string.find(job.room,"字门")) and flag.times==1 then 
	     flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3}}
		 go(wudangFindAct,'明教','烈火旗') 
		 
  elseif  job.area=='明教' and (job.room=="烈火旗" or  job.room=="厚土旗" or  job.room=="洪水旗" or job.room=="锐金旗") and flag.times==1 then 
	     flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3}}
		 go(wudangFindAct, job.area, job.room)
	
    elseif job.area=='明教' and (job.room=="练武场") and flag.times==1 then 
	     flag.searchRooms = {{'烈火旗','明教',3},{'厚土旗','明教',3},{'洪水旗','明教',3},{'锐金旗','明教',3},{'光明顶','明教',3},{'小厅','明教',3}}
		 go(wudangFindAct, job.area, job.room)
	
	else
	     go(wudangFindAct,job.area,job.room) 
	end
	
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
    print('wudangFindKill.......')
    wdgostart=0
    dis_all()
    flag.robber=true
    EnableTriggerGroup("wudangdebug",true)
    EnableTrigger("wudangFind1",true)
    --exe('look')
	
	wait.make(function()
	    while true do
		    exe('look')
	        exe('hug '..score.id)
			 local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			 if l~=nil then break end
		end
	end)
	
end
function wudangTarget(n,l,w)
    print('wudangTarget..........')
    DiscardQueue()
    EnableTriggerGroup("wudangFind",false)
    dis_all()
	locate_finish=0
    EnableTriggerGroup("wudangdebug",true)
    EnableTriggerGroup("wudangFight",true)
    EnableTrigger("hpheqi1",true)
	EnableTrigger("wudangFind3",true)
	EnableTrigger("wudangFind_MayBeLost1",true)
	EnableTrigger("wudangFind_MayBeLost2",true)
	
    job.id=string.lower(w[2])
    job.killer[job.target]=job.id
    exe('follow '..job.id)
	--exe('look '..job.id)
    exe('unset no_kill_ap')
       wudangKillAct()
      create_timer_s('wudang',5,'wudangMove')
end

function wudangTarget_maybelost1()
    print('wudangTarget_maybelost1............')
    EnableTrigger("wudangFind_MayBeLost1",false)
	EnableTrigger("wudangFind_MayBeLost2",true)
end

function wudangTarget_maybelost2()
    print('wudangTarget_maybelost2............')
    EnableTrigger("wudangFind_MayBeLost2",false)
	EnableTrigger("wudangFind_MayBeLost3",true)
end

function wudangTarget_maybelost3()
    print('wudangTarget_maybelost3............')
	EnableTriggerGroup("wudangFind_MayBeLost",false)
	EnableTimer('wudang',false)
	wdgostart=0
	locate_finish=0
	fastLocate()
    job.lost=job.lost+1
    if job.lost>4 then
       job.lost=0
       messageShow('武当任务：搜索丢失【'.. job.target ..'】4次！回去放弃！')
	   jobfailLog()
       return check_halt(wudangFindFail)
    end

    dis_all()
    EnableTriggerGroup("wudangdebug",true)
	if flag.times==1 then 
	    return wudangFind()
	else
	    return wudangFindAgain()
	end
	
    
end


function wudangMove()
    print('wudangMove.........')
	if job.id then
	   exe('kick '..job.id)
	   exe('kill '..job.id)
	end
end
function wudangLost(n,l,w)
    print('wudangLost.............')
     wdgostart=0
	 locate_finish=0
	 fastLocate()
    job.lost=job.lost+1
    if job.lost>4 then
       job.lost=0
       messageShow('武当任务：搜索丢失【'.. job.target ..'】4次！回去放弃！')
	   jobfailLog()
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
         --wait.time(0.3)
	      wudangKillAct()
    end)
end
function wudangKillAct()
fight.time.b=os.time()
    flag.robber=true
	
	wait.make(function()
	    while true do
		    exe('set wimpy 100;yield no')
	        exe('kill '..job.id)
	        exe('hug '..score.id)
			 local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			 if l~=nil then break end
		end
	end)
	
    --exe('set wimpy 100;yield no')
	--exe('kill '..job.id)
	--exe('kick2 '..job.id)
	return wdkill_npc()
	
end
function wdkill_npc()	
    heqi_count=0
	kezhiwugong()
	kezhiwugongAddTarget(job.target,job.id)
end
function wudangBack(n,l,w)
   print('wudangBack..........:'..w[2])
   --[[EnableTriggerGroup("wipe",false) 
   EnableTriggerGroup("wudangFind_MayBeLost",false)
    wdgostart=0
    DeleteTimer("wudang")	
    ]]--
	if w[2]==job.target then
	   EnableTriggerGroup("wipe",false) 
       EnableTriggerGroup("wudangFind_MayBeLost",false)
       wdgostart=0
       DeleteTimer("wudang")	
	
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
	---maixf add do lost 2020.2.1
	local job_finish_ll = tonumber(GetVariable('job_finish_ll'))
	if job_finish_ll == 1 and lostletter==1 and needdolost==1 then 
	   if lookxin==1 then 
	      sendXXin()
	   else
	      return letterLost()
	   end 
	else 
	  EnableTriggerGroup("wudangFinish",true)
      return wudang_wc()
	end 
    		
end
function wudang_wc()
    wudangjobok=0
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
	last_wdjob_status=1
	print('老宋夸我干得好。')
	--setLocateRoomID='wudang/sanqing'
end
function wudangFinishC()
	print('等待老宋发奖励。')
      if wudangjobok==0 and wudangCk<5 then
         wait.make(function()
             wait.time(0.5)
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
	EnableTriggerGroup("wudangFind_MayBeLost",false)
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
	job.ori_where=nil
	job_suspend=nil
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
