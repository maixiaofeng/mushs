--[[˵��:
1.��shujian.lua ��sLetterlost() ��EnableTriggerGroup("lostletter",true)�� ֮ǰ����llgo()
2.��sendOk() ��return ֮ǰ��һ��sendOk_fix()
3.��shujian.lua require ����м��� require "dolost"
-]]
require 'wait'
require 'tprint'
addali_reg=function(aliname,alimatch,aligroup,aliscript)
	alireturnvalue=AddAlias(aliname,alimatch,"",alias_flag.Enabled + alias_flag.Replace+ alias_flag.RegularExpression,aliscript)
	SetAliasOption(aliname,"group",aligroup)
	return alireturnvalue
end
function llgo()
print('llgo..........')
create_trigger_t('lostletter8',"^[> ]*����һ���������������ͳ������š�$",'','lostp_look')
SetTriggerOption("lostletter8","group","lostletter")
--create_alias_s('llgo','^llgo$','lost_goto')
addali_reg('llgo','^llgo$','','lost_goto')
end
function lostp_look()
    print('lostp_look...........')
    job.name='dolost'
    DeleteTriggerGroup("lostplace")
    create_trigger_t('lostplace1',"^[> ]*��������������(\\D*)һ�����֡�$",'','lostp_get')
    SetTriggerOption("lostplace1","group","lostplace")
    EnableTriggerGroup("lostplace",true)
end
function lostp_get(n,l,w)
    print('lostp_get..............')
	--exe('look lose letter')
    ll_place = w[1]
	job.where=ll_place
	if string.find(ll_place,'����Ľ��') or string.find(ll_place,'������') or string.find(ll_place,'��٢��ɽׯ') or string.find(ll_place,'������') or string.find(ll_place,'�����') or string.find(ll_place,'����') or string.find(ll_place,'��Դ��') or string.find(ll_place,'���޺�ɽ��') then	
		messageShow('ʧ����ż����񣺡�'..ll_place..'��̫Զ��������',"red")		
        EnableTimer('walkWait4',false)
	    locate_finish='check_ll'
        return locate()		
	end
	if string.find(ll_place,'�����ϰ�') or string.find(ll_place,'������') or string.find(ll_place,'ؤ��') or string.find(ll_place,'��������') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���˳�') or string.find(ll_place,'��ɽ��') then
       ll_place = '���ݳǳ�������'
    end
	if string.find(ll_place,'�ƺ������ɿ�') then
       ll_place = '�ƺ������ɿ�'
    end
	if string.find(ll_place,'���׽���') then 
		ll_place = '����������׽���'
	end 
	if string.find(ll_place,'���ݳǴ�ɿ�') then 
		ll_place = '���ݳǴ�ɿ�'
	end
	if string.find(ll_place,'��ɽ')  or string.find(ll_place,'��ľ��')  then 
		ll_place = '�������½��ɿ�'
	end
	if string.find(ll_place,'������') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���ԭ') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���޺�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�ؽ�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�����') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'����') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���ݳ�') then 
		ll_place = '���ݴ�ɿ�'
	end
	if string.find(ll_place,'������') then 
		ll_place = '���ݴ�ɿ�'
	end
	if string.find(ll_place,'ƽ����') then 
		ll_place = '�������½��ɿ�'
	end
	if string.find(ll_place,'���ݳ����Ķɿ�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�������½��ɿ�') then 
		ll_place = '�������½��ɿ�'
	end	
    if score.party == '����Ľ��' then 
	    ll_place=ll_place 
	end
	--messageShow('ʧ����ż����񣺿�ʼǰ����'..ll_place..'��Ѱ����ң�')
	DoAfterSpecial(0.2,'llgo',10)
