--hqgzc
require "addxml"
zc=0
hqgzc_min=0
function hqgzcTrigger()
     
	cooking={}
	cooking.hebei={'������','����','��ľ��','��ɽ','��ɽ','�ؽ�','����','����','����','����','��ԭ','����','����','����'}
	cooking.zhongyuan={'�����','�ɶ�','����','����','����','���ְ�','��ɽ','��ɽ','̩ɽ','����','��ѩɽ','����','����','�置','�䵱','����','������','����','����','�ƺ�����'}
	cooking.jiangnan={'��ɽ','����','����','����','÷ׯ','����Ľ��','������','��٢��ɽׯ','����','����','����','ţ�Ҵ�','����ׯ'}
	cooking.target={}
	cooking.where={}
	cooking.menu={}
	cooking.flag={}
	cooking.findtimes={}
    --[[DeleteTriggerGroup("hqgzcAsk")
    create_trigger_t('hqgzcAsk1',"^(> )*������߹������й�",'','hqgzcAsk')
    create_trigger_t('hqgzcAsk2',"^(> )*����û������ˡ�$",'','hqgzcNobody')
    SetTriggerOption("hqgzcAsk1","group","hqgzcAsk")
    SetTriggerOption("hqgzcAsk2","group","hqgzcAsk")
    EnableTriggerGroup("hqgzcAsk",false)]]--
	DeleteTriggerGroup("hqgzcAskFail")
	create_trigger_t('hqgzcAskFail1',"^(> )*���߹�˵��������Ȼ�����ˣ�Ҳ�Ͳ���ǿ���ˡ���",'','hqgzcBegin')
	SetTriggerOption("hqgzcAskFail1","group","hqgzcAskFail")
	EnableTriggerGroup("hqgzcAskFail",false)
    DeleteTriggerGroup("hqgzcAccept")
	create_trigger_t('hqgzcAccept1',"^(> )*���߹�����Ķ�������˵������˵(\\D*)��(\\D*)������(\\D*)�������ȥ�����ɣ�",'','hqgzcCaiPu')
	create_trigger_t('hqgzcAccept2',"^(> )*���߹�˵��������λ(\\D*)��Ǳ���Ѿ���ô���ˣ�������ȥ���������ɣ���",'','hqgzc_xuexi')
	create_trigger_t('hqgzcAccept3',"^(> )*���߹�˵�����������ڲ������㻹����ȥ��Ϣһ��ɡ���",'','hqgzcNotHungry')
	create_trigger_t('hqgzcAccept4',"^(> )*���߹�˵����������������ʲôԭ�϶�û�У������ٰ��������ɡ���",'','hqgzcCaiPuDetail2')
	create_trigger_t('hqgzcAccept5',"^(> )*���߹�˵�������������Ѿ���Щԭ�ϣ��ȸ��㣬�������ȥ�Ұɣ���",'','hqgzcCaiPuDetail2')
	--create_trigger_t('hqgzcAccept5',"^(> )*���߹�˵�������������Ѿ���Щԭ�ϣ��ȸ��㣬�������ȥ�Ұɣ���",'','hqgzcCaiPuCheck')
	create_trigger_t('hqgzcAccept6',"^(> )*���߹�˵����������æ�ű��������",'','hqgzcFail')
	create_trigger_t('hqgzcAccept7',"^(> )*���߹�˵������\\D*������û��������������Ϲ����ʲôѽ",'','hqgzcStart')
	create_trigger_t('hqgzcAccept8',"^(> )*���߹�˵�������ţ��Ҳ��Ǹ��������𣬿�ȥȡԭ�ϰ��������������ˣ���",'','hqgzcFangqiGo')
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
    create_trigger_t('hqgzcFinish1','^(> )*���߹�ָ������һЩ��ѧ�ϵ��Խ�������(\\D*)Ǳ�ܡ�','','hqgzcFinish')
	create_trigger_t('hqgzcFinish2','^(> )*�㽫ԭ�Ϸ���һ��һ���������һ�������ζ�ġ����˭������÷����','','hqgzcFinishT')
	create_trigger_t('hqgzcFinish3','^(> )*��һʱ���񣬷Ŵ������ϣ��˷����Ƴɡ����˭������÷���Ĵ�û��ᡣ','','hqgzcFinish1')
	create_trigger_t('hqgzcFinish4','^(> )*����ȱ��һЩԭ�ϰ���','','hqgzcFangqiGo')
	create_trigger_t('hqgzcFinish5','^(> )*���߹�Ϊ����Ǯׯ������(\\D*)���ƽ�','','hqgzcFinishGold')
	create_trigger_t('hqgzcFinish6','^(> )*���߹�˵�����������һ�����ָ�����书�ɡ���','','hqgzcFinishp')
	create_trigger_t('hqgzcFinish7','^(> )*���߹�˵��������λ׳ʿ��Ǳ���Ѿ���ô���ˣ�������ȥ���������ɣ���','','hqgzcNotHungry')	
    SetTriggerOption("hqgzcFinish1","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish2","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish3","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish4","group","hqgzcFinish")
	SetTriggerOption("hqgzcFinish5","group","hqgzcFinish")
	
    EnableTriggerGroup("hqgzcFinish",false)
	DeleteTriggerGroup("hqgzcCaiPuCheck")
	create_trigger_t('hqgzcCaiPuCheck1','^�㻹������ԭ����δ�ҵ���','','hqgzcCaiPuDetail')
	SetTriggerOption("hqgzcCaiPuCheck1","group","hqgzcCaiPuCheck")
	EnableTriggerGroup("hqgzcCaiPuCheck",false)
	DeleteTriggerGroup("hqgzcCaiPuDetail")
	create_trigger_t('hqgzcCaiPuDetail1','^(\\D*)\\s*(\\D*)\\s*(\\D*)$','','hqgzcCaiPuDetail1')
	create_trigger_t('hqgzcCaiPuDetail2','^���Ѿ��ҵ���ԭ���У�\\D*','','hqgzcWhereConsider')
	SetTriggerOption("hqgzcCaiPuDetail1","group","hqgzcCaiPuDetail")
	SetTriggerOption("hqgzcCaiPuDetail2","group","hqgzcCaiPuDetail")
	EnableTriggerGroup("hqgzcCaiPuDetail",false)
	addxml.trigger {
        custom_colour="2",
        enabled="y",
        group="hqgzcFinish",
                match="^(> )*������߹������йء��ƽ���������Ϣ��\\n(> )*���߹�˵�����������һ�����ָ�����书�ɡ���",
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
	if Bag["����"].cnt~=98 then
		return go(hqgzcCheckSilverQu,"���ݳ�","�۱�ի")
	end
	return check_bei(hqgzcGo)
end
function hqgzcCheckSilverQu()
    if not locl.id["���ϰ�"] then
		return go(hqgzcCheckSilverQu,"���ݳ�","�۱�ի")
	else
		local qusilver = 98 - Bag["����"].cnt
		if qusilver < 0 then
			local qusilvertmp = Bag["����"].cnt - 98
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
job.list["hqgzc"] ="���߹�����"
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
	Note('��������Ѱ�Ҵ���'..flag.times)
	if flag.times > 2 then
		messageShow('������������'..flag.times..'Ŀ�꡾'..job.target..'���ص㡾'..job.where..'��δ�ҵ������������','deeppink')
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
    return go(hqgzcFangqi,"ؤ��","��Ժ")
end
function hqgzcGo()
    locate_finish=0
    return go(hqgzcBegin,"ؤ��","��Ժ")
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
			   local l,w = wait.regexp("^(> )*(������߹������й�|����û�������)",1)
			   if l~=nil then 
			       if string.find(l,'������߹������й�') then
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
				messageShow('������������ص㡾'..job.where..'�����ɵ�����������','deeppink')
				return check_bei(hqgzcFangqi)
			end
			if job.where == '����������' then
				messageShow('������������ص㡾'..job.where..'�����ɵ�����������','deeppink')
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
				-- if type(job.room)=="string" and string.find(job.room,"����") then
					-- job.room="��ɼ��"
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
				create_trigger_t('hqgzcTrade1','^(> )*\\D*'..job.target..'˵������\\D*��(\\D*)�����Ӱɡ���','','hqgzcPay')
				create_trigger_t('hqgzcTrade2','^(> )*\\D*'..job.target..'˵�������ţ���Ҫ�Ļ�������ȥ�ɡ���','','hqgzcTradeOK')
				create_trigger_t('hqgzcTrade5','^(> )*\\D*'..job.target..'˵�������ţ���Ҫ����ȥ�ɡ���','','hqgzcTradeOK')
				create_trigger_t('hqgzcTrade3','^(> )*\\D*'..job.target..'˵����������ʲô����һ�ڼۣ��Ҷ�˵�ˣ���Ҫ�����ˡ���','','hqgzcNoPay')
				create_trigger_t('hqgzcTrade4','^(> )*\\D*'..job.target..'�������ĵġ��š���һ�����ƺ�����û������˵ʲô��','','hqgzcAskMenu')
				create_trigger_t('hqgzcTrade6',"^(> )*����û������ˡ�",'','hqgzcLost')
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
				exe('nick ������'..job.where)
				exe('set no_kill_ap')
				pfmjineng()
				return go(hqgzcFindAct,job.area,job.room)
			end
		end
	end
	exe('nick �����ں��߹�')
	return check_bei(hqgzcBack)
end
function hqgzcFindAct()
	Note('��������Ѱ�Ҵ���'..flag.times)
	if flag.times > 2 then
		messageShow('������������'..flag.times..'Ŀ�꡾'..job.target..'���ص㡾'..job.where..'��δ�ҵ������������','deeppink')
		return check_halt(hqgzcFindFail)
	end
    EnableTriggerGroup("hqgzcFind",true)
    job.flag()
    exe('look')
    find()
    messageShow('���������ѵ�������ص㡾'..job.where..'������ʼѰ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
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
    go(hqgzcFangqi,'ؤ��','��Ժ')
end
function hqgzcFangqi()
	exe('nick �����������')
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
    exe('ask hong qigong about ����')
end
function hqgzcBack()
       EnableTriggerGroup("hqgzcFind",false)
	   locate_finish='hqgzcBackGet'
       check_halt(locate)
end
function hqgzcBackGet()
    locate_finish=0
    return go(hqgzcFinishWait,'ؤ��','��Ժ')
end
function hqgzcFinishWait()
    if locl.id["���߹�"] then
	   return hqgzcFinishC()
    else
	   return go(hqgzcFinishWait,'ؤ��','��Ժ')
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
			 local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			 if l~=nil then break end
	   end
	end)
end
function hqgzcFinishT()
	EnableTriggerGroup("hqgzcFinish",true)
	if hqgzcjl and hqgzcjl*1==0 then
		--check_bei(exe('ask hong qigong about �ƽ���'))
		wait.make(function()
	       wait_busy()
		   --wait.time(1)
	       while true do 
		       exe('ask hong qigong about �ƽ���')
	           local l,w = wait.regexp('^(> )*���߹��ӹ������ġ����˭������÷������������������',1)
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
	messageShow('����������ɣ���á�'..w[2]..'����Ǳ�ܣ�')
    messageShowT('��������������ɣ���ʱ:��'..job.time.over..'���롣')
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
	messageShow('����������ɣ���á�'..w[2]..'�����ƽ�')
    messageShowT('��������������ɣ���ʱ:��'..job.time.over..'���롣')
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
	messageShow('��������ʧ�ܣ�')
    messageShowT('������������ʧ�ܣ���ʱ:��'..job.time.over..'���롣')
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
        messageShow('����������ɣ���á�'..w[2]..'����Ǳ�ܣ�')
        messageShowT('��������������ɣ���ʱ:��'..job.time.over..'���롣')
        
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
        messageShow('����������ɣ���á�'..w[2]..'�����ƽ�')
         messageShowT('��������������ɣ���ʱ:��'..job.time.over..'���롣�������:��'..zc..'���Ρ�')
        
	----hqg 100 �������޸�....	
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