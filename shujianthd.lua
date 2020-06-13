require "wait"
require "tprint"
require "lujing"
require "chat"
require "jobtls"
require "rooms"
--require "emoted"smyteam
require "xuncheng"
require "skill"
require "weapon"
--require "hubiao"
require "show_switch"
require "dummy"
require "husong"
require "xueshan"
require "wudang"
require "clb"
require "huashan"
require "songmoya"
require "tdh"
require "songxin"
require "hqgzc"
require "dolost"
require "kezhiwugong"
require "diemenglou"
require "armor"
require "zhuacaishen"
require "taohuazhen"
require "duhe"
require "chuanfu"


-- 创建一个普通别名
function create_alias(a_name,a_match,a_response)
      return AddAlias(a_name,a_match,a_response,alias_flag.Enabled+alias_flag.Replace+alias_flag.RegularExpression,'')
end
-- 创建一个脚本别名
function create_alias_s(a_name,a_match,a_function)
      return AddAlias(a_name,a_match,'',alias_flag.Enabled+alias_flag.Replace,a_function)
end
-- 创建一个分定时器
function create_timer_m(t_name,t_min,t_function)
      return AddTimer(t_name,0,t_min,0,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace,t_function)
end
-- 创建一个秒定时器
function create_timer_s(t_name,t_second,t_function)
      return AddTimer(t_name,0,0,t_second,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace,t_function)
end
-- 创建一个一次性秒定时器
function create_timer_st(t_name,t_second,t_function)
      return AddTimer(t_name,0,0,t_second,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace+timer_flag.OneShot,t_function)
end
-- 创建一个触发器 
function create_trigger_t(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function)
end
-- 创建一个临时的触发器 
function create_trigger_f(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary,-1,0,"",t_function)
end
-- 创建一个临时的一次性触发器 
function create_trigger(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary+trigger_flag.OneShot,-1,0,"",t_function)
end
-- 创建一个ex触发器 
function create_triggerex_t(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,99)
end
function create_triggerex_t101(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,101)
end
function create_triggerex_lvl(t_name,t_match,t_response,t_function,lvl)
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,lvl)
end
-- 创建一个临时的触发器 
function create_triggerex_f(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary,-1,0,"",t_function,12,100)
end
-- 创建一个临时的一次性触发器 
function create_triggerex(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary+trigger_flag.OneShot,-1,0,"",t_function,12,100)
end
-- 创建一个临时的一次性定时器
function create_timer( t_name, t_time, t_com, t_function )
return AddTimer (
t_name,
0,
0,
t_time,
t_com,
timer_flag.Enabled + timer_flag.OneShot + timer_flag.TimerSpeedWalk + timer_flag.Replace + timer_flag.Temporary,
t_function
)
end
skills={}
--if hp.exp>800000 then
	 skillsLingwu={'force','finger','parry','dodge','strike','blade','cuff','claw','hand','leg','whip','club','sword','stick','hammer','dagger','brush','throwing','spear','staff','axe'}
--else
--skillsLingwu={'finger','parry','dodge','strike','blade','cuff','claw','hand','leg','whip','club','sword','stick','hammer','dagger','brush','throwing','spear','staff','axe'}
--end	

master={}

perform={}



