--wudang
wdtongji_total = 0
wdtongji_cs = 0 --��ȡjob����ͳ��
wdtongji_lasttime_total = 0 
wdtongji_zdcs = 0 --ս������
wdtongji_lasttime_lj = 0  --�ۼ�ս��ʱ��
wdtongji_thistime = 0 --��������ս��ʱ��
wdtongji_pingjun = 0 --ƽ��ʱ��
wdtongji_fangqi = 0 --ʧ�ܴ���
wdtongji_finish = 0 --��ɴ���
wdtongji_cgl = 0 --�ɹ���
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

--������ɡ�'..wdtongji_cs'����,ƽ��ս��ʱ�䡾����,�ɹ������Σ�ʧ�ܡ����Σ�����ʡ���
wdgostart=0
function wudangTrigger()
    DeleteTriggerGroup("wudangAsk")
    create_trigger_t('wudangAsk1',"^(> )*������Զ�Ŵ����й�",'','wudangAsk')
    create_trigger_t('wudangAsk2',"^(> )*����û������ˡ�$",'','wudangNobody')
    SetTriggerOption("wudangAsk1","group","wudangAsk")
    SetTriggerOption("wudangAsk2","group","wudangAsk")
    EnableTriggerGroup("wudangAsk",false)
    DeleteTriggerGroup("wudangAccept")
    create_trigger_t('wudangAccept1',"^(> )*��Զ������Ķ�������˵������˵(����|����|����|��ԭ|����|����|�ӱ�|����)(�ݿ�|կ��|���|ɽ��|����|����|����)(\\D*)����(\\D*)����",'','wudangConsider')
    create_trigger_t('wudangAccept2',"^(> )*��Զ��˵�������Ҳ��Ǹ���������������",'','wudangFangqi')
    create_trigger_t('wudangAccept3',"^(> )*��Զ������Ķ�������˵��(\\D*)��Ϊ�ó�(\\D*)�Ĺ���",'','wudangNpc')
    create_trigger_t('wudangAccept4',"^(> )*��Զ��˵����������æ�ű��������",'','wudangFail')
    create_trigger_t('wudangAccept5',"^(> )*��Զ��˵�������������(�䵱����|�Ͷ�����|��������|������Ħ��)����",'','wudangFail')
    create_trigger_t('wudangAccept6',"^(> )*��Զ��˵������������ʱû���ʺ���Ĺ���",'','wudangFail')
    create_trigger_t('wudangAccept7',"^(> )*��Զ��˵��������ʱû��������Ҫ�������һ���������",'','wudangFail')
    create_trigger_t('wudangAccept8',"^(> )*��Զ��˵������\\D*����̫����ʧ���ˣ���Ȼ��ô���ɲ��ã������°�",'','wudangFail')
    create_trigger_t('wudangAccept9',"^(> )*��Զ��˵������\\D*������û��������������Ϲ����ʲôѽ",'','wudangFail')
    create_trigger_t('wudangAccept10',"^(> )*��Զ��˵������\\D*���������ȷʵ�Ƚ�����ɣ��´θ���򵥵ģ������°ɣ�",'','wudangFail')
    create_trigger_t('wudangAccepta',"^(> )*��Զ������Ķ�������˵�������˵��书(\\D*)��",'','wudanglevel')
    create_trigger_t('wudangAcceptb',"^(> )*��Զ��\\D*���ȥ��أ�һ��С�İ���",'','wudangFindGo')
    create_trigger_t('wudangAccept31',"^(> )*��Զ������Ķ�������˵������ͷ����׷�鵽(\\D*)�����䵱������Ϊ�ó�(\\D*)�Ĺ���",'','wudangNpc')
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
    create_trigger_t('wudangFight1','^(> )*(\\D*)��ž����һ�����ڵ���','','wudangBack')
    create_trigger_t('wudangFight2','^(> )*(\\D*)��һ�������ã���ת��������Ͳ�����','','wudangBack')
    --create_trigger_t('wudangFight3',"^(> )*����û��(\\D*)��",'','wudangLost')
    create_trigger_t('wudangFight4',"^(> )*(\\D*)�����㷢��һ����Ц��˵��",'','wudangKillAct')
	create_trigger_t('wudangFight5',"^(> )*(\\D*)��һ�������Ӳ������ˣ�ת��������Ͳ�����",'','wudangBack')
    create_trigger_t('wudangFight6','^>*\\s*һ��ů�����Ե�������ȫ�����������ָֻ���֪������','','wudangFangqiGo')
    create_trigger_t('wudangFight7',"^(��|��)װ���ţ�$",'','npcWeapon')
	create_trigger_t('wudangFight8',"^(��|��)�����ţ�$",'','npcWeapon')
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
    create_trigger_t('wudangFinish1','^(> )*��Զ�Ŷ��������������ִ�Ĵָ�������ġ�','','wudangFinishT')
    create_trigger_t('wudangFinish2',"^(> )*��Զ�ű������û��˹�ȥ��",'','wudangFinish')
    create_trigger_t('wudangFinish3',"^(> )*��Զ��˵������"..score.name.."����ô���",'','wudangFinish')
    SetTriggerOption("wudangFinish1","group","wudangFinish")
    SetTriggerOption("wudangFinish2","group","wudangFinish")
    SetTriggerOption("wudangFinish3","group","wudangFinish")
    EnableTriggerGroup("wudangFinish",false)
    DeleteTriggerGroup("wudangdebug")
    create_trigger_t('wudangdebug1','^(> )*�������һ���������','','wudangdebugFind')
    SetTriggerOption("wudangdebug1","group","wudangdebug")
    EnableTriggerGroup("wudangdebug",true)
