--------���Զ�ץ���������------

--[[ʹ��˵����
��1�����롰csgo��������rumor��ʾֱ�����������ֵĵص㣬�����˾ͻ��Զ�����Ŀ�ĵ�չ��������
��2�������ͬ�������뾡�����������ĵ��������磺���˵ء��С���ɽ��˵ء��͡���ɽ�˵ء��������������ص㡣
��3�������˲�ƣ����������ץ���ʣ��뾡����rumor���ֲ���λ��ʱ����һʱ��Ϲ�ȥ��
��4��һ������û���ҵ��Ļ����������롰stop����Ȼ�����롰csgo����������һ�Ρ�
��5������������û�У�������ʱ�����񣬵ȴ���һ����ʾ��ǰȥ��
��6�������Ƿ�ץ�����񣬻����˶����Զ���ʼ������
��7��ÿ��һ������ץһ�β�������8��һ�Σ�9��һ�Σ��Դ����ơ�
     ����ڵ�ǰʱ������Ѿ�ץ�������޷�����ץ������ȵ���һ�����㡣

���ף���˷���ƣ������ƽ����֣�����]]

--------by �һ����޷��磨2019.1.1��---------

--�ж�λ��

caishen_rooms={}
caishen_citys={}
caishen_city=nil
caishen_room=nil

function rumor_cs_wz(name, line, wildcards, styles)
   print('rumor_cs_wz.............')
   color_chats(name, line, wildcards, styles)
   
   local new_city_name = wildcards[3]
   SetVariable('zhaocs_city_name',new_city_name)
end 

function rumor_zaegg(name, line, wildcards, styles)
   print('rumor_zaegg.............')
   color_chats(name, line, wildcards, styles)
   
   SetVariable('egg_auto',1)
   --SetVariable('egg_dizi','no_find')
   SetVariable('egg_num',0)

end 


function rumor_cs(name, line, wildcards, styles)
    print('rumor_cs.............')
    color_chats(name, line, wildcards, styles)
	
	local cs_location = wildcards[3]
	
	print('cs_location...'..cs_location)
	
	local cs_update_hour = tonumber(os.date("%H"))
	local cs_update_min = tonumber(os.date("%M"))
	local cs_cur_city = GetVariable('zhaocs_city_name')
	local cs_cur_room = GetVariable('zhaocs_room_name')
	
	--�ȸ���һ��ʱ��
	SetVariable('zhaocs_update_hour',cs_update_hour)
	SetVariable('zhaocs_update_min',cs_update_min)
	SetVariable('zhaocs_room_name',cs_location)
	SetVariable('zhaocs_last_flag','sucess') 
	
	caishen_room = cs_location
	
	if cs_cur_city == '��ɽ' and caishen_room == '�˵�' then 
	   SetVariable('zhaocs_city_name','��ɽ��')
	   SetVariable('zhaocs_city_num', 1)
	   return ''
	end   
	
	---�ж�cityname 
	if cs_cur_room ~= cs_location then 	 
	   print('����λ�ø���.....')
       --SetVariable('zhaocs_last_flag','sucess') 
	   
	   --��¼���µ�λ��
       --SetVariable('zhaocs_room_name',cs_location)		
	   caishen_rooms={}
	   caishen_citys={}
	   caishen_rooms = getRooms(cs_location)
	   
	   if countTab(caishen_rooms)==1 then 
	     ---���ֻ��һ��rooms����ô����ֱ��ȷ��city
	      caishen_city = getCity(caishen_rooms[1])
	      SetVariable('zhaocs_city_name',caishen_city)
		  SetVariable('zhaocs_city_num', 1)
	   else
	      local cur_city = ''
	      for k,v in pairs(caishen_rooms) do
			cur_city = getCity(v)
			if cur_city ~= '' and caishen_citys[cur_city] == nil then 
			      caishen_citys[cur_city] = 1
			end 
	      end
		  --�������Ҳ��ȷ����һ�����У������
          if countTab(caishen_citys) == 1 and cur_city ~= '' then 
		     SetVariable('zhaocs_city_name',cur_city)
			 caishen_city = cur_city
		  end 
          SetVariable('zhaocs_city_num', countTab(caishen_citys))	  
       end 
       	   
	end 
end



function zhuacaishen_job_judge()
    print('zhuacaishen_job_judge..............')
    local zhaocs_auto = tonumber(GetVariable('zhaocs_auto'))
    local cur_cs_hour = tonumber(os.date("%H"))
	local last_cs_hour = tonumber(GetVariable('zhaocs_finish_hour'))
	local cs_update_hour = tonumber(GetVariable('zhaocs_update_hour'))
	
	caishen_room = GetVariable('zhaocs_room_name')
	caishen_city = GetVariable('zhaocs_city_name')
	
	--�����ǰСʱ�������ץ�����Сʱ����ô����
	if (cur_cs_hour == last_cs_hour) then 
	   return check_halt(check_food)
	end 
	
	--���û�з����򷵻ؼ���������
	if (zhaocs_auto ~= 1) or (caishen_room == 'no_find_room') or ('caishen_city' == 'no_find_city') then 
	   return check_halt(check_food)
	end
	--local cs_where = caishen_city .. caishen_room
	return zhuacaishen_find_new(caishen_city,caishen_room)

