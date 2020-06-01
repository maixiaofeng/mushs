--hqgzc
require "addxml"
zc=0
hqgzc_min=0
function hqgzcTrigger()
     
	cooking={}
	cooking.hebei={'神龙岛','昆仑','黑木崖','天山','恒山','回疆','昆仑','明教','星宿','伊犁','草原','塘沽','沧州','兰州'}
	cooking.zhongyuan={'绝情谷','成都','峨嵋','襄阳','扬州','长乐帮','华山','嵩山','泰山','铁掌','大雪山','长安','南阳','苗疆','武当','大理','天龙寺','萧府','柳宗','黄河流域'}
	cooking.jiangnan={'佛山','福州','杭州','嘉兴','梅庄','姑苏慕容','燕子坞','曼佗罗山庄','宁波','莆田','苏州','牛家村','归云庄'}
	cooking.target={}
	cooking.where={}
	cooking.menu={}
	cooking.flag={}
	cooking.findtimes={}
    --[[DeleteTriggerGroup("hqgzcAsk")
    create_trigger_t('hqgzcAsk1',"^(> )*你向洪七公打听有关",'','hqgzcAsk')
    create_trigger_t('hqgzcAsk2',"^(> )*这里没有这个人。$",'','hqgzcNobody')
    SetTriggerOption("hqgzcAsk1","group","hqgzcAsk")
    SetTriggerOption("hqgzcAsk2","group","hqgzcAsk")
    EnableTriggerGroup("hqgzcAsk",false)]]--
	DeleteTriggerGroup("hqgzcAskFail")
	create_trigger_t('hqgzcAskFail1',"^(> )*洪七公说道：「既然做不了，也就不勉强你了。」",'','hqgzcBegin')
	SetTriggerOption("hqgzcAskFail1","group","hqgzcAskFail")
	EnableTriggerGroup("hqgzcAskFail",false)
    DeleteTriggerGroup("hqgzcAccept")
	create_trigger_t('hqgzcAccept1',"^(> )*洪七公在你的耳边悄声说道：听说(\\D*)的(\\D*)手中有(\\D*)，你帮我去找来吧！",'','hqgzcCaiPu')
	create_trigger_t('hqgzcAccept2',"^(> )*洪七公说道：「这位(\\D*)的潜能已经这么多了，还是先去用完再来吧！」",'','hqgzc_xuexi')
	create_trigger_t('hqgzcAccept3',"^(> )*洪七公说道：「我现在不饿，你还是先去休息一会吧。」",'','hqgzcNotHungry')
	create_trigger_t('hqgzcAccept4',"^(> )*洪七公说道：「唉！我这里什么原料都没有，你速速帮我找来吧。」",'','hqgzcCaiPuDetail2')
	create_trigger_t('hqgzcAccept5',"^(> )*洪七公说道：「我这里已经有些原料，先给你，其余的你去找吧！」",'','hqgzcCaiPuDetail2')
	--create_trigger_t('hqgzcAccept5',"^(> )*洪七公说道：「我这里已经有些原料，先给你，其余的你去找吧！」",'','hqgzcCaiPuCheck')
	create_trigger_t('hqgzcAccept6',"^(> )*洪七公说道：「你正忙着别的事情呢",'','hqgzcFail')
	create_trigger_t('hqgzcAccept7',"^(> )*洪七公说道：「\\D*，你又没在我这里领任务，瞎放弃什么呀",'','hqgzcStart')
	create_trigger_t('hqgzcAccept8',"^(> )*洪七公说道：「嗯？我不是告诉你了吗，快去取原料啊，不想做就算了！」",'','hqgzcFangqiGo')
	SetTriggerOption("hqgzcAccept1","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept2","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept3","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept4","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept5","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept6","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept7","group","hqgzcAccept")
	SetTriggerOption("hqgzcAccept8","group","hqgzcAccept")
	EnableTriggerGroup("hqgzcAccept",false)
    DeleteTriggerGroup("hqgzcFinish")
    create_trigger_t('hqgzcFinish1','^(> )*洪七公指点了你一些武学上的迷津，你获得了(\\D*)潜能。','','hqgzcFinish')
	create_trigger_t('hqgzcFinish2','^(> )*你将原料放在一起，一会就做出了一盘香口美味的「玉笛谁家听落梅」。','','hqgzcFinishT')
	create_trigger_t('hqgzcFinish3','^(> )*你一时走神，放错了配料，浪费了制成「玉笛谁家听落梅」的大好机会。','','hqgzcFinish1')
	create_trigger_t('hqgzcFinish4','^(> )*好像还缺少一些原料啊？','','hqgzcFangqiGo')
	create_trigger_t('hqgzcFinish5','^(> )*洪七公为你在钱庄存入了(\\D*)锭黄金。','','hqgzcFinishGold')
	create_trigger_t('hqgzcFinish6','^(> )*洪七公说道：「今天我还是先指点你武功吧。」','','hqgzcFinishp')
	create_trigger_t('hqgzcFinish7','^(> )*洪七公说道：「这位壮士的潜能已经这么多了，还是先去用完再来吧！」','','hqgzcNotHungry')	
    SetTriggerOption("hqgzcFinish1","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish2","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish3","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish4","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish5","group","hqgzcFinish")
	
    EnableTriggerGroup("hqgzcFinish",false)
	DeleteTriggerGroup("hqgzcCaiPuCheck")
	create_trigger_t('hqgzcCaiPuCheck1','^你还有下列原料尚未找到：','','hqgzcCaiPuDetail')
	SetTriggerOption("hqgzcCaiPuCheck1","group","hqgzcCaiPuCheck")
	EnableTriggerGroup("hqgzcCaiPuCheck",false)
	DeleteTriggerGroup("hqgzcCaiPuDetail")
	create_trigger_t('hqgzcCaiPuDetail1','^(\\D*)\\s*(\\D*)\\s*(\\D*)$','','hqgzcCaiPuDetail1')
	create_trigger_t('hqgzcCaiPuDetail2','^你已经找到的原料有：\\D*','','hqgzcWhereConsider')
	SetTriggerOption("hqgzcCaiPuDetail1","group","hqgzcCaiPuDetail")
	SetTriggerOption("hqgzcCaiPuDetail2","group","hqgzcCaiPuDetail")
	EnableTriggerGroup("hqgzcCaiPuDetail",false)
	addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="hqgzcFinish",
                match="^(> )*你向洪七公打听有关『黄金奖励』的消息。\\n(> )*洪七公说道：「今天我还是先指点你武功吧。」",
        name="hqgzcFinish6",
        multi_line="y",
        lines_to_match="2",
        -- one_shot="y",
        regexp="y",
        script="hqgzcFinishTT",
        sequence="100",
        }