hp={
jingxue=0,
jingxue_max=0,
jingxue_per=0,
jingli=0,
jingli_max=0,
jingli_lim=0,
qixue=0,
qixue_max=0,
qixue_per=0,
neili=0,
neili_max=0,
neili_lim=0,
food=100,
water=100,
pot=0,
pot_max=0,
exp=0,
heqi=0,
dazuo=10,
tuna=10,
shen=0
}
score={}
score.id='id'
score.name='name'
score.dex=20
score.dex_t=20
score.int=20
score.int_t=20
score.str=20
score.str_t=20
score.con=20
score.con_t=20
score.age=14
score.gold=0
score.tb=0
score.yb=0
score.jjb=0
lost_name=0
needdolost=0
flag={
xuexi=0,
lingwu=0,
lianxi=0,
prepare=0,
go=0,
find=0,
wait=0,
times=1,
gold=1,
duhe=1,
dujiang=1,
jixu=1,
wipe=0}
flag.autoll=1
flag.food=0
flag.month=0
flag.wxjz=0
flag.searchArea=nil
flag.searchRooms=nil
flagFull={}
tmp={}
condition={}
weapon={}
count={}
count.gold_max=15
count.nxw_max=20
count.cbw_max=20
count.hqd_max=20
count.cty_max=20
---count.nxw_max=1
---count.cbw_max=1
---count.hqd_max=1
---count.cty_max=1
count.hxd_max=5
count.dhd_max=5
drug={}
drug.heal='chantui yao'
drug.neili='neixi wan'
drug.neili2='chuanbei wan'
drug.neili3='huangqi dan'
drug.jingxue='huoxue dan'
bags={}
Bag = {}
team={}
xcexp=1
lingwudie=0
needxuexi=1
xxpot=0
xuefull=0
lookxin=0
leweapon='none'
jherror=0
inwdj=0
dugujian=0
l_pot=0
haltbusy=0
smyteam=16
tdhdz=1
smyall=2
lostno=10
vippoison=0
pumkmaivip=1
kdummy=0
mydummy=false
double_kill=nil
ypt_lianskills=0
scorexy=false
LLlost=0
needvpearl=0
doubleexp=0
dohs2=1
hsjob2=0
dzxy_level=0
need_dzxy='yes'
hqgzcjl=0
cty_cur=0
nxw_cur=0
cbw_cur=0
hqd_cur=0
hxd_cur=0
dhd_cur=0
kuang_cur=0
go_on_smy=0 --20161117增加变量go_on_smy开关控制 防止系统重启后自动打开颂摩崖
ebooktimes=0
lostletter_locate=""
ll={}
ll.area=''
ll.room=''
lian_times=0
pkheqi=1
xuezhu_require=0
wdgostart=0
wudang_cs=0
xswc_cs=0
hswc_cs=0
jc=0
hqgzcJobtime=0
pfm_xiangyun='死'
do_lost_again = tonumber(GetVariable('do_lost_again'))
shenqi_id=GetVariable('shenqi_id')
go_dp=0
drugBuy ={
["川贝内息丸"] = {"dali/yaopu","zhiye/yaodian1"},
["黄芪内息丹"] = {"dali/yaopu","zhiye/yaodian1"},
["内息丸"] = {"dali/yaopu","zhiye/yaodian1"},
["邪气丸"] = {"dali/yaopu","zhiye/yaodian1"},
["正气丹"] = {"dali/yaopu","zhiye/yaodian1"},
["养精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["补气丸"] = {"dali/yaopu","zhiye/yaodian1"},
["续精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["补食丹"] = {"dali/yaopu","zhiye/yaodian1"},
["补水丸"] = {"dali/yaopu","zhiye/yaodian1"},
["金疮药"] = {"dali/yaopu","zhiye/yaodian1"},
["疗精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["正气丹"] = {"dali/yaopu","zhiye/yaodian1"},
["邪气丸"] = {"dali/yaopu","zhiye/yaodian1"},
["延年养精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["茯苓补气丸"] = {"dali/yaopu","zhiye/yaodian1"},
["当归续精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["川贝内息丸"] = {"dali/yaopu","zhiye/yaodian1"},
["蝉蜕金疮药"] = {"dali/yaopu","zhiye/yaodian1"},
["活血疗精丹"] = {"dali/yaopu","zhiye/yaodian1"},
["解毒丸"] = {"dali/yaopu","zhiye/yaodian1"},
["大还丹"] = "city/dangpu",
["火折"] = "xueshan/laifu",
["牛皮酒袋"] = {"xiangyang/lzz/jiuguan"},

}

drugPoison={
["九花玉露丸"] = true,
}

-- ain

local cun_hammer = tonumber(GetVariable("autocun_hammer"))
if cun_hammer==1 then 
	itemSave={
		["倚天匠技残篇"] = true,
		["屠龙匠技残篇"] = true,
		["韦兰之锤"] = true,
		["金铁锤"] = true,
		["神铁锤"] = true,
			}
else
	itemSave={
		["倚天匠技残篇"] = true,
		["屠龙匠技残篇"] = true,
		["韦兰之锤"] = true,
		["金铁锤"] = true,
		["神铁锤"] = true,
		}
end

i=1

check_skills=function(n,l,w)

   local l_skills=" "
   if w[3] then
      l_skills= l_skills .. w[3]
   end
   if w[4] then
      l_skills= l_skills .. w[4]
   end
   if w[5] then
      l_skills= l_skills .. w[5]
   end
   l_skills=Trim(l_skills)
   skills[l_skills] = skills[l_skills] or {}
   skills[l_skills].lvl=tonumber(w[6])
   skills[l_skills].pot=tonumber(w[7])
   skills[l_skills].name=Trim(w[2])
   if skills[l_skills].lvl>=450 then
      skills[l_skills].mstlvl=450
   end
   if l_skill=="force" and skills[l_skills].mstlvl<450 and skills[l_skills].mstlvl==hp.pot_max-101 then
      skills[l_skills].mstlvl=nil
   end

end

hp_jingxue_check=function(n,l,w)
         hp.jingxue    =tonumber(w[1])
         hp.jingxue_max=tonumber(w[2])
         hp.jingxue_per=tonumber(w[3])
         hp.jingli     =tonumber(w[4])
         hp.jingli_max =tonumber(w[5])
         hp.jingli_lim =tonumber(w[6])            
end
hp_qixue_check=function(n,l,w)
         hp.qixue    =tonumber(w[1])
         hp.qixue_max=tonumber(w[2])
         hp.qixue_per=tonumber(w[3])
         hp.neili    =tonumber(w[4])
         hp.neili_max=tonumber(w[5])            
end
hp_shen_check=function(n,l,w)
         local l_type=tostring(w[1])
	 hp.shen     =tonumber(del_string(tostring(w[2]),','))
         hp.neili_lim=tonumber(w[3])
	 if l_type=='戾' then
            hp.shen=hp.shen * -1
	 end
end
hp_pot_check=function(n,l,w)
    --print('hp_pot_check.............')
         hp.food     =tonumber(w[1])
         hp.pot      =tonumber(w[2])
         hp.pot_max  =tonumber(w[3])
	 
	 for p in pairs(skillEnable) do
	     -- ain 200level->160
	     q=skillEnable[p]
	     if skills[p] and skills[q] then
	        skills[p].full=0
	        
	     	if q=='force' and (hp.pot<50 or skills[p].lvl<150) then
	           skills[p].full=1
	        end
	        --if (skills[p].lvl==skills[q].lvl and skills[p].pot==(skills[p].lvl+1)*(skills[p].lvl+1)) or skills[p].lvl>skills[q].lvl then
			if skills[p].lvl>=skills[q].lvl then
	           skills[p].full=1    
	        end
			if skills[p].fullever then
			   skills[p].full=1
			end
			if skills[p].lvl>=hp.pot_max-100 then
			   skills[p].full=1
			end
			if p=="wuxiang-zhi" then
			   if not skills[p].olvl then skills[p].olvl=skills[p].lvl end
			   if skills[p].lvl > skills[p].olvl then
			      flag.wxjz=0
				  skills[p].olvl=skills[p].lvl
			   end
			end
			if p=="wuxiang-zhi" and (skills[p].lvl<200 or flag.wxjz==0) then
			   skills[p].full=1
			end
	     end
	 end
	 if perform.force then
	   if not skills[perform.force] then
	      perform.force = nil
	   end
	 end
	 if not perform.force then
	    tmp.lvl = 0
	    for p in pairs(skills) do
	        q=skillEnable[p]
		    if q=="force" then
		       if skills[p].lvl > tmp.lvl then
		  	      tmp.lvl = skills[p].lvl
				  perform.force = p
			   end
		    end
	    end
	 end
	 if skills["parry"] and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl<450 then
        flag.xuexi=1
     end
end
hp_exp_check=function(n,l,w)
         hp.water    =tonumber(w[1])
         hp.exp      =tonumber(del_string(tostring(w[2]),','))   
end
hp_dazuo_check=function(n,l,w)
         hp.dazuo=trans(w[1])
   exe('dazuo '..hp.dazuo)
end
score_tb_check=function(n,l,w)
    score.tb=tonumber(w[1])
    score.yb=tonumber(w[2])
    score.jjb=tonumber(w[3])
end
score_ebook_check=function(n,l,w)
    ebooktimes=trans(w[1])
end
score_name_check=function(n,l,w)
    score.name =tostring(w[1])
    score.id   =string.lower(tostring(w[2]))
    score.dex_t=tonumber(w[3])
    score.dex  =tonumber(w[4])
    score.int_t=tonumber(w[5])
    score.int  =tonumber(w[6])
end
score_title_check=function(n,l,w)
    score.title=Trim(tostring(w[1]))
    score.str_t=tonumber(w[2])
    score.str  =tonumber(w[3])
    score.con_t=tonumber(w[4])
    score.con  =tonumber(w[5])
end
score_age_check=function(n,l,w)
    --print('score_age_check...........')
    score.age=trans(w[1])
	--print(score.age)
end
score_gold_check=function(n,l,w)
    score.gold=trans(w[2])
    if score.gold==nil then
       score.gold=0
    end
end
score_party_check=function(n,l,w)
    score.party=w[3]
    score.master=w[4]
	if score.party=="普通百姓" then
	   score.master="普通百姓"
	end
end
score_check_xy=function(n,l,w)
    print('score_check_xy.........')
	score.xiangyun=Trim(w[1])  --六个状态，生、旺、败、平、衰、死
	score.xiangyun_score = tonumber(w[2])
	  if scorexy==false then
	     scorexy=smyteam*1
	  end
		if score.xiangyun=='衰' or score.xiangyun=='死' then
		  if smyteam>=scorexy then
		     smyteam=scorexy-1
		  end
			--if job.zuhe["songmoya"] then job.zuhe["songmoya"]=nil end
		else
		  if smyteam<scorexy then
		     smyteam=scorexy*1
		  end
			--if go_on_smy~=0 and job.zuhe["songmoya"]==nil then job.zuhe["songmoya"]=true end
		end
end
score_busy_check=function(n,l,w)
--print('score_busy_check....................')
   local l_char=del_string(w[2],' ')
   l_char=del_string(l_char,'')
   local l_cnt=trans(l_char)
   if w[3]=='分' then
      if w[1]=="雪山强抢美女" then
	     condition.xueshan=l_cnt * 60
	  end
	       if w[1]=="双倍经验" then
	     condition.ebook=l_cnt * 60
	  end
	       if w[1]=="明悟" then
	     condition.mingwu=l_cnt * 60
	  end
	  	   if w[1]=="真实视野" then
         condition.vpearl=l_cnt 
	  end
         if w[1]=="寒毒" then
         vippoison=1
         condition.poison=l_cnt * 60
	  end
         if w[1]=="蔓陀萝花毒" then
         vippoison=1
	  end
         if w[1]=="星宿掌毒" then
         vippoison=1
         condition.poison=l_cnt * 60
	  end
         if w[1]=="虎爪绝户手伤" then
         condition.poison=l_cnt * 60
	  end
	  if w[1]=="任务繁忙状态" then
         condition.busy=l_cnt * 60
	  end
	  if w[1]=="福州镖局护镖倒计时" then
         condition.hubiao=l_cnt * 60
	  end
--print(condition.poison,condition.busy)
   else
      if w[1]=="雪山强抢美女" then
	     condition.xueshan=l_cnt
	  end
	       if w[1]=="双倍经验" then
	     condition.ebook=l_cnt
	  end
	       if w[1]=="明悟" then
	     condition.mingwu=l_cnt
	  end
	       if w[1]=="真实视野" then
         condition.vpearl=l_cnt 
	  end
         if w[1]=="寒毒" then
         vippoison=1
         condition.poison=l_cnt
	  end
         if w[1]=="蔓陀萝花毒" then
         vippoison=1
	  end
         if w[1]=="星宿掌毒" then
         vippoison=1
         condition.poison=l_cnt
	  end
         if w[1]=="虎爪绝户手伤" then
         condition.poison=l_cnt
	  end
	  if w[1]=="任务繁忙状态" then
         condition.busy=l_cnt
	  end
	  if w[1]=="福州镖局护镖倒计时" then
         condition.hubiao=l_cnt
	  end
--print(condition.poison,condition.busy)
   end
end
score_gender_check=function(n,l,w)
   if string.len(w[1]) == 2 then
      score.gender=w[1]
   end
   if string.len(w[2]) == 8 then
      score.level=w[2]
   end
end
hpheqi=function()
    DeleteTriggerGroup("hpheqi")
    create_trigger_t('hpheqi1',"^·合气度·\\s*\\-?\\s*(\\d*)",'','hp_heqi_check')
    SetTriggerOption("hpheqi1","group","hpheqi")
    EnableTriggerGroup("hpheqi",false)
end
function test()
   Note("到达目的地！")
   --return fight_prepare()
end
function test_text()
    Note('TEXT')
end
beihook=test
halthook=test
game_time = 0
function gametime_trigger()
   game_time = 0
   DeleteTriggerGroup('get_time')
   create_trigger_t('get_time_1',"^您已经连续玩了(\\D*)。",'','getgame_time') 
   create_trigger_t('get_time_2',"^你共有贵宾累计时间",'','closegame_time')

   SetTriggerOption("get_time_1","sequence",70)
   
   SetTriggerOption("get_time_1","group","get_time")
   SetTriggerOption("get_time_2","group","get_time")
   
   EnableTriggerGroup("get_time",true)
   print('gametime_trigger..............')
   --exe('time')
end 

function closegame_time()
    print('closegame_time........')
    EnableTriggerGroup("get_time",false)
	
	set_inwdj()
	
end


function get_gametime_new(func)
    game_time = 0
    DeleteTriggerGroup('get_time')
    create_trigger_t('get_time_1',"^您已经连续玩了(\\D*)。",'','getgame_time')
    SetTriggerOption("get_time_1","group","get_time")   
  
   
   wait.make(function()
       while true do
            exe('time')
	        local l,w = wait.regexp('^贵宾生效时间：',1)
	        if l~=nil then break end
            wait.time(1)		  
	   end
	   EnableTriggerGroup('get_time',false) 
	  if func~=nil then 
         return func()
      end 	  
   end)
 
end

		
	
function getgame_time(n,l,w)
   --EnableTriggerGroup("get_time",false)
   EnableTrigger('get_time_1',false)
   
   local a = w[1]
   local b = nil
   ---game_time = 0
	
	b = string.match(a,'(%D+)天')
	if b then 
	  --print(b)
	  game_time = trans0(b) * 60 * 60 * 24
	  a = string.gsub(a,b..'天',"")
	  --print(game_time)
	  --print(a)
	end
    
    b = string.match(a,'(%D+)小时')
	if b then 
	  --print(b)
	  game_time = game_time + trans0(b) * 60 * 60 
	  a = string.gsub(a,b..'小时',"")
	  --print(game_time)
	  --print(a)
	end	
	
	b = string.match(a,'(%D+)分')
	if b then 
	  --print(b)
	  game_time = game_time + trans0(b) * 60 
	  a = string.gsub(a,b..'分',"")
	  --print(game_time)
	  --print(a)
	end	
	
	b = string.match(a,'(%D+)秒')
	if b then 
	  --print(b)
	  game_time = game_time + trans0(b)
	  --print(game_time)
	end
       
	print('game_time............'..game_time)
    
end

function set_inwdj()
   print('set_inwdj..............')
   local xuezhu_time = tonumber(GetVariable('xuezhu_time'))
   local xuezhu_status = GetVariable("xuezhu_status")
   
   print('xuezhu_time..'..xuezhu_time)
   print('xuezhu_status..'..xuezhu_status)
   
   if game_time == 0 then
     --游戏时间等于 0 秒，说明重新登录
	 if (xuezhu_status=='2' and xuezhu_time == 10) or (xuezhu_status=='0' and xuezhu_time==-1) then 
	    --如果上次是正常抓到雪猪的，则
		SetVariable('xuezhu_status','0')
	    SetVariable('xuezhu_time',-1)
		inwdj=0
	 elseif (xuezhu_status == '1' and xuezhu_time == -1) or (xuezhu_status=='3' and xuezhu_time==-1 ) then
	    --如果上次已要真dan，但是还未抓到雪猪,又退出进入的，情况比较复杂，建议不处理
		SetVariable('xuezhu_status','3')
		SetVariable('xuezhu_time',-1)
		inwdj=0
	 end
      --print('game_time...1..:'..game_time)
      --SetVariable('xuezhu_status','0')
	  --SetVariable('xuezhu_time',-1)
	  --inwdj = 0
   elseif game_time >= xuezhu_time and (xuezhu_status == '2' or xuezhu_status == '1') then 
      print('game_time...2..:'..game_time)
      --- 已经抓到雪猪或者已经服dan,因为发呆重启robot
      inwdj = 1
   elseif game_time >=  xuezhu_time and (xuezhu_status == '0' or xuezhu_status=='3') then
      print('game_time...3..:'..game_time)
      inwdj = 0
   end
   
 
end


function check_goldage()
   EnableTrigger('score3',true)
   exe('score')
end


function get_payment()
    DeleteTriggerGroup('get_payment')
	create_trigger_t('get_payment_1',"^陆冠英说道：「我将这(\\D*)存入你的钱庄",'','getpayment_finish')
	create_trigger_t('get_payment_2',"^陆冠英说道：「原来兄台你还没离开啊？",'','getpayment_fail')
	SetTriggerOption('get_payment_1','group','get_payment')
	SetTriggerOption('get_payment_2','group','get_payment')
	
    wait.make(function()
	    wait.time(2)
		exe('ask lu about 行走江湖')
	end)
end

function getpayment_finish(n,l,w)
    messageShow('领取了桃花岛'..w[1]..'的俸禄!!')
	SetVariable('getgold_age',tonumber(score.age))
	return checkPrepareOver()
end

function getpayment_fail(n,l,w)
    messageShow('领取桃花岛俸禄失败，之前已经领取过了!!')
	SetVariable('getgold_age',tonumber(score.age))
	return checkPrepareOver()
end



function main()
    local shenqi_id = GetVariable('shenqi_id')
    exe('get jiudai;get fire;get cu shengzi;get sheng zi;get jin chai;get '..shenqi_id)
    needdolost=0
    inwdj=0
	kuang_cur=0
	go_dp=0
	flag.searchArea=nil
	flag.searchRooms=nil
	job_suspend=nil
	setAlias()
    delete_all_triggers()
    delete_all_timers()
    DeleteTemporaryTriggers()
	create_trigger_t('main',"^「书剑\\D*」\\D*已经连续执行了",'','login')
    ---create_trigger_t('main',"^「书剑\\D*」\\D*已经连续执行了(\\D*)小时(\\D*)分(\\D*)秒",'','login')
	---create_trigger_t('main222',"^「书剑\\D*」\\D*已经连续执行了(\\D*)分(\\D*)秒",'','login')
    create_trigger_t('main1',"^Are you using BIG5 font\\(y/N\\)? ",'','login_choose')
    lujing_trigger()
    chat_trigger()
    hp_trigger()
    fight_trigger()
    fight_prepare()
    idle()
    getVariable()
    userGet()
    hpheqi()
	--SetEchoInput(true)
	SetSpeedWalkDelay(speed_walk_delay)
	Chuanfu:addtrigger()
	
	pfm_xiangyun = GetVariable('pfm_xiangyun')
	
	
	wait.make(function()
	
	
	    local self = coroutine.running()
		local async_continue = function()       
            print("async resume")
            coroutine.resume(self)
        end
        get_gametime_new(async_continue)
		coroutine.yield()
	    set_inwdj()		
				
	    Openfpk()
        map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8"
        exe('down;alias askk ask $*;stand;halt;uweapon;score;cha;hp;jifa all;jiali max;unset no_kill_ap;cond')
	    Execute('pfmset')
	    if not perform.skill or not perform.pre or not job.zuhe or countTab(job.zuhe)<2 then
	        return shujian_set()
	    else
		    return check_bei(vcheck)
	   end
	   	
	end)

end
function login_choose()
    Send('n')
end
function login()
    ---pumkmai add 登录时记录一下
	scrReloginLog()
    dis_all()
    DeleteTriggerGroup("login")
    create_trigger_t('login2',"^请您输入这个人物的识别密码\\(passwd\\)：",'','login_passwd')
    SetTriggerOption("login2","group","login")
    local l_id=GetVariable("id")
    local l_passwd=GetVariable("passwd")
    Note(l_id,l_passwd)
    if l_id~=nil and l_passwd~=nil then
       Send(l_id)
       Send(l_passwd)
       Send('y')
	   
	   ---这里加上时间上的判断,重置雪猪的变量，如果是重启，或者重新进入
	   
    else
       return shujian_set()
    end
end
function logincheck()
--xuezhu_require=1
end
function login_passwd()
    EnableTriggerGroup("login",false)
    wait.make(function()
       wait.time(2)
       main()
    end)
end
function disAll()
    local tl = GetTriggerList()
    if tl then
       for k, v in ipairs (tl) do 
           EnableTrigger(v,false) 
       end
    end
    delete_all_timers()
    --[[if lookxin==1 then
       sendXin()
    end]]
	EnableTrigger("main",true)
	EnableTrigger("main1",true)
	EnableTriggerGroup("hp",true)
    EnableTriggerGroup("score",true)
	EnableTriggerGroup("chuanfu", true)
  -- ain
    EnableTrigger("pk1",true)
    EnableTrigger("pk2",true)
    EnableTriggerGroup("buyao",true)
	if job.name=='diemenglou' then
           dmlTriggers()
           EnableTrigger('dmlfight1',true)
        end
end
function dis_all()
    print('dis_all...................')
    local tl = GetTriggerList()
    if tl then
       for k, v in ipairs (tl) do 
           EnableTrigger(v,false) 
       end
    end
    delete_all_timers()
    EnableTrigger('main',true)
    EnableTrigger('main1',true)
    --EnableTrigger('idle',true)
    EnableTriggerGroup("chat",true)
    EnableTriggerGroup("hp",true)
	EnableTriggerGroup("chuanfu", true)
    EnableTriggerGroup("score",true)
    EnableTriggerGroup("count",true)
    EnableTriggerGroup("fight",true)
    EnableTriggerGroup("job_exp",true)
    EnableTrigger("hp12",false)
    --[[if lookxin==1 then
       sendXin()
    end]]
-- ain
    EnableTrigger("pk1",true)
    EnableTrigger("pk2",true)
    EnableTriggerGroup("buyao",true)
    beihook=test
    busyhook=test
    waithook=test
    flag.find=1
	--locate_finish=0
	--inwdj=0
    --thread_resume(lookfor)
    idle()
end
function delete_all_triggers()
    local tl = GetTriggerList()
    if tl then
       for k, v in ipairs (tl) do 
           DeleteTrigger(v) 
       end
    end 
end
function delete_all_timers()
    local tl = GetTimerList()
    if tl then
       for k, v in ipairs (tl) do 
           DeleteTimer(v) 
       end
    end 
end
hp_dazuo_count=function()
    DeleteTriggerGroup("dz_count")
    create_trigger_t('dz_count1','^>*\\s*卧室不能打坐，会影响别人休息。','','hp_dz_where')
    create_trigger_t('dz_count2','^>*\\s*你无法静下心来修炼。','','hp_dz_where')
    create_trigger_t('dz_count3','^>*\\s*(这里不准战斗，也不准打坐。|这里可不是让你提高内力的地方。)','','hp_dz_where')
	create_trigger_t('dz_count4',"^(> )*你现在手脚戴着镣铐，不能做出正确的姿势来打坐",'','hp_dz_liaokao')
	create_trigger_t('dz_count5',"^(> )*(你正要有所动作|你无法静下心来修炼|你还是专心拱猪吧)",'','hp_dz_where')
	create_trigger_t('dz_count6',"^(> )*你现在精不够，无法控制内息的流动！",'','loginerror')
    SetTriggerOption("dz_count1","group","dz_count")
    SetTriggerOption("dz_count2","group","dz_count")
    SetTriggerOption("dz_count3","group","dz_count")
	SetTriggerOption("dz_count4","group","dz_count")
	SetTriggerOption("dz_count5","group","dz_count")
	SetTriggerOption("dz_count6","group","dz_count")
    if perform.force and skills[perform.force] then
	   exe('jifa force '.. perform.force)
	else
	   for p in pairs(skills) do
	      if skillEnable[p] == "force" then
		     exe('jifa force '.. p)
			 exe('cha')
		  end
	   end
	end
    if skills["linji-zhuang"] and skills["linji-zhuang"].lvl>149 then
       exe('yun yinyang')
    end
	if skills["force"] and skills["force"].lvl<450 and skills["force"].lvl<hp.pot_max-100 then
       flag.xuexi=1
    end
    exe('yun qi;hp')
    hp.dazuo=10
    return check_bei(hp_dazuo_act)
end
loginerror=function()
	  DeleteTriggerGroup("dz_count")
	  DeleteTimer("dazuo_count")
    return checkWait(check_heal,0.5)
end
hp_dazuo_act=function()
    tmp.qixue=hp.qixue
    exe('yun jing;dazuo '..hp.qixue)
    tmp.i=0
    return create_timer_s('dazuo_count',1.5,'hp_dazuo_timer')
end
hp_dazuo_timer=function()
    tmp.i = tmp.i + 1
    if tmp.i > 30 then
       return main()
    end
    exe('hp;yun jing;yun qi;dazuo '..hp.qixue)
    return checkWait(hp_dz_count,0.5)
end
hp_dz_count=function()
    EnableTriggerGroup("dz_count",false)

    local l_times=1
       if hp.qixue<tmp.qixue then
          if hp.qixue_max>1000 then
             l_times=math.modf(math.modf(hp.qixue_max/5)/(tmp.qixue-hp.qixue))+1
	  end
	  hp.dazuo=l_times*(tmp.qixue-hp.qixue)+150
	  if hp.dazuo<10 then
	     hp.dazuo=10
	  end
	  --if hp.dazuo>10 and hp.dazuo <100 then
	  --   l_times=math.modf(100/hp.dazuo)+1
	  --   hp.dazuo=l_times*hp.dazuo
	  --end
	  Note('最佳打坐值为：'..hp.dazuo)
	  DeleteTriggerGroup("dz_count")
	  DeleteTimer("dazuo_count")
	  exe('halt')
	  if kdummy==1 and hp.exp>2000000 then opendummy() end
	  return Gstart()
	 end
end
function vcheck()
if score.id and score.id=='pumkmai' and pumkmaivip==1 then
      job.name='pumkmai'
      exe('cond')
      return go(VIPask,'扬州城','当铺')
   else
      return check_bei(hp_dazuo_count)
   end
end
function Gstart()
	  return check_bei(check_food)
end
hp_dz_where=function()
   EnableTriggerGroup("dz_count",false)
   DeleteTimer("dazuo_count")
   locate()
   check_bei(hp_dz_go)
end
hp_dz_go=function()
   EnableTriggerGroup("dz_count",true)
   exe(locl.dir)
   hp_dazuo_act()
end
function hp_dz_liaokao()
    dis_all()
	return tiaoshui()
end
function hp_trigger()
    DeleteTriggerGroup("hp")
    create_trigger_t('hp1',"^·精血·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*·精力·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\((\\d*)\\)$",'','hp_jingxue_check')
    create_trigger_t('hp2',"^·气血·\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*·内力·\\s*(\\d*)\\s*\\/\\s*(\\s*\\d*)\\(\\+\\d*\\)$",'','hp_qixue_check')
    create_trigger_t('hp3',"^·食物·\\s*(\\d*)\\.\\d*\\%\\s*·潜能·\\s*(\\d*)\\s*\\/\\s*(\\d*)$",'','hp_pot_check')
    create_trigger_t('hp4',"^·饮水·\\s*(\\d*)\\.\\d*\\%\\s*·经验·\\s*(.*)\\s*\\(",'','hp_exp_check')
    create_trigger_t('hp5',"^·(戾|正)气·\\s*(.*)\\s*·内力上限·\\s*(\\d*)\\s*\\/",'','hp_shen_check')
    create_trigger_t('hp7',"^(□)*\\s*(\\D*)\\s*\\((\\D*)(\\-)*(\\D*)\\)\\s*\\-\\s*\\D*\\s*(\\d*)\\/\\s*(\\d*)$",'','check_skills')
    create_trigger_t('hp8',"^>*\\s*你至少需要(\\D*)点的气来打坐！",'','hp_dazuo_check')
    create_trigger_t('hp9',"^│(\\D*)任务\\s*│\\s*(\\d*) 次\\s*│ ",'','checkJobtimes')
    create_trigger_t('hp10',"^□(\\D*)\\(\\D*\\)$",'','checkWieldCatch')
    create_trigger_t('hp11',"^(> )*你最近刚完成了(\\D*)任务。$",'','checkJoblast')
    create_triggerex_lvl('hp12',"^(> )*(\\D*)",'','resetWait',200)
    create_trigger_t('hp13',"^(> )*你还在巡城呢，仔细完成你的任务吧。",'','checkQuit')
    create_trigger_t('hp14',"^\\D*被一阵风卷走了。$",'','checkRefresh')
    create_trigger_t('hp15',"^(> )*一个月又过去",'','checkMonth')
    --create_trigger_t('hp16',"^(> )*昨天完成失落信笺任务(\\N*)次，今天完成失落信笺任务(\\N*)/(\\N*)次。",'','checkLLlost')
    create_trigger_t('hp17',"^(> )*你(渴得眼冒金星，全身无力|饿得头昏眼花，直冒冷汗)",'','checkQuit')
    --create_trigger_t('hp18',"^(> )*(你舔了舔干裂的嘴唇，看来是很久没有喝水了|你过于缺水，眼冒金星|突然一阵“咕咕”声传来，原来是你的肚子在叫了)",'','jdeat')
    create_trigger_t('hp19',"^(> )*(忽然一阵刺骨的奇寒袭来，你中的星宿掌毒发作了|忽然一股寒气犹似冰箭，循着手臂，迅速无伦的射入胸膛，你中的寒毒发作了)",'','checkDebug')
    create_trigger_t('hp20',"^(> )*你(服下一颗活血疗精丹，顿时感觉精血不再流失|服下一颗内息丸，顿时觉得内力充沛了不少|服下一颗川贝内息丸，顿时感觉内力充沛|服下一颗黄芪内息丹，顿时感觉空虚的丹田充盈了不少|敷上一副蝉蜕金疮药，顿时感觉伤势好了不少|吃下一颗大还丹顿时伤势痊愈气血充盈)。",'','hpeatOver')
    create_trigger_t('hp21',"^(> )*你必须先用 enable 选择你要用的特殊内功。",'','jifaOver')
    create_trigger_t('hp22',"^(> )*(\\D*)目前学过(\\D*)种技能：",'','show_skills')
    create_trigger_t('hp23',"^(> )*你的背囊里有：",'','show_beinang')
	--create_trigger_t('hp24','^(> )*你眼中一亮看到\\D*的身边掉落一件(\\D*)。','','fqyyArmorGet')
    --create_trigger_t('hp25','^(> )*你捡起一件(\\D*)胄。','','fqyyArmorCheck')
	create_trigger_t('hp24','^(> )*你眼中一亮看到\\D*的身边掉落一(件|副|双|袭|顶|个|条|对)(\\D*)(手套|靴|甲胄|腰带|披风|彩衣|头盔)。','','fqyyArmorGet')
    create_trigger_t('hp25','^(> )*你捡起一(件|副|双|袭|顶|个|条|对)(\\D*)(手套|靴|甲胄|腰带|披风|彩衣|头盔)。','','fqyyArmorCheck')
    create_trigger_t('hp26',"^(> )*(\\D*)矿石在炉火中化为一块\\D*落在地上,被你拣起收进背囊。",'','refinekuang')
	create_trigger_t('hp27',"^(> )*(\\D*)在炉火下被铸成\\D*黄金落在地上。",'','zhudingkuang')
	create_trigger_t('hp28',"^(> )*你得到了一封失落的信笺。",'','checkBagsletter')
    create_trigger_t('hp30',"^(> )*(你突然觉得微微头晕，浑身无力，无法再凝聚内息)",'','eatdan')
	create_trigger_t('hp31',"^(> )*阿肥\\(Imgxx\\)告诉你：stop!!!",'','stopJob')
	create_trigger_t('hp32',"^(> )*你使劲全身力气，把手中的绳子搭在松树枝条上，使劲地拽了拽",'','useShengzi')
	
	---create_trigger_t('hp32',"^(> )*【谣言】某人：据说有人看到财神在(\\D*)出现！",'','find_cs_location')

	
	SetTriggerOption("hp24","group","hp")
    SetTriggerOption("hp25","group","hp")
    SetTriggerOption("hp1","group","hp")
    SetTriggerOption("hp2","group","hp")
    SetTriggerOption("hp3","group","hp")
    SetTriggerOption("hp4","group","hp")
    SetTriggerOption("hp5","group","hp")
    SetTriggerOption("hp7","group","hp")
    SetTriggerOption("hp8","group","hp")
    SetTriggerOption("hp9","group","hp")
    SetTriggerOption("hp10","group","hp")
    SetTriggerOption("hp11","group","hp")
    SetTriggerOption("hp12","group","hp")
    SetTriggerOption("hp13","group","hp")
    SetTriggerOption("hp14","group","hp")
    SetTriggerOption("hp15","group","hp")
    --SetTriggerOption("hp16","group","hp")
    SetTriggerOption("hp17","group","hp")
    --SetTriggerOption("hp18","group","hp")
    SetTriggerOption("hp19","group","hp")
    SetTriggerOption("hp20","group","hp")
    SetTriggerOption("hp21","group","hp")
    SetTriggerOption("hp22","group","hp")
    SetTriggerOption("hp23","group","hp")
    SetTriggerOption("hp26","group","hp")
	SetTriggerOption("hp27","group","hp")
	SetTriggerOption("hp28","group","hp")
	SetTriggerOption("hp30","group","hp")
	SetTriggerOption("hp31","group","hp")
	SetTriggerOption("hp32","group","hp")
	
	
    DeleteTriggerGroup("score")
    --create_trigger_t('score1',"^┃姓    名：(\\D*)\\((\\D*)\\)\\s*┃身  法：「(\\d*)\/(\\d*)」\\s*悟  性：「(\\d*)\/(\\d*)」",'','score_name_check')
	create_trigger_t('score1',"^┃姓    名：(\\D*)\\((\\D*)\\)\\s*┃身  法：「(\\d*)/(\\d*)」\\s*悟  性：「(\\d*)/(\\d*)」",'','score_name_check')
	
    --create_trigger_t('score2',"^┃头    衔：(\\D*)\\s*┃臂  力：「(\\d*)\/(\\d*)」\\s*根  骨：「(\\d*)\/(\\d*)」",'','score_title_check')
	create_trigger_t('score2',"^┃头    衔：(\\D*)\\s*┃臂  力：「(\\d*)/(\\d*)」\\s*根  骨：「(\\d*)/(\\d*)」",'','score_title_check')
	
    create_trigger_t('score3',"^┃年    龄：(\\D*)岁\\D*\\s*生    辰：",'','score_age_check')
    create_trigger_t('score4',"^│(任务繁忙状态|雪山强抢美女|双倍经验|明悟|寒毒|星宿掌毒|蔓陀萝花毒|虎爪绝户手伤|福州镖局护镖倒计时|真实视野)\\s*(\\D*)(分|秒)\\s*",'','score_busy_check')
    create_trigger_t('score5',"^┃(婚    姻|娇    妻|夫    君)：(\\D*)\\s*师\\s*承：【(\\D*)】【(\\D*)】",'','score_party_check')
    create_trigger_t('score6',"^┃性    别：(\\D*)性\\s*攻：(\\D*)\\s* 躲：",'','score_gender_check')
    create_trigger_t('score7',"^┃(婚    姻|娇    妻|夫    君)：(\\D*)\\s*师\\s*承：【(普通百姓)】(\\D*)",'','score_party_check')
    create_trigger_t('score9',"^┃注    册：(\\D*)\\s*钱庄存款：(\\D*)",'','score_gold_check')
    create_trigger_t('score8',"^您目前的存款上限是：(\\D*)锭黄金",'','checkGoldLmt')
    create_trigger_t('score10','^┃致命抗性：\\d*.*理相：(\\D*)\\((\\d*)\\)\\s*┃','','score_check_xy')
    create_trigger_t('score11','^┃书剑通宝：(\\N*)\\s*书剑元宝：(\\N*)\\s*竞技币：(\\N*)\\s*┃','','score_tb_check')
    create_trigger_t('score12',"^本周您已经使用精英之书(\\D*)次。",'','score_ebook_check')
    SetTriggerOption("score1","group","score")
    SetTriggerOption("score2","group","score")
    SetTriggerOption("score3","group","score")
    SetTriggerOption("score4","group","score")
    SetTriggerOption("score5","group","score")
    SetTriggerOption("score6","group","score")
    SetTriggerOption("score7","group","score")
    SetTriggerOption("score8","group","score")
    SetTriggerOption("score9","group","score")
    SetTriggerOption("score10","group","score")
    SetTriggerOption("score11","group","score")
    SetTriggerOption("score12","group","score")
end
function lingwu_trigger()
    DeleteTriggerGroup("lingwu")
    create_trigger_t('lingwu1',"^>*\\s*(你只能从特殊技能中领悟。|你不会这种技能。|你要领悟什么？)",'','lingwu_next')
    create_trigger_t('lingwu2',"^>*\\s*你从实战中得到的潜能已经用完了。",'','lingwu_finish')
    create_trigger_t('lingwu3',"^>*\\s*你的\\D*不够，无法领悟更深一层的基本",'','lingwu_next')
    create_trigger_t('lingwu9',"^>*\\s*以你现在的基本内功修为，尚无法领悟基本内功。",'','lingwu_next')
    create_trigger_t('lingwu5',"^>*\\s*由于实战经验不足，阻碍了你的「\\D*」进步",'','lingwu_next')
    create_trigger_t('lingwu6','^>*\\s*你把 "action" 设定为 "少林领悟就是好啊，就是好！" 成功完成。','','lingwu_goonpre')
    create_trigger_t('lingwu7',"^>*\\s*你的内力不够。",'','lingwu_finish') 
    SetTriggerOption("lingwu1","group","lingwu")
    SetTriggerOption("lingwu2","group","lingwu")
    SetTriggerOption("lingwu3","group","lingwu")
    SetTriggerOption("lingwu9","group","lingwu")
    SetTriggerOption("lingwu5","group","lingwu")
    SetTriggerOption("lingwu6","group","lingwu")
    SetTriggerOption("lingwu7","group","lingwu")
    EnableTriggerGroup("lingwu",false)
end

function stopJob()
   go_dp=1
end

function useShengzi()
   Bag['绳子']=nil
end

function jifaOver()
    exe('jifa all')
end
function checkDebug()
	messageShow('您中毒了!')
	vippoison=1
	exe('look bei nang;hp')
	  if job.name=='songmoya' then
	exe('set wimpycmd halt\\down\\hp')
	job.name='poison'
	return check_halt(fangqiypt)
	  end
    if hxd_cur>0 then
	create_timer_s('eatdan',3,'hpEat')
    else
	dis_all()
	return check_halt(check_xue)
    end
end
function hpEat()
	exe('eat huoxue dan')
end
function hpeatOver(n,l,w)
     local l=w[2]
  if string.find(l,"敷上一副蝉蜕金疮药，顿时感觉伤势好了不少") then
	   cty_cur = cty_cur - 1
	end
	 if string.find(l,"服下一颗内息丸，顿时觉得内力充沛了不少") then
           nxw_cur = nxw_cur - 1
        end
        if string.find(l,"服下一颗川贝内息丸，顿时感觉内力充沛") then
           cbw_cur = cbw_cur - 1
        end
        if string.find(l,"服下一颗黄芪内息丹，顿时感觉空虚的丹田充盈了不少") then
           hqd_cur = hqd_cur - 1
        end
	if string.find(l,"服下一颗活血疗精丹，顿时感觉精血不再流失") then
	   DeleteTimer("eatdan")
	   hxd_cur = hxd_cur - 1
	end
	if string.find(l,"吃下一颗大还丹顿时伤势痊愈气血充盈") then
	   messageShow('吃大还丹了！')
	   dhd_cur = dhd_cur - 1
	end
end

function checkQuit()
  dis_all()
	check_halt(BQuit)
        exe('drink jiudai')
end
function BQuit()
  exe('set 雪蛛 no;set 抓雪蛛 no;quit')
end
function checkfood()
    if job.name=="songmoya" then return else
       dis_all()
       return check_halt(check_food)
    end
end
function checkLLlost(n,l,w)
    print('checkLLlost................')
	EnableTrigger("hp16",false)
	EnableTrigger('score4',true) 
	wait.make(function()
	    LLlost=tonumber(w[4])
		 while true do
	       wait.time(0.5)
	       exe('cond')
	       local l,w = wait.regexp('^(> )*当前你没有被判断为机器人。$',1)
		   if l~= nil then break end
	    end
	    --print('condition.vpearl=:'..condition.vpearl)
        if (condition.vpearl==0 or not condition.vpearl) and needdolost==1 and needvpearl==1 then
           return Govpearl()
        end
        if LLlost*1>=lostno*1 and needdolost==1 then
	       print('do lost again..............')
           return dolostAg()
        end
	
	end)
	   
end

function Govpearl()
    return go(dhvpearl,'扬州城','当铺')
end

function Govpearlnew()
     wait.make(function()
	    await_go('扬州城','当铺')
		while true do
		    exe('duihuan vpearl')
			local l,w = wait.regexp("^(> )*你将幻视之珠用力捏碎，珠子化为一团迷雾钻你了你的两眼",1)
			if l~=nil then break end
		end
		exe('cond')	 
	 end)
end


function dhvpearl()
    exe('duihuan vpearl;cond')
    if lostletter==1 and needdolost==1 then
     return letterLost()
  end
    if LLlost*1>=lostno*1 and needdolost==1 then
       return dolostAg()
    end
    return check_halt(check_food)
end
function dhlost()
    exe('duihuan pcert')
    return check_halt(check_food)
end
function checkMonth()
    flag.month=1
end
function checkTongbao(n,l,w)
    score.tongbao=tonumber(w[1])
end
function checkGoldLmt(n,l,w)
    score.goldlmt=trans(w[1])
end



function eatdan()
    exe('fu jiuxuebiyun dan')
end

	


function jifaAll()
    for p in pairs(skills) do
	    local sk = qrySkillEnable(p)
	    if sk and sk["force"] and perform.force and perform.force==p then
		   exe('jifa force '..p)
		end
		if sk and not sk["force"] then
		   for q in pairs(sk) do
		       if skills[q] and skills[p].lvl>=skills[q].lvl then
		          exe('jifa '..q..' '..p)
			   end
		   end
		end
	end
end
function jifaDodge()
    for p in pairs(skills) do
	    q = skillEnable[p]
		if q=="dodge" and skills[q] and skills[p].lvl>=skills[q].lvl then
		   exe('jifa '..q..' '..p)
		   break
		end
	end
end
function checklingwu(func)
    print('checklingwu.......')
	print(xxpot)
	print(hp.pot_max)
	local lingwu_toggle  = tonumber(GetVariable('lingwu_toggle'))
	print('lingwudie='..lingwudie)
	if lingwu_toggle == 1 then 
	  if lingwudie==0 then
        return lingwu()
      end
      if xxpot<hp.pot_max then
        return lingwu()
      end
	end 
	
	wait.make(function()
       wait.time(0.1)
       if func ~= nil then 
           print('check pot resum .....')
           return func()
       else 
          return check_job()
       end 
   end)

   ---return check_job()
   
end
function lingwu()
    messageShow('开始领悟!!!!!!!') 
    DeleteTemporaryTriggers()
    lingwu_trigger()
	skillsLingwu = {}
	skillsLingwu = utils.split(GetVariable("lingwuskills"),'|')   --- lingwuskills
    road.temp=0
    tmp.lingwu=1
    lingwudie=0
    return check_busy(lingwu_go)
end
function lingwu_go()
    exe('nick 少林领悟达摩院后殿')
    messageShow('去少林领悟')
	jifaAll()

    go(lingwu_unwield,'嵩山少林','达摩院')
end
function lingwu_unwield()
	weapon_unwield()
        exe('hp')
        exe('wield '..leweapon)
		exe('jifa parry tanzhi-shentong')
        return check_busy(lingwuzb)
end
function lingwu_goonpre()
    EnableTimer('walkWait4',false)
        lingwu_goon()
end 
function lingwuzb()
  zhunbeineili(lingwuzbok)
end
function lingwuzbok()
  go(lingwu_goon,'嵩山少林','达摩院后殿')
end
function lingwuSleep()
  if score.gender=='男' then
     return go(lingwuSleepOver,"songshan/nan-room","")
  else
     return go(lingwuSleepOver,"songshan/nv-room","")
  end
end
function lingwuSleepOver()
    exe('sleep')
    checkWait(lingwu_eat,3)
end
function lingwu_goon()
    if locl.room~="达摩院后殿" then
       return lingwu_finish()
    end
    EnableTriggerGroup("lingwu",true)
	   local leweapon=GetVariable("learnweapon")
	   exe('wield '..leweapon)
    local skill=skillsLingwu[tmp.lingwu]
	print('now lingwu ...'..skill)
	
	if not skills[skill] or skills[skill].lvl==0 or skills[skill].lvl>=hp.pot_max-100 then
	   print('lingwu next ...')
	   return lingwu_next()
	end
	
	   if hp.neili<1000 then
	      if hp.exp>20000000 or score.gender=='无' then
	         return go(lingwu_eat,'武当山','茶亭')
	      else
	         return lingwuSleep()
	      end
		 end
       yunAddInt()
       flag.idle=nil
       exe('yun jing;#5(lingwu '..skill..')')
       exe('alias action 少林领悟就是好啊，就是好！')
       create_timer_s('walkWait4',0.5,'lingwu_alias')
       --return check_bei(lingwu_alias,1.8)
	   
	 
	 
end
function lingwu_eat()
   if locl.room=="茶亭" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(lingwu_go)
    else
       return go(lingwu_eat,'武当山','茶亭')
    end
end
function lingwu_alias()
    exe('alias action 少林领悟就是好啊，就是好！')
end
function lingwu_next()
    EnableTriggerGroup("lingwu",false)
    tmp.lingwu=tmp.lingwu+1
    local length=table.getn(skillsLingwu)
    if tmp.lingwu>length then
       flag.lingwu=0
       lingwudie=1
       xxpot=hp.pot_max
	   --lingwu_finish_log()
       return check_bei(lingwu_finish)
    else
       local skill=skillsLingwu[tmp.lingwu]
	--print(skillsLingwu[tmp.lingwu])
       if skills[skill] and skills[skill].lvl>0 and skills[skill].lvl<hp.pot_max-100 then
          return check_bei(lingwu_goon,1)
       else
          return lingwu_next()
       end
    end
end
function lingwu_finish()
    messageShow('少林领悟完成')
    local skill=skillsLingwu[tmp.lingwu]
    EnableTriggerGroup("lingwu",false)
    DeleteTriggerGroup("lingwu")
    exe('cha;hp;yun jing')
       flag.lingwu=0
    if tmp.lingwu>1 and tmp.lingwu<=table.getn(skillsLingwu) then
       table.remove(skillsLingwu,tmp.lingwu)
       table.insert(skillsLingwu,1,skill)
    end
    flag.lingwu=0
	local leweapon=GetVariable("learnweapon")
	   exe('cha')
      --create_timer_s('walkWait4',0.7,'lingwu_ask_test')
	  --create_timer_s('walkWait4',0.7,'lingwu_lianxi')
	 
	lingwu_lianxi = tonumber(GetVariable('lingw_lianxi'))
	if lingwu_lianxi == 1 then 	  
	  lingwu_lianxi()
	else
	   create_timer_s('walkWait4',0.7,'lingwu_ask_test')
	end
	   
 end
 
function lingwu_lianxi()
--领悟完成后，加一点练习
   wait.make(function()
      exe('sxlian')
	  wait.time(2)
	  exe('sxlian')
	  wait.time(2)
	  exe('sxlian')
	  wait.time(2)
	  exe('sxlian')
	  wait.time(2)
	  exe('sxlian')
	  --wait.time(2)
	  create_timer_s('walkWait4',0.7,'lingwu_ask_test')
   end)
      
end
 
lingwu_ask_test=function()
    return check_halt(check_jobx)      
end

function xuexiTrigger()
    DeleteTriggerGroup("xuexi")
    create_trigger_t('xuexi1',"^(> )*你(\\D*)".. score.master .."(\\D*)指导",'','xuexiAction')
    create_trigger_t('xuexi2',"^(> )*你现在正忙着呢。",'','xuexiAction')
    create_trigger_t('xuexi3',"^(> )*你今天太累了，结果什么也没有学到。",'','xuexiSleep')
    create_trigger_t('xuexi4',"^(> )*(六脉神剑|你不能再学习欢喜禅了|经脉学|你不能再学习|你的基本功火候未到|你不能再提高|你的太极拳火候太浅|兰花拂穴手乃黄岛主家传绝学|兰花拂穴手乃峨嵋派祖师郭襄秘学|你的悟性，无法|你的\\D*(级别|悟性|身法)不够|华山门下怎么容得|你一个大老爷们|你已经无法提高|你的基本棒法太差|你的邪气太重|你刚听一会儿|斗转星移只能通过领悟来提高|学就只能学的这里了|你是侠义正士|只有大奸大恶之人|你不能再修炼毒技|你不能再学习经脉学|经脉学只能靠研读|你的读书写字|本草术理只能通过研习医学|你的基本功火候未到|你屡犯僧家数戒|这项技能你只能通过读书学习或实战|这项技能你已经无法通过学习|这项技能你恐怕必须找别人学了|你必须去学堂学习读书写字|也许是缺乏实战经验|你的(大乘佛法|禅宗心法)修为不够|这项技能你的程度已经不输你师父)",'','xuexiNext')
    create_trigger_t('xuexi5',"^(> )*你没有这么多潜能来学习",'','xuexiFinish')
    create_trigger_t('xuexi6',"^(> )*你要向谁求教？",'','xuexiFinish')
    create_trigger_t('xuexi7',"^(> )*你的「(\\D*)」进步了！",'','xuexiLvlUp')
    create_trigger_t('xuexi8',"^(> )*你觉得对太极拳理还不够理解",'','xueAskzhang')
    create_trigger_t('xuexi9',"^(> )*乾坤大挪移只能通过研习《乾坤大挪移心法》和领悟来提高",'','taoJiaozhang')
    create_trigger_t('xuexi10',"^(> )*(你手里有兵器|空了手才能练|空手方能练习|你必须先找|空手时无法练|你使用的武器不对|却感到武器太不对劲|练\\D*空手|学\\D*空手|\\D*手里不能拿武器。)",'','xueWeapon')
    SetTriggerOption("xuexi1","group","xuexi")
    SetTriggerOption("xuexi2","group","xuexi")
    SetTriggerOption("xuexi3","group","xuexi")
    SetTriggerOption("xuexi4","group","xuexi")
    SetTriggerOption("xuexi5","group","xuexi")
    SetTriggerOption("xuexi6","group","xuexi")
    SetTriggerOption("xuexi7","group","xuexi")
    SetTriggerOption("xuexi8","group","xuexi")
    SetTriggerOption("xuexi9","group","xuexi")
    SetTriggerOption("xuexi10","group","xuexi")
    EnableTriggerGroup("xuexi",false)
end
function checkxue(func)
   worship_flag = GetVariable("worship_flag")
   print('worship_flag.........='..worship_flag)
   if worship_flag=="1" then
     print('明悟时间不学习，只做任务...............................')
     return check_job()
   end
     
   print('checkxue................xuefull='..xuefull)
   if xuefull==0 then
     return xuexi()
   end
   print('checkxue................xxpot,hp.pot_max='..xuefull..','..hp.pot_max)
   if xxpot<hp.pot_max then
     return xuexi()
   end
   
   wait.make(function()
       wait.time(0.1)
       if func ~= nil then 
           print('check pot resum .....')
           return func()
       else 
          return check_job()
       end 
   end)
   
    ----return check_job()
end

function xuexi()
     exe('nick 回门派学习')
	messageShow('回门派学习')
 	master = {}

	if hp.exp<150000 then
	   master.times=1
	else
	    -- ain usepot
	   master.times=math.modf(hp.jingxue/60)
	   if master.times>50 then master.times=50 end
	end



    master.skills = {}
	master.skills = utils.split(GetVariable("xuexiskill"),'|')

    flag.times=1

    return check_halt(xuexiParty)
end
function xuexiParty()
    xuexiTrigger()
    if score.master then
	   master.area = locateroom(score.master)
	   if master.area then
	      return go(xuexiCheck,master.area,master.room)
	   else
	      ColourNote ("white","blue","未找到师傅住址，请联系PTBX更新！")
	      return xuexiFinish()
	   end
    else
	   return xuexiFinish()
    end
end 
function xuexiCheck() 
    checkWield()
    if locl.id[score.master] then
	   if score.party and score.party=="少林派" and score.master=="无名老僧" and skills["buddhism"] and skills["buddhism"].lvl==200 then
	      exe('ask wuming about 佛法')
	   end
       return check_bei(xuexiStart)
    else
	   ColourNote ("white","blue","师傅不在家！如果发现地址有错，请联系PTBX更新！")
	   return xuexiFinish()
    end
end
function xuexiStart()
    EnableTriggerGroup("xuexi",true)
    tmp.xuexi=1
	
	if master.id and locl.item and locl.item[score.master] and not locl.item[score.master][master.id] then
	   master.id = nil
	end
	if not master.id and locl.item and locl.item[score.master] then
	master.id=locl.item[score.master]
	   for p in pairs(locl.item[score.master]) do
	       if not string.find(p," ") then
		      master.id = p
		   end
	   end
	end 
    exe('bai '..master.id)

	   weapon_unwield()

	if l_skill and weaponKind[l_skill] then
	   if master.skills[tmp.xuexi]=="yuxiao-jian" then l_skill = "xiao" end
	   for p in pairs(Bag) do
	       if Bag[p].kind and Bag[p].kind==l_skill then
		      exe('wield '.. Bag[p].fullid)
		   end
	   end
	end
        yunAddInt()
	   local leweapon=GetVariable("learnweapon")
	   exe('wield '..leweapon)
    return xuexiContinue()
end
function xuexiAction()
    EnableTriggerGroup("xuexi",false)
    if hp.exp>2000000 and hp.neili<300 then
       prepare_neili(xuexiContinue) 
    else
       check_bei(xuexiContinue)
    end
end
function xuexiContinue()
    flag.idle=nil
    xuefull=0
	if hp.neili<1000 and nxw_cur>0 then
	   exe('eat huangqi dan')
	end
	if hp.neili<600 and nxw_cur>0 then
	   exe('eat huangqi dan')
	end
	
	---pumkmai定制
	if master.times then 
	   local tmptimes = hp.pot - master.times
	   print('tttttttt:'..tmptimes)
	   if tmptimes > 0 and tmptimes < master.times  then
          master.times = tmptimes
	   end
	end
	
    EnableTriggerGroup("xuexi",true)
      wait.make(function() 
       wait.time(1)
       exe('yun jing;xue '..master.id..' '.. master.skills[tmp.xuexi] ..' '.. master.times)
       end)
	print('学习点数:'..master.times)
    exe('hp')
end
function taoJiaozhang()
  EnableTriggerGroup("xuexi",false)
  print('问小张乾坤大挪移')
      wait.make(function() 
       wait.time(1)
       exe('#5 taojiao qiankundanuoyi;yun jing')
       end)
    check_busy(xuexiContinue)
end
function xueAskzhang()
    EnableTriggerGroup("xuexi",false)
	print('问老张太极拳理')
      wait.make(function() 
       wait.time(1)
       exe('ask zhang about 太极拳理')
       end)
    check_busy(xuexiContinue)
end
function xueWeapon()
    EnableTriggerGroup("xuexi",false)
    tmp.skill=master.skills[tmp.xuexi]
    if skills[tmp.skill] then
       if skills[tmp.skill].lvl>=450 then
          skills[tmp.skill].mstlvl=450
       else
          skills[tmp.skill].mstlvl=skills[tmp.skill].lvl
       end
    end
	local l_skill = skillEnable[master.skills[tmp.xuexi]]
	   weapon_unwield()
	if l_skill and weaponKind[l_skill] then
	   for p in pairs(Bag) do
	       if Bag[p].kind and Bag[p].kind==l_skill then
		      exe('wield '.. Bag[p].fullid)
		   end
	   end
	   checkWield()
	end
    return check_bei(xuexiContinue)
end
function xuexiNext()
    EnableTriggerGroup("xuexi",false)
    tmp.skill=master.skills[tmp.xuexi]
    if skills[tmp.skill] then
       if skills[tmp.skill].lvl>=450 then
          skills[tmp.skill].mstlvl=450
       else
          skills[tmp.skill].mstlvl=skills[tmp.skill].lvl
       end
    end
    tmp.xuexi=tmp.xuexi+1
    if tmp.xuexi>table.getn(master.skills) then
   xxpot=hp.pot_max
   xuefull=1
       return xuexiFinish()
    end
	local l_skill = skillEnable[master.skills[tmp.xuexi]]
	   weapon_unwield()
	if l_skill and weaponKind[l_skill] then
	   if master.skills[tmp.xuexi]=="yuxiao-jian" then l_skill = "xiao" end
	   for p in pairs(Bag) do
	       if Bag[p].kind and Bag[p].kind==l_skill then
		      exe('wield '.. Bag[p].fullid)
		   end
	   end
	   checkWield()
	end
	   local leweapon=GetVariable("learnweapon")
	   exe('wield '..leweapon)
    return check_bei(xuexiContinue)
end
function xuexiLvlUp(n,l,w)
    for p in pairs(skills) do
        if skills[p].name==w[2] then
	   skills[p].mstlvl=nil
	   break
	end
    end
end
function xuexiSleep()
    EnableTriggerGroup("xuexi",false)
    if score.party and score.party=="神龙教" then
       return go(xuexiSleepOver,"神龙岛","卧室")
    end
    if score.party and score.party=="少林派" then
       return go(xuexiSleepOver,"shaolin/sengshe3","")
    end
    if score.party and score.party=="桃花岛" then
        if score.master and score.master=="黄药师" then
	   return go(xuexiSleepOver,"桃花岛","客房")
        else
           return go(xuexiSleepOver,"归云庄","客房")
        end
    end
	if score.master and score.master=="杨过" then
	   return go(xuexiSleepOver,"gumu/jqg/wshi","")
    end
	if score.master and score.master=="小龙女" then
	   return go(xuexiSleepOver,"gumu/jqg/wshi","")
    end
	if score.party and score.party=="武当派" and score.gender=='女' then
       return go(xuexiSleepOver,"武当山","女休息室")
    end
	if score.party and score.party=="武当派" and score.gender=='男' then
       return go(xuexiSleepOver,"武当山","男休息室")
    end
	if score.party and score.party=="天龙寺" then
       return go(xuexiSleepOver,"dali/wangfu/woshi2","")
    end
	if score.party and score.party=="姑苏慕容" then
       return go(xuexiSleepOver,"姑苏慕容","厢房")
    end
	if score.party and score.party=="星宿派" then
       return go(xxSleepcheck,"星宿海","逍遥洞")
    end
	if score.party and score.party=="昆仑派" then
       return go(xuexiSleepOver,"昆仑山","休息室")
    end
	if score.party and score.party=="华山派" and score.gender=='男' then
       return go(xuexiSleepOver,"华山","男休息室")
    end
	if score.party and score.party=="华山派" and score.gender=='女' then
       return go(xuexiSleepOver,"华山","女休息室")
    end
	if score.party and score.party=="铁掌帮" and score.gender=='男' then
       return go(xuexiSleepOver,"铁掌山","男休息室")
    end
	if score.party and score.party=="铁掌帮" and score.gender=='女' then
       return go(xuexiSleepOver,"铁掌山","女休息室")
    end
    return xuexiFinish()
end
function xxSleepcheck()
    exe('give caihua 1 coin')
    wait.make(function() 
       wait.time(1)
       exe('enter;sleep')
    xuexiSleepOver()
    end)
end
function xuexiSleepOver()
    exe('sleep')
    checkWait(xuexiParty,3)
end
function xuexiFinish()
       messageShow('学习完毕！')
       flag.xuexi=0
    EnableTriggerGroup("xuexi",false)
    DeleteTriggerGroup("xuexi")
	   weapon_unwield()
	   local leweapon=GetVariable("learnweapon")
	   exe('cha;unwield '..leweapon)
	dis_all()
    return check_busy(check_food)
end
function yunAddInt()
    if perform.force and perform.force=="linji-zhuang" then
       exe('yun zhixin')
    end
	--if perform.force and perform.force=="bihai-chaosheng" then
   --    exe('yun qimen')
   -- end
	if perform.force and perform.force=="yunu-xinjing" then
       exe('yun xinjing')
    end
end

function literate()
    exe('nick 学习读书写字')
       messageShow('学习读书写字！')
    DeleteTemporaryTriggers()
	if hp.exp<151000 then
	    master.times=3
	else
	    master.times=math.modf(hp.jingxue/100)
	    if master.times>50 then master.times=50 end
	end
	return check_busy(literateGo)
end
function literateGo()
	   weapon_unwield()
	   local leweapon=GetVariable("learnweapon")
	   exe('wield '..leweapon)
    --go(literateCheck,'扬州城','书院')
	go(literateNeili,'扬州城','书院')
end

function literateNeili()
     zhunbeineili(literateCheck)
   
end

function literateCheck()
    print('literateCheck....')
    DeleteTriggerGroup("litxuexi")
    create_trigger_t('litxuexi1',"^(> )*顾炎武对着你端详了一番道：“你因经验所制，暂时无法再进修更高深的学问了。”",'','litxuexiover')
    SetTriggerOption("litxuexi1","group","litxuexi")
    EnableTriggerGroup("litxuexi",true)
    flag.idle = nil
    exe('hp')
    return checkWait(literateXue,0.8)
	--zhunbeineili(literateXue)
end
function litxuexiover()
    DeleteTriggerGroup("litxuexi")
    dis_all()
    return check_halt(literateBack)
end
function literateXue()
    print('literateXue....')
    if not locl.id["顾炎武"] then
	   return literateBack()
	end
	print('literateXue....1')
	--[[
    if hp.neili<100 then 
	   if nxw_cur>0 then
	      print('literateXue....111')
	      exe('eat  huangqi dan')
	   elseif hp.exp<800000 then
	       print('literateXue....222')
	      return xuexi()
	   else
	       print('literateXue....333')
          return literateBack()
	   end
    end
	print('literateXue....2')
	if hp.neili<1000 then
	   exe('eat '.. drug.neili2)
	end]]
	

	exe('unwield fengyun sword;unwield wuji xiao;uweapon shape fengyun sword;wield taiji sword')
	
	
	print('literateXue....3')
    if hp.pot>master.times-1 then
       yunAddInt()
       exe('yun jing;xue gu literate '..master.times)
       return check_busy(literateCheck)
    elseif hp.pot<master.times then
       return literateBack()
	else
	   return literateBack() 
    end
end
function literateBack()
       messageShow('读书写字学习完毕！')
	   weapon_unwield()
	   local leweapon=GetVariable("learnweapon")
	   exe('unwield '..leweapon)
    exe('hp;score;cha;yun jing;yun qi;yun jingli')
	dis_all()
    return check_busy(check_food)
end

function duanzao()
    exe('nick 学习锻造')
    DeleteTemporaryTriggers()
	if hp.exp<151000 then
	    master.times=3
	else
	    master.times=math.modf(hp.jingxue/120)
	    if master.times>50 then master.times=50 end
	end
	return check_busy(duanzaoGo)
end
function duanzaoGo()
    return go(duanzaoCheck,'扬州城','兵器铺')
end
function duanzaoCheck()
    flag.idle = nil
    exe('score;hp;cha')
    checkBags()
    return checkWait(duanzaoXue,0.8)
end
function duanzaoXue()
    if not locl.id["铸剑师"] then
	   return duanzaoBack()
	end
    if hp.neili<100 then 
	   if nxw_cur>0 then
	      exe('eat chuanbei wan')
	   else
          return duanzaoBack()
	   end
    end
	if hp.neili<1000 then
	   exe('eat '.. drug.neili)
	end
    if skills["duanzao"] and skills["duanzao"].lvl>=221 then
       return duanzaoBack()
    end
    if Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt>30 and hp.pot>master.times-1 then
       yunAddInt()
       exe('yun jing;xue shi duanzao '..master.times)
       return duanzaoCheck()
    elseif hp.pot<master.times then
       return duanzaoBack()
    elseif score.gold>300 then
       return check_bei(duanzaoQu,1)
	else
	   return duanzaoBack() 
    end
end
function duanzaoQu()
    exe('n;#3w;#3n;w;qu 30 gold')
    exe('e;#3s;#3e;s')
    return check_busy(duanzaoCheck,1)
end
function duanzaoBack()
    exe('hp')
      return check_busy(check_food)
end

function zhizao()
    exe('nick 学习织造')
    DeleteTemporaryTriggers()
	if hp.exp<151000 then
	    master.times=3
	else
	    master.times=math.modf(hp.jingxue/120)
	    if master.times>50 then master.times=50 end
	end
	return check_busy(zhizaoGo)
end
function zhizaoGo()
    return go(zhizaoCheck,'大理城','裁缝店')
end
function zhizaoCheck()
    flag.idle = nil
    exe('score;hp;cha')
    checkBags()
    return checkWait(zhizaoXue,0.8)
end
function zhizaoXue()
    if not locl.id["老裁缝"] then
	   return zhizaoBack()
	end
    if hp.neili<100 then 
	   if nxw_cur>0 then
	      exe('eat chuanbei wan')
	   else
          return zhizaoBack()
	   end
    end
	if hp.neili<1000 then
	   exe('eat '.. drug.neili)
	end
    if skills["zhizao"] and skills["zhizao"].lvl>=221 then
       return zhizaoBack()
    end
    if Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt>30 and hp.pot>master.times-1 then
       yunAddInt()
       exe('yun jing;xue caifeng zhizao '..master.times)
       return zhizaoCheck()
    elseif hp.pot<master.times then
       return zhizaoBack()
    elseif score.gold>300 then
       return check_bei(zhizaoQu,1)
	else
	   return zhizaoBack() 
    end
end
function refinekuang(n,l,w)
        if w[2] == '铁' then
                return check_busy(function() exe("refine tiekuang shi") end)
        elseif w[2] == '金' then
                return check_busy(function() exe("refine jinkuang shi") end)
        elseif w[2] == '银' then
                return check_busy(function() exe("refine yinkuang shi") end)
        elseif w[2] == '铜' then
                return check_busy(function() exe("refine tongkuang shi") end)
        end
end
function zhudingkuang(n,l,w)
  if w[2] == '流金魄' then
    return check_busy(function() exe("zhuding 1 Liujin po") end)
        end
end

function zhizaoQu()
    exe('e;n;#3e;n;qu 30 gold')
    exe('s;#3w;s;w')
    return check_busy(zhizaoCheck,1)
end
function zhizaoBack()
    exe('hp')
      return check_busy(check_food)
end

function wuxingzhen()
    DeleteTemporaryTriggers()
    flag.times=1
    return go(wuxingzhenCheck,'襄阳城','卧房')
end
function wuxingzhenCheck()
    if locl.id["温方山"] then
       return wuxingzhenStart()
    else
       local l_cnt=table.getn(getRooms('卧房','襄阳城'))
       flag.times = flag.times + 1
       if flag.times > l_cnt then
          return wuxingzhenFinish()
       else
          local l_sour=getRooms('卧房','襄阳城')[flag.times-1]
	      return go(wuxingzhenCheck,'襄阳城','卧房',l_sour)
       end
    end
end
function wuxingzhenStart()
    exe('yun jing')
	exe('ask wen fangshan about 五行阵')
    if math.random(1,5)==1 then
       exe('cha;hp')
       locate()
    end
    return check_bei(wuxingzhenCon,1)
end
function wuxingzhenCon()
    if skills["wuxing-zhen"] and skills["wuxing-zhen"].lvl>159 then
       return wuxingzhenFinish()
    end
    if not locl.id["温方山"] or hp.pot<10 then 
       return wuxingzhenFinish()
    end
    return checkWait(wuxingzhenStart,0.5)
end
function wuxingzhenFinish()
    return check_heal()
end

function checkPrepare()
   
    print('checkPrepare.............................')
      EnableTriggerGroup("poison",false)
      DeleteTriggerGroup("poison")
    drugPrepare = drugPrepare or {}
   
    if hp.exp<150000 then
       return checkPrepareOver()
    end
   
    if Bag["镣铐"] then
	   return tiaoshui()
	end
	
    if Bag and Bag["白银"] and Bag["白银"].cnt and Bag["白银"].cnt>500 then
       return check_gold()
    end
    if (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt<count.gold_max and score.gold>count.gold_max) or (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt>count.gold_max*4) then
      return check_gold()
	end
	if score.gold and score.gold>100 and nxw_cur<5 and drugPrepare["内息丸"] then
       return checkNxw()
    end
        if score.gold and score.gold>100 and cbw_cur<5 and drugPrepare["川贝内息丸"] then
       return checkNxw()
    end
	
	 ---print('checkPrepare.............................111111111')
        
    if score.gold and score.gold>100 and hqd_cur<5 and drugPrepare["黄芪内息丹"] then
	    ---print('checkPrepare.............................222222222')
       return checkNxw()
    end
	  ---print('............'..cty_cur..'..........................................yao')
	  if score.gold and score.gold>100 and cty_cur<5 and drugPrepare["蝉蜕金疮药"] then
	  ---print('buy chy.........?')
	  ---print('cty_cur'..cty_cur)
       return checkHxd()
    end
	
	
	
	--[[if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["邪气丸"] or Bag["邪气丸"].cnt<2) then
       return checkXqw()
	end
	
	if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["正气丹"] or Bag["正气丹"].cnt<2) then
       return checkZqd()
	end
	
	if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["邪气丸"] or Bag["邪气丸"].cnt<2) then
       return checkXqw()
	end
	
	if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["正气丹"] or Bag["正气丹"].cnt<2) then
       return checkZqd()
	end]]
	
	if not flag.item then
       if score.party and score.party=="峨嵋派" and not Bag["腰带"] then
          return check_item()
	   end
       if score.party=="少林派" and not Bag["护腰"] and not Bag["护腕"] then
	      return check_item()
	   end
	end
	
	---print('test000000000000')
	
	if not Bag["火折"] and drugPrepare["火折"] then
       ---return checkFire()
	   return checkFireNew()
    end
	
	---print('test111111111')
	
	if not Bag["牛皮酒袋"] and drugPrepare["牛皮酒袋"] then
       return checknpjd()
    end
		if score.gold and score.gold>100 and hxd_cur<3 and drugPrepare["活血疗精丹"] then
       return checkLjd()
    end

	if score.tb and score.tb>100 and dhd_cur<1 and drugPrepare["大还丹"] then
       return checkdhd()
    end
    
	---print('test44444444')
	
	for p in pairs(weaponPrepare) do
	    
		if p=='石子' and (not Bag['石子'] or Bag["石子"].cnt<20) and Bag["黄金"].cnt>3 then
		    return checkWeapon('石子')
		end
	
	    if weaponStore[p] and not Bag[p] and Bag["黄金"].cnt>3 then
		   return checkWeapon(p)
		end
		
		if weaponFunc[p] and not Bag[p] then
		   return _G[weaponFuncName[p]]()
		end
	    if  weaponPrepare["飞镖"] and Bag["枚飞镖"].cnt<100 then
		   return checkWeapon("飞镖")
		end
	end
	local l_cut = false
	for p in pairs(Bag) do
	    if weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind]=="cut" then
		   l_cut = true
		end
	end
	
	---print('test55555555555')
	
	if not l_cut and not Bag["木剑"] then
	   weaponPrepare["木剑"] = true
	   return checkWeapon("木剑")
	end
	 
	if Bag["韦兰之锤"] then
	  	 return checkHammer()
		end
		
		
	local autoGetJinHe = tonumber(GetVariable('autoGetJinHe'))
	
	if Bag["锦盒"].cnt > 0 and autoGetJinHe==1 then 
	   --print('自动取锦盒...')
	   return autojinheTrigger()
	end
	
	---print('test----------------')
	
     local l_cnt=Bag["壹仟两银票"].cnt
    if Bag['壹仟两银票'] and l_cnt>0 then 
       return checkcash()
    end
	
	---print('test666666666666')
 
   --[[ if not Bag["灵器·小周天风云剑"] or not Bag["凝晶太极剑"] or not Bag["玉水无极箫"] then    
	    print('test999999999')
	   return weapon_lose()
    end ]]--
	
    for p in pairs(weaponPrepare) do
	  print('1111111111='..p)
      if p ~= '石子' then 
	      if not Bag[p] then 
		      print('test999999999')
		      return weapon_lose()
		  end
	  end 
    end
		
	
	---print('test77777777777777777')
	
	for p in pairs(Bag) do
	    if Bag[p] and itemSave[p] then
           return checkYu(p)
		end
	    --if Bag[p].id and Bag[p].id["yu"] and string.find(p,"玉") then
		--   return checkYu(p)
		--end
		  if Bag[p].id and Bag[p].id["jintie chui"] and string.find(p,"金铁锤") then
		   return checkYu(p)
		end
		  if Bag[p].id and Bag[p].id["shentie chui"] and string.find(p,"神铁锤") then
		   return checkYu(p)
		end
    end
	---drop 不要的
	weapondrop()
	
	exe('wear all')
	---检查年龄
	print('检查年龄...............')
	check_goldage()
	
	----print('xuezhu_require........'..xuezhu_require)
	print('检查xuezhu...............')
	if xuezhu_require==1 then
           if GetVariable("xuezhu_status")~=nil and GetVariable("xuezhu_status")=='2' then
               SetVariable("xuezhu_status","0") --重启之后初始化自动抓雪蛛变量为0
           end
           if GetVariable("xuezhu_status")~=nil and GetVariable("xuezhu_status")=='1' then
              SetVariable("xuezhu_status","-1") --如果上周要了真丹，未给雪蛛，重启之后初始化自动抓雪蛛变量为-1
           end
           xuezhu_require=0
        end
        
     local x=check_xuezhu_status()
     if x=='0' then return getxuezhu0() end
     if x=='-1' or x=='1' then 
		print('getxuezhu................')
		return getxuezhu1() 
    end
	
	local last_age = tonumber(GetVariable('getgold_age'))
	print('cur age..'..score.age)
	print('last age..'..last_age)
	
    if score.age > last_age then
      print('可以去领俸禄了！！！')
      return go(get_payment,"归云庄","前厅")
   else
      print('之前已经领过俸禄了！！')
	end 
	
	if not Bag["金钗"] then
	   print('没有金钗....gogogogo')
	   return checkJinChai()
	end	
	
	if not Bag["绳子"] or Bag["绳子"].cnt > 1  then
	   print('绳子....gogogogo')
	   ---return killrfy()
	   return checkShengzi()
	end
	
	
	--[[
	lianxi_flag = tonumber(GetVariable('lianlian'))
	if lianxi_flag == 1 then
	   return pre_lianlian()
	end 
	]]--
    	
	return checkPrepareOver()