end


function zhuacaishen_main()
	create_alias_s('csgo','csgo','zhuacaishen_find')
end


function zhuacaishen_find_new(cs_area,cs_room)
    print('zhuacaishen_find_new...........')
	job.name='zhuacaishen'
	job.target = '�Թ���'
	job.area = cs_area
	job.room = cs_room
	flag.find=0
	room_idx=0
	DeleteTriggerGroup("zhuacaishen_find")
	DeleteTrigger("zhuacaishen_find_success")
	create_trigger_t('zhuacaishen_find1','^(> )*\\s*���� ����ү �Թ���\\(Zhao gongming\\)','','caishenTarget')
    create_trigger_t('zhuacaishen_find_success',"^(> )*����үΪ��������(\\D*)�V�ƽ���",'','zhuacaishen_finish')
	create_trigger_t('zhuacaishen_find2','^(> )*����û�� zhao gongming','','zhuacaishen_goon')
    SetTriggerOption("zhuacaishen_find1","group","zhuacaishen_find")
    SetTriggerOption("zhuacaishen_find2","group","zhuacaishen_find")
	EnableTrigger("zhuacaishen_find2",false)
	zhuacaishen_go(job.area .. job.room)
end


function zhuacaishen_go_new()
    print('zhuacaishen_go_new...........')
    if countTab(caishen_rooms)==1 then 
	   return go(zhuacaishen_FindAct,caishen_city,caishen_room)
	elseif countTab(caishen_rooms) > 1 then 
       room_idx=1
	   jinhe_rooms = caishen_rooms
	   return go(zhuacaishen_FindAct,caishen_city,caishen_room)
	else
	   ColourNote ("red","blue","zhuacaishen_go_new fail.....")
	   return check_halt(check_food)
	end 
end 


