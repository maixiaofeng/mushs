--[[说明:
1.在shujian.lua 的sLetterlost() “EnableTriggerGroup("lostletter",true)‘ 之前插入llgo()
2.在sendOk() 的return 之前加一句sendOk_fix()
3.在shujian.lua require 语句中加入 require "dolost"
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
create_trigger_t('lostletter8',"^[> ]*这是一封大理国镇南王府送出的书信。$",'','lostp_look')
SetTriggerOption("lostletter8","group","lostletter")
--create_alias_s('llgo','^llgo$','lost_goto')
addali_reg('llgo','^llgo$','','lost_goto')
end
function lostp_look()
    print('lostp_look...........')
    job.name='dolost'
    DeleteTriggerGroup("lostplace")
    create_trigger_t('lostplace1',"^[> ]*好象收信人曾在(\\D*)一带出现。$",'','lostp_get')
    SetTriggerOption("lostplace1","group","lostplace")
    EnableTriggerGroup("lostplace",true)
end
function lostp_get(n,l,w)
    print('lostp_get..............')
	--exe('look lose letter')
    ll_place = w[1]
	job.where=ll_place
	if string.find(ll_place,'姑苏慕容') or string.find(ll_place,'燕子坞') or string.find(ll_place,'曼佗罗山庄') or string.find(ll_place,'神龙岛') or string.find(ll_place,'绝情谷') or string.find(ll_place,'明教') or string.find(ll_place,'桃源县') or string.find(ll_place,'星宿海山洞') then	
		messageShow('失落的信笺任务：【'..ll_place..'】太远继续任务！',"red")		
        EnableTimer('walkWait4',false)
	    locate_finish='check_ll'
        return locate()		
	end
	if string.find(ll_place,'长江南岸') or string.find(ll_place,'宁波城') or string.find(ll_place,'丐帮') or string.find(ll_place,'莆田少林') or string.find(ll_place,'福州城') or string.find(ll_place,'苏州城') or string.find(ll_place,'杭州城') or string.find(ll_place,'嘉兴城') or string.find(ll_place,'佛山镇') then
       ll_place = '扬州城长江北岸'
    end
	if string.find(ll_place,'黄河流域大渡口') then
       ll_place = '黄河流域大渡口'
    end
	if string.find(ll_place,'澜沧江边') then 
		ll_place = '大理城南澜沧江边'
	end 
	if string.find(ll_place,'兰州城大渡口') then 
		ll_place = '兰州城大渡口'
	end
	if string.find(ll_place,'恒山')  or string.find(ll_place,'黑木崖')  then 
		ll_place = '长安城陕晋渡口'
	end
	if string.find(ll_place,'嘉峪关') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'大草原') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'星宿海') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'回疆') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'伊犁城') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'昆仑') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'沧州城') then 
		ll_place = '兰州大渡口'
	end
	if string.find(ll_place,'塘沽城') then 
		ll_place = '兰州大渡口'
	end
	if string.find(ll_place,'平定州') then 
		ll_place = '长安城陕晋渡口'
	end
	if string.find(ll_place,'兰州城西夏渡口') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'长安城陕晋渡口') then 
		ll_place = '长安城陕晋渡口'
	end	
    if score.party == '姑苏慕容' then 
	    ll_place=ll_place 
	end
	--messageShow('失落的信笺任务：开始前往【'..ll_place..'】寻找玩家！')
	DoAfterSpecial(0.2,'llgo',10)
end
function lost_goto()  
   print('lost_goto........')
   create_timer_s('walkWait4',10.0,'sx_look')
	if ll_place == nil then 
      return Note('空地方你让我去个P!') 
	end
	--[[if ll_place == '星宿海绝壁' then 
      return Execute('discard letter')
	end]]
	messageShow('失落的信笺任务：开始前往【'..ll_place..'】寻找玩家'..'【'..lost_name..'】')
	if ll_place=='长安城陕晋渡口' or ll_place == '扬州城长江北岸' or ll_place=='兰州城大渡口' or ll_place=='澜沧江边' or ll_place=='兰州城西夏渡口' or ll_place=='黄河流域大渡口' then 
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
    "长安城","长乐帮","成都城","扬州城","大理城","大理城西", "大理城南","大理城东",
	"无量山","大理皇宫","大理王府","终南山",
	"玉虚观", "峨嵋山",	 "桃源县","绝情谷","襄阳郊外","萧府","华山派","兰州城",
	"苗疆", "蝴蝶谷", "南阳城","少林派","嵩山派","泰山",	
	"铁掌帮", "天龙寺", "华山村", "武当派","武当后山","武馆", "襄阳城","柳宗镇",
	"大轮寺","长安","成都","扬州", "大理国","峨嵋山","古墓","黄河流域",	 "华山","兰州",		
	"嵩山少林", "嵩山",	"铁掌山","武当山", "襄阳",	 "大雪山", "镇南王府","古墓派","成都郊外", "大理城北",
}

