-------��ɽ
hstongji_total = 0
hstongjilasttime_total=0
hstongji_1 = 0
hstongji_2 = 0
hstongji_zh = 0 --����ʱ���ܺ�
hstongji_lq = 0 --hs��ȡ����
hstongji_finish = 0 --hs����ɹ�����
hstongji_fangqi = 0 --hsʧ�ܴ���
hstongji_pingjun = 0 --ƽ��ʱ�� 
hstongji_thistime = 0  --hs ����ս��ʱ�� 
hstongjilasttime_l = 0 -- �ۼ�hs2ս��ʱ��
hstongjilasttime_l_2 = 0 --����hsս��ʱ��
hstongjilasttime_l_1 = 0 --�ۼ�hs1ս��ʱ��
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

local huashanArea1={
	["�˵�"]="��ɽ��",
	["�ӻ���"]="��ɽ��",
	["��"]="��ɽ��",
	["����"]="��ɽ��",
	["������"]="��ɽ��",
	["�����"]="��ɽ��",
	["��ʯ·"]="��ɽ��",
	["��̳��"]="��ɽ��",
	["������"]="��ɽ",
	["����"]="��ɽ",
	["�ٲ�"]="��ɽ",
	["������"]="��ɽ",
	["������"]="��ɽ",
	["�����"]="��ɽ",
	["ɯ��ƺ"]="��ɽ",
	["ǧ�ߴ�"]="��ɽ",
	["�ٳ�Ͽ"]="��ɽ",
	["���ƺ"]="��ɽ",
	["������"]="��ɽ",
	["������"]="��ɽ",
	["��Ů��"]="��ɽ",
	["��ȪԺ"]="��ɽ",
	["˼����"]="��ɽ",
	["ҩ��"]="��ɽ",
	["����"]="��ɽ",
	["ɽ��"]="��ɽ",
	["СϪ"]="��ɽ",
	["��̳"]="��ɽ",
	["˼���¶���"]="��ɽ",
	["ɽ·"]="��ɽ",
	["ʯ��"]="��ɽ",
	["����"]="��ɽ",
	["��ɽ����"]="��ɽ",
	["ɽ���ٲ�"]="��ɽ",
	["���䳡"]="��ɽ",
	["����"]="��ɽ",
	["�鷿"]="��ɽ",
	["����"]="��ɽ",
	["����"]="��ɽ",
	["ǰ��"]="��ɽ",
	["̨��"]="��ɽ",
	["������"]="��ɽ",
	["����"]="��ɽ",
	["��Ϣ��"]="��ɽ",
	["�Ͼ���"]="��ɽ",
	["Сɽ·"]="��ɽ",
}
job.list["huashan"] ="��ɽ�Ͷ�����"
function huashan()
    hsjob2=0
    dis_all()
    huashan_trigger()
    job.name='huashan'
    job.target='����Ŀ��'
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
EnableTriggerGroup("huashan_find",true)
if flag.times==3 and dest.area=='������' and dest.room=='ɽ��յ�' then
		return go(huashanFindAct,'��������','�ٲ�')
	end
	if flag.times==2 and dest.area=='����' and (dest.room=="��ɼ��" or string.find(dest.room,"����")) then
		return go(huashanFindAct,'����','���䳡')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='����' then
		return go(huashanFindAct,'���ݳ�','�����ϰ�')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='���' then
		return go(huashanFindAct,'���ݳ�','����')
	end
	if flag.times==3 and job.area=='����ɽ' and job.room=='ɽ·' then
		return go(huashanFindAct,'����ɽ','��ָ��')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='��ʯ���' then
		return go(huashanFindAct,'���ݳ�','������')
	end
	if flag.times==3 and job.area=='�置' and job.room=='ɽ·' then
		return go(huashanFindAct,'�置','ɽ��')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='ɽ·' then
		return go(huashanFindAct,'���ݳ�','�׷���')
	end
	if flag.times==3 and job.area=='��ɽ����' and job.room=='ʯ��·' then
		return go(huashanFindAct,'��ɽ����','����')
	end
	if flag.times==3 and job.area=='���ݳ�' and job.room=='������' then
		return go(huashanFindAct,'���ݳ�','����')
	end
	
	if flag.times==3 and job.area=='��ɽ����' and job.room=="�޺���" then
		return go(huashanFindAct,'��ɽ����','�޺����岿')
	end
	if flag.times==3 and job.area=='��ɽ����' and job.room=="������" then
		return go(huashanFindAct,'��ɽ����','�������岿')
	end
  go(huashanFindAct,job.area,job.room)