end

---------------------- wudang job ���� -----------------

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
    --����ǹ�;���ε�
	if dest.area=='�䵱ɽ' and dest.room=='�����' then 
	    jobfailLog()
	    EnableTriggerGroup("wudangFinish",true)
        return wudang_wc() 
	end 
	
    print('wudangFindAgain......flag.times:'..flag.times)
	flag.searchRooms = nil
    wdgostart=1
	EnableTriggerGroup("wudangFind",true)
	--[[
	if flag.times==3 and dest.area=='��ɽ' or dest.area=='��ɽ��' then
		return go(wudangFindAct,'��ɽ��','�˵�')
	end
	]]--
	--[[if flag.times==3 and dest.area=='������' and job.room=='ɽ��յ�' then
		return go(wudangFindAct,'��������','�ٲ�')
	end]]--
	
	--[[
	if flag.times==2 and dest.area=='����' and (job.room=="��ɼ��" or string.find(job.room,"����")) then
		return go(wudangFindAct,'����','���䳡')
	end
	]]--
	
	if flag.times==2 and dest.area=='����' and (job.room=="��ɼ��" or string.find(job.room,"����")) then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,job.area,job.room) 
		
		-- flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3},{'������','����',3},{'С��','����',3}}
		 --return go(wudangFindAct,'����','�һ���') 
		
	end
	
	if flag.times==3 and dest.area=='����' and (job.room=="��ɼ��" or string.find(job.room,"����")) then
	    flag.searchRooms = {{'������','����',6},{'������','����',6}}
		return go(wudangFindAct,'����','������')
	end
	
	if flag.times==2 and dest.area=='����' and  (job.room=="�һ���" or  job.room=="������" or  job.room=="��ˮ��" or job.room=="�����") then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','��ɼ��') 
	end
		
	if flag.times==3 and dest.area=='����' and  (job.room=="�һ���" or  job.room=="������" or  job.room=="��ˮ��" or job.room=="�����") then
	    flag.searchRooms = {{'������','����',6},{'������','����',6}}
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','������')
	end
	
	
	if flag.times==2 and dest.area=='����' and  job.room=="ʥ����" then
	    flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3},{'������','����',3}}
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','������') 
	end
		
	if flag.times==3 and dest.area=='����' and job.room=="ʥ����" then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','��ɼ��') 
	end
	
	
	if flag.times==2 and dest.area=='����' and  job.room=="������" then
	    flag.searchRooms=nil
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','��ɼ��') 
	end
	
	if flag.times==3 and dest.area=='����' and  job.room=="������" then
	    flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3},{'������','����',3}}
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,'����','������') 
	end
	
	
	
	
	if flag.times==2 and dest.area=='����ɽ' and  (job.room=="������" or job.room=="������" or job.room=="��ˮ��" or job.room=="���ĸ�") then
	    flag.searchRooms = {{'������','����ɽ',4},{'������','����ɽ',6},{'̿Ҥ','����ɽ',6}}
		--return go(wudangFindAct,'����','��ɼ��')
		return go(wudangFindAct,job.area,job.room) 
	end 
	
		
	if flag.times==3 and job.area=='���ݳ�' and job.room=='����' then
		return go(wudangFindAct,'���ݳ�','�����ϰ�')
	end
    
	--[[if flag.times==3 and job.area=='�����' and (job.room=='�����' or job.room=='�ϳ���') then
		return go(wudangFindAct,'�����','������')
	end]]--
    
	if flag.times==3 and job.area=='���ݳ�' and job.room=='���' then
		return go(wudangFindAct,'���ݳ�','����')
    end
    if flag.times==3 and job.area=='���ݳ�' and job.room=='����' then
		return go(wudangFindAct,'���ݳ�','��ɿ�')
	end
	
	--[[
	if flag.times==3 and job.area=='���ݳ�' and (job.room=='�����' or job.room=='����' or job.room=='������' or job.room=='��������' or job.room=='�����' or job.room=='����Ժ') then
		return go(wudangFindAct,'���ݳ�','�������ƹ�')
	end
	]]--
	
	if flag.times==3 and job.area=='����ɽ' and job.room=='ɽ·' then
		return go(wudangFindAct,'����ɽ','��ָ��')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='��ʯ���' then
		return go(wudangFindAct,'���ݳ�','������')
	end
	if flag.times==3 and job.area=='�置' and job.room=='ɽ·' then
		return go(wudangFindAct,'�置','ɽ��')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='ɽ·' then
		return go(wudangFindAct,'���ݳ�','�׷���')
	end
	if flag.times==3 and job.area=='��ɽ����' and job.room=='ʯ��·' then
		return go(wudangFindAct,'��ɽ����','����')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='������' then
		return go(wudangFindAct,'���ݳ�','����')
	end
	
	if flag.times==3 and job.area=='��ɽ����' and job.room=="�޺���" then
	    job.where='��ɽ�����޺����岿'
		job.room='�޺����岿'
		return go(wudangFindAct,'��ɽ����','�޺����岿')
	end
	if flag.times==3 and job.area=='��ɽ����' and job.room=="������" then
		return go(wudangFindAct,'��ɽ����','�������岿')
	end
	
	if flag.times==3 and job.area=='���ְ�'  then
	    flag.searchArea={[8]='city/',[300]='changle/'}
		return go(wudangFindAct,'���ְ�','����')
	end
	
	if flag.times==3 and job.area=='������'  then
	    flag.searchArea={[300]='sld/'}
		return go(wudangFindAct,'������','�ɿ�')
	end
	
	if flag.times==3 and job.area=='��������'  then
	     flag.searchArea={[300]='putian/'}
		return go(wudangFindAct,'��������','ɽ��')
	end
	
	if flag.times==2 and job.area=='����ɽ' and (job.room=='���Ṭ' or job.room=='ů��' or job.room=='��÷ɽׯ')  then
	    flag.searchRooms = {{'��÷ɽׯ','����ɽ',4},{'����','����ɽ',4},{'������ɽ��','����ɽ',4}}
		return go(wudangFindAct,'����ɽ','��÷ɽׯ')
	end
	
	if flag.times==3 and job.area=='����ɽ' and (job.room=='���Ṭ' or job.room=='ů��' or job.room=='��÷ɽׯ')  then
         flag.searchRooms = {{'��÷ɽׯ','����ɽ',4},{'����','����ɽ',4},{'������ɽ��','����ɽ',4},{'ʯ����','����ɽ',4},{'���پ�','����ɽ',4},{'��ʥ��','����ɽ',4}}
		return go(wudangFindAct,'����ɽ','��÷ɽׯ')
	end
	
	if flag.times==3 and job.area=='����ɽ'  then
	    flag.searchArea={[300]='kunlun/',[301]='fairyland/'}
		return go(wudangFindAct,'����ɽ','��Զ��')
	end
	
	if flag.times==3 and (job.area=='��ɽ' or job.area=='��ɽ��' ) then
	    flag.searchArea={[300]='huashan/',[301]='village/'}
		return go(wudangFindAct,'��ɽ','��Ů��')
	end
	
	if flag.times==3 and job.area=='������' then
	    flag.searchArea={[300]='changan/'}
		return go(wudangFindAct,'������','��¥')
	end
	
	if flag.times==3 and job.area=='��٢��ɽׯ' then
	    flag.searchArea={[300]='mtl/'}
		return go(wudangFindAct,'��٢��ɽׯ','�ƽ�¥')
	end
	
	
    return go(wudangFindAct,job.area,job.room)