end
function hqgzcTriggerDel()
    --DeleteTriggerGroup("hqgzcAsk")
    DeleteTriggerGroup("hqgzcAccept")
    DeleteTriggerGroup("hqgzcFinish")
    DeleteTriggerGroup("hqgzcFind")
	DeleteTriggerGroup("hqgzcCaiPuCheck")
	DeleteTriggerGroup("hqgzcCaiPuDetail")
	DeleteTriggerGroup("hqgzcTrade")
end
function hqgzcCheckSilver()	
	if Bag["白银"].cnt~=98 then
		return go(hqgzcCheckSilverQu,"苏州城","聚宝斋")
	end
	return check_bei(hqgzcGo)
end
function hqgzcCheckSilverQu()
    if not locl.id["孙老板"] then
		return go(hqgzcCheckSilverQu,"苏州城","聚宝斋")
	else
		local qusilver = 98 - Bag["白银"].cnt
		if qusilver < 0 then
			local qusilvertmp = Bag["白银"].cnt - 98
			exe('cun '..qusilvertmp..' silver')
		elseif qusilver > 0 then
			exe('qu '..qusilver..' silver')
		end
		checkBags()
		return check_bei(hqgzcCheckSilver)
	end
end
function hqgzcNobody()
    --EnableTriggerGroup("hqgzcAsk",false)
    hqgzc()
end
job.list["hqgzc"] ="洪七公做菜"
function hqgzc()
    dis_all()
    hqgzcTrigger()
    job.name='hqgzc'
	checkBags()
    return check_halt(hqgzcCheckSilver)