end

function huashanFindFail()
  return check_busy(hsFindFail)
end
function hsFindFail()
go(huashan_shibai,'��ɽ','������')
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
go(hsaskjob,'��ɽ','������')
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
    create_trigger_t('huashan_ask1',"^(> )*��������Ⱥ�����йء�job������Ϣ��$",'','huashan_ask')
    create_trigger_t('huashan_ask2',"^(> )*����û������ˡ�$",'','huashan_nobody')
    SetTriggerOption("huashan_ask1","group","huashan_ask")
    SetTriggerOption("huashan_ask2","group","huashan_ask")
    EnableTriggerGroup("huashan_ask",false)
    DeleteTriggerGroup("huashan_accept")
    create_trigger_t('huashan_accept1',"^(> )*����Ⱥ˵�������㲻�ܹ�˵ѽ������������ɼ����ҿ�����",'','huashan_shibai')
    create_trigger_t('huashan_accept2',"^(> )*����Ⱥ˵��������������æ�������������أ�",'','huashan_busy')
    create_trigger_t('huashan_accept3',"^(> )*����Ⱥ˵����������û����˵�ж���Ϊ������",'','huashan_fangqi')
    create_trigger_t('huashan_accept4',"^(> )*����Ⱥ������һ�����ơ�$",'','huashan_npc')
	create_trigger_t('huashan_accept5',"^(> )*����Ⱥ����˵�����㻹����ȥ˼�������˼��ȥ�ɡ�",'','huashanjjQuest')
	create_trigger_t('huashan_accept6',"^(> )*����Ⱥ˵����������û����˵�ж���Ϊ�����գ����Լ�ȥ��ϰ�书ȥ�ɣ���",'','huashan_fangqi')
	SetTriggerOption("huashan_accept1","group","huashan_accept")
    SetTriggerOption("huashan_accept2","group","huashan_accept")
    SetTriggerOption("huashan_accept3","group","huashan_accept")
	SetTriggerOption("huashan_accept4","group","huashan_accept")
	SetTriggerOption("huashan_accept5","group","huashan_accept")
    SetTriggerOption("huashan_accept6","group","huashan_accept")
    EnableTriggerGroup("huashan_accept",false)
    DeleteTriggerGroup("huashan_npc")
    create_trigger_t('huashan_npc1',"^(> )*(�䲻��|ͻȻ|�͵�|��Ȼ|�䲻��)������\\D*������ƣ���(\\D*)(��|����)\\D*��ȥ��$",'','huashan_where')
    create_trigger_t('huashan_npc2',"^(> )*��һ��ץ����������ͼ�������ƣ��������������ݵö��˹�ȥ����˳�ֳ��������˵����֣�����ԭ�����������𽭺���(\\D*)��",'','huashan_find')
    create_trigger_t('huashan_npc3','^(> )*��� "hsjob" �趨Ϊ "�й���" �ɹ���ɡ�','','huashan_npc_goon')
    SetTriggerOption("huashan_npc1","group","huashan_npc")
    SetTriggerOption("huashan_npc2","group","huashan_npc")
    SetTriggerOption("huashan_npc3","group","huashan_npc")
    EnableTriggerGroup("huashan_npc",false)
	DeleteTriggerGroup("huashanQuest")
	create_trigger_t('huashanQuest1',"^(> )*����Ⱥ˵������".. score.name .."��ɱ�˲��ٶ��ˣ�δ��ɱ�����ز�����˼���������ڰ�",'','huashanDgjj')
	SetTriggerOption("huashanQuest1","group","huashanQuest")
	EnableTriggerGroup("huashanQuest",false)
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
     EnableTimer('walkWait4',false)
    EnableTriggerGroup("huashan_ask",false)
    EnableTriggerGroup("huashan_accept",true)