function zhuacaishen_find()
	job.name='zhuacaishen'
	flag.find=0
	DeleteTriggerGroup("zhuacaishen_find")
	DeleteTrigger("zhuacaishen_find_success")
	create_trigger_t('zhuacaishen_find1','^(> )*\\s*���� ����ү �Թ���\\(Zhao gongming\\)','','caishenTarget')
    create_trigger_t('zhuacaishen_find_success',"^(> )*����үΪ��������(\\D*)�V�ƽ���",'','zhuacaishen_finish')
	create_trigger_t('zhuacaishen_find2','^(> )*����û�� zhao gongming','','zhuacaishen_goon')
    SetTriggerOption("zhuacaishen_find1","group","zhuacaishen_find")
    SetTriggerOption("zhuacaishen_find2","group","zhuacaishen_find")
	EnableTrigger("zhuacaishen_find2",false)
    l_result=utils.inputbox ("��Ҫץ�Ĳ���λ�ڣ�", "����λ��", GetVariable("caishen_location"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("caishen_location",l_result)
     end
	 zhuacaishen_go(GetVariable("caishen_location"))
end


function zhuacaishen_go(where)
   wdgostart=1
   local l_dest={}
   sour.id = nil
   dest.id = nil
   tmp.goto = true
   where = Trim(where)
   
   l_dest.area,l_dest.room = locateroom(where)
   
   if l_dest.area then
      return go(zhuacaishen_FindAct,l_dest.area,l_dest.room)
   else
      ColourNote ("red","blue","�Ҳ������޷������(�ص�|����)��"..where)
	  SetVariable('zhaocs_last_flag','fail2222') 
      return check_halt(check_food)
   end
end 

jobFindAgain = jobFindAgain or {}
jobFindAgain["zhuacaishen"] = "zhuacaishenFindAgain"
jobFindFail = jobFindFail or {}
jobFindFail["zhuacaishen"] = "zhuacaishenFindFail"

function zhuacaishenFindAgain()
    EnableTimer("walkWaitX",false)
   	job.area = GetVariable('zhaocs_city_name')
	job.room = GetVariable('zhaocs_room_name')
   zhuacaishen_go(job.area .. job.room)
end 

function zhuacaishenFindFail()
    print('zhuacaishenFindFail................')
	wdgostart=0
    job.name='idle'
	messageShow('ץ��������ʧ�ܣ�������','red')
	EnableTimer("walkWaitX",false)
	EnableTriggerGroup("zhuacaishen_find",false)
	EnableTrigger("zhuacaishen_find_success",false)
	SetVariable('zhaocs_last_flag','faillll') 
    return check_halt(check_food)
end  

function zhuacaishen_start()
	exe('follow zhao gongming')
	exe('worship zhao')
end
function zhuacaishen_FindAct()
	create_timer_s('walkWaitX',0.3,'zhuacaishen_start')
    job.flag()
    exe('look')
    messageShow('ץ�����ѵ�������ص㡾'..job.area..job.room..'������ʼѰ�ҡ�����','lime','black')
	return check_busy(find)
end
function caishenTarget()
	flag.find=1
    EnableTriggerGroup("zhuacaishen_find",false)
	EnableTrigger("zhuacaishen_find2",true)
	EnableTimer("walkWaitX",false)
	exe('follow zhao')
	exe('worship zhao')
end
function zhuacaishen_goon()
	flag.find=0
	EnableTriggerGroup("zhuacaishen_find",true)
	EnableTrigger('zhuacaishen_find2',false)
	EnableTimer("walkWaitX",true)
	return walk_wait()
end
function zhuacaishen_finish(n,l,w)
	job.name='idle'
	wdgostart=0
	messageShow('ץ����������ɣ���á�'..w[2]..'�����ƽ�','red')
	dis_all()
	EnableTriggerGroup("zhuacaishen_find",false)
	EnableTrigger("zhuacaishen_find_success",false)
	
	local cur_cs_hour = tonumber(os.date("%H"))
	SetVariable('zhaocs_finish_hour',cur_cs_hour) 
	SetVariable('zhaocs_last_flag','sucess') 
		
    return check_halt(check_food)
end

----------------------- egg  -----------------------------------

function egg()
    print('egg_find...........')
	DeleteTriggerGroup("egg")
	create_trigger_t('egg1','��\\(Gold','','egg_find')
	create_trigger_t('egg2','ֻ��һ��(\\D*)����','','egg_continue')
	create_trigger_t('egg4','�����\\D*���Ž����¡�$','','egg_continue')
	create_trigger_t('egg3','��ֻ����ǰ���һ����������(\\D*)�㽭������','','egg_finish')
	create_trigger_t('egg5','�����\\D*�ݺݵض��Ž����£������ȴ��˿����','','egg_day_finish')
	create_trigger_t('egg6','^(> )*\\s*��Ҫ��ʲô��','','egg_no_find')

	SetTriggerOption("egg1","group","egg")
	SetTriggerOption("egg2","group","egg")
	SetTriggerOption("egg3","group","egg")
	SetTriggerOption("egg4","group","egg")
	SetTriggerOption("egg5","group","egg")
	SetTriggerOption("egg6","group","egg")
end

function egg_go(where)
   EnableTriggerGroup("egg",true)
   local egg_num = tonumber(GetVariable('egg_num'))
   local l_dest={}
   sour.id = nil
   dest.id = nil
   tmp.goto = true
   where = Trim(where)
   
   l_dest.area,l_dest.room = locateroom(where)   
   if l_dest.area and egg_num<10 then
      exe('wield sword')
      return go(zaegg,l_dest.area,l_dest.room)
   else
      ColourNote ("red","blue","�Ҳ������޷�����˵ص�"..where)
	  SetVariable('egg_dizi','no_find')
	  EnableTriggerGroup("egg",false)
	  messageShow('�ҽ������ҽ�ʧ�ܣ��Ҳ������޷������'..where,'red')
      ---return check_halt(check_food)
	  bqcheck()
	  locate_finish=0
	  return check_busy(huashan_fanhui)
   end
    
end 

function egg_finish(n,l,w)
   print('egg_finish...')
   EnableTriggerGroup("egg",false)
   local egg_num = tonumber(GetVariable('egg_num'))
   egg_num = egg_num + 1
   SetVariable('egg_num',egg_num)
   SetVariable('egg_dizi','no_find')
   messageShow('�ҽ�������ɣ���á�'..w[1]..'����������','red')
   if egg_num == 10 then 
       messageShow('�ҽ����񣺽����Ѿ������10�ν�!','red')
	   SetVariable('egg_auto', 0)
   end 
   ---return check_halt(check_food)
   bqcheck()
   locate_finish=0
   return check_busy(huashan_fanhui)
end

function egg_no_find()
   print('egg_no_find...')
   EnableTriggerGroup("egg",false)
   SetVariable('egg_dizi','no_find')
   ---return check_halt(check_food)
   messageShow('�ҽ������ҽ�ʧ�ܣ�','red')
   bqcheck()
   locate_finish=0
   return check_busy(huashan_fanhui)
end

function egg_day_finish()
   print('egg_finish...')
   EnableTriggerGroup("egg",false)
   SetVariable('egg_num',10)
   SetVariable('egg_dizi','no_find')
   messageShow('�ҽ����񣺽����Ѿ������10�ν�!','red')
   SetVariable('egg_auto', 0)
   ---return check_halt(check_food)
   bqcheck()
   locate_finish=0
   return check_busy(huashan_fanhui)
end

function zaegg()
    --exe('wield sword')
    --exe('look egg;za egg')
	wait.make(function()
		while true do
  	        exe('look egg;za egg')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			if l~=nil then break end 
		end
	end)
	
end

function egg_find()
   print('egg_find......')
   --messageShow('�ҽ����񣺿�ʼ�ҽ�!','red')
   --exe('wield sword 2')
   check_halt(zaegg)
end

function egg_continue()
   print('egg_continue......')
   check_halt(zaegg)
end