end
--��������ʧ��
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
go(wudangFangqi,"�䵱ɽ","�����")
end
function wudanglevel(n,l,w)
    job.level=w[2]
    --messageShow('WD job level:��'..job.level..'��')
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
job.list["wudang"] ="�䵱ɱ����"
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
    return go(wudangBegin,"�䵱ɽ","�����")
	--return go(wudangGo_confirm,"�䵱ɽ","�����")
end

function wudangGo_confirm()
    locate_finish=0
	fastLocate()
    if locl.room=='�����' then 
	    return wudangBegin()
	else
	    go(wudangBegin,"�䵱ɽ","�����")
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
   if job.level=='���뻯��' then
      job.level='δ֪'
      messageShow('�䵱���񣺵�ǰ�ӵ������뻯�����������ڿ�ʼ������ȼ�Ϊ��'..job.level..'����','red')
	  wdgostart=1
		return check_busy(wudangHuajing_GoAgain)
	end
    wudangTriggerDel()
    job.lost=0   
    setLocateRoomID='wudang/sanqing'
    if score.party=='��ɽ��' and hp.shen<0 then
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
    job.target='ɳ��'
	print('job.target..'..job.target)
    job.killer={}
    job.killer[job.target]=true
    job.where='���޺�ɽ����Χ��Բ����֮��'
	local ori_where = job.where
	print('job.where..'..job.where)
	if string.find(job.where,"��Χ") then
	   local l_cnt = string.find(job.where,"��Χ")
	   job.where=string.sub(job.where,1,l_cnt-1)
	   Note(job.where)
	end
	--print('�������..'..w[5])
	 
	 if string.find(ori_where,"��֮��") then
                x=string.find(ori_where,"��֮��")
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
	print('����ص��ӡ...:...'..w[1]..';'..w[2]..';'..w[3]..';'..w[4]..';'..w[5])
    job.target=Trim(w[4])
	print('job.target..'..job.target)
    job.killer={}
    job.killer[job.target]=true
    job.where=Trim(w[5])
	print('job.where..'..job.where)
	--Note(job.where)
	if string.find(job.where,"��Χ") then
	   local l_cnt = string.find(job.where,"��Χ")
	   job.where=string.sub(job.where,1,l_cnt-1)
	   Note(job.where)
	end
	print('�������..'..w[5])
   ---if string.find(Trim(w[3]),"��֮��") then
   if string.find(Trim(w[5]),"��֮��") then
                x=string.find(Trim(w[5]),"��֮��")
                wd_distance=trans(string.sub(Trim(w[5]),x-2,x-1))
				print('wd_distance..'..wd_distance)
        else
            wd_distance=4
        end
	