end
function huashan_nobody()
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
    Execute('ask yue buqun about ʧ��')
	if job.where~=nil and string.find(job.where,"���͵�") then
		mjlujingLog("���͵�")
	end
    hstongji_fangqi=hstongji_fangqi+1
    messageShow('��ɽ��������ʧ��!��ɽʧ��['..hstongji_fangqi..']�Ρ�')
    return check_halt(check_food)
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
    return check_halt(check_food)
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
    exe('nick ��ɽ������')
    job.time.b=os.time()
	EnableTriggerGroup("huashan_accept",false)
	job.last="huashan"
    if hsjob2<1 then
                hstongji_lq=hstongji_lq+1
		messageShow('��ɽ���񣺿�ʼ����')
		locate_finish='huashan_npc_go'
		return check_busy(locate,0.2)
	else
	   locate_finish='huashan_npc_go2'
		return check_busy(locate,0.2)
	end
	
end
function huashan_npc_go()
   locate_finish=0
    go(huashan_npc_get,'��ɽ','ɽ����','huashan/zhengqi')
end
function huashan_npc_go2()
   locate_finish=0
    go(huashan_npc_get,'��ɽ','ɽ����','huashan/jitan')
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
    if locl.room=="ʯ��" or locl.room=="��ȪԺ" then
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
huashan_find=function(n,l,w)
    local flag_huashan=0
    dis_all()
    job.target=tostring(w[2])
	job.killer={}
	job.killer[job.target]=true
	DeleteTriggerGroup("huashan_find")
    create_trigger_t('huashan_find1','^( )*'..job.target..'\\((\\D*)\\)','','huashan_fight')
    create_trigger_t('huashan_find2','^(> )*������(\\D*)��ɱ���㣡','','huashan_debug_fight')
    create_trigger_t('huashan_find3','^(> )*�ɻ�����������㿴����֪����Щʲô���⡣','','huashan_dadao')
    SetTriggerOption("huashan_find1","group","huashan_find")
    SetTriggerOption("huashan_find2","group","huashan_find")
    SetTriggerOption("huashan_find3","group","huashan_find")
if string.find(job.where,'������') then
tosld=tosld+1
end
if string.find(job.where,'�˵�') then
tocaidi=tocaidi+1
end
if string.find(job.where,'����Ľ��') then
tomr=tomr+1
end
if string.find(job.where,'������') then
toyzw=toyzw+1
end
if string.find(job.where,'��٢��ɽׯ') then
tomtl=tomtl+1
end
if string.find(job.where,'���ݳǹ뷿') then
hstoszgf=hstoszgf+1
end
if string.find(job.where,'��ɽʯ��') then
hstohssd=hstohssd+1
end
if string.find(job.where,'��ɽ����������') then
hstoxct=hstoxct+1
end
---if string.find(job.where,'���º�ȭ��') or string.find(job.where,'��٢��ɽׯ') or string.find(job.where,'�䵱ɽСԺ') 
if string.find(job.where,'���º�ȭ��')  
then
       messageShow('��ɽ����ڣ�����ص㡾'..job.where..'�����ɵ�����������')
       return check_halt(huashanFindFail)
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
	if not job.room or not path_cal() then
		messageShow('��ɽ��������ص㡾'..job.where..'�����ɵ�����������',"Plum")
		return check_halt(huashanFindFail)
	end
	print(dest.room,dest.area,job.room,job.area)
	messageShow('��ɽ����׷ɱ���ܵ���'..job.where..'���ġ�'..job.target..'����')
	locl.room='����'
     if job.room=='����' then flag.times=2 end
	return check_busy(hsFindAct)
