sour={area='������',room='����'}
dest={area='������',room='����'}
locl={}
locl.area='������'
locl.room='����'
locl.where='�����ǵ���'
locl.time='��'
locl.id={}
locl.exit={}
road={}
road.sour='����_������'
road.city='������_������'
road.dest='������_����'
road.where='�����ǵ���'
road.test={}
road.detail={}
road.act=nil
road.i=0
road.temp=0
road.find=0
road.wipe_id=nil
road.wipe_who=nil
road.wipe_con=nil
road.resume=nil
road.wait=0.12
road.steps=100
road_steps_huashan=100
locate_finish=0
road.cmd=nil
road.cmd_save=nil
road.maze=nil
wait_cd=nil
road.hscaidi=nil
cmd_limit=160
speed_walk_delay=0
walkecho=true
exit={}
exit.locl={}
exit.reverse={}
AddrIgnores = {}
WhereIgnores = {}
caidiout=0
caidiout_error=0
local WipeNoPerform = {
     ["guan bing"] = true,
	 ["zhiqin bing"] = true,
	 ["wu jiang"] = true,
	 ["guan jia"] = true,
	 ["ya yi"] = true,
	 ["da yayi"] = true,
	 ["huanggong shiwei"] = true,
	 ["dali guanbing"] = true,
	 ["dali wujiang"] = true,
	 ["yu guangbiao"] = true,
	 ["wu guangsheng"] = true,
	 ["ju mang"] = true,
	 ["jia ding"] = true,
	 ["ya huan"] = true,
	 ["wu seng"] = true,
	 ["daoyi chanshi"] = true,
	 ["zhuang ding"] = true,
	 ["heiyi bangzhong"] = true,
	 ["xingxiu dizi"] = true,
	 ["hufa lama"] = true,
	 ["zayi lama"] = true,
	 ["caihua zi"] = true,
	 ["wudujiao dizi"] = true,
	
	 ["wei shi"] = true,
	 
	 
	 --["jiao zhong"] = true,
}
mjMenid = {
    ["������"] = "mingjiao/didao/men-feng",
	["������"] = "mingjiao/didao/men-lei",
	["������"] = "mingjiao/didao/men-tian",
	["������"] = "mingjiao/didao/men-di",
	}
local ItemGet = {
    ["�ƽ�"] = true,
--  ["����"] = true,
    ["ҼǪ����Ʊ"] = true,
    ["ҼǪ����Ʊ"] = true,
    ["��Ӣ֮��"] = true,
    ["����������ƪ"] = true,
    ["���콳����ƪ"] = true,
}
road.huanghe1=true
road.huanghe2=true
duhe_change=function()
        road.huanghe1=not road.huanghe1
        road.huanghe2=not road.huanghe2
        EnableTriggerGroup("duhe",false)----------2018-08-30����
end

--[[

function exe(cmd)
    if GetConnectDuration() == 0 then
       return Connect()
    end
    if cmd==nil then cmd='look' end
    Execute(cmd)
end
--]] --

function exe_road(cmd)
    if GetConnectDuration() == 0 then
       return Connect()
    end
    if cmd==nil then cmd='look' end
    road.cmd=cmd
    if locl.area and locl.area~="����ɽ" then
       Execute('halt')
    end
    Execute(cmd)
end

---20200212 add 

function exe(cmd)
	-- cmdck=0
	-- cmd_check()
    if GetConnectDuration() == 0 then
       return Connect()
    end
    if cmd==nil then
        if locl.room=='��ϼ��' or locl.room=='�ͻ�Ӫ' or locl.room=='������' or locl.room_relation=='�ֵ����ͻ�Ӫ-----�ֵ�-----�вƴ󳵵����ϼ�Žֵ�' then
			return walk_wait()
        end 
        cmd='look' 
    end
--	   if locl.area and locl.area~="����ɽ" then
--       Execute('halt')
--   end
    run(cmd)		
end



function run(str)
	if ((str=="")or(str==nil)) then return end
	--SetSpeedWalkDelay(math.floor(1000/cmd_limit))
	--SetSpeedWalkDelay(speed_walk_delay)
	_cmds={}
    if string.find(str,';') then
        _cmds=utils.split(str,';')
        for i, cmd in pairs(_cmds) do
            add_cmd_to_queue(cmd)
            if walkecho==true then Note(cmd) end
        end
    else
        add_cmd_to_queue(str)
        if walkecho==true then Note(str) end
    end
end

function add_cmd_to_queue(cmd) 
	
    if cmd ~=nil and cmd:sub(1, 1)=='#' then
        cmd = cmd:sub(2)
        Queue(EvaluateSpeedwalk(cmd),false)
    else
        Queue(cmd,false)
    end
	
end


------ add end  ---------





function lujing_trigger()
    walk_trigger()
end
function locate_trigger()
    DeleteTriggerGroup("locate")
    DeleteTriggerGroup("locate_unknown")
    create_trigger_t('locate_unknown1','^(> )*�趨����������look\\s*\\=\\s*\\"YES\\"\\n>\\s*(\\D*)\\s*\\ -\\s*','','local_unknown_room')
    create_trigger_t('locate2','^(> )*��������������(\\D*)��\\n(\\D*)\\s*\\-\\s*','','local_area')
    --create_trigger_t('locate3',"^( )*����(�������|���Ե�|Ψһ��|���ü���Ψһ)������(\\D*)��$",'','local_exit')
    create_trigger_t('locate4',"^(\\D*) = (\\D*)$",'','local_id')
    --create_trigger_t('locate5','^(> )*��� "action" �趨Ϊ "���ڶ�λ" �ɹ���ɡ�$','','local_start')
    create_trigger_t('locate6',"^(> )*������\\D*��\\D*��\\D*��(\\D*)ʱ(\\D*)��$",'','local_time')
    create_trigger_t('server_time','^��������Ϸ����������ʱ����\\s*����(\\D*)\\s*\\d*-\\D*-\\s*\\d*\\s*(\\d*):(\\d*):','','local_time_cal')
	create_trigger_t('locate7',"^( )*����û���κ����Եĳ�·��$",'','local_exitt')
    SetTriggerOption("locate_unknown1","multi_line","y")
    SetTriggerOption("locate_unknown1","lines_to_match","7")
    EnableTrigger("locate_unknown1",true)
    SetTriggerOption("locate2","multi_line","y")
    SetTriggerOption("locate2","lines_to_match","7")
    EnableTrigger("locate2",true)
    SetTriggerOption("locate_unknown1","group","locate_unknown")
    SetTriggerOption("locate2","group","locate")
    --SetTriggerOption("locate3","group","locate")
    SetTriggerOption("locate4","group","locate")
    --SetTriggerOption("locate5","group","locate")
    SetTriggerOption("locate6","group","locate")
	SetTriggerOption("locate7","group","locate")
    EnableTriggerGroup("locate",false)    
    EnableTriggerGroup("locate_unknown",false)  
end
local_start=function()
    EnableTriggerGroup("locate",true)
    EnableTriggerGroup("locate_unknown",true)
    locl.area='��֪������'
    exit.locl={}
    locl.id={}
	  locl.item = {}
    locl.exit={}
    locl.dir="east"
end
local_unknown_room=function(n,l,w)
    locate_exit=1
    print('local_unknown_room.....')
    local s=w[2]
    unknown_room_relation=(string.gsub(s,' ',''))
    r_r=string.reverse(unknown_room_relation)
    _, i = string.find(r_r,'[\n]')
    locl.room = (string.sub(unknown_room_relation, 1-i))
    exe('unset look')
	locl.where=locl.area..locl.room
    print('locl.where='..locl.where)
    locl.room_relation = (string.gsub(unknown_room_relation,'[\n]',''))
end
local_room=function(n,l,w)
    --print('local_room......')
    EnableTrigger("locate1",false)    
    locl.room=Trim(w[2])
    exe('unset look')
    locl.where=locl.area..locl.room
	print(locl.where,locl.area,locl.room)
end
local_area=function(n,l,w)
    locl.area=w[2]
    local s=w[3]
    room_relation=(string.gsub(s,' ',''))
    r_r=string.reverse(room_relation)
    _, i = string.find(r_r,'[\n]')
    locl.room = (string.sub(room_relation, 1-i))
    exe('unset look')
    locl.where=locl.area..locl.room
    locl.room_relation = (string.gsub(room_relation,'[\n]',''))
	print('local_area..'..locl.room_relation)
    if string.find(locl.room_relation,"�ƺӶɴ�") and string.find(locl.room_relation,"��") then
	    locl.room_relation = string.gsub(locl.room_relation,"�ƺӶɴ�","")
		locl.room_relation = string.gsub(locl.room_relation,"��","")
	end
	if string.find(locl.room_relation,"�����ɴ�") and string.find(locl.room_relation,"��") then
	    locl.room_relation = string.gsub(locl.room_relation,"�����ɴ�","")
		locl.room_relation = string.gsub(locl.room_relation,"��","")
	end
	if string.find(locl.room_relation,"�ɴ�") and string.find(locl.room_relation,"��")then
	    locl.room_relation = string.gsub(locl.room_relation,"�ɴ�","")
		locl.room_relation = string.gsub(locl.room_relation,"��","")
	end
	if string.find(locl.room_relation,"��¨") and string.find(locl.room_relation,"��")then
	    locl.room_relation = string.gsub(locl.room_relation,"��¨","")
		locl.room_relation = string.gsub(locl.room_relation,"��","")
	end
end
function room_relative(n,l,w)
    local s=w[3]
    room_relation=(string.gsub(s,' ',''))
    r_r=string.reverse(room_relation)
    _, i = string.find(r_r,'[\n]')
    print (string.sub(room_relation, 1-i))
    print ((string.gsub(room_relation,'[\n]','')))
    local filename = GetInfo (67) .. "logs\\" .. score.id ..'�����ϵͼ'.. ".log"
    local file = io.open(filename,"a+")
    local s = '�������򣺡�'..w[2] ..'�� ����������'..'�� �����ϵ����'..room_relation..'��\n'
	--print(s)
    file:write(s)
    file:close()
end
local_exit=function(n,l,w)
    locate_exit=1
	EnableTimer('loclWait',false)
        print('����')
    local cnt
        localget=1
    exit.locl=exit_set(w[3])
    local l_set=exit.locl
    if roomNodir[locl.where] then
	   --print('roomNodir...'..locl.where)
       l_set=del_element(l_set,roomNodir[locl.where])
    end
    cnt=table.getn(l_set)
    if cnt==0 or cnt==nil then
       cnt=1
   
	end
	
	if string.find(locl.room, "����") or string.find(locl.room, "�ɿ�") or string.find(locl.room, "����") then
        local l_c = 0
        for i = 1, table.getn(l_set) do
            if l_set[i] == "enter" then
                l_c = i
                break
            end
        end
        table.remove(l_set, l_c)
    end
	
    cnt=math.random(1,cnt)
    locl.dir=l_set[cnt]
    if locl.dir==nil then
       locl.dir='east'
    end
    for _,p in pairs(exit.locl) do
       locl.exit[p]=true
    end
        if locate_finish~=0 then
            return _G[locate_finish]()
        end
end
local_exitt=function()
    locate_exit=1
    EnableTimer('loclWait',false)
	localget=1
    if locate_finish~=0 then
	        return _G[locate_finish]()
	end
end
local_time=function(n,l,w)
    EnableTriggerGroup("locate",false)
    DeleteTriggerGroup("locate")
    locl.time=w[2]
	locl.time_sk=w[3]
end
local_time_cal=function(n,l,w)
	locl.weekday=Trim(tostring(w[1]))
	locl.hour=tonumber(w[2])
	locl.min=tonumber(w[3])
	if locl.weekday == '��' and (locl.hour==6 or locl.hour ==7 ) and locl.min<=45 and go_on_smy==1 then --20161117���ӱ���go_on_smy���ؿ��� ��ֹϵͳ�������Զ�����Ħ��
		Note('�������������ˣ�')
		if job.zuhe["songmoya"]~=nil then
			job.zuhe["songmoya"]=nil
			Note('��Ħ�������ѹرգ�')
		end
	end
	if locl.weekday=='��' and locl.hour==8 and locl.min>=15 and go_on_smy==1 then
		if job.zuhe["songmoya"]==nil and tonumber(smydie)<2 then
			job.zuhe["songmoya"]=true --����֮�����������Ħ��
		end
	end	
end
local_id=function(n,l,w)
    local l_name=w[1]
    local l_id=w[2]
    local l_set={}
    if string.find(l_id,",") then
       l_set=utils.split(l_id,',')
       l_id=l_set[1]
    else
       if not string.find(l_id," ") and not string.find(l_id,'beauty') and string.len(l_name)<9 then
          MudUser[l_name]=l_id
       end
    end
    locl.id[l_name]=Trim(l_id)
    if ItemGet[l_name] then
       exe('get '.. l_id)
    end
    if weaponPrepare[l_name] and (not weaponStore[l_name] or not Bag[l_name])then
       exe('get '.. l_id)
    end
	
	l_set=utils.split(w[2],',')
	locl.item[l_name] = {}
	for p,q in pairs(l_set) do
	    locl.item[l_name][Trim(q)] = true  
	end
end
exit_set=function(exit)
    local l_set={}
    local l_exit=Trim(exit)
	--print('exit_set...'..l_exit)
    for w in string.gmatch(l_exit, "(%a+)") do
        --print(w)
		table.insert(l_set, w)
    end
	
    return l_set    
end

--- 20200212 ���� ---------
--[[
locatee=function()
    --print('locatee......')
    locate_trigger()
    EnableTrigger("locate5",true)
    --exe('alias action ���ڶ�λ')
	local_start()
    exe('id here')
    exe('set look;l;time')
	
end
locate=function()
    
	locatee()
	create_timer_s('loclWait',1,'locatecheck')
end
locatecheck=function()
    
    locatee()
end
function fastLocatee()
	locate_trigger()
    EnableTrigger("locate5",true)
    --exe('alias action ���ڶ�λ')
	local_start()
    exe('set look;l')
end
fastLocate=function()
	fastLocatee()
	create_timer_s('loclWait',0.4,'fastlocatecheck')
end
fastlocatecheck=function()
    fastLocatee()
end
--]]--


--20200212 add 
locate_flag=0
locate_times=0
locate_exit=0
locate=function(thread)
    locate_flag=0
    locate_times=0
	locate_exit=0
    wait.make(function()
		local ll,ww = nil 
        while locate_exit ~= 1 do
		    locate_trigger()
			localget=0
            exe('alias action ���ڶ�λ;id here;set look;l;time')
            local l, w = wait.regexp('^(> )*��� "action" �趨Ϊ "���ڶ�λ" �ɹ���ɡ�$',1)
            if l ~= nil then 
				local_start()
				local la, wa = wait.regexp('^( )*����(�������|���Ե�|Ψһ��|���ü���Ψһ)������(\\D*)��$',1)
				if la ~= nil then
                    ll,ww = la,wa				
                    break					
				end
		    end	
            --print('locate_times...'..locate_times)			
			locate_times = locate_times + 1
			if locate_exit==1 or locate_flag==1 or locate_times > 300 then 
                break		
			end 
			wait.time(0.2)
        end
		if ll ~= nil then 
     		local_exit(nil,ll,ww)
        end
        if thread then coroutine.resume(thread) end		
    end)
end


fastLocate=function(thread)
    locate_flag=0
    locate_times=0
	locate_exit=0
    wait.make(function()
		local ll,ww = nil 
        while locate_exit ~= 1 do
		    locate_trigger()
			localget=0
            exe('alias action ���ڶ�λ;set look;l')
            --exe('set look;l')
            local l, w = wait.regexp('^(> )*��� "action" �趨Ϊ "���ڶ�λ" �ɹ���ɡ�$',1)
            if l ~= nil then 
			    --print('locate start...')
				local_start()
				local la, wa = wait.regexp('^( )*����(�������|���Ե�|Ψһ��|���ü���Ψһ)������(\\D*)��$',1)
				if la ~= nil then
				    --print('locate break ....')
                    ll,ww = la,wa
                    break					
				end
		    end
			   		
			--print('locate_times...'..locate_times)
			locate_times = locate_times + 1
			if locate_exit==1 or locate_flag==1 or locate_times > 300 then 
                break		
			end 
			wait.time(0.2)
        end
        if ll ~= nil then 
     		local_exit(nil,ll,ww)
        end	
		if thread then coroutine.resume(thread) end	
    end)
end



--[[
fastLocate=function()
    locate_flag=0
    locate_times=0
    wait.make(function()
        locate_trigger()
        --EnableTrigger("locate5",true)
        while true do
            exe('alias action ���ڶ�λ')
            exe('set look;l')
            local l, w = wait.regexp('^(> )*��� "action" �趨Ϊ "���ڶ�λ" �ɹ���ɡ�$',1)
            if l ~= nil or locate_flag==1 or locate_times > 300 then 
			    break 
		    end
			locate_times = locate_times + 1
        end
        local_start()
    end)
end
]]--
---------- end 



function walk_trigger()
    DeleteTriggerGroup("walk")
    create_trigger_t('walk1','^(> )*��� "action" �趨Ϊ "���ڸ�·��" �ɹ���ɡ�$','','walk_goon')
    SetTriggerOption("walk1","group","walk")
    EnableTriggerGroup("walk",false)
end

function walk_long_wait()
      flag.walkwait=true
      EnableTriggerGroup("walk",true)
	  EnableTrigger("hp12",true)
      locate_finish=0 
      check_busy(walkTimer)
	 
end

function walk_wait()
       flag.walkwait=true
       EnableTriggerGroup("walk",true)
	   EnableTrigger("hp12",true)
           locate_finish=0 
	   --print('walk_wait...tmp.find='..tmp.find)
	   if tmp.find then
	         create_timer_s('walkWait',0.4,'walkTimer')
		  if cntr1() > 0 then
		           --print('walk_wait...')
                     exe('alias action ���ڸ�·��')
		  else
		     cntr1 = countR(15)
		  end
	   else
       --exe('alias action ���ڸ�·��') 
             create_timer_s('walkWait',0.1,'walk_goon')
	   end
end
function walkTimer()
    if flag.walkwait then
       exe('alias action ���ڸ�·��')
    end 
    --EnableTriggerGroup("walk",true)
	---print('walkTimer....')
    --exe('alias action ���ڸ�·��')
end
function walk_goon()
    flag.walkwait=false
    EnableTriggerGroup("walk",false)
    EnableTimer('walkwait',false)
	EnableTrigger("hp12",false)
	if tmp.find then
       return searchFunc()
	end
	EnableTrigger("hp12",true)
    --create_timer_s('roadWait',road.wait,'path_start')
	return path_start()
end
function goto(where)
   dis_all()
   local l_dest={}
   sour.id = nil
   dest.id = nil
   tmp.goto = true
   where = Trim(where)
   
   l_dest.area,l_dest.room = locateroom(where)
   
   if l_dest.area then
      return go(test,l_dest.area,l_dest.room)
   else
      return ColourNote ("red","blue","�Ҳ������޷������(�ص�|����)��"..where)
   end

end

function await_go(area, room, sId)
    local self = coroutine.running()
    local async_continue = function(...)
        -- print("async resume")
        coroutine.resume(self, ...)
    end
    go(async_continue, area, room, sId)
    -- print("async yield")
    return coroutine.yield()
end


function go(job,area,room,sId)
    print('go...........')
	--map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8"
    tmp.goto = nil
    sour.id=sId
    dest.id = nil
    if area~=nil then
       dest.area=area
    end
    if room~=nil then
       dest.room=room
    end
    if string.find(dest.area,"/") then
	   print('dest.area....//.....'..dest.area)
       dest.id = dest.area
       --Note(dest.id)
       dest.room = map.rooms[dest.id].name
       --Note(dest.room)
    end
    if job==nil then
       job=test
    end 
	
    flag.find=0
    flag.wait=0
    road.act=job
    road.i=0
    flag.dw=1
    tmp.find = nil
    --if sour.id ~= nil then
    --   return check_busy(path_consider)
    --else
       -- ain
       return check_halt(go_locate)
    --end
end
go_locate=function()
    print('go_locate.........')
    --[[locate()
	check_cjn()
    checkWait(path_consider,1)
    ]]--
	
	EnableTrigger("hp12", true)
    wait.make(function()
        if Chuanfu.enable then
            Chuanfu:check_cjn()
            Chuanfu:check_hh()
        end
        locate(coroutine.running())
		--fastLocate(coroutine.running())
        coroutine.yield()
        path_consider()
    end)
	
end
function locateIdDone()
    EnableTriggerGroup("locateId",false)
	EnableTimer("locateId",false)
	DeleteTriggerGroup("locateId")
	DeleteTimer("locateId")
	return tmp.locateIdOK()
end
function goContinue()
    return go(road.act)
end
function path_consider()
    --print('path_consider.....')
    local l_sour,l_dest,l_path,l_way
    local l_where=locl.area .. locl.room
    sour.rooms={}
    dest.rooms={}
	if sour.id and map.rooms[sour.id].name ~= locl.room then
	   sour.id = nil
	end

    if not sour.id and road.id and map.rooms[road.id] and map.rooms[road.id].name == locl.room then
	   print('path_consider....sour.id=road.id')
       sour.id = road.id
    end
    if sour.id == nil then
	   --print('sour.id is null...')
       sour.room=locl.room
       sour.area=locl.area
       if sour.area == '��֪������' and locl.room_relation ~= nil then 
	      print('test!!!!!!!!!!!!!')
	       sour.rooms=getRooms(sour.room,sour.area,'all',locl.room_relation)
	   else  
           sour.rooms=getRooms(sour.room,sour.area)
       end
	   print(table.getn(sour.rooms))
    end
    if dest.id == nil then
       dest.rooms=getRooms(dest.room,dest.area)
	   --print('dest.rooms==.............'..dest.rooms)
    end
    if sour.id ~= nil then
       chats_locate('��λϵͳ���ӡ�'.. sour.id ..'������!')
    else
       chats_locate('��λϵͳ���ӡ�'.. sour.area .. sour.room ..'������!')
       if sour.room=="����̨" then
        exe('jump down')
       end
	    if locl.room_relation=='���϶����϶�' or locl.room_relation=="��֪��������϶� ��֪������ ���϶�" or (string.find(locl.room_relation,'���϶����϶�') and locl.area=='��֪������') then
		    print('���϶� test ..........')
             exe('drop fire;leave;leave;leave;leave;leave;leave;out;ne;ed;ne;ed')        
             return checkWait(goContinue,0.3)
        end
		
		if locl.room_relation=='ɽ��ɽ��' and locl.area=='���޺�' and locl.room=='ɽ��' then 
		    return xingxiuzuanenter()
		end
	   
       if table.getn(sour.rooms)==0 then
	        print('��λϵͳ�޷��ҵ���ǰλ��........................')
            if locl.room=='Сľ��' then
                return toSldHua()
            elseif locl.room=='Ȫˮ��' then
                exe('tiao out;tiao out')
                    --quick_locate=0
                return checkWait(goContinue,0.3)
            elseif locl.room=='ˮ̶' then
                exe('pa up')
                    --quick_locate=0
                return checkWait(goContinue,0.3)
            else
		  --[[print('���϶����ԣ���������.....')
		  print('locl.room_relation='..locl.room_relation)
		   if locl.room_relation=='���϶����϶�' or locl.room_relation=="��֪��������϶� ��֪������ ���϶�" then
                 exe('drop fire;leave;leave;leave;leave;leave;leave;out;ne;ed;ne;ed')        
                        --quick_locate=0
                 return checkWait(goContinue,0.3)
           end
		   ]]--
               if locl.room_relation=='�����ߨL���׵�������ݺ������' then
	               exe('sw')	
	               quick_locate=0
                   return checkWait(goContinue,0.3)
	           end
               if locl.room=='÷��' then
                      --quick_locate=0
                   exe('n')
                   return mlOutt()
               end--��������������ˣ�
               if locl.room=='�洬' then        
                   exe('out;w;s;out;w;s;out;w;s')        
                           --quick_locate=0
                   return checkWait(goContinue,0.3)
               end
		       if locl.area=='�����' and locl.room=='ʯ��' then
	               exe('pa down;pa up')	
		           quick_locate=0
                   return checkWait(goContinue,0.2)
	           end
	
	
	
	          if locl.room_relation=='�Ͻ�ɳĮ�¹Ȼ��ٹ���Ͻ�ɳĮ�I���J�Ͻ�ɳĮ---�Ͻ�ɳĮ---�Ͻ�ɳĮ�L���K�Ͻ�ɳĮ�Ͻ�ɳĮ�Ͻ�ɳĮ�Ͻ�ɳĮ' then  
           
	                exe('look;hp;#3 drink jiudai;#8 n')   
             				
                    return njsmcheck()
              end
              if locl.room_relation=='��ˮ��Ȫ' then        
                    exe('look;hp;drink jiudai;ne')        
                    return walk_wait()
              end
              if locl.room_relation~='' then
                  chats_locate('��λϵͳ��û�й����صķ��������room_relative�������Գ��Զ�λû�й����صķ��䡿','LimeGreen')
              --������Գ��Զ�λû�й����صķ���
              end
              chats_locate('��λϵͳ����ͼϵͳ�޴˵ص㡾'..locl.area .. locl.room ..'�����ϣ�����ƶ�Ѱ��ȷ�ж�λ�㣡','red')
              exe('stand;leave')
              exe(locl.dir)
              return checkWait(goContinue,0.2)
           end
       end        
	   if table.getn(sour.rooms)>1 then
            chats_locate('��λϵͳ�������һ��ͬ�������жϡ�'..sour.room..'����!','LimeGreen')
            if locl.room_relation~='' then
              chats_locate('��λϵͳ�������ϵΪ��'..locl.room_relation..'��','LimeGreen')
            end
			local filter_sour_rooms={}
            for i=1,table.getn(sour.rooms) do
			    --print('locl.room_relation:'..locl.room_relation)
				--print('map.rooms[sour.rooms[i]].room_relative:'..map.rooms[sour.rooms[i]].room_relative)
			        if map.rooms[sour.rooms[i]].room_relative == nil then 
					    chats_locate('��λϵͳ���������䵫��û��room_relative ��'.. sour.rooms[i] ..'�����ϣ���Ҫ��ע��','red')
						--table.insert(filter_sour_rooms,sour.rooms[i])
					elseif ( locl.room_relation~='' and (map.rooms[sour.rooms[i]].room_relative == locl.room_relation or map.rooms[sour.rooms[i]].room_relative2 == locl.room_relation) )  then				   
                        table.insert(filter_sour_rooms,sour.rooms[i])
                    end
            end 
            print('�ظ�rooms ���˺�ĳ���:'..table.getn(filter_sour_rooms))			
			if table.getn(filter_sour_rooms)>0 then
			  if table.getn(filter_sour_rooms) == 1 then 
               sour.id=filter_sour_rooms[1]
			   chats_locate('��λϵͳ�����Ծ�ȷ��λ���²�Ŀǰλ��Ϊ' ..sour.id, 'LimeGreen')
               return check_halt(path_consider)        
              else
			   for i=1,table.getn(filter_sour_rooms) do
			       local roomInfo = map.rooms[filter_sour_rooms[i]]
				   local match_room = true
                   for k, v in ipairs(exit.locl) do
                       if not roomInfo.ways[v] then
                           match_room = false
                       end
                   end
			       if match_room == true then
                       sour.id = filter_sour_rooms[i]
                       chats_locate('��λϵͳ�����Ծ�ȷ��λ���²�Ŀǰλ��Ϊ' ..sour.id, 'LimeGreen')
					   return check_halt(path_consider) 
                   end 
			   end
             end	
           end 	
          print('û�к��ʵ�room....?')		   
	      for p in pairs(locl.id) do
		     print('locl.id loop.........')
	          local l_cnt = 0
	          local l_id
	          for k,v in pairs(sour.rooms) do
			      local l_corpse
			      if string.find(p,"��ʬ��") then
	   	             l_corpse = del_string(p,"��ʬ��")
				  else
				     l_corpse = p
				  end
	   	          if map.rooms[v] and map.rooms[v].objs and (map.rooms[v].objs[p] or map.rooms[v].objs[l_corpse]) then
	   		         l_cnt = l_cnt + 1
	   	             l_id = v
	   		      end
	   	      end  
	   	      if l_cnt == 1 then
	             return go(road.act,dest.area,dest.room,l_id)
	          end
	      end
		  print('ƥ�� ���� locl.id ʧ�� ��')	
		  if not roomMaze[l_where] then
             for p in pairs(locl.exit) do
                local l_cnt = 0
	            local l_id
                for i=1,table.getn(sour.rooms) do
                    if map.rooms[sour.rooms[i]] and map.rooms[sour.rooms[i]].ways and map.rooms[sour.rooms[i]].ways[p] then
                       l_cnt = l_cnt + 1
	   	               l_id = sour.rooms[i]
	                end
                end
                if l_cnt == 1 then
	               return go(road.act,dest.area,dest.room,l_id)
	            end
             end
		  end
	   end
	     --print('ƥ�� ����Ҳʧ�� ��')
	   if roomMaze[l_where] then
	      if type(roomMaze[l_where])=='function' then
		     l_way = roomMaze[l_where]()
		  else
		     l_way = roomMaze[l_where]
		  end
	   end
       if l_way then
          exe(l_way)
	      exe("yun jingli")
          chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾'..locl.area .. locl.room ..'���޼�·�����ƶ�Ѱ��ȷ�ж�λ�㣡','red')
          return checkWait(goContinue,1)
       end
       if table.getn(sour.rooms)>1 then
          if locl.room_relation~='' then   --��������ȡ��������Թ�ϵ�ַ���
            for i=1,table.getn(sour.rooms) do
                    if (locl.room_relation~='' and map.rooms[sour.rooms[i]].room_relative == locl.room_relation) then
                       chats_locate('��λϵͳ����ȷ��λ����idΪ����'..sour.rooms[i]..'��','LimeGreen')
                       sour.id=sour.rooms[i]
                       return check_halt(path_consider)               
                       --return go(road.act,dest.area,dest.room,sour.rooms[i])
                     else
                        chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾'..locl.area .. locl.room ..'���޷���ȷ��λ������ƶ���','red')
                        exe('stand;leave')
                        exe(locl.dir)
                        return checkWait(goContinue,1)
                    end
            end
          else
            chats_locate('��λϵͳ����ͼϵͳ�˵ص㡾'..locl.area .. locl.room ..'�����ڲ�ֹһ��������ƶ�Ѱ��ȷ�ж�λ�㣡','red')
            exe('stand;leave')
            exe(locl.dir)
            return checkWait(goContinue,1)
         end
       end
    end
    if dest.id == nil and table.getn(dest.rooms)==0 then
       Note('Path Consier GetRooms Error!')
       return false
    end
    path_create()
	road.i=0
    --return check_halt(path_start)
	wait.make(function()
        wait_busy()
        path_start()
    end)