if string.find(job.where,"��������") or string.find(job.where,"�����鷿") or string.find(job.where,"��������") or string.find(job.where,"������Ժ") then
		job.where= "������������"
	end
if string.find(job.where,"���ݳǹ뷿") and not Bag["ͭԿ��"] then
		job.where= "���ݳǺ��ָ�Ժ"
	end	
 --if string.find(job.where,'���º�ȭ��') or string.find(job.where,'�䵱ɽԺ��') or string.find(job.where,'�䵱ɽ��ɽСԺ') then
    if string.find(job.where,'���º�ȭ��')  then
       messageShow('�䵱����ڣ�����ص㡾'..job.where..'�����ɵ�����������')
       return check_halt(wudangFindFail)
    end 

	
	if (string.find(job.where,"���������") or string.find(job.where,"����ǿ�ջ")  or string.find(job.where,"���������")  or string.find(job.where,"����ǰ�����Ժ")  or string.find(job.where,"����ǳ�����")) then
		job.ori_where=job.where
		job.where= "������ϳ���"
	end
	
	if (string.find(job.where,"���ݳ��鱦��") or string.find(job.where,"���ݳ��������ƹ�")  or string.find(job.where,"���ݳ���������¥")  ) then
		job.ori_where=job.where
		job.where= "���ݳ������"
	end
	
	if string.find(job.where,"��ɽ����������") then
		job.where= "��ɽ��������ƺ"
	end
	
	if (string.find(job.where,"�䵱ɽԺ��") or string.find(job.where,"�䵱ɽ��ɽСԺ")) then
		job.where= "�䵱ɽС��"
	end
	
		
	--messageShow('�䵱�ص�ͳ�ƣ���������'..wdtosld..'���� ��Ľ�ݡ�'..wdtomr..'���� �������롾'..wdtoyzw..'���� ����٢��ɽׯ��'..wdtomtl..'���� ��',"cyan")
	--messageShow('�䵱���ɵ���ص�ͳ�ƣ���ɽʯ����'..wdtohssd..'���� �����ݹ뷿��'..wdtoszgf..'���� �������á�'..wdtoxct..'���� ��',"cyan")
    job.room,job.area=getAddr(job.where)
	print('job.room,job.area..'..job.room..','..job.area)
     