end
jobFindAgain = jobFindAgain or {}
jobFindAgain["hqgzc"] = "hqgzcFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["hqgzc"] = "hqgzcFindFail"
function hqgzcFindAgain()
	Note('做菜任务：寻找次数'..flag.times)
	if flag.times > 2 then
		messageShow('做菜任务：任务'..flag.times..'目标【'..job.target..'】地点【'..job.where..'】未找到，任务放弃。','deeppink')
		return check_halt(hqgzcFindFail)
	end
    EnableTriggerGroup("hqgzcFind",true)
    return go(hqgzcFindAct,dest.area,dest.room)
end
faintFunc = faintFunc or {}
faintFunc["hqgzc"] = "hqgzcFindFail"
function hqgzcFindFail()
   locate_finish=0
    EnableTriggerGroup("hqgzcFind",false)
    return go(hqgzcFangqi,"丐帮","后院")
end
function hqgzcGo()
    locate_finish=0
    return go(hqgzcBegin,"丐帮","后院")
end
function hqgzcBegin()
    locate_finish='hqgzcStart'
	dis_all()
    return check_busy(locate,1.5)
end
function hqgzcStart()
    --EnableTriggerGroup("hqgzcAsk",true)
    flag.idle = 0
	locate_finish=0
	exe('time')
	wait.make(function()
	       while true do
		       exe('lian force 10')
			   exe('ask hong qigong about job')
			   local l,w = wait.regexp("^(> )*(你向洪七公打听有关|这里没有这个人)",1)
			   if l~=nil then 
			       if string.find(l,'你向洪七公打听有关') then
				       return hqgzcAsk()
				   else
				       return hqgzcNobody()
				   end
			   end
		   end
		   --[[
           wait.time(1.5)
		   exe('lian force 10')
		   wait.time(1.5)
           exe('ask hong qigong about job')
		   ]]--
	end)
end
function hqgzcAsk()
    --EnableTriggerGroup("hqgzcAsk",false)
    EnableTriggerGroup("hqgzcAccept",true)
end
function hqgzcNotHungry()
  dis_all()
if job.last=="huashan" then return songxin() else return huashan() end

end
function hqgzcBusy()
    EnableTriggerGroup("hqgzcAccept",false)
	-- job.last='hqgzc'
    return check_bei(hqgzcDazuo)
end
function hqgzcDazuo()
    exe('s')
    return prepare_lianxi(hqgzc)
end
function hqgzcFail()
    EnableTriggerGroup("hqgzcAccept",false)
    hqgzcTriggerDel()
    -- job.last='hqgzc'
	return check_food()
end
function hqgzcCaiPu(n,l,w)
	table.insert(cooking.target, Trim(w[3]))
	table.insert(cooking.where, Trim(w[2]))
	table.insert(cooking.menu, Trim(w[4]))
end
function hqgzcCaiPuCheck()
	EnableTriggerGroup("hqgzcCaiPuCheck",true)
	return exe('l cai pu')
end
function hqgzcCaiPuDetail()
	EnableTriggerGroup("hqgzcCaiPuCheck",false)
	EnableTriggerGroup("hqgzcCaiPuDetail",true)
end
function hqgzcCaiPuDetail1 (n,l,w)
	local l_target=Trim(w[1])
	local l_where=Trim(w[2])
	local l_menu=Trim(w[3])
	for key,value in pairs(cooking.target)
	do
		if value==l_target then
			cooking.flag[key]=1
			Note(cooking.flag[key]..' '..cooking.target[key]..' '..cooking.where[key]..' '..cooking.menu[key])
		end
	end
end
function hqgzcCaiPuDetail2 ()
	for key,value in pairs(cooking.target)
	do
		cooking.flag[key]=4
		cooking.findtimes[key]=0
		for key1,value in pairs(cooking.jiangnan) 
		do
			if string.find(cooking.where[key],value) then
				cooking.flag[key]=1
			end
		end
		for key2,value in pairs(cooking.zhongyuan) 
		do
			if string.find(cooking.where[key],value) then
				cooking.flag[key]=2
			end
		end
		for key3,value in pairs(cooking.hebei) 
		do
			if string.find(cooking.where[key],value) then
				cooking.flag[key]=3
			end
		end
		Note(cooking.flag[key]..' '..cooking.target[key]..' '..cooking.where[key]..' '..cooking.menu[key])
	end
	return check_bei(hqgzcWhereConsider)