end




function checkPrepareOver()
 print('checkPrepareOver...............')
 
 job_exp_tongji()
 
 if lookxin==1 and needdolost==1 then
   sendXXin()
  end
  if lostletter==1 and needdolost==1 then
     return letterLost()
  end
   print('是学习还是继续工作？？？？')
   ---print('last job ===='..job.last)
  --if not job.last or job.last=="songxin" or needdolost==1 or job.last=="tdh" or job.last=="songmoya" or job.last=="huashan" or job.zuhe["hqgzc"] then
  --  return check_xuexi()
  --else
     return check_job()
  --end
end
function letterLost()
     print('letterLost.........')
     sLetterlost()
  go(letterLostBegin,"华山","祭坛")
end

last_name_list = {}
cur_name_index = 0
ll_url = ''

function letterLostBegin()
   print('letterLostBegin....................................................')
   
   --print('condition.vpearl=:'..condition.vpearl)
   EnableTrigger('score4',true) 
   wait.make(function()
       while true do
	       wait.time(0.5)
	       exe('cond')
	       local l,w = wait.regexp('^(> )*当前你没有被判断为机器人。$',1)
		   if l~= nil then break end
	   end
       --print('condition.vpearl=:'..condition.vpearl)
	   if needvpearl==1 and (condition.vpearl==0 or not condition.vpearl)then
           ---return Govpearl()
		   Govpearlnew()
       end
	   
   
  -- create_trigger_t('lostletter1',"^(> )*请打开网页(\\N*)查看收信人。$",'','getUrl')
   
       if lostletter==1 then
	      wait.make(function()
		      while true do
			     exe('chakan letter;look letter')
				 local l,w = wait.regexp("^(> )*请打开网页(\\N*)查看收信人。$",1)
				 if l ~= nil then 
				     ll_url=w[2]
					 break
				 end
			  end
		  
		   return goMark()
		  end)
		  
	  
        end
   
   
   --[[
	    if lostletter==1 then
		     wait_busy()
		     exe('chakan letter')
		     wait_busy()
             exe('look letter')
			 wait_busy()
			 --wait.time(0.5)
			 return goMark()
        end
	   ]]--
   end)
   
 
end


function readLastName()
   print('readLastName....')
   local f = io.open("plugs\\ll_last_name_list.ini","r")
   local s = f:read()
   f:close() --关闭流
   
   if not isNil(s) then
     print(s)
	 last_name_list = utils.split(s,'|') 
	 cur_name_index = 1
   end
end

function writeLastName()
     print('writeLastName....')
	 
	 if #last_name_list > 0 then
	    local lost_cmd=GetVariable("lostname")
	    table.insert(last_name_list,1,lost_cmd)
	    table.remove(last_name_list)
	 
        local m_cmd = table.concat(last_name_list,'|')
	    print(m_cmd)
        local fni = 'plugs\\ll_last_name_list.ini'
        local fi = io.open(fni,"w")
        fi:write(m_cmd)
        fi:close()
	    last_name_list={}
	    cur_name_index=0
	    ll_url = ''
	    
	 end 	
end 


function sLetterlost()
    print('sLetterlost............')
    DeleteTriggerGroup("lostletter")
    ---create_trigger_t('lostletter1',"^(> )*请打开网页(\\N*)查看收信人。$",'','goMark')
	--create_trigger_t('lostletter1',"^(> )*请打开网页(\\N*)查看收信人。$",'','getUrl')
    create_trigger_t('lostletter2',"^(> )*你乘人不注意，偷偷把失落的信笺扔进了路边的草丛。$",'','sendOk')
    create_trigger_t('lostletter3',"^(> )*信封上的字迹模糊不清，不知何人遗落到此处。$",'','sendOk')
    create_trigger_t('lostletter4',"^(> )*你将失落的信笺交给",'','sendOk')
    create_trigger_t('lostletter5',"^(> )*你在信卦上写上收信人的名字。$",'','lookXin')
    create_trigger_t('lostletter6',"^(> )*你再看清楚一点。$",'','letterLostBegin')
    create_trigger_t('lostletter7',"^(> )*信封上写着：(\\D*)\\((\\D*)\\)",'','lostName')
	  --create_trigger_t('lostletter8',"^[> ]*好象收信人曾在(\\D*)一带出现。$",'','get_lost_locate')
    --SetTriggerOption("lostletter1","group","lostletter")
    SetTriggerOption("lostletter2","group","lostletter")
    SetTriggerOption("lostletter3","group","lostletter")
    SetTriggerOption("lostletter4","group","lostletter")
    SetTriggerOption("lostletter5","group","lostletter")
    SetTriggerOption("lostletter6","group","lostletter")
    SetTriggerOption("lostletter7","group","lostletter")
    --SetTriggerOption("lostletter8","group","lostletter")
	llgo()
    EnableTriggerGroup("lostletter",true)
end

function getUrl(n,l,w)
   ll_url=w[2]
   --letterLostBegin()
end

function goMark()
     print('开始填写失落信件人物ID')
	 print(ll_url)
     --local m_cmd=w[2]
	 local m_cmd = ll_url
     --OpenBrowser (m_cmd)
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
    --return Markletter()
     create_timer_s('llwait',1.0,'llwait')
 end
 function llwait()
    local f = io.open("plugs\\LLOUT.ini","r")
    local s = f:read()
   
    f:close() --关闭流
  
    if not isNil(s) then
     print(s)
    if s~="" then
     DeleteTimer('llwait')
     SetVariable("lostname",s)

     local fno = 'plugs\\LLOUT.ini'
     local fo = io.open(fno,"w")
     fo:write("")
     fo:close()
         return MarkName()
    end 
    end

 end  