end
function wudangNpc(n,l,w)
    EnableTriggerGroup("wudangAccept",false)
    EnableTrigger("wudangAccepta",true)
    EnableTrigger("wudangAcceptb",true)
	sxjob.skills=tostring(w[3])
	--��ʼͳ��
	wdtongji_cs=wdtongji_cs+1
end
function wudangFindGo()
    EnableTriggerGroup("wudangAccept",false)
    dest.room=job.room
    dest.area=job.area
	job.wdtime=os.time() + 8*60
	  exe('score')
      exe('nick �䵱����'..job.where)
      exe('set no_kill_ap')
	--pfmjineng()
	setLocateRoomID='wudang/sanqing'
		if not job.room or not path_cal() then
       messageShow('�䵱��������ص㡾'..job.where..'�����ɵ�����������')
       --return check_busy(wudangFangqi)
	   return checkWait(wudangFangqi,1)
    end
	if skillIgnores[sxjob.skills] then
       messageShow('�䵱����'.. job.target ..'ʹ�õ��书�ǡ�'..sxjob.skills..'���������У����������')
	   --return check_busy(wudangFangqi)
	   return checkWait(wudangFangqi,1)
	end
	
	if job.level=='���뻯��' then
		--return check_busy(wudangHuajing_Fangqi)
		return checkWait(wudangHuajing_Fangqi,1)
	end
	   --messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����')
	messageShow('�䵱�������ڿ�ʼǰ����'..job.where..'����')
	
        ---return check_busy(wudangFind)
		return checkWait(wudangFind,1)
end
function wudangHuajing_Fangqi()
    EnableTriggerGroup("wudangAccept",false)
    messageShow('�䵱���񣺼�װ�������뻯��!','greenyellow')
    return check_busy(wudangFangqiAsk)