end
function hqgzcWhereConsider()
	for key,value in pairs(cooking.where)
	do
		if cooking.flag[key]>=1 then
			job.where=value
			job.room,job.area=getAddr(value)
			dest.room=job.room
			dest.area=job.area
			if not job.room or not path_cal() then
				messageShow('做菜任务：任务地点【'..job.where..'】不可到达，任务放弃。','deeppink')
				return check_bei(hqgzcFangqi)
			end
			if job.where == '神龙岛卧室' then
				messageShow('做菜任务：任务地点【'..job.where..'】不可到达，任务放弃。','deeppink')
				return check_bei(hqgzcFangqi)
			end
		end
	end
	EnableTriggerGroup("hqgzcAccept",false)
	job.time.b=os.time()
     --job.last='hqgzc'
	return check_bei(hqgzcFind)
end
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end
function hqgzcFind()
	for j=1,4 do
		for i=1,table_maxn(cooking.target)
		do
			if cooking.flag[i]==j then
				job.room,job.area=getAddr(cooking.where[i])
				-- if type(job.room)=="string" and string.find(job.room,"字门") then
					-- job.room="紫杉林"
				-- end
				job.target=cooking.target[i]
				job.where=cooking.where[i]
				job.menu=cooking.menu[i]
				dest.room=job.room
				dest.area=job.area
				DeleteTriggerGroup("hqgzcFind")
				create_trigger_t('hqgzcFind1','^(> )*\\D*'..job.target..'\\((\\D*)\\)','','hqgzcTarget')
				SetTriggerOption("hqgzcFind1","group","hqgzcFind")
				EnableTriggerGroup("hqgzcFind",false)
				DeleteTriggerGroup("hqgzcTrade")
				create_trigger_t('hqgzcTrade1','^(> )*\\D*'..job.target..'说道：「\\D*就(\\D*)两银子吧。」','','hqgzcPay')
				create_trigger_t('hqgzcTrade2','^(> )*\\D*'..job.target..'说道：「嗯，你要的话，就拿去吧。」','','hqgzcTradeOK')
				create_trigger_t('hqgzcTrade5','^(> )*\\D*'..job.target..'说道：「嗯，你要就拿去吧。」','','hqgzcTradeOK')
				create_trigger_t('hqgzcTrade3','^(> )*\\D*'..job.target..'说道：「罗嗦什么啊？一口价，我都说了，不要就算了。」','','hqgzcNoPay')
				create_trigger_t('hqgzcTrade4','^(> )*\\D*'..job.target..'漫不经心的“嗯”了一声，似乎根本没在听你说什么。','','hqgzcAskMenu')
				create_trigger_t('hqgzcTrade6',"^(> )*这里没有这个人。",'','hqgzcLost')
				SetTriggerOption("hqgzcTrade1","group","hqgzcTrade")
				SetTriggerOption("hqgzcTrade2","group","hqgzcTrade")
				SetTriggerOption("hqgzcTrade3","group","hqgzcTrade")
				SetTriggerOption("hqgzcTrade4","group","hqgzcTrade")
				SetTriggerOption("hqgzcTrade6","group","hqgzcTrade")
				SetTriggerOption("hqgzcTrade5","group","hqgzcTrade")
				EnableTriggerGroup("hqgzcTrade",false)
				cooking.findtimes[i]=cooking.findtimes[i]+1
				flag.times=cooking.findtimes[i]
				exe('unset wimpy;jifa all;set wimpycmd pfmpfm\\hp')
				job.zctime=os.time() + 8*60
				exe('nick 做菜在'..job.where)
				exe('set no_kill_ap')
				pfmjineng()
				return go(hqgzcFindAct,job.area,job.room)
			end
		end
	end
	exe('nick 做菜在洪七公')
	return check_bei(hqgzcBack)