function Markletter()
      l_result=utils.inputbox ("输入信件人物ID，放弃请输入discard。", "lostname", GetVariable("lostname"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("lostname",l_result)
	   end
    return MarkName()
end
function MarkName()
    local lost_cmd=GetVariable("lostname")
    if lost_cmd=='discard' then
      return exe('discard letter')
    else
      return exe('mark '..lost_cmd)
    end
end
function lookXin()
    print('lookXin.........lookxin:'..lookxin)
	
	if needdolost ==1 then 
	    lookxin=1
		---writeLastName()
       exe('look letter')
	end
end
function lostName(n,l,w)
    print('lostName.........')
    lost_name=string.lower(w[3])
    return create_timer_s('sendTo',0.4,'sendTo')
end
function sendXin()
    wipe_kill=1
    sLetterlost()
    return create_timer_s('sendTo',0.4,'sendTo')
end
function sendTo()
     exe('sendto '..lost_name)
    exe('sendto '..lost_name)
end
function sendOk()
    print('sendok.................???????????????')
    lookxin=0
    lostletter=0
    m_cmd=nil
    lostletter_locate=''
	 --mousedown_lostletter()--马上刷新地点
	 --print('condition.vpearl........:'..condition.vpearl)
	condition.vpearl=0
    DeleteTimer( 'sendTo' )
    DeleteTriggerGroup("lostletter")
	--SetTriggerOption("hp16","sequence",1)
	--EnableTrigger("hp16",true)
	EnableTrigger("score4",true)
    --exe('follow none;cond;jobtimes')
	exe('follow none')
	
	
	wait.make(function()
	    --LLlost=tonumber(w[4])
		 while true do
	       --wait.time(0.5)
	       exe('cond')
	       local l,w = wait.regexp('^(> )*当前你没有被判断为机器人。$',1)
		   if l~= nil then break end
	    end
		
		--[[local self = coroutine.running()
		local async_continue = function()       
            print("async resume")
            coroutine.resume(self)
        end ]]--
		
	    --print('condition.vpearl=:'..condition.vpearl)
        if (condition.vpearl==0 or not condition.vpearl) and needdolost==1 and needvpearl==1 then
           --Govpearl()
		   --await_go('扬州城','当铺')
		   --dhvpearl()
		   --exe('duihuan vpearl;cond')
		   
		   Govpearlnew()
        end
		
		while true do 
		   wait.time(0.5)
		   exe('jobtimes')
		   local l,w = wait.regexp('(> )*昨天完成失落信笺任务(\\N*)次，今天完成失落信笺任务(\\N*)/(\\N*)次。',1)
		   if l~=nil then 
		      LLlost=tonumber(w[4])
			  break
		   end 
		end
		
		if LLlost*1>=lostno*1 and needdolost==1 then
	       print('do lost again..............')
           --return dolostAg()   
		    do_lost_again = tonumber(GetVariable('do_lost_again'))
            if do_lost_again == 1 then 
                print('再做失落的信10次！')
                lostno=lostno+10
                dis_all()
				await_go('扬州城','当铺')
				exe('duihuan pcert')
                --return go(dhlost,'扬州城','当铺')
            else
                needdolost=0
                print('关闭做LL')
            end    
        end
		
	    sendOk_fix()
        return check_food()
	end)
		
	
end



function check_xuexi()
  print('check_xuexi...............needxuexi=='..needxuexi)
  if MidHsDay[locl.time] and score.master=='风清扬' then
     return check_job()
  end
  if needxuexi==0 then
     return check_job()
  end
  if needxuexi==1 then
     return check_pot()
  end
end
jobtimes = {}
function checkJobtimes(n,l,w)
	jobtimes[w[1]] = tonumber(w[2])
end
function checkJoblast(n,l,w)
    local joblast = {
          ["武当锄奸"] = "wudang",
	  ["大理送信"] = "songxin",
	  ["强抢美女"] = "xueshan",
	  ["惩恶扬善"] = "huashan",
	  ["长乐帮"]   = "clb",
	  ["天地会"]   = "tdh",
	  ["嵩山并派"] = "songshan",
	  ["丐帮任务"] = "gaibang",
	  ["颂摩崖抗敌任务"] = "songmoya",

    }

    if joblast[w[2]] then
       job.last = joblast[w[2]]
    end
end

function check_job()
   print('check_job.........')
   if xcexp==0 and hp.exp<1000000 then
      print('巡城到1M')
      kdummy=0
      return xunCheng()
   end
   if xcexp==1 and hp.exp<2000000 then
      print('巡城到2M')
      kdummy=0
      return xunCheng()
   end
   create_triggerex_lvl('dmlflag1','^(> )*【江湖传闻】玩家竞技活动开始了！','','dml_on',95)
        SetTriggerOption('dmlflag1','group','hp') 

    print('dmlcheck.................................dmlcheck..............................dmlcheck.....................')		
	local cur_date = tonumber(os.date("%Y%m%d"))
	local cur_hour = tonumber(os.date("%H"))
	local dml_cur_date = tonumber(GetVariable('dml_cur_date'))
	
    --if not dml_cnt then dml_cnt = 0 end
	
	if cur_hour >= 10 and cur_hour<22 and (not condition.busy or condition.busy == 0) and dml_cur_date ~= cur_date then
	    return dml_check()
	end
		
	--[[
    if dml_cnt < 5 and (not condition.busy or condition.busy == 0) then
       local fn = 'logs\\diemenglou_mark_'..score.id..'.log'
           local f = io.open(fn,"r")
           if not f then
          ColourNote('orange','black','未检测到蝶梦楼记录，准备进行蝶梦楼竞技！')
              return dml_check()
           else
              local s = f:read()
              f:close()
              if s ~= os.date("%Y%m%d%H") then                          --有log
                     if os.date("%Y%m%d%H") - s >= 100 then                 --距离上一次经过了至少24小时
                            ColourNote('lime','black','找到'..s..'蝶梦楼记录，日期为昨天。准备进行蝶梦楼竞技！')
                        return dml_check()                     
                 else
                        ColourNote('white','red','找到'..s..'蝶梦楼记录，时间间隔不足【','yellow','black','24','white','red','】小时不开启蝶梦楼竞技！')
                     end
              end
           end
        end
   ]]--
   if score.party=="桃花岛" and (hp.shen>150000 or hp.shen<-150000) then
      return thdJiaohui()
   end
   
   --if score.gold and score.gold>150 and weaponUsave and countTab(weaponUsave)>0 and math.random(1,5)==1 then
      --return weaponUcheck()
   --end
   return check_halt(weaponUcheck)
end

function GoDangPu()
       dis_all()
   ----return go(test,"city/dangpu")
   --return go(test,"扬州城","当铺")
   
       wait.make(function()
           await_go("扬州城","当铺")
	       go_dp=0
	       return button_smyteam()
       end)
end

function check_jobx()
    print('check_jobx.......')
    EnableTimer('walkWait4',false)

    print('go_dp..='..go_dp)
    if go_dp==1 then 
      return GoDangPu()
    end


local zhaocs_auto = tonumber(GetVariable('zhaocs_auto'))
local cur_cs_hour = tonumber(os.date("%H"))
local last_cs_hour = tonumber(GetVariable('zhaocs_finish_hour'))
local cs_last_flag = GetVariable('zhaocs_last_flag')
if zhaocs_auto == 1 and (cur_cs_hour ~= last_cs_hour) and (cs_last_flag=='sucess') then 
    return zhuacaishen_job_judge()
end 



if lookxin==1 then
    print('lookxin=1...................')
      sendXXin()
  end
if lostletter==1 and needdolost==1 then
     return letterLost()
  end
for p in pairs(weaponUsave) do
           if Bag and not Bag[p] then
                        job.zuhe["songmoya"]=nil
           end
   end
  
   wait.make(function()
     if fqyytmp.goArmorD==1 then
        print('fqyytmp.goArmorD==1..........')
   
	    local self = coroutine.running()
		local async_continue = function()       
            print("async resume")
            coroutine.resume(self)
        end
		checkBags(async_continue)
		coroutine.yield()
		return fqyyArmorGoCheck()
         
     end
	 
     if job.zuhe==nil then job.zuhe={} end
     if job.zuhe["zhuoshe"] and score.party~="丐帮" then job.zuhe["zhuoshe"]=nil end
     if job.zuhe["sldsm"] and score.party~="神龙教" then job.zuhe["sldsm"]=nil end
     if job.zuhe["songmoya"] and hp.exp<5000000 then job.zuhe["songmoya"]=nil end
     if smydie*1>=smyall*1 then job.zuhe["songmoya"]=nil end
     if job.zuhe["husong"] and (score.party~="少林派" or hp.exp<2000000) then job.zuhe["husong"]=nil end
     if job.zuhe["songmoya"] and job.last~="songmoya" and mytime<=os.time() then return songmoya() end
     if job.zuhe["hubiao"] and job.last~="hubiao" and job.teamname and ((not condition.hubiao) or (condition.hubiao and condition.hubiao<=0)) then
      return hubiao()
     elseif job.zuhe["husong"] then
      return husong()
     else
      return checkJob()
     end
   
  end)
   
   
end



function checkJob()
    print('checkJob........')
    
	local use_wxb_sq = tonumber(GetVariable('use_wxb_sq'))
	local worship_done = tonumber(GetVariable('worship_done'))
	
    wait.make(function()
	    locate(coroutine.running())
		coroutine.yield()
		if locl.weekday=='四' and locl.hour==7 and locl.min>=58 then 
		    --明悟清零
			SetVariable('worship_done','0')
	        return reboot_prepare()
		elseif locl.weekday=='三' and locl.hour==11 and locl.min>=20 and locl.min<=30 and worship_done==0 then 
            return auto_worship_laoren()     			
	    elseif use_wxb_sq == 1 then
		     checkBags(coroutine.running())
		     coroutine.yield()
		     if shenqi_id~=nil then 
			     return checkJob_ex()
			 else
			     return buy_wxb_weapon_prepare()
			 end
		else
		    return checkJob_ex()
		end
	end)
end


function checkJob_ex()
    print('checkJob_ex........')

    pfm_xiangyun = GetVariable('pfm_xiangyun')
	job_hqg_toggle = tonumber(GetVariable('job_hqg_toggle'))

	
	job_hqg_finish_date = tonumber(GetVariable('job_hqg_finish_date'))
	local cur_date = tonumber(os.date("%Y%m%d"))
	local cur_hour = tonumber(os.date("%H"))
	local cur_min = tonumber(os.date("%M"))
	
	if job.last and job.last ~="hqgzc" and hqgzcJobtime<=os.time() and job_hqg_toggle==1 
	    and  (job_hqg_finish_date == nil or  cur_date > job_hqg_finish_date ) and cur_hour >= 8  then 
              return hqgzc()
        end
   
   if job.zuhe["songxin2"] then
      job.zuhe["songxin2"]=nil
	  job.zuhe["songxin"]=true
	  flag.sx2=true
   end
   
   if job.last and job.zuhe[job.last] then
      if type(job.zuhe[job.last]) == "number" then
	      job.zuhe[job.last] = job.zuhe[job.last] + 1
	  else
	      job.zuhe[job.last] = 1
	  end
   end
   if countTab(job.zuhe) > 2 and not skills["xixing-dafa"] and job.zuhe["huashan"] and job.zuhe["wudang"] and jobtimes["华山岳不群惩恶扬善"] and jobtimes["武当宋远桥杀恶贼"] then
	  local t_hs = jobtimes["华山岳不群惩恶扬善"]
	  local t_wd = jobtimes["武当宋远桥杀恶贼"]
	  local t_times = math.fmod((t_hs+t_wd),50)
	  if t_times > 48 then
	     exe('pray pearl')
	     if job.last ~= "huashan" then
		    return huashan()
		 else
		    for p in pairs(job.zuhe) do
			    if p~= "huashan" and p~="wudang" and p~="hubiao" and p~="husong" and p~="songmoya" then
				   return _G[p]()
				end
			end
		 end
	  end
   end
   if score.party and score.party=="华山派" and countTab(job.zuhe) > 2 and not skills["dugu-jiujian"] and job.zuhe["huashan"] and job.zuhe["songxin"] then
	  local t_hs,t_sx,t_gb 
	  
	  if jobtimes["华山岳不群惩恶扬善"] then
	     t_hs = jobtimes["华山岳不群惩恶扬善"]
	  else
	     t_hs = 0
	  end
	  if jobtimes["大理王府送信任务"] then
	     t_sx = jobtimes["大理王府送信任务"]
	  else 
	     t_sx = 0
	  end
	  if jobtimes["丐帮吴长老杀人任务"] then
	     t_gb = jobtimes["丐帮吴长老杀人任务"]
	  else 
	     t_gb = 0
	  end
	  local t_times = math.fmod((t_hs+t_sx+t_gb),50)
	  if t_times > 47 then
	     exe('pray pearl')
	     if job.last ~= "huashan" then
		    return huashan()
		 else
		    for p in pairs(job.zuhe) do
			    if p~= "huashan" and p~="songxin" and p~="hubiao" and p~="husong" and p~="songmoya" then
				   return _G[p]()
				end
			end
		 end
	  end
   end

   if job.third and job.zuhe[job.third] and job.last~=job.third then
     if job.second and job.last==job.second then
       if job.third=="wudang" and (not job.wdtime or job.wdtime<=os.time()) then
          return _G[job.third]()
       end
       if job.third~="wudang" and job.third~="songmoya" then
          return _G[job.third]()
       end
     end
   end
   if job.first and job.zuhe[job.first] and job.last~=job.first then
     print('job change 111111')
      if job.first~="xueshan" and job.first~="wudang" and job.first~="songmoya" then
	     return _G[job.first]()
	  end
	  if job.first=="xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan<=0)) then
		 return _G[job.first]()
	  end
	  if job.first=="wudang" and (not job.wdtime or job.wdtime<=os.time()) then
		 return _G[job.first]()
	  end
      if job.first=="xueshan" and condition.xueshan and condition.busy and condition.busy>=condition.xueshan then
         return _G[job.first]()
	  end
   end
   if job.second and job.zuhe[job.second] and job.last~=job.second then
      print('job change 222222')
      if job.second~="xueshan" and job.second~="wudang" and job.second~="songmoya" then
	     return _G[job.second]()
	  end
	  if job.second=="xueshan" and ((not condition.xueshan) or (condition.xueshan and condition.xueshan<=0)) then
		 return _G[job.second]()
	  end
	  
	  if job.second=="wudang" and (not job.wdtime or job.wdtime<=os.time()) then	  
		 return _G[job.second]()
	  end
	  if job.second=="xueshan" and condition.xueshan and condition.busy and condition.busy>=condition.xueshan then
         return _G[job.second]()
	  end
   end

   if job_suspend ~= nil then 
      print('job_suspend is not nil so ....')
       if job.last == 'wudang' then 
	       return songxin()
	   elseif job.last == 'songxin' then
	      return huashan()
	   else
	      return wudangSuspendFind()
	   end
   end
   
   print('check...job.zuhe...........')
   for p in pairs(job.zuhe) do
      print('job change 33333333333333...')
	  if job.last ~= nil then print(job.last) end
      if job.last ~= p and job.first ~= p and job.second ~= p and p ~= "songmoya" then
		   print('job change 444444444444444...........'..p)
	            return _G[p]()
		   end
	 end

   for p in pairs(job.zuhe) do
        if job.last ~= p and p ~= "songmoya" then
	            return _G[p]()
			end
	 end
   if job.zuhe["xueshan"] and job.last~="xueshan" then
      return xueshan()
   end
   if job.zuhe["huashan"] and job.last~="huashan" then
      return huashan()
   end
   if job.zuhe["tmonk"] and job.last~="tmonk" then
      return tmonk()
   end
   if job.zuhe["songxin"] and job.last~="songxin" then
      return songxin()
   end
   if job.zuhe["wudang"] and job.last~="wudang" then
      return wudang()
   end
   if job.zuhe["gaibang"] and job.last~="gaibang" then
      return gaibang()
   end
   if job.zuhe["zhuoshe"] and job.last~="zhuoshe" then
      return zhuoshe()
   end
   if job.zuhe["sldsm"] and job.last~="sldsm" then
      return sldsm()
   end
   if job.zuhe["songshan"] and job.last~="songshan" then
      return songshan()
   end
   if job.last~="songxin" then return songxin() end
   if job.last~="xueshan" and hp.shen<0 then return xueshan() end
   if job.last~="wudang" and hp.shen>100000 then return wudang() end
   if job.last~="gaibang" and hp.exp<2000000 and hp.shen>0 then return gaibang() end
   if job.last~="songshan" and hp.shen<0 and hp.exp<2000000 then return songshan() end

end




lianlian_times=0
function pre_lianlian()
    lianlian_times=0
    DeleteTriggerGroup('lianlian')
	create_trigger_t('lianlian_1',"^(> )*你反复练习金蛇剑法，获得了不少进步",'','lianlian')
	create_trigger_t('lianlian_2',"^(> )*你的内力不够练金蛇剑法",'','lianlian_finish')
	create_trigger_t('lianlian_3',"^(> )*你必须使用金蛇剑才能进一步练习你的金蛇剑法。",'','lianlian_finish')
	SetTriggerOption('lianlian_2','sequence',1)
	SetTriggerOption('lianlian_1','group','lianlian')
	SetTriggerOption('lianlian_2','group','lianlian')
	SetTriggerOption('lianlian_3','group','lianlian')
	
	if shenqi_id ~=nil then
	   exe('unwield '..shenqi_id..' jian;unwield fengyun sword;unwield shentong xiao;wield taiji sword')
	else
	   exe('unwield fengyun sword;unwield wuji xiao;uweapon shape fengyun sword;wield taiji sword')
	end 
	
    --exe('unwield '..shenqi_id..' jian;unwield fengyun sword;unwield shentong xiao;wield taiji sword')
    exe('jifa sword jinshe-jianfa')
	exe('lian sword 15;yun jingli;hp') 
	
end

function lianlian()
    wait.make(function()
	  wait.time(1)
	  exe('lian sword 15;yun jingli;hp')  
	end)
end

function lianlian_finish()
    if lianlian_times < 5 then
	   zhunbeineili(lianlian)
	   lianlian_times = lianlian_times + 1
	else
	   	lianlian_times = 0
       EnableTriggerGroup('lianlian',false)
	   exe('unwield taiji sword') 
      return checkPrepareOver()
	end 
end

function lianxi(times,xskill)
    local weapontype
    flag.lianxi=1
    local lianxi_times=5
    if times~=nil then
       lianxi_times=times
    end
    tmp.xskill = xskill
    if perform.force then
	   if not skills[perform.force] then
	      perform.force = nil
	   end
	end
	if not perform.force then
	   tmp.lvl = 0
	   for p in pairs(skills) do
	       q=skillEnable[p]
		   if q=="force" then
		      if skills[p].lvl > tmp.lvl then
			     tmp.lvl = skills[p].lvl
				 perform.force = p
			  end
		   end
	   end
	end
    if flag.lianxi==1 then
       for p in pairs(skills) do
           q=skillEnable[p]
	       if (not tmp.xskill or tmp.xskill==p) and q=="force" and skills[p].full==0 and perform.force and perform.force==p then
	          lianxi_times=lianxi_times*0.5
              exe('lian '..q..' '..lianxi_times)
              flag.lianxi=0
			  tmp.pskill=p
              exe('hp')
	          break
	       end
       end
    end
    if flag.lianxi==1 then
       for p in pairs(skills) do
           q=skillEnable[p]
	       if (not tmp.xskill or tmp.xskill==p) and q=="dodge" and skills[p].full==0 then
	          exe('bei none;jifa '..q..' '..p)
              exe('lian '..q..' '..lianxi_times)
              flag.lianxi=0
			  tmp.pskill=p
	          break
	       end
       end
    end
    if flag.lianxi==1 then
       for p in pairs(skills) do
           q=skillEnable[p]
		   if p == "yuxiao-jian" then
		      weapontype = "xiao"
		   else
		      weapontype = q
		   end
	       if (not tmp.xskill or tmp.xskill==p) and q and p==perform.skill and skills[p].full==0 and ((weaponKind[weapontype] and weaponInBag(weapontype)) or unarmedKind[q]) then
	          exe('bei none;jifa '..q..' '..p)
			  weapon_unwield()
			  if weaponKind[q] then
                 exe('wield '.. q)
	             for k,v in pairs(Bag) do
			         if Bag[k].kind == weapontype then
			    	     exe('wield '..Bag[k].fullid)
			    	  end
			     end
			  end
              exe('i;lian '..q..' '..lianxi_times)
              flag.lianxi=0
			  tmp.pskill=p
	          break
	       end
       end
    end
    if flag.lianxi==1 then
       for p in pairs(skills) do
           q=skillEnable[p]
		   if p == "yuxiao-jian" then
		      weapontype = "xiao"
		   else
		      weapontype = q
		   end
	       if (not tmp.xskill or tmp.xskill==p) and q and q~="force" and skills[p].full==0 and ((weaponKind[weapontype] and weaponInBag(weapontype)) or unarmedKind[q]) then
	          exe('bei none;jifa '..q..' '..p)
			  weapon_unwield()
			  if weaponKind[q] then
                 exe('wield '.. q)
	             for k,v in pairs(Bag) do
			         if Bag[k].kind == weapontype then
			    	     exe('wield '..Bag[k].fullid)
			    	  end
			     end
			  end
	          exe('i;lian '..q..' '..lianxi_times)
	          flag.lianxi=0
			  tmp.pskill=p
	          break
	       end
       end
    end
    beiUnarmed()
end
function beiUnarmed()
    local l_skill=beiUnarmedSkill()
	
	if score.party and score.party=="桃花岛" then
	    --exe('bei none;jifa sword yuxiao-jian;jifa dodge suibo-zhuliu;jifa leg xuanfeng-tui;jifa strike luoying-zhang;jifa hand lanhua-shou;jifa finger tanzhi-shentong;jifa parry yuxiao-jian;bei hand')
        exe('bei none;jifa all;jiali 1;bei hand') 	--------在这里修改，这个一般是过江过河后会bei的
		return
	end
		
	if l_skill and type(l_skill)=="string" and skillEnable[l_skill] then
	   exe('bei none')
	   exe('jifa '.. skillEnable[l_skill] ..' '.. l_skill)
	   exe('bei '.. skillEnable[l_skill])
	end
	
	
	if skillHubei[l_skill] and skills[skillHubei[l_skill]] then
	   l_skill = skillHubei[l_skill]
	   exe('jifa '.. skillEnable[l_skill] ..' '.. l_skill)
	   exe('bei '.. skillEnable[l_skill])
	end
end
function beiUnarmedSkill()
    local l_lvl=0
	local l_skill
    if perform and perform.skill and skillEnable[perform.skill] and unarmedKind[skillEnable[perform.skill]] then
       --exe('bei '.. skillEnable[perform.skill])
       return perform.skill
    end
    for p in pairs(flagFull) do
       if skills[p] and skillEnable[p] and unarmedKind[skillEnable[p]] then
          q = skillEnable[p]
          --exe('bei none;jifa '..q..' '..p..';bei '..q)
	      return p
       end
    end
    if score.party then 
       if score.party=="峨嵋派" and skills["hand"] and skills["jieshou-jiushi"] then
          --exe('bei none;jifa hand jieshou-jiushi;bei hand')
	      return "jieshou-jiushi"
       end
       if score.party=="丐帮" and skills["strike"] and skills["xianglong-zhang"] then
          --exe('bei none;jifa strike xianglong-zhang;bei strike')
	      return "xianglong-zhang"
       end
    end
    for p in pairs(skills) do
        if skillEnable[p] then
	       q = skillEnable[p]
	       if unarmedKind[q] then
	          if skills[p].lvl>l_lvl then
	             l_lvl=skills[p].lvl
			     l_skill=p
	             --exe('bei none;jifa '..q..' '..p..';bei '..q)
	          end
	       end
	    end
    end
	return l_skill
end


function wait_busy()
    while true do
	    ---print('wait..busy.....')
        ---exe('bei bei bei')
		exe('bei cuff')
        local l, w = wait.regexp('^(> )*(你现在已经组合|你已准备有一种技能了|你至少不会这两种拳脚技能的其中之一|你现在已经准备好特殊技能了)',1)
        if l ~= nil then break end
        wait.time(0.4)
    end
end


function check_busy(func,p_cmd)
         disWait()
         DeleteTriggerGroup("check_bei")
         create_trigger_t('check_bei1',"^(> )*(你现在已经组合|你已准备有一种技能了|你至少不会这两种拳脚技能的其中之一|你现在已经准备好特殊技能了)",'','beiok')
         create_trigger_t('check_bei2',"^(> )*你现在没有激发任何有效特殊技能。",'','beinone')
         SetTriggerOption("check_bei1","group","check_bei")
	     SetTriggerOption("check_bei2","group","check_bei")
	     EnableTriggerGroup("check_bei",true)
		 EnableTrigger("hp12",true)
         beihook=func         
         if not p_cmd then
	       ---exe('bei bei bei')
		   exe('bei cuff')
	     end
	 return bei_timer()
end
function bei_timer()
       return create_timer_s('bei',0.4,'bei_timer_set')
end
function bei_timer_set()
    --EnableTriggerGroup("check_bei",true)
   --exe('bei bei bei')
   exe('bei cuff')
end
function beinone()
   for p,q in pairs(skillEnable) do
       if skills[p] and q~="force" then
          exe('jifa '..q..' '..p)
		  if math.random(1,3)==1 then
		     break
		  end
	   end
   end
end 
function beiok()
     EnableTriggerGroup("check_bei",false)
	 EnableTrigger("hp12",false)
	 --DeleteTimer('bei')
	 --DeleteTriggerGroup("check_bei")
	 EnableTimer('bei',false)
	 if beihook==nil then
	    beihook=test
	 end
         return beihook()
end
function check_halt(func)
         disWait()
         DeleteTriggerGroup("check_halt")
         create_trigger_t('check_halt1',"^>*\\s*(你现在不忙。|你身形向后一跃，跳出战圈不打了。)",'','haltok')
         create_trigger_t('check_halt2',"^>*\\s*你现在很忙，停不下来。",'','halterror')
         SetTriggerOption("check_halt1","group","check_halt")
         SetTriggerOption("check_halt2","group","check_halt")
		 EnableTriggerGroup("check_halt",true)
		 EnableTrigger("hp12",true)
         halthook=func         
         exe('halt')
	     return halt_timer()
end
function halterror()
haltbusy=haltbusy+1
   if haltbusy>30 then
haltbusy=0
	locate()
   end
	if locl.room=="洗象池边" then
	 EnableTimer('halt',false)
    wait.make(function() 
       wait.time(5)
	   haltok()
    end)
	end
end
function halt_timer()
       return create_timer_s('halt',0.4,'halt_timer_set')
end
function halt_timer_set()
    --EnableTriggerGroup("check_halt",true)
   exe('halt')
end
function haltok()
haltbusy=0
     EnableTriggerGroup("check_halt",false)
	 EnableTrigger("hp12",false)
	 --DeleteTimer('halt')
	 EnableTimer('halt',false)
	 --DeleteTriggerGroup("check_halt")
	 if halthook==nil then
	    halthook=test
	 end
         return halthook()
end
busyhook=test
function check_bei(func,p_cmd)
         disWait()
         DeleteTriggerGroup("check_busy")
         create_trigger_t('check_busy1',"^>*\\s*没有这个技能种类，用",'','busyok')
         SetTriggerOption("check_busy1","group","check_busy")
		 EnableTriggerGroup("check_busy",true)
		 EnableTrigger("hp12",true)
         busyhook=func
	 if not p_cmd then
            exe('jifa jifa jifa')
	 end
	 jifa_timer()
end
function jifa_timer()
       return create_timer_s('jifa',0.4,'jifa_timer_set')
end
function jifa_timer_set()
    --EnableTriggerGroup("check_busy",true)	
    exe('jifa jifa jifa')
end
function busyok()
     EnableTriggerGroup("check_busy",false)		
     EnableTrigger("hp12",false)	 
	 --DeleteTimer('jifa')
	 EnableTimer('jifa',false)
	 if busyhook==nil then
	    busyhook=test
	 end
     return busyhook()
end

waithook=test
function checkWait(func,sec)
   disWait()
   DeleteTriggerGroup("checkwait")
   create_trigger_t('checkwait1','^(> )*你把 "action" 设定为 "等待一下" 成功完成。$','','checkWaitOk')
   SetTriggerOption("checkwait1","group","checkwait")
   EnableTriggerGroup("checkwait",true)
   EnableTrigger("hp12",true)
   waithook=func
   if sec == nil then sec=5 end
      return create_timer_s('waitimer',sec,'wait_timer_set')
end
function wait_timer_set()
   --EnableTriggerGroup("checkwait",true)
   exe('alias action 等待一下')
end
function checkWaitOk()
   EnableTriggerGroup("checkwait",false)
   EnableTrigger("hp12",false)
   --DeleteTimer('waitimer
   EnableTimer('waitimer',false)
   if waithook==nil then
      waithook=test
   end
   return waithook()
end

nexthook = test
function checkNext(func)
   disWait()
   DeleteTriggerGroup("checknext")
   create_trigger_t('checknext1','^(> )*你把 "action" 设定为 "继续前进" 成功完成。$','','checkNextOk')
   SetTriggerOption("checknext1","group","checknext")
   EnableTriggerGroup("checknext",true)
   EnableTrigger("hp12",true)
   nexthook=func
   next_timer_set()
   return create_timer_s('nextimer',0.5,'next_timer_set')
end
function next_timer_set()
   exe('alias action 继续前进')
end
function checkNextOk()
   EnableTriggerGroup("checknext",false)
   EnableTrigger("hp12",false)
   EnableTimer('nextimer',false)
   if nexthook==nil then
      nexthook=test
   end
   return nexthook()
end

function disWait()
    DeleteTriggerGroup("checkwait")
    DeleteTriggerGroup("check_bei")
    DeleteTriggerGroup("check_busy")
    DeleteTriggerGroup("check_halt")
    EnableTimer('waitimer',false)
    EnableTimer('jifa',false)
    EnableTimer('halt',false)
    EnableTimer('bei',false)
end
function resetWait()
	local t = GetTimerList()
	if t and type(t)=="table" then
	   for k, v in pairs (GetTimerList()) do 
	       --messageShow(v)
           if IsTimer(v)==0 and GetTimerInfo(v, 6) and tonumber(GetTimerInfo(v, 3))<tonumber(GetTimerInfo(v, 13)) then 
              messageShow(v..' '..'设定时间:'..GetTimerInfo(v, 3)..'秒，下一次时间:'..GetTimerInfo(v, 13)..'秒。')
	          ResetTimers()
			   break
           end
       end
	end
end

function trans(num)
        if not num then
                return 0
        end
        local _, _, wan, other = string.find(num, "^(.-)万(.*)$")
        local result = 0
        if wan then
                result = result + trans0(wan) * 10000
                num = other
        end
        result = result + trans0(num)
        return result
end

function trans0(num)
        num = string.gsub(num,"^十(.*)$","一十%1")
        num = string.gsub(num,"零十","一十")
        num = string.gsub(num,"零","")
        local result = 0
        local numbers = {"一","二","三","四","五","六","七","八","九"}
        for k,v in pairs(numbers) do
                num = string.gsub(num,v,k)
        end
        local units = {["0|"] = "十", ["00|"] = "百", ["000|"] = "千"}
        for k,v in pairs(units) do
                num = string.gsub(num,v,k)
        end
        for v in string.gmatch(num,"(%d+)") do
                result = result + v
        end
        return result
end
function idle()
    hp.expBak = hp.expBak or -1
    if hp.exp and hp.exp~=hp.expBak then
       hp.expBak = hp.exp
	   cntrI = countR(20)
	--else
	   --if cntrI()<1 then
	      --cntrI = countR(20)
	      --flag.idle = 100
	      --return idle_set()
	   --end
	end
    flag.idle=0
    return create_timer_s('idle',30,'idle_set')
end
function idle_set()
  if job.name=='dalaohu' then return exe('praise dalaohu') end
	if job.name=='songmoya' then
	print('正在颂摩崖任务中，当前死亡次数【'.. smydie ..'】次！设定杀死武士组数上限为【'.. smyteam ..'】组。进行组数为第【'.. yptteam ..'】组。')
	exe('flatter')
	return
	end
	if job.name=='husong' then
	exe('aq')
	print('正在护送任务中')
	return
	end
	if job.name=='refine' then
	exe('admire2')
	print('正在提练矿石中')
	return
	end
	
	if (job.name=='wudang' or job.name=='huashan' or job.name=='xueshan') and locl.room=='城中心' and locl.area=='伊犁城' and locl.room_relation=='客栈铁铺↖｜商铺----城中心----巴依家院城中心' then 
	    exe('papaya')
	    print('被困在伊犁城....')
	    return
	end
	
	
	--print(flag.idle)
	exe('cs')
   if not flag.idle or type(flag.idle)~="number" then
      flag.idle = 0
   end
   flag.idle = flag.idle + 1
   if flag.idle>2 and flag.idle<4 then
   DeleteTimer("walkWait10")
   DeleteTimer("walkWait9")
   if job.name=='dolost' then return lookXin() end 
   end
   if flag.idle>8 and flag.idle<12 then
        DeleteTimer("walkWait10")
        DeleteTimer("walkWait9")
		
          if dest.area==nil then return end
      if dest.area=='铁掌山' or dest.area=='达摩院后殿' then 
             locate()
                 if locl.room ~= job.room then
                    return walk_wait()
                 else
                        if job.name=='wudang' then return wudangFindAct() end
                        if job.name=='huashan' then return huashanFindAct() end
                        if job.name=='xueshan' then return xueshan_find_act() end
                        if job.name=='songxin' or job.name=='songxin2' then return songxin_find_go() end
                 end
      end
      return
   end
   local test_flag = tonumber(GetVariable('test_flag'))
   if test_flag==1 then print('test_flag..'..test_flag) end
   if flag.idle<12 or test_flag==1 then
      chats_log("ROBOT 可能已发呆".. flag.idle/2 .."分钟!","deepskyblue")
	  return
   end
   locate_flag=1
   scrLog()
   dis_all()
   inwdj=0
   chats_locate('定位系统：发呆8分钟后，于【'.. locl.area .. locl.room ..'】重新启动系统！','red')
   Disconnect()
   Connect()
   --SetEchoInput(true)
end

function test_switch()
    local test_flag = tonumber(GetVariable('test_flag'))
	if test_flag==0 then 
	    SetVariable('test_flag',1)
		Note('测试模式打开......................打开')
	else
	    SetVariable('test_flag',0)
		Note('测试模式关闭......................关闭')
	end
end

function checkWield()
   itemWield = {}
   exe('i')
end
function checkWieldCatch(n,l,w)
   itemWield = itemWield or {}
   local l_item = w[1]
   for p in pairs(weaponThrowing) do
       if string.find(l_item,p) then
	      l_item = p
	   end
   end
   itemWield[l_item] = true
end
function show_beinang()
   DeleteTriggerGroup("beinang")
   create_trigger_t('beinang1','^(> )*(\\D*)\\(','','checkbeinang')
   SetTriggerOption("beinang1","group","beinang")
   EnableTriggerGroup("beinang",true)
   Beinang={}
end
function checkbeinang(n,l,w)
  table.insert(Beinang, Trim(w[2]))
end
function checkYaoBags(func)
   DeleteTriggerGroup("Yaobags")
   create_trigger_t('Yaobags1','^(> )*(\\D*)(锭|两|张)(白银|黄金|壹仟两银票)\\(','','checkBagsMoney')
   create_trigger_t('Yaobags2','^(> )*你把 "action" 设定为 "检查药品" 成功完成。$','','checkYaoBagsOver')
   create_trigger_t('Yaobags3','^(> )*(\\D*)封失落的信笺','','checkBagsletter')
   SetTriggerOption("Yaobags1","group","Yaobags")
   SetTriggerOption("Yaobags2","group","Yaobags")
   SetTriggerOption("Yaobags3","group","Yaobags")
   EnableTriggerGroup("Yaobags",true)
   cty_cur=0
   nxw_cur=0
   cbw_cur=0
   hqd_cur=0
   hxd_cur=0
   --print(cty_cur,nxw_cur,hxd_cur)
   Bag["黄金"].cnt=0
   Bag["白银"].cnt=0
   tmp.yaobags=func
   exe('i;look bei nang')
   exe('alias action 检查药品')
   create_timer_s('checkYaoBags_timer',1.0,'checkYaoBags_test')
   
end
function checkYaoBags_test()
   exe('alias action 检查药品')
end 

function checkYaoBagsOver()
   DeleteTimer('checkYaoBags_timer')
   checkBY()
   draw_beinangwindow()
   EnableTriggerGroup("Yaobags",false)
   DeleteTriggerGroup("Yaobags")
   EnableTriggerGroup("beinang",false)
   DeleteTriggerGroup("beinang")
   --print(cty_cur,nxw_cur,hxd_cur)
   if tmp.yaobags~=nil then
      return tmp.yaobags()
   end
end

function checkBY()
  print('checkBY.....................................')
  if not Beinang then Beinang={"空"} end
  for i = 1,#Beinang do
	    if Beinang[i] == "" or Beinang[i] == nil then
	        Beinang[i] = "数据丢失" 
	    end
	    local l_name = Beinang[i]
        if string.find(l_name,"蝉蜕金疮药") then
	       cty_cur = trans(Beinang[i])
	       print('ctw....count..................................'..cty_cur)
	    end
        if string.find(l_name,"内息丸") then
            nxw_cur = trans(Beinang[i])
        end
        if string.find(l_name,"川贝内息丸") then
            cbw_cur = trans(Beinang[i])
        end
        if string.find(l_name,"黄芪内息丹") then
            hqd_cur = trans(Beinang[i])
        end
	    if string.find(l_name,"活血疗精丹") then
	       hxd_cur = trans(Beinang[i])
	    end
	    if string.find(l_name,"大还丹") then
	       dhd_cur = trans(Beinang[i])
	    end
	    if string.find(l_name,"铁矿石") then
	       print('tks...'..Beinang[i])
	       kuang_cur = trans(Beinang[i])
	    end
	--print(cty_cur,nxw_cur,hxd_cur,dhd_cur)
	end
end

function checkBags(func)
   DeleteTriggerGroup("bags")
   --create_trigger_t('bags1',"^(> )*你身上携带物品的别称如下",'','checkBagsStart')
   create_trigger_t('bags2',"^\\d*:(\\D*) = (\\D*)$",'','checkBagsId')
   --create_trigger_t('bags3','^(> )*你目前已经拥有了(\\D*)件私有装备：(\\D*)。$','','checkBagsU')
   create_trigger_t('bags4','^(> )*(\\D*)(锭|两|张)(白银|黄金|壹仟两银票)\\(','','checkBagsMoney')
   --create_trigger_t('bags5','^(> )*你把 "action" 设定为 "检查包裹" 成功完成。$','','checkBagsOver')
   create_trigger_t('bags6','^(> )*(\\D*)封失落的信笺','','checkBagsletter')
   create_trigger_t('bags7','^(> )*(\\D*)枚飞镖\\(','','checkBagsDart')
   create_trigger_t('bags8','^(> )*你身上带着(\\D*)件东西\\(负重\\s*(\\d*)\\.\\d*\\%\\)：','','checkBagsW')
   create_trigger_t('bags9','^(> )*(\\D*)个锦盒\\(','','checkBagsJh')
   create_trigger_t('bags10','^(> )*(\\D*)把(龙泉|莫邪|干将|鱼肠)剑\\((\\D*)\\s*jian\\)','','checkBagsShenQi')
   
    create_trigger_t('bags11','^(> )*(\\D*)颗石子\\(Shizi\\)','','checkBagsShizi')
   
   --SetTriggerOption("bags1","group","bags")
   SetTriggerOption("bags2","group","bags")
   --SetTriggerOption("bags3","group","bags")
   SetTriggerOption("bags4","group","bags")
   --SetTriggerOption("bags5","group","bags")
   SetTriggerOption("bags6","group","bags")
   SetTriggerOption("bags7","group","bags")
   SetTriggerOption("bags8","group","bags")
   SetTriggerOption("bags9","group","bags")
   SetTriggerOption("bags10","group","bags")
   SetTriggerOption("bags11","group","bags")
   EnableTriggerGroup("bags",true)
   --pumkmai修改
   ---EnableTrigger("bags1",true)
   
   --print(cty_cur,nxw_cur,hxd_cur)
   wait.make(function()
      while true do 
	     cty_cur=0
         nxw_cur=0
         cbw_cur=0
         hqd_cur=0
         hxd_cur=0
         shenqi_id=nil
	  
	     bags={}
         Bag={}
         Bag["黄金"]={}
         Bag["黄金"].id={}
         Bag["黄金"].cnt=0
         Bag["白银"]={}
         Bag["白银"].id={}
         Bag["白银"].cnt=0
         Bag["枚飞镖"]={}
         Bag["枚飞镖"].id={}
         Bag["枚飞镖"].cnt=0
         Bag["锦盒"]={}
         Bag["锦盒"].id={}
         Bag["锦盒"].cnt=0
         Bag["壹仟两银票"]={}
         Bag["壹仟两银票"].id={}
         Bag["壹仟两银票"].cnt=0
         tmp.bags=func
         weaponUsave={}
  
        exe('id')
        checkWield()
        exe('look bei nang')
        exe('uweapon')
        local l, w = wait.regexp('^(> )*你目前已经拥有了(\\D*)件私有装备：(\\D*)。$',1)	
        if l~= nil then
            print('check uweapon....')
            local t = Trim(w[3])
            local s = utils.split(t,',')
            for p,q in pairs(s) do
	           if string.find(q,'⊕') then 
                 q = string.sub(q,3,-1)
               end   
               weaponUsave[q] = true
            end
            break			
        end 		
	    wait.time(1)
	  end
	  return checkBagsOver()
   end)
  
end
function checkBagsletter()
   lostletter=1
end
---function checkBagsStart()
   --EnableTriggerGroup("bags",true)
--end
function checkBagsId(n,l,w)
             local l_name=Trim(w[1])
             local l_id=w[2]
             local l_set={}
             local l_cnt=0
             if not Bag[l_name] then
                    Bag[l_name]={}
             end
             Bag[l_name].id={}
			 ---pumkmai,, 注释，获取真正的 id
             if string.find(l_id,",") then
                    l_set=utils.split(l_id,',')
                    l_id=l_set[1]
                    for k,v in ipairs(l_set) do
					---print('k,v.....'..k..v)
					-- 1 chantui yao
					-- 2 yao
					-- 3 chantui 
                            --table.insert(Bag[l_name].id,1,Trim(v))
                            Bag[l_name].id[Trim(v)]=true
                            if string.len(Trim(v))>l_cnt then
							    -- id 和 full_id 是不同的 ,full_id 是最长的id
                                   Bag[l_name].fullid=Trim(v)
                                   l_cnt=string.len(Trim(v))
                            end
                    end
             else
                    Bag[l_name].id[Trim(l_id)]=true
                    --table.insert(Bag[l_name].id,1,Trim(l_id))
                    Bag[l_name].fullid=Trim(l_id)
             end
         if Bag[l_name].id["armor"] then
                    Bag[l_name].kind = "armor"
             end                 
             if Bag[l_name].id["dao"] or Bag[l_name].id["blade"] then
                    Bag[l_name].kind = "blade"
             end
             if Bag[l_name].id["jian"] or Bag[l_name].id["sword"] then
                    Bag[l_name].kind = "sword"
             end
             if Bag[l_name].id["xiao"] then
                    Bag[l_name].kind = "xiao"
             end
             if Bag[l_name].id["gun"] or Bag[l_name].id["club"] then
                    Bag[l_name].kind = "club"
             end
             if Bag[l_name].id["stick"] or Bag[l_name].id["zhubang"] or Bag[l_name].id["bang"] then
                    Bag[l_name].kind = "stick"
             end
             if Bag[l_name].id["bi"] or Bag[l_name].id["brush"] then
                    Bag[l_name].kind = "brush"
             end
             if Bag[l_name].id["qiang"] or Bag[l_name].id["spear"] then
                    Bag[l_name].kind = "spear"
             end
             if Bag[l_name].id["chui"] or Bag[l_name].id["hammer"] then
                    Bag[l_name].kind = "hammer"
             end
             if Bag[l_name].id["gangzhang"] or Bag[l_name].id["staff"] or Bag[l_name].id["zhang"] or Bag[l_name].id["jiang"] then
                    Bag[l_name].kind = "staff"
             end
             if Bag[l_name].id["bian"] or Bag[l_name].id["whip"] then
                    Bag[l_name].kind = "whip"
             end
             if Bag[l_name].id["hook"] then
                    Bag[l_name].kind = "hook"
             end
             if Bag[l_name].id["fu"] or Bag[l_name].id["axe"] then
                    Bag[l_name].kind = "axe"
             end
             if Bag[l_name].id["bishou"] or Bag[l_name].id["dagger"] then
                    Bag[l_name].kind = "dagger"
             end
             if weaponThrowing[l_name] then
                    Bag[l_name].kind = "throwing"
             end           
             if (string.find(l_name,"残篇") or string.find(l_name,"精要")) and not itemSave[l_name] then
                    exe('read book')
                    exe('drop '..Bag[l_name].fullid)
             end
             if string.len(l_name)==6 and (string.sub(l_name,5,6)=="药" or string.sub(l_name,5,6)=="丸" or string.sub(l_name,5,6)=="丹") and (not drugPoison[l_name] and not drugBuy[l_name]) then
                    exe('eat '.. Bag[l_name].fullid)
             end
             bags[l_name] = Trim(l_id)
             if Bag[l_name].cnt then
			        --print('l_name,cnt'..l_name..','..Bag[l_name].cnt)
                    Bag[l_name].cnt = Bag[l_name].cnt + 1
             else
                    Bag[l_name].cnt = 1
             end
end
function checkBagsU(n,l,w)
   print('checkBagsU....')
   local t = Trim(w[3])
   local s = utils.split(t,',')
   for p,q in pairs(s) do
       ---print('武器test...........'..p..','..q)
	   if string.find(q,'⊕') then 
          q = string.sub(q,3,-1)
       end   
       weaponUsave[q] = true
   end
    
   exe('alias action 检查包裹')
   create_timer_s('checkBagsU_timer',1.0,'checkBagsU_test')
   
end

function checkBagsU_test()
    print('checkBagsU_test.............')
     exe('alias action 检查包裹')
end


function checkBagsMoney(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[4])
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end

function checkBagsShenQi(n,l,w)
   print('checkBagsShenQi...............'..w[4])
   local id = string.lower((tostring(w[4])))  
   print('shenqi_id='..id)
   shenqi_id=string.gsub(id,'%s+','')
   shenqi_id=shenqi_id .. ' jian'
   SetVariable('shenqi_id',shenqi_id)
end

function checkBagsW(n,l,w)
   local t = tonumber(w[3])
   Bag = Bag or {}
   Bag["ENCB"] = {}
   Bag["ENCB"].value = t
end
function checkBagsDart(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name='枚飞镖'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end

function checkBagsShizi(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name='石子'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end

function checkBagsJh(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name='锦盒'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end
--[[function checkBagsYao(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[3])
  if string.find(l_name,"蝉蜕金疮药") then
	   cty_cur = l_cnt
	end
	if string.find(l_name,"川贝内息丸") then
	   nxw_cur = l_cnt
	end
	if string.find(l_name,"活血疗精丹") then
	   hxd_cur = l_cnt
	end
	if string.find(l_name,"大还丹") then
	   dhd_cur = l_cnt
	end
end]]
function checkBagsOver()
   print('checkBagsOver.....................')
   DeleteTimer('checkBagsU_timer')
   draw_bagwindow()
   checkBY()
   draw_beinangwindow()
   EnableTriggerGroup("bags",false)
   DeleteTriggerGroup("bags")
   EnableTriggerGroup("beinang",false)
   DeleteTriggerGroup("beinang")
   if Bag["大碗茶"] then
      exe("drop cha")
   end
   if Bag["棉花种子"] then
      exe('drop '.. Bag["棉花种子"].fullid)
   end
   if Bag["棉花"] then
      exe('drop '.. Bag["棉花"].fullid)
   end   
   if Bag["青铜"] then
      exe('drop '.. Bag["青铜"].fullid)
   end
   if Bag["生铁"] then
      exe('drop '.. Bag["生铁"].fullid)
   end
   if Bag["粗绳子"] and Bag["粗绳子"].cnt>2 then
      exe('drop cu shengzi 2')
    end
	if Bag["木剑"] and Bag["木剑"].cnt>2 then
      exe('drop mu jian 1')
    end
   
   --print(cty_cur,nxw_cur,hxd_cur)
   if tmp.bags~=nil then
      if type(tmp.bags) == 'function' then 
          return tmp.bags()
	  else
	      wait.make(function()
		      wait.time(0.2)
		      coroutine.resume(tmp.bags)
		  end)
	  end
   end
end

function isInBags(p_item)
   if p_item==nil then return false end
   local l_cnt = 0
   local l_item
   if Bag[p_item] then
      l_item = p_item
	  l_cnt = l_cnt + Bag[p_item].cnt
      --return p_item,Bag[p_item].cnt
   end
   for k,v in pairs(Bag) do
       if type(v.id)=="table" then
          if v.id[p_item] then
			 l_item = k
			 l_cnt = l_cnt + Bag[k].cnt
          end
       end
   end
   if l_cnt>0 then
      return l_item,l_cnt
   end
   return false
end

function check_item()
   if score.party and score.party=="峨嵋派" and not Bag["腰带"] then
      return check_item_go()
   elseif score.party=="少林派" and not Bag["护腰"] and not Bag["护腕"] then
      return go(checkSengxie,'嵩山少林','防具库') 
   else
      return check_item_over()
   end
end
function checkSengxie()
   exe('ask chanshi about 僧鞋')
   return check_bei(checkHuyao)
end
function checkHuyao()
   exe('ask chanshi about 护腰')
   return check_bei(checkHuwan)
end
function checkHuwan()
   exe('ask chanshi about 护腕')
   return check_bei(check_item_over)
end
function check_item_go()
   go(check_item_belt,'峨嵋山','储物间')
end
function check_item_belt()
   exe('ask shitai about 皮腰带')
   check_bei(check_item_over)
end
function check_item_over()
   exe('drop shoes 2')
   exe('remove all')
   exe('wear all')

   flag.item=true
   
   return checkPrepare()
end
function VIPask()
   exe('ask laoban about 会员基金')
   check_bei(VIPask2)
end
function VIPask2()
   exe('ask laoban about 会员福利')
   check_bei(Ebookcheck)
end
function Ebookcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id Ebookcheck
    create_trigger_t('vipchk1',"^(> )*您是本站终身会员，本次购物免费。",'','vipEbookck')
    create_trigger_t('vipchk2',"^(> )*本周你已无法使用精英之书。",'','Yjwcheck')
    SetTriggerOption("vipchk1","group","vipchk")
    SetTriggerOption("vipchk2","group","vipchk")
    if score.id and score.id=='dalaohu' and dalaohuvip==0 then
       return exe('duihuan ebook')
    else
       return Gstart()
    end
end
function vipEbookck()
   check_halt(vipEbook)
end
function vipEbook()
   exe('duihuan ebook')
end
function Yjwcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id Yjwcheck
    create_trigger_t('vipchk1',"^(> )*您是本站终身会员，本次购物免费。",'','vipYjwck')
    create_trigger_t('vipchk2',"^(> )*本周你已无法使用玉肌丸。",'','Ygcheck')
    SetTriggerOption("vipchk1","group","vipchk")
    SetTriggerOption("vipchk2","group","vipchk")
    if score.id and score.id=='pumkmai111' and pumkmaivip==1 then
       return check_halt(vipYjw)
    else
       return Gstart()
    end
end
function vipYjwck()
   check_halt(vipYjw)
end
function vipYjw()
   exe('duihuan yuji wan')
end
function Ygcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id Yjwcheck
    create_trigger_t('vipchk1',"^(> )*您是本站终身会员，本次购物免费。",'','vipYggo')
    create_trigger_t('vipchk2',"^(> )*本周你已无法使用鸳鸯锦帕。",'','Gstart')
    create_trigger_t('vipchk3',"^(> )*你给瑛姑一方鸳鸯锦帕",'','vipYgok')
    SetTriggerOption("vipchk1","group","vipchk")
    SetTriggerOption("vipchk2","group","vipchk")
    SetTriggerOption("vipchk3","group","vipchk")
    if score.id and score.id=='pumkmai111' and pumkmaivip==1 then
       return check_halt(vipYg)
    else
       return Gstart()
    end
end
function vipYggo()
  return go(vipGhyg,'大理城','茶馆')
end
function vipGhyg()
  exe('guihuan ying gu')
end
function vipYgok()
  return go(vipYg,'扬州城','当铺')
end
function vipYg()
   exe('duihuan jinpa')
end
function Vipcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id vipcheck
    create_trigger_t('vipchk1',"^(> )*您是本站终身会员，本次购物免费。",'','vipxidu')
    create_trigger_t('vipchk2',"^(> )*你的朱睛冰蟾已经用完了。",'','vipxidu_over')
    create_trigger_t('vipchk3',"^(> )*本周你已无法使用",'','vipover')
    create_trigger_t('vipchk4',"^(> )*你先要用完现有的物品才能再次兑换。",'','vipxidu')
    SetTriggerOption("vipchk1","group","vipchk")
    SetTriggerOption("vipchk2","group","vipchk")
    SetTriggerOption("vipchk3","group","vipchk")
    SetTriggerOption("vipchk4","group","vipchk")
    --if vippoison==1 and dalaohuvip==1 then
       --return exe('duihuan bingchan')
    --else
       return check_xue()
    --end
end
function vipxidu()
    return check_busy(xidu)
end
function xidu()
    exe('xidu')
end
function vipxidu_over()
   EnableTriggerGroup("vipchk",false)
   DeleteTriggerGroup("vipchk")
   vippoison=0
   return check_halt(vipdhd)
end
function vipdhd()
    DeleteTriggerGroup("vipdhd")
-- ain dls nv id vipcheck
    create_trigger_t('vipdhd1',"^(> )*您是本站终身会员，本次购物免费。",'','vipeatdhd')
    create_trigger_t('vipdhd2',"^(> )*你的大还丹已经用完了。",'','vipdhd_over')
    create_trigger_t('vipdhd3',"^(> )*本周你已无法使用",'','vipover')
    create_trigger_t('vipdhd4',"^(> )*你先要用完现有的物品才能再次兑换。",'','vipeatdhd')
    create_trigger_t('vipdhd5',"^(> )*看清楚点，这东西能吃吗？",'','vipdhd_over')
    SetTriggerOption("vipdhd1","group","vipdhd")
    SetTriggerOption("vipdhd2","group","vipdhd")
    SetTriggerOption("vipdhd3","group","vipdhd")
    SetTriggerOption("vipdhd4","group","vipdhd")
    SetTriggerOption("vipdhd5","group","vipdhd")
    exe('duihuan dahuan dan')
end
function vipeatdhd()
    return check_busy(eatdhd)
end
function eatdhd()
    exe('eat dan')
end
function vipdhd_over()
   EnableTriggerGroup("vipdhd",false)
   DeleteTriggerGroup("vipdhd")
    return check_halt(checkPrepare)
end
function vipover()
   EnableTriggerGroup("vipchk",false)
   DeleteTriggerGroup("vipchk")
   EnableTriggerGroup("vipdhd",false)
   DeleteTriggerGroup("vipdhd")
    pumkmaivip=0
    inwdj=0
       return check_xue()
end
function checkvip()
   if score.id and score.id=='pumkmai' and pumkmaivip==1 then
      exe('cond')
      return go(Vipcheck,'扬州城','当铺')
   else
      return check_xue()
   end
end
function check_heal()
   print('check_heal........................')
   collectgarbage("collect")
   dis_all()
   tmp={}
   jobTriggerDel()  
   job.name='heal'
   exe('nick 赶路中')
   if score.party and score.party=="神龙教" then
      exe('yun shougong '.. score.id)
   end
   if score.party and score.party=="天龙寺" then
      exe('yun liao dalaohu')
   end
   if perform.force and skills[perform.force] then
	   exe('jifa force '.. perform.force)
   end
   button_smyteam()
   button_lostletter()
   check_halt(check_jingxue_count)
end
function check_jingxue_count()
   print('check_jingxue_count....................')
      checkBags()
   if hp.exp<150000 then
      return checkWait(check_heal_over,1)
   elseif (hp.exp>150000 and hp.exp<800000) then
      --return checkWait(check_heal_newbie,1)
      return go(check_heal_newbie,"扬州城","药铺")
   elseif hp.jingxue_per<96 or hp.qixue_per<88 then
      return checkWait(checkvip,1)
   else
      return checkWait(check_jingxue,1)
   end
end
function check_jingxue()
   print('check_jingxue......................')
      if (hp.qixue_per<98 and hp.qixue_per>88) and cty_cur>0 then
	     exe('eat chantui yao;hp')
	     return check_busy(check_jingxue,1)
	  else
	    print('check_jingxue....cty_cur.....'..cty_cur)
	     if cty_cur==0 then
                return checkHxd()
	     end
	     -- ain
	     if score.party=="大轮寺" and hp.neili>2000 then
	        exe('yun juxue')
	     end   
	     return check_halt(check_heal_over,1)
      end
end
function check_heal_newbie()
     if hp.qixue_per<100 then
	     exe('buy jinchuang yao;eat jinchuang yao;hp')
	     return check_busy(check_heal_newbie,3)
	  else
	     if hp.jingxue_per<100 then
	        exe('buy yangjing dan;eat yangjing dan')
	     end
	     return check_halt(check_heal_over,1)
      end
end
function check_heal_over()
    print('check_heal_over.................')
    DeleteTriggerGroup("ck_xue_ask")
    DeleteTriggerGroup("ck_xue_accept")
    DeleteTriggerGroup("ck_xue_teach")
    return check_halt(checkPrepare)
end
function check_xue()
   EnableTrigger("hp19",false)
   tmp.xueSkills={}
   tmp.xueCount=1
   tmp.xueTimes=0
   for p in pairs(skills) do
       if skills[p].lvl > 100 then
          table.insert(tmp.xueSkills,p)
       end
   end
   if hp.exp>500000 then
      return go(check_xue_ask,'柳宗镇','正厅')
   else
      return check_xue_fail()
   end 
end
function check_xue_ask()
   DeleteTriggerGroup("ck_xue_ask")
   create_trigger_t('ck_xue_ask1','^(> )*你向薛慕华打听有关『疗伤』的消息。$','','check_xue_accept')
   create_trigger_t('ck_xue_ask2','^(> )*这里没有这个人','','check_xue_fail')
   SetTriggerOption("ck_xue_ask1","group","ck_xue_ask")
   SetTriggerOption("ck_xue_ask2","group","ck_xue_ask")
   DeleteTriggerGroup("ck_xue_accept")
   create_trigger_t('ck_xue_accept1','^(> )*薛慕华「嘿嘿嘿」奸笑了几声。$','','check_xue_teach')
   create_trigger_t('ck_xue_accept2','^(> )*一柱香的工夫过去了，你觉得伤势已经基本痊愈了。','','check_xue_heal')
   create_trigger_t('ck_xue_accept3','^(> )*薛神医拿出一根银针轻轻捻入你受伤部位附近的穴道','','check_xue_wait')
   create_trigger_t('ck_xue_accept4','^(> )*薛慕华似乎不懂你的意思。$','','check_xue_heal')
   create_trigger_t('ck_xue_accept5','^(> )*薛慕华「啪」的一声倒在地上，挣扎着抽动了几下就死了','','check_xue_fail')
   SetTriggerOption("ck_xue_accept1","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept2","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept3","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept4","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept5","group","ck_xue_accept")
   EnableTriggerGroup("ck_xue_accept",false)
   DeleteTriggerGroup("ck_xue_teach")
   create_trigger_t('ck_xue_teach1','^(> )*薛神医的这个技能已经不能再进步了。$','','check_xue_next')
   SetTriggerOption("ck_xue_teach1","group","ck_xue_teach")
   EnableTriggerGroup("ck_xue_teach",false)
   DeleteTriggerGroup("ck_xue_busy")
   create_trigger_t('ck_xue_busy1','^(> )*您先歇口气再说话吧。$','','check_xue_busy')
   SetTriggerOption("ck_xue_busy1","group","ck_xue_busy")
   EnableTriggerGroup("ck_xue_busy",true)
   wait.make(function()
       wait.time(1)
	    exe('ask xue muhua about 疗伤')
   end)
  
end
function check_xue_busy()
      return check_busy(check_xue_ok,2)
end
function check_xue_ok()
   EnableTriggerGroup("ck_xue_accept",true)
   exe('ask xue muhua about 疗伤')
end
function check_xue_fail()
   EnableTriggerGroup("ck_xue_ask",false)
   EnableTriggerGroup("ck_xue_accept",false)
   EnableTriggerGroup("ck_xue_teach",false)
   return check_jingxue()
end
function check_xue_accept()
   EnableTriggerGroup("ck_xue_ask",false)
   EnableTriggerGroup("ck_xue_accept",true)
end
function check_xue_wait()
   EnableTrigger("ck_xue_accept1",false)
   EnableTrigger("ck_xue_accept3",false)
   EnableTrigger("ck_xue_accept4",false)
end
function check_xue_teach()
   EnableTrigger("ck_xue_accept1",false)
   EnableTriggerGroup("ck_xue_accept",false)
   EnableTriggerGroup("ck_xue_teach",true)
   if tmpxueskill then
     for i=1,10 do
       exe('teach xue '.. tmpxueskill)
     end
   else
     for i=1,10 do
       exe('teach xue '.. tmp.xueSkills[tmp.xueCount])
     end
   end
       wait.make(function() 
       wait.time(0.5)
   return check_busy(check_xue_ok)
    end)
end
function check_xue_next()
   EnableTriggerGroup("ck_xue_teach",false)
   if tmpxueskill then
      tmpxueskill = nil
      tmp.xueCount = 0
   end
   tmp.xueCount = tmp.xueCount + 1
   if tmp.xueCount>table.getn(tmp.xueSkills) then
         return check_jingxue()
   else
      return checkWait(check_xue_teach,0.2)
   end
end
function check_xue_heal()
   EnableTriggerGroup("ck_xue_accept",false)
   DeleteTriggerGroup("ck_xue_ask")
   DeleteTriggerGroup("ck_xue_accept")
   DeleteTriggerGroup("ck_xue_teach")
   DeleteTriggerGroup("ck_xue_busy")
   return check_bei(check_poison)
end
function check_poison()
   prepare_neili_stop()
   poison_dazuo()
   condition={}
   exe('cond')
   return check_busy(preparePoison)
end
function preparePoison()
   EnableTrigger("hp19",true)
   if (not condition.poison or condition.poison == 0) then
      return check_halt(check_heal_over)
   end
   return dazuoPoison()
end
function dazuoPoison()
   condition.poison=0
   exe('set 积蓄;hp;yun qi;yun jing;yun jingli;cond')
   exe('dazuo '..hp.dazuo)
end
function poison_dazuo()
    DeleteTriggerGroup("poison")
    create_trigger_t('poison1',"^(> )*(过了片刻，你感觉自己已经将玄天无极神功|你将寒冰真气按周天之势搬运了一周|你只觉真力运转顺畅，周身气力充沛|你将纯阳神通功运行完毕|你只觉神元归一，全身精力弥漫|你将内息走了个一个周天|你将内息游走全身，但觉全身舒畅|你将真气逼入体内，将全身聚集的蓝色气息|你将紫气在体内运行了一个周天|你运功完毕，站了起来|你一个周天行将下来，精神抖擞的站了起来|你分开双手，黑气慢慢沉下|你将内息走满一个周天，只感到全身通泰|你真气在体内运行了一个周天，冷热真气收于丹田|你真气在体内运行了一个周天，缓缓收气于丹田|你双眼微闭，缓缓将天地精华之气吸入体内|你慢慢收气，归入丹田，睁开眼睛|你将内息又运了一个小周天，缓缓导入丹田|你感觉毒素越转越快，就快要脱离你的控制了！|你将周身内息贯通经脉，缓缓睁开眼睛，站了起来|你呼翕九阳，抱一含元，缓缓睁开双眼|你吸气入丹田，真气运转渐缓，慢慢收功|你将真气在体内沿脉络运行了一圈，缓缓纳入丹田|你将内息在体内运行十二周天，返回丹田|你将内息走了个小周天，流回丹田，收功站了起来|过了片刻，你已与这大自然融合在一起，精神抖擞的站了起|你感到自己和天地融为一体，全身清爽如浴春风，忍不住舒畅的呻吟了一声，缓缓睁开了眼睛)",'','poisondazuo_desc')
    create_trigger_t('poison2',"^(> )*你现在精不够，无法控制内息的流动！",'','checkDebug')
    SetTriggerOption("poison1","group","poison")
    SetTriggerOption("poison2","group","poison")
    EnableTriggerGroup("poison",true)
end
function poisondazuo_desc()
   if condition.poison and condition.poison==0 then
      EnableTriggerGroup("poison",false)
      DeleteTriggerGroup("poison")
      exe('yun jing;yun qi;yun jingli')
      return check_bei(check_food)
   end
   return poisonLianxi()
end
function poisonLianxi()
     print('poisonLianxi.......')
	 pfm_xiangyun = GetVariable('pfm_xiangyun')
     if score.xiangyun~='死' then 
	    exe('sxlian')
	  end 
    wait.make(function() 
       wait.time(2)
   return check_busy(preparePoison)
    end)
end

function Ronglian()
    dis_all()
    job.name="refine"
  return go(Brefine,'扬州城','兵器铺')
end
function Brefine()
        kuangshi="tiekuang shi"
    DeleteTriggerGroup("refine")
    create_trigger_t('refine1',"^(> )*你没有足够的铁矿石。",'','refineGold')
        create_trigger_t('refine2',"^(> )*你没有足够的金矿石。",'','refineOK')
    SetTriggerOption("refine1","group","refine")
        SetTriggerOption("refine2","group","refine")
    EnableTriggerGroup("refine",true)
    create_timer_s('refine',2,'refine')
end
function refine()
   exe('refine 2000 '..kuangshi)
   exe('l bei nang')
end
function refineGold()
   kuangshi="jinkuang shi"
end
function refineOK()
   DeleteTriggerGroup("refine")
   dis_all()
   return check_heal()
end

function check_food()
    EnableTimer('walkWait4',false)
    exe('hp;cha')
    set_sxlian()
	if score.gender=='无1' then --厂公专用，封闭房间
		map.rooms["city/mingyufang"].ways["north"]=nil
		map.rooms["changan/eastjie1"].ways["north"]=nil
	end
	map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8"
	if score.party=='华山派'and hp.shen<0 then 
	   map.rooms["huashan/houtang"].ways["north"]=nil
     map.rooms["huashan/qianting"].ways["south"]=nil
  end
  if score.party=='姑苏慕容' then 
    map.rooms["mtl/anbian1"].ways["qu xiaozhu;#CboatWait"]=nil
    map.rooms["mtl/anbian1"].ways["qu yanziwu;#CboatWait"]=nil
    map.rooms["mr/testmatou1"].ways["qu yanziwu;#boatWait"]=nil
    map.rooms["mr/testmatou1"].ways["qu mr;#boatWait"]=nil
    map.rooms["mr/tingyuju"].ways["tan qin;#boatWait"]=nil
    map.rooms["mr/xiaodao"].ways["#boatYell"]=nil
    map.rooms["yanziwu/anbian3"].ways["#boatYell"]=nil
    map.rooms["yanziwu/anbian4"].ways["#boatYell"]=nil
  if skills["douzhuan-xingyi"]~=nil then
	    if not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl>130 and skills["douzhuan-xingyi"].lvl<170 then	dzxy_level=1 end
	    if not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl>170 and skills["douzhuan-xingyi"].lvl<200 then	dzxy_level=2 end
	    if not skills["douzhuan-xingyi"] and skills["douzhuan-xingyi"].lvl>200 and skills["douzhuan-xingyi"].lvl<hp.pot_max-100 then dzxy_level=3 end
	end
	end
	 beiUnarmed()
   dis_all()
   hpheqi()
	  if mydummy==true then
      return dummyfind()
    end
    --if job.zuhe["wudang"] then wait_kill='yes' end
   exe('nick 去武当吃喝;remove all;wear all')
exe('hp;unset no_kill_ap;yield no')
  if (hp.food<60 or hp.water<60) and hp.exp<500000 then
      return go(dali_eat,'大理城','茶馆')
   elseif hp.food<60 or hp.water<60 then
      return go(wudang_eat,'武当山','茶亭')
   else
      check_bei(check_food_over)
   end
end
function wudang_eat()
   if locl.room=="茶亭" then
   flag.food=0
   DeleteTimer("food")
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao;fill jiudai')
   check_bei(check_food_over)
    else
       return go(wudang_eat,'武当山','茶亭')
    end
end
function wudang_chifan()
go(wudang_bc,'武当山','茶亭')
end
function wudang_bc()
exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao;fill jiudai')
return check_halt(check_jobx)
end
function check_food_over()
   print('check_food_over....................')
   print('kuang_cur...'..kuang_cur)
   if kuang_cur and kuang_cur>200000 then return Ronglian() end
      return check_heal()
end

function dali_eat()
   if locl.room=="茶馆" then
   flag.food=0
   DeleteTimer("food")
   exe('#5(drink);e;e;s;buy baozi;#2(eat baozi)')
   check_bei(check_food_over)
    else
       return go(dali_eat,'大理城','茶馆')
    end
end


function check_pot_test()
  print('check_pot_test...........')
  
      local test_lingwu=0
      local test_xuexi=0
      if hp.pot < 200 then return 0 end   
      if score.gold and skills["literate"] and score.gold>3000 and skills["literate"].lvl<hp.pot_max-100 then
          test_xuexi=1
	      return test_xuexi
      end
      if skills["parry"] and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl>=450 then
          test_lingwu=1
	      return test_lingwu
      end 
      return 0

end


function check_hp_test(thread)
    wait.make(function()
	    EnableTriggerGroup('hp',true)
		exe('hp')
		if thread~=nil then
		    coroutine.resume(thread)
        end		
	end)
end

function check_pot(func)
  print('check_pot..................................................................')
  if hp.exp<5000000 then
    l_pot=hp.pot_max-100
  else
    --- 这里可以考虑优化为 1/5
    --l_pot=hp.pot_max-600
	l_pot=math.ceil(hp.pot_max/5)
  end
  flag.lingwu=0
  local l_skill
  if perform.skill then
      l_skill=skillEnable[perform.skill]
  end
   
  job_exp_tongji()

  for p in pairs(skillEnable) do
      if skills[p] then
         q=skillEnable[p]
         -- ain 提前领悟
	     if q and skills[q] and q~="force" and (skills[q].lvl>219 or (score.party=="普通百姓" and skills[q].lvl>100)) and skills[q].lvl<hp.pot_max-100 and skills[q].lvl<=skills[p].lvl and hp.pot>=l_pot then
		    print('lingwu set 11111')
			print(q)
			print(p)
	        flag.lingwu=1
	     end
      end
   end
   if GetVariable("lingwuskill") or (tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]]) then
      flag.lingwu = 0
	   
	  if tmp.xskill and skills[tmp.xskill] and skillEnable[tmp.xskill] and skills[skillEnable[tmp.xskill]] then
	     local p = tmp.xskill
		 local q = skillEnable[p]
	     if skills[q].lvl<hp.pot_max-100 and skills[q].lvl<=skills[p].lvl and skills[q].lvl<hp.pot_max-100 then
		   print('lingwu set 2222222')
		   print(p..' '..q)
		    flag.lingwu=1
		 end
      end 
	  if GetVariable("lingwuskill") then
		 local q = GetVariable("lingwuskill")
		 for p in pairs(skills) do
	        if skillEnable[p]==q and skills[q].lvl<hp.pot_max-100 and skills[q].lvl<=skills[p].lvl and skills[q].lvl<hp.pot_max-100 then
			   print('lingwu set 33333333')
			   print(p)
		       flag.lingwu=1
		    end 
		 end
	  end
	end
   --[[if score.party=="普通百姓" and hp.pot>=l_pot and score.gold and skills["literate"] and score.gold>3000 and skills["literate"].lvl<hp.pot_max-100 then
      return literate()
   end
      if score.party=="普通百姓" and hp.pot>=l_pot and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl>=101 then
         flag.lingwu=1
      end
    if score.party=="普通百姓" and flag.lingwu==1 then return checklingwu() end
      ]]--
   --[[ if score.party=="普通百姓" and skills["force"].lvl>50 then
		if skills["force"].lvl<101 then
		       return huxi()
			end
	    if score.party=="普通百姓" and skills["force"].lvl==101 then
               exe('fangqi force 1;y;y;y')			
		       return huxi()
			end
        if score.party=="普通百姓" and skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl<200 then
		    return learnSzj()
		 end
	end]]--
    
	local literate_toggle = tonumber(GetVariable('literate_toggle'))
   if score.party~="普通百姓" and hp.pot>=l_pot and flag.autoxuexi and flag.autoxuexi==1 and literate_toggle==1 then
      if score.gold and skills["literate"] and score.gold>3000 and skills["literate"].lvl<hp.pot_max-100 then
         return literate() 
      end

	  if score.party~="普通百姓" then
      for p in pairs(skills) do
          local q=qrySkillEnable(p)
	      if q and q['force'] and perform.force and p==perform.force and skills[p].lvl<100 and hp.pot>=l_pot then
	         if skills[p].mstlvl and skills[p].mstlvl<=skills[p].lvl then
		     else
	            return checkxue(func)
		     end
	      end
      end

      for p in pairs(skills) do
          if flagFull[p] and not skillEnable[p] and skills[p].lvl<450 and skills[p].lvl<=skills["dodge"].lvl and hp.pot>=l_pot then
	         if not skills[p].mstlvl or skills[p].mstlvl>skills[p].lvl then
	            return checkxue(func)
	         end
	      end
      end

   if score.party~="普通百姓" and perform.skill and skills[perform.skill] and skills[perform.skill].lvl<450 and hp.pot>=l_pot then
      return checkxue(func)
   end

      if flag.type and flag.type~='lingwu' and flag.xuexi==1 and hp.pot>=l_pot then
         return checkxue(func)
      end
	  end
      --if hp.pot>=l_pot and skills["parry"] and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl>=450 then
	   if skills["parry"] and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl>=450 then
         flag.lingwu=1
      end
      if flag.lingwu==1 then
         return checklingwu(func)
      end

	  
      if flag.xuexi==1 and score.party~="普通百姓" then
         return checkxue(func)
      end
   
   --[[if hp.pot>=l_pot then
	  if skills["wuxiang-zhi"] then
	     if not flag.wxjz then flag.wxjz=0 end
		 if flag.wxjz==0 and skills["finger"].lvl>skills["wuxiang-zhi"].lvl and skills["wuxiang-zhi"].lvl<hp.pot_max-100 then
		    return wxjzFofa()
		 end
	  end
      end]]--
   end
   
   
   wait.make(function()
       wait.time(0.1)
       if func ~= nil then 
           print('check pot resum .....')
           return func()
       else 
          return check_job()
       end 
   end)
   
   
end

function checkHammer()
    return go(checkHmGive,"扬州城","兵器铺")
end
function checkHmGive()
    if Bag["韦兰之锤"] then
	   exe('give '.. Bag["韦兰之锤"].fullid ..' to zhujian shi')
	end
	Bag["韦兰之锤"] = nil
	return checkPrepare()
end

function check_gold()
   tmp.cnt=0
   return go(check_gold_dali,"大理城","大理钱庄")
end
function check_gold_dali()
    print('check_gold_dali.....')
    if not locl.id["严掌柜"] then
	   return go(check_gold_xy,"襄阳城","宝龙斋")
	else
	   return check_gold_count()
	end
end
function check_gold_xy()
    if not locl.id["钱善人"] then
	   return go(check_gold_cd,"成都城","墨玉斋")
	else
	   return check_gold_count()
	end
end
--function check_gold_cd()
--    if not locl.id["王掌柜"] then
--	   return go(check_gold_yz,"扬州城","天阁斋")
--	else
--	   return check_gold_count()
--	end
--end
-- ain
function check_gold_cd()
    if not locl.id["钱缝"] then
	   return go(check_gold_dali,"大理城","大理钱庄")
	else
	   return checkWait(check_gold_count,1)
	end
end
function check_gold_count()
   if Bag['壹仟两银票'] and Bag['壹仟两银票'].cnt>10 then  
      exe('score;chazhang')
      if score.goldlmt and score.gold and (score.goldlmt-score.gold)>50 then
         --return check_cash_cun()
		 return checkWait(check_cash_cun,1)
	  end
   end
   if Bag and Bag["白银"] and Bag["白银"].cnt and Bag["白银"].cnt>500 then
      --return check_silver_qu()
	  return checkWait(check_silver_qu,1)
   end
   if (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt<count.gold_max and score.gold>count.gold_max) or (Bag and Bag["黄金"] and Bag["黄金"].cnt and Bag["黄金"].cnt>count.gold_max*4) then
      --return check_gold_qu()
	  return checkWait(check_gold_qu,1)
   end

   --return check_gold_over()
   return checkWait(check_gold_over,1)
end
function check_cash_cun()
   if Bag['壹仟两银票'] then
      local l_cnt
      if score.goldlmt and score.gold and (score.goldlmt-score.gold)<Bag['壹仟两银票'].cnt*10 then
	     l_cnt = math.modf((score.goldlmt-score.gold)/10) - 1
	  else
	     l_cnt = Bag['壹仟两银票'].cnt
	  end
	  if l_cnt > 0 then
         exe('cun '.. l_cnt ..' cash')
	  end
   end
   checkBags()
   return checkWait(check_gold_check,3)
end
function check_silver_qu()
   local l_cnt=Bag["白银"].cnt-100
   exe('cun '.. l_cnt ..' silver')
   exe('qu 50 silver')
   checkBags()
   return checkWait(check_gold_check,3)
end
function check_gold_qu()
   local l_cnt=Bag["黄金"].cnt-count.gold_max*2
   if l_cnt>0 then
        exe('cun '.. l_cnt ..' gold')
    end
   if Bag["黄金"].cnt<count.gold_max then
      exe('qu '.. count.gold_max ..' gold')
   end
     return checkBags(check_gold_check)
end
function check_gold_check()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return check_heal()
   end
   return check_gold_count()
end
function check_gold_over()
   return checkPrepare()
end

function checkZqd()
   tmp.cnt=0
   return go(checkZqdBuy,randomElement(drugBuy["正气丹"]))
end
function checkZqdBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkZqdOver()
   else
      exe('buy zhengqi dan')
      checkBags()
      return check_bei(checkZqdi)
   end
end
function checkZqdi()
   if Bag["黄金"] and Bag["黄金"].cnt>4 and (not Bag["正气丹"] or Bag["正气丹"].cnt<4) then
      return checkWait(checkZqdBuy,1)
   else
      return checkZqdOver()
   end
end
function checkZqdOver()
   checkBags()
   return check_bei(checkPrepare,1)
end

function checkXqw()
   tmp.cnt=0
   return go(checkXqwBuy,randomElement(drugBuy["邪气丸"]))
end
function checkXqwBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkXqwOver()
   else
      exe('buy xieqi wan')
      checkBags()
      return check_bei(checkXqwi)
   end
end
function checkXqwi()
   if Bag["黄金"] and Bag["黄金"].cnt>4 and (not Bag["邪气丸"] or Bag["邪气丸"].cnt<4) then
      return checkWait(checkXqwBuy,1)
   else
      return checkXqwOver()
   end
end
function checkXqwOver()
   checkBags()
   return check_bei(checkPrepare,1)
end

function checkNxw()
   print('checkNxw..................')
   tmp.cnt=0
   print(' score.gold...'..score.gold..';'..nxw_cur..';'..count.nxw_max)
   if score.gold and score.gold>100 and (nxw_cur<count.nxw_max or cbw_cur<count.cbw_max or hqd_cur<count.hqd_max) then
      print('checkNxw..................111111')
      return go(checkNxwBuy,randomElement(drugBuy["内息丸"]))
   else
      print('checkNxw..................22222')
      return checkNxwOver()
   end
end
function checkNxwBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkNxwOver()
   else
   if hqd_cur<count.hqd_max then
      exe('buy '..drug.neili3)
          end
   if cbw_cur<count.cbw_max then
         exe('buy '..drug.neili2)
          end
          if nxw_cur<count.nxw_max then
         exe('buy '..drug.neili)
          end
      checkYaoBags()
      return check_bei(checkNxwi)
   end
end
function checkNxwi()
   if (nxw_cur<count.nxw_max or cbw_cur<count.cbw_max or hqd_cur<count.hqd_max) and Bag["黄金"] and Bag["黄金"].cnt>4 then
      return checkWait(checkNxwBuy,1)
   else
      return checkNxwOver()
   end
end
function checkNxwOver()
   return check_bei(checkPrepare,1)
end

function checkHxd()
   print('checkHxd..................'..cty_cur..','..count.cty_max)
   tmp.cnt=0
   if score.gold and score.gold>100 and cty_cur<count.cty_max then
      return go(checkHxdBuy,randomElement(drugBuy["蝉蜕金疮药"]))
   else
      return checkNxwOver()
   end
end
function checkHxdBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkNxwOver()
   else
      exe('buy '..drug.heal)
      checkYaoBags()
      return check_bei(checkHxdBag)
   end
end
function checkHxdBag()
   if cty_cur<count.cty_max and Bag["黄金"] and Bag["黄金"].cnt>4 then
      return checkWait(checkHxdBuy,1)
   else
      return checkNxwOver()
   end
end

function checkLjd()
   tmp.cnt=0
   if score.gold and score.gold>100 and hxd_cur<count.hxd_max then
      return go(checkLjdBuy,randomElement(drugBuy["活血疗精丹"]))
   else
      return checkNxwOver()
   end
end
function checkLjdBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkNxwOver()
   else
      exe('buy '..drug.jingxue)
      checkYaoBags()
      return check_bei(checkLjdBag)
   end
end
function checkLjdBag()
   if hxd_cur<count.hxd_max and Bag["黄金"] and Bag["黄金"].cnt>4 then
      return checkWait(checkLjdBuy,1)
   else
      return checkNxwOver()
   end
end
function checkdhd()
   tmp.cnt=0
   if score.tb and score.tb>100 and dhd_cur<count.dhd_max then
      return go(checkdhdBuy,randomElement(drugBuy["大还丹"]))
   else
      return checkNxwOver()
   end
end
function checkdhdBuy()
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 30 then
      return checkNxwOver()
   else
      exe('duihuan dahuan dan;score')
      checkYaoBags()
      return check_halt(checkdhdBag)
   end
end
function checkdhdBag()
   if dhd_cur<count.dhd_max and score.tb and score.tb>100 then
      return checkWait(checkdhdBuy,1)
   else
      return checkNxwOver()
   end
end

-------------- 取火折 -------------------------------------

function checkFireNew()
    if not Bag["火折"] then 
	    return go(checkFireQu,'扬州城','杂货铺')
	else 
	    return checkFireQuSuccess()
	end 
end

function checkFireQu()
    DeleteTriggerGroup("qu_fire")
    create_trigger_t('qu_fire1','^(> )*你并没有保存该物品。$','','checkFireQuFail')
	create_trigger_t('qu_fire2','^(> )*你把火折从个人储物箱中提取出来。$','','checkFireQuSuccess')
    SetTriggerOption("qu_fire1","group","qu_fire")
	SetTriggerOption("qu_fire2","group","qu_fire")
    wait.make(function()
	    wait_busy()
		exe('qu fire')
	end)
end  

function checkFireQuFail()
    EnableTriggerGroup('qu_fire',false)
	wait.make(function()
	    wait_busy()
	    return checkFire()
	end)
end 

function checkFireQuSuccess()
    EnableTriggerGroup('qu_fire',false)
	wait.make(function()
	    wait_busy()
		exe('cun fire 2')
		wait_busy()
	    --return checkPrepareOver()
		return checkBags(checkPrepare)
	end)
end

-------------- 取火折 END -------------------------------------



-------------- 取金钗 -------------------------------------

function checkJinChai()
    if not Bag["金钗"] then 
	    return go(checkJinChaiQu,'扬州城','杂货铺')
	else 
	    return checkJinChaiQuSuccess()
	end 
end

function checkJinChaiQu()
    DeleteTriggerGroup("qu_jinchai")
    create_trigger_t('qu_jinchai1','^(> )*你并没有保存该物品。$','','checkJinChaiQuFail')
	create_trigger_t('qu_jinchai2','^(> )*你把金钗从个人储物箱中提取出来。$','','checkJinChaiQuSuccess')
    SetTriggerOption("qu_jinchai1","group","qu_jinchai")
	SetTriggerOption("qu_jinchai2","group","qu_jinchai")
    wait.make(function()
	    wait_busy()
		exe('qu jin chai')
	end)
end  

function checkJinChaiQuFail()
    EnableTriggerGroup('qu_jinchai',false)
	wait.make(function()
	    wait_busy()
	    return killrfy()
	end)
end 

function checkJinChaiQuSuccess()
    EnableTriggerGroup('qu_jinchai',false)
	wait.make(function()
	    wait_busy()
	    ---return checkPrepareOver()
		return checkBags(checkPrepare)
	end)
end

-------------- 取金钗 END -------------------------------------




-------------- 取牛皮酒袋 -------------------------------------

function checkJiuDai()
    if not Bag["牛皮酒袋"] then 
	    return go(checkJiuDaiQu,'扬州城','杂货铺')
	else 
	    return checkJiuDaiQuSuccess()
	end 
end

function checkJiuDaiQu()
    DeleteTriggerGroup("qu_jinchai")
    create_trigger_t('qu_jinchai1','^(> )*你并没有保存该物品。$','','checkJiuDaiQuFail')
	create_trigger_t('qu_jinchai2','^(> )*你把金钗从个人储物箱中提取出来。$','','checkJiuDaiQuSuccess')
    SetTriggerOption("qu_jinchai1","group","qu_jinchai")
	SetTriggerOption("qu_jinchai2","group","qu_jinchai")
    wait.make(function()
	    wait_busy()
		exe('qu jin chai')
	end)
end  

function checkJiuDaiQuFail()
    EnableTriggerGroup('qu_jinchai',false)
	wait.make(function()
	    wait_busy()
	    return killrfy()
	end)
end 

function checkJiuDaiQuSuccess()
    EnableTriggerGroup('qu_jinchai',false)
	wait.make(function()
	    wait_busy()
	    return checkPrepareOver()
	end)
end

-------------- 取牛皮酒袋 END -------------------------------------






-------------- 取绳子 -------------------------------------

function checkShengzi()
    if not Bag["绳子"] then 
	    return go(checkShengziQu,'扬州城','杂货铺')
	
	elseif Bag["绳子"].cnt > 1 then 
	    return go(cunShengzi,'扬州城','杂货铺')
		
	else 
	    return checkShengziQuSuccess()
	end 
end

function cunShengzi()
    print('cunShengzi.......')
    DeleteTriggerGroup("cu_shengzi")
    create_trigger_t('cu_shengzi1','^(> )*·你的个人储物箱保存有(\\D*)件物品','','currentCwxCount')
	create_trigger_t('cu_shengzi2','^(> )*·你的个人储物箱一共可以保存\\((\\D*)件物品','','currentCwxTotalCount')
    SetTriggerOption("cu_shengzi1","group","cu_shengzi")
	SetTriggerOption("cu_shengzi2","group","cu_shengzi")
	current_cwx_count=0
	current_cwx_total_count=0
	wait.make(function()
	    wait_busy()
		--exe('qu sheng zi')
		while true do
		    exe('dlist')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			if l~=nil then break end 
		end
	end)
end

function currentCwxCount(n,l,w)
    print('currentCwxCount.......')
    current_cwx_count=trans(w[2])
	print('current_cwx_count:'..current_cwx_count)
end

function currentCwxTotalCount(n,l,w)
    print('currentCwxTotalCount.......'..w[1]..';'..w[2])
    current_cwx_total_count=trans(w[2])
	print('current_cwx_total_count:'..current_cwx_total_count)
	
	local current_left = current_cwx_total_count - current_cwx_count
	local shengzi_count = Bag["绳子"].cnt - 1
	
	if Bag["绳子"] ~= nil and shengzi_count>0 and current_left>=1  then 
	    wait.make(function()
		    wait_busy()
			local t = coroutine.running()
			cunSomeThing('sheng zi', (current_left > shengzi_count and shengzi_count) or current_left, t)
		    coroutine.yield()
            wait_busy()
	        return checkPrepareOver()			
		end)
	end
	
end


function checkShengziQu()
    DeleteTriggerGroup("qu_shengzi")
    create_trigger_t('qu_shengzi1','^(> )*你并没有保存该物品。$','','checkShengziQuFail')
	create_trigger_t('qu_shengzi2','^(> )*你把绳子从个人储物箱中提取出来。$','','checkShengziQuSuccess')
    SetTriggerOption("qu_shengzi1","group","qu_shengzi")
	SetTriggerOption("qu_shengzi2","group","qu_shengzi")
    wait.make(function()
	    wait_busy()
		--exe('qu sheng zi')
		while true do
		    exe('qu sheng zi')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			if l~=nil then break end 
		end
	end)
end  

function checkShengziQuFail()
    EnableTriggerGroup('qu_shengzi',false)
	wait.make(function()
	    wait_busy()
	    return go(checkShengziGet,'华山','寝室')
	end)
end 

function checkShengziQuSuccess()
    EnableTriggerGroup('qu_shengzi',false)
	wait.make(function()
	    --wait_busy()
		--exe('drop fire 2')
		wait_busy()
	    return checkPrepareOver()
	end)
end


function checkShengziGet()
    wait.make(function()
	    wait.time(1)
	    wait_busy()
		exe('get sheng zi')
		wait_busy()
        return checkPrepareOver()		
	end)
end

-------------- 取绳子 END -------------------------------------





function checkFire()
   if not Bag["火折"] then
      return go(checkFireBuy,randomElement(drugBuy["火折"]))
   else
      return checkFireOver()
   end
end
function checkFireBuy()
   exe('buy fire')
   checkBags()
   return checkFireOver()
end
function checknpjd()
   if not Bag["牛皮酒袋"] then
      return go(checknpjdBuy,randomElement(drugBuy["牛皮酒袋"]))
   else
      return checknpjdOver()
   end
end
function checknpjdBuy()
   exe('buy jiudai')
   checkBags()
   return checknpjdOver()
end
function checkFireOver()
   exe('drop fire 2')
   return check_busy(checkPrepare,1)
end
function checknpjdOver()
   return check_busy(checkPrepare,1)
end
 

 
function checkYu(p_yu)
    tmp.yu = p_yu
	return go(checkYuCun,"扬州城","杂货铺")
end
function checkYuCun()
    exe('cun '.. Bag[tmp.yu].fullid)
	return check_bei(checkYuOver)
end
function checkYuOver()
    exe('cun yu;drop yu')
	checkBags()
    return check_busy(checkPrepare,1)
end

function checkSell(p_sell)
    tmp.sell = p_sell
	return go(checkSellDo,"扬州城","当铺")
end
function checkSellDo()
    if Bag[tmp.sell] then
       exe('sell '.. Bag[tmp.sell].fullid)
	end 
	return check_bei(checkSellOver)
end
function checkSellOver()
    if Bag[tmp.sell] then
       exe('sell '.. Bag[tmp.sell].fullid)
       exe('drop '.. Bag[tmp.sell].fullid)
	end
	checkBags()
    return check_busy(checkPrepare,1)
end

function checkWeapon(p_weapon)
   print('checkWeapon.............')
   tmp.cnt = 0
   tmp.weapon = p_weapon
   return go(checkWeaponBuy,weaponStore[p_weapon],'')
end
function checkWeaponBuy()
   print('checkWeaponBuy..........')
   tmp.cnt = tmp.cnt + 1
   if tmp.cnt > 10 then
      ---checkBags()
      ---return check_heal()
	  return checkPrepare()
   end
   
   if tmp.weapon and weaponStoreId[tmp.weapon] then
        wait.make(function()
		    exe('list;buy '.. weaponStoreId[tmp.weapon])
			local self = coroutine.running()
		    local async_continue = function()       
                 print("async resume")
                 coroutine.resume(self)
            end
		    checkBags(async_continue)
		    coroutine.yield()
		    if not Bag[tmp.weapon] or (tmp.weapon=='石子' and Bag['石子'].cnt<500) then
			     return checkWeaponBuy()
		    else
			     return checkPrepare()
			end
		end)
	else
	     return checkPrepare()
	end
  
end
function checkWeaponI()
    if not Bag[tmp.weapon] then
       return checkWeaponBuy()
    else
       return checkWeaponOver()
    end
end
function checkWeaponOver()
    return checkPrepare()
end

function checkCodeError()
   return dis_all()
end

function checkRefresh()
   job.time["refresh"]=os.time()%900
end

function shujian_set()
   checkBags()
   exe('score;cha;hp')
   local l_result
   local l_tmp
   local t
      l_result=utils.inputbox ("你要学习的SKILLS(格式：force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)是?", "xuexiskill", GetVariable("xuexiskill"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("xuexiskill",l_result)
       Note ("学习设定完成")
        print(GetVariable("xuexiskill"))
 	   end
      l_result=utils.inputbox ("你要领悟的SKILLS(格式：force|dodge|sword|blade|parry)是?", "lingwuskills", GetVariable("lingwuskills"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("lingwuskills",l_result)
       Note ("领悟设定完成")
        print(GetVariable("lingwuskills"))
 	   end
      l_result=utils.inputbox ("你学习领悟时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	   end
   l_result=utils.inputbox ("你的英文ID是?", "ID", GetVariable("id"), "宋体" , "12")
   if l_result~=nil then
      SetVariable("id",l_result)
   else
      DeleteVariable("id")
   end
   l_result=utils.inputbox ("你的密码是?", "Passwd", GetVariable("passwd"), "宋体" , "12")
   if l_result~=nil then
      SetVariable("passwd",l_result)
   else
      DeleteVariable("passwd")
   end

   l_result=utils.msgbox ( "是否打开记录窗口?", "FlagLog", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      flag.log="yes"
   else
      flag.log="no"
   end
   SetVariable("flaglog",flag.log)
   
   l_result=utils.msgbox ( "是否自动学习及领悟", "XuexiLingwu", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      flag.autoxuexi=1
   else
      flag.autoxuexi=0
   end
   SetVariable("flagautoxuexi",flag.autoxuexi)

   
   -- masterSet()
   
   pfmSet()
	  
   weaponSet()

   myUweapon()

   jobSet()
   
   drugSet() 

   Save()
   
   ColourNote ("red","blue","请使用start命令启动机器人，stop命令停止机器人，iset设置机器人！")
end

function masterSet()
   local l_result,l_tmp,t
   if score.party~="普通百姓" then
      l_result=utils.inputbox ("你的师傅的简短ID是?", "MasterId", GetVariable("masterid"), "宋体" , "12")
      if not isNil(l_result) then
         SetVariable("masterid",l_result)
         master.id=l_result
      end
      if not score.master or not masterRoom[score.master] then
         l_result=utils.inputbox ("你的师傅的居住地是?", "MasterRoom", GetVariable("masterroom"), "宋体" , "12")
         if l_result~=nil then
            SetVariable("masterroom",l_result)
            master.room,master.area=getAddr(l_result)
         end
      end
   end
end

function pfmSet()
   local l_result,l_tmp,t
   
   t = {}
   for p in pairs(skills) do
       if skillEnable[p]=="force" then
	      t[p] = skills[p].name
	   end
   end
   if countTab(t)==1 then
      for p in pairs(t) do
	      perform.force = p
	  end
   elseif countTab(t)>1 then
      l_result=utils.listbox("你使用的特殊内功是","特殊内功",t,GetVariable("performforce"))
	  if isNil(l_result) then
	     perform.force = nil
		 DeleteVariable("performforce")
      else
	     perform.force = l_result
		 SetVariable("performforce",l_result)
      end	  
   else
      perform.force = nil
   end
   
   t = {}
   for p in pairs(skills) do
       if skillEnable[p] and skillEnable[p]~= "force" then
	      t[p] = skills[p].name
	   end
   end
   if countTab(t)>0 then
      l_result=utils.listbox ("你准备战斗使用的功夫是?", "performSkill", t,GetVariable("performskill"))
      if not isNil(l_result) then
         SetVariable("performskill",l_result)
         perform.skill=l_result
      else
         perform.skill = nil
	     SetVariable("performskill",l_result)
      end
   end
   l_result=utils.inputbox ("战斗默认准备PFM(格式：bei none;bei claw;jifa parry jiuyin-baiguzhua;perform sanjue)是?", "PerformPre", GetVariable("performpre"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("performpre",l_result)
      perform.pre=l_result
      l_pfm = perform.pre
      create_alias('pfmset','pfmset','alias pfmpfm '.. l_pfm)
      Note("默认PFM")
      --exe('pfmset')
	  Execute('pfmset')
   end
   l_result=utils.inputbox ("你的空手PFM(不使用武器的PFM)是?", "pfmks", GetVariable("pfmks"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pfmks",l_result)
      l_pfm=l_result
      create_alias('pfmks','pfmks','alias pfmpfm '.. l_pfm)
      Note("空手PFM")
      exe('pfmks')
   end
   l_result=utils.inputbox ("遇到慕容剑法用的PFM(使用不拿剑可以克制慕容的skills,慕容剑法的属性为：险)是?", "pfmmrjf", GetVariable("pfmmrjf"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pfmmrjf",l_result)
      l_pfm=l_result
      create_alias('pfmmrjf','pfmmrjf','alias pfmpfm '.. l_pfm)
      Note("不用剑的PFM")
      exe('pfmmrjf')
   end
   l_result=utils.inputbox ("遇到明教圣火令法PFM(使用拿武器克制明教的skills，圣火令法的属性为：奇)是?", "pfmshlf", GetVariable("pfmshlf"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pfmshlf",l_result)
      l_pfm=l_result
      create_alias('pfmshlf','pfmshlf','alias pfmpfm '.. l_pfm)
      Note("带兵器PFM")
      exe('pfmshlf')
   end
   l_result=utils.inputbox ("填写你的无属性PFM(使用无属性的skills，玄铁剑法改归属为空)是?", "pfmwu", GetVariable("pfmwu"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pfmwu",l_result)
      l_pfm=l_result
      create_alias('pfmwu','pfmwu','alias pfmpfm '.. l_pfm)
      Note("无属性PFM")
      exe('pfmwu')
   end
l_result=utils.inputbox ("填写你的空属性PFM(对付空属性的pfm，建议用无属性武功，或者自己的最常用武功)是?", "pkong", GetVariable("pkong"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pkong",l_result)
      l_pfm=l_result
      create_alias('pkong','pkong','alias pfmpfm '.. l_pfm)
      Note("空属性PFM")
      exe('pkong')
   end
l_result=utils.inputbox ("填写你的最大合气大招PFM(对付克制武功极偶尔无法识别的武功，使用耗合气最大的pfm)是?", "pfmsanqing", GetVariable("pfmsanqing"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pfmsanqing",l_result)
      l_pfm=l_result
      create_alias('pfmsanqing','pfmsanqing','alias pfmpfm '.. l_pfm)
      Note("终极大招")
      exe('pfmsanqing')
   end
   l_result=utils.inputbox ("填写你的正属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：险。属性克制数值为：正130 刚空120 快110 妙险无100】无正属性可按后面的数值高低来填入对你有对应属性的FPM！", "pzhen", GetVariable("pzhen"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pzhen",l_result)
      perform.zhen=l_result
      l_pfm = perform.zhen
      create_alias('pfmzhen','pfmzhen','alias pfmpfm '.. l_pfm)
      Note("正属性PFM")
      exe('pfmzhen')
   end
   l_result=utils.inputbox ("填写你的奇属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：妙。属性克制数值为：奇130 柔空120 慢110 无妙险100】无奇属性可按后面的数值高低来填入对你有对应属性的FPM！", "pqi", GetVariable("pqi"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pqi",l_result)
      perform.qi=l_result
      l_pfm = perform.qi
      create_alias('pfmqi','pfmqi','alias pfmpfm '.. l_pfm)
      Note("奇属性PFM")
      exe('pfmqi')
   end
   l_result=utils.inputbox ("填写你的刚属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：慢。属性克制数值为：刚130 正空120 险110 慢快无100】无刚属性可按后面的数值高低来填入对你有对应属性的FPM！", "pgang", GetVariable("pgang"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pgang",l_result)
      perform.gang=l_result
      l_pfm = perform.gang
      create_alias('pfmgang','pfmgang','alias pfmpfm '.. l_pfm)
      Note("刚属性PFM")
      exe('pfmgang')
   end
   l_result=utils.inputbox ("填写你的柔属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：快。属性克制数值为：柔130 奇空120 妙110 快慢无100】无柔属性可按后面的数值高低来填入对你有对应属性的FPM！", "prou", GetVariable("prou"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("prou",l_result)
      perform.rou=l_result
      l_pfm = perform.rou
      create_alias('pfmrou','pfmrou','alias pfmpfm '.. l_pfm)
      Note("柔属性PFM")
      exe('pfmrou')
   end
   l_result=utils.inputbox ("填写你的快属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：刚。属性克制数值为：快130 妙空120 奇110 无刚柔100】无快属性可按后面的数值高低来填入对你有对应属性的FPM！", "pkuai", GetVariable("pkuai"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pkuai",l_result)
      perform.kuai=l_result
      l_pfm = perform.kuai
      create_alias('pfmkuai','pfmkuai','alias pfmpfm '.. l_pfm)
      Note("快属性PFM")
      exe('pfmkuai')
   end
   l_result=utils.inputbox ("填写你的慢属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：柔。属性克制数值为：慢130 险空120 正110 无刚柔100】无慢属性可按后面的数值高低来填入对你有对应属性的FPM！", "pman", GetVariable("pman"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pman",l_result)
      perform.man=l_result
      l_pfm = perform.man
      create_alias('pfmman','pfmman','alias pfmpfm '.. l_pfm)
      Note("慢属性PFM")
      exe('pfmman')
   end
   l_result=utils.inputbox ("填写你的秒属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：正。属性克制数值为：妙130 快空120 刚110 无正奇100】无妙属性可按后面的数值高低来填入对你有对应属性的FPM！", "pmiao", GetVariable("pmiao"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pmiao",l_result)
      perform.miao=l_result
      l_pfm = perform.miao
      create_alias('pfmmiao','pfmmiao','alias pfmpfm '.. l_pfm)
      Note("妙属性PFM")
      exe('pfmmiao')
   end
   l_result=utils.inputbox ("填写你的险属性PFM(用verify 来查看你的pfm的属性再填写。格式：verify yunu-jianfa)是?         【被克制属性为：奇。属性克制数值为：险130 慢空120 柔110 无正奇100】无险属性可按后面的数值高低来填入对你有对应属性的FPM！", "pxian", GetVariable("pxian"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pxian",l_result)
      perform.xian=l_result
      l_pfm = perform.xian
      create_alias('pfmxian','pfmxian','alias pfmpfm '.. l_pfm)
      Note("险属性PFM")
      exe('pfmxian')
   end
      l_result=utils.inputbox ("你FPK的PFM(用verify 来查看你的pfm的属性再填写格式：verify yunu-jianfa)是?", "pkpfm", GetVariable("pkpfm"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pkpfm",l_result)
	   end
      l_result=utils.inputbox ("你练功的次数是? ", "mycishu", GetVariable("mycishu"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mycishu",l_result)
      lianxi_times = l_result
	   end
    Note("使用默认PFM")
    --exe('pfmset')
	 Execute('pfmset')
   end

function myUweapon()
      l_result=utils.inputbox ("你需要GET的第一把武器ID是?", "myweapon", GetVariable("myweapon"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("myweapon",l_result)
	   end
      l_result=utils.inputbox ("你需要GET的第二把武器ID是?", "muweapon", GetVariable("muweapon"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("muweapon",l_result)
	   end
end

function jobSet()
   local l_result,l_tmp,t
   
   t={
       ["wudang"]  ="武当宋远桥",
       ["huashan"] ="华山岳不群",
    ["gaibang"]    ="丐帮吴长老",
     ["songmoya"]    ="颂摩崖抗敌任务",
     ["zhuoshe"] ="丐帮捉蛇",
       ["songxin"] ="大理送信",
	   ["songxin2"]="大理送信2",
	   ["xueshan"]   ="雪山抢美女",
     ["sldsm"]   ="神龙岛师门",
     ["songshan"]="嵩山左冷禅",
  --   ["hubiao"]  ="福州护镖",
       ["tmonk"]   ="少林教和尚",
	   ["clb"]     ="长乐帮任务1",
	   ["husong"]  ="少林护送",
	   ["hqgzc"]  ="洪七公做菜",
   }
   
   t={}
   
   for p,q in pairs(job.list) do
       t[p] = q
   end
   
   if score.party~="丐帮" then t["zhuoshe"]=nil end
   if score.party~="神龙教" then t["sldsm"]=nil end
   if score.party~="少林派" or hp.exp>2000000 or hp.exp<300000 then t["tmonk"]=nil end
   if score.party~="少林派" or hp.exp<2000000 then t["husong"]=nil end
   if hp.exp<5000000 then t["songmoya"]=nil end
   if hp.shen<0 then t["gaibang"]=nil end
   if hp.shen<0 and score.party=="华山派" then t["huashan"]=nil end
   if hp.shen<0 then t["wudang"]=nil end
   if hp.shen>0 then t["songshan"]=nil end
   
   job.zuhe={}
   if GetVariable("jobzuhe") then
      tmp.job=utils.split(GetVariable("jobzuhe"),'_')
	  tmp.zuhe = {}
      for _,p in pairs(tmp.job) do
          tmp.zuhe[p]=true
      end
   end
   l_tmp=utils.multilistbox ("你的任务组合(请按CTRL多选)是?", "任务组合", t,tmp.zuhe)
   l_result=nil
   for p in pairs(l_tmp) do
       job.zuhe[p]=true
       if l_result then
          l_result = l_result .. '_' .. p
       else
          l_result = p
       end
   end
   if l_result~=nil then
      SetVariable("jobzuhe",l_result)
   end
   for p in pairs(t) do
       if not job.zuhe[p] then
	      t[p]=nil
	   end
   end
   job.first = nil
   job.second = nil
   t["husong"] = nil
   t["hubiao"] = nil
   if countTab(t)>2 then
      l_result=utils.listbox("你第一优先去的任务：","优先任务",t,GetVariable("jobfirst"))
      if l_result~=nil then
         SetVariable("jobfirst",l_result)
         job.first=l_result
		 t[job.first]=nil
      else
	     job.first = nil
         DeleteVariable("jobfirst")
      end
   end
   if countTab(t)>1 and job.first then
	  l_result=utils.listbox("你第二优先去的任务：","优先任务",t,GetVariable("jobsecond"))
      if l_result~=nil then
         SetVariable("jobsecond",l_result)
         job.second=l_result
      t[job.second]=nil
      else
	     job.second = nil
         DeleteVariable("jobsecond")
      end
   else
	  job.second = nil
      DeleteVariable("jobsecond")
   end
   if countTab(t)==1 and job.second then
	  l_result=utils.listbox("你第三个去的任务：","优先任务",t,GetVariable("jobthird"))
      if l_result~=nil then
         SetVariable("jobthird",l_result)
         job.third=l_result
      else
	     job.third = nil
         DeleteVariable("jobthird")
      end
   else
	  job.third = nil
      DeleteVariable("jobthird")
   end
   if not job.first then
      DeleteVariable("jobfirst")   
   end
   if not job.second then
      DeleteVariable("jobsecond")
   end
   if not job.third then
      DeleteVariable("jobthird")
   end

   if job.zuhe["songmoya"] then
      l_result=utils.inputbox ("设置一品堂任务杀到第几组?(默认为7组)使用默认组数请空白不要填写。", "ypttab", GetVariable("ypttab"), "宋体" , "12")
      if not isNil(l_result) then
         SetVariable("ypttab",l_result)
         smyteam=tonumber(l_result)
      else
         smyteam=16
      end
      l_result=utils.inputbox ("设置一品堂任务死亡几次不再上SMY!(默认为2次)使用默认组数请空白不要填写。", "yptdie", GetVariable("yptdie"), "宋体" , "12")
      if not isNil(l_result) then
         SetVariable("yptdie",l_result)
         smyall=tonumber(l_result)
      else
         smyall=2
      end
      l_result=utils.msgbox ( "设置一品堂任务是否开启双杀!(默认为no不开启)。", "双杀", "yesno", "?", 1 )
      if l_result and l_result=="yes" then
        double_kill=yes
      else
        double_kill=no
      end
      l_result=utils.inputbox ("设置一品堂任务前置BUFF!(Perform and Yun、没有请填写none)。", "pfbuff", GetVariable("pfbuff"), "宋体" , "12")
      if not isNil(l_result) then
      SetVariable("pfbuff",l_result)
      perform.buff=l_result
      l_pfm = perform.buff
      create_alias('pbuff','pbuff','alias pfmbuff '.. l_pfm)
      exe('pbuff')
      end
   end

   if job.zuhe["tdh"] then
      l_result=utils.inputbox ("天地会任务中间是否打座？(1为打座 0为不打座)", "tdhdazuo", GetVariable("tdhdazuo"), "宋体" , "12")
      if not isNil(l_result) then
         SetVariable("tdhdazuo",l_result)
         tdhdz=l_result
      else
         tdhdz=1
      end
   end
   
   if job.zuhe["hqgzc"] then
      l_result=utils.inputbox ("拿Pot还是Gold？(1为Pot 0为Gold)", "hqgzcjiangli", GetVariable("hqgzcjiangli"), "宋体" , "12")
      if not isNil(l_result) then
         SetVariable("hqgzcjiangli",l_result)
         hqgzcjl=l_result
      else
         hqgzcjl=1
      end
   end
   
   if job.zuhe["hubiao"] or job.zuhe["haizhan"] then
      if GetVariable("teamname") then
         l_result=utils.inputbox ("你组队护镖的队友(中文名称)是?", "TeamName", GetVariable("teamname"), "宋体" , "12")
      else
         l_result=utils.inputbox ("你组队护镖的队友(中文名称)是?", "TeamName", job.teamname, "宋体" , "12")
      end
      if not isNil(l_result) then
         SetVariable("teamname",l_result)
         job.teamname=l_result
      else
         DeleteVariable("teamname")
         job.teamname=nil
      end
      if GetVariable("teamlead") then
         l_result=utils.inputbox ("你组队护镖的队长(中文名称)是?", "TeamLead", GetVariable("teamlead"), "宋体" , "12")
      else
         l_result=utils.inputbox ("你组队护镖的队长(中文名称)是?", "TeamLead", job.teamlead, "宋体" , "12")
      end
      if not isNil(l_result) then
         SetVariable("teamlead",l_result)
         job.teamlead=l_result
      else
         DeleteVariable("teamlead")
         job.teamlead=nil
      end
   end
   
end

function drugSet() 
   drugPrepare={}
   local t={
   ["内息丸"] = "内息丸",
   ["川贝内息丸"] = "川贝内息丸",
   ["黄芪内息丹"] = "黄芪内息丹",
   ["蝉蜕金疮药"] = "蝉蜕金疮药",
   ["活血疗精丹"] = "活血疗精丹",
   ["大还丹"] = "大还丹",
   ["火折"] = "火折",
   ["牛皮酒袋"] = "牛皮酒袋",
   }
   if GetVariable("drugprepare") then
      tmp.drug = utils.split(GetVariable("drugprepare"),'|')
	  tmp.pre = {}
      for _,p in pairs(tmp.drug) do
          tmp.pre[p]=true
      end
    end
   local l_tmp=utils.multilistbox ("你任务前准备的物品(请按CTRL多选)是?", "物品组合", t,tmp.pre)
   local l_result=nil
   for p in pairs(l_tmp) do
       drugPrepare[p]=true
       if l_result then
          l_result = l_result .. '|' .. p
       else
          l_result = p
       end
   end
   if isNil(l_result) then
      DeleteVariable("drugprepare")
   else
      SetVariable("drugprepare",l_result)
   end
end

function getVariable()
   if GetVariable("flagautoxuexi") then
      flag.autoxuexi=GetVariable("flagautoxuexi")
	  if flag.autoxuexi=='1' or flag.autoxuexi=='0' then
	     flag.autoxuexi=tonumber(flag.autoxuexi)
	  end
   end
   if GetVariable("flaglog") then
      flag.log=GetVariable("flaglog")
   end
   
   if GetVariable("masterid") then
      master.id=GetVariable("masterid")
   end
   if GetVariable("masterroom") then
      master.room,master.area=getAddr(GetVariable("masterroom"))
   end
   if GetVariable("mastertimes") then
      master.times=GetVariable("mastertimes")
   end
   
   if GetVariable("performforce") then
      perform.force=GetVariable("performforce")
   end
   if GetVariable("performskill") then
      perform.skill=GetVariable("performskill")
   end
   if GetVariable("performpre") then
      perform.pre=GetVariable("performpre")
   end
   if GetVariable("performhuaxue") then
      perform.huaxue=GetVariable("performhuaxue")
   end
   if GetVariable("performxiqi") then
      perform.xiqi=GetVariable("performxiqi")
   end

   if GetVariable("jobzuhe") then
      tmp.job=utils.split(GetVariable("jobzuhe"),'_')
      for _,p in pairs(tmp.job) do
          job.zuhe[p]=true
      end
   end
   if GetVariable("jobfirst") then
      job.first=GetVariable("jobfirst")
	  if job.first=="songxin2" then job.first="songxin" end
   else
      job.first=nil
   end
   if GetVariable("jobsecond") then
      job.second=GetVariable("jobsecond")
	  if job.second=="songxin2" then job.second="songxin" end
   else
      job.second=nil
   end
   if GetVariable("jobthird") then
      job.third=GetVariable("jobthird")
	  if job.third=="songxin2" then job.third="songxin" end
   else
      job.third=nil
   end
   if GetVariable("flagtype") then
      flag.type=GetVariable("flagtype")
   end
   if GetVariable("gaibangcancel") then
      gaibangCancel=GetVariable("gaibangcancel")
   end
   if GetVariable("sldsmcancel") then
      sldsmCancel=GetVariable("sldsmcancel")
   end
   if GetVariable("teamname") then
      job.teamname=GetVariable("teamname")
   end
   if GetVariable("teamlead") then
      job.teamlead=GetVariable("teamlead")
   end
   
   drugGetVar()
   
   weaponGetVar()
end

function drugGetVar()
    drugPrepare={}
    if GetVariable("drugprepare") then
      tmp.drug = utils.split(GetVariable("drugprepare"),'|')
      for _,p in pairs(tmp.drug) do
          drugPrepare[p]=true
      end
    end
end
function setAlias()
    create_alias_s('stop','stop','disAll')
	create_alias_s('iset','iset','shujian_set') 
    create_alias_s('setstone','sst','stoneSet')
	create_alias_s('dst','dst','stoneGetVar')	
	create_alias_s('start','start','main')
	create_alias_s('pkset','pkset','setpk')
	create_alias_s('xxk','xxk','xxkFind')
	create_alias_s('pkstart','pks','pk_start')
	create_alias_s('qu_wd','qu_wd','goto_set.wd')
	create_alias_s('qu_sl','qu_sl','goto_set.sl')
	create_alias_s('qu_xy','qu_xy','goto_set.xy')
	create_alias_s('qu_xs','qu_xs','goto_set.xs')
	create_alias_s('qu_hs','qu_hs','goto_set.hs')
	create_alias_s('qu_yz','qu_yz','goto_set.yz')
	create_alias_s('qu_lzdk','qu_lzdk','goto_set.lzdk')
	create_alias_s('qu_thd','qu_thd','goto_set.thd')
	create_alias_s('qu_dl','qu_dl','goto_set.dl')
	create_alias_s('tj','tj','jobExpTongji')
	create_alias_s('setlian','setlian','setLian')
	create_alias_s('setlearn','setlearn','setLearn')
	create_alias_s('setlingwu','setlingwu','setLingwu')
	create_alias_s('setdzxy','setdzxy','setdzxy')
	create_alias_s('duanzao','duanzao','duanzao')
	create_alias_s('zhizao','zhizao','zhizao')
	create_alias_s('xuexi','xuexi','xuepot')
	create_alias_s('xc','xc','setxcexp')
	create_alias_s('wdj','wdj','inWdj')
	create_alias_s('dolost','dolost','dolostletter')
	create_alias_s('setjob','setjob','jobSet')
	create_alias('sz','^sz(.*)$','goto("%1")')
	SetAliasOption ('sz','send_to','12')
	create_alias('dushu','^dushu(.*)$','dushu("%1")')
	SetAliasOption ('dushu','send_to','12')
	create_alias('full','^full(.*)$','fullSkill("%1")')
	SetAliasOption ('full','send_to','12')
	create_alias_s('csgo','csgo','zhuacaishen_find')
	create_alias_s('wxbgo','wxbgo','buy_wxb_weapon_prepare')
	create_alias_s('kjh','kjh','jinheTrigger')
	create_alias_s('qcq','qcq','check_gold_dali')
	create_alias_s('dh_tlbb','tlbb','dh_tlbb')
	create_alias_s('gothd','gothd','thz_bfstart')
	create_alias_s('imda','imda','imdaa')
	create_alias_s('imrd','imrd','imrdd')
	create_alias_s('imat','imat','imatt')
	create_alias_s('imru','imru','imruu')
	create_alias_s('imkl','imkl','imkll')
	create_alias_s('imev','imev','imevv')
	create_alias_s('impa','impa','impaa')
	create_alias_s('imaff','imaf','imaff')
	create_alias_s('imctt','imct','imctt')
	create_alias_s('imftt','imft','imftt')
	create_alias_s('imrhh','imrh','imrhh')
	create_alias_s('imrcc','imrc','imrcc')
	create_alias_s('imrff','imrf','imrff')
	create_alias_s('srfy','srfy','killrfy')
	create_alias_s('zxz','zxz','zxz_dfly')
	create_alias_s('testflag','testflag','test_switch')
end
function imdaa()
 exe('improve da;y')
 end
 function imatt()
 exe('improve at;y')
 end
 function imruu()
 exe('improve ru;y')
 end
 function imkll()
 exe('improve kl;y')
 end
function imrdd()
exe('improve rd;y')
 end
 function imaff()
 exe('improve af;y')
 end
 function ctt()
 exe('improve ct;y')
 end
 function ftt()
 exe('improve ft;y')
 end
function imevv()
exe('improve ev;y')
 end
function impaa()
exe('improve pa;y')
 end
function imrhh()
exe('improve rh;y')
 end
function imrcc()
exe('improve rc;y')
 end
function imrff()
exe('improve rf;y')
 end
function setdzxy()
      l_result=utils.msgbox ( "慕容斗转星移学习设置(默认为：Yes)？", "dzxy", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('我要学习斗转星移')
      need_dzxy='yes'
   else
      need_dzxy='no'
      print('我不要学习斗转星移')
   end
end
function inWdj()
      l_result=utils.msgbox ( "是要进苗疆五毒教吗？", "inwdj", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('我要进苗疆五毒教')
      inwdj=1
   else
      inwdj=0
      print('我不进苗疆五毒教')
   end
end
function setLearn()
      l_result=utils.inputbox ("你要学习的SKILLS(格式：force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)是?", "xuexiskill", GetVariable("xuexiskill"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("xuexiskill",l_result)
       Note ("学习设定完成")
        print(GetVariable("xuexiskill"))
 	   end
      l_result=utils.inputbox ("你学习时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	print(GetVariable("learnweapon"))
	   end
end
function setLingwu()
      l_result=utils.inputbox ("你要领悟的SKILLS(格式：force|dodge|sword|blade|parry)是?", "lingwuskills", GetVariable("lingwuskills"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("lingwuskills",l_result)
       Note ("领悟设定完成")
        print(GetVariable("lingwuskills"))
 	   end
      l_result=utils.inputbox ("你领悟时使用的加悟性武器是?", "learnweapon", GetVariable("learnweapon"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	print(GetVariable("learnweapon"))
	   end
end
function pk_start()
     l_result=utils.inputbox ("你要PK的目标是（英文ID）？", "PK-Target", GetVariable("pk_target"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pk_target",l_result)
     end
   if l_result then
      create_timer_s('walkWait4',0.4,'pk_start1')        
   end    
end
function pk_start1()
        exe('follow '..GetVariable("pk_target"))
        exe('kill '..GetVariable("pk_target"))
end
function setpk()
         l_result=utils.inputbox ("你打算憋多少合气？(不填默认240)", "heqi_number", GetVariable("heqi_number"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("heqi_number",l_result)
        else
          SetVariable("heqi_number","240")
     end
         l_result=utils.inputbox ("填写你的克制无属性PK-PFM(克制无)是?", "zpk_pwu", GetVariable("zpk_pwu"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pwu",l_result)
   end
    l_result=utils.inputbox ("填写你的克制空属性PK-PFM(克制空)是?", "zpk_pkong", GetVariable("zpk_pkong"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pkong",l_result)
        end
   l_result=utils.inputbox ("填写你的正属性PK-PFM是? (克制险)", "zpk_pzhen", GetVariable("zpk_pzhen"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pzhen",l_result)
   end
   l_result=utils.inputbox ("填写你的奇属性PK-PFM(克制妙)", "zpk_pqi", GetVariable("zpk_pqi"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pqi",l_result)
   end
   l_result=utils.inputbox ("填写你的刚属性PK-PFM(克制慢)", "zpk_pgang", GetVariable("zpk_pgang"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pgang",l_result)
   end
   l_result=utils.inputbox ("填写你的柔属性PK-PFM(克制快)", "zpk_prou", GetVariable("zpk_prou"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_prou",l_result)
   end
   l_result=utils.inputbox ("填写你的快属性PK-PFM(克制刚)", "zpk_pkuai", GetVariable("zpk_pkuai"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pkuai",l_result)
   end
   l_result=utils.inputbox ("填写你的慢属性PK-PFM(克制柔)", "zpk_pman", GetVariable("zpk_pman"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pman",l_result)
   end
   l_result=utils.inputbox ("填写你的秒属性PK-PFM(克制正)", "zpk_pmiao", GetVariable("zpk_pmiao"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pmiao",l_result)
   end
   l_result=utils.inputbox ("填写你的险属性PK-PFM(克制奇)", "zpk_pxian", GetVariable("zpk_pxian"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pxian",l_result)
   end
   l_result=utils.inputbox ("填写你的默认PK-PFM(起手pfm或无法识别对方武功的应对，类似pfmpfm设定)是?", "pkpfm", GetVariable("pkpfm"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("pkpfm",l_result)
        end
      l_result=utils.inputbox ("填写你的PK-PFM(只包含pfm，不包含wield武器或jifa)", "mypfm", GetVariable("mypfm"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mypfm",l_result)
           end
           l_result=utils.inputbox ("填写你的buff-PFM(pk时使用的buff技能)", "mybuff", GetVariable("mybuff"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mybuff",l_result)
           end
           l_result=utils.inputbox ("填写你的debuff-PFM(pk时使用的debuff技能)", "mydebuff", GetVariable("mydebuff"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mydebuff",l_result)
           end
end
function setLian()
      l_result=utils.inputbox ("你练功的次数是? ", "mycishu", GetVariable("mycishu"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mycishu",l_result)
      lianxi_times = l_result
           end
end
function setxcexp()
      l_result=utils.msgbox ( "巡城到2M", "xcexp", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('巡城到2M')
      xcexp=1
   else
      print('巡城到1M')
      xcexp=0
   end
end
function xuepot()
      l_result=utils.msgbox ( "是否学习", "xuexi", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('学习开启')
      needxuexi=1
   else
      needxuexi=0
      print('学习关闭')
   end
end
function dolostletter()
      l_result=utils.inputbox ("请输入当前失落的信可接上限数量? 默认为10封！", "mylostletter", GetVariable("mylostletter"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("mylostletter",l_result)
      lostno=l_result
	 end
      l_result=utils.msgbox ( "是否做LL", "失落的信", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('开启做LL')
      needdolost=1
      switch_name4="失落的信笺--开"
   else
      needdolost=0
      switch_name4="失落的信笺--关"
      print('关闭做LL')
   end
      l_result=utils.msgbox ( "做LL是否自动买Vpearl", "自动买Vpearl", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('开启自动兑换Vpearl')
      needvpearl=1
   else
      print('关闭自动兑换Vpearl')
      needvpearl=0
   end
end
function dolostAg()
   --l_result=utils.msgbox ( "还要再做失落的信吗", "次数", "yesno", "?", 1 )
   do_lost_again = tonumber(GetVariable('do_lost_again'))
   if do_lost_again == 1 then 
   --if l_result and l_result=="yes" then
      print('再做失落的信10次！')
        lostno=lostno+10
        dis_all()
        return go(dhlost,'扬州城','当铺')
   else
      needdolost=0
      print('关闭做LL')
   end
end
function isNil(p_str)
   if p_str==nil then
      return true
   end
   if type(p_str)~="string" then
      return false
   else
      p_str=Trim(p_str)
      if p_str=="" then
         return true
      else
         return false
      end		 
   end
end
function countR(p_number)
   local i = p_number or 10
   return function()
       i = i - 1
	   return i
   end
end

function randomElement(p_set)
   local l_element

   if p_set and type(p_set)=="table" then
      local l_cnt = math.random(1,countTab(p_set))
	  local l_i = 0
	  for p,q in pairs(p_set) do
	      l_element = q
	      l_i = l_i + 1
		  if l_i == l_cnt then
		     return l_element
		  end
	  end
   else
      l_element = p_set
   end
   
   return l_element
end

function dzxy_trigger()
    DeleteTriggerGroup("dzxy")
    create_trigger_t('dzxy1',"^>*\\s*你仰首望天，太阳挂在天空中，白云朵朵，阳光顺着云层的边缘洒下来，你觉得有些刺眼。",'','dzxy_finish')
    create_trigger_t('dzxy2',"^>*\\s*你仰首望天，天上繁星点点，你体会出了星斗的移动与你所学的“斗转星移”有莫大的联系，却苦于实战经验不足，无法将你看到的东西与实际作战联系到一起。",'','dzxy_finish')
    create_trigger_t('dzxy3','^>*\\s*你把 "action" 设定为 "慕容斗转星移" 成功完成。','','dzxy_goon')    
    create_trigger_t('dzxy4',"^>*\\s*你的内力不够。",'','dzxy_finish') 
    create_trigger_t('dzxy5',"^>*\\s*先从木桩上跳下来\\(down\\)再说吧！",'','dzxy_finish') 
    create_trigger_t('dzxy6',"^>*\\s*恭喜恭喜！你已经融会贯通了斗转星移的绝妙之处！",'','dzxy_finish')
    create_trigger_t('dzxy7',"^>*\\s*你已经没有潜能来领悟学习斗转星移了。",'','dzxy_finish') 
    
    create_trigger_t('dzxy8',"^>*\\s*你仰首望天，天上繁星点点，你顺着银河的方向看去，却发现部分的夜空被周围的树冠挡住了。",'','dzxy_goon') 
    SetTriggerOption("dzxy1","group","dzxy")
    SetTriggerOption("dzxy2","group","dzxy")
    SetTriggerOption("dzxy3","group","dzxy")
    SetTriggerOption("dzxy4","group","dzxy")
    SetTriggerOption("dzxy5","group","dzxy")
    SetTriggerOption("dzxy6","group","dzxy")
    SetTriggerOption("dzxy7","group","dzxy")
    SetTriggerOption("dzxy8","group","dzxy")
    EnableTriggerGroup("dzxy",false)
    DeleteTimer('mr_dzxy_timer')
    --create_timer_m('mr_dzxy_timer',4,'dzxy_finish')
end

function checkdzxy()
   dis_all()
   tmp={}
   --jobTriggerDel()  
   job.name='heal'
   if skills["douzhuan-xingyi"]~=nil then
	   if skills["douzhuan-xingyi"].lvl>130 and skills["douzhuan-xingyi"].lvl<170 then
		 dzxy_level=1  --慕容复开始(#3 w;jump liang;lingwu zihua)，可以到171级。
		 return dzxy()
	   end
	   if skills["douzhuan-xingyi"].lvl>170 and skills["douzhuan-xingyi"].lvl<200 then
		 dzxy_level=2  --还施水阁 去:sit chair;zhuan;n;lingwu miji 回:s;push shujia，可以到201级。
		 return dzxy()
	   end
		if skills["douzhuan-xingyi"].lvl>200 and skills["douzhuan-xingyi"].lvl<hp.pot_max-100 and (locl.time=="戊" or locl.time=="亥" or locl.time=="子" or locl.time=="丑") then
		 dzxy_level=3  --观星台 上去jump zhuang;look sky，下来jump down。只能晚上look sky。可以到N级。
		 return dzxy()
	   end
		messageShow('任务监控：慕容领悟斗转星移条件不够！继续任务！','white')
		print("dzxy_level:"..dzxy_level)
	end
    
 return go(xueshan_finish_ask,'大雪山','入幽口')
end
function open_dzxy_timer()
       return create_timer_m('mr_dzxy_timer',4,'dzxy_finish')
end
function dzxy()
    DeleteTemporaryTriggers()
    dzxy_trigger()
    
    if dzxy_level==1 then
    return check_busy(dzxy1_go)
    end
    if dzxy_level==2 then
    return check_busy(dzxy2_go)
    end
    if dzxy_level==3 then
    return check_busy(dzxy3_go)
    end
end
function dzxy1_go()
    exe('nick 燕子坞碧水厅领悟')
    messageShow('任务监控：去慕容领悟字画去了！','white')
    go(dzxy1_unwield,'燕子坞','碧水厅')
end
function dzxy2_go()
    exe('nick 燕子坞还施水阁领悟')
    messageShow('任务监控：去慕容领悟秘籍去了！','white')
    go(dzxy2_unwield,'燕子坞','还施水阁')
end
function dzxy3_go()
    exe('nick 燕子坞观星台领悟')
    messageShow('任务监控：去慕容看星星去了！','white')
    go(dzxy3_unwield,'燕子坞','观星台')
end
function dzxy1_unwield()
	flag.idle=0
	--open_dzxy_timer()
	weapon_unwield()
	exe('jump liang')
	return check_busy(dzxy_goon)
end
function dzxy2_unwield()
	flag.idle=0
	--open_dzxy_timer()
	weapon_unwield()
	return check_busy(dzxy_goon)
end
function dzxy3_unwield()
	flag.idle=0
	--open_dzxy_timer()
	weapon_unwield()
	exe('jump zhuang')
	return check_busy(dzxy_goon)
end

function dzxy_goon()
    --EnableTimer('mr_dzxy_timer',true)
    if not (locl.room=="观星台" or locl.room=="还施水阁" or locl.room=="梁上") then
	messageShow("慕容领悟：斗转星移的位置不对！当前位置："..locl.room)
       return dzxy_finish()
    end
    EnableTriggerGroup("dzxy",true)
	local leweapon=GetVariable("learnweapon")
	exe('wield '..leweapon)
	
	if not skills["douzhuan-xingyi"] or skills["douzhuan-xingyi"].lvl==0 or skills["douzhuan-xingyi"].lvl>=hp.pot_max-100 then
	messageShow("慕容领悟：斗转星移的等级不对！当前等级："..skills["douzhuan-xingyi"].lvl)
	   return check_busy(dzxy_finish)
	end
    if flag.idle>7 then
       return check_busy(dzxy_finish)
    end
    if hp.neili<hp.neili_max*0.5 then
	messageShow("慕容领悟：斗转星移的内力不够！当前内力【"..hp.neili.."】",'white')
	return check_busy(dzxy_finish)
    else
	    if dzxy_level==1 then
	       exe('hp;yun jing;#10(lingwu zihua)')
	       --EnableTimer('mr_dzxy_timer',false)
	       return check_bei(dzxy_alias,1)
	    end
	    if dzxy_level==2 then
	       exe('hp;yun jing;#10(lingwu miji)')
	       --EnableTimer('mr_dzxy_timer',false)
	       return check_bei(dzxy_alias,1)
	    end
	     if dzxy_level==3 then
	       exe('hp;yun jing;#7(look sky)')
	       --EnableTimer('mr_dzxy_timer',false)
	       return check_bei(dzxy_alias,1)
	    end
    end
end
function dzxy_alias()
    exe('alias action 慕容斗转星移')
end
function dzxy_finish()
    EnableTimer('mr_dzxy_timer',false)
    DeleteTimer("mr_dzxy_timer")
    messageShow('任务监控：慕容斗转星移完成！')
    exe('jump down')
    EnableTriggerGroup("dzxy",false)
    DeleteTriggerGroup("dzxy")
    exe('cha;hp')
    weapon_unwield()
   local leweapon=GetVariable("learnweapon")
   exe('unwield '..leweapon)
   exe('jump down')
   return go(xueshan_finish_ask,'大雪山','入幽口') 
end


function job_lianstart()
    lian_times=0
	wait.make(function() 
        wait.time(1) 
	exe('hp;cha')
	return check_halt(job_lian1)
   end)
 end
function dazuo_lianxi_auto() 
        print('dazuo_lianxi_auto................2222222222222222222')
        ---pumkmai定制
		--local use_wxb_sq = tonumber(GetVariable('use_wxb_sq'))
		
	
	     tmp_lxskill='bei none;unwield taiji sword;unwield wuji xiao;uweapon shape fengyun sword;unwield fengyun sword;'
	    
		
        lianxi_times=GetVariable('mycishu')
		lianxi_times_jsjf = GetVariable('mycishu_jsjf')
		---local dodge_lianxi_times = 50
        for p in pairs(skills) do
                if (skillEnable[p] and skills[p].lvl<hp.pot_max-100) or (skillEnable[p] and skills[p].lvl==hp.pot_max-100 and skills[p].pot<(skills[p].lvl+1)^2) then
                        if skillEnable[p]=="force" then
                                tmp_lxskill=tmp_lxskill..'lian force '..lianxi_times..';'
                        end
						if skillEnable[p]=="sword" then
						    if p=='yuxiao-jian' then
							    tmp_lxskill=tmp_lxskill..'jifa sword '..p..';wield wuji xiao;lian sword '..lianxi_times..';unwield wuji xiao;yun jingli;'
							elseif p=='jinshe-jianfa' then
							     tmp_lxskill=tmp_lxskill..'jifa sword '..p..';wield taiji sword;lian sword '..lianxi_times_jsjf..';unwield taiji sword;yun jingli;'
							else
							    tmp_lxskill=tmp_lxskill..'jifa sword '..p..';wield taiji sword;lian sword '..lianxi_times..';unwield taiji sword;yun jingli;'
							end   
                        end
                        if skillEnable[p]=="dodge" then
								tmp_lxskill=tmp_lxskill..'jifa dodge '..p..';lian dodge '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="finger" then
                                tmp_lxskill=tmp_lxskill..'jifa finger '..p..';lian finger '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="cuff" then
                                tmp_lxskill=tmp_lxskill..'jifa cuff '..p..';lian cuff '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="strike" then
                                tmp_lxskill=tmp_lxskill..'jifa strike '..p..';lian strike '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="hand" then
                                tmp_lxskill=tmp_lxskill..'jifa hand '..p..';lian hand '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="leg" then
                                tmp_lxskill=tmp_lxskill..'jifa leg '..p..';lian leg '..lianxi_times..';yun jingli;'
                        end                                         
                        if skillEnable[p]=="throwing" then
                                tmp_lxskill=tmp_lxskill..'wield coin;lian throwing '..lianxi_times..';unwield coin;yun jingli;'
                        end
                        
                end
        end
        tmp_lxskill=tmp_lxskill..'bei cuff;hp;unset 积蓄'
end
function set_sxlian()
        print('set_sxlian..........2222222222222222222222')
        dazuo_lianxi_auto()
		print('tmp_lxskill...:'..tmp_lxskill)
        create_alias('sx1lian','sx1lian','alias sxlian '..tmp_lxskill)
        Execute('sx1lian')
end

-----------自动抓雪蛛by桃花岛无法风2019.3.16----------
function check_xuezhu_status()
        local xuezhu_status=GetVariable("xuezhu_status")
        if xuezhu_status==nil then
           messageShow('未找到雪蛛变量：xuezhu_status，请尽快设置！','white','black')
        elseif xuezhu_status=="0" then
           messageShow('本周还未抓到雪蛛，启动自动抓雪蛛机器人，前往抓雪蛛！','white','black')
           return xuezhu_status
        elseif xuezhu_status=="1" then
           messageShow('已问程灵素要了真丹，现在前往抓雪蛛！','white','black')
           return xuezhu_status
        elseif xuezhu_status=="-1" then
           messageShow('程灵素给了假丹，小贱人！怒！！！现在前往抓雪蛛！','white','black')
           return xuezhu_status
        end
end
cnt_yaoshuteng=0
function xuezhuTrigger()
    cnt_yaoshuteng=0
    DeleteTriggerGroup("xuezhuAsk")
    create_trigger_t('xuezhuAsk1',"^(> )*你向程灵素打听有关『五毒教』的消息",'','xuezhuAsk')
    create_trigger_t('xuezhuAsk2',"^(> )*这里没有这个人。$",'','xuezhuNobody')
    SetTriggerOption("xuezhuAsk1","group","xuezhuAsk")
    SetTriggerOption("xuezhuAsk2","group","xuezhuAsk")
    EnableTriggerGroup("xuezhuAsk",false)
    DeleteTriggerGroup("xuezhuAccept")
    create_trigger_t('xuezhuAccept1',"^(> )*程灵素说道：「五毒教的禁地种满了各种奇花异草，其中大部分具有巨毒\\D*",'','xuezhuAccept')
    create_trigger_t('xuezhuAccept2',"^(> )*你获得一颗九雪碧云丹。$",'','eatDan')
    create_trigger_t('xuezhuAccept3',"^(> )*你把一颗九雪碧云丹，轻轻咬碎含进嘴里，顿觉神明意朗，脸色红润。$",'','xuezhu_go')
    create_trigger_t('xuezhuAccept4',"^(> )*程灵素说道：「你上次答应我的事情还没做\\D*",'','fakeDan')
    SetTriggerOption("xuezhuAccept1","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept2","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept3","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept4","group","xuezhuAccept")
    EnableTriggerGroup("xuezhuAccept",false)
    DeleteTriggerGroup("xuezhuFight")
    create_trigger_t('xuezhuFight1','^(> )*你晃动了半天，发现什麽也没有','','xuezhuFailNew')
    create_trigger_t('xuezhuFight2','^(> )*你轻轻摇晃树藤，忽然掉下一只雪蛛。','','xuezhuFight')
    create_trigger_t('xuezhuFight3','^(> )*雪蛛神志迷糊，脚下一个不稳，倒在地上昏了过去。','','getxuezhuX')
    create_trigger_t('xuezhuFight4',"^(> )*你将雪蛛扶了起来背在背上。",'','givecheng')
        create_trigger_t('xuezhuFight5',"^(> )*雪蛛「啪」的一声倒在地上，挣扎着抽动了几下就死了。",'','xuezhuFailNew')
        --create_trigger_t('xuezhuFight6',"^(> )*(你附近没有这样东西。|雪蛛突然蹿到地上不见了。)",'','xuezhuFail')
        create_trigger_t('xuezhuFight6',"^(> )*雪蛛突然蹿到地上不见了。",'','xuezhuFailNew')
    SetTriggerOption("xuezhuFight1","group","xuezhuFight")
    SetTriggerOption("xuezhuFight2","group","xuezhuFight")
    SetTriggerOption("xuezhuFight3","group","xuezhuFight")
    SetTriggerOption("xuezhuFight4","group","xuezhuFight")
        SetTriggerOption("xuezhuFight5","group","xuezhuFight")
        SetTriggerOption("xuezhuFight6","group","xuezhuFight")
    EnableTriggerGroup("xuezhuFight",false)
    DeleteTriggerGroup("xuezhuFinish")
    create_trigger_t('xuezhuFinish1','^(> )*程灵素说道：「你果然言而有信，下次你要再去五毒教来找我吧。」','','xuezhuFinish')
    SetTriggerOption("xuezhuFinish1","group","xuezhuFinish")
    EnableTriggerGroup("xuezhuFinish",false)
end
function xuezhuTriDel()
        --dis_all()
        EnableTriggerGroup("xuezhuAsk",false)
        EnableTriggerGroup("xuezhuAccept",false)
        EnableTriggerGroup("xuezhuFight",false)
        EnableTriggerGroup("xuezhuFinish",false)
        DeleteTriggerGroup("xuezhuAsk")
        DeleteTriggerGroup("xuezhuAccept")
        DeleteTriggerGroup("xuezhuFight")
        DeleteTriggerGroup("xuezhuFinish")
end
function getxuezhu0()
        xuezhuTrigger()
        go(askcheng,'苗疆','药王居')
end
function getxuezhu1()
    if GetVariable("xuezhu_status")~=nil and GetVariable("xuezhu_status")=='1' and inwdj==0 then
	   inwdj=1
	   button_smyteam()
	end
        xuezhuTrigger()
        xuezhu_go()
end
function askcheng()
        EnableTriggerGroup("xuezhuAsk",true)
        EnableTriggerGroup("xuezhuAccept",true)
        exe('ask cheng about 五毒教')
        create_timer_s('walkWait4',3.0,'askcheng1')
end
function askcheng1()
        exe('ask cheng about 五毒教')
end
function xuezhuAsk()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
    EnableTriggerGroup("xuezhuAsk",false)
end
function xuezhuAccept()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
        wait.make(function()
         wait.time(2)
        exe('yes')        
    end)
        SetVariable("xuezhu_status","1")
		inwdj=1
end
function eatDan()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
    exe('fu dan')
        create_timer_s('walkWait4',1.0,'eatDan1')
end
function eatDan1()
        exe('fu dan')
end
function fakeDan()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
        SetVariable("xuezhu_status","-1")
        return xuezhu_go()
end
function xuezhu_go()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
        if not Bag["火折"] and drugPrepare["火折"] then
           if locl.weekday == '四' and locl.hour ==8 then
          return checkPrepareOver()
           else
                  return checkFire()
           end
        end
        EnableTriggerGroup("xuezhuAccept",false)
        EnableTriggerGroup("xuezhuFight",true)
        go(yaoshuteng,'苗疆','山洞')
end
function yaoshuteng()
        print('yaoshuteng..............................')
        EnableTriggerGroup("xuezhuFight",true)
		wait.make(function()
		   wait.time(2)
		   --exe('dian fire;yao shuteng')
           create_timer_st('walkWait4',1.0,'yaoshuteng1')
		end)
        ---exe('dian fire;yao shuteng')
        ---create_timer_st('walkWait4',1.0,'yaoshuteng1')
end
function yaoshuteng1()
        exe('dian fire;yao shuteng')
end

function xuezhuTimeJudge()

    

    local cur_min = tonumber(os.date("%M"))
	local cur_sec = tonumber(os.date("%S"))
		
	
	print('cur_min:'..cur_min)
	print('cur_sec:'..cur_sec)
	if (cur_min >= 3 and cur_min<=6) then 
	  return 1
	end 
	if (cur_min >= 18 and cur_min<=21) then 
	  return 1
	end
	if (cur_min >= 33 and cur_min<=36) then 
	  return 1
	end
	if (cur_min >= 53 and cur_min<=56) then 
	  return 1
	end
	
	return 0
end

function xuezhuFailNew()
    print('xuezhuFailNew.....')
    local xuezhu_timejudge = xuezhuTimeJudge()
    local xuezhu_wait = tonumber(GetVariable('xuezhu_wait'))
	print('xuezhu_timejudge='..xuezhu_timejudge)
	print('xuezhu_wait..'..xuezhu_wait)
	--if xuezhu_wait == 1 or xuezhu_timejudge==1 then 
	if xuezhu_wait == 1 then 
	    print('wait xuezhu ...')
	     wait.make(function()
              wait.time(2)
                return check_busy(yaoshuteng1)
             end)
	    
	else
	   print('no wait xuezhu ...')
        check_busy(xuezhuFail)
    end	
  
end 

function xuezhuFail()
        --cnt_yaoshuteng = cnt_yaoshuteng + 1
		--if cnt_yaoshuteng > 1 then 
		
		    xuezhuTriDel()
            messageShow('雪蛛不在，一会再来抓！','white','black')
             ---pumkmai xiugai 
		     ----DoAfterSpecial(0.5,checkPrepareOver(),10)
		
		    wait.make(function()
              wait.time(2)
                return checkPrepareOver()
             end)
		
		--end      
		
end
function xuezhuFight()
        EnableTimer('walkWait4',false)
        DeleteTimer("walkWait4")
        wait.make(function()
         wait.time(3)
                 weapon_unwield()
        exe('unset wimpy;jiali 50;hit xue zhu')
    end)
end
function getxuezhuX()
        exe('get xue zhu')
end
function givecheng()
        EnableTriggerGroup("xuezhuFinish",true)
        go(givexuezhu,'苗疆','药王居')
end
function givexuezhu()
        exe('give cheng xue zhu')
        create_timer_st('walkWait4',1.0,'givexuezhu1')
end
function givexuezhu1()
    exe('give xue zhu to cheng lingsu')
end

function lazy_test()
    gametime_trigger()
	exe('time')	   		 	   		   
	wait.make(function()
		       wait.time(2)
		        exe('xixi')
				print('game_time...:::.................'..game_time)
		        if game_time ~= 0 then 
			      exe('kiss')
		        end 
				wait.time(3)
				lazy_test1()
				wait.time(6)
                lazy_test2()
		    end)
    
	
end

function lazy_test1()
   exe('haha')
end

function lazy_test2()
   exe('hug')
end



function xuezhuFinish()
        local x=GetVariable("xuezhu_status")
        if x=='-1' then
           SetVariable("xuezhu_status","0")
        end
        if x=='1' then
           SetVariable("xuezhu_status","2")
		   SetVariable('xuezhu_time',10)
           messageShow('本周已成功抓到雪蛛，请安心游戏！：)','red','black')
		  -- gametime_trigger()
		 --  exe('time')	   		 	   		   
		    wait.make(function()
		       wait.time(2)
		        --exe('xixi')
				--print('game_time....................'..game_time)
		        --if game_time ~= 0 then 
			    -- SetVariable('xuezhu_time',game_time)
				 --SetVariable('xuezhu_time',10)
		        --end 
				wait.time(1)
				xuezhuTriDel()
                weapon_wield()
		        wait.time(1)
                return checkPrepareOver()
				
		    end)
		    
		   
        end
       xuezhuTriDel()
        weapon_wield()
		
        return checkPrepareOver()
end
-----------自动抓雪蛛by桃花岛无法风2019.3.16----------
zxz_dfly=function()
DeleteTriggerGroup("zxz_dfly")
create_trigger_t('zxz_dfly1','^(> )*雪蛛神志迷糊，脚下一个不稳，倒在地上昏了过去。','','getxue_zhuX')
create_trigger_t('zxz_dfly2',"^(> )*你将雪蛛扶了起来背在背上。",'','give_cheng')
create_trigger_t('zxz_dfly3',"^(> )*你给程灵素一只雪蛛。",'','xz_finish')
SetTriggerOption("zxz_dfly1","group","zxz_dfly")
SetTriggerOption("zxz_dfly2","group","zxz_dfly")
SetTriggerOption("zxz_dfly3","group","zxz_dfly")
EnableTriggerGroup("zxz_dfly",true)
return zxz_goon()
end
function dhdfly()
exe('duihuan dfly')
end

function zxz_goon()
go(yao_shuteng,'苗疆','山洞')
end

function yao_shuteng()
   wait.make(function()
         exe('dian fire;fang dfly;yao shuteng')
         wait.time(0.5)
		 weapon_unwield()
		 while true do
		     exe('unset wimpy;jiali 50')
		     exe('hit xue zhu')
		     exe('hug '..score.id)
			 local l, w = wait.regexp('^(> )*你向梦中的情人抱去，结果落了个空',1)
			 if l~=nil then break end 
		 end
   end)
end

function getxue_zhuX()
exe('get xue zhu')
end
function give_cheng()
   go(give_xuezhu,'苗疆','药王居')
end
function give_xuezhu()
        exe('give cheng xue zhu')
        create_timer_st('walkWait4',1.0,'give_xuezhu1')
end
function give_xuezhu1()
    exe('give xue zhu to cheng lingsu')
end
function xz_finish()
EnableTriggerGroup("zxz_dfly",false)
EnableTimer('walkWait4',false)
messageShow('本周已成功抓到雪蛛！：)','red','black')
SetVariable("xuezhu_status","2")
SetVariable('xuezhu_time',10)
return checkPrepareOver()
end
-------------食物和饮水---------------
function buyrl()
go(ylbuy,"伊犁城","商铺")
end
function ylbuy()
exe('buy ru lao')
end
function jdeat()
exe('hp')
if (hp.food<10 or hp.water<10) then
return jdeatt()
end
end
function jdeatt()
exe('#4(drink jiudai);drink ru lao')
return go(wudang_eat,'武当山','茶亭')
end

-------------兑换天龙--------------
function dh_tlbb()
go(tlbbb,"扬州城","当铺")
end
function tlbbb()
exe('duihuan tianlong')
DoAfterSpecial(3,'read book;hp;setjob',10)
end
------------任飞燕----------
killrfy=function()
DeleteTriggerGroup("killrfy")
create_trigger_t('killrfy1','^(> )*任飞燕「啪」的一声倒在地上，挣扎着抽动了几下就死了','','get_jinchai')
create_trigger_t('killrfy2','^(> )*这里没有这个人','','get_jinchai')
SetTriggerOption("killrfy1","group","killrfy")
SetTriggerOption("killrfy2","group","killrfy")
EnableTriggerGroup("killrfy",true)
go(krfy,"huanghe/huanghe6")
end

function krfy()
   exe('look')
   if not locl.id["任飞燕"] then
     --return check_jobx()
	 return checkPrepareOver()
   else 
     exe('kill ren feiyan')
   end
end

function get_jinchai()
   EnableTriggerGroup("killrfy",false)
   exe('get jin chai from corpse')
   ---return check_jobx()
   return checkPrepareOver()
end
--------------检查锦盒-------------
jinheTrigger=function()
print('jinheTrigger........')
DeleteTriggerGroup("jinheTrigger")
create_trigger_t('jinheTrigger1',"^>*\\s*你看了半天，也没有明白这盒子到底是怎么回事。",'','jinhe_goon')
create_trigger_t('jinheTrigger2',"^>*\\s*盒子的夹层已经打开，你可以仔细看盒子（look jinhe）然后采取相应行动。",'','jinhe_find')
create_trigger_t('jinheTrigger3',"^>*\\s*吾纵横江湖时曾在(\\D*)留下些许物事，待有缘人前去挖掘",'','jinhe_get')
SetTriggerOption("jinheTrigger1","group","jinheTrigger")
SetTriggerOption("jinheTrigger2","group","jinheTrigger")
SetTriggerOption("jinheTrigger3","group","jinheTrigger")
EnableTriggerGroup("jinheTrigger",true)
exe('jiancha jinhe')
end
jinhe_goon=function()
exe('jiancha he')
end
function jinhe_get(n,l,w)
jinhe_dd=tostring(w[1])
 exe('sz '..jinhe_dd)
 EnableTriggerGroup("jinheTrigger",false)
 DeleteTriggerGroup("jinheTrigger")
end
jinhe_find=function()
exe('look he')
end

--------------自动检查锦盒-------------
jinhe_city=nil
jinhe_room=nil
jinhe_rooms={}
dig_num=0
room_idx=0
autojinheTrigger=function()
print('autojinheTrigger........')
DeleteTriggerGroup("autojinheTrigger")
--create_trigger_t('autojinheTrigger1',"^>*\\s*你看了半天，也没有明白这盒子到底是怎么回事。",'','autojinhe_goon')
create_trigger_t('autojinheTrigger2',"^>*\\s*盒子的夹层已经打开，你可以仔细看盒子（look jinhe）然后采取相应行动。",'','autojinhe_find')
create_trigger_t('autojinheTrigger3',"^>*\\s*吾纵横江湖时曾在(\\D*)留下些许物事，待有缘人前去挖掘",'','autojinhe_get')
--SetTriggerOption("autojinheTrigger1","group","autojinheTrigger")
SetTriggerOption("autojinheTrigger2","group","autojinheTrigger")
SetTriggerOption("autojinheTrigger3","group","autojinheTrigger")
EnableTriggerGroup("autojinheTrigger",true)
 messageShow('自动挖矿准备！开始检查锦盒!','red')
 create_timer_s('walkWait4',1.0,'autojinhe_goon')
 exe('jiancha jinhe')

end
autojinhe_goon=function()
   exe('jiancha jinhe')
end

function autojinhe_get_test()
 local jinhe_didian='燕子坞长廊'
 EnableTriggerGroup("autojinheTrigger",false)
 DeleteTriggerGroup("autojinheTrigger")
 
 
 jinhe_city=nil
 jinhe_room=nil
 jinhe_rooms={}
 dig_num=0
 room_idx=0
 
 jinhe_city,jinhe_room  = locateroom(jinhe_didian)
 
 if jinhe_room == nil then 
     checkPrepareOver()
 end
 
 jinhe_rooms = getRooms(jinhe_room,jinhe_city)
 
 ColourNote ("red","blue","准备去"..jinhe_didian..'挖宝.......')
 
 if jinhe_city and countTab(jinhe_rooms)==1 then
    print('单个房间的情况......')
    return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 elseif jinhe_city and countTab(jinhe_rooms)>1 then 
    print('多个房间的情况......')
	job.name='get_jinhe'
    room_idx=1
	--jinhe_room = jinhe_rooms[room_idx]
	return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 else
    ColourNote ("red","blue","无法查到这个锦盒地点："..jinhe_didian)
	return checkPrepareOver()
 end
 
end


function autojinhe_get(n,l,w)
 EnableTimer('walkWait4',false)
 local jinhe_didian=tostring(w[1])
 EnableTriggerGroup("autojinheTrigger",false)
 DeleteTriggerGroup("autojinheTrigger")
 
 
 jinhe_city=nil
 jinhe_room=nil
 jinhe_rooms={}
 dig_num=0
 room_idx=0
 
 jinhe_city,jinhe_room  = locateroom(jinhe_didian)
 jinhe_rooms = getRooms(jinhe_room,jinhe_city)
 
 ColourNote ("red","blue","准备去"..jinhe_didian..'挖宝.......')
  messageShow('自动挖矿开始！准备去【'..jinhe_didian..'】挖宝！','red')
 
 if jinhe_city and countTab(jinhe_rooms)==1 then
    print('单个房间的情况......')
    return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 elseif jinhe_city and countTab(jinhe_rooms)>1 then 
    print('多个房间的情况......')
	job.name='get_jinhe'
    room_idx=1
	--jinhe_room = jinhe_rooms[room_idx]
	return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 else
    ColourNote ("red","blue","无法查到这个锦盒地点："..jinhe_didian)
	return checkPrepareOver()
 end
 
end
autojinhe_find=function()
    EnableTimer('walkWait4',false)
    exe('look he')
end

function autoDigTrigger()
  DeleteTriggerGroup("autoDigTrigger")
  create_trigger_t('autoDigTrigger1',"^>*\\s*你打算拆屋呀？",'','autoDigAgain')
  create_trigger_t('autoDigTrigger2',"^>*\\s*你挖了一阵，什么也没有找到。",'','autoDigAgain')
  create_trigger_t('autoDigTrigger3',"^>*\\s*你从铁盒子里拿出了(\\D*)",'','autoDigFinish')
  create_trigger_t('autoDigTrigger4',"^>*\\s*你忽然发现土里有一两白银。",'','autoDigAgain')
  create_trigger_t('autoDigTrigger5',"^>*\\s*你还是专心作战吧！",'','autoDigAgain')
  create_trigger_t('autoDigTrigger6',"^>*\\s*经过一段时间的寻找，你挖到了一些药草。",'','autoDigAgain')
  
  SetTriggerOption("autoDigTrigger1","group","autoDigTrigger")
  SetTriggerOption("autoDigTrigger2","group","autoDigTrigger")
  SetTriggerOption("autoDigTrigger3","group","autoDigTrigger")
  SetTriggerOption("autoDigTrigger4","group","autoDigTrigger")
  SetTriggerOption("autoDigTrigger5","group","autoDigTrigger")
  SetTriggerOption("autoDigTrigger6","group","autoDigTrigger")
  
  EnableTriggerGroup("autoDigTrigger",true)
  dig_num=0
  ---exe('dig')
  wait.make(function()
       wait.time(2)
	   exe('dig')
	end)
      
end

function autoDigFinish(n,l,w)
   local get_gold = tostring(w[1])
   ColourNote ("red","blue","已经在"..jinhe_city..jinhe_room..'完成挖宝')
   messageShow('自动挖矿完成！获得【'..get_gold..'】！','red')
   job.name=''
   EnableTriggerGroup("autoDigTrigger",false)
   return check_busy(checkPrepareOver)   
end

function autoDigAgain()
   print('dig.....')
   dig_num = dig_num + 1
   if dig_num < 4 then 
     check_busy(autoDig)
   else
     print('换下一个地方......')
	 room_idx = room_idx  + 1
	 return go(autoDigTrigger,jinhe_city,jinhe_room)
   end    
end 

function autoDig()
   exe('dig')
end

-----------存银票-----------
function checkcash()
return go(check_cun_cash,"襄阳城","宝龙斋")
end
function check_cun_cash()
local l_cnt=Bag["壹仟两银票"].cnt
exe('cun '.. l_cnt ..' cash')
   return check_halt(check_jobx)
end


weapon_lose=function()
  DeleteTriggerGroup("weapon_lose")
  create_trigger_t('weapon_lose1',"^>*\\s*哈士奇一转眼就跑没影儿了，一会给你叼来了一柄(\\D*)，然后不知道跑哪去了。",'','weapon_found')
  create_trigger_t('weapon_lose2',"^>*\\s*哈士奇呆呆地瞪着你，好象很不高兴的样子。",'','weapon_no_found')
  create_trigger_t('weapon_lose3',"^>*\\s*你的状态不稳定，请稍候。",'','weapon_no_found')
  SetTriggerOption("weapon_lose1","group","weapon_lose")
  SetTriggerOption("weapon_lose2","group","weapon_lose")
  SetTriggerOption("weapon_lose3","group","weapon_lose")
  EnableTriggerGroup("weapon_lose",true)
  go(weapon_dh,"city/dangpu")
end

function weapon_dh()
  exe('duihuan husky')
  exe('save')
end

function weapon_found()
  EnableTriggerGroup("weapon_lose",false)
  return check_busy(weapon_found_get)
end

function weapon_no_found()
  check_halt(BQuit)
  exe('drink jiudai')
end 

function weapon_found_get()
   exe('get all')
   return check_halt(check_jobx)
end



-----兑换红蓝石头----
function stoneSet() 
   stonePrepare={}
   local t={
   ["赤晶石"] = "赤晶石",
   ["海蓝石"] = "海蓝石",
   }
   if GetVariable("stoneprepare") then
      tmp.stone = utils.split(GetVariable("stoneprepare"),'|')
	  tmp.pre = {}
      for _,p in pairs(tmp.stone) do
          tmp.pre[p]=true
      end
   end
   local l_tmp=utils.multilistbox ("你准备吃的石头(请按CTRL多选)是?", "物品组合", t,tmp.pre)
   local l_result=nil
   for p in pairs(l_tmp) do
       stonePrepare[p]=true
       if l_result then
          l_result = l_result .. '|' .. p
       else
          l_result = p
       end
   end
   if isNil(l_result) then
      DeleteVariable("stoneprepare")
   else
      SetVariable("stoneprepare",l_result)
   end
   l_result=utils.inputbox ("你兑换石头的次数是？", "stonecishu", GetVariable("stonecishu"), "宋体" , "12")
   if not isNil(l_result) then
      SetVariable("stonecishu",l_result)
   end
end
function stoneGetVar()
    stonePrepare={}
    if GetVariable("stoneprepare") then
      tmp.stone = utils.split(GetVariable("stoneprepare"),'|')
      for _,p in pairs(tmp.stone) do
          stonePrepare[p]=true
      end
    end
	return duihuan_Stone()
end
function duihuan_Stone()
    if MidNight[locl.time] then
	   ColourNote ("red","blue","珠宝店关门，无法卖石头，请过一阵再尝试！")
    else
      return go(duihuan_prepare,'扬州城','当铺')
    end
end
function duihuan_prepare()
	tmp.redstone=0
	tmp.bluestone=0
	flag.redstone=false
	flag.bluestone=false
	flag.duihuan=0
    DeleteTriggerGroup("duihuanstone")
    create_trigger_t('duihuanstone1',"^(> )*当铺老板吆喝一声："..score.name.."兑换限制级宝物(赤晶石|海蓝石).*",'','stone_consider')
    create_trigger_t('duihuanstone2',"^(> )*朱老板一把抓过(赤晶石|海蓝石)道：“哇，好东西呀！”",'','maistone_set')
	create_trigger_t('duihuanstone3',"^(> )*你还是多努力一段时间吧。",'','duihuan_done')
	create_trigger_t('duihuanstone4',"^(> )*你先要用完现有的物品才能再次兑换。",'','check_stoneT')
    SetTriggerOption("duihuanstone1","group","duihuanstone")
    SetTriggerOption("duihuanstone2","group","duihuanstone")
	SetTriggerOption("duihuanstone3","group","duihuanstone")
	SetTriggerOption("duihuanstone4","group","duihuanstone")
    return duihuanStone()
end
function duihuanStone()
    if stonePrepare["赤晶石"] and tmp.redstone<tonumber(GetVariable("stonecishu")) then
	   flag.duihuan=1
       exe('duihuan redstone')
    end
    return check_busy(duihuanStone1,3)
end
function duihuanStone1()
    if stonePrepare["海蓝石"] and tmp.bluestone<tonumber(GetVariable("stonecishu")) then
	   flag.duihuan=2
       exe('duihuan bluestone')
	end
end
function stone_consider(n,l,w)
	local x=tostring(w[2])
    if x=='赤晶石' then
	   flag.redstone=true
       tmp.redstone=tmp.redstone+1
    end
    if x=='海蓝石' then
	   flag.bluestone=true
       tmp.bluestone=tmp.bluestone+1
    end
	return stone_consider_go()
end
function stone_consider_go()
	if stonePrepare["赤晶石"] and stonePrepare["海蓝石"] and flag.redstone and flag.bluestone then 
	   return check_busy(mai_stone,3)
	end
	if stonePrepare["赤晶石"] and not stonePrepare["海蓝石"] and flag.redstone then 
	   return check_busy(mai_stone,3)
	end
	if not stonePrepare["赤晶石"] and stonePrepare["海蓝石"] and flag.bluestone then 
	   return check_busy(mai_stone,3)
	end
end
function duihuan_done()
	if stonePrepare["赤晶石"] and stonePrepare["海蓝石"] then 
	   if flag.duihuan==1 then
		  stonePrepare["赤晶石"]=false
		  tmp.redstone=tonumber(GetVariable("stonecishu"))
		  return
	   end
	   if flag.duihuan==2 then
		  stonePrepare["海蓝石"]=false
		  tmp.bluestone=tonumber(GetVariable("stonecishu"))
	   end
	end
	if stonePrepare["赤晶石"] and not stonePrepare["海蓝石"] then
	   stonePrepare["赤晶石"]=false
       tmp.redstone=tonumber(GetVariable("stonecishu"))
       tmp.bluestone=tonumber(GetVariable("stonecishu")) 
	end
	if not stonePrepare["赤晶石"] and stonePrepare["海蓝石"] then
	   stonePrepare["海蓝石"]=false
       tmp.redstone=tonumber(GetVariable("stonecishu"))
       tmp.bluestone=tonumber(GetVariable("stonecishu"))
	end
	return check_stone()	
end
function mai_stone()
	return go(mai_stone_check,"扬州城","珠宝店")
end
function mai_stone_check()
    exe('score')
	if flag.redstone then
	   exe('mai redstone')
	end
	if flag.bluestone and not flag.redstone then
	   exe('mai bluestone')
	end
end
function maistone_set(n,l,w)
	if w[2]=='赤晶石' then flag.redstone=false end
	if w[2]=='海蓝石' then flag.bluestone=false end
	if flag.redstone or flag.bluestone then
	   return check_busy(mai_stone)
	else
	   return check_busy(check_stone)
	end
end
function check_stone()
	if tmp.redstone>=tonumber(GetVariable("stonecishu")) and tmp.bluestone>=tonumber(GetVariable("stonecishu")) then
	   checkBags()
	   wait.make(function()
         wait.time(2)
       return check_stone1()
       end)	   
	end
	return go(duihuanStone,"扬州城","当铺")
end
function check_stone1()
	if Bag and Bag["赤晶石"] then
	   flag.redstone=true
	end
	if Bag and Bag["海蓝石"] then
	   flag.bluestone=true
	end
	if flag.redstone or flag.bluestone then
	   return mai_stone()
	else
	   ColourNote ("red","blue","您选择的石头到达兑换的极限，本次兑换完毕！")
	   --return checkPrepare()
	end
end
function check_stoneT()
	checkBags()
	wait.make(function()
         wait.time(2)
    return check_stone1()
    end)	
end

------- 韦小宝 -----------------------
function buy_wxb_weapon_prepare()
    dis_all()
    DeleteTriggerGroup("buywxbweapon")
    create_trigger_t('buywxbweapon1',"^>*\\s*韦春芳说道：「这位兄台，不瞒您说，我那乖儿子正在(\\D*)卖兵器呢。」",'','buy_wxb_weapon_go')
	create_trigger_t('buywxbweapon2',"^>*\\s*鹿鼎公「小白龙」韦小宝\\(Wei xiaobao\\)",'','follow_wxb')
	create_trigger_t('buywxbweapon3',"^>*\\s*韦小宝目前出售以下货物：",'','buy_wxb_weapon')
    SetTriggerOption("buywxbweapon1","group","buywxbweapon")
	SetTriggerOption("buywxbweapon2","group","buywxbweapon")
	SetTriggerOption("buywxbweapon3","group","buywxbweapon")
	EnableTriggerGroup('buywxbweapon',true)
	
    return go(buy_wxb_weapon_ask_wei,'扬州城','丽春院')
end

function buy_wxb_weapon_ask_wei()
   exe('ask wei about 韦小宝')
end 

function follow_wxb()
    --EnableTrigger('buywxbweapon2',false)
    exe('follow wei')
	exe('list')
end

function check_wxb()

end

function buy_wxb_weapon()
   wait.make(function()
      
   end)
end 

function buy_wxb_weapon_go(n,l,w)
   EnableTrigger('buywxbweapon1',false)
   local wxb_location = tostring(w[1])
   local wxb_city,wxb_room  = locateroom(wxb_location)
   return go(buy_wxb_weapon_buy_lqj,wxb_city,wxb_room)
end 



-----扬州自动找徐霞客 by 无法风2019.12.25------
xxkFind=function()
    DeleteTriggerGroup("xxkFind")
    create_trigger_t('xxkFind1','^(> )*\\s*徐霞客\\(Xu xiake\\)','','xxkFindFollow')
    create_trigger_t('xxkFind2','^(> )*这里没有 xu xiake','','xxkFindGoon')
    create_trigger_t('xxkFind3','^(> )*你决定跟随\\D*一起行动。','','xxkFindDone')
    create_trigger_t('xxkFind4','^(> )*你已经这样做了。','','xxkFindDone')
    SetTriggerOption("xxkFind1","group","xxkFind")
    SetTriggerOption("xxkFind2","group","xxkFind")
    SetTriggerOption("xxkFind3","group","xxkFind")
    SetTriggerOption("xxkFind4","group","xxkFind")
    EnableTriggerGroup("xxkFind",false)
        cntr1 = countR(20)
        job.name="找徐霞客"
        return go(xxkFindFact,"扬州城","城隍庙")
end
xxkFindFact=function()
    EnableTriggerGroup("xxkFind",true)
        exe('look')
        return find()
end
xxkFindFollow=function()
    flag.find = 1
        exe('follow xu xiake')
end
xxkFindGoon=function()
    flag.wait=0
    flag.find=0
    return walk_wait()
end
function xxkFindDone()
        ColourNote ("red","blue","【已找到徐霞客这个狗头，请开始你的嘿嘿嘿……】")
end


----- xueshan  wudang exchange --------------

function turn_job()
        exe('duihuan tbook')
        return check_busy(read_tbook)
end
function read_tbook()
        exe('read book;hp')
        wait.make(function() 
            wait.time(2)
        return check_halt(change_job)
        end)
end
function change_job()
        local l_result
        if hp.shen<0 then
           if job.zuhe["wudang"] then 
          job.zuhe["wudang"]=nil
                  job.zuhe["songmoya"]=nil
          job.zuhe["xueshan"]=true 
       end
       l_result = 'huashan_xueshan'
           SetVariable("jobzuhe",l_result)
           ColourNote ("red","blue","任务组合调整完毕，目前是【雪山】+【华山】！")
    end        
        if hp.shen>0 then
           if job.zuhe["xueshan"] then 
          job.zuhe["xueshan"]=nil
                  job.zuhe["songmoya"]=nil
          job.zuhe["wudang"]=true 
       end
           l_result = 'huashan_wudang'
           SetVariable("jobzuhe",l_result)
           ColourNote ("red","blue","任务组合调整完毕，目前是【武当】+【华山】！")
        end
end


------------------  cun ------------

function cunSomeThing(id,cnt,thread)
    wait.make(function()
	    local i=0
	    while true do
		   exe('cun '..id)
		   wait_busy()
		   i = i + 1
		   if i >= cnt then 
		       break
		   end 
		end
		
		if thread ~= nil then 
		    coroutine.resume(thread)
		end 
	end)
end

----- 重启准备 --------------

function reboot_prepare()
    wait.make(function()
	    await_go('扬州城','杂货铺')
		thread = coroutine.running()
	    cunSomeThing('fire',3,thread)
		coroutine.yield()
		cunSomeThing('sheng zi',3,thread)
		coroutine.yield()
		cunSomeThing('jin chai',3,thread)
		coroutine.yield()
	end)
end

---- 每周三中午12点 自动worship lao ren  -------------------
---- 领取成功后，写入到变量或者文件里
function auto_worship_laoren()
    wait.make(function()
	    await_go('泰山','记忆之间')
		wait_busy()
		exe('worship lao ren')
		wait_busy()
		SetVariable('worship_done','1')
		return checkJob_ex()
	end)
end