end
function wudangHuajing_GoAgain()
	job.wdtime=os.time() + 5*60
	--messageShow('�䵱�����Ҫ������ص㡾'..job.where..'��������������'..job.target..'����ʹ�ü��ܡ�'..sxjob.skills..'����','greenyellow')
  messageShow('�䵱�������ڿ�ʼǰ����'..job.where..'����','greenyellow')
      
       return check_busy(wudangFind)
end

function wudangYiliFindFail()
    print('wudangYiliFindFail........')
	--jobfailLog()
    if job_suspend == nil then 
	    job_suspend = clone(job)
		job_suspend.npcskill = sxjob.skills
		messageShow('wudang ����'..job_suspend.ori_where..'����ʧ�ܣ����ط���!')
        return go(wudangFangqi,'�䵱ɽ','�����')
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
		messageShow('wudang ����'..job_suspend.where..'����ʧ�ܣ����ط���!')
        return go(wudangFangqi,'�䵱ɽ','�����')
	else
        return check_jobx()	
	end
end



function wudangFangqiGo()
    print('wudangFangqiGo......')
    locate_finish=0
	fastLocate()
    DeleteTimer("wudang")
    messageShow('���䵱����NPC�����ˣ����������')
  go(wudangFangqi,'�䵱ɽ','�����')