end
function hqgzcFindAct()
	Note('做菜任务：寻找次数'..flag.times)
	if flag.times > 2 then
		messageShow('做菜任务：任务'..flag.times..'目标【'..job.target..'】地点【'..job.where..'】未找到，任务放弃。','deeppink')
		return check_halt(hqgzcFindFail)
	end
    EnableTriggerGroup("hqgzcFind",true)
    job.flag()
    exe('look')
    find()
    messageShow('做菜任务：已到达任务地点【'..job.where..'】，开始寻找【'..dest.area .. dest.room ..'】的'..'【'.. job.target ..'】！')
end
function hqgzcTarget(n,l,w)
    EnableTriggerGroup("hqgzcFind",false)
    dis_all()
    EnableTriggerGroup("hqgzcTrade",true)
    job.id=string.lower(w[2])
	return check_busy(zuocai_id)
 end
function zuocai_id()
  
   wait.make(function()
       wait.time(1)
	   exe('follow '..job.id)
	   wait.time(1.5)
	   exe('ask '..job.id..' about '..job.menu)
   end)

---exe('follow '..job.id)
---return exe('ask '..job.id..' about '..job.menu)
end
function hqgzcPay(n,l,w)
	cooking.money = trans(w[2])
	return check_bei(hqgzcPay1)
end
function hqgzcPay1()
	exe('give '..cooking.money..' silver to '..job.id)
end
function hqgzcNoPay()
	return check_bei(hqgzcPay1)
end
function hqgzcAskMenu()
	return check_bei(hqgzcAskMenu1)
end
function hqgzcAskMenu1()
	exe('ask '..job.id..' about '..job.menu)
end
function hqgzcTradeOK()
	EnableTriggerGroup("hqgzcTrade",false)
    locate_finish=0
	dis_all()
	exe('follow none')
	--flag.idle = 0
	for key,value in pairs(cooking.target)
	do
		if job.target==value then
			cooking.flag[key]=nil
		end
	end
	return check_bei(hqgzcFind)
end
function hqgzcLost()
    EnableTriggerGroup("hqgzcTrade",false)
	exe('follow none')
	--dis_all()
    return check_bei(hqgzcFind)
end
function hqgzcFangqiGo()
    go(hqgzcFangqi,'丐帮','后院')
end
function hqgzcFangqi()
	exe('nick 做菜任务放弃')
    exe('unset no_kill_ap')
	locate_finish=0
    dis_all()
	hqgzcTrigger()
	flag.idle = 0
    EnableTriggerGroup("hqgzcAccept",false)
    check_bei(hqgzcFangqiAsk)
end
function hqgzcFangqiAsk()
    EnableTriggerGroup("hqgzcAskFail",true)
    exe('ask hong qigong about 放弃')
end
function hqgzcBack()
       EnableTriggerGroup("hqgzcFind",false)
	   locate_finish='hqgzcBackGet'
       check_halt(locate)
end
function hqgzcBackGet()
    locate_finish=0
    return go(hqgzcFinishWait,'丐帮','后院')
end
function hqgzcFinishWait()
    if locl.id["洪七公"] then
	   return hqgzcFinishC()
    else
	   return go(hqgzcFinishWait,'丐帮','后院')
    end
end
function hqgzcFinishC()
	EnableTriggerGroup("hqgzcFinish",true)
	--check_bei(exe('zuo cai'))
	wait.make(function()
	   --wait_busy()
	   --wait.time(1)
	   --exe('zuo cai')
	   while true do 
	       exe('zuo cai')
		   exe('hug '..score.id)
			 local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			 if l~=nil then break end
	   end
	end)
end
function hqgzcFinishT()
	EnableTriggerGroup("hqgzcFinish",true)
	if hqgzcjl and hqgzcjl*1==0 then
		--check_bei(exe('ask hong qigong about 黄金奖励'))
		wait.make(function()
	       wait_busy()
		   --wait.time(1)
	       while true do 
		       exe('ask hong qigong about 黄金奖励')
	           local l,w = wait.regexp('^(> )*洪七公接过你做的「玉笛谁家听落梅」，口中啧啧声不断',1)
			   if l~=nil then break end
		   end   
	    end)
	else
		--check_bei(exe('ask hong qigong about finish'))
		wait.make(function()
	       wait_busy()
		   wait.time(1)
	       exe('ask hong qigong about finish')
	    end)
	end