end
function lost_goto()  
   print('lost_goto........')
   create_timer_s('walkWait4',10.0,'sx_look')
	if ll_place == nil then 
      return Note('�յط�������ȥ��P!') 
	end
	--[[if ll_place == '���޺�����' then 
      return Execute('discard letter')
	end]]
	messageShow('ʧ����ż����񣺿�ʼǰ����'..ll_place..'��Ѱ�����'..'��'..lost_name..'��')
	if ll_place=='�������½��ɿ�' or ll_place == '���ݳǳ�������' or ll_place=='���ݳǴ�ɿ�' or ll_place=='���׽���' or ll_place=='���ݳ����Ķɿ�' or ll_place=='�ƺ������ɿ�' then 
		return gogo(ll_place)
	end	
	dest.room,dest.area=getAddr(ll_place)
	if job.area and job.area==dest.area and job.room and job.room==dest.room then
		return go(find_dolost,job.area,job.room)
    else
          job.area=dest.area
          job.room=dest.room
    end
	if dest.area == nil or not dest.room then
     	 exe('look lose letter') 
	else 
	    print('go lookXin.............')
	     return go(lookXin,dest.area,dest.room)	 	
    end
end
function find_dolost()
flag.times=1
job.flag()
exe('look')
return find()
end
sx_look=function()
print('sx_look.........')
exe('look letter')
end
function sendOk_fix()
    EnableTimer('walkWait4',false)
	ll_place=nil
	DeleteTriggerGroup("lostplace")
end
function sendXXin()
   print('sendXXin........')
    wipe_kill=1
   lookXin()
    return create_timer_s('sendTo',0.4,'sendTo')
end
function check_ll()
locate_finish=0
EnableTimer('sendTo',false)
EnableTimer('sx_look',false)
dis_all()
return checkJob()
end

------------- new lost  -------------------------------------

zhongyuan_citys = {
    "������","���ְ�","�ɶ���","���ݳ�","�����","�������", "�������","����Ƕ�",
	"����ɽ","����ʹ�","��������","����ɽ",
	"�����", "����ɽ",	 "��Դ��","�����","��������","����","��ɽ��","���ݳ�",
	"�置", "������", "������","������","��ɽ��","̩ɽ",	
	"���ư�", "������", "��ɽ��", "�䵱��","�䵱��ɽ","���", "������","������",
	"������","����","�ɶ�","����", "�����","����ɽ","��Ĺ","�ƺ�����",	 "��ɽ","����",		
	"��ɽ����", "��ɽ",	"����ɽ","�䵱ɽ", "����",	 "��ѩɽ", "��������","��Ĺ��","�ɶ�����", "����Ǳ�",
}

huanghebei_citys = {
     "����ɽ","����","���ݳ�","����ɽ","��ɽ", "�ؽ�",	
	 "��ľ��", "ƽ����","������","������","��ɽ","������","�����","���ԭ",	
	 "����", "�����ɾ�", "��ɽ","��ľ��","����","����","���޺�","����","˿��֮·", "�ؽ���ԭ",
}

changjiangnan_citys = {
   	 "��ɽ��",	"���ݳ�", "ؤ��","���ݳ�",		
	 "���˳�",	 "÷ׯ","������",
	 "��������","���ݳ�","�һ���",
	 "ţ�Ҵ�",	 "����ׯ","��ɽ","����", "ؤ��ֶ�",	   
	 "����", "����","����",
	 "����",	
}


function letterLost_job()
     sLetterlost_job()
    --go(letterLostBegin,"��ɽ","��̳")
	return letterLostBegin_job()
end

function sLetterlost_job()
    DeleteTriggerGroup("lostletter_job")
	create_trigger_t('lostletter_job1',"^(> )*�����ҳ(\\N*)�鿴�����ˡ�$",'','getUrl_job')
    create_trigger_t('lostletter_job2',"^(> )*����˲�ע�⣬͵͵��ʧ����ż��ӽ���·�ߵĲݴԡ�$",'','sendOk_job')
    create_trigger_t('lostletter_job3',"^(> )*�ŷ��ϵ��ּ�ģ�����壬��֪�������䵽�˴���$",'','sendOk_job')
    create_trigger_t('lostletter_job4',"^(> )*�㽫ʧ����ż㽻��",'','sendOk_job')
    create_trigger_t('lostletter_job5',"^(> )*����������д�������˵����֡�$",'','lookXin_job')
    create_trigger_t('lostletter_job6',"^(> )*���ٿ����һ�㡣$",'','letterLostBegin_job')
    create_trigger_t('lostletter_job7',"^(> )*�ŷ���д�ţ�(\\D*)\\((\\D*)\\)",'','lostName_job')
    SetTriggerOption("lostletter_job1","group","lostletter_job")
    SetTriggerOption("lostletter_job2","group","lostletter_job")
    SetTriggerOption("lostletter_job3","group","lostletter_job")
    SetTriggerOption("lostletter_job4","group","lostletter_job")
    SetTriggerOption("lostletter_job5","group","lostletter_job")
    SetTriggerOption("lostletter_job6","group","lostletter_job")
    SetTriggerOption("lostletter_job7","group","lostletter_job")
	locate()	
	llgo_job()
    EnableTriggerGroup("lostletter_job",true)