huanghebei_citys = {
     "白驼山","京城","沧州城","昆仑山","恒山", "回疆",	
	 "黑木崖", "平定州","昆仑派","塘沽城","天山","星宿派","伊犁城","大草原",	
	 "沧州", "昆仑仙境", "恒山","黑木崖","明教","塘沽","星宿海","伊犁","丝绸之路", "回疆草原",
}

changjiangnan_citys = {
   	 "佛山镇",	"福州城", "丐帮","杭州城",		
	 "嘉兴城",	 "梅庄","宁波城",
	 "莆田少林","苏州城","桃花岛",
	 "牛家村",	 "归云庄","佛山","福州", "丐帮分舵",	   
	 "杭州", "嘉兴","宁波",
	 "苏州",	
}


function letterLost_job()
     sLetterlost_job()
    --go(letterLostBegin,"华山","祭坛")
	return letterLostBegin_job()
end

function sLetterlost_job()
    DeleteTriggerGroup("lostletter_job")
	create_trigger_t('lostletter_job1',"^(> )*请打开网页(\\N*)查看收信人。$",'','getUrl_job')
    create_trigger_t('lostletter_job2',"^(> )*你乘人不注意，偷偷把失落的信笺扔进了路边的草丛。$",'','sendOk_job')
    create_trigger_t('lostletter_job3',"^(> )*信封上的字迹模糊不清，不知何人遗落到此处。$",'','sendOk_job')
    create_trigger_t('lostletter_job4',"^(> )*你将失落的信笺交给",'','sendOk_job')
    create_trigger_t('lostletter_job5',"^(> )*你在信卦上写上收信人的名字。$",'','lookXin_job')
    create_trigger_t('lostletter_job6',"^(> )*你再看清楚一点。$",'','letterLostBegin_job')
    create_trigger_t('lostletter_job7',"^(> )*信封上写着：(\\D*)\\((\\D*)\\)",'','lostName_job')
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
create_trigger_t('lostletter_job8',"^[> ]*这是一封大理国镇南王府送出的书信。$",'','lostp_look_job')
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
     print('开始填写失落信件人物ID')
	 print(ll_url)
	 local m_cmd = ll_url
     --打开插件
    local fni = 'plugs\\LLIN.ini'
     local fi = io.open(fni,"w")
     fi:write(m_cmd)
     fi:close()

     local fno = 'plugs\\LLOUT.ini'
     local fo = io.open(fno,"w")
     fo:write("")
     fo:close()
     --插件结束
     create_timer_s('llwait_job',1.0,'llwait_job')
 end
 
 function llwait_job()
    local f = io.open("plugs\\LLOUT.ini","r")
    local s = f:read()
   
    f:close() --关闭流
  
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
	  mousedown_lostletter()--马上刷新地点
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
    create_trigger_t('lostplace_job1',"^[> ]*好象收信人曾在(\\D*)一带出现。$",'','lostp_get_job')
    SetTriggerOption("lostplace_job1","group","lostplace_job")
    EnableTriggerGroup("lostplace_job",true)
end


function lost_goto_job()  
   print('lost_goto_job........')
   create_timer_s('walkWait4',10.0,'sx_look')
	if ll_place == nil then 
      return Note('空地方你让我去个P!') 
	end
	--[[if ll_place == '星宿海绝壁' then 
      return Execute('discard letter')
	end]]
	messageShow('失落的信笺任务：开始前往【'..ll_place..'】寻找玩家'..'【'..lost_name..'】')
	if ll_place=='长安城陕晋渡口' or ll_place == '扬州城长江北岸' or ll_place=='兰州城大渡口' or ll_place=='澜沧江边' or ll_place=='兰州城西夏渡口' or ll_place=='黄河流域大渡口' then 
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
	
	--如果是同一个地方，直接可以过去送信
	
	if l_dest.area == locl.area then 
	     
	end 
	
	if is_zhongyuan(l_dest.area) and is_zhongyuan(l_dest.area) then
	end
	
	
	
	
	
	
	
	job.where=ll_place
	if string.find(ll_place,'姑苏慕容') or string.find(ll_place,'燕子坞') or string.find(ll_place,'曼佗罗山庄') or string.find(ll_place,'神龙岛') or string.find(ll_place,'绝情谷') or string.find(ll_place,'明教') or string.find(ll_place,'桃源县') then	
		messageShow('失落的信笺任务：【'..ll_place..'】太远继续任务！',"red")		
        EnableTimer('walkWait4',false)
	    locate_finish='check_ll'
        return locate()		
	end
	if string.find(ll_place,'长江南岸') or string.find(ll_place,'宁波城') or string.find(ll_place,'丐帮') or string.find(ll_place,'莆田少林') or string.find(ll_place,'福州城') or string.find(ll_place,'苏州城') or string.find(ll_place,'杭州城') or string.find(ll_place,'嘉兴城') or string.find(ll_place,'佛山镇') then
       ll_place = '扬州城长江北岸'
    end
	if string.find(ll_place,'黄河流域大渡口') then
       ll_place = '黄河流域大渡口'
    end
	if string.find(ll_place,'澜沧江边') then 
		ll_place = '大理城南澜沧江边'
	end 
	if string.find(ll_place,'兰州城大渡口') then 
		ll_place = '兰州城大渡口'
	end
	if string.find(ll_place,'恒山')  or string.find(ll_place,'黑木崖')  then 
		ll_place = '长安城陕晋渡口'
	end
	if string.find(ll_place,'嘉峪关') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'大草原') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'星宿海') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'回疆') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'伊犁城') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'昆仑') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'沧州城') then 
		ll_place = '兰州大渡口'
	end
	if string.find(ll_place,'塘沽城') then 
		ll_place = '兰州大渡口'
	end
	if string.find(ll_place,'平定州') then 
		ll_place = '长安城陕晋渡口'
	end
	if string.find(ll_place,'兰州城西夏渡口') then 
		ll_place = '兰州城西夏渡口'
	end
	if string.find(ll_place,'长安城陕晋渡口') then 
		ll_place = '长安城陕晋渡口'
	end	
    if score.party == '姑苏慕容' then 
	    ll_place=ll_place 
	end
	--messageShow('失落的信笺任务：开始前往【'..ll_place..'】寻找玩家！')
	DoAfterSpecial(0.2,'llgo_job',10)