end
function hsFindAct()
go(huashanFindAct,job.area,job.room,"huashan/shulin")
end
function huashan_debug_fight()
  EnableTrigger("huashan_find1",true)
  exe('look')
  exe('kill '..job.id)
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
    exe('look')
end
huashan_dadao=function()
    dis_all()
    exe('yes')
    return go(huashanFindAct,job.area,job.room)
end
heqi_count=0
huashan_fight=function(n,l,w)
    EnableTrigger("huashan_find2",false)
    job.id=string.lower(w[2])
   exe('unset no_kill_ap;yield no')
    exe('follow '..job.id)
	exe('kick '..job.id)
	job.killer[job.target]=job.id
    exe('kill '..job.id)
    exe('set wimpycmd pfmpfm\\hp')
	exe('set wimpy 100')
	exe('look '..job.id)
       --flag.find=1
	dis_all()
	heqi_count=0
    kezhiwugong()
	kezhiwugongAddTarget(job.target,job.id)	
    fight.time.b=os.time()
    EnableTrigger("hpheqi1",true)
	DeleteTriggerGroup("huashan_fight")
    create_trigger_t('huashan_fight1','^(> )*'..job.target..'��ž����һ�����ڵ���','','huashan_getget')
    create_trigger_t('huashan_fight2','^(> )*'..job.target..'��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','huashan_faint')
    create_trigger_t('huashan_fight3','^(> )*'..job.target..'�Ҵ��뿪��','','huashanFindFail')
    create_trigger_t('huashan_fight4','^(> )*����û�� '..job.id..'��','','huashanFindAct')
	create_trigger_t('huashan_fight5',"^(��|��)�����ţ�$",'','npcWeapon')
	 create_trigger_t('huashan_fight6',"^(��|��)װ���ţ�$",'','npcWeapon')
	 
    SetTriggerOption("huashan_fight1","group","huashan_fight") 
    SetTriggerOption("huashan_fight2","group","huashan_fight")
    SetTriggerOption("huashan_fight3","group","huashan_fight") 
	SetTriggerOption("huashan_fight4","group","huashan_fight") 
	SetTriggerOption("huashan_fight5","group","huashan_fight")
    SetTriggerOption("huashan_fight6","group","huashan_fight")
     	
end

corpse_idx = 1
function huashan_getget()
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
	DeleteTriggerGroup("huashan_getnpc")
	hsgettime = 0
	create_trigger_t("huashan_getnpc1", "^(> )*���(\\D*)��ʬ�������ѳ�һ�����ơ�", "", "huashan_backgogo")
	create_trigger_t("huashan_getnpc2", "^(> )*�㽫(\\D*)��ʬ������������ڱ��ϡ�", "", "huashan_get_con")
create_trigger_t("huashan_getnpc3", "^(> )*���컯�յ������ٰ�", "", "huashan_getagain")
    SetTriggerOption("huashan_getnpc1", "group", "huashan_getnpc")
	SetTriggerOption("huashan_getnpc2", "group", "huashan_getnpc")
	SetTriggerOption("huashan_getnpc3", "group", "huashan_getnpc")
	EnableTriggerGroup("huashan_getnpc",true)

    kezhiwugongclose()
	
	corpse_idx = 1
	
	if string.find(job.where,'�����') or string.find(job.where,'����Ľ��') or string.find(job.where,'������') or string.find(job.where,'��٢��ɽׯ') then
	    hscheckhead = 1
        return check_busy(huashan_cut,0.5)
	else
	    --exe('get corpse '..corpse_idx)
		exe('get corpse')
        return    
    end

end
function huashan_get_lingpai()
EnableTrigger("huashan_getnpc",true)
for i = 1, 4 do
exe("get ling pai from corpse " .. i)
end
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
       for i = 1, 4 do
            
			exe("get corpse")  
              exe("get ling pai from corpse " .. i)
        end
    end   
huashan_faint=function()
    exe('kill '..job.id)