end

function llgo_job()
print('llgo_job..........')
create_trigger_t('lostletter_job8',"^[> ]*����һ���������������ͳ������š�$",'','lostp_look_job')
SetTriggerOption("lostletter_job8","group","lostletter_job")
addali_reg('llgo_job','^llgo_job$','','lost_goto_job')
end

function lostName_job(n,l,w)
    lost_name=string.lower(w[3])
    return create_timer_s('sendTo_job',0.4,'sendTo_job')
end

function sendTo_job()
    exe('sendto '..lost_name)
    exe('sendto '..lost_name)
end

function letterLostBegin_job()
   print('letterLostBegin....................................................')
   if needvpearl==1 and (condition.vpearl==0 or not condition.vpearl)then
       return Govpearl()
   end
   return goMark_job()
end

function goMark_job()
     print('��ʼ��дʧ���ż�����ID')
	 print(ll_url)
	 local m_cmd = ll_url
     --�򿪲��
    local fni = 'plugs\\LLIN.ini'
     local fi = io.open(fni,"w")
     fi:write(m_cmd)
     fi:close()

     local fno = 'plugs\\LLOUT.ini'
     local fo = io.open(fno,"w")
     fo:write("")
     fo:close()
     --�������
     create_timer_s('llwait_job',1.0,'llwait_job')
 end
 
 function llwait_job()
    local f = io.open("plugs\\LLOUT.ini","r")
    local s = f:read()
   
    f:close() --�ر���
  
    if not isNil(s) then
     print(s)
     if s~="" then
     DeleteTimer('llwait_job')
     SetVariable("lostname",s)

     local fno = 'plugs\\LLOUT.ini'
     local fo = io.open(fno,"w")
     fo:write("")
     fo:close()
       return MarkName_job()
     end 
    end

 end  
 
 function MarkName_job()
    local lost_cmd=GetVariable("lostname")
    if lost_cmd=='discard' then
      return exe('discard letter')
    else
      return exe('mark '..lost_cmd)
    end
end

function lookXin_job()
    print('lookXin_job.........lookxin:'..lookxin)
	
	if needdolost ==1 then 
	    lookxin=1
		writeLastName()
       exe('look letter')
	end
end

function sendOk_job()
    print('sendOk_job.................???????????????')
    lookxin=0
    lostletter=0
    m_cmd=nil
    lostletter_locate=''
	  mousedown_lostletter()--����ˢ�µص�
	  condition.vpearl=0
    DeleteTimer( 'sendTo' )
    DeleteTriggerGroup("lostletter")
	SetTriggerOption("hp16","sequence",1)
	EnableTrigger("hp16",true)
    exe('follow none;cond;jobtimes')
	sendOk_fix()
    return check_food()
end

function getUrl_job(n,l,w)
   ll_url=w[2]
end



function lostp_look_job()
    print('lostp_look_job...........')
    job.name='dolost'
    DeleteTriggerGroup("lostplace_job")
    create_trigger_t('lostplace_job1',"^[> ]*��������������(\\D*)һ�����֡�$",'','lostp_get_job')
    SetTriggerOption("lostplace_job1","group","lostplace_job")
    EnableTriggerGroup("lostplace_job",true)
end