end


--=======================================测试存东西=========================================
--[[> 你把青布僧衣从个人储物箱中提取出来。
> 你把布履从个人储物箱中提取出来。
> 你从身上拿出一双布履，放入自己的个人储物箱。
> 你把布履从个人储物箱中提取出来。
> 你正忙着！
你穿戴着：
  □僧鞋(Seng xie)
  □护腕(Hu wan)
  □护腰(Hu yao)
  □黄金卡(VIP Card)
  □背囊(Bei Nang)
  □劲装(Cloth)
你装备着：
  □飞絮神通剑(Shentong sword)]]
local armor_list={}
function cun_armor_list()
	 wait.make(function()
	 Execute('i;say 装备检查完毕')
	 repeat 
	 local l,w=wait.regexp('^[> ]*[□]\\S+\\((.+)\\)$|^[> ]*你说道：「装备检查完毕」$')
	 table.insert(armor_list,string.lower(Trim(w[1])))
	 until string.find(l,'装备检查完毕')
	 tprint(armor_list)
	 end)
	 return armor_list
end
function cun_armor()
	i = cun_i
	wait.make(function()
	if i < #armor_list and armor_list[i]~= '' and #armor_list>1 and not string.find(armor_list[i],'nang') and not string.find(armor_list[i],'card') and not string.find(armor_list[i],'sword') and not string.find(armor_list[i],'axe') then 
	 Execute('cun '..armor_list[i])
	   local l,w = wait.regexp('^[> ]*你从身上拿出.+，放入自己的个人储物箱。$|^[> ]*你正忙着！$|^[> ]*你身上没有这样东西。$|^[> ]*.+不可以被保存。$')  
		if string.find(l,'放入自己的个人储物箱') or string.find(l,'你身上没有这样东西') or string.find(l,'可以被保存') then 
		i = i + 1 
		cun_i = i 
		return cun_armor() 
		elseif string.find(l,'你正忙着') then 
		cun_i = i 
		wait.time(0.5) 
		return cun_armor()
		end
	 elseif i >= #armor_list then 
	  print('存完了')
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
	 --local l,w=wait.regexp('^[> ]*┃\\s+(.+)\\s+\\S+\\s+\.+天\\s+┃$|^[> ]*┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$')
	 local l,w=wait.regexp('^[> ]*┃\\s+(.+)\\s+\\S+\\s+\\.+天\\s+┃$|^[> ]*┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$')
	 table.insert(armor_list,string.lower(Trim(w[1])))
	 until string.find(l,'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛')
	 tprint(armor_list)
	 end)
	 return armor_list
end
function qu_armor()
	i = cun_i
	wait.make(function()
	if i < #armor_list and armor_list[i]~= '' then 
	 Execute('qu '..armor_list[i])
	local l,w = wait.regexp('^[> ]*你把.+从个人储物箱中提取出来。$|^[> ]*你正忙着！$|^[> ]*你并没有保存该物品。$')  
		if string.find(l,'个人储物箱中提取出来') or string.find(l,'你并没有保存该物品。') then 
		i = i + 1 
		cun_i = i 
		return qu_armor() 
		elseif string.find(l,'你正忙着') then 
		cun_i = i 
		wait.time(0.5) 
		return qu_armor()
		end
	 elseif i >= #armor_list then 
	  print('取完了')
	  DoAfter(3,'wear all;dlist')
	 end
	end)
end