end
function huashan_get_con(n, l, w)
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
	   --��ʼͳ�ƴ���
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l=hstongjilasttime_l+hstongjilasttime_l_2
	   hstongji_2=hstongji_2+1
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l/hstongji_2)
	   
	   messageShowT('��ɽ���񣺡�'..job.target..'����'..job.id..'����ʹ���书��'..npc_skill..'�����书���ԡ�'..npc_val..'����')
	   messageShowT('��ɽ����ս����ʱ:��'..fight.time.over..'����,�㶨�����ˣ���'..job.target..'��,��ɽ2���ơ�'..hstongji_2..'����.ƽ����ʱ��'..hstongji_pingjun..'����','aqua')
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

EnableTriggerGroup("huashan_getnpc", false)    
    weapon_unwield()
	dis_all()
    bqcheck()
	locate_finish=0
	return check_busy(huashan_fanhui)
end
function huashan_fanhui()
EnableTriggerGroup("wipe",false) 
go(huashan_yls, "��ɽ", "��̳")
end
huashan_cut=function()
    hscheckhead = 1
    EnableTriggerGroup("huashan_fight",false)
    EnableTriggerGroup("huashan_find",false)
    DeleteTriggerGroup("huashan_cut")
    road.id=nil
    create_trigger_t('huashan_cut1','^(> )*ֻ�����ǡ���һ�����㽫(\\D*)���׼�ն���������������С�','','huashan_cut_con')
    create_trigger_t('huashan_cut2','^(> )*(���б���ɱ���˸��ﰡ|��������������޷�����|����ü����������߲���������ʬ���ͷ��)','','huashan_cut_weapon')
    SetTriggerOption("huashan_cut1","group","huashan_cut") 
    SetTriggerOption("huashan_cut2","group","huashan_cut")
	job.killer={}
       fight.time.e=os.time()
       fight.time.over=fight.time.e-fight.time.b
	hstongji_thistime=fight.time.over
    if hsjob2==1 then
	   --��ʼͳ�ƴ���
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l=hstongjilasttime_l+hstongjilasttime_l_2
	   hstongji_2=hstongji_2+1
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l/hstongji_2)
	   messageShowT('��ɽ���񣺡�'..job.target..'����'..job.id..'����ʹ���书��'..npc_skill..'�����书���ԡ�'..npc_val..'����')
	   messageShowT('��ɽ����ս����ʱ:��'..fight.time.over..'����,�㶨�����ˣ���'..job.target..'��,��ɽ2���ơ�'..hstongji_2..'����.ƽ����ʱ��'..hstongji_pingjun..'����','aqua')	   
	return check_halt(huashan_cut_act)	  
	   else
	   --��ʼͳ�ƴ���
	   hstongjilasttime_l_2=hstongji_thistime
	   hstongjilasttime_l_1=hstongjilasttime_l_1+hstongjilasttime_l_2
	   hstongji_1=hstongji_1+1 
	   hstongji_pingjun=string.format("%0.2f",hstongjilasttime_l_1/hstongji_1)
	messageShowT('��ɽ����ս����ʱ:��'..fight.time.over..'����,�㶨�����ˣ���'..job.target..'��,��ɽ1���ơ�'..hstongji_1..'����.ƽ����ʱ��'..hstongji_pingjun..'����','aqua')
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
	exe('pfmset')
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

locate_finish=0
 go(huashan_yls,'��ɽ','��̳')