function lost_goto_job()  
   print('lost_goto_job........')
   create_timer_s('walkWait4',10.0,'sx_look')
	if ll_place == nil then 
      return Note('�յط�������ȥ��P!') 
	end
	--[[if ll_place == '���޺�����' then 
      return Execute('discard letter')
	end]]
	messageShow('ʧ����ż����񣺿�ʼǰ����'..ll_place..'��Ѱ�����'..'��'..lost_name..'��')
	if ll_place=='�������½��ɿ�' or ll_place == '���ݳǳ�������' or ll_place=='���ݳǴ�ɿ�' or ll_place=='���׽���' or ll_place=='���ݳ����Ķɿ�' or ll_place=='�ƺ������ɿ�' then 
		return gogo(ll_place)
	end	
	dest.room,dest.area=getAddr(ll_place)
	if job.area and job.area==dest.area and job.room and job.room==dest.room then
		return go(find_dolost,job.area,job.room)
    else
          job.area=dest.area
          job.room=dest.room
    end
	if dest.area == nil or not dest.room then
     	 exe('look lose letter') 
	else 
	    print('go lookXin.............')
	     return go(lookXin,dest.area,dest.room)	 	
    end
end


function is_zhongyuan(city)
     
    for k,v in pairs(zhongyuan_citys) do
	    if v == area  then
           return true	
		end 
	end
    
	return false
	
end

function is_huanghebei(city)
     
    for k,v in pairs(huanghebei_citys) do
	    if v == area  then
           return true	
		end 
	end
    
	return false
	
end

function is_changjiannan(city)
     
    for k,v in pairs(changjiangnan_citys) do
	    if v == area  then
           return true	
		end 
	end
    
	return false
	
end


function lostp_get_job(n,l,w)
    print('lostp_get_job..............')
	--exe('look lose letter')
    ll_place = w[1]
	local l_dest={}
    ll_place = Trim(ll_place)   
    l_dest.area,l_dest.room = locateroom(ll_place)   
	
	--�����ͬһ���ط���ֱ�ӿ��Թ�ȥ����
	
	if l_dest.area == locl.area then 
	     
	end 
	
	if is_zhongyuan(l_dest.area) and is_zhongyuan(l_dest.area) then
	end
	
	
	
	
	
	
	
	job.where=ll_place
	if string.find(ll_place,'����Ľ��') or string.find(ll_place,'������') or string.find(ll_place,'��٢��ɽׯ') or string.find(ll_place,'������') or string.find(ll_place,'�����') or string.find(ll_place,'����') or string.find(ll_place,'��Դ��') then	
		messageShow('ʧ����ż����񣺡�'..ll_place..'��̫Զ��������',"red")		
        EnableTimer('walkWait4',false)
	    locate_finish='check_ll'
        return locate()		
	end
	if string.find(ll_place,'�����ϰ�') or string.find(ll_place,'������') or string.find(ll_place,'ؤ��') or string.find(ll_place,'��������') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���ݳ�') or string.find(ll_place,'���˳�') or string.find(ll_place,'��ɽ��') then
       ll_place = '���ݳǳ�������'
    end
	if string.find(ll_place,'�ƺ������ɿ�') then
       ll_place = '�ƺ������ɿ�'
    end
	if string.find(ll_place,'���׽���') then 
		ll_place = '����������׽���'
	end 
	if string.find(ll_place,'���ݳǴ�ɿ�') then 
		ll_place = '���ݳǴ�ɿ�'
	end
	if string.find(ll_place,'��ɽ')  or string.find(ll_place,'��ľ��')  then 
		ll_place = '�������½��ɿ�'
	end
	if string.find(ll_place,'������') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���ԭ') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���޺�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�ؽ�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�����') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'����') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'���ݳ�') then 
		ll_place = '���ݴ�ɿ�'
	end
	if string.find(ll_place,'������') then 
		ll_place = '���ݴ�ɿ�'
	end
	if string.find(ll_place,'ƽ����') then 
		ll_place = '�������½��ɿ�'
	end
	if string.find(ll_place,'���ݳ����Ķɿ�') then 
		ll_place = '���ݳ����Ķɿ�'
	end
	if string.find(ll_place,'�������½��ɿ�') then 
		ll_place = '�������½��ɿ�'
	end	
    if score.party == '����Ľ��' then 
	    ll_place=ll_place 
	end
	--messageShow('ʧ����ż����񣺿�ʼǰ����'..ll_place..'��Ѱ����ң�')
	DoAfterSpecial(0.2,'llgo_job',10)