end
function wudangFangqi()
    wdtongji_fangqi=wdtongji_fangqi+1
	exe('nick �䵱�������')
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
	--- pumkmai add ,�� flood
    EnableTriggerGroup("wudangAsk",true)
    wait.make(function() 
	       while true do
		      exe('ask song yuanqiao about ����')
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
    create_trigger_t('wudangFind2',"^(> )*".. job.target .."�����㷢��һ����Ц��˵��",'','wudangFindKill')
	create_trigger_t('wudangFind3','�����'..job.target..'���һ������������'..job.target..'��','','wudang_fight_kill')
	
	
    SetTriggerOption("wudangFind1","group","wudangFind")
    SetTriggerOption("wudangFind2","group","wudangFind")
	SetTriggerOption("wudangFind3","group","wudangFind")
	
	DeleteTriggerGroup("wudangFind_MayBeLost")
	create_trigger_t('wudangFind_MayBeLost1',""..job.target.."���Ʋ������һ���������Ӵ�",'','wudangTarget_maybelost1')
	create_trigger_t('wudangFind_MayBeLost2',"^(> )*��Ҫ��˭�����������",'','wudangTarget_maybelost2')
	create_trigger_t('wudangFind_MayBeLost3',"^(> )*����û������ˡ�",'','wudangTarget_maybelost3')
	SetTriggerOption("wudangFind_MayBeLost1","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost2","group","wudangFind_MayBeLost")
	SetTriggerOption("wudangFind_MayBeLost3","group","wudangFind_MayBeLost")
	EnableTriggerGroup("wudangFind_MayBeLost",false)
	
	
    flag.times = 1
    flag.robber=false
	print('wudangSuspendFind........111111111111111')
	
		
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pmiao")  
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
        tmppfm = GetVariable("pxian")
		---local tmppfm = GetVariable("pxian")
	    create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	    exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	    DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pkuai")
	---local tmppfm = GetVariable("pkuai")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pman")
	---local tmppfm = GetVariable("pman")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("prou")
	---local tmppfm = GetVariable("prou")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pgang")
	---local tmppfm = GetVariable("pgang")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pqi")
	---local tmppfm = GetVariable("pqi")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pzhen")
	---local tmppfm = GetVariable("pzhen")
	     create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	     exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	     DoAfterSpecial(2,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pkong")
	---local tmppfm = GetVariable("pkong")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	     tmppfm = GetVariable("pwu")
	---local tmppfm = GetVariable("pwu")
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(0.5,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
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
    create_trigger_t('wudangFind2',"^(> )*".. job.target .."�����㷢��һ����Ц��˵��",'','wudangFindKill')
	create_trigger_t('wudangFind3','�����'..job.target..'���һ������������'..job.target..'��','','wudang_fight_kill')
	
	
    SetTriggerOption("wudangFind1","group","wudangFind")
    SetTriggerOption("wudangFind2","group","wudangFind")
	SetTriggerOption("wudangFind3","group","wudangFind")
	
	DeleteTriggerGroup("wudangFind_MayBeLost")
	create_trigger_t('wudangFind_MayBeLost1',""..job.target.."���Ʋ������һ���������Ӵ�",'','wudangTarget_maybelost1')
	create_trigger_t('wudangFind_MayBeLost2',"^(> )*��Ҫ��˭�����������",'','wudangTarget_maybelost2')
	create_trigger_t('wudangFind_MayBeLost3',"^(> )*����û������ˡ�",'','wudangTarget_maybelost3')
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
	
	if kezhiDesc["��"][sxjob.skills] then
	  if shenqi_id ~= nil and use_wxb_sq==1  then
	     tmppfm = GetVariable("sq_pmiao")  
	  else
	     tmppfm = GetVariable("pmiao")
	  end 
	create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pfmpfm '..tmppfm)
	exe('unset wimpy;set wimpycmd pfmpfm\\hp')
	DoAfterSpecial(3,'kezhiwugongpfm',10)
	end
	
	if kezhiDesc["��"][sxjob.skills] then
	  
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
	  
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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
	
	if kezhiDesc["��"][sxjob.skills] then
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

  if job.area=='����' and (job.room=="��ɼ��" or string.find(job.room,"����")) and flag.times==1 then 
	     flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3}}
		 go(wudangFindAct,'����','�һ���') 
		 
  elseif  job.area=='����' and (job.room=="�һ���" or  job.room=="������" or  job.room=="��ˮ��" or job.room=="�����") and flag.times==1 then 
	     flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3},{'������','����',3}}
		 go(wudangFindAct, job.area, job.room)
	
    elseif job.area=='����' and (job.room=="���䳡") and flag.times==1 then 
	     flag.searchRooms = {{'�һ���','����',3},{'������','����',3},{'��ˮ��','����',3},{'�����','����',3},{'������','����',3},{'С��','����',3}}
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
    messageShow('�䵱���񣺿�ʼ����Ѱ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
end
function wudangFindAct()
    EnableTriggerGroup("wudangFind",true)
    DeleteTimer("wudang")
    job.flag()
    exe('look')
    --find()	
    messageShow('�䵱�����ѵ�������ص㡾'..job.where..'������ʼѰ�ҡ�'..dest.area .. dest.room ..'����'..'��'.. job.target ..'����')
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
			 local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
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
       messageShow('�䵱����������ʧ��'.. job.target ..'��4�Σ���ȥ������')
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
       messageShow('�䵱����������ʧ��'.. job.target ..'��4�Σ���ȥ������')
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
			 local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
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
	   --��ʼͳ��
       wdtongji_zdcs=wdtongji_zdcs+1	   
	   wdtongji_lasttime_lj=wdtongji_lasttime_lj+wdtongji_thistime
	   wdtongji_pingjun=string.format("%0.2f",wdtongji_lasttime_lj/wdtongji_zdcs)
	   messageShowT('�䵱���񣺡�'..job.target..'����'..job.id..'����ʹ���书��'..npc_skill..'�����书���ԡ�'..npc_val..'����')
       messageShowT('�䵱���񣺸㶨'..'��'.. job.target ..'����ս����ʱ:��'..fight.time.over..'���롣')
	   
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
    go(wudangFinishC,'�䵱ɽ','�����')
end
function wudangFinishWait()
    if locl.id["��Զ��"] then
	   return wudangFinishC()
        else
	   return go(wudangFinishWait,'�䵱ɽ','�����')
    end
end
function wudangFinishT()
    wdtongji_finish=wdtongji_finish+1
	wudang_cs=wudang_cs+1
	last_wdjob_status=1
	print('���ο��Ҹɵúá�')
	--setLocateRoomID='wudang/sanqing'
end
function wudangFinishC()
	print('�ȴ����η�������')
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
	exe('score;ask song yuanqiao about ����')  
	return check_halt(wudang_chifan)
	else
	
	return check_halt(check_jobx)
	end	
end