end
huashan_yls=function()
    EnableTriggerGroup("huashan_qigai",false)
    DeleteTriggerGroup("huashan_yls")
    create_trigger_t('huashan_yls1','^(> )*(����û������ˡ�|������û������������|���˺�������ɱ�İɣ�|���������|�㻹û��ȥ�Ҷ�������ô������̳�ˣ�)','','huashan_yls_fail')
    create_trigger_t('huashan_yls2','^(> )*����ɺ�����������д����һ�� (һ|��) �֡�','','huashan_yls_ask')
	create_trigger_t('huashan_yls3','^(> )*���������������ưɣ�','','huashan_yls_lingpai')
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
	if locl.room~="��̳" then
	   return go(huashan_yls,'��ɽ','��̳')
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
    create_trigger_t('huashan_yls_ask1','^(> )*��������ɺ�����йء��������ġ�����Ϣ��','','huashan_yls_back')
	create_trigger_t('huashan_yls_ask2','^(> )*�������ɺһ��(\\D*)���׼���','','huashan_yls_back1')
    SetTriggerOption("huashan_yls_ask1","group","huashan_yls_ask")
	SetTriggerOption("huashan_yls_ask2","group","huashan_yls_ask")
    EnableTriggerGroup("huashan_yls_ask",false)
    if w[2]=='��' then
	   hs2job=1
	   locate_finish='huashan_yls_back'
       return check_busy(locate)
    end
    if w[2]=='һ' and dohs2==0 then
	  locate_finish='huashan_yls_lbcx'
       return check_busy(locate,0.5)
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
        print("�������ֲ�������")
        return check_bei(huashan_npc)
        end
end
huashan_yls_lbcx=function()
     locate_finish=0
    EnableTriggerGroup("huashan_yls_ask",true)	
    ---return exe('drop head;ask yue lingshan about ��������')
	---pumkmai add ��ֹ flood
	wait.make(function() 
	                wait.time(1)
				    exe('drop head')
					--wait.time(1)
					exe('ask yue lingshan about ��������')
			    end)	 
	
	
end
huashan_yls_back=function()
    locate_finish=0
    EnableTriggerGroup("huashan_yls_ask",false)
	EnableTriggerGroup("huashanQuest",true)
    DeleteTriggerGroup("huashan_over")
    create_trigger_t('huashan_over1','^(> )*�������Ⱥһ�����ơ�','','huashan_finish')
    create_trigger_t('huashan_over2','^(> )*����û������ˡ�','','')
    SetTriggerOption("huashan_over1","group","huashan_over")
    SetTriggerOption("huashan_over2","group","huashan_over")
    return check_busy(hsfinish)
end
function hsfinish()

go(huashan_over,'��ɽ','������','huashan/jitan')
end
huashan_over=function() 
	EnableTriggerGroup("huashanQuest",true)
	job.time.e=os.time()
	job.time.over=job.time.e-job.time.b
    --��ʼͳ��
	hstongji_finish=hstongji_finish+1
	hs2job=0
	messageShowT('��ɽ�������������ʱ:��'..job.time.over..'���롣','aqua')
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
    hsjob2=0
	exe('drop ling pai')
	huashan_triggerDel()
	setLocateRoomID='huashan/zhengqi'
	messageShow('��ɽ����ص�ͳ�ƣ���������'..tosld..'���� ���˵ء�'..tocaidi..'���� ��Ľ�ݡ�'..tomr..'���� �������롾'..toyzw..'���� ����٢��ɽׯ��'..tomtl..'���� ��',"cyan")
	messageShow('��ɽ2���ɵ���ص�ͳ�ƣ���ɽʯ����'..hstohssd..'���� �����ݹ뷿��'..hstoszgf..'���� �������á�'..hstoxct..'���� ��',"cyan")
	hswc_cs=hswc_cs+1
	max_hs_cs=tonumber(GetVariable("hs_cs"))
	print('hswc_cs....'..hswc_cs)
	if hswc_cs>max_hs_cs then
	   hswc_cs=0
	return check_halt(check_food)
	else
	return check_halt(check_jobx)
end
end
function huashanDgjj()
    if score.party and score.party=="��ɽ��" then messageShow ('��ɽ���񣺳��������ʾ�ˣ�') end
    return huashan_finish()
end
function huashanjjQuest()
    EnableTriggerGroup("huashan_accept",false)
 if score.party and score.party=="��ɽ��" then
    messageShow ('��ɽ������ʾҪ�����˼����ֹͣ����ɽ����')
	job.zuhe["huashan"] = nil
	return check_heal()
 else
    return huashan_finish()
 end
end