end
function path_cal()
    local l_sour,l_dest,l_path,l_distance
    sour.rooms={}
    dest.rooms={}

    if sour.id == nil then
       sour.room=locl.room
       sour.area=locl.area
	   
	   print('path_cal...sour.id==nil..sour.room:'..sour.room)
	   print('path_cal...sour.id==nil..sour.area:'..sour.area)
	   
	   if sour.area == '��֪������' then 
	      ---print('test2222222222')
	       sour.rooms=getRooms(sour.room,sour.area,'all',locl.room_relation)
	   else  
           sour.rooms=getRooms(sour.room,sour.area)
       end
	   
       --sour.rooms=getRooms(sour.room,sour.area)
       if table.getn(sour.rooms)==0 then
          Note('Path Cal GetSourRooms 0 Error!')
          return false
       end
       l_sour=sour.rooms[1]
    else
       l_sour=sour.id
    end
    if dest.id == nil then
       dest.rooms=getRooms(dest.room,dest.area)

       --if WhereIgnores[dest.area..dest.room] then
       --   return false
       --end
       if table.getn(dest.rooms)==0 then
          Note('Path Cal GetDestRooms 0 Error!')
          return false
       end
	   if (job.name=='get_jinhe') and  room_idx > 0 and room_idx <=countTab(jinhe_rooms) then 
		    print('path_cal....jinhe job ����room �����')
		    l_dest = jinhe_rooms[room_idx]
			print('l_dest='..l_dest)
	   else 
		    l_dest,l_distance=getNearRoom(l_sour,dest.rooms)
	   end 
         --- l_dest,l_distance=getNearRoom(l_sour,dest.rooms)
		  --print('l_dest,l_distance......'..l_dest..','..l_distance)
	   if not l_dest then
		     Note("�޷�����".. dest.area .. dest.room)
			 return false
	   end
    end

    if dest.id ~= nil then l_dest = dest.id end
    if sour.id ~= nil then l_sour = sour.id end
    road.id = l_dest
    l_path=map:getPath(l_sour,l_dest)
	print('getpath....'..l_sour..','..l_dest)
    if not l_path then
       Note('GetPath Error!')
       return false
    end

    return l_path
end

function path_create()
    print('path_create.........')
    local l_set
    local l_num=0
    local l_cnt=1
    local l_cntt=1
    road.detail={}
    l_sett=0
       l_sett=0
    l_path=path_cal()
    --Note(l_path)
    if type(l_path)~='string' then
       if math.random(1,4)==1 then
          l_path='stand;out;northeast;northwest;southeast;southwest;south;south;south;south;south'
       elseif math.random(1,4)==2 then
          l_path='stand;out;northeast;northwest;southeast;southwest;east;east;east;east;east;east'
       elseif math.random(1,4)==3 then
          l_path='stand;out;northeast;northwest;southeast;southwest;west;west;west;west;west;west'
       else
          l_path='stand;out;northeast;northwest;southeast;southwest;north;north;north;north;north'
       end
    end
	print('l_path='..l_path)
    l_set=utils.split(l_path,';')  
        l_settt=table.getn(l_set)
        --print(l_path)
		print('wdgostart....:'..wdgostart)
        if wdgostart==1 then
		  --print('wdgostart....:'..wdgostart)
          if l_settt<= wd_distance then l_settt=wd_distance end
          for i=1,table.getn(l_set) do
              if i<l_settt-wd_distance-4 then
                if string.find(l_set[i],'#') then
                    if l_num>0 then
                      l_cnt=l_cnt+1
                    end
                    road.detail[l_cnt]=l_set[i]
                    l_cnt=l_cnt+1
                    l_num=0
                else
                    if l_num==0 then
                      road.detail[l_cnt]=l_set[i]
                    else
                      road.detail[l_cnt]=road.detail[l_cnt]..';'..l_set[i]
                    end
                    l_num=l_num+1
                    if l_num>road.steps then
                       l_cnt=l_cnt+1
                       l_num=0
                    end
                     	
                end
              else
              if string.find(l_set[i],'#') then
                    if l_num>0 then
                      l_cnt=l_cnt+1
                    end
                    road.detail[l_cnt]=l_set[i]
                    l_cnt=l_cnt+1
                    l_num=0
              else
                    if l_num==0 then
                      road.detail[l_cnt]=l_set[i]
                    else
                      road.detail[l_cnt]=road.detail[l_cnt]..';'..l_set[i]
                    end
                    l_num=l_num+1
                    if l_num>0 then
                       l_cnt=l_cnt+1
                       l_num=0
                    end
            end
          end
         end
        else
		  if job.name then
             print('·������,job.name='..job.name)		  
		  else
		     print('·������...')
		  end 
		   
            for i=1,table.getn(l_set) do
          if string.find(l_set[i],'#') then
                if l_num>0 then
                  l_cnt=l_cnt+1
            end
                road.detail[l_cnt]=l_set[i]
                l_cnt=l_cnt+1
                l_num=0
              else
                if l_num==0 then
                  road.detail[l_cnt]=l_set[i]
                else
                  road.detail[l_cnt]=road.detail[l_cnt]..';'..l_set[i]
            end
                  
                l_num=l_num+1
				if job.name and job.name =='huashan' then 
				     --print('��ɽ����Ĳ�������.....')
				     if l_num > road_steps_huashan then
                     l_cnt=l_cnt+1
                     l_num=0
                    end
				else 
                    if l_num>road.steps then
                     l_cnt=l_cnt+1
                     l_num=0
                    end
                end 				
                
                   
          end
        end
        end
end
function path_start()
    
	--print("path_start..................")
    EnableTrigger("hp12",false)
    EnableTimer("roadWait",false)
	DeleteTimer("roadWait",false)
    local l_road
    road.i=road.i + 1
	--if road.i~=nil then 
	--   print('road.i:'..road.i) 
	--end
    if flag.find==1 then return end 
	local total_road_count = table.getn(road.detail)
	--if total_road_count~=nil then 
	--    print('total_road_count:'..total_road_count)
    --end
	if road.i>total_road_count then
       locate_finish='go_confirm'
	   return locate()
	  --return fastLocate()
    end
    l_road=road.detail[road.i]        
    if string.find(l_road,'#') then
       local _,_,func,params = string.find(l_road,"^#(%a%w*)%s*(.-)$")
       if func then
		return _G[func](params)
		end 
    else
	   --if total_road_count - road.i < 10 then 
	     --  SetSpeedWalkDelay(30)
	   --end
	   print('ִ��·��...'..l_road)
	   exe(l_road)
       return walk_wait()
	   
	   --[[
	   local _,l_road_num = string.gsub(l_road,';','*')
       if l_road_num < 3 then
	      exe(l_road)
       else
	      Send('alias fastwalk '..l_road)
	      exe('fastwalk')
       end 	   
	   
	   --Send('alias fastwalk '..l_road)
	   --exe('fastwalk')
		--exe(l_road)
              --exe('yun jingli')
        return check_busy(walk_wait)
		
		]]--
		
    end
end

function go_confirm()
    print('go_confirm........')
	locate_finish=0
    checkWield()
    sour.id = nil
    if flag.go==nil then flag.go=0 end
    flag.go = flag.go + 1
	if string.find(locl.room,'����') or string.find(locl.room,'�ɿ�') or string.find(locl.room,'���׽���') then
	   flag.go=1
	end
    if flag.go>10 then flag.go=0 end    
    if locl.room == dest.room  and locl.room == "����" and locl.area ~= dest.area then
	   local sgate = 0
		     sgate = sgate + 1
	   if sgate>0 and sour.id~="���ݳǳ�������" then	
          exe('n')
       else 
          exe('s')
       end		  
	   return path_consider()
	end
	
	print('locl.room:'..locl.room)
	print('dest.room:'..dest.room)
	print('locl.area:'..locl.area)
	print('dest.area:'..dest.area)
	
    if (locl.room==dest.room and locl.area ~='��֪������' and locl.area==dest.area ) or (locl.room==dest.room and locl.area =='��֪������') or (locl.room==dest.room and string.find(dest.area,"/")) or flag.go==0 then
       if locl.room==dest.room  then
          chats_locate('��λϵͳ���ӡ�'.. sour.area .. sour.room ..'������������Ŀ�ĵء�'..dest.area .. dest.room ..'����','seagreen')
       else
          chats_locate('��λϵͳ���ӡ�'.. sour.area .. sour.room ..'��������δ��Ŀ�ĵء�'..dest.area .. dest.room ..'�����յ�Ϊ��'.. locl.area .. locl.room ..'����','cyan')
       end
       flag.go=0
       return road.act()
    else
       return go(road.act)
    end
end

function find(l_area,l_room)
    if job.room~=nil and (job.room=='��ɼ��' or string.find(job.room,"����")) then create_timer_st('zsl_timer',30,'zsl_stop') end
    do return search() end
end
function zsl_stop()
	EnableTimer('zsl_timer',false)
	DeleteTimer("zsl_timer")
	if dest.room=='�㳡' then return end
	if (job.room=='��ɼ��' or string.find(job.room,"����")) and tmp.find and (flag.find==0 or flag.wait==0) and flag.times==1 then
       disAll()
       flag.times=2
	   if job.name=='wudang' then return wudangFindAgain() end
	   if job.name=='huashan' then return huashanFindAgain() end
	   if job.name=='xueshan' then return xueshanFindAgain() end
    end        
end

wdjob_refind_room = {
'�����������',
'�����Ǳ�����',
'�����������',
'��ɽ��������ƺ',
'��ɽ����С��',
'��ɽ�����޺����岿',
'��ɽ�����޺����߲�',
'���ݳǺ��ָ�Ժ',
'�䵱ɽС��',
'����ɽ���ĸ�',
'����ɽ������',
'����ɽ��ˮ��',
}

find_nobody=function()
    if string.find(job.name,'songxin') then
       chats_log('��λϵͳ��δ���ڡ�'..job.area ..'���ҵ���'..job.target..'����','songxinFindFail')
    end
    if job.name=='wudang' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ���'..job.target..'���䵱��������ʧ�ܣ�','wudangFindFail')
       --if flag.times>2 then return wudangFindFail() end
    end
	  if job.name=='clb' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ���'..job.target..'����','clbFindFail')
    end   
	
	  if job.name=='husong' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ���'..job.target..'����','husongFindFail')
    end
    if job.name=='xueshan' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ���'..job.target..'����','xueshanFindFail')
    end
    if job.name=='tdh' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ�����ͬ־��','tdhFindFail')
    end
    if job.name=='huashan' then
       chats_log('��λϵͳ��δ���ڡ�'..dest.area .. dest.room ..'����ɽ��������ʧ�ܣ�','huashanFindFail')
    end
	
    if job.name=="Dummyjob" then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'���ҵ���'..job.target4..'����')
       return dummyover()
    end
	
	if job.name=='zhuacaishen' then
       chats_log('��λϵͳ��δ���ڡ�'..job.area .. job.room ..'��ץ������������ʧ�ܣ�','zhuacaishenFindFail')
    end
	
    flag.times=flag.times + 1
	
	--������wd���񣬲���Ŀ�ĵ���������ڣ���û�������������
	if flag.search_yili_center ~= nil then 
	    print('flag.search_yili_center..'..flag.search_yili_center)
	end
    if job.ori_where ~= nil then 	
	    print('job.ori_where..'..job.ori_where)
	end
	if flag.search_yili_center==0 and job.name=='wudang'  then 
	    return wudangYiliFindFail()
	end
	
	if job.name == 'wudang' then
	    for _,v in pairs(wdjob_refind_room) do
		    if string.find(job.where,v) then 
                if job_suspend == nil and flag.times > 4 then 
		            return wudangSpecailLocationFindFail()
	            end
		        if job_suspend ~= nil and job_suspend.trytimes <3 then 
		            return wudangSpecailLocationFindFail()
		        end
				if job_suspend ~= nil and job_suspend.trytimes >3 then 
		            jobfailLog()
	                local p = jobFindFail[job.name]
		            return _G[p]()
		        end
            end			
		end
	
	end
	
	
	--[[
	if job.name=='wudang' and (string.find(job.where,'�����������') or string.find(job.where,'�����Ǳ�����') or string.find(job.where,'�����������') or string.find(job.where,'�����Ǳ�����') or string.find(job.where,'��ɽ��������ƺ') or string.find(job.where,'��ɽ�����޺���')) then 
	    
		if job_suspend == nil and flag.times > 4 then 
		    return wudangSpecailLocationFindFail()
	    end
		if job_suspend ~= nil and job_suspend.trytimes <3 then 
		    return wudangSpecailLocationFindFail()
		end
	end
	]]--
		
	if flag.times>4 then
	   jobFindFail = jobFindFail or {}
	   if job.name and jobFindFail[job.name] then
	      jobfailLog()
	      local p = jobFindFail[job.name]
		  return _G[p]()
	   end
	else
	   jobFindAgain = jobFindAgain or {}
	   if job.name and jobFindAgain[job.name] then
	      local p = jobFindAgain[job.name]
		  return _G[p]()
	   end
	end
    if job.name=='dolost' then 
       return go(lookXin,'������','�׻����ڽ�')
    end  
end 
List = {}
--��������
function List.new(val)
        return {pnext = nil, index=val}
end
--����һ���ڵ�
function List.addNode(nodeParent, nodeChild)
    nodeChild.pnext = nodeParent.pnext
    nodeParent.pnext = nodeChild
    return nodeChild
end
function searchPre()
    print('searchPre....')
	road.rooms={}
         
	--print(road.id)
    local p_room = map.rooms[road.id].name
	local p_dest = getLookCity(road.id)
	local l_distance = 6
  --[[if job.name and (job.name=="clb" or job.name=='tdh' or job.name=='tmonk') and flag.times==1 then
	   l_distance = 2
	end]]
    --print('p_room:'..p_room)
	--print('p_dest:'..p_dest)
	if flag.times==1 and job_suspend==nil then
		if job.name=='wudang' and wd_distance>2 then
			l_distance = wd_distance
		else
			l_distance = 2
			--l_distance = 1
		end   
   end
   if flag.times==2 and job_suspend==nil then
	  	if job.name=='wudang' and wd_distance>4 then
			l_distance = wd_distance
		else
			l_distance = 4
		end    
   end
   if flag.times==3 then
       l_distance = 6
   end
   
   if flag.times == 3 and (job.name=='wudang' or job.name=='huashan') and flag.searchArea ~= nil then 
       print('��������..................')
       l_distance = 300
   end 
   
   if job.name=='zhuacaishen' or job.name=='dolost' then
	  l_distance = 6
   end
    if job.name and job.name=='xueshan' and flag.times==1 then
    l_distance = 4
	end
     if job.name and job.name=='husong' and flag.times==1 then
        l_distance = 2
	end
	if p_dest==nil then
	   p_dest=map.rooms[road.id].outdoor
	end
	
	if p_room=='�ϳ���' and p_dest=='�����' and (job.name=='wudang' or job.name=='huashan' or job.name=='xueshan') then
	    if l_distance<3 then l_distance=3 end
	end 
	
	if p_room=='�����' and p_dest=='���ݳ�' and job.ori_where ~= nil then
	    l_distance=3 
	end 
	
	if job.name=='huashan' and flag.times==1 and job.area=='��ɽ' and job.room=='����' then
	    l_distance=0
	end
	
    --local rooms = getAroundRooms(p_room,p_dest,l_distance,'all')
	--roomsnum=countTab(rooms)
	
	local rooms = {}
	--flag.searchRooms = {{'�һ���','����',1},{'������','����',1},{'��ˮ��','����',1},{'�����','����',1}}
	if (job.name=='wudang' or job.name=='huashan' or job.name=='xueshan') and flag.searchRooms ~= nil then 
	    for _,k in pairs(flag.searchRooms) do
		    local tmp_rooms = nil
			print(k[1],k[2],k[3])
		    tmp_rooms = getAroundRooms(k[1],k[2],k[3],'all')
			if tmp_rooms ~= nil then 
			   for id in pairs(tmp_rooms) do
			    print('id:'..id)
                   if rooms[id] ==nil then 
				       rooms[id] = true
                   end				   
			   end 
            end 			
		end
	elseif (job.name=='wudang' or job.name=='huashan') and job.ori_where~=nil and job.where=="���ݳ������" then
	   rooms = getAroundRooms_ex(p_room,p_dest,l_distance,'city/xidajie1','all')	
	else
	   rooms = getAroundRooms(p_room,p_dest,l_distance,'all')
	end 
	
	flag.search_yili_center=nil
	print('cur room='..locl.room_relation)
	if (job.name=='wudang' or job.name=='huashan')  and job.where=='������ϳ���' then
	   flag.search_yili_center=1
	   if locl.room_relation=='�ϳ��ţ�������ϳ���' then 
	          flag.search_yili_center=0
          	  local yilicity_rooms={'yili/house','yili/kezhan','yili/kezhan2',
			                        'yili/store','yili/store1','yili/yili2'} 
			  for k,v in pairs(yilicity_rooms) do
			      if rooms[v]==true then
                      rooms[v]=nil  
				  end
			  end		  
	   end
	end
	
	if (job.name=='wudang' or job.name=='huashan')  and job.where=='���ݳ������' then
	   flag.search_yili_center=1
	   if locl.room_relation=='����----�����----����������' then 
	          flag.search_yili_center=0
          	  local yilicity_rooms={'city/jiulou','city/jiulou2','city/zhubaodian'} 
			  for k,v in pairs(yilicity_rooms) do
			      if rooms[v]==true then
                      rooms[v]=nil  
				  end
			  end		  
	   end
	end
	

	---hs ������������������ֱ�Ӵ���ʧ��
	--[[if job.name=='huashan' and ori_job_where ~= nil and job.where=='������ϳ���' then
	    if locl.room_relation=='�ϳ��ţ�������ϳ���' then 
		    rooms={}
		end
	end
	]]--
	
	roomsnum=countTab(rooms)
	
	--[[print('this is end ...')
	for k,v in pairs(rooms) do
	   print(k,v)
	end
	]]--
	
        
	--�����ڽӱ������ڵݹ�����
	--������ʼroad.id 
	starttime=os.clock() --���Լ���ʱ��
	newrooms = {}
	for id in pairs(rooms) do
            table.insert(newrooms,id)
	end

	myrt={}
	
	for _,roomid in pairs(newrooms) do --���뷿������
			roomV = List.new(roomid)
			local node = roomV
			for k,v in pairs(newrooms) do --���еķ���id
				for route,link_way in pairs(map.rooms[roomid].ways) do  --��ǰid�ĳ���
					local routeLength = map.rooms[roomid]:length(route) --��ȡ·�������Ƿ�ɴ����false��ʾ��·��ͨ����ô��������·�Ͳ������������
					--print("k="..k.."|link_way="..link_way.."|v="..v)
					if routeLength then
					   --print('routeLength....:'..routeLength)
					   --print(flag.times)
						---by fqyy 20170429 ����room.lengths����ֵ�ж�
						if routeLength ==1 or routeLength >1 and flag.times>1 then
						--if routeLength ==1 or routeLength >1 then
						   --print('searchPre...routeLength,flag.times'..routeLength..';'..flag.times)
							if v==link_way then 
								node = List.addNode(node,List.new(k)) --����ڵ����ɵ�һ������ĳ�������
							end
						end
					end
				end
			end
			table.insert(myrt,roomV)
	end
	visited={}

	for i=1 ,countTab(newrooms) do
		visited[i]=false --��ʼ�����нڵ�δ������
	end
	
	if not visited[1] then
		FastDFS(myrt,1) --����������ͨͼ
	end
	for i=1 ,countTab(newrooms) do
		if visited[i]==false then--δ�����ʵĽڵ����һ�¸���һ��������ͨ�ԣ��������ͨ����ݹ�����ڵ�
			local path, len = map:getPath(myrt[1].index,myrt[i].index)
			if path then
				FastDFS(myrt,i) --��������ָ����myrt[i]����ڵ�
				--messageShow("����ͨ·��������һ���ڵ㣡ͨ·����="..len,"red")
			end
		end
	end
	
	--- 20200127 maixf add ���Խ���һ��id ��������Ա����������ԭ����id
	--table.insert(road.rooms,road.id)
	--messageShow("��"..job.name.."��������ȼ��������������"..roomsnum.."�������䣬��ʱ��"..os.clock()-starttime.."����","SandyBrown")
end
function FastDFS(myrt,i)
	visited[i] = true          --�����±�ΪI�Ķ���Ϊ�ѷ���  
    --Note("myrt["..i.."]="..myrt[i].index)  --���������Ϣ
    table.insert(road.rooms,myrt[i].index)
	local p = myrt[i].pnext --��һ���߱����  
	if p==nil then return end
    while p~=nil do   
      
        if(not visited[p.index]) then--�����δ���ʵ���ݹ� 
			visited[p.index]=true 
            FastDFS(myrt,p.index)
		end
        p = p.pnext
		
    end  
end
function dfs(from)
    for i=1,countTab(tmp.to) do
		if not tmp.to then
			break
		end
		local l_dest,l_p=getNearRoom(from,tmp.to)
		if l_dest then
			local l_check = true
			for v in pairs(road.rooms) do
				if v==l_dest then
					l_check = false
				end
			end
			if l_check then
				local path, len = map:getPath(from,l_dest)
				if path then
				   table.insert(road.rooms,l_dest)
				   table.remove(tmp.to,l_p)
				   dfs(l_dest)
				end
			end
		end
	end
end


function searchPre_test()
    print('searchPre_test....')
	road.rooms={}
    job.name='huashan'
	--print(road.id)
    local p_room = 'ɽ��'
	local p_dest = '���޺�'
	local l_distance = 2
	
	
	local rooms = {}
    rooms = getAroundRooms(p_room,p_dest,l_distance,'all')
	 
	roomsnum=countTab(rooms)
      
	--�����ڽӱ������ڵݹ�����
	--������ʼroad.id 
	starttime=os.clock() --���Լ���ʱ��
	newrooms = {}
	for id in pairs(rooms) do
            table.insert(newrooms,id)
	end

	myrt={}
	
	for _,roomid in pairs(newrooms) do --���뷿������
			roomV = List.new(roomid)
			local node = roomV
			for k,v in pairs(newrooms) do --���еķ���id
				for route,link_way in pairs(map.rooms[roomid].ways) do  --��ǰid�ĳ���
					local routeLength = map.rooms[roomid]:length(route) --��ȡ·�������Ƿ�ɴ����false��ʾ��·��ͨ����ô��������·�Ͳ������������
					--print("k="..k.."|link_way="..link_way.."|v="..v)
					if routeLength then
					   --print('routeLength....:'..routeLength)
					   --print(flag.times)
						---by fqyy 20170429 ����room.lengths����ֵ�ж�
						if routeLength ==1 or routeLength >1 and flag.times>1 then
						--if routeLength ==1 or routeLength >1 then
						   --print('searchPre...routeLength,flag.times'..routeLength..';'..flag.times)
							if v==link_way then 
								node = List.addNode(node,List.new(k)) --����ڵ����ɵ�һ������ĳ�������
							end
						end
					end
				end
			end
			table.insert(myrt,roomV)
	end
	visited={}

	for i=1 ,countTab(newrooms) do
		visited[i]=false --��ʼ�����нڵ�δ������
	end
	
	if not visited[1] then
		FastDFS(myrt,1) --����������ͨͼ
	end
	for i=1 ,countTab(newrooms) do
		if visited[i]==false then--δ�����ʵĽڵ����һ�¸���һ��������ͨ�ԣ��������ͨ����ݹ�����ڵ�
			local path, len = map:getPath(myrt[1].index,myrt[i].index)
			if path then
				FastDFS(myrt,i) --��������ָ����myrt[i]����ڵ�
				--messageShow("����ͨ·��������һ���ڵ㣡ͨ·����="..len,"red")
			end
		end
	end

end


function search_test()
	--Note("run search")
    tmp.find = true
    if flag.find==1 then return end
    --searchPre_test()
	job.name='huashan'
	road.rooms={}
	table.insert(road.rooms,'xingxiu/xx6')
	table.insert(road.rooms,'xingxiu/shanshi')
	table.insert(road.rooms,'xingxiu/cave')
	table.insert(road.rooms,'xingxiu/cave2')
	
	cntr1 = countR(15)
    exe('look;halt')
	tmpsearch=3
	walk_path = ''
	--print road.rooms
	for k,v in pairs(road.rooms) do 
	   print(k,v)
	end
    return check_halt(searchStart,1)
end



function search()
	--Note("run search")
    tmp.find = true
    if flag.find==1 then return end
    searchPre()
	cntr1 = countR(15)
    exe('look;halt')
	tmpsearch=3
	walk_path = ''
	--print road.rooms
	for k,v in pairs(road.rooms) do 
	   print(k,v)
	end
    return check_halt(searchStart,1)
