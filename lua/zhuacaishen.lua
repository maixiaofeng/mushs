--------半自动抓财神机器人------

--[[使用说明：
（1）输入“csgo”，根据rumor提示直接输入财神出现的地点，机器人就会自动赶往目的地展开搜索。
（2）如果有同名区域，请尽量输入完整的地名，例如：“菜地”有“华山村菜地”和“佛山菜地”，以免赶往错误地点。
（3）财神会瞬移，如果想增大抓获几率，请尽量在rumor出现财神位置时，第一时间赶过去。
（4）一次搜索没有找到的话，可以输入“stop”，然后输入“csgo”，再搜索一次。
（5）三次搜索都没有，可以暂时做任务，等待下一次提示后前去。
（6）不论是否抓到财神，机器人都会自动开始做任务。
（7）每隔一个整点抓一次财神，例如8点一次，9点一次，以此类推。
     如果在当前时间段内已经抓过，则无法继续抓，必须等到下一个整点。

最后，祝人人发大财！！！黄金爆满仓！！！]]

--------by 桃花岛无法风（2019.1.1）---------

--判断位置

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
	
	--先更新一下时间
	SetVariable('zhaocs_update_hour',cs_update_hour)
	SetVariable('zhaocs_update_min',cs_update_min)
	SetVariable('zhaocs_room_name',cs_location)
	SetVariable('zhaocs_last_flag','sucess') 
	
	caishen_room = cs_location
	
	if cs_cur_city == '华山' and caishen_room == '菜地' then 
	   SetVariable('zhaocs_city_name','华山村')
	   SetVariable('zhaocs_city_num', 1)
	   return ''
	end   
	
	---判断cityname 
	if cs_cur_room ~= cs_location then 	 
	   print('财神位置更新.....')
       --SetVariable('zhaocs_last_flag','sucess') 
	   
	   --记录最新的位置
       --SetVariable('zhaocs_room_name',cs_location)		
	   caishen_rooms={}
	   caishen_citys={}
	   caishen_rooms = getRooms(cs_location)
	   
	   if countTab(caishen_rooms)==1 then 
	     ---如果只有一个rooms，那么可以直接确定city
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
		  --多个房间也能确定是一个城市，则更新
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
	
	--如果当前小时等于最后抓财神的小时，那么返回
	if (cur_cs_hour == last_cs_hour) then 
	   return check_halt(check_food)
	end 
	
	--如果没有房间则返回继续作任务
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
	job.target = '赵公明'
	job.area = cs_area
	job.room = cs_room
	flag.find=0
	room_idx=0
	DeleteTriggerGroup("zhuacaishen_find")
	DeleteTrigger("zhuacaishen_find_success")
	create_trigger_t('zhuacaishen_find1','^(> )*\\s*财神 邯郸爷 赵公明\\(Zhao gongming\\)','','caishenTarget')
    create_trigger_t('zhuacaishen_find_success',"^(> )*财神爷为你增加了(\\D*)錠黄金存款",'','zhuacaishen_finish')
	create_trigger_t('zhuacaishen_find2','^(> )*这里没有 zhao gongming','','zhuacaishen_goon')
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
	create_trigger_t('zhuacaishen_find1','^(> )*\\s*财神 邯郸爷 赵公明\\(Zhao gongming\\)','','caishenTarget')
    create_trigger_t('zhuacaishen_find_success',"^(> )*财神爷为你增加了(\\D*)錠黄金存款",'','zhuacaishen_finish')
	create_trigger_t('zhuacaishen_find2','^(> )*这里没有 zhao gongming','','zhuacaishen_goon')
    SetTriggerOption("zhuacaishen_find1","group","zhuacaishen_find")
    SetTriggerOption("zhuacaishen_find2","group","zhuacaishen_find")
	EnableTrigger("zhuacaishen_find2",false)
    l_result=utils.inputbox ("你要抓的财神位于？", "财神位置", GetVariable("caishen_location"), "宋体" , "12")
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
      ColourNote ("red","blue","找不到或无法到达此(地点|人物)："..where)
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
	messageShow('抓财神任务：失败！！！！','red')
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
    messageShow('抓财神：已到达任务地点【'..job.area..job.room..'】，开始寻找【财神】','lime','black')
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
	messageShow('抓财神任务：完成！获得【'..w[2]..'】锭黄金！','red')
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
	create_trigger_t('egg1','金蛋\\(Gold','','egg_find')
	create_trigger_t('egg2','只听一声(\\D*)，金蛋','','egg_continue')
	create_trigger_t('egg4','你挥起\\D*对着金蛋砸下。$','','egg_continue')
	create_trigger_t('egg3','你只见眼前金光一闪，增加了(\\D*)点江湖声望','','egg_finish')
	create_trigger_t('egg5','你挥起\\D*狠狠地对着金蛋砸下，结果金蛋却纹丝不动','','egg_day_finish')
	create_trigger_t('egg6','^(> )*\\s*你要看什么？','','egg_no_find')

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
      ColourNote ("red","blue","找不到或无法到达此地点"..where)
	  SetVariable('egg_dizi','no_find')
	  EnableTriggerGroup("egg",false)
	  messageShow('砸金蛋任务：砸金蛋失败！找不到或无法到达此'..where,'red')
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
   messageShow('砸金蛋任务：完成！获得【'..w[1]..'】点声望！','red')
   if egg_num == 10 then 
       messageShow('砸金蛋任务：今天已经完成砸10次金蛋!','red')
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
   messageShow('砸金蛋任务：砸金蛋失败！','red')
   bqcheck()
   locate_finish=0
   return check_busy(huashan_fanhui)
end

function egg_day_finish()
   print('egg_finish...')
   EnableTriggerGroup("egg",false)
   SetVariable('egg_num',10)
   SetVariable('egg_dizi','no_find')
   messageShow('砸金蛋任务：今天已经完成砸10次金蛋!','red')
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
			local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			if l~=nil then break end 
		end
	end)
	
end

function egg_find()
   print('egg_find......')
   --messageShow('砸金蛋任务：开始砸金蛋!','red')
   --exe('wield sword 2')
   check_halt(zaegg)
end

function egg_continue()
   print('egg_continue......')
   check_halt(zaegg)
end