end
function hqgzcFinish(n,l,w)
    print('hqgzcFinish 22222........................22222222222')
	EnableTriggerGroup("hqgzcFinish",false)
	job.time.e=os.time()
        hqgzcJobtime = os.time()+150
	job.time.over=job.time.e-job.time.b
	messageShow('做菜任务：完成！获得【'..w[2]..'】点潜能！')
    messageShowT('做菜任务：任务完成，用时:【'..job.time.over..'】秒。')
    job.zctime=0
	flag.idle = 0
	dis_all()
    return check_halt(check_food)
end
function hqgzcFinishGold(n,l,w)
	EnableTriggerGroup("hqgzcFinish",false)
	job.time.e=os.time()
        hqgzcJobtime = os.time()+150
	job.time.over=job.time.e-job.time.b
	  local x
      x=trans(w[2])
	  tjzcgold=tjzcgold+x
	messageShow('做菜任务：完成！获得【'..w[2]..'】锭黄金！')
    messageShowT('做菜任务：任务完成，用时:【'..job.time.over..'】秒。')
    job.zctime=0
	flag.idle = 0
	dis_all()
    return check_halt(check_food)
end
function hqgzcFinish1(n,l,w)
	EnableTriggerGroup("hqgzcFinish",false)
	job.time.e=os.time()
        hqgzcJobtime = os.time()+150
	job.time.over=job.time.e-job.time.b
	messageShow('做菜任务：失败！')
    messageShowT('做菜任务：任务失败，用时:【'..job.time.over..'】秒。')
    job.zctime=0
	flag.idle = 0
	dis_all()
    return check_halt(hqgzc)
end
function hqgzcFinishTT()
        EnableTriggerGroup("hqgzcFinish",true)
        check_bei(function () exe('ask hong qigong about finish') end)
end

function hqgzcFinish(n,l,w)
       locate_finish=0
        job.last = 'hqgzc'
        SetVariable("job_hqg_times",tonumber(GetVariable('job_hqg_times'))+1)
        EnableTriggerGroup("hqgzcFinish",false)
        job.time.e=os.time()
        hqgzcJobtime = os.time()+150
        job.time.over=job.time.e-job.time.b
        messageShow('做菜任务：完成！获得【'..w[2]..'】点潜能！')
        messageShowT('做菜任务：任务完成，用时:【'..job.time.over..'】秒。')
        
         SetVariable("job_hqg_date",tonumber(os.date("%Y%m%d%H%M"))-200)
		 SetVariable("job_hqg_finish_date",tonumber(os.date("%Y%m%d")))
        SetVariable("job_hqg_times",0)
       zc=0
    job.zctime=0
        flag.idle = 0
        dis_all()
    return check_halt(check_food)
end
function hqgzcFinishGold(n,l,w)
        
        job.last = 'hqgzc'
        SetVariable("job_hqg_times",tonumber(GetVariable('job_hqg_times'))+1)

        EnableTriggerGroup("hqgzcFinish",false)
        job.time.e=os.time()
        hqgzc_min = tonumber(os.date("%M"))
	hqgzcJobtime = os.time()+150
        job.time.over=job.time.e-job.time.b
		zc=zc+1
        messageShow('做菜任务：完成！获得【'..w[2]..'】锭黄金！')
         messageShowT('做菜任务：任务完成，用时:【'..job.time.over..'】秒。今日完成:【'..zc..'】次。')
        
	----hqg 100 在这里修改....	
        if tonumber(GetVariable('job_hqg_times')) >= 10 then
            SetVariable("job_hqg_date",tonumber(os.date("%Y%m%d%H%M"))-200)
            SetVariable("job_hqg_times",0)
			SetVariable("job_hqg_finish_date",tonumber(os.date("%Y%m%d")))
			zc=0
        end        
       job.zctime=0
        flag.idle = 0
        dis_all()
		
    return check_halt(check_food)
end
hqgzcSkills=function()
exe('sxlian')
return check_jobx()
end
--function zhunbei_zc()
--SetVariable("jobthird","hqgzc")
--return hqgzc()
--end
function hqgzc_xuexi()
return check_halt(check_xuexi)
end
function hqgzcFinishp()
        wait.make(function() 
        wait.time(4)
           exe('sxlian')
           exe('ask hong qigong about finish')
     end)
        return check_halt(check_busy)
end