end
function searchStart()
      --EnableTriggerGroup("wipe",true) 
    --local knock_gate = 0
	flag.search=1
	--Note("run searchStart")
    if flag.find==1 then return end
    if flag.wait==1 then return end
    if table.getn(road.rooms)==0 then
       return find_nobody()
    end
    local path, length = map:getPath(road.id, road.rooms[1])
	---print('searchStart.....road.id,road.rooms[1]='..road.id..';'..road.rooms[1])
    road.id = road.rooms[1]
    table.remove(road.rooms,1)
	
	--print('#road.rooms:'..#road.rooms)
	
	if type(path)~="string" then
	   return searchStart()
	end
	if string.find(path,'#') or job.name~='huashan' or (job.name=='huashan' and flag.hs_find_lost==1) then
	      return searchFunc(path)
		  --[[
 	       if walk_path ~= "" and (job.name=='huashan' and flag.hs_find_lost==0) then
		       print('��������#��������ִ��:'..walk_path)
			   Send('alias walkpath '..walk_path)
			   
			   wait.make(function()
				    wait.time(road.wait)
				    exe('walkpath')
					walk_path = ''
					wait.time(road.wait)
					return searchFunc(path)
			   end)
			   
			   --exe('walkpath')
			   --walk_path = ''
		   else
		       walk_path = ''	
               return searchFunc(path)			   
           end		   
	       ---return searchFunc(path)
		   ]]--
    else
	    --print('searchStart...:'..path)
		
		--[[if string.find(path,'knock gate') then 
		   print('�����Ŷ������ر�wipe........')
		   EnableTriggerGroup("wipe",false) 
		   knock_gate = 1
		end ]]--
		
		print('hs �������� 30.....')
		SetSpeedWalkDelay(30)
		exe(string.sub(string.gsub(path, "halt;", ""),1,-2))
		_,tmpnum=string.gsub(path, ";", " ")
		tmpsearch=tmpsearch+tmpnum
		if tmpsearch>20 then
			tmpsearch=3
			--knock_gate = 0
            searchStart()
		else
			tmpsearch=tmpsearch+1
            searchStart()
		end
		--[[

		local tmp_path = string.sub(string.gsub(path, "halt;", ""),1,-1)
		walk_path = walk_path .. tmp_path

		_,tmpnum=string.gsub(walk_path, ";", " ")
		
		if tmpnum > 50 or knock_gate==1 or #road.rooms==0 then 
		    --print('�����������Ʋ�����,����road.room��û����...')
			print('**ִ��:'..walk_path)
			Send('alias walkpath '..walk_path)
			exe('walkpath')
			walk_path = ''
			wait.make(function()
				wait.time(road.wait)
				knock_gate = 0
				searchStart()
			end)
		else
		   --print('����δ�ﵽ���ƣ�����...')
		   searchStart()
		end ]]--

    end

end
function searchFunc(path)
	--Note("run searchFunc")
    if flag.find==1 then return end
    if flag.wait==1 then return end
    road.pathset = road.pathset or {}
    if path then
	   print('searchFunc...'..path)
       road.pathset=utils.split(path,";")
	   for i=1,table.getn(road.pathset) do
	       for p=1, table.getn(road.pathset) do
		       if isNil(road.pathset[p]) or road.pathset[p]=="halt" then
			      table.remove(road.pathset,p)
				  break
			   end
		   end
	   end
	end
	if table.getn(road.pathset)==0 then
	   return searchStart()
	end
        if string.find(road.pathset[1],'#') then
	       local _,_,func,params = string.find(road.pathset[1],"^#(%a%w*)%s*(.-)$")
	       if func then
	          table.remove(road.pathset,1)
	          return _G[func](params)
	       else
	          exe(road.pathset[1])
	          table.remove(road.pathset,1)
			  return walk_wait()
	       end
	   else
	      exe(road.pathset[1])
	      table.remove(road.pathset,1)
		  return walk_wait()
	   end
end

function searchWait()
    EnableTriggerGroup("find",true)
    exe('alias action ������Ѱ��')
end
delElement=function(set,dir)
    local l_cnt=0
    for i=1,table.getn(set) do
        if set[i]==dir then
           l_cnt=i
           break
        end
    end
    table.remove(set,l_cnt)
    return set
end

wipe_trigger=function()
    DeleteTriggerGroup("wipe")
    create_trigger_t('wipe1',"^>*\\s*(\\D*)��\\D*��Ķ����ˡ�$",'','wipe_goon')
    create_trigger_t('wipe2',"^>*\\s*(\\D*)��ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����",'','wipe_goon')
    create_trigger_t('wipe3',"^>*\\s*(\\D*)��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ",'','wipe_faint')
    create_trigger_t('wipe7',"^>*\\s*(\\D*)���Ӷ��˶������������˼��������ѹ���",'','wipe_wake')
    create_trigger_t('wipe4',"^>*\\s*�����(\\D*)(�ͺ�|���|���|�ȵ�|����һ��)",'','wipe_who')
    create_trigger_t('wipe5',"^>*\\s*����û������ˡ�",'','wipe_over')
    create_trigger_t('wipe6',"^>*\\s*��Ҫ��˭�����������",'','wipe_over')
    SetTriggerOption("wipe1","group","wipe")
    SetTriggerOption("wipe2","group","wipe")
    SetTriggerOption("wipe3","group","wipe")
    SetTriggerOption("wipe4","group","wipe")
    SetTriggerOption("wipe5","group","wipe")
    SetTriggerOption("wipe6","group","wipe")
    SetTriggerOption("wipe7","group","wipe")
    EnableTriggerGroup("wipe",false)    
end
wipe=function(wipe_str,wipe_con)
    wipe_trigger()
    EnableTriggerGroup("wipe",true)
    road.wipe_id=wipe_str
    road.wipe_con=wipe_con
    tmp.faint=0
    weapon_wield()
	beiUnarmed()
    
    if WipeNoPerform[road.wipe_id] or tmp.gold then  
       exe('kill '..road.wipe_id)
       if score.party and score.party=="�䵱��" then
          exe("jiali max")
       else
          exe("jiali max")
       end
	   exe('unset wimpy')
    else
       killPfm(road.wipe_id)
    end
    create_timer_s('wipe',2,'wipe_set')
end
wipe_set=function()
    exe('kill '..road.wipe_id)
end
wipe_who=function(n,l,w)
    road.wipe_who=Trim(w[1])
    job.killer=job.killer or {}
    if not WipeNoPerform[road.wipe_id] then
       job.killer[road.wipe_who]=road.wipe_id
    end
end
wipe_faint=function(n,l,w)
    if tmp.faint then
       tmp.faint=tmp.faint + 1
    end
    if road.wipe_who==Trim(w[1]) then
       exe('kill '..road.wipe_id)
       job.killer[road.wipe_who]="faint"
    end
end
wipe_wake=function(n,l,w)
    if tmp.faint then
       tmp.faint=0
    end
    if road.wipe_who==Trim(w[1]) then
       exe('kill '..road.wipe_id)
    end
end
wipe_goon=function(n,l,w)
    if job.name=="gblu" and road.wipe_who=="�о�����" then
       chats_log('��Ч���ң��㶨��'..locl.room..'�����о�������')
    end
    if tmp.faint and tmp.faint>0 then
       tmp.faint=tmp.faint - 1
    end
    if road.wipe_who==Trim(w[1]) then
       exe('kill '..road.wipe_id)
    end
end
wipe_over=function()
    wait_cd=os.time()
    DeleteTimer('wipe')
    DeleteTimer('perform')
    --exe('set wimpy 100')
	EnableTriggerGroup("wipe",false)
    road.wipe_id="wipe_id"
    if road.wipe_con~=nil then
      return check_halt(road.wipe_con)
    else
       return check_halt(walk_wait)
    end   
end

function thread_resume(thread)
    if type(thread)=='thread' then
       coroutine.resume(thread)
    end
end
function walkBusy()
   locate_finish='walk_wait'
    --return checkNext(locate)
	return check_busy(fastLocate)

end

function walkLongBusy()
   locate_finish='walk_long_wait'
    return checkNext(locate)

end

hsssl=function()
    road.temp=0
        if flag.find==1 then return end
    if flag.wait==1 then return end        
        DeleteTriggerGroup("sslcheck")
        create_trigger_t('sslcheck1',"^\\D*ʯ��",'','hsssl_out')
        SetTriggerOption("sslcheck1","group","sslcheck") 
        EnableTriggerGroup("sslcheck",true)
        exe('n;e;e')
        if flag.find==1 then return end
        create_timer_s('walkWait9',0.05,'sslgo')
        create_timer_s('walkWait10',5,'ssllook')
end
ssllook=function()
    exe('look')
end
sslgo=function()
   road.temp = road.temp + 1
   if road.temp > 15 then
      locate_finish='hsssl_out'
      return checkNext(locate)
   end
    exe('n;e;e')
end
hsssl_out=function()
        locate_finish=0
        EnableTimer('walkWait10',false)
        EnableTimer('walkWait9',false)
		EnableTimer('walkWait4',false)
        DeleteTimer("walkWait10")
        DeleteTimer("walkWait9")
		DeleteTimer("walkWait4")
		EnableTriggerGroup("sslcheck",false)
                locate_finish=0
    if flag.find==1 then return end
    if flag.wait==1 then return end        
    return walk_wait()
end



hscaidi=function()
    caidiout = 0
	caidiout_error=0
    DeleteTriggerGroup("hscaidi")    
    create_trigger_t('hscaidi1','^(> )*��������һͨ����Ȼ�����Լ��߻���ԭ�ء�','','hscaidi_out1')
	create_trigger_t('hscaidi2','^(> )*�������û�г�·��$','','hscaidi_out2')
	SetTriggerOption("hscaidi1","group","hscaidi")
	SetTriggerOption("hscaidi2","group","hscaidi")
	EnableTriggerGroup('hscaidi',true)
	
	if flag.find==1 then return end
 
	  wait.make(function()
         while true do
		    if  caidiout == 0 and caidiout_error==0 then
                wait.time(0.2)			
			    exe('n;n;n;n')
			else
			    break 
            end			
        end
		EnableTriggerGroup("hscaidi",false)
		caidiout = 0
		caidiout_error = 0
		locate_finish='walk_wait'
        return fastLocate()		
    end)
end 



hscaidisssssssssssssssssssssssss=function()
    DeleteTriggerGroup("hscaidi")    
    create_trigger_t('hscaidi2','^>*\\s*������\\s*\\-','','hscaidi_out1')
	create_trigger_t('hscaidi99','�������û�г�·','','hscaidi_out2')
    SetTriggerOption("hscaidi2","group","hscaidi")
	SetTriggerOption("hscaidi99","group","hscaidi")
    flag.find=0
    road.temp=0
	if road.hscaidi == nil then
      road.hscaidi = true	
	  Send('alias fastwalk '.."n;n;n;n")
	  ---exe('fastwalk')
	end 
	
	exe('fastwalk')
	---print('hscaidi..............')
    --exe('n;n;n;n')
        wait.make(function()
            wait.time(0.2)
        if flag.find==1 then return end
            return hscaidi_goon1()
        end)
end
hscaidi_out1=function()
   EnableTriggerGroup("hscaidi",false)
   caidiout=1
end

hscaidi_out2=function()
   EnableTriggerGroup("hscaidi",false)
   caidiout_error=1
end


hscaidi_goon1=function()
    if caidiout==1 or caidiout_error==1 then
       EnableTriggerGroup("hscaidi",false)
	   road.hscaidi = nil
       locate_finish='hscaidi_out'
       --return checkWait(locate,0.5)
	   return locate()
    else
       return hscaidi()
    end
end
hscaidi_out=function()
    locate_finish=0
    caidiout=0
	caidiout_error=0
    EnableTriggerGroup("hscaidi",false)
    return walk_wait()

end

duhe_trigger=function()
    EnableTriggerGroup("prepare_neili",false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTriggerGroup("duhe")
    create_trigger_t('duhe1','^>*\\s*�����ǰ�̤�Ű�������','','duhe_duhe')
    create_trigger_t('duhe2','^>*\\s*˵�Ž�һ��̤�Ű���ϵ̰����γ�һ����ȥ','','duhe_out')
    create_trigger_t('duhe3','^>*\\s*(��|��)��̫���ˣ����û����;�����ĵط�����û����Խ��ȥ��','','duhe_wait')
    create_trigger_t('duhe4','^>*\\s*��ľ���������','','duhe_jingli')
    create_trigger_t('duhe5','^>*\\s*���\\D*��Ϊ����','','duhe_cannt')
    create_trigger_t('duhe6','^>*\\s*������������ˣ�','','duhe_go_enter')
    create_trigger_t('duhe7','^>*\\s*��������������ȴ�������ϴ���Ǯ�����ˡ�','','duhe_silver')
    create_trigger_t('duhe8','^>*\\s*��һ����Ϣ����׼��(��|��)�жɴ�λ�ã�ʹ��','','duhe_fly')
    create_trigger_t('duhe9','^>*\\s*�����ǰ�̤�Ű���������������һ��','','duhe_duhe')
    create_trigger_t('duhe10','^>*\\s*һ�Ҷɴ�������ʻ�˹�����������һ��̤�Ű���ϵ̰����Ա�˿�����','','duhe_enter')
    create_trigger_t('duhe11','^>*\\s*�д������������Cool����','','duhe_wait')
    create_trigger_t('duhe12','^>*\\s*���ڽ��жɴ�������һ�㣬��������','','duhe_fly')
    create_trigger_t('duhe13',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','duhe_jump')
    create_trigger_t('duhe14','^>*\\s*����Ϣ���ȣ���ʱ����ʩ���ڹ���','','duhe_jump')
    SetTriggerOption("duhe1","group","duhe")
    SetTriggerOption("duhe2","group","duhe")
    SetTriggerOption("duhe3","group","duhe")
    SetTriggerOption("duhe4","group","duhe")
    SetTriggerOption("duhe5","group","duhe")
    SetTriggerOption("duhe6","group","duhe")
    SetTriggerOption("duhe7","group","duhe")
    SetTriggerOption("duhe8","group","duhe")
    SetTriggerOption("duhe9","group","duhe")
    SetTriggerOption("duhe10","group","duhe")
    SetTriggerOption("duhe11","group","duhe")
    SetTriggerOption("duhe12","group","duhe")
    SetTriggerOption("duhe13","group","duhe")
    SetTriggerOption("duhe14","group","duhe")
    EnableTriggerGroup("duhe",true)
end
duHhe=function()
    if hp.neili_max > 3000 and skills['dodge'].lvl >= 200 then
	   flag.duhe=1
    else
           flag.duhe=0
    end
    duhe_trigger()
	locate_finish='duHhe_start'
	return fastLocate()
end

function yell_duhe()
   print('yell_duhe....')
   exe('yell boat;duhe')
end

function yell_duhe_new()
   --print('yell_duhe_new....')
   exe('yell boat')
   duhe_send=0
   local l,w = nil
   wait.make(function() 
       while true do
           exe('duhe')
           wait.time(0.5)
           if duhe_send==1 then break end		   
       end
   end)
end


duHhe_start=function()
    locate_finish=0
    if string.find(locl.room,'��') then
	 if ll_place and ll_place=='���ݴ�ɿ�' then return end
	 if ll_place and ll_place=='���ݳ����Ķɿ�' then return end
	 if ll_place and ll_place=='�������½��ɿ�' then return end
     EnableTriggerGroup("duhe",true)
     if flag.duhe==1 then
          --return exe('yell boat;duhe')
		  ---return checkWait(yell_duhe,1)
		  return yell_duhe_new()
     else
          return duhe_enter()
     end
    else
       if math.random(1,10)>1 then
          return go(road.act)
       else
          return duhe_over()
       end
    end
end
duhe_duhe=function()
    duhe_open_boat=1
    if flag.duhe==1 then
	     prepare_neili_stop()
       --return check_bei(duhe_jump)
	   return check_bei(yell_duhe_new)
    end
end
duhe_jump=function()
    return exe('yun qi;yell boat;duhe')
end
duhe_go_enter=function()
    duhe_send=1
    if flag.duhe==1 then
    prepare_neili_stop()
    --exe('set ����')
    exe('yun qi;dazuo '..hp.dazuo)
    end
end
duhe_enter=function()
    if flag.duhe==0 then
       prepare_neili_stop()
       return check_bei(duhe_enter_in)
    end
end
duhe_enter_in=function()
    prepare_neili_stop()
    exe('yell boat;enter')
    locate()
    return check_busy(duhe_enter_check)
end
duhe_enter_check=function()
    if string.find(locl.room,'��') or string.find(locl.room,'��') then
       prepare_neili_stop()
    else
	flag.idle = nil
       --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
       return exe('yun qi;dazuo '..hp.dazuo)
    end
end
duhe_out=function()
    exe('out')
    return duhe_over()
end
duhe_over=function()
    EnableTriggerGroup("duhe",false)
    DeleteTriggerGroup("duhe")
	locate_finish=0
    --locate()
	fastLocate()
	bqcheck()
	exe('bei none')
	beiUnarmed()
	Chuanfu:openAllareas()
    return walk_wait()
end
duhe_wait=function()
    duhe_send=1
	--[[if road.huanghe1~=nil and road.huanghe2~=nil then
	    locate_finish='duhe_test'
	    return locate()
    end]]--
   
   --[[if hp.exp>300000 then
      exe('yun qi;yun jingli;sxlian;dazuo '..hp.dazuo)
    else
      exe('yun qi;yun jingli;dazuo '..hp.dazuo)
    end ]]--
   duhe_open_boat=0
   exe('yun qi;yun jingli;sxlian')
   wait.make(function()
       while duhe_open_boat==0 do
	       exe('dazuo '..hp.dazuo)
		   local l,w = wait.regexp('^(> )*���������£�˫Ŀ΢�գ�˫���������������̫�������˺�һ���������顣',1)
		   if l~= nil or duhe_open_boat==1 then break end
	   end
   end)
	
end

function duhe_test()
locate_finish=0
duhe_change()
 return go(road.act)
end
duhe_jingli=function()
    duhe_send=1
    return exe('duhe')
end
duhe_cannt=function()
    duhe_send=1
    flag.duhe=0
	jifaDodge()
   return checkWait(duHhe_start,0.2)
end
duhe_silver=function()
    EnableTriggerGroup("duhe",false)
    exe('dig')
    return check_bei(duHhe)
end
duhe_fly=function()
   duhe_send=1
   return check_bei(duhe_over)
end
dujiang_trigger=function()
    EnableTriggerGroup("prepare_neili",false)
    DeleteTriggerGroup("prepare_neili")
    DeleteTriggerGroup("dujiang")
    --create_trigger_t('dujiang1','^(> )*�����ˮ̫��̫������ɲ���ȥ��','','')
    create_trigger_t('dujiang2','^(> )*(�ɴ��͵�һ���Ѿ�����|����˵���������ϰ��ɡ�)','','dujiang_out')
    create_trigger_t('dujiang3','^(> )*(��|��)��̫���ˣ����û����;�����ĵط�����û����Խ��ȥ��','','dujiang_wait')
    create_trigger_t('dujiang4','^(> )*��ľ��������ˣ�','','dujiang_jingli')
    create_trigger_t('dujiang5','^(> )*���\\D*��Ϊ����','','dujiang_cannt')
    create_trigger_t('dujiang6','^(> )*������������ˣ�','','dujiang_go_enter')
    create_trigger_t('dujiang7','^(> )*�����ˮ̫��̫������ɲ���ȥ��','','dujiang_move')
    create_trigger_t('dujiang8','^(> )*��һ����Ϣ����׼��(��|��)�жɴ�λ�ã�ʹ��','','dujiang_fly')
    create_trigger_t('dujiang9','^(> )*����(��|)��̤�Ű���','','dujiang_dujiang')
    create_trigger_t('dujiang10','^(> )*һ�Ҷɴ�������ʻ�˹�����������һ��̤�Ű���ϵ̰����Ա�˿�����','','dujiang_enter')
    create_trigger_t('dujiang11','^(> )*�д������������Cool����','','dujiang_wait')
    create_trigger_t('dujiang12','^(> )*���ڽ��жɴ�������һ�㣬��������','','dujiang_fly')
    create_trigger_t('dujiang13',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','dujiang_jump')
    create_trigger_t('dujiang14','^>*\\s*����Ϣ���ȣ���ʱ����ʩ���ڹ���','','dujiang_jump')
    --SetTriggerOption("dujiang1","group","dujiang")
    SetTriggerOption("dujiang2","group","dujiang")
    SetTriggerOption("dujiang3","group","dujiang")
    SetTriggerOption("dujiang4","group","dujiang")
    SetTriggerOption("dujiang5","group","dujiang")
    SetTriggerOption("dujiang6","group","dujiang")
    SetTriggerOption("dujiang7","group","dujiang")
    SetTriggerOption("dujiang8","group","dujiang")
    SetTriggerOption("dujiang9","group","dujiang")
    SetTriggerOption("dujiang10","group","dujiang")
    SetTriggerOption("dujiang11","group","dujiang")
    SetTriggerOption("dujiang12","group","dujiang")
    SetTriggerOption("dujiang13","group","dujiang")
    SetTriggerOption("dujiang14","group","dujiang")
    EnableTriggerGroup("dujiang",true)
end
duCjiang=function()
    if hp.neili_max > 3500 and skills['dodge'].lvl >= 200 then
	   flag.dujiang=1
    else
           flag.dujiang=0
	end
	--locate_finish='duCjiang_check'
	locate_finish=0
    dujiang_trigger()
	print('dujiang function .......')
	--locate()
	fastLocate()
	return check_bei(duCjiang_check)
	
end
duCjiang_check=function()
    --locate_finish=0
	wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
			if string.find(locl.room,'���Ϲٵ�') then
			    exe('halt;n')
			end
            duCjiang_start()
    end)
	--[[
    if string.find(locl.room,'���Ϲٵ�') then
       exe('halt;n')
		wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
            duCjiang_start()
        end)
    else
	   wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
            duCjiang_start()
        end)
	   
    end]]--
end
duCjiang_start=function()
    locate_finish=0
    if string.find(locl.room,'��') then
	   EnableTriggerGroup("dujiang",true)
       if flag.dujiang==1 then
	      --locate_finish='djdj_wait'
	      print('dujiang_start............')
          --return fastLocate()	
		  return djdj_wait_new()
       else
	   locate_finish='dujiang_enter'
          ---return checkWait(locate,0.2)
		  --return checkWait(fastLocate,0.2)
		  return fastLocate()
       end
    else
       if math.random(1,10)>1 then
          return go(road.act)
       else
          return dujiang_over()
		  
       end
    end
end

function djdj_wait_new()
    exe('yell boat')
	dujiang_send=0
	--dujiang_open_boat=0
	local l,w=nil
    wait.make(function()   
		while true do
           exe('dujiang')
           wait.time(0.5)
		   if dujiang_send==1 then break end
		end
	end)
end


function djdj_wait()
locate_finish=0
exe('yell boat;dujiang')
create_timer_s('walkWait4',1.0,'djdj_wait_timer')
end

function djdj_wait_timer()
    EnableTimer('walkWait4',false)
    exe('yell boat;dujiang')
end

dujiang_dujiang=function()
--EnableTimer('walkWait4',false)
    dujiang_open_boat=1
    if flag.dujiang==1 then
	     prepare_neili_stop()
       --return check_bei(dujiang_jump)
	     return check_bei(djdj_wait_new)
    end
end
dujiang_jump=function()
--EnableTimer('walkWait4',false)
    print('dujiang_jump.........')
    exe('yell boat;dujiang')
end
dujiang_go_enter=function()
    dujiang_send=1
    if flag.dujiang==1 then
    --exe('set ����')
    exe('yun qi;dazuo '..hp.dazuo)
    end
end
dujiang_enter=function()
    --EnableTimer('walkWait4',false)
    locate_finish=0
    if flag.dujiang==0 then
       prepare_neili_stop()
       return check_busy(dujiang_enter_in)
    end
end
dujiang_enter_in=function()
    --EnableTimer('walkWait4',false)
    prepare_neili_stop()
    exe('yell boat;enter')
    locate_finish='dujiang_enter_check'
    --return checkWait(locate,0.2)
	return locate()
end
dujiang_enter_check=function()
--EnableTimer('walkWait4',false)
   locate_finish=0
    if string.find(locl.room,'��') or string.find(locl.room,'��') then
       return prepare_neili_stop()
    else
	exe('dazuo '..hp.dazuo)
	wait.make(function()
         wait.time(1.0)
	return check_bei(dujiang_lx)
     end)
	 end
end
function dujiang_lx()
--EnableTimer('walkWait4',false)
    --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
 end
dujiang_out=function()
--EnableTimer('walkWait4',false)
    exe('out')
    return dujiang_over()
end
dujiang_over=function()
--EnableTimer('walkWait4',false)
    locate_finish=0
    EnableTriggerGroup("dujiang",false)
    DeleteTriggerGroup("dujiang")
	djdh_open()
    --locate()
	fastLocate()
	exe('bei none')
	beiUnarmed()
	bqcheck()
	Chuanfu:openAllareas()
    return walk_wait()
end
dujiang_wait=function()
   --EnableTimer('walkWait4',false)
   dujiang_send=1
   dujiang_open_boat=0
   exe('yun qi;sxlian')
   wait.make(function()
       while dujiang_open_boat ==0 do
	       exe('dazuo '..hp.dazuo)
		   local l,w = wait.regexp('^(> )*���������£�˫Ŀ΢�գ�˫���������������̫�������˺�һ���������顣',1)
		   if l~= nil or dujiang_open_boat==1 then break end
	   end
   end)
         
    --locate_finish='dujiang_wait_test'
	--return fastLocate()
end
function dujiang_wait_test()
locate_finish=0
exe('dazuo '..hp.dazuo)
end
dujiang_jingli=function()
    dujiang_send=1
    return exe('yun jingli;dujiang')
end
dujiang_cannt=function()
    dujiang_send=1
    flag.dujiang=0
	jifaDodge()
   return checkWait(duCjiang_start,0.5)
end
dujiang_fly=function()
   dujiang_send=1
   return check_bei(dujiang_over)
end
dujiang_move=function()
   dujiang_send=1
   exe('e;e;w')
   return dujiang_dujiang()
end

jqgin=function()
   DeleteTriggerGroup("jqgin")
   create_trigger_t('jqgin1','^>*\\s*��Ҫ��ʲô��','','jqgin_look')
   create_trigger_t('jqgin2','^>*\\s*һҶС�ۣ�ƮƮ����������Ϫ����������ȥ��','','jqgin_jump')
   create_trigger_t('jqgin3','^>*\\s*�ֻ��������Ϫ�ĺ��оſ��ʯӭ����������������һ�㣬��ס������ȥ·��','','jqgin_out')
   --create_trigger_t('jqgin4','^>*\\s*�������������ȵ�վ����С��֮��','','jqglian')
   SetTriggerOption("jqgin1","group","jqgin")
   SetTriggerOption("jqgin2","group","jqgin")
   SetTriggerOption("jqgin3","group","jqgin")
   --SetTriggerOption("jqgin4","group","jqgin")
   road.temp=0
   exe('look boat')
   create_timer_s('walkWait111',1.0,'jqglook')    
end
jqglook=function()
   exe('look boat')
end
jqgin_look=function()
   EnableTimer('walkWait111',false)
   road.temp = road.temp + 1
   if road.temp > 20 then
      dis_all()
      check_heal()
      return
   end
    fastLocate()
	wait.make(function() 
          wait.time(1.0)
        if locl.room=="СϪ��" then
            exe('look boat')
			create_timer_s('walkWait111',1.0,'jqglook')   
        else
		    return go_locate()
	    end
    end)
end
jqgin_jump=function()
   EnableTimer('walkWait111',false)
   ---exe('jump boat')  
   wait.make(function()
       while true do
	       exe('jump boat;hug '..score.id)
		   local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
		   if l~=nil then break end
	   end
   end)
   
   --create_timer_s('walkWait111',0.5,'jqgin_jump')   
end
jqgin_out=function()
   EnableTriggerGroup("jqgin",false)
   exe('out')
   --thread_resume(walk)
   walk_wait()
end
jqgout=function()
   DeleteTriggerGroup("jqgout")
   create_trigger_t('jqgout1','^>*\\s*�����ű�����ô�ƶ�С�ۣ�','','jqgout_weapon')
   create_trigger_t('jqgout2','^>*\\s*�ֻ��������Ϫ�����ۣ�С�۾������˼�������ֻص�Ϫ�ߡ�','','jqgout_out')
   create_trigger_t('jqgout3','^>*\\s*��Ҫ��˭�����������','','jqgout_out')

   SetTriggerOption("jqgout1","group","jqgout")
   SetTriggerOption("jqgout2","group","jqgout")
   SetTriggerOption("jqgout3","group","jqgout")
   jqgout_weapon()
end
jqgout_weapon=function()
   weapon_unwield()
   exe('tui boat')
   check_halt(jgqout_jump)
end
jgqout_jump=function()
   ---exe('jump boat')
   wait.make(function()
       while true do
	       exe('jump boat;hug '..score.id)
		   local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
		   if l~=nil then break end
	   end
   end)
   
end
jqgout_out=function()
   EnableTriggerGroup("jqgout",false)
	DeleteTriggerGroup("jqgout")
   exe('out')
   --thread_resume(walk)
   walk_wait()
end
jqgzlin=function()
   DeleteTriggerGroup("jqgzlin")
   create_trigger_t('jqgzlin1','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','jqgzlin_goon')
   SetTriggerOption("jqgzlin1","group","jqgzlin")
   exe('nd')
   locate()
   check_halt(jqgzlin_con)
end
function jqgzlin_con()
   exe('alias action �뿪��������')
end
jqgzlin_goon=function()
   if locl.room~="����" then
      return jqgzlin_over()
   end
   local l_set={'east','west','south','north'}
   local l_cnt=math.random(1,table.getn(l_set))
   exe(l_set[l_cnt])
   exe('su;nd;wd')
   locate()
   checkWait(jqgzlin_con,2)
end
jqgzlin_over=function()
   EnableTriggerGroup("jqgzlin",false)
   DeleteTriggerGroup("jqgzlin")
   walk_wait()
end
jqgzlout=function()
   DeleteTriggerGroup("jqgzlout")
   create_trigger_t('jqgzlout1','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','jqgzlout_goon')
   SetTriggerOption("jqgzlout1","group","jqgzlout")
   exe('eu')
   locate()
   check_halt(jqgzlout_con)
end
function jqgzlout_con()
   exe('alias action �뿪��������')
end
jqgzlout_goon=function()
   if locl.room~="����" then
      return jqgzlout_over()
   end
   local l_set={'east','west','south','north'}
   local l_cnt=math.random(1,table.getn(l_set))
   exe(l_set[l_cnt])
   exe('wd;eu;su')
   locate()
   checkWait(jqgzlout_con,2)
end
jqgzlout_over=function()
   EnableTriggerGroup("jqgzlout",false)
   DeleteTriggerGroup("jqgzlout")
   walk_wait()
end

function outJjl()
   locate()
   check_halt(outJjl_check)
end
function outJjl_check()
   if locl.room~='������' and locl.room~='ɽ·' then
      return outJjl_over()
   else
      exe('yun jingli;yun qi;s')
      return outJjl()
   end
end
function outJjl_over()
   walk_wait()
end

function goHt()
	exe("ask gongsun zhi about �����")
	locate_finish='goHt_act'
	check_busy(locate)
end
function goHt_act()
      locate_finish=0
	exe("xian hua;zuan dao")
	walk_wait()
end

function outGb()
        locate()
	check_halt(outGb_check)
end
function outGb_check()
	if locl.room~="����" then
           return outGb_over()
	else
	   wait.make(function()
	      exe("#12s")
	      wait.time(1.5)
              return outGb()
           end)
	end
end
function outGb_over()
        exe('north')
        walk_wait()
end

function toQc()
        locate()
	check_halt(toQc_check)
end
function toQc_check()
	if locl.room~="ɳĮ" then
           return toQc_over()
	else
	   --wait.make(function()
	      exe("#5s;#5n")
	    --  wait.time(1.5)
              return toQc()
         --  end)
	end
end
function toQc_over()
        walk_wait()
end

---------------
-- ain ��Ĺ����
gmmsout=function()
   DeleteTriggerGroup("gmmsout")
   create_trigger_t('gmmsout1','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','gmmsout_goon')
   SetTriggerOption("gmmsout1","group","gmmsout")
   locate()
   exe('e;e;e;e;e;enter;s;s;s;s;s;enter;w;w;w;w;w;enter;n;n;n;n;n;enter')
   check_halt(gmmsout_con)
end
function gmmsout_con()
   locate()
   exe('alias action �뿪��������')
end
gmmsout_goon=function()
   if locl.room~="ʯ��" then
      exe('say �����߳�����')
      return gmmsout_over()
   end
   local l_set={'east','west','south','north'}
   local l_cnt=math.random(1,table.getn(l_set))
   exe(l_set[l_cnt])
   print(l_set[l_cnt])
   exe('get fire;enter;say �߲���ȥ...')
   locate()
   checkWait(gmmsout_con,2)
end
gmmsout_over=function()
   EnableTriggerGroup("gmmsout",false)
   DeleteTriggerGroup("gmmsout")
   walk_wait()
end

---------------
--------------by fqyy 20170502 ��ɼ�������㷨---------------
local ZslOutArea = {
	["��ɼ�֣���ˮ��----��ɼ��----��ɼ�֣���ɼ����ɼ��"] = {"w"},
	["��ɼ�֣������----��ɼ��----��ɼ�֣���ɼ����ɼ��"] = {"w;s;s;s"},
	["��ɼ�֣���ɼ��----��ɼ��----���������ɼ����ɼ��"] = {"e;s;s;s;e;e;e;e"},
	["��ɼ�֣���ɼ��----��ɼ��----�һ������ɼ����ɼ��"] = {"e;e;e;e;e"},
}
local ZslInArea = {
	["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = {"s","w","n","e"},
	["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = {"e","s","w","n"},
	["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = {"n","e","s","w"},
	["�����ţ�������----��ɼ��----�����ţ���������ɼ��"] = {"w","n","e","s"},
}
-------------by fqyy ���㷨 20170502
local ZslMen = 0
local ZslMenRun = false
function outzsl()
     
    fastLocate()
	return checkWait(outzsl_check,0.5)
end
function outzsl_check()
	ZslMenRun=false
	if locl.room=="��ɼ��" then
		tmpr={}
		tmpr=ZslOutArea[locl.room_relation]
		if tmpr~=nil then
			exe(tmpr[1])
			print("��ɼ�ֳ���·��"..tmpr[1])
			walk_wait()
		else
			exe("ne;w")
			return outzsl()
		end
	else
		walk_wait()
	end
end
function tianMen()
	mjMenF(1)
end
function diMen()
	mjMenF(2)
end
function fengMen()
	mjMenF(3)
end
function leiMen()
	mjMenF(4)
end
function mjMenF(namen)
	ZslMen=namen
	--ZslMenRun=false
	mjMen()
end
function mjMen()
	print("mjmen..........")
	fastLocate()
	ZslMenRun=true
	wait.make(function()
	   wait.time(0.5)
		return mjMen_checkF()
	end)
end
function mjMen_checkF()
	print("mencheckf")
	ZslMenRun=false
	mjMen_check()
end
function mjMen_check()
	if ZslMenRun then
		print("mencheck:"..locl.room.."|wait="..flag.wait.."|ZslMenRun=true")
	else
		print("mencheck:"..locl.room.."|wait="..flag.wait.."|ZslMenRun=false")		
	end
	if locl.room == "��ɼ��" then
		if flag.wait==0 then
			if not ZslMenRun then
				local tmpr={}
				tmpr=ZslInArea[locl.room_relation]
				if tmpr~=nil then
					exe(tmpr[ZslMen])
					print("�������·��"..tmpr[ZslMen])
				else
					exe("n")
				end
				return mjMen()
			end
		else
			ZslMenRun=false
		end
	else
		walk_wait()
	end
end
function djdh_open()                                                                             --���´򿪱���յĶɽ��ɺ�·��
	map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"]='dali/dalisouth/jiangbei'
	map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"]='dali/dalisouth/jiangnan'
	map.rooms["city/jiangbei"].ways["#duCjiang"]='city/jiangnan'		
	map.rooms["city/jiangnan"].ways["#duCjiang"]='city/jiangbei'
	map.rooms["lanzhou/road3"].ways["#duHhe"]='lanzhou/road2'
	map.rooms["lanzhou/road2"].ways["#duHhe"]='lanzhou/road3'
	map.rooms["lanzhou/dukou3"].ways["#duHhe"]='lanzhou/dukou2'		
	map.rooms["lanzhou/dukou2"].ways["#duHhe"]='lanzhou/dukou3'
	map.rooms["changan/road3"].ways["#duHhe"]='changan/road2'
	map.rooms["changan/road2"].ways["#duHhe"]='changan/road3'
	map.rooms["huanghe/road3"].ways["#duHhe"]='huanghe/road2'		
	map.rooms["huanghe/road2"].ways["#duHhe"]='huanghe/road3'
end
--------------------------------------------------------------
function outZyl()
   DeleteTriggerGroup("outzyl")
   create_trigger_t('outzyl1','^>*\\s*��� "action" �趨Ϊ "�뿪��Ҷ������" �ɹ���ɡ�','','outZylCheck')
   create_trigger_t('outzyl2','^>*\\s*���۵ð���������ҵ�����ȷ�ķ���','','outZyl_over')
   SetTriggerOption("outzyl1","group","outzyl")
   SetTriggerOption("outzyl2","group","outzyl")
   --exe('alias action �뿪��Ҷ������')
   cntr1 = countR(50)
   road.zyl = {}
   return outZylCheck()
end
function outZylCheck()
  DeleteTimer('outZyl')
   
    locate()
    return check_halt(outZyl_goon,0.4)
end
function outZyl_goon()
   if locl.room~="��Ҷ��" then
      return go(road.act)
   end
   road.zyl = road.zyl or {}
   if countTab(road.zyl)==0 then
      road.zyl["#15e"] = true
	  road.zyl["#15s"] = true
	  road.zyl["#15w"] = true
	  road.zyl["#15n"] = true
   end
   for p in pairs(road.zyl) do
       tmp.zyl = p
	   road.zyl[p] = nil
       exe('halt;ne')
       exe(p)
          create_timer_s('outZyl',2,'outZylTimer')
       return exe('alias action �뿪��Ҷ������')
   end
end
function outZylTimer()
    exe('alias action �뿪��Ҷ������')
end
function outZyl_over()
   EnableTriggerGroup("outzyl",false)
   DeleteTimer('outZyl')
   road.zyl = {}
   road.zyl[tmp.zyl] = true
   walk_wait()
end

function dmd()
    if not tmp.dmd then
	   tmp.dmd = true
	   exe("s;w;n;nw;n")
	else
	   exe('nw;w;e;e;s;w;n;nw;n')
	end
	locate()
	check_halt(dmd_check)
end
function dmd_check()
	if locl.room ~= "����" then
	   return dmd_over()
	else
	   wait.make(function()
	      wait.time(1)
	      return dmd()
	   end)
	end
end
function dmd_over()
        walk_wait()
end

function toXcm()
	weapon_unwield()
	weaponWieldCut()
	exe("zhan tielian")
    return check_halt(toXcm_jump)
end
function toXcm_jump()
	exe("jump duimian")
	return check_halt(toXcm_over)
end
function toXcm_over()
    weapon_unwield()
    return walk_wait()
end

function outTlsSsl()
        exe("s;w;s;w")
	exe("#11 s")
	locate()
	return check_halt(outTlsSsl_check,1)
end
function outTlsSsl_check()
	if locl.room ~= "������" and locl.room ~= "ʯ��·" then
	   return outTlsSsl_over()
	else
	   return outTlsSsl()
	end
end
function outTlsSsl_over()
    return walk_wait()
end

function hmyUp()
    jifaDodge()
    exe('zong')
        locate_finish='hmyUpLocate'
	return check_busy(locate)
end
function hmyUpWait()
    exe('yun qi;dazuo '..hp.dazuo)
    check_busy(hmyUp)
end
function hmyUpLocate()
        locate_finish=0
	return check_halt(hmyUpCheck,1)
end
function hmyUpCheck()
        if locl.room ~= "����ƺ" then
	   return hmyUpOver()
	else
	   return hmyUpWait()
	end
end
function hmyUpOver()
    return walk_wait()
end

function hmyDown()
    jifaDodge()
    exe('zong')
	locate_finish='hmyDownLocate'
	check_busy(locate,1.0)
end
function hmyDownLocate()
        locate_finish=0
	return check_halt(hmyDownCheck,1)
end
function hmyDownCheck()
        if locl.room ~= "�¶�" then
	   return hmyDownOver()
	else
	   return hmyDownWait()
	end
end
function hmyDownWait()
    exe('yun qi;dazuo '..hp.dazuo)
    check_busy(hmyDown)
end
function hmyDownOver()
    return walk_wait()
end

function toRyp()
    tmp.cnt=0
        DeleteTriggerGroup("whisper_jiabu")
        create_trigger_t('whisper_jiabu1',"^(> )*��Ҫ��˭���",'','jiabudie')
        SetTriggerOption("whisper_jiabu1","group","whisper_jiabu")
	exe("whisper bu �����ĳ���£�һͳ����")
	exe("whisper bu ����ǧ�����أ�һͳ����")
	exe("whisper bu ��������Ϊ������������")
	exe("whisper bu ������ּӢ���������Ų�")
	exe("whisper bu �����������£��츣����")
	exe("whisper bu ����ս�޲�ʤ�����޲���")
	exe("whisper bu ��������ĳ���¡�����Ӣ��")
	exe("whisper bu ��������ʥ�̣��󱻲���")
	exe("wu")
    return walk_wait()
end
function jiabudie()
        if tmp.cnt then
           tmp.cnt = tmp.cnt + 1
        end
        if not tmp.cnt or tmp.cnt>30 then
           tmp.cnt=0
           dis_all()
           if job.name=='wudang' then return wudangFindFail() end
           if job.name=='huashan' then return huashanFindFail() end
           if job.name=='xueshan' then return xueshanFindFail() end
           if job.name=='songxin' or job.name=='songxin2' then return songxinFindFail() end
        end
end
-------------------��ü��ɽС·--------------
function emhsxl()
exe('move gancao;zuan dong')
return check_busy(check_hsxl,1)
end
function check_hsxl()
locate()
return walk_wait()
end
---------by fqyy test ���Һ�ɽ��ľ��-------------
function emeishuitan()
	exe('set look;l;pa up')
	check_busy(walk_wait)
end
function outemgmc()
   DeleteTriggerGroup("outemgmc")
   create_trigger_t('outemgmc1','^>*\\s*��� "action" �趨Ϊ "�뿪���ҹ�ľ������" �ɹ���ɡ�','','outemgmcCheck')
   create_trigger_t('outemgmc2','^>*\\s*�������߳��˹�ľ�ԡ�','','outemgmc_over')
   SetTriggerOption("outemgmc1","group","outemgmc")
   SetTriggerOption("outemgmc2","group","outemgmc")
   cntr1 = countR(50)
   locate_finish='outemgmcCheck'
   return check_busy(locate)
end
function outemgmcCheck()
  locate_finish=0
    wait.make(function() 
       wait.time(2)
        locate()
        return check_busy(outemgmc_goon,1)
    end)
end
function outemgmc_goon()
   if locl.room~="��ľ��" then
      return go(road.act)
   end
   road.zyl = road.zyl or {}
   if countTab(road.zyl)==0 then
      road.zyl["yun jingli;ne;ne;ne;ne;ne;ne;ne;ne;ne;yue qiaobi"] = true
   end
   for p in pairs(road.zyl) do
       tmp.zyl = p
	   road.zyl[p] = nil
       exe('halt;ne')
       exe(p)
       return exe('alias action �뿪���ҹ�ľ������')
   end
end
function outemgmc_over()
   EnableTriggerGroup("outemgmc",false)
   road.zyl = {}
   walk_wait()
end
function Toghz()
    weapon_unwield()
    exe("get axe;unwield xiao;wield axe;wield sword;wield dao;kan guanmu;drop axe")
	if score.party and score.party=='������' and score.master=='�º���' then
		exe("ed;yue qiaobi")
	end
    return walk_wait()
end
---------by fqyy test �䵱��ɽé��---------------
function Wdmw()
        DeleteTriggerGroup("inwdmw")
        create_trigger_t('inwdmw1','^(> )*����û������ˡ�','','Wdmw_error')
        create_trigger_t('inwdmw2','^(> )*�����ҩ���������йء�ҩ�䡻����Ϣ��','','Wdmw_find')
        SetTriggerOption("inwdmw1","group","inwdmw")
        SetTriggerOption("inwdmw2","group","inwdmw")
    exe("w;d;nd;nd;nd;nd;nw;ask caiyao about ҩ��")
    if flag.find==1 then return end

        return check_bei(Wdmw1)
end
function Wdmw_error()
        DeleteTriggerGroup("inwdmw")
    exe("se;su;su;su;su;pa up")
    if flag.find==1 then return end

        return walk_wait()
end
function Wdmw_find()
    -- return check_bei(Wdmw1)
    wait.make(function()  --2019.1.13
            wait.time(1.0)
        return check_bei(Wdmw1)
    end)
end
function Wdmw1()
    if flag.find==1 then return end
        exe("ask caiyao about ֻ��")
    -- return check_bei(Wdmw2) 
    wait.make(function()  --2019.1.13
            wait.time(1.0)
        return check_bei(Wdmw2)
    end)
end
function Wdmw2()
    DeleteTriggerGroup("inwdmw")
    exe("w;nd;nd;nd;nd;n;n;nd;out;nd;nd;nd;ed;nd;nd;nu;nd;nd;ed;nd;ed;nd;nd;nd;nd;nd;e;se")
    if flag.find==1 then return end
        return Wdmw3()
    end
function Wdmw3()
        wait.make(function() 
                wait.time(1.2) --Wdmw2 exe����28��ָ��
        exe("ask tao hua about rumor")
        if flag.find == 1 then return end --���
        
        -- return Wdmw4()
        wait.make(function()  --2019.1.13
            wait.time(1.0)
            return check_bei(Wdmw4)
        end)

    end)
end
function Wdmw4()        
    exe("nw;w;su;su;su;su;su;wu;su;wu;su;su;sd;su;su;wu;su;su;su;enter;su;s;s")
    if flag.find == 1 then return end --���
    return Wdmw5()
end
function Wdmw5()
        wait.make(function() 
        wait.time(1) -- 2019.1.13 Wdmw4 23��ָ������1s
        exe("su;su;su;su;e;se;su;su;su;su")
        if flag.find == 1 then return end --���
                return Wdmw6()
        end)
end
function Wdmw6()
        wait.make(function()
        wait.time(1.0) -- 2019.1.13 Wdmw5 9��ָ������0.4s
        exe("pa up;e")
        if flag.find == 1 then return end --���
                return Wdmw7()
        end)
end
function Wdmw7()
        wait.make(function()
        wait.time(1.0) -- 2019.1.13 Wdmw5 1��ָ������0.4s zuan shulin���Դ�Խ��ע��
        exe("zuan shulin")
                return check_busy(walk_wait)
        end)
end
function emxxc()
     exe('stop')
    wait.make(function()
        wait.time(5)
	exe("ed")
	return checkWait(walk_wait,3)
	end)
end
function tggc()
wait.make(function()
        wait.time(7)
	exe("northwest")
	return check_busy(walk_wait)
	end)
end
function sldroad()
wait.make(function()
        wait.time(1)
	exe("southdown")
	return walk_wait()
	end)
end
function dmy1()
    exe("n")
fastLocate()
walk_wait()
end
--------------by fqyy�䵱��ɽ����----------------
function OutWdhs()
	wait.make(function() 
		wait.time(1.0)
		exe("halt;eu")
		return OutWdhs1()
    end)
end
function OutWdhs1()
	wait.make(function() 
		wait.time(1.0)
		exe("halt;su")
		return OutWdhs2()
    end)
end
function OutWdhs2()
	wait.make(function() 
		wait.time(1.0)
		exe("halt;nd;nd;")
		return OutWdhs3()
    end)
end
function OutWdhs3()
	wait.make(function() 
		wait.time(1.0)
		exe("halt;su;wd;wd")
		return walk_wait()
    end)
end
-----------------by fqyy �䵱��ɽ���ִ���------
function inWdcl()
	exe("hold teng;jump down")
	return walk_wait()
end
local wdclorder={
	["�һ����"]=1,
	["��Ҷ����"]=2,
	["��ѩ����"]=3,
	["��Ҷ����"]=4,
	["���ֱ�Ե"]=5,
}
local wdclOutDoorCmd={"nw","n","ne","w","look","e","sw","s","se"}
local wdclOutAreaNum={1,9,17,31,42,53,67,75,83}
local tt_step=1
local wdclCurrentRoom=""

function outWdcllh()
	wdclCurrentRoom="�һ����"
	flag.times=2
	tt_step=1
	outWdcl1()
end
function outWdclly()
	wdclCurrentRoom="��Ҷ����"
	tt_step=1
	outWdcl1()
end
function outWdcljx()
	wdclCurrentRoom="��ѩ����"
	tt_step=1
	outWdcl1()
end
function outWdclky()
	wdclCurrentRoom="��Ҷ����"
	tt_step=1
	outWdcl1()
end
function outWdcl1()
	fastLocate()
	return checkWait(outWdclCheck0,1)
end
function outWdclCheck0()
	return check_halt(outWdclCheck)
end
function outWdclCheck()
	if not wdclorder[locl.room] then
		return walk_wait()
	end
	local p,n,randomN,findRoomN
	local wdclOutDoor={
	}
	--print(dest.room)
	if dest.room~="�һ����" and dest.room~="��Ҷ����" and dest.room~="��ѩ����" and dest.room~="��Ҷ����" and dest.room~="���ֱ�Ե" then
		tt_step=6 
	end
	wdclOutDoor[1]={}
	wdclOutDoor[2]={}
	wdclOutDoor[3]={}
	wdclOutDoor[4]={}
	wdclOutDoor[5]={}
	--print(tt_step,locl.room,wdclCurrentRoom)
	if not (wdclorder[wdclCurrentRoom]<wdclorder[locl.room]) then
		if flag.wait==0 then
			for i=1,9 do
				if i~=5 then 
					p=string.sub(locl.room_relation,wdclOutAreaNum[i],wdclOutAreaNum[i]+7)
					--print(p)
					table.insert(wdclOutDoor[wdclorder[p]],wdclOutDoorCmd[i])
				end
			end
			if tt_step<6 then
				findRoomN=wdclorder[locl.room]
			else 
				findRoomN=wdclorder[locl.room]+1
			end
			randomN=table.getn(wdclOutDoor[findRoomN])
			tt_step=tt_step+1
			if randomN~=nil and randomN>0 then
				dn=math.random(randomN)
				print("�����䵱��ɽ���ֳ���Ϊ"..wdclOutDoor[findRoomN][dn].."���Ҵ���="..flag.times)
				exe(wdclOutDoor[findRoomN][dn])
			else
				findRoomN=findRoomN-1
				randomN=table.getn(wdclOutDoor[findRoomN])
				dn=math.random(randomN)
				print("�����䵱��ɽ����û�г���ԭ������ƶ�"..wdclOutDoor[findRoomN][dn].."���Ҵ���="..flag.times)
				exe(wdclOutDoor[findRoomN][dn])
			end
			return outWdcl1()
		end
	else
		return walk_wait()
	end
end
function wdclToHsda()
	exe("jump river")
	DeleteTriggerGroup("wdclToHsda")
    create_trigger_t('wdclToHsda1','^>*\\s*���沨���������ڷ����˰��ߣ�����ʪ�����������˺�ˮ������','','wdclToHsda2')
	SetTriggerOption("wdclToHsda1","group","wdclToHsda") 
    EnableTriggerGroup("wdclToHsda",true)
end
function wdclToHsda2()
	EnableTriggerGroup("wdclToHsda",false)
	DeleteTriggerGroup("wdclToHsda")
	return walk_wait()
end

--------------------------------------------
function Togudi()
    exe('cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;cuo shupi;bang song;pa down')
    locate()
    return check_busy(Goyadi,1)
end
function Goyadi()
    if string.find(locl.room,'�ȵ�') then
    return walk_wait()
       elseif string.find(locl.room,'�±�') then
       		exe("pa down")
    	locate()
    return check_busy(Goyadi,1)
	end
end
function Toqiaobi()
    exe('pa yabi')
    locate()
    return check_busy(Goqiaobi,1)
end
function Goqiaobi()
    if string.find(locl.room,'�ͱ�') then
    return walk_wait()
       elseif string.find(locl.room,'�±�') then
       		exe("pa up")
    	locate()
    return check_busy(Goqiaobi,1)
	end
end

function Totanan()
    DeleteTriggerGroup("qqs")
    create_trigger_t('qqs1','^>*\\s*��Ҫ������Ǳ��$','','qQydok')
    create_trigger_t('qqs2','^>*\\s*�����������������޷�������Ǳ!$','','qQyderorr')
        create_trigger_t('qqs3','^>*\\s*��һ�����ԣ�Ǳ����ȥ��$','','jgq_qiandown')
    SetTriggerOption("qqs1","group","qqs") 
    SetTriggerOption("qqs2","group","qqs") 
        SetTriggerOption("qqs3","group","qqs") 
    EnableTriggerGroup("qqs",true)    
        exe('#10(jian shi)')
        checkBags()
        return checkWait(jqg_checktiaotan,2)
end
function jqg_checktiaotan()
            if not Bag["ENCB"] then--��һ����Ϊ��checkbagsû��ɸ�ENCB��ֵ��ǿ�Ƹ������岢��ֵ�������±߳����޷��������У�����֮ǰ��ENCB������
            Bag = Bag or {}
        Bag["ENCB"] = {}
        Bag["ENCB"].value = 81
            end
        if Bag["ENCB"].value and Bag["ENCB"].value > 100 then
                exe('#5(drop stone)')
                checkBags()
                return checkWait(jqg_checktiaotan,1)
        elseif Bag["ENCB"].value > 80 then
                exe('tiao tan')
                return jgq_qiandown()
        else
                exe('#3(jian shi)')
                checkBags()
                return checkWait(jqg_checktiaotan,1)
        end
end
function jgq_qiandown()
        check_busy(function() exe('qian down') end,1)
end
function jqg_qianup()
        check_busy(function() exe('qian up') end,1)
end

function qQyderorr()
        EnableTriggerGroup("qqs",false)          
        check_halt(qQyderorrgetstone)
end
function qQyderorrgetstone()
        exe('pa up;#2(jian shi)')
        EnableTriggerGroup("qqs",true)  
        checkBags()
        return checkWait(jqg_checktiaotan,2)
end
function qQydok()
    DeleteTriggerGroup("qqs")            
        checkBags()
        checkWait(qQyd_dropstone,2)                
end

function qQyd_dropstone()
        if not Bag["ENCB"] or not Bag["ENCB"].value then
                exe('#25(drop stone)')
        else
                if Bag['��ʯ��'] and Bag['��ʯ��'].cnt then 
                        exe('#' .. Bag['��ʯ��'].cnt .. '(drop da shikuai)')                
                end
                if Bag['����ʯ'] and Bag['����ʯ'].cnt then 
                        exe('#' .. Bag['����ʯ'].cnt .. '(drop e luanshi)')                
                end
                if Bag['Сʯͷ'] and Bag['Сʯͷ'].cnt then 
                        exe('#' .. Bag['Сʯͷ'].cnt .. '(drop xiao shitou)')                
                end        
        end
        return checkBags(totanan_check_qqup)        
end
function totanan_check_qqup()        
        create_trigger_t('qqs1','^>*\\s*�����ӳ��أ��þ�ȫ��Ҳ�޷���������ȥ��$','','totanan_check_qqup')                
        create_trigger_t('qqs2','^>*\\s*����������һ�ţ������Ϸ���ȥ��$','','qQup')        
        create_trigger_t('qqs3','^>*\\s*��Ҫ������Ǳ��$','','Hyadi')        
        SetTriggerOption("qqs1","group","qqs") 
    SetTriggerOption("qqs2","group","qqs") 
        SetTriggerOption("qqs3","group","qqs") 
        exe('#5(drop stone);qian zuoshang')                        
end

function qQup()
        check_busy(function() exe('qian up') return check_busy(qQsover) end,1)
end

function qQsover()
        DeleteTriggerGroup("qqs")
    exe("pa up")
    exe("#5(drop stone)")
        return walk_wait()
end
function Hgudi()    
        DeleteTriggerGroup("qqs")
    create_trigger_t('qqs1','^>*\\s*��Ҫ������Ǳ��$','','Hyadi')
    create_trigger_t('qqs2','^>*\\s*�����������������޷�������Ǳ!$','','qQyderorr')
        create_trigger_t('qqs3','^>*\\s*��һ�����ԣ�Ǳ����ȥ��$','','jgq_qiandown')
    SetTriggerOption("qqs1","group","qqs") 
    SetTriggerOption("qqs2","group","qqs") 
        SetTriggerOption("qqs3","group","qqs") 
    EnableTriggerGroup("qqs",true)    
        exe('#10(jian shi)')
        checkBags()
        return checkWait(jqg_checktiaotan,2)
end

function Hyadi()
        DeleteTriggerGroup("qqs")
        checkBags()
        check_busy(hhq_dropstone,1)
end
function hhq_dropstone()
        if not Bag["ENCB"] or not Bag["ENCB"].value then
                exe('#25(drop stone)')
        else
                if Bag['��ʯ��'] and Bag['��ʯ��'].cnt then 
                        exe('#' .. Bag['��ʯ��'].cnt .. '(drop da shikuai)')                
                end
                if Bag['����ʯ'] and Bag['����ʯ'].cnt then 
                        exe('#' .. Bag['����ʯ'].cnt .. '(drop e luanshi)')                
                end
                if Bag['Сʯͷ'] and Bag['Сʯͷ'].cnt then 
                        exe('#' .. Bag['Сʯͷ'].cnt .. '(drop xiao shitou)')                
                end        
        end        
        return checkBags(Hyadiup)        
end
function Hyadiup()        
        DeleteTriggerGroup("qqs")
        create_trigger_t('qqs1','^>*\\s*�����ӳ��أ��þ�ȫ��Ҳ�޷���������ȥ��$','','Hyadiup')                
        create_trigger_t('qqs2','^>*\\s*��(��������һ�ţ������渡ȥ|�ֽ��뻮��˳��ˮ�������渡ȥ)','','jqg_qianup')        
        create_trigger_t('qqs3','^>*\\s*��Ҫ������Ǳ��$','','hhqover')        
        SetTriggerOption("qqs1","group","qqs") 
    SetTriggerOption("qqs2","group","qqs") 
        SetTriggerOption("qqs3","group","qqs")         
        exe('#5(drop stone);qian up')                        
end

function hhqover()
        exe('#5(drop stone);pa up')        
        DeleteTriggerGroup("qqs")
        return walk_wait()
end
----------����ȴ�����ֹ----------------
function Fqy()
    exe("enter")
return walk_wait()
end
function Inwdj()
    exe("northup")
return walk_wait()
end
---------by fqyy test �������߿�----------
--[[
function Insldsk()
	exe("#10(kan ɽ��);climb")
	return walk_wait()
end]]--

function Insldsk()
    wait.make(function()
	    SetSpeedWalkDelay(30)
	    exe("#10(kan ɽ��);climb")
		wait.time(2)
		wait_busy()
		SetSpeedWalkDelay(0)
	    return walk_wait()
	end)
end
--[[
function Outsldsk()
	exe("drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi;wear all;go east;go east;go east;go east")
	return walk_wait()
end
]]--
function Outsldsk()
    wait.make(function()
	    SetSpeedWalkDelay(30)
	    exe("drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi;drop shenlong pi")
		wait.time(1)
		exe("wear all;go east;go east;go east;go east")
		wait.time(1)
		wait_busy()
		SetSpeedWalkDelay(0)
	    return walk_wait()
	end)
end

------------------------------------------
function boatYell()
    exe("yell boat;;enter")
	locate()
	tmp.cnt = 0
	DeleteTimer('boat')
	create_timer_s('boat',3,'boatInCheck')
end
function boatInCheck()
    DeleteTimer('boat')
	exe('yell boat;enter')
    if string.find(locl.room,'��') or string.find(locl.room,'��') then
	   return boatWait()
	elseif string.find(locl.room,'������') then
		exe('south;#3w;#2e;#3s;qu xiaozhu')
	   --locate()
	   fastLocate()
	   return create_timer_s('boat',3,'boatInCheck')
	elseif string.find(locl.room,'����') or string.find(locl.room,'С����') then
	   --locate()
	   fastLocate()
	   return create_timer_s('boat',3,'boatInCheck')
	else
	   return go(road.act)
        end
 end
function boatWait()
    boat_out_flag=0
	DeleteTimer('boat')
	boatOutTrigger()
	create_timer_s('boat',20,'boatCheck')
end
function CboatWait()
    boat_out_flag=0
	DeleteTimer('boat')
	create_timer_s('boat',10,'Checkloboat')
end
function Checkloboat()
	DeleteTimer('boat')
	--locate()
	fastLocate()
	create_timer_s('boat',2,'Checkboat')
end
function Checkboat()
    if string.find(locl.room,'��') or string.find(locl.room,'��') then
	   return boatCheck()
	elseif string.find(locl.room,'����') then
	   exe('qu xiaozhu')
	   return create_timer_s('boat',3,'Checkloboat')
	else
	   return go(road.act)
        end
end
function boatCheck()
        DeleteTimer('boat')
		flag.idle = nil
	    --locate()
	    fastLocate()
	  --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
	return check_halt(boatOutCheck)
end
function boatReCheck()
       if boat_out_flag==1 then return end 
        DeleteTimer('boat')
	boatOutTrigger()
	create_timer_s('boat',2,'boatCheck')
end
function boatOutCheck()
       if boat_out_flag==1 then return end 
        print('boatOutCheck......')
        DeleteTimer('boat')
        local cnt=table.getn(exit.locl)
	if cnt==0 then
	   check_halt(boatReCheck)
	else
	   return boatOut()
	end
end
function boatOutTrigger()
    DeleteTriggerGroup("boat")
    create_trigger_t('boat1','^(> )*(�����С�ۿ��ڰ��ߣ����´��ɡ�|����˵���������ϰ��ɡ����漴��һ��̤�Ű���ϵ̰���|���ڵ���С���ߣ������С�ۿ��ڰ��ߣ����´��ɡ�|���ڵ��˰��ߣ������С�ۿ��ڰ��ߣ����´��ɡ�)','','boatOut')
	SetTriggerOption("boat1","group","boat")  
end
function boatOut()
    boat_out_flag=1
    print('boatOut..........')
    EnableTimer('boat',false)
    DeleteTimer('boat')
        exe("out;bei none")
		---locate()
		fastLocate()
		bqcheck()
		beiUnarmed()
        walk_wait()
end

function outJgzW()
    return outJgz()
end
function outJgzE()
    return outJgz()
end 
function outJgz()
    DeleteTriggerGroup("jiugz")
    create_trigger_t('jiugz1','^>*\\s*����һƬï�ܵ��һ��ԣ���һ�߽�������ʧ�˷��򡣵�����(\\D*)���һ�\\(taohua\\)��$','','outJgzGet')
    create_trigger_t('jiugz2','^>*\\s*����һƬï�ܵ��һ��ԣ���һ�߽�������ʧ�˷��򡣵���һ���һ�\\(taohua\\)Ҳû�С�$','','outJgzGo')
    SetTriggerOption("jiugz1","group","jiugz") 
    SetTriggerOption("jiugz2","group","jiugz")
    EnableTriggerGroup("jiugz",false)
    exe('w;w;n;n')
    return outJgzTaohua(1)
end
function outJgzTaohua(p_cnt)
    if p_cnt then tmp.i=p_cnt else tmp.i=tmp.i+1 end
    if tmp.i==2 then exe('e') end
    if tmp.i==3 then exe('e') end
    if tmp.i==4 then exe('s') end
    if tmp.i==5 then exe('w') end
    if tmp.i==6 then exe('w') end
    if tmp.i==7 then exe('s') end
    if tmp.i==8 then exe('e') end
    if tmp.i==9 then exe('e') end
	if tmp.i==10 then
	   return outJgzDrop()
	end
	EnableTriggerGroup("jiugz",true)
    exe('look')
end
function outJgzGet(n,l,w)
    EnableTriggerGroup("jiugz",false)
    exe('get '.. trans(w[1]) .. ' taohua')
    return check_halt(outJgzTaohua)
end
function outJgzGo()
    EnableTriggerGroup("jiugz",false)
    return check_halt(outJgzTaohua)
end
function outJgzDrop()
    exe('w;w;n;n')
    exe('drop 2 taohua')
	exe('e')
	exe('drop 9 taohua')
	exe('e')
	exe('drop 4 taohua')
	exe('s')
	exe('drop 3 taohua')
	exe('w')
	exe('drop 5 taohua')
	exe('w')
	exe('drop 7 taohua')
	exe('s')
	exe('drop 6 taohua')
	exe('e')
	exe('drop 1 taohua')
	exe('e')
	exe('drop 8 taohua')
	locate()
	return check_halt(outJgzCheck)
end
function outJgzCheck()
    if locl.room=="�Ź��һ���" then
	   return outJgz()
	else
	   return outJgzOver()
	end
end
function outJgzOver()
    EnableTriggerGroup("jiugz",false)
	DeleteTriggerGroup("jiugz")
	return walk_wait()
end

function wdYmout()
     DeleteTriggerGroup("wdxj")
	 DeleteTimer("wdxjTimer")
	 local wdxj_path = {'s','s','e','e','w','w','n','n',}
	 wait.make(function()
	     wait.time(2)
		 for i,p in pairs(wdxj_path) do
		    if flag.find==1 then return end
			while true do
			   exe(p)
			   exe('hug '..score.id)
			   local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			   if l~=nil then break end
			   wait.time(1)
			end
		 end
		 return check_bei(walk_wait)		 
	 end)
end


function wdYm()
    DeleteTriggerGroup("wdxj")
    create_trigger_t('wdxj1','^>*\\s*��վ��С���ϣ����ܴ������·𿴼�(\\D*)����Щ���⡣$','','wdYmGo')
    SetTriggerOption("wdxj1","group","wdxj")
	flag.idle=nil
    exe('s')
    locate()
    check_halt(wdYmCheck)
    tmp.i=1
end
function wdYmCheck()
    DeleteTimer("wdxjTimer")
    if locl.room~="С��" then
       return wdYmOver()
    end
    create_timer_s('wdxjTimer',16,'wdYmRandom')
end
function wdYmRandom()
    tmp.i=tmp.i+1
    exe('n;n;n;n;n;n;n;n;n;s;s;s;s;s;s')
    fastLocate()
    wait.make(function() 
		wait.time(1.0)
		check_halt(wdYmCheck)
	end)    
end
function wdYmGo(n,l,w)
	if flag.wait==0 then
		local l_dir
		DeleteTimer("wdxjTimer")
		if w[1]=="��" then l_dir='e' end
		if w[1]=="��" then l_dir='w' end
		if w[1]=="��" then l_dir='s' end
		if w[1]=="��" then l_dir='n' end
		exe("halt;"..l_dir)
		fastLocate()
                flag.idle=nil
		wait.make(function() 
			wait.time(1.0)
			check_halt(wdYmCheck)
		end)    
	end
end
function wdYmOver()
    DeleteTimer("wdxjTimer")
    EnableTriggerGroup("wdxj",false)
    walk_wait()
end
----------by fqyy 20170504 ������������----------------
local mjslOutArea = {
	["���֣�����-----����-----���֣����������"] = "s",
	["���֣������-----����-----���֣���������"] = "w",
	["�����������-----����-----���֣���������"] = "n",
	["���֣�����-----����-----���������������"] = "e",
}
local mjslOutArea1 ={
	["���֣�����-----����-----��ľ�����������"] = true,
}
local mjslOutArea4 ={
	["���֣���ľ��-----����-----���֣����������"] = true,
}
local mjslOutAreaFlag=1;
function mjSlout1()
	mjslOutAreaFlag=1
	mjSlout()
end
function mjSlout4()
	mjslOutAreaFlag=4
	mjSlout()
end
function mjSlout()
    fastLocate()
    wait.make(function() 
		wait.time(0.5)
		check_halt(mjSloutCheck)
	end)
end
function mjSloutCheck()
	if flag.wait==0 then
		if locl.room=="����" then
			if mjslOutArea1[locl.room_relation] then
				if mjslOutAreaFlag==1 then
					exe("s")
				else
					exe("e;e;n")
				end
				return mjSlout()
			end
			if mjslOutArea4[locl.room_relation] then
				if mjslOutAreaFlag==4 then
					exe("n")
				else
					exe("w;w;s")
				end
				return mjSlout()
			end
			local tmpsl=mjslOutArea[locl.room_relation]
			if tmpsl~=nil then
				exe(tmpsl)
				print("�������ֳ���"..tmpsl)
			end
			return mjSlout()
		else
			walk_wait()
		end
	end
end

---------------------------------------------

function PoutShangguan()
    print('PoutShangguan.........')
    DeleteTriggerGroup("tiezhangsg")
    create_trigger_t('tiezhangsg1','^(> )*��������������������˿�������Ĺ�������������ƿ���','','ShangguanOk')
	create_trigger_t('tiezhangsg2','^(> )*���в�ѽ��û����Ĺ����ʲô����','','ShangguanAsk')
	create_trigger_t('tiezhangsg3','^(> )*��һЩ����˵�����������������ϵķ�Ĺ�У������������ٺ٣�һ����ʲô���������棡','','GoShangguan')
	create_trigger_t('tiezhangsg4','^(> )*����û������ˡ�','','GoShangguanQiuError')
	create_trigger_t('tiezhangsg5','^ʲô?$','','ShangguanWalkError')
	
	SetTriggerOption("tiezhangsg1","group","tiezhangsg")
    SetTriggerOption("tiezhangsg2","group","tiezhangsg")
    SetTriggerOption("tiezhangsg3","group","tiezhangsg")
    SetTriggerOption("tiezhangsg4","group","tiezhangsg")
	SetTriggerOption("tiezhangsg5","group","tiezhangsg")
	
    EnableTriggerGroup("tiezhangsg",false)
    --return check_busy(GoShangguan)
	---exe("move bei")
	
	--locate_finish='PoutShangguan_confirm'
	--return fastLocate()
	locate_finish=0
	fastLocate()
	return checkWait(PoutShangguan_confirm,1)
	
end

function PoutShangguan_confirm()
    --locate_finish=0
    print('PoutShangguan_confirm............')
    if locl.room=='������' then 
	    EnableTriggerGroup("tiezhangsg",true)
		SetSpeedWalkDelay(30)
	    exe("move bei")
	else
	    --return go(PoutShangguan_confirm,'����ɽ','������')
		return go(road.act)
	end  
end

function ShangguanAsk()
    wait.make(function()
	    wait.time(1)
	    exe("sd;se;sd;sd")
		wait.time(1)
		exe("se;sd;se;sd")
		wait.time(1)
		exe("sd;s;s;s;sd")
		wait.time(1)
		exe("e;ask qianzhang about �ֹ�")
	end)
	---exe("sd;se;sd;sd;se;sd;se;sd;sd;s;s;s;sd;e;ask qianzhang about �ֹ�")
end
function GoShangguan()
	return check_halt(GoShangguanOk)
end
function GoShangguanOk()
     wait.make(function()
	    wait.time(1)
	    exe("sd;sd;n;n;nw")
		wait.time(1)
		exe("w;w;e;nu;n;n;n")
		wait.time(1)
		exe("nu;nu;nw;nu;nw")
		wait.time(1)
		exe("nu;nu;nw;nu;move bei")
	end)
	--exe("sd;sd;n;n;nw;w;w;e;nu;n;n;n;nu;nu;nw;nu;nw;nu;nu;nw;nu;move bei")
end
function GoShangguanQiuError()
	EnableTrigger("tiezhangsg4",false)
	wait.make(function()
	    wait.time(1)
	    exe("se;ask qianzhang about �ֹ�")
		wait.time(1)
		exe("nw;w;ask qianzhang about �ֹ�")
		wait.time(1)
		exe("w;ask qianzhang about �ֹ�")
		wait.time(1)
		exe("e;nu;ask qianzhang about �ֹ�")
		wait.time(1)
		exe("sd;s;ask qianzhang about �ֹ�;n;e")
	end)
	
	--exe("se;ask qianzhang about �ֹ�;nw;w;ask qianzhang about �ֹ�;w;ask qianzhang about �ֹ�;e;nu;ask qianzhang about �ֹ�;sd;s;ask qianzhang about �ֹ�;n;e")
end
function ShangguanOk()
    print('ShangguanOk............')
	EnableTriggerGroup("tiezhangsg",false)
	DeleteTriggerGroup("tiezhangsg")
    --exe('move bei;enter')
	exe('enter')
	--SetSpeedWalkDelay(speed_walk_delay)
    return walk_wait()
end

function ShangguanWalkError()
   print('ShangguanWalkError.............')
   EnableTriggerGroup("tiezhangsg",false)
   DeleteTriggerGroup("tiezhangsg")
   --SetSpeedWalkDelay(speed_walk_delay)
   return walk_wait()
end 


function ptoSld()
    exe('yell ������鸣����')
    checkWait(ptoSldCheck,2)
end
function ptoSldCheck()
   flag.idle = nil
    locate()
	 --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
    check_halt(ptosldDukou,2)
end
function ptosldDukou()
    if locl.room=="�ɿ�" then
       return toSldOver()
    elseif locl.room~="����" then
	return walk_wait()
    else
       return checkWait(ptoSldCheck,2)
    end
end
sld_unwield=function()
    print('sld_unwield....')
    for p in pairs(Bag) do
	--print('sld_unwield...,p:'..p)
      if Bag[p].kind and (not itemWield or itemWield[p]) then
       local _,l_cnt = isInBags(Bag[p].fullid)
	   --print('sld_unwield..l_cnt:'..l_cnt)
       for i = 1,l_cnt do
           exe('unwield '.. Bag[p].fullid ..' '..i)
       end
    end
  end
end
sld_weaponWieldCut=function()
    exe('uweapon shape fengyun sword')
    for p in pairs(Bag) do
	--print('bag name..:'..p)
      if Bag[p].kind and weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind]=="cut" then
	  --print('bag name is cut:'..p)
       if not (Bag[p].kind == "xiao" and weaponUsave[p]) then
	   --print('is not xiao ..:'..p)
          for q in pairs(Bag) do
              if Bag[q].kind == "xiao" and weaponUsave[q] then
               exe('unwield '.. Bag[q].fullid )
            end
          end
		  --print('...'..Bag[p].fullid)
          exe('wield '.. Bag[p].fullid )
       end
    end
  end
end
function toSld()
    locate()
	wait.make(function()
        wait.time(1)
	    if locl.room=='��̲' and locl.area=='������' then
	      weapon_unwield()
		  wait.time(1)
          sld_weaponWieldCut()
		  wait.time(1)
	      if not Bag["������"] then
            exe('buy cu shengzi')
            exe('drop cu shengzi 2')
	      end
          exe('get cu shengzi')
          exe('drop cu shengzi 2')
		  wait.time(1)
          return check_halt(toSldTrigger)
	    else
		  return go_locate()
	    end
	end)
end
function toSldTrigger()
	DeleteTriggerGroup("mufabusy")
    create_trigger_t('mufabusy1','^(> )*ľ����û����ʵ�����������ɡ�','','wait_mufa')
    create_trigger_t('mufabusy2','^(> )*ֻ��(\\D*)����һԾ��������ľ���ϡ�','','mufaok')
    create_trigger_t('mufabusy3','^(> )*�����û�����������ֿ���','','sld_need_weapon')
    create_trigger_t('mufabusy4','^(> )*��Ҫ��ʲô��','','wait_mufa')
	create_trigger_t('mufabusy5','^*ʲô��','','wait_mufa')
	create_trigger_t('mufabusy6','^(> )*������ľ���ϵ�һ��ľͷ����ľ����ǰ��ȥ��','','toSldHua')
	SetTriggerOption("mufabusy1","group","mufabusy")
    SetTriggerOption("mufabusy2","group","mufabusy")
    SetTriggerOption("mufabusy3","group","mufabusy")
    SetTriggerOption("mufabusy4","group","mufabusy")
    SetTriggerOption("mufabusy5","group","mufabusy")
    SetTriggerOption("mufabusy6","group","mufabusy")
    EnableTriggerGroup("mufabusy",true)
	locate_finish='toSldChop'
	return check_busy(locate)
end
function toSldChop()
   locate_finish=0
   wait.make(function() 
       wait.time(1.0)
    exe('chop tree;bang mu tou;zuo mufa')
	end)
end
function toSldDelTrigger()
	DeleteTriggerGroup("mufabusy")
end
function sld_need_weapon()
  wait.make(function()
            wait.time(1)
            weapon_unwield()
            sld_weaponWieldCut()
            return check_bei(toSldChop)
          end)
end
function wait_mufa()
  wait.make(function()
            wait.time(1.0)
            return check_bei(toSldChop)
          end)
end
function mufaok(n,l,w)
	print("mufaokw--"..w[2])
	if string.find(w[2],"��") then
		print("mufaokw--toslddk")
		EnableTriggerGroup("mufabusy",false)
		DeleteTriggerGroup("mufabusy")
		toSldDukou()
	else
		sld_need_weapon()
	end
end
function toSldCheck()
    print("toSldCheck")
	flag.idle = nil
	if locl.room=="Сľ��" or locl.room=="ľ��" then
	  --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
	 locate_finish='toSldHua'
       return check_busy(locate)
    else
       return check_halt(toSld)
    end
end
function toSldHua()
	print("toSldHua")
	locate_finish=0
    sld_unwield()
    exe('hua mufa')
    wait.make(function()
            wait.time(3)
            return toSldDukou()
          end)
end
function toSldDukou()
    print("toSldDukou")
	wait.make(function()
            wait.time(2)
			locate_finish='toSldDkCheck'
            return check_busy(locate)
    end)
end
function toSldDkCheck()
     print("toSldDkCheck")
	 locate_finish=0
	toSldDelTrigger()
	if locl.room=="�ɿ�" then
       return toSldOver()
    elseif locl.room=="Сľ��" or locl.room=="ľ��" then
	  --if score.xiangyun~='��' then 
	    exe('sxlian')
	  --end 
       return toSldHua()
    elseif locl.area and locl.area=='������' and locl.room=='��̲' then
       return toSld()
    elseif locl.area and locl.area~='������' then
       return walk_wait()
    end
end
function toSldOver()
    bqcheck()
	exe('bei none')
	beiUnarmed()
    return walk_wait()
end

function outSld()
    if score.party and score.party=="������" then
       exe('ask lu gaoxuan about ling pai')
    else
       exe('steal lingpai')
    end
    check_busy(outSldGive)
end
function outSldGive()
    wait.make(function() 
       wait.time(2)
    exe('out;#3s;give ling pai to chuan fu')
    check_busy(outSldWait,3)
    end)
end
function outSldWait()
    EnableTriggerGroup("outSldGive_test",false)
    EnableTimer('walkWait4',false)
    wait.make(function() 
       wait.time(6)
    locate_finish='outSldCheck'
    return check_busy(locate)
    end)
end
function outSldCheck()
    locate_finish=0
    if locl.room=="�ɿ�" then
       return outSldGive_test()
    else
	   --cntr1 = countR(20)
       return walk_wait()
    end
end
outSldGive_test=function()
DeleteTriggerGroup("outSldGive_test")
create_trigger_t('outSldGive_test1','^(> )*�������һ��ͨ�����ơ�','','outSldWait')
SetTriggerOption("outSldGive_test1","group","outSldGive_test")
EnableTriggerGroup("outSldGive_test",true)
sld_lp()
end
function sld_lp()
exe('give ling pai to chuan fu')
create_timer_s('walkWait4',1.0,'sld_duko_test')      
end
sld_duko_test=function()
exe('give ling pai to chuan fu')
end

function outSldBoat()
    if cntr1() < 1 then
	   return go(road.act)
	end
    exe('order ����')
    locate()
    return check_halt(outSldBoatCheck)
end
function outSldBoatCheck()
    if locl.room=="��̲" then
       return outSldOver()
    else
       return check_busy(outSldBoat,3)
    end
end
function outSldOver()
    walk_wait()
end

function outHeiw()
    exe('repent')
    locate()
    check_bei(outHeiwCheck)
end
function outHeiwCheck()
    if locl.room~="����" then
       return outHeiwOver()
    end
    checkWait(outHeiw,15)
end
function outHeiwOver()
    walk_wait()
end

--[[function goXtj()
    DeleteTriggerGroup("goxtj")
    create_trigger_t('goxtj1',"^(> )*����\\s*\\-",'','goXtjShulin')
    create_trigger_t('goxtj2',"^(> )*ɽ·\\s*\\-",'','goXtjShanlu')
    SetTriggerOption("goxtj1","group","goxtj")
    SetTriggerOption("goxtj2","group","goxtj")
    EnableTriggerGroup("goxtj",false)

    exe('n')
    locate()
    check_halt(goXtjCheck)
end
function goXtjCheck()
    if locl.room~="����" then
       return goXtjOver()
    end
    
    tmp.goxtj=0
    EnableTriggerGroup("goxtj",true)
    exe('l east;l south;l west;l north')
end
function goXtjShulin()
    if not tmp.goxtj then tmp.goxtj=0 end
    tmp.goxtj = tmp.goxtj + 1
    if tmp.goxtj>3 then
       EnableTriggerGroup("goxtj",false)
       checkWait(goXtjGo,1.5)
    end
end
function goXtjShanlu()
    EnableTriggerGroup("goxtj",false)
    if not tmp.goxtj then tmp.goxtj=0 end
    if tmp.goxtj==1 then
       exe('s')
    end
    exe('n')
    locate()
    checkWait(goXtjCheck,1)
end
function goXtjGo()
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(goXtjCheck)
end]]
------------------------------------------------����Ĺ����������------------------------------------------------
function goXtj()
   SetSpeedWalkDelay(30)
   if flag.find==1 then return end
   exe('n')
   locate_finish='goxtjck'
   return fastLocate()
end
function goxtjck()
   locate_finish=0
   if flag.find==1 then return end
   wait.make(function() 
        wait.time(0.3)
   --[[if locl.room_relation=='ɽ·������-----����-----���֣���������' or locl.room_relation=='ɽ·��ɽ·��ɽ·ɽ·' then
	   return goXtjOver()
   end]]--
   
    if locl.room_relation=='ɽ·������-----����-----���֣���������' then 
      exe('n')
	  return goXtjOver()
   end 
   
   if locl.room_relation=='ɽ·��ɽ·��ɽ·ɽ·' then 
	  return goXtjOver()
   end 
   
   
   if locl.room_relation=='ɽ·��ɽ·�Kɽ��յ�ɽ·' then
       exe('n')
       return goXtj()
   end
   
   if locl.room_relation=='���֣�����-----����-----���֣���������'  then 
        return goXtjGo()
   end 
   
   if locl.room_relation=='���֣�����-----����-----���֣�ɽ·����'  then 
       return goXtjGo_Ex()
   end  
   
   ---return goXtjGo()
   return goXtjOver()
   
   end)
end
function goXtjGo()
    print('goXtjGo...........')
    if flag.find==1 then return end
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    return goXtj()
end

function goXtjGo_Ex()
    print('goXtjGo...........')
    if flag.find==1 then return end
    local l_set={'e','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    return goXtj()
end


function goXtjOver()
    print('goXtjOver..........')
    SetSpeedWalkDelay(speed_walk_delay)
    walk_wait()
end
-------------------------------------------------����Ĺ����������----------------------------------------------------------
function outXtj()
   if flag.find==1 then return end
   SetSpeedWalkDelay(30)
   exe('s')
   locate_finish='outxtjck'
  return fastLocate()
end
function outxtjck()
	locate_finish=0
   if flag.find==1 then return end
    wait.make(function() 
        wait.time(0.3)
        if locl.room_relation=='ɽ·������-----����-----���֣���������' or locl.room_relation=='ɽ·��ɽ·��ɽ·ɽ·' then
	        exe('s')
	        return outXtj()
        end
		if locl.room_relation=='���֣�����-----����-----���֣�ɽ·����' or locl.room_relation=='ɽ·��ɽ·�Kɽ��յ�ɽ·' then
            exe('s')
            return outXtjOver()
        end
		if locl.room_relation=='���֣�����-----����-----���֣���������' then 
		   return outXtjGo()
		end 
		
		return outXtjOver()
		
		--[[
        if locl.room_relation=='ɽ·��ɽ·�Kɽ��յ�ɽ·' or locl.room_relation=='���֣�����-----����-----���֣�ɽ·����' then
            exe('s')
            return outXtjOver()
        end
        return outXtjGo()
       ]]--
   end)
end
function outXtjGo()
    if flag.find==1 then return end
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    return outXtj()
end
function outXtjOver()
    if flag.find==1 then return end
    SetSpeedWalkDelay(speed_walk_delay)
    walk_wait()
end
-----------by fqyy 2017-05-24 ���޺�ɽ��
function xingxiuzuanenter()
    DeleteTriggerGroup("xingxiuzuanenter")
	create_trigger_t('xingxiuzuanenter1',"^(> )*�������Ķ���",'','xingxiuzuanenter_sucess')
	--create_trigger_t('xingxiuzuanenter1',"^(> )*���ȼ�˻��ۣ���������ʯ������һ���ѷ죬�ƺ�������",'','xingxiuzuanenter_sucess')
	SetTriggerOption("xingxiuzuanenter1","group","xingxiuzuanenter")
	EnableTriggerGroup("xingxiuzuanenter",true)
	
	xingxiuzuanenter_flag=0
    if flag.find==1 then return end
    wait.make(function()
	    wait.time(1)
	    exe('halt;use fire')
		local zuan_times=0
	    while xingxiuzuanenter_flag==0 do
		    exe('halt;zuan')
			if zuan_times > 30 then
			    print('������..........')
			    break
		    end
			zuan_times = zuan_times + 1
			wait.time(0.5)
		end
	end)
end

function xingxiuzuanenter_sucess()
    EnableTriggerGroup("xingxiuzuanenter",false)
    xingxiuzuanenter_flag=1
	if flag.find==1 then return end 
	wait.make(function()
	    wait.time(1)
	    return walk_wait()
	end)
end


function xingxiushandong()
    print('xingxiushandong............')
	DeleteTriggerGroup("xxsdAsk")
	create_trigger_t('xxsdAsk1',"^(> )*����ʨ���Ӵ����йء�fqyy������Ϣ",'','xxsdask')
    create_trigger_t('xxsdAsk2',"^(> )*����û������ˡ�$",'','xxsdover')
    create_trigger_t('xxsdAsk3',"^(> )*ʨ������־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��$",'','xxsdget')	
    create_trigger_t('xxsdAsk4',"^(> )*ʨ���ӡ�ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$",'','xxsdover') 
	create_trigger_t('xxsdAsk5',"^(> )*���빥��˭��$",'','xxsdover')
    create_trigger_t('xxsdAsk6',"^(> )*ʨ�����Ѿ��޷������ˣ�$",'','xxsdget')
	SetTriggerOption("xxsdAsk1","group","xxsdAsk")
    SetTriggerOption("xxsdAsk2","group","xxsdAsk")
	SetTriggerOption("xxsdAsk3","group","xxsdAsk")
	SetTriggerOption("xxsdAsk4","group","xxsdAsk")
	SetTriggerOption("xxsdAsk5","group","xxsdAsk")
	SetTriggerOption("xxsdAsk6","group","xxsdAsk")
	
	locate_finish=0
	fastLocate()
	return checkWait(xingxiushandong_confirm,1)
	
	--EnableTriggerGroup("xxsdAsk",true)
	--EnableTriggerGroup("wipe",false)
    --exe("ask shihou zi about fqyy")

end

function xingxiushandong_confirm()
    print('xingxiushandong_confirm................locl.room='..locl.room)
    if locl.room=='ɽʯ' and locl.room_relation=='ɽʯ�����߻�·ɽʯ'  then 
	    EnableTriggerGroup("xxsdAsk",true)
	    EnableTriggerGroup("wipe",false)
	    exe("ask shihou zi about fqyy")
	else
	    return go(road.act)
	end
end

function xingxinshandong_new()
   DeleteTriggerGroup("kill_shihouzi")
   create_trigger_t('kill_shihouzi1','^(> )*ʨ���ӡ�ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����','','xingxinshandong_shihouzi_kill_over')
   SetTriggerOption("kill_shihouzi1","group","kill_shihouzi")
   
   wait.make(function()    
	   local shihouzi_exist=0
	   while true do
	       wait.time(1)
	       exe("ask shihou zi about fqyy")
		   local l,w = wait.regexp('^(> )*(����ʨ���Ӵ����йء�fqyy������Ϣ|����û������ˡ�)',1)
		   if l ~= nil then
		       if string.find(l,"fqyy") then 
                   shihouzi_exist=1
				   break
               end 
			   
			   if string.find(l,"����û�������") then 
			      break
			   end 
          end			   
	   end  
	   if shihouzi_exist == 1 then
	       return xingxinshandong_shihouzi_kill()
	   else
	       return xingxinshandong_shihouzi_kill_over()
	   end
   end)
   
end

function xingxinshandong_shihouzi_kill()

	local l,w=nil
    wait.make(function()
		while true do
	       wait.time(1)
	       exe("kill shihou zi")
		   l, w = wait.regexp('^(> )*(�����ʨ���Ӵ��һ��|����û�������)',1)
		   if l ~= nil then
              print('kill shihouzi begin ..........')
			  break
		   end
		end
		
		if string.find(1,'����û�������') then
		    return xingxinshandong_shihouzi_kill_over()
		end
	end)
end

function xingxinshandong_shihouzi_kill_over()
    EnableTriggerGroup("kill_shihouzi",false)
    
	wait.make(function()    
        wait_busy()
	    wait.time(1)
	    exe('enter cave')
	    wait.time(1)
	    return walk_wait()
	end)  
end



function xxsdask()
	exe("jiali max;hit shihou zi")
	create_timer_s('xxsdhit',3,'xxsdask1')
end
function xxsdask1()
	exe("jiali max;hit shihou zi")
end
function xxsdget()
	exe("get shihou zi;enter cave;drop shihou zi")
	inxxsd()
end
function xxsdover()
    print('xxsdover............')
	local try_times = 0
	wait.make(function()
	   while true do
	       exe("enter cave")
		   local l,w  = wait.regexp('(> )*��С����������ɽ����̽��̽��$',1)
	       if l~= nil or try_times < 20 then 
		       break
		   end
		   try_times = try_times + 1
	       wait.time(0.5)
	   end
	   inxxsd()
	end)
	
	--exe("enter cave")
	--inxxsd()
end
function inxxsd()
	DeleteTimer("xxsdhit")
	EnableTriggerGroup("xxsdAsk",false)
	DeleteTriggerGroup("xxsdAsk")
	return walk_wait()
end
--------------by fqyy 20170526�ƺ���������------------------

function inxiaofu()
    print('inxiaofu................')
	--[[
	DeleteTriggerGroup("xiaofuask")
	create_trigger_t('xiaofuask1',"^(> )*�����η�������йء�fqyy������Ϣ",'','xiaofuask')
    create_trigger_t('xiaofuask2',"^(> )*����û������ˡ�$",'','xiaofuover')
    create_trigger_t('xiaofuask3',"^(> )*����һ�ְ���ץס��˵������һ����Ҳ��������$",'','xiaofugetchai')	
    create_trigger_t('xiaofuask4',"^(> )*�η��ࡸž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�$",'','xiaofuover') 
	create_trigger_t('xiaofuask5',"^(> )*���빥��˭��$",'','xiaofuover')
    create_trigger_t('xiaofuask6',"^(> )*�η����Ѿ��޷������ˣ�$",'','xxsdget')
	SetTriggerOption("xiaofuask1","group","xiaofuask")
    SetTriggerOption("xiaofuask2","group","xiaofuask")
	SetTriggerOption("xiaofuask3","group","xiaofuask")
	SetTriggerOption("xiaofuask4","group","xiaofuask")
	SetTriggerOption("xiaofuask5","group","xiaofuask")
	SetTriggerOption("xiaofuask6","group","xiaofuask")
	EnableTriggerGroup("xiaofuask",true)
	
	exe("n")
	fastLocate()
	wait.make(function()
	   wait.time(1)
		return xiaofu_check()
	end)
	]]--
	return check_bei(xiaofu_check_locate)
	
end

function xiaofu_check_locate()
    print('xiaofu_check_locate................')
    wait.make(function()
	    fastLocate(coroutine.running())
		coroutine.yield()
		if locl.room == "��������" then 
		    return xiaofu_check_enter()
		else
	        return go(road.act)
		end
	end)
end

function xiaofu_check_enter()
    wait.make(function()
	    while true do
		    exe('north')
			local l,w = wait.regexp("^(> )*(����һ�ְ���ץס|��������\\s*-)",1)
			if l~=nil then 
			    if string.find(l,"����һ�ְ���ץס") then 
				    return check_bei(xiaofu_give_jinchai)
				else
				    return check_bei(walk_wait)
				end
			end
		end
	end)
end


function xiaofu_give_jinchai()
    wait.make(function()
	    wait.time(2)
	    local self = coroutine.running()
		local async_continue = function()       
            print("async resume")
            coroutine.resume(self)
        end
	    checkBags(async_continue)
		coroutine.yield()
        if not Bag["����"] then 
		    wait_busy()
		    wait.time(2)
			exe('southeast;southwest;southwest;southwest;west;')
            wait.time(2)
		    exe('west;west;south;southwest;west;south;south;east')
			wait.time(2)
			exe('east;south;south;south;south;south;south;south;east;south')
		    wait.time(2)
			exe('qu jin chai')
			wait_busy()
			exe('north;west;north;north;north;north;north;north;north')
			wait.time(2)
			exe('west;west;north;north;east;northeast;east;east;east')
			wait.time(2)
			exe('north;west;northeast;northeast;northwest')
		    wait.time(2)
			return check_bei(xiaofu_give_jinchai)
		else
		   exe('give zhang chai')
		   return check_bei(xiaofu_check_enter)
		end
	end)
end


function xiaofu_check()
	if locl.room == "��������" then	
		return check_busy(walk_wait)
	elseif locl.room == "��������" then	
		wait.make(function()
		   wait.time(1)
			return xiaofu_check()
		end)
    else 
	    return go(road.act)
	end
end
function xiaofuask()
	check_busy(xiaofuask1)
end
function xiaofuask1()
	exe("jiali max;kill ren feiyan")
end
function xiaofuover()
	check_busy(xiaofuover1)
end
function xiaofuover1()
	exe("get chai from corpse;ne;nw;give zhang chai;n")
	DeleteTriggerGroup("xiaofuask")
	walk_wait()
end
function xiaofugetchai()
	exe("se;sw;ask ren feiyan about fqyy")
end
-----------ѩɽ �вƴ󳵵�---------------
function xsdachedian()
	DeleteTriggerGroup("xsdcd")
	create_trigger_t('xsdcd1',"^(> )*�͹��Ѿ��������ӣ���ô��ס��������أ����˻���Ϊ(\\D*)�ź����أ�",'','xsdachedian1')
    create_trigger_t('xsdcd2',"^(> )*��һ��������",'','xsdachedian2')
    SetTriggerOption("xsdcd1","group","xsdcd")
	SetTriggerOption("xsdcd2","group","xsdcd")
	EnableTriggerGroup("xsdcd",true)
	exe("w")
	fastLocate()
    create_timer_st('xsdcdtimer',1,'xsdcd_check')
end
function xsdcd_check()
	if locl.room == "�ֵ�" then	
		DeleteTriggerGroup("xsdcd")
		walk_wait()
	else
		xsdachedian()
	end
end
function xsdachedian1()
	DeleteTimer("xsdcdtimer")
	exe("enter;sleep")
end
function xsdachedian2()
	DeleteTimer("xsdcdtimer")
	DeleteTriggerGroup("xsdcd")
	exe("out;w")
	walk_wait()
end
------------------------------------------------------------
function toThd()
    DeleteTriggerGroup("toThd")
    create_trigger_t('toThd1',"^(> )*��ԶԶ��ȥ�����������дУ�һ���̡�һ�ź졢һ�Żơ�һ���ϣ��˵��Ƿ����ƽ���",'','toThdOver')
    create_trigger_t('toThd2',"^(> )*��Ҫ��˭�����������",'','toThdOver')
    SetTriggerOption("toThd1","group","toThd")
    SetTriggerOption("toThd2","group","toThd")
	EnableTriggerGroup("toThd",true)
	exe('l rock;jump boat')
end
function toThdOver()
	locate()
	wait.make(function()
	   wait.time(1)
		return toThdCheck()
	end)
end
function toThdCheck()
	EnableTriggerGroup("toThd",false)
	if locl.room=="����" then
		walk_wait()
	else
		toThd()
	end
end
--����
function songlinIn()
    DeleteTriggerGroup("songlin")
    create_trigger_t('songlin1',"^(> )*������\\s*\\-",'','songlinInSonglin')
    create_trigger_t('songlin2',"^(> )*���ٲ�\\s*\\-",'','songlinInPubu')
	create_trigger_t('songlin3',"^(> )*��Ժ\\s*\\-",'','songlinInSonglin')
    SetTriggerOption("songlin1","group","songlin")
    SetTriggerOption("songlin2","group","songlin")
	SetTriggerOption("songlin3","group","songlin")
    EnableTriggerGroup("songlin",false)
	exe('n')
	cntrl = countR(100)
    locate()
    check_halt(songlinInCheck)
end
function songlinInCheck()
    if locl.room=="���ٲ�" then
       return songlinInOver()
    end
	if locl.room=="��Ժ" then
       exe('n')
    end
    tmp.songlin=0
    EnableTriggerGroup("songlin",true)
    exe('l east;l south;l west;l north')
end
function songlinInSonglin()
    if not tmp.songlin then tmp.songlin=0 end
    tmp.songlin = tmp.songlin + 1
    if tmp.songlin>3 then
       EnableTriggerGroup("songlin",false)
       checkWait(songlinInGo,1)
    end
end
function songlinInPubu()
    EnableTriggerGroup("songlin",false)
    exe('e')
    locate()
    checkWait(songlinInCheck,1)
end
function songlinInGo()
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(songlinInCheck)
end
function songlinInOver()
    EnableTriggerGroup("songlin",false)
    --DeleteTriggerGroup("songlin")
    walk_wait()
end
function songlinOut()
    DeleteTriggerGroup("songlin")
    create_trigger_t('songlin1',"^(> )*������\\s*\\-",'','songlinOutSonglin')
    create_trigger_t('songlin2',"^(> )*���ٲ�\\s*\\-",'','songlinOutPubu')
	create_trigger_t('songlin3',"^(> )*��Ժ\\s*\\-",'','songlinOutHouyuan')
    SetTriggerOption("songlin1","group","songlin")
    SetTriggerOption("songlin2","group","songlin")
	SetTriggerOption("songlin3","group","songlin")
    EnableTriggerGroup("songlin",false)
	exe('n')
    locate()
    check_halt(songlinOutCheck)
end
function songlinOutCheck()
    if locl.room=="���ٲ�" then
	   exe('w;s')
       return songlinOutOver()
    end
	if locl.room=="��Ժ" then
       return songlinOutOver()
    end

    tmp.songlin=0
    EnableTriggerGroup("songlin",true)
    exe('l east;l south;l west;l north')
end
function songlinOutSonglin()
    if not tmp.songlin then tmp.songlin=0 end
    tmp.songlin = tmp.songlin + 1
    if tmp.songlin>2 then
       EnableTriggerGroup("songlin",false)
       checkWait(songlinOutGo,1)
    end
end
function songlinOutPubu()
    EnableTriggerGroup("songlin",false)
    exe('e')
    locate()
    checkWait(songlinOutCheck,1)
end
function songlinOutHouyuan()
    EnableTriggerGroup("songlin",false)
	exe('s')
    return songlinOutOver()
end
function songlinOutGo()
    local l_set={'e','s','w','n'}
    local l_cnt=math.random(1,table.getn(l_set))
    exe(l_set[l_cnt])
    locate()
    check_halt(songlinOutCheck)
end
function songlinOutOver()
    EnableTriggerGroup("songlin",false)
    DeleteTriggerGroup("songlin")
    walk_wait()
end

function xsMianbi()
    if hp.shen>0 then
	   return xsMianbiOver()
	else
	   exe('#20(mianbi);hp')
	   return check_halt(xsMianbiChk,1)
	end
end
function xsMianbiChk()
    if hp.shen>0 then
	   return xsMianbiOver()
	else
	   exe('#20(mianbi);hp')
	   return check_halt(xsMianbi,1)
	end
end
function xsMianbiOver()
    return walk_wait()
end

function mlIn()
    tmp.way = "south"
	tmp.ml = "in"
	locate()
	return checkWait(wayMl,0.1)
end
function mlOut()
    tmp.way = "north"
	tmp.ml = "out"
	locate()
	return checkWait(wayMl,0.1)
end
function wayMl()
    local ways = {
		["north"] = "east",
		["east"]  = "south",
		["south"] = "west",
		["west"]  = "north",
	}
	local wayt = {
		["north"] = "west",
		["east"]  = "north",
		["south"] = "east",
		["west"]  = "south",
	}
	if not tmp.way or not ways[tmp.way]then
	   tmp.way = 'south'
	end
	if locl.room=="��ʯ���·" then
	   if tmp.ml and tmp.ml=="in" then
	      return wayMlOver()
	   else
	      tmp.way = "north"
	      exe(tmp.way)
		  locate()
	      return checkWait(wayMl,0.1)
	   end 
    end
    if locl.room=="С·" then
	   if tmp.ml and tmp.ml=="out" then
	      return wayMlOver()
	   else
	      tmp.way = "south"
	      exe('south;south')
		  locate()
	      return checkWait(wayMl,0.1)
	   end 
    end
    if locl.room~="С·" and locl.room~="��ʯ���·" and locl.room~="÷��" then
       return wayMlOver()
    end	
	tmp.way = ways[tmp.way]
	while not locl.exit[tmp.way] do
	    Note(tmp.way)
	    tmp.way = wayt[tmp.way]
	end
	exe(tmp.way)
	locate()
	return checkWait(wayMl,0.2)
end
function wayMlOver()
    return walk_wait()
end

function mzDoor()
    create_trigger_f('xxdf',"^(> )*���˰��Σ����Ż����򿪣������߳���������װ��������",'','mzDoorHuida')
	wait.make(function()
         exe('qiao gate 4 times')
		 wait.time(3)
	     exe('qiao gate 2 times')
		 wait.time(3)
	     exe('qiao gate 5 times')
		 wait.time(3)
	     exe('qiao gate 3 times')
	end)
end
function mzDoorHuida()
    exe('huida �����������;show wuyue lingqi;s')
	return check_halt(mzDoorOver)
end
function mzDoorOver()
    return walk_wait()
end

---------
-- ain ������·��
---------------
ht2ss=function()
   DeleteTriggerGroup("gmout1")
 --  create_trigger_t('gmout1','^>*\\s*�����ű�����ô�ƶ�С�ۣ�','','jqgout_weapon')
   create_trigger_t('jqgout2','^>*\\s*�Ҷ�ʯ������������������','','gmss_outss')
   SetTriggerOption("gmout1","group","gmout")
   SetTriggerOption("jqgout2","group","gmout")
   ht2ssgo()
end
ht2ssgo=function()
   exe('tang bed;ban shiban;out')
end
gmss_outss=function()
   DeleteTriggerGroup("gmout")
   create_trigger_t('gmout1','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','gmss_outssok')
   SetTriggerOption("gmout1","group","gmout")
   exe('e;e;e;e;e;s;s;s;s;s;w;w;w;w;w;n;n;n;n;n')
   --locate()
   --check_bei(jqgzlin_con)
end

gmss_outssok=function()
   DeleteTriggerGroup("gmout")
   create_trigger_t('gmout1','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','gmss_outssok')
   SetTriggerOption("gmout1","group","gmout")
   exe('e;e;e;e;e;s;s;s;s;s;w;w;w;w;w;n;n;n;n;n')
   --locate()
   --check_bei(jqgzlin_con)
end
---------------


-----------

function yuRen()
	DeleteTriggerGroup("yrAsk")
    create_trigger_t('yrAsk1',"^(> )*�������˴����йء�һ�ƴ�ʦ������Ϣ",'','yuRenAsk')
    create_trigger_t('yrAsk2',"^(> )*����û������ˡ�$",'','yuRenOver')
    SetTriggerOption("yrAsk1","group","yrAsk")
    SetTriggerOption("yrAsk2","group","yrAsk")
	checkWield()
	return exe('ask yu ren about һ�ƴ�ʦ')
end
function yuRenAsk()
    EnableTriggerGroup("yrAsk",false)
	DeleteTriggerGroup("yren")
	create_trigger_t('yren1',"^(> )*����(����|)˵����(��|)�Ҳ����Ѿ���������ɽ�ķ�����ô��",'','yuRenBag')
	create_trigger_t('yren2','^(> )*����(����|)˵����(��|)������ȥ�ҵĽ������أ�','','yuRenWaa')
	create_trigger_t('yren3',"^(> )*����(����|)˵����(��|)Ҫ����ʦ����Ҳ���ѣ������Ҹն�ʧ������������",'','yuRenWaa')
	SetTriggerOption("yren1","group","yren")
    SetTriggerOption("yren2","group","yren")
	SetTriggerOption("yren3","group","yren")
end
function yuRenWaa()
    DeleteTimer("ydzy")
    EnableTriggerGroup("yren",false)
	EnableTriggerGroup("yrj",false)
	EnableTriggerGroup("yrz",false)
	cntr1 = countR(20)
	return check_halt(yuRenJump)
end
function yuRenJump()
        EnableTriggerGroup("yren",false)
	EnableTriggerGroup("yrz",false)
	DeleteTriggerGroup("yrj")
	create_trigger_t('yrj1',"^(> )*�ٲ����Ѿ������ˣ�������ȥ̫Σ���ˡ�",'','yuRenWait')
	create_trigger_t('yrj2','^(> )*�㵱��һ�ﲻ����Ҳ�����¿�Ь�࣬ӿ�������ٲ������䡣','','yuRenZhua')
	create_trigger_t('yrj3',"^(> )*����æ���ء�",'','yuRenWaa')
        create_trigger_t('yrj4','^(> )*���ٲ����ڶ�ȥ��ˮĭ�Ľ���ֻ��\\D*����վ��ˮ�ף�һ���ٲ�����ͻ������Ӿ�δҡ�Ρ�','','yuRenWait')
	SetTriggerOption("yrj1","group","yrj")
        SetTriggerOption("yrj2","group","yrj")
	SetTriggerOption("yrj3","group","yrj")
	SetTriggerOption("yrj4","group","yrj")
	weapon_unwield()
	exe('look pubu')
	exe('jump pubu')
end
function yuRenWait()
    EnableTriggerGroup("yrj",false)
    if cntr1() < 1 then
	   return yuRenOver()
	end
	return checkWait(yuRenJump,3)
end
function yuRenZhua()
	EnableTriggerGroup("yrj",false)
	DeleteTriggerGroup("yrj")
        DeleteTriggerGroup("yrz")
	create_trigger_t('yrz1',"^(> )*�㲻���Ѿ�ץ����������ô��",'','yuRenCheck')
	create_trigger_t('yrz2','^(> )*����\\D*��ץ������ô��','','yuRenUw')
	--create_trigger_t('yrz3',"^(> )*����æ���ء�",'','yuRenZhuaYu')
	--create_trigger_t('yrz4','^(> )*����������ȥ׽�ǶԽ����ޣ�һ��һ��','','yuRenZhuaYu')
	create_trigger_t('yrz5',"^(> )*�����ֵ����������Ǵ�ʯ��������һ̧",'','yuRenCheck')
	create_trigger_t('yrz6',"^(> )*��ʵ��֧�Ų���ȥ�ˣ������������ٲ����ߡ�",'','yuRenWaa')
	create_trigger_t('yrz7',"^(> )*���������Ź��㣬ֻ��һ�����ֱ�������ȥ��������ˮ����������������һ��",'','yuRenBag')
	
	SetTriggerOption("yrz1","group","yrz")
        SetTriggerOption("yrz2","group","yrz")
	--SetTriggerOption("yrz3","group","yrz")
	--SetTriggerOption("yrz4","group","yrz")
	SetTriggerOption("yrz5","group","yrz")
	SetTriggerOption("yrz6","group","yrz")
	SetTriggerOption("yrz7","group","yrz")
	return yuRenZhuaYu()
end
function yuRenUw()
    DeleteTimer("ydzy")
    weapon_unwield()
	return check_halt(yuRenZhuaYu)
end
function yuRenZhuaYu()
    EnableTriggerGroup("yrz",true)
    create_timer_s('ydzy',3,'yrzhuayu')
end
function yrzhuayu()
    exe('zhua yu')
end
function yuRenCheck()
    DeleteTimer("ydzy")
    checkBags()
	create_timer_s('ydzy',1,'jumpab')
end
function jumpab()
    exe('jump anbian')
end
function yuRenBag()
    DeleteTimer("ydzy")
	if not Bag["������"] then
	   return check_bei(yuRenAsk)
	end
	EnableTriggerGroup("yrz",false)
	exe('give jin wawa to yu ren')
	return checkWait(yuRenGive,4)
end
function yuRenGive()
	DeleteTriggerGroup("yrp")
	create_trigger_t('yrp1',"^(> )*�ٲ���ˮ�������ļ��������Ѿ����������ں����ˣ��㻹���ȵȻ�ɡ�",'','yuRenPao')
	create_trigger_t('yrp2','^(> )*��ת��ɽ�ǣ���һ�������𣡡����������ٲ�������','','yuRenHua')
	create_trigger_t('yrp3',"^(> )*����æ���ء�",'','yuRenPao')
	SetTriggerOption("yrp1","group","yrp")
    SetTriggerOption("yrp2","group","yrp")
	SetTriggerOption("yrp3","group","yrp")
	return yuRenPao()
end
function yuRenPao()
    wait.make(function() 
       wait.time(1)
	   exe('zhi boat')
	end)
end
function yuRenHua()
    EnableTriggerGroup("yrp",false)
	DeleteTriggerGroup("yrh")
	--create_trigger_t('yrh1',"^(> )*(�����У�|�����ڻ��أ�|������������æ�ӳ�)",'','yuRenBoat')
	create_trigger_t('yrh2','^(> )*���Ѿ��������ˣ���취�ϰ��ɣ�','','yuRenTiao')
	--create_trigger_t('yrh3',"^(> )*����æ���ء�",'','yuRenBoat')
	create_trigger_t('yrh4',"^(> )*ͻȻ��һ�ɴ����嵽",'','yuRenOver')
	--SetTriggerOption("yrh1","group","yrh")
        SetTriggerOption("yrh2","group","yrh")
	--SetTriggerOption("yrh3","group","yrh")
	SetTriggerOption("yrh4","group","yrh")
	return yuRenBoat()
end
function yuRenBoat()
    weapon_unwield()
    EnableTriggerGroup("yrh",true)
    create_timer_s('yrb',3,'huaboat')
end
function huaboat()
	   exe('wield tie jiang')
	   exe('hua boat')
end
function yuRenTiao()
    DeleteTimer("yrb")
    EnableTriggerGroup("yrh",false)
	exe('jump shandong')
	return check_busy(yuRenOver)
end
function yuRenOver()
    DeleteTimer("yrb")
	   exe('unwield tie jiang')
    EnableTriggerGroup("yrh",false)
	DeleteTriggerGroup("yrh")
	DeleteTriggerGroup("yrp")
	DeleteTriggerGroup("yrz")
	DeleteTriggerGroup("yrj")
	DeleteTriggerGroup("yren")
	DeleteTriggerGroup("yrAsk")
	return walk_wait()
end

function jiaoZi()
    locate()
	return checkNext(jiaoZiLoc)
end
function jiaoZiLoc()
    if locl.room ~= "����" then
	   return jiaoZiOver()
	end
    if not locl.id["����"] then
	   return jiaoZiWait()
	end
    wait.make(function() 
       wait.time(2)
	   return jiaoZiAnswer()
	end)
end
function jiaoZiWait()
    wait.make(function() 
       wait.time(2)
	   return jiaoZi()
	end)
end
function jiaoZiAnswer()
    EnableTriggerGroup("jiao",false)
	exe('answer ��ɽ����������మ���β��������۹��ƽ����һéի��Ұ����������˭���˷�˭�ɰܣ�ª�ﵥư�����ա�ƶ�������ģ��־���ģ�')
	exe('pa teng')
	return jiaoZiOver()
end
function jiaoZiOver()
    DeleteTriggerGroup("jiao")
    return walk_wait()
end 

function duZi()
    locate()
	return checkNext(duZiLoc)
end
function duZiLoc()
    if locl.room ~= "ʯ����ͷ" then
	   return duZiOver()
	end
    if not locl.id["����"] then
	   return duZiWait()
	end
	DeleteTriggerGroup("du")
	create_trigger_t('du1',"^(> )*����(����|)˵����(��|)�ҳ�������Ŀ�����㣬",'','duZiQuestion')
	create_trigger_t('du2',"^(> )*����(����|)˵����(��|)������һ��ʫ��˵�������³������������ĸ��ֶ�",'','duZiAnswer')
	create_trigger_t('du3',"^(> )*����(����|)˵����(��|)�úã���Ȼ��������һ�⣬����һ������",'','duZiAnswerTwo')
	create_trigger_t('du4',"^(> )*����(����|)˵����(��|)�һ���һ������",'','duZiAnswerThree')
        create_trigger_t('du5',"^(> )*����(����|)˵����(��|)��ɻش�ĳ��ҵ����⣿",'','duZiAnswerAll')
        create_trigger_t('du6',"^(> )*����(����|)˵����(��|)��λ\\D*����ʦ������ǰ�治Զ����ʯ���",'','duZiOver')
	SetTriggerOption("du1","group","du")
	SetTriggerOption("du2","group","du")
	SetTriggerOption("du3","group","du")
	SetTriggerOption("du4","group","du")
	SetTriggerOption("du5","group","du")
	SetTriggerOption("du6","group","du")
	return check_halt(duZiAsk)
end
function duZiAsk()
    exe('ask shu sheng about һ�ƴ�ʦ')
end
function duZiQuestion()
    wait.make(function() 
       wait.time(4)
	   exe('ask shu sheng about ��Ŀ')
	end)
end
function duZiWait()
    wait.make(function() 
       wait.time(2)
	   return duZi()
	end)
end
function duZiAnswerAll()


    wait.make(function()
 

       wait.time(3)


     exe('answer ��δ״Ԫ')


     exe('answer ˪���Ҷ�����Ź�����ң��')


     exe('answer �������ˣ���С�����Զǳ�')


     exe('north')


  end)


end
function duZiAnswer()
    wait.make(function() 
       wait.time(4)
	   exe('answer ��δ״Ԫ')
	end)
end
function duZiAnswerTwo()
    exe('answer ˪���Ҷ�����Ź�����ң��')
end
function duZiAnswerThree()
    exe('answer �������ˣ���С�����Զǳ�')
	exe('north')
	return duZiOver()
end
function duZiOver()
    EnableTriggerGroup("du",false)
    return walk_wait()
end 

function nongFu() 
    locate()
	return checkNext(nongFuLoc)
end
function nongFuLoc()
    if locl.room ~= "ɽ��" then
	   return nongFuOver()
	end
    if not locl.id["ũ��"] then
	   return nongFuWait()
	end
	DeleteTriggerGroup("nong")
	create_trigger_t('nong1',"^(> )*(�Ѿ����������ˡ�|ũ���ڣ���ô���ʯ����һ�����޷�����)",'','nongFuTuo')
	create_trigger_t('nong2','^(> )*���Ѿ���ũ������ʯ���ˣ��������뿪��','','nongFuLeave')
	create_trigger_t('nong3',"^(> )*����æ���ء�",'','nongFuTuo')
	create_trigger_t('nong4',"^(> )*ũ��˫����ס��ʯ�������˾���ͦ���ʯ������˵��",'','nongFuLeave')
	SetTriggerOption("nong1","group","nong")
    SetTriggerOption("nong2","group","nong")
	SetTriggerOption("nong3","group","nong")
	SetTriggerOption("nong4","group","nong")
	return nongFuTuo()
end
function nongFuTuo()
    EnableTriggerGroup("nong",true)
	wait.make(function() 
       wait.time(2)
	   exe('tuo shi')
	end)
end
function nongFuWait()
    wait.make(function() 
       wait.time(2)
	   return nongFu()
	end)
end
function nongFuLeave()
    EnableTriggerGroup("nong",false)
    wait.make(function() 
       wait.time(3)
	exe('east')
	return nongFuOver()
	end)
end
function nongFuOver()
    DeleteTriggerGroup("nong")
    return walk_wait()
end 

function liangFront()
    if hp.neili < 6000 then
	   return prepare_neili(liangFrontJump)
	end 
	return liangFrontJump()
end
function liangFrontJump()
    exe('jump front;hp')
	return check_halt(liangFrontOver,1)
end
function liangFrontOver()
    return walk_wait()
end 

function liangBack()
    if hp.neili < 2000 then
	   return prepare_neili(liangBackJump)
	end 
	return liangBackJump()
end
function liangBackJump()
    exe('jump back;hp')
	return check_halt(liangBackOver,1)
end
function liangBackOver()
    return walk_wait()
end 



 
room={}
roomMaze={
['���ԭ�ݺ�']=function() return locl.dir end,
['����ɽ��ʮ����']='ne;nd',
['����ɽ���϶�']=function() if locl.exit["enter"] then return 'enter' else return 'drop fire;leave;leave;leave;leave' end end,
['����ɽ��ɼ��']='sw;se',
['����ɽʮ����']='ne;ed;ne;ed',
['����ɽ������']='ed;ed',
['����ɽ�����']='out;w;e;w;e;w;e;w;e',
['����ɽ��ɼ��']=function()
 wait.make(function()
       wait.time(2)
                  local r=math.random(6)
                    if r==1 then
                    exe("e;n;w;nw;ne")
                    elseif r==2 then
                    exe("n;w;nw;ne")
                    elseif r==3 then
                    exe("w;nw;ne")
                    elseif r==4 then
                    exe("nw;ne")
                    elseif r==5 then
                    exe("e;ne")
                    elseif r==6 then
                    exe("ne")
                    end
    end)
end,
['��ɽ���ּ��']='e;e;nw;ne;se;n',
['���ݳ�����']='n;n;n',
['�ؽ���Ҷ��']=function() if math.random(1,4)==1 then return 'ne;#15e' elseif math.random(1,4)==2 then return 'ne;#15w' elseif math.random(1,4)==3 then return 'ne;#15s' else return 'ne;#15n' end end,
['��ɽ������']='n;e;e',
['�ƺ�����ƺӰ���']='nu;#2(sw);#2w',
['�ƺ���������']='e;ne;#2n',
['�ƺ�����ݵ�']='e;s',
['�ƺ��������']='#2e;ne;n',
['ؤ��������']='e;n;w;n',
['����ׯ�����']='s;se;w;#2s;w;s',
['����ׯ����']='#2e;w;#2s',
['����ׯ�ݵ�']='#2e;w;s',
['����Ľ��������']='e;n;w;n;yue tree',
['������С��']='s;e;e;e;e;e;e;e;e',
['�����볤��']='s;s;e;e;e;e;e;e;e;e;e;e;n;e;s',
['����Сɳ��']='e;e;e;e',
['����ջ��']='#2(sw);#2(se);s',
['����ɽ·']='ed;wd;sd;nd',
['���������']=function() if locl.id["�ϻ�"] then return 'halt;n;w;nu' elseif locl.id["С��֦"] then return 'halt;w;nw;n;w;nu' elseif locl.id["����ʬ��"] then return 'halt;nw;n;w;nu' elseif locl.id["������"] then return 'halt;w;n;w;nu' else return locl.dir end end,
['��������']=function() if locl.id["��ʯͷ"] then return 'halt;e;nu' elseif locl.id["������"] then return 'halt;w;nu' else return locl.dir end end,
['������Сľ��'] = function() return toSldHua() end,
['������ɳ̲']='sw;se',
['����������']='sw;se;s',
['����������']='e;e;n',
['������ɽ��']='d;wd;su;sd;wd',
['������ɽ·']='s;sd;d;wd;su',
['��ɽ��������']=function()
 wait.make(function()
       wait.time(2)
                  local r=math.random(14)
                    if r==1 then
                    exe("sd;s")
                    elseif r==2 then
                    exe("sw;n;s;w;e;w;e;e;s;w;n;nw;n")
                    elseif r==3 then
                    exe("n;s;w;e;w;e;e;s;w;n;nw;n")
                    elseif r==4 then
                    exe("s;w;e;w;e;e;s;w;n;nw;n")
                    elseif r==5 then
                    exe("w;e;w;e;e;s;w;n;nw;n")
                    elseif r==6 then
                    exe("e;w;e;e;s;w;n;nw;n")
                    elseif r==7 then
                    exe("w;e;e;s;w;n;nw;n")
                    elseif r==8 then
                    exe("e;e;s;w;n;nw;n")
                    elseif r==9 then
                    exe("e;s;w;n;nw;n")
                    elseif r==10 then
                    exe("s;w;n;nw;n")
                    elseif r==11 then
                    exe("w;n;nw;n")
                    elseif r==12 then
                    exe("n;nw;n")
                    elseif r==13 then
                    exe("nw;n")
                    elseif r==14 then
                    exe("n")
                    end
    end)
end,
['��ɽ��������']='n;n;s;e',
['��ɽ���ֲ�԰��']='s;w;n;n;n;nw;n;n;w;w;w',
['��ɽ���ֻ���']='n;w;n',
['��ɽ�������䳡']='s;s;n;e',
['��ɽ������ɮ��']='n;n;n;e',
['��ɽ����ʯ��']='sd;sd;sd;ed;sd;e',
-- ain
['��ɽ��������']=function()
 wait.make(function()
       wait.time(2)
                  local r=math.random(11)
                    if r==1 then
                    exe("ne;se;n;e;sw;e;ne;se;s;se;open door;e")
                    elseif r==2 then
                    exe("se;n;e;sw;e;ne;se;s;se;open door;e")
                    elseif r==3 then
                    exe("n;e;sw;e;ne;se;s;se;open door;e")
                    elseif r==4 then
                    exe("e;sw;e;ne;se;s;se;open door;e")
                    elseif r==5 then
                    exe("sw;e;ne;se;s;se;open door;e")
                    elseif r==6 then
                    exe("e;ne;se;s;se;open door;e")
                    elseif r==7 then
                    exe("ne;se;s;se;open door;e")
                    elseif r==8 then
                    exe("se;s;se;open door;e")
                    elseif r==9 then
                    exe("s;se;open door;e")
                    elseif r==10 then
                    exe("se;open door;e")
                    elseif r==11 then
                    exe("open door;e")
                    end
    end)
end,
['��ɽ����������']='w;n;nw',
['��ɽ����ɮ��']=function() if locl.id["�ۺ�����"] then return 'w;s;e' elseif locl.id["��������"] then return 'e;s;w' else return locl.dir end end,
['������������']='s;w;s;w;#8s',
['�䵱ɽ����·']='e;e',
['�䵱ɽС��']='#5n',
['����ɽ������']='n;e;n;w;n',
['������ɽ��С·']='ne;nd;se;se;#2s;n;e',
['��Դ��ʯ��']='jump front',
['���޺����޺�']='se;#7n',
['���޺���ɳĮ']='#8w',
['���ݳǳ�������']='w;w;e;n',
['���ݳǳ����ϰ�']='w;w;e;s;se;s',
['��٢��ɽׯ������']='south;#3w;#2e;#3s',
}

roomNodir={
['�����ʹ�����']={'north'},
['���ݳ����']={'northeast'},
['��������·']={'east','west'},
['���ݳ�ɽ·']={'east','west'},
['���ݳ�С��']={'southwest'},
['�ƺ���������']={'southwest'},
['��ɽ�������']={'northwest','northeast'},
['��ɽ�յ�']={'southdown'},
['��ɽɽ����']={'south'},
['�����ɽ��ƽ��']={'northdown'},
['���ݳ����ׯ�ſ�']={'west'},
['����ɽ���پ�']={'west'},
['����ɽ������']={'southwest'},
['����ɽ��Ժ��']={'east'},
['����ɽ��Ժ']={'south'},
['÷ׯС·']={'south'},
['���̻���ƺ']={'south','east'},
['���̾�ľ��']={'west','east'},
['�����һ���']={'west'},
['���̺�ˮ��']={'east'},
['���������']={'east'},
['���̺�����']={'east','west'},
['���̾�����']={'west'},
['�置ɽ��']={'northup','northwest'},
['�������ֽ��Ժ']={'south'},

['��ɽ����������']={'west'},
['��ɽ��������Ժ']={'west'},
['��ɽ����ɽ·']={'east','northwest'},

['��ɽ�޵�']={'north'},
['���ݳǺ�Ժ']={'north'},
['�䵱ɽС��']={'south','west','east'},
['����ɽ������']={'north','west'},
['����ɽ��Ժ']={'north'},

['���޺��¹Ȼ��ٹ��']={'south'},
['���޺���ɽ����']={'southwest'},
['���޺����޺�']={'south','north','east'},
['���޺����¶���']={'west','east'},
['���޺����¶�']={'north'},
['���޺�С·']={'south','west'},
['���޺����߻�·']={'south','north','east'},

}

MidNight={
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['î']=false,
['��']=false,
['��']=false,
['��']=false,
['δ']=false,
['��']=true,
}


MidDay={
['��']=false,
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['î']=false,
['��']=false,
['��']=false,
['��']=false,
['δ']=false,
['��']=false,
}

MidHsDay={
['��']=false,
['��']=false,
['��']=false,
['��']=true,
['��']=true,
['��']=true,
['��']=true,
['î']=true,
['��']=false,
['��']=false,
['��']=false,
['δ']=false,
}

function yili_midnigth_judge()
    if locl.area=='�����' and locl.room=='�ϳ���' then 
	   return false
	end
	
	if locl.area=='���ݳ�' and locl.room=='�����' then 
	   return false
	end
	
	if job.name=='wudang' or job.name=='huashan' then 
	   return false
	end

    if locl.time=='��' or locl.time=='��' or locl.time=='��' or  locl.time=='��' then
	   return true
	end
    
	if locl.time=='��' and locl.time_sk=='��' then
       return true
    end	
	
	if locl.time=='��' and locl.time_sk=='����' then
       return true
    end	
	
	return false
	
end

function del_element(set,element)
    for i=1,table.getn(element) do
        set=delElement(set,element[i])
    end
    return set
end

function del_string(string,sub)
    local l_s,l_e
    for i=1,string.len(string) do
        l_s,l_e=string.find(string,sub)
	if l_s==nil then break end
	string=string.sub(string,1,l_s-1)..string.sub(string,l_e+1,string.len(string))
    end
    return string
end

function addrTrim(addr)
    addr=del_string(addr,'����')
    addr=string.gsub(addr,'С��','��ɽ��',1)
    addr=string.gsub(addr,'����������','������',1)
    addr=string.gsub(addr,'Ľ��','����Ľ��',1)
	--addr=string.gsub(addr,'����Ϫ��','������Ϫ��',1)
    return addr
end

goto_set={}
goto_set.lzdk=function()
    return goto('���ݳǴ�ɿ�')
end
goto_set.xy=function()
    return goto('�����ǵ���')
end
goto_set.sl=function()
    return goto('��ɽ���ִ��۱���')
end
goto_set.xs=function()
    return goto('��ѩɽ���Ŀ�')
end
goto_set.hs=function()
    return goto('��ɽ������')
end
goto_set.yz=function()
    return goto('���ݳǵ���')
end
goto_set.wd=function()
    return goto('�䵱ɽ�����')
end
goto_set.thd=function()
    return goto('�һ�������ͤ')
end
goto_set.dl=function()
    return goto('������ҩ��')
end

wxbGo=function()
    dis_all()
    return go(wxbAsk,"���ݳ�","����Ժ")
end
wxbAsk=function()
    create_trigger_f('wxbask',"^Τ����˵��������λ׳ʿ��������˵�����ǹԶ�������(\\D*)�������ء���",'','wxbGoto')
    Execute('ask wei chunfang about wei xiaobao')
end
wxbGoto=function(n,l,w)
    DeleteTemporaryTriggers()
    return goto(w[1])
end

function thdJiaohui()
    road.id=nil
	dis_all()
	return go(thdJiaohuiAsk,"�һ���","����ͤ")
end
function thdJiaohuiAsk()
    exe('ask huang yaoshi about �̻�')
	return check_heal()
end

function searchNpc(city,npc)
    if city then
       tmp.rooms = getCityRooms(city)
	end
	if npc then
	   tmp.npc = npc
	end
	tmp.rooms = tmp.rooms or {}
	tmp.sour = tmp.sour or "city/dangpu"
	while countTab(tmp.rooms) > 0 do
	      local l_sour = "city/dangpu"
	      if tmp.sour ~= "city/dangpu" then
		     l_sour = tmp.sour
		  end
	      local l_dest,l_distance=getNearRoom(l_sour,tmp.rooms)
		  if l_dest then
		     tmp.rooms = delElement(tmp.rooms,l_dest)
			 local l_path=map:getPath(l_sour,l_dest)
			 if l_path then
			    tmp.sour = l_dest
		        return go(searchNpcLocate,l_dest,'',l_sour)
		     end
		  else
		     tmp.rooms = {}
		  end
    end	
	ColourNote ("white","blue","Object������ϣ�")
	printTab(tmp.objs)
end
function searchNpcLocate()
    locate()
	return check_halt(searchNpcAdd,1)
end
    --����ɽ����ɽclimb֮ǰ��room�����ȴ�<<EOF
    klffsclimb=function()
        exe('open door;out')
        return walk_wait()
    end--EOF
function searchNpcAdd()
    tmp.objs = tmp.objs or {}
    for p,q in pairs(locl.id) do
	    Note(p .." = "..q)
		if tmp.npc and p == tmp.npc then
		   exe('follow '.. q)
		   return disAll()
		end
	    if ItemGet[p] or weaponStore[p] or weaponThrowing[p] or drugBuy[p] or drugPoison[p] or itemSave[p] then
		   locl.id[p] = nil
		end
		if string.find(p,"�ڳ�") or string.find(p,"����") or string.find(p,"��ƪ") or string.find(p,"��Ҫ") or string.find(p,"�佫") or string.find(p,"�ٱ�") or string.find(p,"���ϵ�") or string.find(p,"����") or string.find(p,"��ʦ") or string.find(p,"����") or string.find(p,"����") or string.find(p,"�趨��������") or string.find(p,"��ʬ") or string.find(p,"Ůʬ") or string.find(p,"ʬ��") or string.find(p,"�ϵ���") or string.find(p,"�����") or string.find(p,"�׼�") or string.find(p,"����") or string.find(p,"����") then
		   locl.id[p] = nil
		end
		if p == score.name or MudUser[p] then
		   locl.id[p] = nil
		end
		if locl.item[p]["cloth"] or locl.item[p]["shoes"] or locl.item[p]["shoe"] or locl.item[p]["blade"] or locl.item[p]["sword"] then
		   locl.id[p] = nil
		end
		if map.rooms[tmp.sour] and map.rooms[tmp.sour].objs and type(map.rooms[tmp.sour].objs)=="table" then
		   for k in pairs(map.rooms[tmp.sour].objs) do
		       if p == k then
			      locl.id[p] = nil
			   end
		   end
		end
	end
    if countTab(locl.id) > 0 then
	   for p,q in pairs(locl.id) do
		   tmp.objs[tmp.sour] = tmp.objs[tmp.sour] or {}
		   tmp.objs[tmp.sour].objs = tmp.objs[tmp.sour].objs or {}
		   ColourNote ("white","blue",p.." = "..q)
		   tmp.objs[tmp.sour].objs[p] = q
	   end
	end
    return searchNpc()
end

function locateroom(where)
   local l_dest={}
   where = Trim(where)
   if string.find(where,"/") then
      local l_path=map:getPath("xiangyang/dangpu",where)
      if l_path then
         return where
	  end
   else
      l_dest.room,l_dest.area=getAddr(Trim(where))
   end
   if l_dest.area then
      local l_rooms=getRooms(l_dest.room,l_dest.area)
	  for k,v in pairs(l_rooms) do
	      local l_path=map:getPath("xiangyang/dangpu",v)
          if l_path then
             return l_dest.area,l_dest.room
		  end
	  end
   end
   
   for p in pairs(map.rooms) do
       if map.rooms[p].objs then
	      for k in pairs(map.rooms[p].objs) do
		      if k == where then
			     local l_path=map:getPath("xiangyang/dangpu",p)
                 if l_path then
			        return p
			     end
			  end
		  end
	   end
   end
   return false
end

--------------------- ɽ�� ---------------------------

function bohuacongright()
    wait.make(function()
	    locate_finish=0
	    fastLocate(coroutine.running())
		coroutine.yield()
		if locl.room_relation=='ɽ�ڣ���·ɽ��'  or  locl.room_relation=='ɽ�ڡ������У���·ɽ��' then
	        return check_bei(bohuacong_right)
	    else
	        return go(road.act)
	    end	
	end)
end


bohuacong_right=function()
         wait.make(function()
                  exe('right')
				  locate_finish=0
				  fastLocate(coroutine.running())
				  coroutine.yield()
				  return hudieguin_check_right()
            end)
end

hudieguin_check_right=function()
  if locl.room == "������" then
	 return walk_wait()
  elseif locl.room == "ɽ��" then
      return bohuacong_right()
  end
end




function bohuacongcheck()
    wait.make(function()
	    locate_finish=0
	    fastLocate(coroutine.running())
		coroutine.yield()
		if locl.room_relation=='ɽ�ڣ���·ɽ��' then
	        return check_bei(bohuacong)
	    else
	        return go(road.act)
	    end	
	end)
end


 bohuacong=function()
         exe('whisper startd ����')
         wait.make(function()
                  wait.time(1.0)
                  exe('right')
				  wait.time(1.0)
				  locate_finish=0
				  fastLocate(coroutine.running())
				  coroutine.yield()
				  --wait.time(1.0)
				  --locate_finish='bohuaconggo'
				  return hudieguin_check()
            end)
end
	
hudieguin_check=function()
  if locl.room == "������" then
     --return bohuaconggo()
	 return walk_wait()
  elseif locl.room == "ɽ��" then
      return bohuacong()
  end

end
	
 bohuaconggo=function()
            locate_finish=0
            if locl.room=="������" then
               --EnableTriggerGroup("hdghuacong",false)
                return walk_wait()
            else
                 return go_locate()
            end
end

dirReverse = {
   ["up"] = "down",
   ["down"] = "up",
   ["east"] = "west",
   ["west"] = "east",
   ["eastup"] = "westdown",
   ["westup"] = "eastdown",
   ["eastdown"] = "westup",
   ["westdown"] = "eastup",
   ["south"] = "north",
   ["north"] = "south",
   ["southup"] = "northdown",
   ["northup"] = "southdown",
   ["southdown"] = "northup",
   ["northdown"] = "southup",
   ["southeast"] = "northwest",
   ["southwest"] = "northeast",
   ["northeast"] = "southwest",
   ["northwest"] = "southeast",
   ["enter"] = "out",
   ["out"] = "enter",
}
function mjlujingLog(jname)
    local filename = GetInfo (67) .. "lujing\\" .. score.id .. '����'..jname..'·��'..os.date("%Y%m%d_%Hʱ%M��%S��") .. ".log"
   
    local file = io.open(filename,"w")
   
    local t = {}
   
    for i = 1,GetLinesInBufferCount() do
        table.insert(t,GetLineInfo(i,1))
    end
   
    local s = table.concat(t,"\n") .. "\n"
	
	file:write(s)
   
    file:close()
end
-------------------��÷ׯ------------------------------
function inmz()
	tmp.way = "south"
	tmp.ml = "in"
   fastLocate()
   wait.make(function() 
	    wait.time(3)
		if flag.find==1 then return end	
        return wayMl()
   end)
end
function inmzcheck()
    if locl.room_relation=='С·��С·��÷��С·' then
		exe('s')
		if flag.find==1 then return end	
		return walk_wait()
	else
		if flag.find==1 then return end	
		return go_locate()
	end
end
-----------------------------------------------��÷��-------------------------------------
function mlOutt()
	tmp.cnt=0
	exe('look')
	wait.make(function() 
        wait.time(2.5)
        if flag.find==1 then return end	 
		exe('n')
        return mloutdo()
    end) 
end
function mloutdo()
	fastLocate()
	wait.make(function() 
        wait.time(1)
        if flag.find==1 then return end	 
        if locl.room~='÷��' then
			return path_consider()
	    else
			return mlOut()
		end
	end)
end
function mlOut()
    tmp.way = "north"
	tmp.ml = "out"
	exe('w;e;n')
	fastLocate()
	return checkWait(wayMl,0.5)
end
function wait_seconds()
	wait.make(function()
         wait.time(5)
	return wayMl()
    end)
end
function wayMl()
	tmp.cnt=tmp.cnt+1
	if tmp.cnt>50 then
	   tmp.cnt=0
	   return wait_seconds()
	end
    local ways = {
		["north"] = "east",
		["east"]  = "south",
		["south"] = "west",
		["west"]  = "north",
	}
	local wayt = {
		["north"] = "west",
		["east"]  = "north",
		["south"] = "east",
		["west"]  = "south",
	}
	if not tmp.way or not ways[tmp.way] then
	   tmp.way = 'south'
	end
	if locl.room=="��ʯ���·" then
	   if tmp.ml and tmp.ml=="in" then
	      return wayMlOver()
	   else
	      tmp.way = "north"
	      exe(tmp.way)
		  fastLocate()
		  return checkWait(wayMl,0.5)
	   end 
    end
    if locl.room=="С·" then
	   if tmp.ml and tmp.ml=="out" then
		  print('������')
		  exe('n')
	      return wayMlOver()
	   else
	      tmp.way = "south"
	      exe('south;south')
		  locate()
		  return checkWait(wayMl,0.5)
	   end 
    end
    if locl.room~="С·" and locl.room~="��ʯ���·" and locl.room~="÷��" then
       return wayMlOver()
    end	
	tmp.way = ways[tmp.way]
	repeat 
       if not locl.exit[tmp.way] then
	      Note(tmp.way)
	      tmp.way = wayt[tmp.way]
       end
	until(locl.exit[tmp.way])
	exe(tmp.way)
	fastLocate()
	return checkWait(wayMl,0.5)
end
function wayMlOver()
	return path_consider()
    --return walk_wait()
end
-------------------------------------------------------------------------------------------
hdgleavein=function()
DeleteTriggerGroup("miaopucheck")
create_trigger_t('miaopucheck1','^>*\\s*������һ������Ȼ��ǰһ��������һ���ݾ�','','hdgupp')   
create_trigger_t('miaopucheck2','^>*\\s*��� "action" �趨Ϊ "�뿪��������" �ɹ���ɡ�','','hdgingoon')   
SetTriggerOption("miaopucheck1","group","miaopucheck")
SetTriggerOption("miaopucheck2","group","miaopucheck")
EnableTriggerGroup("miaopucheck",true)
      hdgup=0
      if flag.find==1 then return end        
      exe('nd')
          return hdgdown()
end
hdgupp=function()
        EnableTimer('walkWait4',false)
        if flag.find==1 then return end
        hdgup=1
        wait.make(function() 
            wait.time(1)
            return hdgingoon()
        end)
end
hdgdown=function()
        if flag.find==1 then return end
        hdgup=0
        create_timer_s('walkWait4',0.5,'hdgrun')
end
hdgrun=function()
   exe('nd;n;n;nd;n;n;nd;n;n;nd;n;n;yun jing;yun jingli')
end
hdgingoon=function()
        if flag.find==1 then return end
        EnableTriggerGroup("miaopucheck",true)        
        if hdgup==0 then
                return hdgdown()
        else
                hdgup=0
            EnableTriggerGroup("miaopucheck",false)        
            exe('n;n')
            return walk_wait()
        end
end

--�������᷿���鷿��֮ǰ��room�����ȴ�<<EOF
yzwxiangfang2shufang=function()
    exe('n')
    return walk_wait()
end--EOF
--������������鷿��֮ǰ��room�����ȴ�<<EOF
yzwdating2shufang=function()
    exe('e')
    return walk_wait()
end--EOF
--�����볤�ȵ��鷿��֮ǰ��room�����ȴ�<<EOF
yzwchanglang2shufang=function()
    exe('w')
    return walk_wait()
end--EOF
--������˽�ӵ��鷿��֮ǰ��room�����ȴ�<<EOF
yzwsishu2shufang=function()
    exe('s')
    return walk_wait()
end--EOF
--�������鷿���бڣ�֮ǰ��room�����ȴ�<<EOF
yzwshufang2jiabi=function()
    exe('sit chair;zhuan')
    return walk_wait()
end--EOF

--------------------------����ϲ����ջ-----------------------------------------------
xfkz=function()
	exe('give xiao 5 silver;up')
	return checkWait(xfkz1,0.2)
end
xfkz1=function()
	if flag.find==1 then return end
    exe('enter')
	return checkWait(xfkz2,0.2)
end
xfkz2=function()
	if flag.find==1 then return end
    exe('out')
	return walk_wait()
end
xfkzoutgo=function()
	EnableTriggerGroup("xfkz",false)
	DeleteTriggerGroup("xfkz")
	exe('out;down;n')
	return walk_wait()
end
xfkzoutgosleep=function()
	  exe('north')
	  fastLocate()
	  return checkWait(xfkzout1,0.3)
end
xfkzout1=function()
	DeleteTriggerGroup("xfkz")
	create_trigger_t('xfkz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','xfkzoutgo') 
	create_trigger_t('xfkz2','^>*\\s*��С��һ�µ���¥��ǰ������һ���������ţ����ס����$','','xfkzsleepgogo') 
	SetTriggerOption("xfkz1","group","xfkz")
	SetTriggerOption("xfkz2","group","xfkz")
	if locl.room_relation=="���֣�ϲ����ջϲ����ջ" then
		exe('up;enter;sleep')
	else
		return xfkzsleepgo()
	end
end
xfkzsleepgogo=function()
    EnableTriggerGroup("xfkz",false)
	DeleteTriggerGroup("xfkz")
	exe('n')
	return walk_wait()
end
xfkzsleepgo=function()
    EnableTriggerGroup("xfkz",false)
	DeleteTriggerGroup("xfkz")
	return walk_wait()
end
------------------------------�ۺ���ջ----------------------------------------
jhkz=function()
	exe('give xiao 5 silver;up')
	return checkWait(jhkz1,0.15)
end
jhkz1=function()
   if flag.find==1 then return end
   exe('north')
   return checkWait(jhkz2,0.15)
end
jhkz2=function()
   if flag.find==1 then return end
   exe('south')
   return walk_wait()
end
jhkzout=function()
	exe('east')
	fastLocate()
	return checkWait(jhkzcheck,0.3)
end
jhkzcheck=function()
	DeleteTriggerGroup("jhkz")
	create_trigger_t('jhkz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','jhkzoutgo') 
	create_trigger_t('jhkz2','^>*\\s*��ô�ţ����ס����$','','jhkzoutgogogo') 
	SetTriggerOption("jhkz1","group","jhkz")
	SetTriggerOption("jhkz2","group","jhkz")
    if locl.room_relation=="���ȡ��ۺ���ջ---����־ۺ���ջ" then
		exe('up;n;sleep')
	else 
		return jhkzoutgogo()
    end
end
jhkzoutgo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
    exe('s;d;e')
	return walk_wait()
end
jhkzoutgogogo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
    exe('e')
	return walk_wait()
end
jhkzoutgogo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
	return walk_wait()
end
-----------------------------------���ݿ͵�---------------------------------
szkedian=function()
	exe('give xiao 5 silver;up')
	return checkWait(szkedian1,0.15)
end
szkedian1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(szkedian2,0.15)
end
szkedian2=function()
   if flag.find==1 then return end
   exe('out')
   return walk_wait()
end
szkdout=function()
	exe('up;enter;out;down;w')
	return walk_wait()
end

-----------------------------������ջ---------------------------------------
bckz=function()
	exe('give xiao 5 silver;up')
	return checkWait(bckz1,0.15)
end
bckz1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(bckz2,0.15)
end
bckz2=function()
   if flag.find==1 then return end
   exe('out')
   return walk_wait()
end
bckzout=function()
	exe('west')
	fastLocate()
	wait.make(function() 
        wait.time(1.0)
	    return bckzcheck()
	end)
end
bckzcheck=function()
	if flag.find==1 then return end
	DeleteTriggerGroup("bckz")
	create_trigger_t('bckz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','bckzoutgo') 
	create_trigger_t('bckz2','^>*\\s*��ô�ţ����ס���Ǳ�����ջ����$','','bckzoutgogogo') 
	SetTriggerOption("bckz1","group","bckz")
	SetTriggerOption("bckz2","group","bckz")
    if locl.room_relation=="�͵��¥�������---������ջ---ƫ��������ջ" then
		exe('up;enter;sleep')
	else
		return bckzoutgogo()
    end
end
bckzoutgo=function()
	EnableTriggerGroup("bckz",false)
	DeleteTriggerGroup("bckz")
    exe('out;d;w')
	return walk_wait()
end
bckzoutgogogo=function()
	EnableTriggerGroup("bckz",false)
	DeleteTriggerGroup("bckz")
	exe('w')
	return walk_wait()
end
bckzoutgogo=function()
	EnableTriggerGroup("bckz",false)
	DeleteTriggerGroup("bckz")
	return walk_wait()
end




------------------------------��ɽӢ�ۿ�ջ----------------------------------------
fskz=function()
	exe('give xiao 5 silver;up')
	return checkWait(fskz1,0.15)
end
fskz1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(fskz2,0.15)
end
fskz2=function()
   if flag.find==1 then return end
   exe('out')
   return walk_wait()
end
fskzout=function()
	exe('east')
	fastLocate()
	wait.make(function() 
        wait.time(1.0)
	    return fskzcheck()
	end)
end
fskzcheck=function()
	if flag.find==1 then return end
	DeleteTriggerGroup("fskz")
	create_trigger_t('fskz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','fskzoutgo') 
	create_trigger_t('fskz2','^>*\\s*��ô�ţ����ס����$','','fskzoutgogogo') 
	SetTriggerOption("fskz1","group","fskz")
	SetTriggerOption("fskz2","group","fskz")
    if locl.room_relation=="��ջ��¥��Ӣ�ۿ�ջ---��ɽ�Ͻ�Ӣ�ۿ�ջ" then
		exe('up;enter;sleep')
	else
		return fskzoutgogo()
    end
end
fskzoutgo=function()
	EnableTriggerGroup("fskz",false)
	DeleteTriggerGroup("fskz")
    exe('out;d;e')
	return walk_wait()
end
fskzoutgogogo=function()
	EnableTriggerGroup("fskz",false)
	DeleteTriggerGroup("fskz")
	exe('e')
	return walk_wait()
end
fskzoutgogo=function()
	EnableTriggerGroup("fskz",false)
	DeleteTriggerGroup("fskz")
	return walk_wait()
end
-----------------------------�����ջ---------------------------------------
hckz=function()
	exe('give xiao 5 silver;up')
	return checkWait(hckz1,0.15)
end
hckz1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(hckz2,0.15)
end
hckz2=function()
   if flag.find==1 then return end
   exe('out;d;n')
   return walk_wait()
end


------------------------------���ݴ��ջ----------------------------------------
cangzhoukedian=function()
	exe('give xiao 5 silver;up')
	return checkWait(cangzhoukedian1,0.4)
end
cangzhoukedian1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(cangzhoukedian2,0.4)
end
cangzhoukedian2=function()
   if flag.find==1 then return end
   exe('out')
   return walk_wait()
end
czkdoutgo=function()
	EnableTriggerGroup("czkedianout",false)
	DeleteTriggerGroup("czkedianout")
	exe('out;down;s')
	return walk_wait()
end

czkedianoutgosleep=function()
	exe('south')
	fastLocate()
	wait.make(function() 
        wait.time(1)
		if flag.find==1 then return end
		return czkedianoutgosleepdo()
	end)
end
czkedianoutgosleep1=function()
	exe('north')
	fastLocate()
	wait.make(function() 
        wait.time(0.3)
		if flag.find==1 then return end
		return czkedianoutgosleepdo()
	end)
end
czkedianoutgosleepdo=function()
	locate_finish=0
	DeleteTriggerGroup("czkedianout")
	create_trigger_t('czkedianout1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','czkdoutgo') 
	create_trigger_t('czkedianout2','^>*\\s*��С��һ�µ���¥��ǰ������һ���������ţ����ס����$','','czkzgogo')
    create_trigger_t('czkedianout3','^>*\\s*���ﲻ������˯�ĵط���$','','czkzgogogo')  
	SetTriggerOption("czkedianout1","group","czkedianout")
	SetTriggerOption("czkedianout2","group","czkedianout")
	SetTriggerOption("czkedianout3","group","czkedianout")
	if locl.room_relation=='���֣����ջ���Ͻִ��ջ' then
	   exe('up;enter;sleep')
	else
	   return czkzgogogo()
	end
end
czkzgogo=function()
	EnableTriggerGroup("czkedianout",false)
	DeleteTriggerGroup("czkedianout")
	exe('south')
	return walk_wait()
end
czkzgogogo=function()
	EnableTriggerGroup("czkedianout",false)
	DeleteTriggerGroup("czkedianout")
	return walk_wait()
end


-----------------------------���ƿ�ջ---------------------------------------
tzkz=function()
	exe('give xiao 5 silver;up')
	return checkWait(tzkz1,0.15)
end
tzkz1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(tzkz2,0.15)
end
tzkz2=function()
   if flag.find==1 then return end
   exe('out;d;e')
   return walk_wait()
end


--------------������ջ------
nykz=function()
	exe('give xiao 5 silver;up')
	return checkWait(nykz2,0.15)
end
nykz2=function()
   if flag.find==1 then return end
   exe('down')
   return walk_wait()
end
nykzout=function()
	exe('w')
	fastLocate()
	wait.make(function() 
        wait.time(1.0)
	    return nykzcheck()
	end)
end
nykzcheck=function()
	if flag.find==1 then return end
	DeleteTriggerGroup("nykz")
	create_trigger_t('nykz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','nykzoutgo') 
	create_trigger_t('nykz2','^>*\\s*��ô�ţ����ס����$','','nykzoutgogogo') 
	SetTriggerOption("nykz1","group","nykz")
	SetTriggerOption("nykz2","group","nykz")
    if locl.room_relation=="�͵��¥�����Ҽ�-----��ջ��ջ" then
		exe('up;sleep')
	else
		return nykzoutgogo()
    end
end
nykzoutgo=function()
	EnableTriggerGroup("nykz",false)
	DeleteTriggerGroup("nykz")
    exe('d;w')
	return walk_wait()
end
nykzoutgogogo=function()
	EnableTriggerGroup("nykz",false)
	DeleteTriggerGroup("nykz")
	exe('w')
	return walk_wait()
end
nykzoutgogo=function()
	EnableTriggerGroup("nykz",false)
	DeleteTriggerGroup("nykz")
	return walk_wait()
end
------------------------------���ݿ�ջ----------------------------------------
lanzhoukedian=function()
	exe('give xiao 5 silver;up')
	return checkWait(lanzhoukedian1,0.4)
end
lanzhoukedian1=function()
   if flag.find==1 then return end
   exe('enter')
   return checkWait(lanzhoukedian2,0.4)
end
lanzhoukedian2=function()
   if flag.find==1 then return end
   exe('out')
   return walk_wait()
end
lzkdoutgo=function()
	EnableTriggerGroup("lzkedianout",false)
	DeleteTriggerGroup("lzkedianout")
	exe('out;down;e')
	return walk_wait()
end

lzkedianoutgosleep=function()
	exe('east')
	fastLocate()
	wait.make(function() 
        wait.time(1)
		if flag.find==1 then return end
		return lzkedianoutgosleepdo()
	end)
end
lzkedianoutgosleepdo=function()
	locate_finish=0
	DeleteTriggerGroup("lzkedianout")
	create_trigger_t('lzkedianout1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','lzkdoutgo') 
	create_trigger_t('lzkedianout2','^>*\\s*��С��һ�µ���¥��ǰ������һ���������ţ����ס����$','','lzkzgogo')
    create_trigger_t('lzkedianout3','^>*\\s*���ﲻ������˯�ĵط���$','','lzkzgogogo')  
	SetTriggerOption("lzkedianout1","group","lzkedianout")
	SetTriggerOption("lzkedianout2","group","lzkedianout")
	SetTriggerOption("lzkedianout3","group","lzkedianout")
	if locl.room_relation=='�͵��¥���͵�-----���ǿ͵�' then
	   exe('up;enter;sleep')
	else
	   return lzkzgogogo()
	end
end
lzkzgogo=function()
	EnableTriggerGroup("lzkedianout",false)
	DeleteTriggerGroup("lzkedianout")
	exe('east')
	return walk_wait()
end
lzkzgogogo=function()
	EnableTriggerGroup("lzkedianout",false)
	DeleteTriggerGroup("lzkedianout")
	return walk_wait()
end
------------------------------�ۺ���ջ----------------------------------------
jhkz=function()
	exe('give xiao 5 silver;up')
	return checkWait(jhkz1,0.4)
end
jhkz1=function()
   if flag.find==1 then return end
   exe('north')
   return checkWait(jhkz2,0.4)
end
jhkz2=function()
   if flag.find==1 then return end
   exe('south')
   return walk_wait()
end
jhkzout=function()
	exe('east')
	fastLocate()
	return checkWait(jhkzcheck,1)
end
jhkzcheck=function()
	DeleteTriggerGroup("jhkz")
	create_trigger_t('jhkz1','^>*\\s*��һ�����������þ������棬�ûһ���ˡ�$','','jhkzoutgo') 
	create_trigger_t('jhkz2','^>*\\s*��ô�ţ����ס����$','','jhkzoutgogogo')
    create_trigger_t('jhkz3','^>*\\s*���ﲻ������˯�ĵط���$','','jhkzoutgogo') 
	SetTriggerOption("jhkz1","group","jhkz")
	SetTriggerOption("jhkz2","group","jhkz")
	SetTriggerOption("jhkz3","group","jhkz")
    if locl.room_relation=='���ȡ��ۺ���ջ---����־ۺ���ջ' then
		exe('up;n;sleep')
	else 
		return jhkzoutgogo()
    end
end
jhkzoutgo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
    exe('s;d;e')
	return walk_wait()
end
jhkzoutgogogo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
    exe('e')
	return walk_wait()
end
jhkzoutgogo=function()
	EnableTriggerGroup("jhkz",false)
	DeleteTriggerGroup("jhkz")
	return walk_wait()
end


------------------------------------�¹Ȼ��ٹ��-----------------
eaea=function()
    --locate_finish='eaea_start'  
	--return fastLocate()
	
	wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
			if string.find(locl.room,'�¹Ȼ��ٹ��') then
			    while true do
				    exe('east;hug '..score.id)
					local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			        if l~=nil then break end 
				end
				return walk_wait()
			else
			    return go(road.act)
			end

    end)

end
eaea_start=function()
    locate_finish=0
    if string.find(locl.room,'�¹Ȼ��ٹ��') then
	      wait.make(function()
		     wait.time(0.5)
		     exe('east')  
			 wait.time(0.5)
             return eaea_over()
		  end)
	    
          --exe('east')  
          --return eaea_over()
       else
          return go(road.act)
       end
end
eaea_over=function()
    return walk_wait()
end

eaeab=function()
    --locate_finish='eaea_startb'   
    --return checkWait(fastLocate,0.5)
	
	wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
			if string.find(locl.room,'�¹Ȼ��ٹ��') then
			    while true do
				    exe('west;hug '..score.id)
					local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			        if l~=nil then break end 
				end
				return walk_wait()
			else
			    return go(road.act)
			end

    end)
	
	
end
eaea_startb=function()
    locate_finish=0
    if string.find(locl.room,'�¹Ȼ��ٹ��') then
	
	       wait.make(function()
		     wait.time(0.5)
		     exe('west')
			 wait.time(0.5)
             return eaea_overb()
		  end) 
          --exe('west')        
          --return eaea_overb()
       else
          return go(road.act)
       end
end
eaea_overb=function()
    return walk_wait()
end

eaeac=function()
    --locate_finish='eaea_startc'    
	--return fastLocate()
	
	wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
			if string.find(locl.room,'�¹Ȼ��ٹ��') then
			    while true do
				    exe('northwest;hug '..score.id)
					local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			        if l~=nil then break end 
				end
				return walk_wait()
			else
			    return go(road.act)
			end

    end)
	
	
	
end
eaea_startc=function()
     locate_finish=0
    if string.find(locl.room,'�¹Ȼ��ٹ��') then
	        wait.make(function()
		     wait.time(0.5)
		     exe('northwest')
			 wait.time(0.5)
             return eaea_overc()
		  end) 
	      
          --exe('northwest')      
          --return eaea_overc()
       else
          return go(road.act)
       end
end
eaea_overc=function()
    return walk_wait()
end

eaead=function()
    --locate_finish='eaea_startd'   
	--return fastLocate()
	
	wait.make(function()
            fastLocate(coroutine.running())
            coroutine.yield()
			if string.find(locl.room,'�¹Ȼ��ٹ��') then
			    while true do
				    exe('north;hug '..score.id)
					local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			        if l~=nil then break end 
				end
				return walk_wait()
			else
			    return go(road.act)
			end

    end)
	
	
end
eaea_startd=function()
    locate_finish=0
    if string.find(locl.room,'�¹Ȼ��ٹ��') then
	      wait.make(function()
		     wait.time(0.5)
		     exe('north')
			 wait.time(0.5)
             return eaea_overd()
		  end) 
          --exe('north')
          --return eaea_overd()
       else
          return go(road.act)
       end
end
eaea_overd=function()
    return walk_wait()
end
-------------------------------������� new  -------------------------------
function yilichengenter()
       fastLocate()
	   
end

----------------------------------�������------------------------------------
check_yilitriger=function()
        DeleteTriggerGroup("yilidoorr")
        --create_trigger_t('yilidoorr1','^>*\\s*Ҫ��ʲô','','yilidoor_close')
        --create_trigger_t('yilidoorr2','^>*\\s*������','','yilidoor_open')
        create_trigger_t('yilidoorr3',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','yilicheckwd')
        --SetTriggerOption("yilidoorr1","group","yilidoorr")
        --SetTriggerOption("yilidoorr2","group","yilidoorr")
        SetTriggerOption("yilidoorr3","group","yilidoorr")
        EnableTriggerGroup("yilidoorr",false)
end
yilicheckwd=function()
        flag.idle = nil
        check_yilitriger()
        EnableTriggerGroup("yilidoorr",true)
        --exe('look north')
        fastLocate()
        if flag.find==1 then return end
        wait.make(function()
            wait.time(2)
            return yilidoor_checkk()
        end)
end
yilidoor_close=function()
        exe('yun qi;dazuo '..hp.dazuo)
end
yilidoor_open=function()
        wdyilidz=0
        
end


yilidoor_checkk=function()
    if locl.room_relation=='�ϳ��ţ�������ϳ���' then
           wait.make(function()
              wait.time(1)
			if job.name=='wudang' and job.ori_where~=nil and flag.search_yili_center==1 then 
			    EnableTriggerGroup("yilidoorr",false)
			    return wudangYiliFindFail()
			end
			return yilidoor_close()
          --return yilicheckwd()
           end)
        elseif locl.room_relation=='�����ģ��ϳ��ţ�������ϳ���' then
           EnableTriggerGroup("yilidoorr",false)
           return check_halt(yilidoor_over)
        else
           return go_locate()
        end
end
yilidoor_over=function()
       exe('n')
           if flag.find==1 then return end
           return walk_wait()
end
yilicheckwds=function()
        fastLocate()
        if flag.find==1 then return end
        wait.make(function()
            wait.time(2)
            return yilidoor_checkks()
        end)
end
yilidoor_checkks=function()
        if locl.room=='�ϳ���' then
           return check_halt(yilidoor_overs)
        else
           return go_locate()
        end
end
yilidoor_overs=function()
       exe('s')
           if flag.find==1 then return end
           return walk_wait()
end
-----------------�������ŵ���------------
function fznm()
   if flag.find==1 then return end
   return check_halt(fznmcheck)
end
function fznmcheck()
           wait.make(function()
               wait.time(3)
               exe('n;n;w;w;w;w;nw;sw;sw;w;sw;sw;sw;sw;w;s;sd;sd;s;s;s;s;e;e;e;e;e;e')
               return fznmcheckdo1()
           end)
end
function fznmcheckdo1()
        if flag.find==1 then return end
    exe('e')
        return checkWait(fznmcheckdo2,0.1)
end
function fznmcheckdo2()
        if flag.find==1 then return end
    exe('ne')
        return checkWait(fznmcheckdo3,0.1)
end
function fznmcheckdo3()
        if flag.find==1 then return end
    exe('ne')
        return checkWait(fznmcheckdo4,0.1)
end
function fznmcheckdo4()
        if flag.find==1 then return end
    exe('ne')
        return checkWait(fznmcheckdo5,0.1)
end
function fznmcheckdo5()
        if flag.find==1 then return end
    exe('n')
        return walk_wait()
end
function fznmdq()
        return fznmdqcheck()
end
function fznmdqcheck()
           wait.make(function()
               wait.time(3)
                   if flag.find==1 then return end
               exe('s;sw;sw;sw;w;w;w;w;w;w;w;n;n;n;n;nu;nu;n;e;ne;ne;ne;ne;e;ne;ne;se;e')
               return fznmdqcheckdo1()
           end)
end
function fznmdqcheckdo1()
        if flag.find==1 then return end
    exe('e')
        return checkWait(fznmdqcheckdo2,0.1)
end
function fznmdqcheckdo2()
        if flag.find==1 then return end
    exe('e')
        return checkWait(fznmdqcheckdo3,0.1)
end
function fznmdqcheckdo3()
        if flag.find==1 then return end
    exe('e')
        return checkWait(fznmdqcheckdo4,0.1)
end
function fznmdqcheckdo4()
        if flag.find==1 then return end
    exe('s')
        return checkWait(fznmdqcheckdo5,0.1)
end
function fznmdqcheckdo5()
        if flag.find==1 then return end
    exe('s')
        return walk_wait()
end
-------------���϶�--------------
jldin=function()
   SetSpeedWalkDelay(100)
   DeleteTriggerGroup("jldin")
   create_trigger_t('jldin1','^>*\\s*������û�л��ۣ���ô�ܽ�����ɽ����','','jldfalse')
   SetTriggerOption("jldin1","group","jldin")
   EnableTriggerGroup("jldin",true)
	wait.make(function() 
          wait.time(1.5)
    exe('get fire;use fire')
	if flag.wait==1 then return end	
	exe('e')
	if flag.wait==1 then return end	
	exe('n')
	if flag.wait==1 then return end	
	exe('ne')
	if flag.wait==1 then return end	
	exe('nw')
	if flag.wait==1 then return end	
	exe('s')
	if flag.wait==1 then return end	
	exe('se')
	if flag.wait==1 then return end	
	exe('sw')
	if flag.wait==1 then return end	
	exe('w')
	if flag.wait==1 then return end	
	exe('out')
	if flag.wait==1 then return end	
	return jldinover()
	end)
end
jldfalse=function()
	EnableTriggerGroup("jldin",false)
	SetSpeedWalkDelay(speed_walk_delay)
	return check_food()
end
function jldinover()
	EnableTriggerGroup("jldin",false)
	SetSpeedWalkDelay(speed_walk_delay)
    walk_wait()
end
jldout=function()
   SetSpeedWalkDelay(100)
   exe('drop fire;leave;leave;leave;leave;out;ne;ed;ne;ed;ne')
   locate_finish='jldout1'
   return check_busy(locate)
end
jldout1=function()
   wait.make(function() 
	   wait.time(1) 
       if locl.room_relation=='���϶����϶�' then
	      return jldout()
       else
	      SetSpeedWalkDelay(speed_walk_delay)
	      return walk_wait()
       end
   end)
end
---------------�����ʯ��----------------------
shikuyin=function()
	    DeleteTriggerGroup("kdizi")
        create_trigger_t('kdizi1',"^>*\\s*���µ��ӡ�ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','shikuyin00')
        create_trigger_t('kdizi2','^(> )*����û������ˡ�','','shiku_check_corpse') 
		create_trigger_t('kdizi3','^(> )*�㽫���µ��ӵ�ʬ������������ڱ��ϡ�','','shikuyin01') 
		--create_trigger_t('kdizi4','^(> )*�㸽��û������������','','shikuyin02') 
		--create_trigger_t('kdizi5','���µ���\(Luyi dizi\)','','shikuyin02') 
		
        SetTriggerOption("kdizi1","group","kdizi")
		SetTriggerOption("kdizi2","group","kdizi")
		SetTriggerOption("kdizi3","group","kdizi")
		SetTriggerOption("kdizi4","group","kdizi")
		
		
		EnableTriggerGroup("kdizi",true)
	    wait.make(function() 
	        wait.time(2)
	        exe('s;w;n;kill luyi dizi')
	    end)
	end
function shiku_check_corpse()
corpsehave=0
EnableTriggerGroup("kdizi",false)
	exe('s;e;n')	
	return check_bei(shikuyin1)	      
end
shikuyin00=function()
    ---EnableTriggerGroup("kdizi",false)
	---corpsehave=1
	exe('get corpse')	
	    ---return check_bei(shikuyin1)	      
end

shikuyin01=function()
    EnableTriggerGroup("kdizi",false)
	corpsehave=1
	wait.make(function() 
	        wait.time(2)
	        exe('halt;s;e;n')
			return check_bei(shikuyin1)	 
    end)
         
end

shikuyin02=function()
    --EnableTriggerGroup("kdizi",false)
	--corpsehave=1
	exe('kill dizi')	
	    --return check_bei(shikuyin1)	      
end

shikuyin1=function()
    EnableTriggerGroup("kdizi",false)
	DeleteTriggerGroup("keyu")
    create_trigger_t('keyu1','^>*\\s*������̤���������ϣ��辢Ծ�𣬽�������������ı���һ�㡣����Ծ���԰�','','shikuyin3')    
	create_trigger_t('keyu2','^>*\\s*������־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','kill_yu')  
	create_trigger_t('keyu3',"^>*\\s*����ǰһƬ�ڰ�����ͨһ������ˤ��ˮ�У����¼�����ԭ������֮�¾��Ǹ���Ԩ��",'','check_eyu')
	create_trigger_t('keyu4',"^>*\\s*���㡸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','eyu_finish')
	create_trigger_t('keyu5',"^>*\\s*������������ɱ���㣡",'','kill_yu')
	create_trigger_t('keyu6',"^>*\\s*(\\D*)��һ��������һ����һ�������Ԩ�С�",'','kill_yu')
	create_trigger_t('keyu7',"^>*\\s*����û������ˡ�",'','eyu_wait')
    SetTriggerOption("keyu1","group","keyu")
	SetTriggerOption("keyu2","group","keyu")
	SetTriggerOption("keyu3","group","keyu")
	SetTriggerOption("keyu4","group","keyu")
	SetTriggerOption("keyu5","group","keyu")
	SetTriggerOption("keyu6","group","keyu")
	SetTriggerOption("keyu7","group","keyu")
	EnableTriggerGroup("keyu",true)
	exe('tui zhonglu;tui eastlu zhong;tui westlu east;tui zhonglu west')
end
function kill_yu()
EnableTriggerGroup("keyu",true)
EnableTrigger("keyu5",false)
exe('look')
--exe('set wimpy 100')
--exe('unset wimpy;set wimpycmd pfmpfm\\hp')
exe('set wimpycmd pfmpfm\\hp;set wimpy 100')
--exe('unset no_kill_ap;yield no')
exe('kill yu')
end

function check_eyu()
    exe('look')
    if corpsehave==0 then
        return check_busy(eyu_check)
    else
        return check_busy(eyu_finish)
    end
end

function corpse_check()
    if not locl.id["�����ʬ��"] or locl.id["���µ��ӵ�ʬ��"] then
        return check_bei(eyu_wait)
    else
        exe('ta corpse')
    end
end

function eyu_check()
    flag.idle = nil
    exe('look')
    locate()
	--fastLocate()
    if not locl.id["����"] then
        return check_busy(corpse_check)
    else
        return check_busy(kill_yu)
    end
end
eyu_wait=function()
DeleteTriggerGroup("eyu_wait")
create_trigger_t('eyu_wait1',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','eyu_check')
SetTriggerOption("eyu_wait1","group","eyu_wait")
flag.idle = nil
exe('yun qi;dazuo '..hp.dazuo)
end
function eyu_finish()
checkWait(locate,2)
exe('halt;drop corpse;ta corpse')
end
shikuyin3=function()
   EnableTriggerGroup("keyu",false)
    EnableTriggerGroup("eyu_wait",false)
   DeleteTriggerGroup("eyudong")  
	EnableTimer('walkWait4',false)
    create_trigger_t('eyudong1','^>*\\s*����ǰ��Ȼһ����ɽ��Խ��Խ�󣬵���Խ��Խƽ����','','shikuyin5_check')    
    SetTriggerOption("eyudong1","group","eyudong")
	EnableTriggerGroup("eyudong",true)
	
	exe('set wimpycmd pfmpfm\\hp;set wimpy 100')
	exe('kill e yu;drop corpse;ta corpse;zuan dong')
	--exe('zuan dong')
	--[[wait.make(function()
	    wait.time(3)
	    exe('zuan dong')
	end)
	]]--
	return check_busy(shikuyin4)
end

shikuyin4=function()
	EnableTriggerGroup("eyudong",true)
	if flag.find==1 then return end
	exe('pa down')
	create_timer_s('walkWait5',1.5,'shikuyin4_check_do')
end

shikuyin4_check_do=function()	
	exe('kill e yu;drop corpse;ta corpse;zuan dong;pa down')
end

shikuyin5_check=function()
      nobusy=0
	EnableTriggerGroup("eyudong",false)
	EnableTimer('walkWait5',false)
	if flag.find==1 then return end
	return check_busy(walk_wait)
end

shikuout=function()
	DeleteTriggerGroup("outjqgshiku")
    create_trigger_t('outjqgshiku1','^>*\\s*�����Ƥ��ʳ������Ѿ����������Ű���Ƥ���һ������������','','shikuout1') 
	create_trigger_t('outjqgshiku2','^>*\\s*���Ѿ�����Ƥ���ˣ�����Ҫ�ٰ���Ƥ��','','shikuout1') 
    create_trigger_t('outjqgshiku3','^>*\\s*���Ѿ�������һ�˸��������м䣬������Ҫ��Ƥ��','','shikuout1')    
    SetTriggerOption("outjqgshiku1","group","outjqgshiku")
	SetTriggerOption("outjqgshiku2","group","outjqgshiku")
	SetTriggerOption("outjqgshiku3","group","outjqgshiku")
	--EnableTriggerGroup("outjqgshiku",false)
	create_timer_s('walkWait6',1.0,'shikuout_check_do')
end
shikuout_check_do=function()
	EnableTriggerGroup("outjqgshiku",true)
	exe('zhe shugan;bo shupi;cuo shupi')
end

shikuout1=function()
	EnableTriggerGroup("outjqgshiku",false)
	EnableTimer('walkWait6',false)
	wait.make(function()
	    wait.time(2)
	    return check_busy(shikuout11)
	end)
end
shikuout11=function()
	EnableTimer('walkWait6',false)
    wait.make(function()
	    wait.time(1)
        weapon_wield()
		return check_halt(shikuout2)
	end)
end
shikuout2=function()
	EnableTimer('walkWait6',false)
	exe('pa shibi')
	return check_bei(shikuout3)
end
shikuout3=function()
	exe('fu shugan;shuai shugan')
	return check_busy(shikuout4)
end
shikuout4=function()
	exe('pa up')
	return check_busy(shikuyin4_out_do)
end


shikuyin4_out_do=function()
	EnableTriggerGroup("outjqgshiku",false)
	return check_busy(walk_wait)
end
function cjbb()
exe('south')
 return walk_wait()
end
function cjna()
exe('north')
 return walk_wait()
end
function ncjb()
exe('west')
 return walk_wait()
end
function ncjn()
exe('east')
 return walk_wait()
end
---------�Ͻ�ɳĮ����------------
njsmcheck=function()
    print('njsmcheck..........')
    EnableTriggerGroup("fight_trigger",false)
    DeleteTriggerGroup("njsm_check")
    create_trigger_t('njsm_check1',"^һ��ů�����Ե�������ȫ�������������ָֻ���֪������",'','faint_check_njsm')
    SetTriggerOption('njsm_check1','group','njsm_check')
    EnableTriggerGroup("njsm_check1",true)
    faint_check_njsm()
end

function njsm_eat()
    ---exe('#3 drink jiudai;yun jing;yun jingli')
	wait.make(function()
	    wait_busy()
		exe('#3 drink jiudai;yun jing;yun jingli')
	end)
end

function njsm_goon()
    --exe('#3 drink jiudai;yun jing;yun jingli;#8 n')
	wait.make(function()
	    wait_busy()
		exe('#3 drink jiudai;yun jing;yun jingli;#8 n')
	end)
end

function faint_check_njsm()
  print('faint_check_njsm.............')
  if string.find(locl.room,'�Ͻ�ɳĮ') then
      njsm_eat()
      return check_busy(njsm_goon)
  elseif locl.room=="�¹Ȼ��ٹ��" then
      EnableTriggerGroup("njsm_check1",false)
      EnableTriggerGroup("fight_trigger",true)
      dis_all()
      njsm_eat()
      return walk_wait()
  end
end

---------------------����goto----------------
function gogo(where)
   print('gogo.......:'..where)
   local l_dest={}
   sour.id = nil
   dest.id = nil
   tmp.goto = true
   where = Trim(where)
   
   l_dest.area,l_dest.room = locateroom(where)
   
   if l_dest.area then
      return go(test,l_dest.area,l_dest.room)
   else
      return ColourNote ("red","blue","�Ҳ������޷������(�ص�|����)��"..where)
   end

end
-------����̲--------
function dutan()
    wait.make(function()
    wait.time(1.0)
    if flag.find == 1 or flag.wait==1 then return end
       exe("dutan")
       return walk_wait()
    end)
end
-------------------����ɮ�ᴦ��-------------
function slss1()
exe('s')
return walk_wait()
end
function slss2()
exe('n')
return walk_wait()
end
function slss3()
exe('s')
return walk_wait()
end
function slss4()
exe('n')
return walk_wait()
end
----------����----------------
yicm_time_check=function()
DeleteTriggerGroup("yitime_check")
create_trigger_t('yitime_check1',"^>*\\s*�������齣(\\D*)��(\\D*)��(\\D*)��(\\D*)ʱ(\\D*)�̡�",'','check_yltime')
SetTriggerOption("yitime_check1","group","yitime_check")
EnableTriggerGroup("yitime_check",true)
exe('time')
end
function check_yltime(n,l,w)
local l_type=tostring(w[1])
if l_type=='��' or l_type=='��' or l_type=='��' or l_type=='��' or l_type=='��' then
return false 
else
return yilicheckwd()
end
end
------------�������ƹ�����-------------------
function gosxh()
    locate_finish=0   
    fastLocate()
    return checkWait(gosxh_consider,1)
end
function gosxh_consider()
    if locl.room_relation=='�������ƹݣ�����----�����----����֣��鱦�������' then
	   prepare_neili_stop()
	   return checkWait(gosxh_go,1)
	   
	elseif locl.room_relation=='����----�����----����������' then
	   if job.name=='wudang' and job.ori_where~=nil and flag.search_yili_center==1 then 
			return wudangYiliFindFail()
	   end
	   return sxh_wait()
	   
	else
	   go(road.act)
	end 
end
function gosxh_go()
    exe('n')
    wait.make(function()
    wait.time(0.4)
    if flag.find == 1 or flag.wait==1 then return end
       return walk_wait()
    end)
end
function gozbd()
    locate_finish=0   
    fastLocate()
    return checkWait(gozbd_consider,1)
end
function gozbd_consider()
    if locl.room_relation=='�������ƹݣ�����----�����----����֣��鱦�������' then
	   prepare_neili_stop()
	   return checkWait(gozbd_go,1)
	   
	elseif locl.room_relation=='����----�����----����������' then
	    if job.name=='wudang' and job.ori_where~=nil and flag.search_yili_center==1 then 
			return wudangYiliFindFail()
	    end
	   return zbd_wait()
	   
	else
	   go(road.act)
	end
end
function gozbd_go()
    exe('s')
    wait.make(function()
    wait.time(0.4)
    if flag.find == 1 or flag.wait==1 then return end
       return walk_wait()
    end)
end
sxh_wait=function()
DeleteTriggerGroup("sxh_wait")
create_trigger_t('sxh_wait1',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','gosxh')
SetTriggerOption("sxh_wait1","group","sxh_wait")
flag.idle = nil
exe('yun qi;dazuo '..hp.dazuo)
end
zbd_wait=function()
DeleteTriggerGroup("zbd_wait")
create_trigger_t('zbd_wait1',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ����������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ��������ȫ���泩|�㽫�����������ڣ���ȫ���ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','gozbd')
SetTriggerOption("zbd_wait1","group","zbd_wait")
flag.idle = nil
exe('yun qi;dazuo '..hp.dazuo)
end


------------- ��������ɽ��  --------------------------------------

function ptslsm()
    EnableTriggerGroup("wipe",false)
    exe('knock gate;south')
	EnableTriggerGroup("wipe",true)
	if flag.find==1 then return end
    return walk_wait()
end

---- mtl �ƾ�¥ �����  ------------

function mtlcsg()
   return check_bei(mtlcsg_check_locate)
end

function mtlcsg_check_locate()
    wait.make(function()
	    fastLocate(coroutine.running())
		coroutine.yield()
		if locl.room == "�ƽ�¥" then 
		    return check_bei(mtlcsg_check_up)
		else
	        return go(road.act)
		end
	end)
end


function mtlcsg_check_up()
    wait.make(function()
		    while true do 
		        exe('up')
			    local l,w = wait.regexp("^(> )*(�����˺���һ������¥��������٢��ɽׯ�Ĳ������Ҳ����|�����\\s*-\\s*)",1)
			    if l~=nil then 
			        if string.find(l,"�����˺���һ��") then 
				        return check_bei(mtlcsg_check_wang)
				    else
				        return check_bei(mtlcsg_over)
				    end
			    end
		    end		    
	end)
end

function mtlcsg_over()
    if flag.find==1 then return end
	return walk_wait()
end


function mtlcsg_check_wang()
    DeleteTriggerGroup("mlt_cangshuge")
    create_trigger_t('mlt_cangshuge1',"^(> )*��������־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ",'','mtlcsg_over_a')
	create_trigger_t('mlt_cangshuge2',"^(> )*�����ˡ�ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����",'','mtlcsg_over_c')
    SetTriggerOption('mlt_cangshuge1','group','mlt_cangshuge')
	SetTriggerOption('mlt_cangshuge2','group','mlt_cangshuge')
	
    EnableTriggerGroup("mlt_cangshuge",true)
	EnableTriggerGroup("wipe",false)  
    wait.make(function()
	    exe('hit wang')
	end)
end

function mtlcsg_over_a()
	wait.make(function()
		while true do
		    exe('get wang')
			local l,w = wait.regexp("^(> )*(�㽫�����˷����������ڱ���|�㸽��û����������)",1)
			if l~= nil then 
			    if string.find(l,'�㸽��û����������') then 
				    return check_bei(mtlcsg_over_c)
				end
				break
			end
		end		
        return check_bei(mtlcsg_over_b)
	end)
end

function mtlcsg_over_b()
    wait.make(function()
	    while true do
		    exe('south;drop wang;kill wang')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			if l~=nil then break end
		end
	end)
end


function mtlcsg_over_c()
    EnableTriggerGroup("mlt_cangshuge",false)
	wait.make(function()
	    while true do
		    exe('south;south;north')
		    exe('hug '..score.id)
		    local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
		    if l~=nil then break end
		end
		return check_bei(mtlcsg_check_up)
	end)
end