end


--=======================================���Դ涫��=========================================
--[[> ����಼ɮ�´Ӹ��˴���������ȡ������
> ��Ѳ��ĴӸ��˴���������ȡ������
> ��������ó�һ˫���ģ������Լ��ĸ��˴����䡣
> ��Ѳ��ĴӸ��˴���������ȡ������
> ����æ�ţ�
�㴩���ţ�
  ��ɮЬ(Seng xie)
  ������(Hu wan)
  ������(Hu yao)
  ���ƽ�(VIP Card)
  ������(Bei Nang)
  ����װ(Cloth)
��װ���ţ�
  ��������ͨ��(Shentong sword)]]
local armor_list={}
function cun_armor_list()
	 wait.make(function()
	 Execute('i;say װ��������')
	 repeat 
	 local l,w=wait.regexp('^[> ]*[��]\\S+\\((.+)\\)$|^[> ]*��˵������װ�������ϡ�$')
	 table.insert(armor_list,string.lower(Trim(w[1])))
	 until string.find(l,'װ��������')
	 tprint(armor_list)
	 end)
	 return armor_list
end
function cun_armor()
	i = cun_i
	wait.make(function()
	if i < #armor_list and armor_list[i]~= '' and #armor_list>1 and not string.find(armor_list[i],'nang') and not string.find(armor_list[i],'card') and not string.find(armor_list[i],'sword') and not string.find(armor_list[i],'axe') then 
	 Execute('cun '..armor_list[i])
	   local l,w = wait.regexp('^[> ]*��������ó�.+�������Լ��ĸ��˴����䡣$|^[> ]*����æ�ţ�$|^[> ]*������û������������$|^[> ]*.+�����Ա����档$')  
		if string.find(l,'�����Լ��ĸ��˴�����') or string.find(l,'������û����������') or string.find(l,'���Ա�����') then 
		i = i + 1 
		cun_i = i 
		return cun_armor() 
		elseif string.find(l,'����æ��') then 
		cun_i = i 
		wait.time(0.5) 
		return cun_armor()
		end
	 elseif i >= #armor_list then 
	  print('������')
	 end
	end)
end
function cun_cmd()
    armor_list={}
	cun_armor_list()
	Execute('remove all')
	cun_i = 1
	DoAfterSpecial(0.5,'cun_armor()',12)
end
function qu_cmd()
	armor_list={}
	qu_armor_list()
	cun_i = 1
	DoAfterSpecial(0.5,'qu_armor()',12)
end
function qu_armor_list()
	 wait.make(function()
	 Execute('dlist')
	 repeat 
	 --local l,w=wait.regexp('^[> ]*��\\s+(.+)\\s+\\S+\\s+\.+��\\s+��$|^[> ]*����������������������������������������������������������������$')
	 local l,w=wait.regexp('^[> ]*��\\s+(.+)\\s+\\S+\\s+\\.+��\\s+��$|^[> ]*����������������������������������������������������������������$')
	 table.insert(armor_list,string.lower(Trim(w[1])))
	 until string.find(l,'����������������������������������������������������������������')
	 tprint(armor_list)
	 end)
	 return armor_list
end
function qu_armor()
	i = cun_i
	wait.make(function()
	if i < #armor_list and armor_list[i]~= '' then 
	 Execute('qu '..armor_list[i])
	local l,w = wait.regexp('^[> ]*���.+�Ӹ��˴���������ȡ������$|^[> ]*����æ�ţ�$|^[> ]*�㲢û�б������Ʒ��$')  
		if string.find(l,'���˴���������ȡ����') or string.find(l,'�㲢û�б������Ʒ��') then 
		i = i + 1 
		cun_i = i 
		return qu_armor() 
		elseif string.find(l,'����æ��') then 
		cun_i = i 
		wait.time(0.5) 
		return qu_armor()
		end
	 elseif i >= #armor_list then 
	  print('ȡ����')
	  DoAfter(3,'wear all;dlist')
	 end
	end)
end
