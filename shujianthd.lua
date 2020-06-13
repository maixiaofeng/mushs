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


-- ����һ����ͨ����
function create_alias(a_name,a_match,a_response)
      return AddAlias(a_name,a_match,a_response,alias_flag.Enabled+alias_flag.Replace+alias_flag.RegularExpression,'')
end
-- ����һ���ű�����
function create_alias_s(a_name,a_match,a_function)
      return AddAlias(a_name,a_match,'',alias_flag.Enabled+alias_flag.Replace,a_function)
end
-- ����һ���ֶ�ʱ��
function create_timer_m(t_name,t_min,t_function)
      return AddTimer(t_name,0,t_min,0,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace,t_function)
end
-- ����һ���붨ʱ��
function create_timer_s(t_name,t_second,t_function)
      return AddTimer(t_name,0,0,t_second,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace,t_function)
end
-- ����һ��һ�����붨ʱ��
function create_timer_st(t_name,t_second,t_function)
      return AddTimer(t_name,0,0,t_second,'',timer_flag.Enabled+timer_flag.ActiveWhenClosed+timer_flag.Replace+timer_flag.OneShot,t_function)
end
-- ����һ�������� 
function create_trigger_t(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function)
end
-- ����һ����ʱ�Ĵ����� 
function create_trigger_f(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary,-1,0,"",t_function)
end
-- ����һ����ʱ��һ���Դ����� 
function create_trigger(t_name,t_match,t_response,t_function )
      return AddTrigger(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary+trigger_flag.OneShot,-1,0,"",t_function)
end
-- ����һ��ex������ 
function create_triggerex_t(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,99)
end
function create_triggerex_t101(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,101)
end
function create_triggerex_lvl(t_name,t_match,t_response,t_function,lvl)
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace,-1,0,"",t_function,12,lvl)
end
-- ����һ����ʱ�Ĵ����� 
function create_triggerex_f(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary,-1,0,"",t_function,12,100)
end
-- ����һ����ʱ��һ���Դ����� 
function create_triggerex(t_name,t_match,t_response,t_function )
      return AddTriggerEx(t_name,t_match,t_response,trigger_flag.Enabled+trigger_flag.RegularExpression+trigger_flag.Replace+trigger_flag.Temporary+trigger_flag.OneShot,-1,0,"",t_function,12,100)
end
-- ����һ����ʱ��һ���Զ�ʱ��
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
go_on_smy=0 --20161117���ӱ���go_on_smy���ؿ��� ��ֹϵͳ�������Զ�����Ħ��
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
pfm_xiangyun='��'
do_lost_again = tonumber(GetVariable('do_lost_again'))
shenqi_id=GetVariable('shenqi_id')
go_dp=0
drugBuy ={
["������Ϣ��"] = {"dali/yaopu","zhiye/yaodian1"},
["������Ϣ��"] = {"dali/yaopu","zhiye/yaodian1"},
["��Ϣ��"] = {"dali/yaopu","zhiye/yaodian1"},
["а����"] = {"dali/yaopu","zhiye/yaodian1"},
["������"] = {"dali/yaopu","zhiye/yaodian1"},
["������"] = {"dali/yaopu","zhiye/yaodian1"},
["������"] = {"dali/yaopu","zhiye/yaodian1"},
["������"] = {"dali/yaopu","zhiye/yaodian1"},
["��ʳ��"] = {"dali/yaopu","zhiye/yaodian1"},
["��ˮ��"] = {"dali/yaopu","zhiye/yaodian1"},
["��ҩ"] = {"dali/yaopu","zhiye/yaodian1"},
["�ƾ���"] = {"dali/yaopu","zhiye/yaodian1"},
["������"] = {"dali/yaopu","zhiye/yaodian1"},
["а����"] = {"dali/yaopu","zhiye/yaodian1"},
["����������"] = {"dali/yaopu","zhiye/yaodian1"},
["���߲�����"] = {"dali/yaopu","zhiye/yaodian1"},
["����������"] = {"dali/yaopu","zhiye/yaodian1"},
["������Ϣ��"] = {"dali/yaopu","zhiye/yaodian1"},
["���ɽ�ҩ"] = {"dali/yaopu","zhiye/yaodian1"},
["��Ѫ�ƾ���"] = {"dali/yaopu","zhiye/yaodian1"},
["�ⶾ��"] = {"dali/yaopu","zhiye/yaodian1"},
["�󻹵�"] = "city/dangpu",
["����"] = "xueshan/laifu",
["ţƤ�ƴ�"] = {"xiangyang/lzz/jiuguan"},

}

drugPoison={
["�Ż���¶��"] = true,
}

-- ain

local cun_hammer = tonumber(GetVariable("autocun_hammer"))
if cun_hammer==1 then 
	itemSave={
		["���콳����ƪ"] = true,
		["����������ƪ"] = true,
		["Τ��֮��"] = true,
		["������"] = true,
		["������"] = true,
			}
else
	itemSave={
		["���콳����ƪ"] = true,
		["����������ƪ"] = true,
		["Τ��֮��"] = true,
		["������"] = true,
		["������"] = true,
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
	 if l_type=='��' then
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
	if score.party=="��ͨ����" then
	   score.master="��ͨ����"
	end
end
score_check_xy=function(n,l,w)
    print('score_check_xy.........')
	score.xiangyun=Trim(w[1])  --����״̬�����������ܡ�ƽ��˥����
	score.xiangyun_score = tonumber(w[2])
	  if scorexy==false then
	     scorexy=smyteam*1
	  end
		if score.xiangyun=='˥' or score.xiangyun=='��' then
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
   l_char=del_string(l_char,'��')
   local l_cnt=trans(l_char)
   if w[3]=='��' then
      if w[1]=="ѩɽǿ����Ů" then
	     condition.xueshan=l_cnt * 60
	  end
	       if w[1]=="˫������" then
	     condition.ebook=l_cnt * 60
	  end
	       if w[1]=="����" then
	     condition.mingwu=l_cnt * 60
	  end
	  	   if w[1]=="��ʵ��Ұ" then
         condition.vpearl=l_cnt 
	  end
         if w[1]=="����" then
         vippoison=1
         condition.poison=l_cnt * 60
	  end
         if w[1]=="�����ܻ���" then
         vippoison=1
	  end
         if w[1]=="�����ƶ�" then
         vippoison=1
         condition.poison=l_cnt * 60
	  end
         if w[1]=="��צ��������" then
         condition.poison=l_cnt * 60
	  end
	  if w[1]=="����æ״̬" then
         condition.busy=l_cnt * 60
	  end
	  if w[1]=="�����ھֻ��ڵ���ʱ" then
         condition.hubiao=l_cnt * 60
	  end
--print(condition.poison,condition.busy)
   else
      if w[1]=="ѩɽǿ����Ů" then
	     condition.xueshan=l_cnt
	  end
	       if w[1]=="˫������" then
	     condition.ebook=l_cnt
	  end
	       if w[1]=="����" then
	     condition.mingwu=l_cnt
	  end
	       if w[1]=="��ʵ��Ұ" then
         condition.vpearl=l_cnt 
	  end
         if w[1]=="����" then
         vippoison=1
         condition.poison=l_cnt
	  end
         if w[1]=="�����ܻ���" then
         vippoison=1
	  end
         if w[1]=="�����ƶ�" then
         vippoison=1
         condition.poison=l_cnt
	  end
         if w[1]=="��צ��������" then
         condition.poison=l_cnt
	  end
	  if w[1]=="����æ״̬" then
         condition.busy=l_cnt
	  end
	  if w[1]=="�����ھֻ��ڵ���ʱ" then
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
    create_trigger_t('hpheqi1',"^�������ȡ�\\s*\\-?\\s*(\\d*)",'','hp_heqi_check')
    SetTriggerOption("hpheqi1","group","hpheqi")
    EnableTriggerGroup("hpheqi",false)
end
function test()
   Note("����Ŀ�ĵأ�")
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
   create_trigger_t('get_time_1',"^���Ѿ���������(\\D*)��",'','getgame_time') 
   create_trigger_t('get_time_2',"^�㹲�й���ۼ�ʱ��",'','closegame_time')

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
    create_trigger_t('get_time_1',"^���Ѿ���������(\\D*)��",'','getgame_time')
    SetTriggerOption("get_time_1","group","get_time")   
  
   
   wait.make(function()
       while true do
            exe('time')
	        local l,w = wait.regexp('^�����Чʱ�䣺',1)
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
	
	b = string.match(a,'(%D+)��')
	if b then 
	  --print(b)
	  game_time = trans0(b) * 60 * 60 * 24
	  a = string.gsub(a,b..'��',"")
	  --print(game_time)
	  --print(a)
	end
    
    b = string.match(a,'(%D+)Сʱ')
	if b then 
	  --print(b)
	  game_time = game_time + trans0(b) * 60 * 60 
	  a = string.gsub(a,b..'Сʱ',"")
	  --print(game_time)
	  --print(a)
	end	
	
	b = string.match(a,'(%D+)��')
	if b then 
	  --print(b)
	  game_time = game_time + trans0(b) * 60 
	  a = string.gsub(a,b..'��',"")
	  --print(game_time)
	  --print(a)
	end	
	
	b = string.match(a,'(%D+)��')
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
     --��Ϸʱ����� 0 �룬˵�����µ�¼
	 if (xuezhu_status=='2' and xuezhu_time == 10) or (xuezhu_status=='0' and xuezhu_time==-1) then 
	    --����ϴ�������ץ��ѩ��ģ���
		SetVariable('xuezhu_status','0')
	    SetVariable('xuezhu_time',-1)
		inwdj=0
	 elseif (xuezhu_status == '1' and xuezhu_time == -1) or (xuezhu_status=='3' and xuezhu_time==-1 ) then
	    --����ϴ���Ҫ��dan�����ǻ�δץ��ѩ��,���˳�����ģ�����Ƚϸ��ӣ����鲻����
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
      --- �Ѿ�ץ��ѩ������Ѿ���dan,��Ϊ��������robot
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
	create_trigger_t('get_payment_1',"^½��Ӣ˵�������ҽ���(\\D*)�������Ǯׯ",'','getpayment_finish')
	create_trigger_t('get_payment_2',"^½��Ӣ˵������ԭ����̨�㻹û�뿪����",'','getpayment_fail')
	SetTriggerOption('get_payment_1','group','get_payment')
	SetTriggerOption('get_payment_2','group','get_payment')
	
    wait.make(function()
	    wait.time(2)
		exe('ask lu about ���߽���')
	end)
end

function getpayment_finish(n,l,w)
    messageShow('��ȡ���һ���'..w[1]..'��ٺ»!!')
	SetVariable('getgold_age',tonumber(score.age))
	return checkPrepareOver()
end

function getpayment_fail(n,l,w)
    messageShow('��ȡ�һ���ٺ»ʧ�ܣ�֮ǰ�Ѿ���ȡ����!!')
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
	create_trigger_t('main',"^���齣\\D*��\\D*�Ѿ�����ִ����",'','login')
    ---create_trigger_t('main',"^���齣\\D*��\\D*�Ѿ�����ִ����(\\D*)Сʱ(\\D*)��(\\D*)��",'','login')
	---create_trigger_t('main222',"^���齣\\D*��\\D*�Ѿ�����ִ����(\\D*)��(\\D*)��",'','login')
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
    ---pumkmai add ��¼ʱ��¼һ��
	scrReloginLog()
    dis_all()
    DeleteTriggerGroup("login")
    create_trigger_t('login2',"^����������������ʶ������\\(passwd\\)��",'','login_passwd')
    SetTriggerOption("login2","group","login")
    local l_id=GetVariable("id")
    local l_passwd=GetVariable("passwd")
    Note(l_id,l_passwd)
    if l_id~=nil and l_passwd~=nil then
       Send(l_id)
       Send(l_passwd)
       Send('y')
	   
	   ---�������ʱ���ϵ��ж�,����ѩ��ı�����������������������½���
	   
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
    create_trigger_t('dz_count1','^>*\\s*���Ҳ��ܴ�������Ӱ�������Ϣ��','','hp_dz_where')
    create_trigger_t('dz_count2','^>*\\s*���޷���������������','','hp_dz_where')
    create_trigger_t('dz_count3','^>*\\s*(���ﲻ׼ս����Ҳ��׼������|����ɲ���������������ĵط���)','','hp_dz_where')
	create_trigger_t('dz_count4',"^(> )*�������ֽŴ�����������������ȷ������������",'','hp_dz_liaokao')
	create_trigger_t('dz_count5',"^(> )*(����Ҫ��������|���޷�������������|�㻹��ר�Ĺ����)",'','hp_dz_where')
	create_trigger_t('dz_count6',"^(> )*�����ھ��������޷�������Ϣ��������",'','loginerror')
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
	  Note('��Ѵ���ֵΪ��'..hp.dazuo)
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
      return go(VIPask,'���ݳ�','����')
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
    create_trigger_t('hp1',"^����Ѫ��\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*��������\\s*(\\d*)\\s*\\/\\s*(\\d*)\\((\\d*)\\)$",'','hp_jingxue_check')
    create_trigger_t('hp2',"^����Ѫ��\\s*(\\d*)\\s*\\/\\s*(\\d*)\\s*\\(\\s*(\\d*)\\%\\)\\s*��������\\s*(\\d*)\\s*\\/\\s*(\\s*\\d*)\\(\\+\\d*\\)$",'','hp_qixue_check')
    create_trigger_t('hp3',"^��ʳ�\\s*(\\d*)\\.\\d*\\%\\s*��Ǳ�ܡ�\\s*(\\d*)\\s*\\/\\s*(\\d*)$",'','hp_pot_check')
    create_trigger_t('hp4',"^����ˮ��\\s*(\\d*)\\.\\d*\\%\\s*�����顤\\s*(.*)\\s*\\(",'','hp_exp_check')
    create_trigger_t('hp5',"^��(��|��)����\\s*(.*)\\s*���������ޡ�\\s*(\\d*)\\s*\\/",'','hp_shen_check')
    create_trigger_t('hp7',"^(��)*\\s*(\\D*)\\s*\\((\\D*)(\\-)*(\\D*)\\)\\s*\\-\\s*\\D*\\s*(\\d*)\\/\\s*(\\d*)$",'','check_skills')
    create_trigger_t('hp8',"^>*\\s*��������Ҫ(\\D*)�������������",'','hp_dazuo_check')
    create_trigger_t('hp9',"^��(\\D*)����\\s*��\\s*(\\d*) ��\\s*�� ",'','checkJobtimes')
    create_trigger_t('hp10',"^��(\\D*)\\(\\D*\\)$",'','checkWieldCatch')
    create_trigger_t('hp11',"^(> )*������������(\\D*)����$",'','checkJoblast')
    create_triggerex_lvl('hp12',"^(> )*(\\D*)",'','resetWait',200)
    create_trigger_t('hp13',"^(> )*�㻹��Ѳ���أ���ϸ����������ɡ�",'','checkQuit')
    create_trigger_t('hp14',"^\\D*��һ�������ˡ�$",'','checkRefresh')
    create_trigger_t('hp15',"^(> )*һ�����ֹ�ȥ",'','checkMonth')
    --create_trigger_t('hp16',"^(> )*�������ʧ���ż�����(\\N*)�Σ��������ʧ���ż�����(\\N*)/(\\N*)�Ρ�",'','checkLLlost')
    create_trigger_t('hp17',"^(> )*��(�ʵ���ð���ǣ�ȫ������|����ͷ���ۻ���ֱð�亹)",'','checkQuit')
    --create_trigger_t('hp18',"^(> )*(����������ѵ��촽�������Ǻܾ�û�к�ˮ��|�����ȱˮ����ð����|ͻȻһ�󡰹�������������ԭ������Ķ����ڽ���)",'','jdeat')
    create_trigger_t('hp19',"^(> )*(��Ȼһ��̹ǵ��溮Ϯ�������е������ƶ�������|��Ȼһ�ɺ������Ʊ�����ѭ���ֱۣ�Ѹ�����׵��������ţ����еĺ���������)",'','checkDebug')
    create_trigger_t('hp20',"^(> )*��(����һ�Ż�Ѫ�ƾ�������ʱ�о���Ѫ������ʧ|����һ����Ϣ�裬��ʱ�������������˲���|����һ�Ŵ�����Ϣ�裬��ʱ�о���������|����һ�Ż�����Ϣ������ʱ�о�����ĵ����ӯ�˲���|����һ�����ɽ�ҩ����ʱ�о����ƺ��˲���|����һ�Ŵ󻹵���ʱ����Ȭ����Ѫ��ӯ)��",'','hpeatOver')
    create_trigger_t('hp21',"^(> )*��������� enable ѡ����Ҫ�õ������ڹ���",'','jifaOver')
    create_trigger_t('hp22',"^(> )*(\\D*)Ŀǰѧ��(\\D*)�ּ��ܣ�",'','show_skills')
    create_trigger_t('hp23',"^(> )*��ı������У�",'','show_beinang')
	--create_trigger_t('hp24','^(> )*������һ������\\D*����ߵ���һ��(\\D*)��','','fqyyArmorGet')
    --create_trigger_t('hp25','^(> )*�����һ��(\\D*)�С�','','fqyyArmorCheck')
	create_trigger_t('hp24','^(> )*������һ������\\D*����ߵ���һ(��|��|˫|Ϯ|��|��|��|��)(\\D*)(����|ѥ|����|����|����|����|ͷ��)��','','fqyyArmorGet')
    create_trigger_t('hp25','^(> )*�����һ(��|��|˫|Ϯ|��|��|��|��)(\\D*)(����|ѥ|����|����|����|����|ͷ��)��','','fqyyArmorCheck')
    create_trigger_t('hp26',"^(> )*(\\D*)��ʯ��¯���л�Ϊһ��\\D*���ڵ���,��������ս����ҡ�",'','refinekuang')
	create_trigger_t('hp27',"^(> )*(\\D*)��¯���±�����\\D*�ƽ����ڵ��ϡ�",'','zhudingkuang')
	create_trigger_t('hp28',"^(> )*��õ���һ��ʧ����ż㡣",'','checkBagsletter')
    create_trigger_t('hp30',"^(> )*(��ͻȻ����΢΢ͷ�Σ������������޷���������Ϣ)",'','eatdan')
	create_trigger_t('hp31',"^(> )*����\\(Imgxx\\)�����㣺stop!!!",'','stopJob')
	create_trigger_t('hp32',"^(> )*��ʹ��ȫ�������������е����Ӵ�������֦���ϣ�ʹ����ק��ק",'','useShengzi')
	
	---create_trigger_t('hp32',"^(> )*��ҥ�ԡ�ĳ�ˣ���˵���˿���������(\\D*)���֣�",'','find_cs_location')

	
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
    --create_trigger_t('score1',"^����    ����(\\D*)\\((\\D*)\\)\\s*����  ������(\\d*)\/(\\d*)��\\s*��  �ԣ���(\\d*)\/(\\d*)��",'','score_name_check')
	create_trigger_t('score1',"^����    ����(\\D*)\\((\\D*)\\)\\s*����  ������(\\d*)/(\\d*)��\\s*��  �ԣ���(\\d*)/(\\d*)��",'','score_name_check')
	
    --create_trigger_t('score2',"^��ͷ    �Σ�(\\D*)\\s*����  ������(\\d*)\/(\\d*)��\\s*��  �ǣ���(\\d*)\/(\\d*)��",'','score_title_check')
	create_trigger_t('score2',"^��ͷ    �Σ�(\\D*)\\s*����  ������(\\d*)/(\\d*)��\\s*��  �ǣ���(\\d*)/(\\d*)��",'','score_title_check')
	
    create_trigger_t('score3',"^����    �䣺(\\D*)��\\D*\\s*��    ����",'','score_age_check')
    create_trigger_t('score4',"^��(����æ״̬|ѩɽǿ����Ů|˫������|����|����|�����ƶ�|�����ܻ���|��צ��������|�����ھֻ��ڵ���ʱ|��ʵ��Ұ)\\s*(\\D*)(��|��)\\s*",'','score_busy_check')
    create_trigger_t('score5',"^��(��    ��|��    ��|��    ��)��(\\D*)\\s*ʦ\\s*�У���(\\D*)����(\\D*)��",'','score_party_check')
    create_trigger_t('score6',"^����    ��(\\D*)��\\s*����(\\D*)\\s* �㣺",'','score_gender_check')
    create_trigger_t('score7',"^��(��    ��|��    ��|��    ��)��(\\D*)\\s*ʦ\\s*�У���(��ͨ����)��(\\D*)",'','score_party_check')
    create_trigger_t('score9',"^��ע    �᣺(\\D*)\\s*Ǯׯ��(\\D*)",'','score_gold_check')
    create_trigger_t('score8',"^��Ŀǰ�Ĵ�������ǣ�(\\D*)���ƽ�",'','checkGoldLmt')
    create_trigger_t('score10','^���������ԣ�\\d*.*���ࣺ(\\D*)\\((\\d*)\\)\\s*��','','score_check_xy')
    create_trigger_t('score11','^���齣ͨ����(\\N*)\\s*�齣Ԫ����(\\N*)\\s*�����ң�(\\N*)\\s*��','','score_tb_check')
    create_trigger_t('score12',"^�������Ѿ�ʹ�þ�Ӣ֮��(\\D*)�Ρ�",'','score_ebook_check')
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
    create_trigger_t('lingwu1',"^>*\\s*(��ֻ�ܴ����⼼��������|�㲻�����ּ��ܡ�|��Ҫ����ʲô��)",'','lingwu_next')
    create_trigger_t('lingwu2',"^>*\\s*���ʵս�еõ���Ǳ���Ѿ������ˡ�",'','lingwu_finish')
    create_trigger_t('lingwu3',"^>*\\s*���\\D*�������޷��������һ��Ļ���",'','lingwu_next')
    create_trigger_t('lingwu9',"^>*\\s*�������ڵĻ����ڹ���Ϊ�����޷���������ڹ���",'','lingwu_next')
    create_trigger_t('lingwu5',"^>*\\s*����ʵս���鲻�㣬�谭����ġ�\\D*������",'','lingwu_next')
    create_trigger_t('lingwu6','^>*\\s*��� "action" �趨Ϊ "����������Ǻð������Ǻã�" �ɹ���ɡ�','','lingwu_goonpre')
    create_trigger_t('lingwu7',"^>*\\s*�������������",'','lingwu_finish') 
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
   Bag['����']=nil
end

function jifaOver()
    exe('jifa all')
end
function checkDebug()
	messageShow('���ж���!')
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
  if string.find(l,"����һ�����ɽ�ҩ����ʱ�о����ƺ��˲���") then
	   cty_cur = cty_cur - 1
	end
	 if string.find(l,"����һ����Ϣ�裬��ʱ�������������˲���") then
           nxw_cur = nxw_cur - 1
        end
        if string.find(l,"����һ�Ŵ�����Ϣ�裬��ʱ�о���������") then
           cbw_cur = cbw_cur - 1
        end
        if string.find(l,"����һ�Ż�����Ϣ������ʱ�о�����ĵ����ӯ�˲���") then
           hqd_cur = hqd_cur - 1
        end
	if string.find(l,"����һ�Ż�Ѫ�ƾ�������ʱ�о���Ѫ������ʧ") then
	   DeleteTimer("eatdan")
	   hxd_cur = hxd_cur - 1
	end
	if string.find(l,"����һ�Ŵ󻹵���ʱ����Ȭ����Ѫ��ӯ") then
	   messageShow('�Դ󻹵��ˣ�')
	   dhd_cur = dhd_cur - 1
	end
end

function checkQuit()
  dis_all()
	check_halt(BQuit)
        exe('drink jiudai')
end
function BQuit()
  exe('set ѩ�� no;set ץѩ�� no;quit')
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
	       local l,w = wait.regexp('^(> )*��ǰ��û�б��ж�Ϊ�����ˡ�$',1)
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
    return go(dhvpearl,'���ݳ�','����')
end

function Govpearlnew()
     wait.make(function()
	    await_go('���ݳ�','����')
		while true do
		    exe('duihuan vpearl')
			local l,w = wait.regexp("^(> )*�㽫����֮���������飬���ӻ�Ϊһ�������������������",1)
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
    messageShow('��ʼ����!!!!!!!') 
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
    exe('nick ���������ĦԺ���')
    messageShow('ȥ��������')
	jifaAll()

    go(lingwu_unwield,'��ɽ����','��ĦԺ')
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
  go(lingwu_goon,'��ɽ����','��ĦԺ���')
end
function lingwuSleep()
  if score.gender=='��' then
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
    if locl.room~="��ĦԺ���" then
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
	      if hp.exp>20000000 or score.gender=='��' then
	         return go(lingwu_eat,'�䵱ɽ','��ͤ')
	      else
	         return lingwuSleep()
	      end
		 end
       yunAddInt()
       flag.idle=nil
       exe('yun jing;#5(lingwu '..skill..')')
       exe('alias action ����������Ǻð������Ǻã�')
       create_timer_s('walkWait4',0.5,'lingwu_alias')
       --return check_bei(lingwu_alias,1.8)
	   
	 
	 
end
function lingwu_eat()
   if locl.room=="��ͤ" then
   flag.food=0
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao')
   check_bei(lingwu_go)
    else
       return go(lingwu_eat,'�䵱ɽ','��ͤ')
    end
end
function lingwu_alias()
    exe('alias action ����������Ǻð������Ǻã�')
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
    messageShow('�����������')
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
--������ɺ󣬼�һ����ϰ
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
    create_trigger_t('xuexi1',"^(> )*��(\\D*)".. score.master .."(\\D*)ָ��",'','xuexiAction')
    create_trigger_t('xuexi2',"^(> )*��������æ���ء�",'','xuexiAction')
    create_trigger_t('xuexi3',"^(> )*�����̫���ˣ����ʲôҲû��ѧ����",'','xuexiSleep')
    create_trigger_t('xuexi4',"^(> )*(������|�㲻����ѧϰ��ϲ����|����ѧ|�㲻����ѧϰ|��Ļ��������δ��|�㲻�������|���̫��ȭ���̫ǳ|������Ѩ���˻Ƶ����Ҵ���ѧ|������Ѩ���˶�������ʦ������ѧ|������ԣ��޷�|���\\D*(����|����|��)����|��ɽ������ô�ݵ�|��һ������ү��|���Ѿ��޷����|��Ļ�������̫��|���а��̫��|�����һ���|��ת����ֻ��ͨ�����������|ѧ��ֻ��ѧ��������|����������ʿ|ֻ�д����֮��|�㲻������������|�㲻����ѧϰ����ѧ|����ѧֻ�ܿ��ж�|��Ķ���д��|��������ֻ��ͨ����ϰҽѧ|��Ļ��������δ��|���ŷ�ɮ������|�������ֻ��ͨ������ѧϰ��ʵս|��������Ѿ��޷�ͨ��ѧϰ|���������±����ұ���ѧ��|�����ȥѧ��ѧϰ����д��|Ҳ����ȱ��ʵս����|���(��˷�|�����ķ�)��Ϊ����|�������ĳ̶��Ѿ�������ʦ��)",'','xuexiNext')
    create_trigger_t('xuexi5',"^(> )*��û����ô��Ǳ����ѧϰ",'','xuexiFinish')
    create_trigger_t('xuexi6',"^(> )*��Ҫ��˭��̣�",'','xuexiFinish')
    create_trigger_t('xuexi7',"^(> )*��ġ�(\\D*)�������ˣ�",'','xuexiLvlUp')
    create_trigger_t('xuexi8',"^(> )*����ö�̫��ȭ���������",'','xueAskzhang')
    create_trigger_t('xuexi9',"^(> )*Ǭ����Ų��ֻ��ͨ����ϰ��Ǭ����Ų���ķ��������������",'','taoJiaozhang')
    create_trigger_t('xuexi10',"^(> )*(�������б���|�����ֲ�����|���ַ�����ϰ|���������|����ʱ�޷���|��ʹ�õ���������|ȴ�е�����̫���Ծ�|��\\D*����|ѧ\\D*����|\\D*���ﲻ����������)",'','xueWeapon')
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
     print('����ʱ�䲻ѧϰ��ֻ������...............................')
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
     exe('nick ������ѧϰ')
	messageShow('������ѧϰ')
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
	      ColourNote ("white","blue","δ�ҵ�ʦ��סַ������ϵPTBX���£�")
	      return xuexiFinish()
	   end
    else
	   return xuexiFinish()
    end
end 
function xuexiCheck() 
    checkWield()
    if locl.id[score.master] then
	   if score.party and score.party=="������" and score.master=="������ɮ" and skills["buddhism"] and skills["buddhism"].lvl==200 then
	      exe('ask wuming about ��')
	   end
       return check_bei(xuexiStart)
    else
	   ColourNote ("white","blue","ʦ�����ڼң�������ֵ�ַ�д�����ϵPTBX���£�")
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
	
	---pumkmai����
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
	print('ѧϰ����:'..master.times)
    exe('hp')
end
function taoJiaozhang()
  EnableTriggerGroup("xuexi",false)
  print('��С��Ǭ����Ų��')
      wait.make(function() 
       wait.time(1)
       exe('#5 taojiao qiankundanuoyi;yun jing')
       end)
    check_busy(xuexiContinue)
end
function xueAskzhang()
    EnableTriggerGroup("xuexi",false)
	print('������̫��ȭ��')
      wait.make(function() 
       wait.time(1)
       exe('ask zhang about ̫��ȭ��')
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
    if score.party and score.party=="������" then
       return go(xuexiSleepOver,"������","����")
    end
    if score.party and score.party=="������" then
       return go(xuexiSleepOver,"shaolin/sengshe3","")
    end
    if score.party and score.party=="�һ���" then
        if score.master and score.master=="��ҩʦ" then
	   return go(xuexiSleepOver,"�һ���","�ͷ�")
        else
           return go(xuexiSleepOver,"����ׯ","�ͷ�")
        end
    end
	if score.master and score.master=="���" then
	   return go(xuexiSleepOver,"gumu/jqg/wshi","")
    end
	if score.master and score.master=="С��Ů" then
	   return go(xuexiSleepOver,"gumu/jqg/wshi","")
    end
	if score.party and score.party=="�䵱��" and score.gender=='Ů' then
       return go(xuexiSleepOver,"�䵱ɽ","Ů��Ϣ��")
    end
	if score.party and score.party=="�䵱��" and score.gender=='��' then
       return go(xuexiSleepOver,"�䵱ɽ","����Ϣ��")
    end
	if score.party and score.party=="������" then
       return go(xuexiSleepOver,"dali/wangfu/woshi2","")
    end
	if score.party and score.party=="����Ľ��" then
       return go(xuexiSleepOver,"����Ľ��","�᷿")
    end
	if score.party and score.party=="������" then
       return go(xxSleepcheck,"���޺�","��ң��")
    end
	if score.party and score.party=="������" then
       return go(xuexiSleepOver,"����ɽ","��Ϣ��")
    end
	if score.party and score.party=="��ɽ��" and score.gender=='��' then
       return go(xuexiSleepOver,"��ɽ","����Ϣ��")
    end
	if score.party and score.party=="��ɽ��" and score.gender=='Ů' then
       return go(xuexiSleepOver,"��ɽ","Ů��Ϣ��")
    end
	if score.party and score.party=="���ư�" and score.gender=='��' then
       return go(xuexiSleepOver,"����ɽ","����Ϣ��")
    end
	if score.party and score.party=="���ư�" and score.gender=='Ů' then
       return go(xuexiSleepOver,"����ɽ","Ů��Ϣ��")
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
       messageShow('ѧϰ��ϣ�')
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
    exe('nick ѧϰ����д��')
       messageShow('ѧϰ����д�֣�')
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
    --go(literateCheck,'���ݳ�','��Ժ')
	go(literateNeili,'���ݳ�','��Ժ')
end

function literateNeili()
     zhunbeineili(literateCheck)
   
end

function literateCheck()
    print('literateCheck....')
    DeleteTriggerGroup("litxuexi")
    create_trigger_t('litxuexi1',"^(> )*����������������һ�����������������ƣ���ʱ�޷��ٽ��޸������ѧ���ˡ���",'','litxuexiover')
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
    if not locl.id["������"] then
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
       messageShow('����д��ѧϰ��ϣ�')
	   weapon_unwield()
	   local leweapon=GetVariable("learnweapon")
	   exe('unwield '..leweapon)
    exe('hp;score;cha;yun jing;yun qi;yun jingli')
	dis_all()
    return check_busy(check_food)
end

function duanzao()
    exe('nick ѧϰ����')
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
    return go(duanzaoCheck,'���ݳ�','������')
end
function duanzaoCheck()
    flag.idle = nil
    exe('score;hp;cha')
    checkBags()
    return checkWait(duanzaoXue,0.8)
end
function duanzaoXue()
    if not locl.id["����ʦ"] then
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
    if Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt>30 and hp.pot>master.times-1 then
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
    exe('nick ѧϰ֯��')
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
    return go(zhizaoCheck,'�����','�÷��')
end
function zhizaoCheck()
    flag.idle = nil
    exe('score;hp;cha')
    checkBags()
    return checkWait(zhizaoXue,0.8)
end
function zhizaoXue()
    if not locl.id["�ϲ÷�"] then
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
    if Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt>30 and hp.pot>master.times-1 then
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
        if w[2] == '��' then
                return check_busy(function() exe("refine tiekuang shi") end)
        elseif w[2] == '��' then
                return check_busy(function() exe("refine jinkuang shi") end)
        elseif w[2] == '��' then
                return check_busy(function() exe("refine yinkuang shi") end)
        elseif w[2] == 'ͭ' then
                return check_busy(function() exe("refine tongkuang shi") end)
        end
end
function zhudingkuang(n,l,w)
  if w[2] == '������' then
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
    return go(wuxingzhenCheck,'������','�Է�')
end
function wuxingzhenCheck()
    if locl.id["�·�ɽ"] then
       return wuxingzhenStart()
    else
       local l_cnt=table.getn(getRooms('�Է�','������'))
       flag.times = flag.times + 1
       if flag.times > l_cnt then
          return wuxingzhenFinish()
       else
          local l_sour=getRooms('�Է�','������')[flag.times-1]
	      return go(wuxingzhenCheck,'������','�Է�',l_sour)
       end
    end
end
function wuxingzhenStart()
    exe('yun jing')
	exe('ask wen fangshan about ������')
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
    if not locl.id["�·�ɽ"] or hp.pot<10 then 
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
   
    if Bag["����"] then
	   return tiaoshui()
	end
	
    if Bag and Bag["����"] and Bag["����"].cnt and Bag["����"].cnt>500 then
       return check_gold()
    end
    if (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt<count.gold_max and score.gold>count.gold_max) or (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt>count.gold_max*4) then
      return check_gold()
	end
	if score.gold and score.gold>100 and nxw_cur<5 and drugPrepare["��Ϣ��"] then
       return checkNxw()
    end
        if score.gold and score.gold>100 and cbw_cur<5 and drugPrepare["������Ϣ��"] then
       return checkNxw()
    end
	
	 ---print('checkPrepare.............................111111111')
        
    if score.gold and score.gold>100 and hqd_cur<5 and drugPrepare["������Ϣ��"] then
	    ---print('checkPrepare.............................222222222')
       return checkNxw()
    end
	  ---print('............'..cty_cur..'..........................................yao')
	  if score.gold and score.gold>100 and cty_cur<5 and drugPrepare["���ɽ�ҩ"] then
	  ---print('buy chy.........?')
	  ---print('cty_cur'..cty_cur)
       return checkHxd()
    end
	
	
	
	--[[if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["а����"] or Bag["а����"].cnt<2) then
       return checkXqw()
	end
	
	if job.zuhe["wudang"] and job.zuhe["xueshan"] and job.last=="wudang" and (not Bag["������"] or Bag["������"].cnt<2) then
       return checkZqd()
	end
	
	if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["а����"] or Bag["а����"].cnt<2) then
       return checkXqw()
	end
	
	if job.zuhe["huashan"] and job.zuhe["xueshan"] and job.last=="huashan" and (not Bag["������"] or Bag["������"].cnt<2) then
       return checkZqd()
	end]]
	
	if not flag.item then
       if score.party and score.party=="������" and not Bag["����"] then
          return check_item()
	   end
       if score.party=="������" and not Bag["����"] and not Bag["����"] then
	      return check_item()
	   end
	end
	
	---print('test000000000000')
	
	if not Bag["����"] and drugPrepare["����"] then
       ---return checkFire()
	   return checkFireNew()
    end
	
	---print('test111111111')
	
	if not Bag["ţƤ�ƴ�"] and drugPrepare["ţƤ�ƴ�"] then
       return checknpjd()
    end
		if score.gold and score.gold>100 and hxd_cur<3 and drugPrepare["��Ѫ�ƾ���"] then
       return checkLjd()
    end

	if score.tb and score.tb>100 and dhd_cur<1 and drugPrepare["�󻹵�"] then
       return checkdhd()
    end
    
	---print('test44444444')
	
	for p in pairs(weaponPrepare) do
	    
		if p=='ʯ��' and (not Bag['ʯ��'] or Bag["ʯ��"].cnt<20) and Bag["�ƽ�"].cnt>3 then
		    return checkWeapon('ʯ��')
		end
	
	    if weaponStore[p] and not Bag[p] and Bag["�ƽ�"].cnt>3 then
		   return checkWeapon(p)
		end
		
		if weaponFunc[p] and not Bag[p] then
		   return _G[weaponFuncName[p]]()
		end
	    if  weaponPrepare["����"] and Bag["ö����"].cnt<100 then
		   return checkWeapon("����")
		end
	end
	local l_cut = false
	for p in pairs(Bag) do
	    if weaponKind[Bag[p].kind] and weaponKind[Bag[p].kind]=="cut" then
		   l_cut = true
		end
	end
	
	---print('test55555555555')
	
	if not l_cut and not Bag["ľ��"] then
	   weaponPrepare["ľ��"] = true
	   return checkWeapon("ľ��")
	end
	 
	if Bag["Τ��֮��"] then
	  	 return checkHammer()
		end
		
		
	local autoGetJinHe = tonumber(GetVariable('autoGetJinHe'))
	
	if Bag["����"].cnt > 0 and autoGetJinHe==1 then 
	   --print('�Զ�ȡ����...')
	   return autojinheTrigger()
	end
	
	---print('test----------------')
	
     local l_cnt=Bag["ҼǪ����Ʊ"].cnt
    if Bag['ҼǪ����Ʊ'] and l_cnt>0 then 
       return checkcash()
    end
	
	---print('test666666666666')
 
   --[[ if not Bag["������С������ƽ�"] or not Bag["����̫����"] or not Bag["��ˮ�޼���"] then    
	    print('test999999999')
	   return weapon_lose()
    end ]]--
	
    for p in pairs(weaponPrepare) do
	  print('1111111111='..p)
      if p ~= 'ʯ��' then 
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
	    --if Bag[p].id and Bag[p].id["yu"] and string.find(p,"��") then
		--   return checkYu(p)
		--end
		  if Bag[p].id and Bag[p].id["jintie chui"] and string.find(p,"������") then
		   return checkYu(p)
		end
		  if Bag[p].id and Bag[p].id["shentie chui"] and string.find(p,"������") then
		   return checkYu(p)
		end
    end
	---drop ��Ҫ��
	weapondrop()
	
	exe('wear all')
	---�������
	print('�������...............')
	check_goldage()
	
	----print('xuezhu_require........'..xuezhu_require)
	print('���xuezhu...............')
	if xuezhu_require==1 then
           if GetVariable("xuezhu_status")~=nil and GetVariable("xuezhu_status")=='2' then
               SetVariable("xuezhu_status","0") --����֮���ʼ���Զ�ץѩ�����Ϊ0
           end
           if GetVariable("xuezhu_status")~=nil and GetVariable("xuezhu_status")=='1' then
              SetVariable("xuezhu_status","-1") --�������Ҫ���浤��δ��ѩ�룬����֮���ʼ���Զ�ץѩ�����Ϊ-1
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
      print('����ȥ��ٺ»�ˣ�����')
      return go(get_payment,"����ׯ","ǰ��")
   else
      print('֮ǰ�Ѿ����ٺ»�ˣ���')
	end 
	
	if not Bag["����"] then
	   print('û�н���....gogogogo')
	   return checkJinChai()
	end	
	
	if not Bag["����"] or Bag["����"].cnt > 1  then
	   print('����....gogogogo')
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
   print('��ѧϰ���Ǽ���������������')
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
  go(letterLostBegin,"��ɽ","��̳")
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
	       local l,w = wait.regexp('^(> )*��ǰ��û�б��ж�Ϊ�����ˡ�$',1)
		   if l~= nil then break end
	   end
       --print('condition.vpearl=:'..condition.vpearl)
	   if needvpearl==1 and (condition.vpearl==0 or not condition.vpearl)then
           ---return Govpearl()
		   Govpearlnew()
       end
	   
   
  -- create_trigger_t('lostletter1',"^(> )*�����ҳ(\\N*)�鿴�����ˡ�$",'','getUrl')
   
       if lostletter==1 then
	      wait.make(function()
		      while true do
			     exe('chakan letter;look letter')
				 local l,w = wait.regexp("^(> )*�����ҳ(\\N*)�鿴�����ˡ�$",1)
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
   f:close() --�ر���
   
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
    ---create_trigger_t('lostletter1',"^(> )*�����ҳ(\\N*)�鿴�����ˡ�$",'','goMark')
	--create_trigger_t('lostletter1',"^(> )*�����ҳ(\\N*)�鿴�����ˡ�$",'','getUrl')
    create_trigger_t('lostletter2',"^(> )*����˲�ע�⣬͵͵��ʧ����ż��ӽ���·�ߵĲݴԡ�$",'','sendOk')
    create_trigger_t('lostletter3',"^(> )*�ŷ��ϵ��ּ�ģ�����壬��֪�������䵽�˴���$",'','sendOk')
    create_trigger_t('lostletter4',"^(> )*�㽫ʧ����ż㽻��",'','sendOk')
    create_trigger_t('lostletter5',"^(> )*����������д�������˵����֡�$",'','lookXin')
    create_trigger_t('lostletter6',"^(> )*���ٿ����һ�㡣$",'','letterLostBegin')
    create_trigger_t('lostletter7',"^(> )*�ŷ���д�ţ�(\\D*)\\((\\D*)\\)",'','lostName')
	  --create_trigger_t('lostletter8',"^[> ]*��������������(\\D*)һ�����֡�$",'','get_lost_locate')
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
     print('��ʼ��дʧ���ż�����ID')
	 print(ll_url)
     --local m_cmd=w[2]
	 local m_cmd = ll_url
     --OpenBrowser (m_cmd)
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
    --return Markletter()
     create_timer_s('llwait',1.0,'llwait')
 end
 function llwait()
    local f = io.open("plugs\\LLOUT.ini","r")
    local s = f:read()
   
    f:close() --�ر���
  
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
      l_result=utils.inputbox ("�����ż�����ID������������discard��", "lostname", GetVariable("lostname"), "����" , "12")
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
	 --mousedown_lostletter()--����ˢ�µص�
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
	       local l,w = wait.regexp('^(> )*��ǰ��û�б��ж�Ϊ�����ˡ�$',1)
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
		   --await_go('���ݳ�','����')
		   --dhvpearl()
		   --exe('duihuan vpearl;cond')
		   
		   Govpearlnew()
        end
		
		while true do 
		   wait.time(0.5)
		   exe('jobtimes')
		   local l,w = wait.regexp('(> )*�������ʧ���ż�����(\\N*)�Σ��������ʧ���ż�����(\\N*)/(\\N*)�Ρ�',1)
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
                print('����ʧ�����10�Σ�')
                lostno=lostno+10
                dis_all()
				await_go('���ݳ�','����')
				exe('duihuan pcert')
                --return go(dhlost,'���ݳ�','����')
            else
                needdolost=0
                print('�ر���LL')
            end    
        end
		
	    sendOk_fix()
        return check_food()
	end)
		
	
end



function check_xuexi()
  print('check_xuexi...............needxuexi=='..needxuexi)
  if MidHsDay[locl.time] and score.master=='������' then
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
          ["�䵱����"] = "wudang",
	  ["��������"] = "songxin",
	  ["ǿ����Ů"] = "xueshan",
	  ["�Ͷ�����"] = "huashan",
	  ["���ְ�"]   = "clb",
	  ["��ػ�"]   = "tdh",
	  ["��ɽ����"] = "songshan",
	  ["ؤ������"] = "gaibang",
	  ["��Ħ�¿�������"] = "songmoya",

    }

    if joblast[w[2]] then
       job.last = joblast[w[2]]
    end
end

function check_job()
   print('check_job.........')
   if xcexp==0 and hp.exp<1000000 then
      print('Ѳ�ǵ�1M')
      kdummy=0
      return xunCheng()
   end
   if xcexp==1 and hp.exp<2000000 then
      print('Ѳ�ǵ�2M')
      kdummy=0
      return xunCheng()
   end
   create_triggerex_lvl('dmlflag1','^(> )*���������š���Ҿ������ʼ�ˣ�','','dml_on',95)
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
          ColourNote('orange','black','δ��⵽����¥��¼��׼�����е���¥������')
              return dml_check()
           else
              local s = f:read()
              f:close()
              if s ~= os.date("%Y%m%d%H") then                          --��log
                     if os.date("%Y%m%d%H") - s >= 100 then                 --������һ�ξ���������24Сʱ
                            ColourNote('lime','black','�ҵ�'..s..'����¥��¼������Ϊ���졣׼�����е���¥������')
                        return dml_check()                     
                 else
                        ColourNote('white','red','�ҵ�'..s..'����¥��¼��ʱ�������㡾','yellow','black','24','white','red','��Сʱ����������¥������')
                     end
              end
           end
        end
   ]]--
   if score.party=="�һ���" and (hp.shen>150000 or hp.shen<-150000) then
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
   --return go(test,"���ݳ�","����")
   
       wait.make(function()
           await_go("���ݳ�","����")
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
     if job.zuhe["zhuoshe"] and score.party~="ؤ��" then job.zuhe["zhuoshe"]=nil end
     if job.zuhe["sldsm"] and score.party~="������" then job.zuhe["sldsm"]=nil end
     if job.zuhe["songmoya"] and hp.exp<5000000 then job.zuhe["songmoya"]=nil end
     if smydie*1>=smyall*1 then job.zuhe["songmoya"]=nil end
     if job.zuhe["husong"] and (score.party~="������" or hp.exp<2000000) then job.zuhe["husong"]=nil end
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
		if locl.weekday=='��' and locl.hour==7 and locl.min>=58 then 
		    --��������
			SetVariable('worship_done','0')
	        return reboot_prepare()
		elseif locl.weekday=='��' and locl.hour==11 and locl.min>=20 and locl.min<=30 and worship_done==0 then 
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
   if countTab(job.zuhe) > 2 and not skills["xixing-dafa"] and job.zuhe["huashan"] and job.zuhe["wudang"] and jobtimes["��ɽ����Ⱥ�Ͷ�����"] and jobtimes["�䵱��Զ��ɱ����"] then
	  local t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
	  local t_wd = jobtimes["�䵱��Զ��ɱ����"]
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
   if score.party and score.party=="��ɽ��" and countTab(job.zuhe) > 2 and not skills["dugu-jiujian"] and job.zuhe["huashan"] and job.zuhe["songxin"] then
	  local t_hs,t_sx,t_gb 
	  
	  if jobtimes["��ɽ����Ⱥ�Ͷ�����"] then
	     t_hs = jobtimes["��ɽ����Ⱥ�Ͷ�����"]
	  else
	     t_hs = 0
	  end
	  if jobtimes["����������������"] then
	     t_sx = jobtimes["����������������"]
	  else 
	     t_sx = 0
	  end
	  if jobtimes["ؤ���ⳤ��ɱ������"] then
	     t_gb = jobtimes["ؤ���ⳤ��ɱ������"]
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
	create_trigger_t('lianlian_1',"^(> )*�㷴����ϰ���߽���������˲��ٽ���",'','lianlian')
	create_trigger_t('lianlian_2',"^(> )*����������������߽���",'','lianlian_finish')
	create_trigger_t('lianlian_3',"^(> )*�����ʹ�ý��߽����ܽ�һ����ϰ��Ľ��߽�����",'','lianlian_finish')
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
	
	if score.party and score.party=="�һ���" then
	    --exe('bei none;jifa sword yuxiao-jian;jifa dodge suibo-zhuliu;jifa leg xuanfeng-tui;jifa strike luoying-zhang;jifa hand lanhua-shou;jifa finger tanzhi-shentong;jifa parry yuxiao-jian;bei hand')
        exe('bei none;jifa all;jiali 1;bei hand') 	--------�������޸ģ����һ���ǹ������Ӻ��bei��
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
       if score.party=="������" and skills["hand"] and skills["jieshou-jiushi"] then
          --exe('bei none;jifa hand jieshou-jiushi;bei hand')
	      return "jieshou-jiushi"
       end
       if score.party=="ؤ��" and skills["strike"] and skills["xianglong-zhang"] then
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
        local l, w = wait.regexp('^(> )*(�������Ѿ����|����׼����һ�ּ�����|�����ٲ���������ȭ�ż��ܵ�����֮һ|�������Ѿ�׼�������⼼����)',1)
        if l ~= nil then break end
        wait.time(0.4)
    end
end


function check_busy(func,p_cmd)
         disWait()
         DeleteTriggerGroup("check_bei")
         create_trigger_t('check_bei1',"^(> )*(�������Ѿ����|����׼����һ�ּ�����|�����ٲ���������ȭ�ż��ܵ�����֮һ|�������Ѿ�׼�������⼼����)",'','beiok')
         create_trigger_t('check_bei2',"^(> )*������û�м����κ���Ч���⼼�ܡ�",'','beinone')
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
         create_trigger_t('check_halt1',"^>*\\s*(�����ڲ�æ��|���������һԾ������սȦ�����ˡ�)",'','haltok')
         create_trigger_t('check_halt2',"^>*\\s*�����ں�æ��ͣ��������",'','halterror')
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
	if locl.room=="ϴ��ر�" then
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
         create_trigger_t('check_busy1',"^>*\\s*û������������࣬��",'','busyok')
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
   create_trigger_t('checkwait1','^(> )*��� "action" �趨Ϊ "�ȴ�һ��" �ɹ���ɡ�$','','checkWaitOk')
   SetTriggerOption("checkwait1","group","checkwait")
   EnableTriggerGroup("checkwait",true)
   EnableTrigger("hp12",true)
   waithook=func
   if sec == nil then sec=5 end
      return create_timer_s('waitimer',sec,'wait_timer_set')
end
function wait_timer_set()
   --EnableTriggerGroup("checkwait",true)
   exe('alias action �ȴ�һ��')
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
   create_trigger_t('checknext1','^(> )*��� "action" �趨Ϊ "����ǰ��" �ɹ���ɡ�$','','checkNextOk')
   SetTriggerOption("checknext1","group","checknext")
   EnableTriggerGroup("checknext",true)
   EnableTrigger("hp12",true)
   nexthook=func
   next_timer_set()
   return create_timer_s('nextimer',0.5,'next_timer_set')
end
function next_timer_set()
   exe('alias action ����ǰ��')
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
              messageShow(v..' '..'�趨ʱ��:'..GetTimerInfo(v, 3)..'�룬��һ��ʱ��:'..GetTimerInfo(v, 13)..'�롣')
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
        local _, _, wan, other = string.find(num, "^(.-)��(.*)$")
        local result = 0
        if wan then
                result = result + trans0(wan) * 10000
                num = other
        end
        result = result + trans0(num)
        return result
end

function trans0(num)
        num = string.gsub(num,"^ʮ(.*)$","һʮ%1")
        num = string.gsub(num,"��ʮ","һʮ")
        num = string.gsub(num,"��","")
        local result = 0
        local numbers = {"һ","��","��","��","��","��","��","��","��"}
        for k,v in pairs(numbers) do
                num = string.gsub(num,v,k)
        end
        local units = {["0|"] = "ʮ", ["00|"] = "��", ["000|"] = "ǧ"}
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
	print('������Ħ�������У���ǰ����������'.. smydie ..'���Σ��趨ɱ����ʿ��������Ϊ��'.. smyteam ..'���顣��������Ϊ�ڡ�'.. yptteam ..'���顣')
	exe('flatter')
	return
	end
	if job.name=='husong' then
	exe('aq')
	print('���ڻ���������')
	return
	end
	if job.name=='refine' then
	exe('admire2')
	print('����������ʯ��')
	return
	end
	
	if (job.name=='wudang' or job.name=='huashan' or job.name=='xueshan') and locl.room=='������' and locl.area=='�����' and locl.room_relation=='��ջ���̨I������----������----������Ժ������' then 
	    exe('papaya')
	    print('�����������....')
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
      if dest.area=='����ɽ' or dest.area=='��ĦԺ���' then 
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
      chats_log("ROBOT �����ѷ���".. flag.idle/2 .."����!","deepskyblue")
	  return
   end
   locate_flag=1
   scrLog()
   dis_all()
   inwdj=0
   chats_locate('��λϵͳ������8���Ӻ��ڡ�'.. locl.area .. locl.room ..'����������ϵͳ��','red')
   Disconnect()
   Connect()
   --SetEchoInput(true)
end

function test_switch()
    local test_flag = tonumber(GetVariable('test_flag'))
	if test_flag==0 then 
	    SetVariable('test_flag',1)
		Note('����ģʽ��......................��')
	else
	    SetVariable('test_flag',0)
		Note('����ģʽ�ر�......................�ر�')
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
   create_trigger_t('Yaobags1','^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(','','checkBagsMoney')
   create_trigger_t('Yaobags2','^(> )*��� "action" �趨Ϊ "���ҩƷ" �ɹ���ɡ�$','','checkYaoBagsOver')
   create_trigger_t('Yaobags3','^(> )*(\\D*)��ʧ����ż�','','checkBagsletter')
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
   Bag["�ƽ�"].cnt=0
   Bag["����"].cnt=0
   tmp.yaobags=func
   exe('i;look bei nang')
   exe('alias action ���ҩƷ')
   create_timer_s('checkYaoBags_timer',1.0,'checkYaoBags_test')
   
end
function checkYaoBags_test()
   exe('alias action ���ҩƷ')
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
  if not Beinang then Beinang={"��"} end
  for i = 1,#Beinang do
	    if Beinang[i] == "" or Beinang[i] == nil then
	        Beinang[i] = "���ݶ�ʧ" 
	    end
	    local l_name = Beinang[i]
        if string.find(l_name,"���ɽ�ҩ") then
	       cty_cur = trans(Beinang[i])
	       print('ctw....count..................................'..cty_cur)
	    end
        if string.find(l_name,"��Ϣ��") then
            nxw_cur = trans(Beinang[i])
        end
        if string.find(l_name,"������Ϣ��") then
            cbw_cur = trans(Beinang[i])
        end
        if string.find(l_name,"������Ϣ��") then
            hqd_cur = trans(Beinang[i])
        end
	    if string.find(l_name,"��Ѫ�ƾ���") then
	       hxd_cur = trans(Beinang[i])
	    end
	    if string.find(l_name,"�󻹵�") then
	       dhd_cur = trans(Beinang[i])
	    end
	    if string.find(l_name,"����ʯ") then
	       print('tks...'..Beinang[i])
	       kuang_cur = trans(Beinang[i])
	    end
	--print(cty_cur,nxw_cur,hxd_cur,dhd_cur)
	end
end

function checkBags(func)
   DeleteTriggerGroup("bags")
   --create_trigger_t('bags1',"^(> )*������Я����Ʒ�ı������",'','checkBagsStart')
   create_trigger_t('bags2',"^\\d*:(\\D*) = (\\D*)$",'','checkBagsId')
   --create_trigger_t('bags3','^(> )*��Ŀǰ�Ѿ�ӵ����(\\D*)��˽��װ����(\\D*)��$','','checkBagsU')
   create_trigger_t('bags4','^(> )*(\\D*)(��|��|��)(����|�ƽ�|ҼǪ����Ʊ)\\(','','checkBagsMoney')
   --create_trigger_t('bags5','^(> )*��� "action" �趨Ϊ "������" �ɹ���ɡ�$','','checkBagsOver')
   create_trigger_t('bags6','^(> )*(\\D*)��ʧ����ż�','','checkBagsletter')
   create_trigger_t('bags7','^(> )*(\\D*)ö����\\(','','checkBagsDart')
   create_trigger_t('bags8','^(> )*�����ϴ���(\\D*)������\\(����\\s*(\\d*)\\.\\d*\\%\\)��','','checkBagsW')
   create_trigger_t('bags9','^(> )*(\\D*)������\\(','','checkBagsJh')
   create_trigger_t('bags10','^(> )*(\\D*)��(��Ȫ|Īа|�ɽ�|�㳦)��\\((\\D*)\\s*jian\\)','','checkBagsShenQi')
   
    create_trigger_t('bags11','^(> )*(\\D*)��ʯ��\\(Shizi\\)','','checkBagsShizi')
   
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
   --pumkmai�޸�
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
         Bag["�ƽ�"]={}
         Bag["�ƽ�"].id={}
         Bag["�ƽ�"].cnt=0
         Bag["����"]={}
         Bag["����"].id={}
         Bag["����"].cnt=0
         Bag["ö����"]={}
         Bag["ö����"].id={}
         Bag["ö����"].cnt=0
         Bag["����"]={}
         Bag["����"].id={}
         Bag["����"].cnt=0
         Bag["ҼǪ����Ʊ"]={}
         Bag["ҼǪ����Ʊ"].id={}
         Bag["ҼǪ����Ʊ"].cnt=0
         tmp.bags=func
         weaponUsave={}
  
        exe('id')
        checkWield()
        exe('look bei nang')
        exe('uweapon')
        local l, w = wait.regexp('^(> )*��Ŀǰ�Ѿ�ӵ����(\\D*)��˽��װ����(\\D*)��$',1)	
        if l~= nil then
            print('check uweapon....')
            local t = Trim(w[3])
            local s = utils.split(t,',')
            for p,q in pairs(s) do
	           if string.find(q,'��') then 
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
			 ---pumkmai,, ע�ͣ���ȡ������ id
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
							    -- id �� full_id �ǲ�ͬ�� ,full_id �����id
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
             if (string.find(l_name,"��ƪ") or string.find(l_name,"��Ҫ")) and not itemSave[l_name] then
                    exe('read book')
                    exe('drop '..Bag[l_name].fullid)
             end
             if string.len(l_name)==6 and (string.sub(l_name,5,6)=="ҩ" or string.sub(l_name,5,6)=="��" or string.sub(l_name,5,6)=="��") and (not drugPoison[l_name] and not drugBuy[l_name]) then
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
       ---print('����test...........'..p..','..q)
	   if string.find(q,'��') then 
          q = string.sub(q,3,-1)
       end   
       weaponUsave[q] = true
   end
    
   exe('alias action ������')
   create_timer_s('checkBagsU_timer',1.0,'checkBagsU_test')
   
end

function checkBagsU_test()
    print('checkBagsU_test.............')
     exe('alias action ������')
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
   local l_name='ö����'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end

function checkBagsShizi(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name='ʯ��'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end

function checkBagsJh(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name='����'
   if Bag[l_name] then
      Bag[l_name].cnt = l_cnt
   end
end
--[[function checkBagsYao(n,l,w)
   local l_cnt=trans(Trim(w[2]))
   local l_name=Trim(w[3])
  if string.find(l_name,"���ɽ�ҩ") then
	   cty_cur = l_cnt
	end
	if string.find(l_name,"������Ϣ��") then
	   nxw_cur = l_cnt
	end
	if string.find(l_name,"��Ѫ�ƾ���") then
	   hxd_cur = l_cnt
	end
	if string.find(l_name,"�󻹵�") then
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
   if Bag["�����"] then
      exe("drop cha")
   end
   if Bag["�޻�����"] then
      exe('drop '.. Bag["�޻�����"].fullid)
   end
   if Bag["�޻�"] then
      exe('drop '.. Bag["�޻�"].fullid)
   end   
   if Bag["��ͭ"] then
      exe('drop '.. Bag["��ͭ"].fullid)
   end
   if Bag["����"] then
      exe('drop '.. Bag["����"].fullid)
   end
   if Bag["������"] and Bag["������"].cnt>2 then
      exe('drop cu shengzi 2')
    end
	if Bag["ľ��"] and Bag["ľ��"].cnt>2 then
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
   if score.party and score.party=="������" and not Bag["����"] then
      return check_item_go()
   elseif score.party=="������" and not Bag["����"] and not Bag["����"] then
      return go(checkSengxie,'��ɽ����','���߿�') 
   else
      return check_item_over()
   end
end
function checkSengxie()
   exe('ask chanshi about ɮЬ')
   return check_bei(checkHuyao)
end
function checkHuyao()
   exe('ask chanshi about ����')
   return check_bei(checkHuwan)
end
function checkHuwan()
   exe('ask chanshi about ����')
   return check_bei(check_item_over)
end
function check_item_go()
   go(check_item_belt,'����ɽ','�����')
end
function check_item_belt()
   exe('ask shitai about Ƥ����')
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
   exe('ask laoban about ��Ա����')
   check_bei(VIPask2)
end
function VIPask2()
   exe('ask laoban about ��Ա����')
   check_bei(Ebookcheck)
end
function Ebookcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id Ebookcheck
    create_trigger_t('vipchk1',"^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�",'','vipEbookck')
    create_trigger_t('vipchk2',"^(> )*���������޷�ʹ�þ�Ӣ֮�顣",'','Yjwcheck')
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
    create_trigger_t('vipchk1',"^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�",'','vipYjwck')
    create_trigger_t('vipchk2',"^(> )*���������޷�ʹ�����衣",'','Ygcheck')
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
    create_trigger_t('vipchk1',"^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�",'','vipYggo')
    create_trigger_t('vipchk2',"^(> )*���������޷�ʹ��ԧ�������",'','Gstart')
    create_trigger_t('vipchk3',"^(> )*�������һ��ԧ�����",'','vipYgok')
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
  return go(vipGhyg,'�����','���')
end
function vipGhyg()
  exe('guihuan ying gu')
end
function vipYgok()
  return go(vipYg,'���ݳ�','����')
end
function vipYg()
   exe('duihuan jinpa')
end
function Vipcheck()
    DeleteTriggerGroup("vipchk")
-- ain dls nv id vipcheck
    create_trigger_t('vipchk1',"^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�",'','vipxidu')
    create_trigger_t('vipchk2',"^(> )*����쾦����Ѿ������ˡ�",'','vipxidu_over')
    create_trigger_t('vipchk3',"^(> )*���������޷�ʹ��",'','vipover')
    create_trigger_t('vipchk4',"^(> )*����Ҫ�������е���Ʒ�����ٴζһ���",'','vipxidu')
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
    create_trigger_t('vipdhd1',"^(> )*���Ǳ�վ�����Ա�����ι�����ѡ�",'','vipeatdhd')
    create_trigger_t('vipdhd2',"^(> )*��Ĵ󻹵��Ѿ������ˡ�",'','vipdhd_over')
    create_trigger_t('vipdhd3',"^(> )*���������޷�ʹ��",'','vipover')
    create_trigger_t('vipdhd4',"^(> )*����Ҫ�������е���Ʒ�����ٴζһ���",'','vipeatdhd')
    create_trigger_t('vipdhd5',"^(> )*������㣬�ⶫ���ܳ���",'','vipdhd_over')
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
      return go(Vipcheck,'���ݳ�','����')
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
   exe('nick ��·��')
   if score.party and score.party=="������" then
      exe('yun shougong '.. score.id)
   end
   if score.party and score.party=="������" then
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
      return go(check_heal_newbie,"���ݳ�","ҩ��")
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
	     if score.party=="������" and hp.neili>2000 then
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
      return go(check_xue_ask,'������','����')
   else
      return check_xue_fail()
   end 
end
function check_xue_ask()
   DeleteTriggerGroup("ck_xue_ask")
   create_trigger_t('ck_xue_ask1','^(> )*����ѦĽ�������йء����ˡ�����Ϣ��$','','check_xue_accept')
   create_trigger_t('ck_xue_ask2','^(> )*����û�������','','check_xue_fail')
   SetTriggerOption("ck_xue_ask1","group","ck_xue_ask")
   SetTriggerOption("ck_xue_ask2","group","ck_xue_ask")
   DeleteTriggerGroup("ck_xue_accept")
   create_trigger_t('ck_xue_accept1','^(> )*ѦĽ�����ٺٺ١���Ц�˼�����$','','check_xue_teach')
   create_trigger_t('ck_xue_accept2','^(> )*һ����Ĺ����ȥ�ˣ�����������Ѿ�����Ȭ���ˡ�','','check_xue_heal')
   create_trigger_t('ck_xue_accept3','^(> )*Ѧ��ҽ�ó�һ�������������������˲�λ������Ѩ��','','check_xue_wait')
   create_trigger_t('ck_xue_accept4','^(> )*ѦĽ���ƺ����������˼��$','','check_xue_heal')
   create_trigger_t('ck_xue_accept5','^(> )*ѦĽ����ž����һ�����ڵ��ϣ������ų鶯�˼��¾�����','','check_xue_fail')
   SetTriggerOption("ck_xue_accept1","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept2","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept3","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept4","group","ck_xue_accept")
   SetTriggerOption("ck_xue_accept5","group","ck_xue_accept")
   EnableTriggerGroup("ck_xue_accept",false)
   DeleteTriggerGroup("ck_xue_teach")
   create_trigger_t('ck_xue_teach1','^(> )*Ѧ��ҽ����������Ѿ������ٽ����ˡ�$','','check_xue_next')
   SetTriggerOption("ck_xue_teach1","group","ck_xue_teach")
   EnableTriggerGroup("ck_xue_teach",false)
   DeleteTriggerGroup("ck_xue_busy")
   create_trigger_t('ck_xue_busy1','^(> )*����Ъ������˵���ɡ�$','','check_xue_busy')
   SetTriggerOption("ck_xue_busy1","group","ck_xue_busy")
   EnableTriggerGroup("ck_xue_busy",true)
   wait.make(function()
       wait.time(1)
	    exe('ask xue muhua about ����')
   end)
  
end
function check_xue_busy()
      return check_busy(check_xue_ok,2)
end
function check_xue_ok()
   EnableTriggerGroup("ck_xue_accept",true)
   exe('ask xue muhua about ����')
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
   exe('set ����;hp;yun qi;yun jing;yun jingli;cond')
   exe('dazuo '..hp.dazuo)
end
function poison_dazuo()
    DeleteTriggerGroup("poison")
    create_trigger_t('poison1',"^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)",'','poisondazuo_desc')
    create_trigger_t('poison2',"^(> )*�����ھ��������޷�������Ϣ��������",'','checkDebug')
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
     if score.xiangyun~='��' then 
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
  return go(Brefine,'���ݳ�','������')
end
function Brefine()
        kuangshi="tiekuang shi"
    DeleteTriggerGroup("refine")
    create_trigger_t('refine1',"^(> )*��û���㹻������ʯ��",'','refineGold')
        create_trigger_t('refine2',"^(> )*��û���㹻�Ľ��ʯ��",'','refineOK')
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
	if score.gender=='��1' then --����ר�ã���շ���
		map.rooms["city/mingyufang"].ways["north"]=nil
		map.rooms["changan/eastjie1"].ways["north"]=nil
	end
	map.rooms["sld/lgxroom"].ways["#outSld"]="huanghe/huanghe8"
	if score.party=='��ɽ��'and hp.shen<0 then 
	   map.rooms["huashan/houtang"].ways["north"]=nil
     map.rooms["huashan/qianting"].ways["south"]=nil
  end
  if score.party=='����Ľ��' then 
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
   exe('nick ȥ�䵱�Ժ�;remove all;wear all')
exe('hp;unset no_kill_ap;yield no')
  if (hp.food<60 or hp.water<60) and hp.exp<500000 then
      return go(dali_eat,'�����','���')
   elseif hp.food<60 or hp.water<60 then
      return go(wudang_eat,'�䵱ɽ','��ͤ')
   else
      check_bei(check_food_over)
   end
end
function wudang_eat()
   if locl.room=="��ͤ" then
   flag.food=0
   DeleteTimer("food")
   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#4(drink cha);drop cha;drop tao;fill jiudai')
   check_bei(check_food_over)
    else
       return go(wudang_eat,'�䵱ɽ','��ͤ')
    end
end
function wudang_chifan()
go(wudang_bc,'�䵱ɽ','��ͤ')
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
   if locl.room=="���" then
   flag.food=0
   DeleteTimer("food")
   exe('#5(drink);e;e;s;buy baozi;#2(eat baozi)')
   check_bei(check_food_over)
    else
       return go(dali_eat,'�����','���')
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
    --- ������Կ����Ż�Ϊ 1/5
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
         -- ain ��ǰ����
	     if q and skills[q] and q~="force" and (skills[q].lvl>219 or (score.party=="��ͨ����" and skills[q].lvl>100)) and skills[q].lvl<hp.pot_max-100 and skills[q].lvl<=skills[p].lvl and hp.pot>=l_pot then
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
   --[[if score.party=="��ͨ����" and hp.pot>=l_pot and score.gold and skills["literate"] and score.gold>3000 and skills["literate"].lvl<hp.pot_max-100 then
      return literate()
   end
      if score.party=="��ͨ����" and hp.pot>=l_pot and skills["parry"].lvl<hp.pot_max-100 and skills["parry"].lvl>=101 then
         flag.lingwu=1
      end
    if score.party=="��ͨ����" and flag.lingwu==1 then return checklingwu() end
      ]]--
   --[[ if score.party=="��ͨ����" and skills["force"].lvl>50 then
		if skills["force"].lvl<101 then
		       return huxi()
			end
	    if score.party=="��ͨ����" and skills["force"].lvl==101 then
               exe('fangqi force 1;y;y;y')			
		       return huxi()
			end
        if score.party=="��ͨ����" and skills["shenzhao-jing"] and skills["shenzhao-jing"].lvl<200 then
		    return learnSzj()
		 end
	end]]--
    
	local literate_toggle = tonumber(GetVariable('literate_toggle'))
   if score.party~="��ͨ����" and hp.pot>=l_pot and flag.autoxuexi and flag.autoxuexi==1 and literate_toggle==1 then
      if score.gold and skills["literate"] and score.gold>3000 and skills["literate"].lvl<hp.pot_max-100 then
         return literate() 
      end

	  if score.party~="��ͨ����" then
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

   if score.party~="��ͨ����" and perform.skill and skills[perform.skill] and skills[perform.skill].lvl<450 and hp.pot>=l_pot then
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

	  
      if flag.xuexi==1 and score.party~="��ͨ����" then
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
    return go(checkHmGive,"���ݳ�","������")
end
function checkHmGive()
    if Bag["Τ��֮��"] then
	   exe('give '.. Bag["Τ��֮��"].fullid ..' to zhujian shi')
	end
	Bag["Τ��֮��"] = nil
	return checkPrepare()
end

function check_gold()
   tmp.cnt=0
   return go(check_gold_dali,"�����","����Ǯׯ")
end
function check_gold_dali()
    print('check_gold_dali.....')
    if not locl.id["���ƹ�"] then
	   return go(check_gold_xy,"������","����ի")
	else
	   return check_gold_count()
	end
end
function check_gold_xy()
    if not locl.id["Ǯ����"] then
	   return go(check_gold_cd,"�ɶ���","ī��ի")
	else
	   return check_gold_count()
	end
end
--function check_gold_cd()
--    if not locl.id["���ƹ�"] then
--	   return go(check_gold_yz,"���ݳ�","���ի")
--	else
--	   return check_gold_count()
--	end
--end
-- ain
function check_gold_cd()
    if not locl.id["Ǯ��"] then
	   return go(check_gold_dali,"�����","����Ǯׯ")
	else
	   return checkWait(check_gold_count,1)
	end
end
function check_gold_count()
   if Bag['ҼǪ����Ʊ'] and Bag['ҼǪ����Ʊ'].cnt>10 then  
      exe('score;chazhang')
      if score.goldlmt and score.gold and (score.goldlmt-score.gold)>50 then
         --return check_cash_cun()
		 return checkWait(check_cash_cun,1)
	  end
   end
   if Bag and Bag["����"] and Bag["����"].cnt and Bag["����"].cnt>500 then
      --return check_silver_qu()
	  return checkWait(check_silver_qu,1)
   end
   if (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt<count.gold_max and score.gold>count.gold_max) or (Bag and Bag["�ƽ�"] and Bag["�ƽ�"].cnt and Bag["�ƽ�"].cnt>count.gold_max*4) then
      --return check_gold_qu()
	  return checkWait(check_gold_qu,1)
   end

   --return check_gold_over()
   return checkWait(check_gold_over,1)
end
function check_cash_cun()
   if Bag['ҼǪ����Ʊ'] then
      local l_cnt
      if score.goldlmt and score.gold and (score.goldlmt-score.gold)<Bag['ҼǪ����Ʊ'].cnt*10 then
	     l_cnt = math.modf((score.goldlmt-score.gold)/10) - 1
	  else
	     l_cnt = Bag['ҼǪ����Ʊ'].cnt
	  end
	  if l_cnt > 0 then
         exe('cun '.. l_cnt ..' cash')
	  end
   end
   checkBags()
   return checkWait(check_gold_check,3)
end
function check_silver_qu()
   local l_cnt=Bag["����"].cnt-100
   exe('cun '.. l_cnt ..' silver')
   exe('qu 50 silver')
   checkBags()
   return checkWait(check_gold_check,3)
end
function check_gold_qu()
   local l_cnt=Bag["�ƽ�"].cnt-count.gold_max*2
   if l_cnt>0 then
        exe('cun '.. l_cnt ..' gold')
    end
   if Bag["�ƽ�"].cnt<count.gold_max then
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
   return go(checkZqdBuy,randomElement(drugBuy["������"]))
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
   if Bag["�ƽ�"] and Bag["�ƽ�"].cnt>4 and (not Bag["������"] or Bag["������"].cnt<4) then
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
   return go(checkXqwBuy,randomElement(drugBuy["а����"]))
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
   if Bag["�ƽ�"] and Bag["�ƽ�"].cnt>4 and (not Bag["а����"] or Bag["а����"].cnt<4) then
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
      return go(checkNxwBuy,randomElement(drugBuy["��Ϣ��"]))
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
   if (nxw_cur<count.nxw_max or cbw_cur<count.cbw_max or hqd_cur<count.hqd_max) and Bag["�ƽ�"] and Bag["�ƽ�"].cnt>4 then
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
      return go(checkHxdBuy,randomElement(drugBuy["���ɽ�ҩ"]))
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
   if cty_cur<count.cty_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt>4 then
      return checkWait(checkHxdBuy,1)
   else
      return checkNxwOver()
   end
end

function checkLjd()
   tmp.cnt=0
   if score.gold and score.gold>100 and hxd_cur<count.hxd_max then
      return go(checkLjdBuy,randomElement(drugBuy["��Ѫ�ƾ���"]))
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
   if hxd_cur<count.hxd_max and Bag["�ƽ�"] and Bag["�ƽ�"].cnt>4 then
      return checkWait(checkLjdBuy,1)
   else
      return checkNxwOver()
   end
end
function checkdhd()
   tmp.cnt=0
   if score.tb and score.tb>100 and dhd_cur<count.dhd_max then
      return go(checkdhdBuy,randomElement(drugBuy["�󻹵�"]))
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

-------------- ȡ���� -------------------------------------

function checkFireNew()
    if not Bag["����"] then 
	    return go(checkFireQu,'���ݳ�','�ӻ���')
	else 
	    return checkFireQuSuccess()
	end 
end

function checkFireQu()
    DeleteTriggerGroup("qu_fire")
    create_trigger_t('qu_fire1','^(> )*�㲢û�б������Ʒ��$','','checkFireQuFail')
	create_trigger_t('qu_fire2','^(> )*��ѻ��۴Ӹ��˴���������ȡ������$','','checkFireQuSuccess')
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

-------------- ȡ���� END -------------------------------------



-------------- ȡ���� -------------------------------------

function checkJinChai()
    if not Bag["����"] then 
	    return go(checkJinChaiQu,'���ݳ�','�ӻ���')
	else 
	    return checkJinChaiQuSuccess()
	end 
end

function checkJinChaiQu()
    DeleteTriggerGroup("qu_jinchai")
    create_trigger_t('qu_jinchai1','^(> )*�㲢û�б������Ʒ��$','','checkJinChaiQuFail')
	create_trigger_t('qu_jinchai2','^(> )*��ѽ��δӸ��˴���������ȡ������$','','checkJinChaiQuSuccess')
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

-------------- ȡ���� END -------------------------------------




-------------- ȡţƤ�ƴ� -------------------------------------

function checkJiuDai()
    if not Bag["ţƤ�ƴ�"] then 
	    return go(checkJiuDaiQu,'���ݳ�','�ӻ���')
	else 
	    return checkJiuDaiQuSuccess()
	end 
end

function checkJiuDaiQu()
    DeleteTriggerGroup("qu_jinchai")
    create_trigger_t('qu_jinchai1','^(> )*�㲢û�б������Ʒ��$','','checkJiuDaiQuFail')
	create_trigger_t('qu_jinchai2','^(> )*��ѽ��δӸ��˴���������ȡ������$','','checkJiuDaiQuSuccess')
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

-------------- ȡţƤ�ƴ� END -------------------------------------






-------------- ȡ���� -------------------------------------

function checkShengzi()
    if not Bag["����"] then 
	    return go(checkShengziQu,'���ݳ�','�ӻ���')
	
	elseif Bag["����"].cnt > 1 then 
	    return go(cunShengzi,'���ݳ�','�ӻ���')
		
	else 
	    return checkShengziQuSuccess()
	end 
end

function cunShengzi()
    print('cunShengzi.......')
    DeleteTriggerGroup("cu_shengzi")
    create_trigger_t('cu_shengzi1','^(> )*����ĸ��˴����䱣����(\\D*)����Ʒ','','currentCwxCount')
	create_trigger_t('cu_shengzi2','^(> )*����ĸ��˴�����һ�����Ա���\\((\\D*)����Ʒ','','currentCwxTotalCount')
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
			local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
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
	local shengzi_count = Bag["����"].cnt - 1
	
	if Bag["����"] ~= nil and shengzi_count>0 and current_left>=1  then 
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
    create_trigger_t('qu_shengzi1','^(> )*�㲢û�б������Ʒ��$','','checkShengziQuFail')
	create_trigger_t('qu_shengzi2','^(> )*������ӴӸ��˴���������ȡ������$','','checkShengziQuSuccess')
    SetTriggerOption("qu_shengzi1","group","qu_shengzi")
	SetTriggerOption("qu_shengzi2","group","qu_shengzi")
    wait.make(function()
	    wait_busy()
		--exe('qu sheng zi')
		while true do
		    exe('qu sheng zi')
			exe('hug '..score.id)
			local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			if l~=nil then break end 
		end
	end)
end  

function checkShengziQuFail()
    EnableTriggerGroup('qu_shengzi',false)
	wait.make(function()
	    wait_busy()
	    return go(checkShengziGet,'��ɽ','����')
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

-------------- ȡ���� END -------------------------------------





function checkFire()
   if not Bag["����"] then
      return go(checkFireBuy,randomElement(drugBuy["����"]))
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
   if not Bag["ţƤ�ƴ�"] then
      return go(checknpjdBuy,randomElement(drugBuy["ţƤ�ƴ�"]))
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
	return go(checkYuCun,"���ݳ�","�ӻ���")
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
	return go(checkSellDo,"���ݳ�","����")
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
		    if not Bag[tmp.weapon] or (tmp.weapon=='ʯ��' and Bag['ʯ��'].cnt<500) then
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
      l_result=utils.inputbox ("��Ҫѧϰ��SKILLS(��ʽ��force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)��?", "xuexiskill", GetVariable("xuexiskill"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("xuexiskill",l_result)
       Note ("ѧϰ�趨���")
        print(GetVariable("xuexiskill"))
 	   end
      l_result=utils.inputbox ("��Ҫ�����SKILLS(��ʽ��force|dodge|sword|blade|parry)��?", "lingwuskills", GetVariable("lingwuskills"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("lingwuskills",l_result)
       Note ("�����趨���")
        print(GetVariable("lingwuskills"))
 	   end
      l_result=utils.inputbox ("��ѧϰ����ʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	   end
   l_result=utils.inputbox ("���Ӣ��ID��?", "ID", GetVariable("id"), "����" , "12")
   if l_result~=nil then
      SetVariable("id",l_result)
   else
      DeleteVariable("id")
   end
   l_result=utils.inputbox ("���������?", "Passwd", GetVariable("passwd"), "����" , "12")
   if l_result~=nil then
      SetVariable("passwd",l_result)
   else
      DeleteVariable("passwd")
   end

   l_result=utils.msgbox ( "�Ƿ�򿪼�¼����?", "FlagLog", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      flag.log="yes"
   else
      flag.log="no"
   end
   SetVariable("flaglog",flag.log)
   
   l_result=utils.msgbox ( "�Ƿ��Զ�ѧϰ������", "XuexiLingwu", "yesno", "?", 1 )
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
   
   ColourNote ("red","blue","��ʹ��start�������������ˣ�stop����ֹͣ�����ˣ�iset���û����ˣ�")
end

function masterSet()
   local l_result,l_tmp,t
   if score.party~="��ͨ����" then
      l_result=utils.inputbox ("���ʦ���ļ��ID��?", "MasterId", GetVariable("masterid"), "����" , "12")
      if not isNil(l_result) then
         SetVariable("masterid",l_result)
         master.id=l_result
      end
      if not score.master or not masterRoom[score.master] then
         l_result=utils.inputbox ("���ʦ���ľ�ס����?", "MasterRoom", GetVariable("masterroom"), "����" , "12")
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
      l_result=utils.listbox("��ʹ�õ������ڹ���","�����ڹ�",t,GetVariable("performforce"))
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
      l_result=utils.listbox ("��׼��ս��ʹ�õĹ�����?", "performSkill", t,GetVariable("performskill"))
      if not isNil(l_result) then
         SetVariable("performskill",l_result)
         perform.skill=l_result
      else
         perform.skill = nil
	     SetVariable("performskill",l_result)
      end
   end
   l_result=utils.inputbox ("ս��Ĭ��׼��PFM(��ʽ��bei none;bei claw;jifa parry jiuyin-baiguzhua;perform sanjue)��?", "PerformPre", GetVariable("performpre"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("performpre",l_result)
      perform.pre=l_result
      l_pfm = perform.pre
      create_alias('pfmset','pfmset','alias pfmpfm '.. l_pfm)
      Note("Ĭ��PFM")
      --exe('pfmset')
	  Execute('pfmset')
   end
   l_result=utils.inputbox ("��Ŀ���PFM(��ʹ��������PFM)��?", "pfmks", GetVariable("pfmks"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pfmks",l_result)
      l_pfm=l_result
      create_alias('pfmks','pfmks','alias pfmpfm '.. l_pfm)
      Note("����PFM")
      exe('pfmks')
   end
   l_result=utils.inputbox ("����Ľ�ݽ����õ�PFM(ʹ�ò��ý����Կ���Ľ�ݵ�skills,Ľ�ݽ���������Ϊ����)��?", "pfmmrjf", GetVariable("pfmmrjf"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pfmmrjf",l_result)
      l_pfm=l_result
      create_alias('pfmmrjf','pfmmrjf','alias pfmpfm '.. l_pfm)
      Note("���ý���PFM")
      exe('pfmmrjf')
   end
   l_result=utils.inputbox ("��������ʥ���PFM(ʹ���������������̵�skills��ʥ���������Ϊ����)��?", "pfmshlf", GetVariable("pfmshlf"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pfmshlf",l_result)
      l_pfm=l_result
      create_alias('pfmshlf','pfmshlf','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmshlf')
   end
   l_result=utils.inputbox ("��д���������PFM(ʹ�������Ե�skills�����������Ĺ���Ϊ��)��?", "pfmwu", GetVariable("pfmwu"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pfmwu",l_result)
      l_pfm=l_result
      create_alias('pfmwu','pfmwu','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmwu')
   end
l_result=utils.inputbox ("��д��Ŀ�����PFM(�Ը������Ե�pfm���������������书�������Լ�������书)��?", "pkong", GetVariable("pkong"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pkong",l_result)
      l_pfm=l_result
      create_alias('pkong','pkong','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pkong')
   end
l_result=utils.inputbox ("��д�������������PFM(�Ը������书��ż���޷�ʶ����书��ʹ�úĺ�������pfm)��?", "pfmsanqing", GetVariable("pfmsanqing"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pfmsanqing",l_result)
      l_pfm=l_result
      create_alias('pfmsanqing','pfmsanqing','alias pfmpfm '.. l_pfm)
      Note("�ռ�����")
      exe('pfmsanqing')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ա����Կ�����ֵΪ����130 �տ�120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pzhen", GetVariable("pzhen"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pzhen",l_result)
      perform.zhen=l_result
      l_pfm = perform.zhen
      create_alias('pfmzhen','pfmzhen','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmzhen')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ������Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pqi", GetVariable("pqi"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pqi",l_result)
      perform.qi=l_result
      l_pfm = perform.qi
      create_alias('pfmqi','pfmqi','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmqi')
   end
   l_result=utils.inputbox ("��д��ĸ�����PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���������Կ�����ֵΪ����130 ����120 ��110 ������100���޸����Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pgang", GetVariable("pgang"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pgang",l_result)
      perform.gang=l_result
      l_pfm = perform.gang
      create_alias('pfmgang','pfmgang','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmgang')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���졣���Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "prou", GetVariable("prou"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("prou",l_result)
      perform.rou=l_result
      l_pfm = perform.rou
      create_alias('pfmrou','pfmrou','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmrou')
   end
   l_result=utils.inputbox ("��д��Ŀ�����PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ա����Կ�����ֵΪ����130 ���120 ��110 �޸���100���޿����Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pkuai", GetVariable("pkuai"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pkuai",l_result)
      perform.kuai=l_result
      l_pfm = perform.kuai
      create_alias('pfmkuai','pfmkuai','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmkuai')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���ᡣ���Կ�����ֵΪ����130 �տ�120 ��110 �޸���100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pman", GetVariable("pman"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pman",l_result)
      perform.man=l_result
      l_pfm = perform.man
      create_alias('pfmman','pfmman','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmman')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���������Կ�����ֵΪ����130 ���120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pmiao", GetVariable("pmiao"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pmiao",l_result)
      perform.miao=l_result
      l_pfm = perform.miao
      create_alias('pfmmiao','pfmmiao','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmmiao')
   end
   l_result=utils.inputbox ("��д���������PFM(��verify ���鿴���pfm����������д����ʽ��verify yunu-jianfa)��?         ������������Ϊ���档���Կ�����ֵΪ����130 ����120 ��110 ������100���������Կɰ��������ֵ�ߵ�����������ж�Ӧ���Ե�FPM��", "pxian", GetVariable("pxian"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pxian",l_result)
      perform.xian=l_result
      l_pfm = perform.xian
      create_alias('pfmxian','pfmxian','alias pfmpfm '.. l_pfm)
      Note("������PFM")
      exe('pfmxian')
   end
      l_result=utils.inputbox ("��FPK��PFM(��verify ���鿴���pfm����������д��ʽ��verify yunu-jianfa)��?", "pkpfm", GetVariable("pkpfm"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pkpfm",l_result)
	   end
      l_result=utils.inputbox ("�������Ĵ�����? ", "mycishu", GetVariable("mycishu"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mycishu",l_result)
      lianxi_times = l_result
	   end
    Note("ʹ��Ĭ��PFM")
    --exe('pfmset')
	 Execute('pfmset')
   end

function myUweapon()
      l_result=utils.inputbox ("����ҪGET�ĵ�һ������ID��?", "myweapon", GetVariable("myweapon"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("myweapon",l_result)
	   end
      l_result=utils.inputbox ("����ҪGET�ĵڶ�������ID��?", "muweapon", GetVariable("muweapon"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("muweapon",l_result)
	   end
end

function jobSet()
   local l_result,l_tmp,t
   
   t={
       ["wudang"]  ="�䵱��Զ��",
       ["huashan"] ="��ɽ����Ⱥ",
    ["gaibang"]    ="ؤ���ⳤ��",
     ["songmoya"]    ="��Ħ�¿�������",
     ["zhuoshe"] ="ؤ��׽��",
       ["songxin"] ="��������",
	   ["songxin2"]="��������2",
	   ["xueshan"]   ="ѩɽ����Ů",
     ["sldsm"]   ="������ʦ��",
     ["songshan"]="��ɽ������",
  --   ["hubiao"]  ="���ݻ���",
       ["tmonk"]   ="���ֽ̺���",
	   ["clb"]     ="���ְ�����1",
	   ["husong"]  ="���ֻ���",
	   ["hqgzc"]  ="���߹�����",
   }
   
   t={}
   
   for p,q in pairs(job.list) do
       t[p] = q
   end
   
   if score.party~="ؤ��" then t["zhuoshe"]=nil end
   if score.party~="������" then t["sldsm"]=nil end
   if score.party~="������" or hp.exp>2000000 or hp.exp<300000 then t["tmonk"]=nil end
   if score.party~="������" or hp.exp<2000000 then t["husong"]=nil end
   if hp.exp<5000000 then t["songmoya"]=nil end
   if hp.shen<0 then t["gaibang"]=nil end
   if hp.shen<0 and score.party=="��ɽ��" then t["huashan"]=nil end
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
   l_tmp=utils.multilistbox ("����������(�밴CTRL��ѡ)��?", "�������", t,tmp.zuhe)
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
      l_result=utils.listbox("���һ����ȥ������","��������",t,GetVariable("jobfirst"))
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
	  l_result=utils.listbox("��ڶ�����ȥ������","��������",t,GetVariable("jobsecond"))
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
	  l_result=utils.listbox("�������ȥ������","��������",t,GetVariable("jobthird"))
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
      l_result=utils.inputbox ("����һƷ������ɱ���ڼ���?(Ĭ��Ϊ7��)ʹ��Ĭ��������հײ�Ҫ��д��", "ypttab", GetVariable("ypttab"), "����" , "12")
      if not isNil(l_result) then
         SetVariable("ypttab",l_result)
         smyteam=tonumber(l_result)
      else
         smyteam=16
      end
      l_result=utils.inputbox ("����һƷ�������������β�����SMY!(Ĭ��Ϊ2��)ʹ��Ĭ��������հײ�Ҫ��д��", "yptdie", GetVariable("yptdie"), "����" , "12")
      if not isNil(l_result) then
         SetVariable("yptdie",l_result)
         smyall=tonumber(l_result)
      else
         smyall=2
      end
      l_result=utils.msgbox ( "����һƷ�������Ƿ���˫ɱ!(Ĭ��Ϊno������)��", "˫ɱ", "yesno", "?", 1 )
      if l_result and l_result=="yes" then
        double_kill=yes
      else
        double_kill=no
      end
      l_result=utils.inputbox ("����һƷ������ǰ��BUFF!(Perform and Yun��û������дnone)��", "pfbuff", GetVariable("pfbuff"), "����" , "12")
      if not isNil(l_result) then
      SetVariable("pfbuff",l_result)
      perform.buff=l_result
      l_pfm = perform.buff
      create_alias('pbuff','pbuff','alias pfmbuff '.. l_pfm)
      exe('pbuff')
      end
   end

   if job.zuhe["tdh"] then
      l_result=utils.inputbox ("��ػ������м��Ƿ������(1Ϊ���� 0Ϊ������)", "tdhdazuo", GetVariable("tdhdazuo"), "����" , "12")
      if not isNil(l_result) then
         SetVariable("tdhdazuo",l_result)
         tdhdz=l_result
      else
         tdhdz=1
      end
   end
   
   if job.zuhe["hqgzc"] then
      l_result=utils.inputbox ("��Pot����Gold��(1ΪPot 0ΪGold)", "hqgzcjiangli", GetVariable("hqgzcjiangli"), "����" , "12")
      if not isNil(l_result) then
         SetVariable("hqgzcjiangli",l_result)
         hqgzcjl=l_result
      else
         hqgzcjl=1
      end
   end
   
   if job.zuhe["hubiao"] or job.zuhe["haizhan"] then
      if GetVariable("teamname") then
         l_result=utils.inputbox ("����ӻ��ڵĶ���(��������)��?", "TeamName", GetVariable("teamname"), "����" , "12")
      else
         l_result=utils.inputbox ("����ӻ��ڵĶ���(��������)��?", "TeamName", job.teamname, "����" , "12")
      end
      if not isNil(l_result) then
         SetVariable("teamname",l_result)
         job.teamname=l_result
      else
         DeleteVariable("teamname")
         job.teamname=nil
      end
      if GetVariable("teamlead") then
         l_result=utils.inputbox ("����ӻ��ڵĶӳ�(��������)��?", "TeamLead", GetVariable("teamlead"), "����" , "12")
      else
         l_result=utils.inputbox ("����ӻ��ڵĶӳ�(��������)��?", "TeamLead", job.teamlead, "����" , "12")
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
   ["��Ϣ��"] = "��Ϣ��",
   ["������Ϣ��"] = "������Ϣ��",
   ["������Ϣ��"] = "������Ϣ��",
   ["���ɽ�ҩ"] = "���ɽ�ҩ",
   ["��Ѫ�ƾ���"] = "��Ѫ�ƾ���",
   ["�󻹵�"] = "�󻹵�",
   ["����"] = "����",
   ["ţƤ�ƴ�"] = "ţƤ�ƴ�",
   }
   if GetVariable("drugprepare") then
      tmp.drug = utils.split(GetVariable("drugprepare"),'|')
	  tmp.pre = {}
      for _,p in pairs(tmp.drug) do
          tmp.pre[p]=true
      end
    end
   local l_tmp=utils.multilistbox ("������ǰ׼������Ʒ(�밴CTRL��ѡ)��?", "��Ʒ���", t,tmp.pre)
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
      l_result=utils.msgbox ( "Ľ�ݶ�ת����ѧϰ����(Ĭ��Ϊ��Yes)��", "dzxy", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('��Ҫѧϰ��ת����')
      need_dzxy='yes'
   else
      need_dzxy='no'
      print('�Ҳ�Ҫѧϰ��ת����')
   end
end
function inWdj()
      l_result=utils.msgbox ( "��Ҫ���置�嶾����", "inwdj", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('��Ҫ���置�嶾��')
      inwdj=1
   else
      inwdj=0
      print('�Ҳ����置�嶾��')
   end
end
function setLearn()
      l_result=utils.inputbox ("��Ҫѧϰ��SKILLS(��ʽ��force|shenyuan-gong|dodge|yanling-shenfa|sword|blade|parry)��?", "xuexiskill", GetVariable("xuexiskill"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("xuexiskill",l_result)
       Note ("ѧϰ�趨���")
        print(GetVariable("xuexiskill"))
 	   end
      l_result=utils.inputbox ("��ѧϰʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	print(GetVariable("learnweapon"))
	   end
end
function setLingwu()
      l_result=utils.inputbox ("��Ҫ�����SKILLS(��ʽ��force|dodge|sword|blade|parry)��?", "lingwuskills", GetVariable("lingwuskills"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("lingwuskills",l_result)
       Note ("�����趨���")
        print(GetVariable("lingwuskills"))
 	   end
      l_result=utils.inputbox ("������ʱʹ�õļ�����������?", "learnweapon", GetVariable("learnweapon"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("learnweapon",l_result)
	print(GetVariable("learnweapon"))
	   end
end
function pk_start()
     l_result=utils.inputbox ("��ҪPK��Ŀ���ǣ�Ӣ��ID����", "PK-Target", GetVariable("pk_target"), "����" , "12")
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
         l_result=utils.inputbox ("��������ٺ�����(����Ĭ��240)", "heqi_number", GetVariable("heqi_number"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("heqi_number",l_result)
        else
          SetVariable("heqi_number","240")
     end
         l_result=utils.inputbox ("��д��Ŀ���������PK-PFM(������)��?", "zpk_pwu", GetVariable("zpk_pwu"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pwu",l_result)
   end
    l_result=utils.inputbox ("��д��Ŀ��ƿ�����PK-PFM(���ƿ�)��?", "zpk_pkong", GetVariable("zpk_pkong"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pkong",l_result)
        end
   l_result=utils.inputbox ("��д���������PK-PFM��? (������)", "zpk_pzhen", GetVariable("zpk_pzhen"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pzhen",l_result)
   end
   l_result=utils.inputbox ("��д���������PK-PFM(������)", "zpk_pqi", GetVariable("zpk_pqi"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pqi",l_result)
   end
   l_result=utils.inputbox ("��д��ĸ�����PK-PFM(������)", "zpk_pgang", GetVariable("zpk_pgang"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pgang",l_result)
   end
   l_result=utils.inputbox ("��д���������PK-PFM(���ƿ�)", "zpk_prou", GetVariable("zpk_prou"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_prou",l_result)
   end
   l_result=utils.inputbox ("��д��Ŀ�����PK-PFM(���Ƹ�)", "zpk_pkuai", GetVariable("zpk_pkuai"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pkuai",l_result)
   end
   l_result=utils.inputbox ("��д���������PK-PFM(������)", "zpk_pman", GetVariable("zpk_pman"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pman",l_result)
   end
   l_result=utils.inputbox ("��д���������PK-PFM(������)", "zpk_pmiao", GetVariable("zpk_pmiao"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pmiao",l_result)
   end
   l_result=utils.inputbox ("��д���������PK-PFM(������)", "zpk_pxian", GetVariable("zpk_pxian"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("zpk_pxian",l_result)
   end
   l_result=utils.inputbox ("��д���Ĭ��PK-PFM(����pfm���޷�ʶ��Է��书��Ӧ�ԣ�����pfmpfm�趨)��?", "pkpfm", GetVariable("pkpfm"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("pkpfm",l_result)
        end
      l_result=utils.inputbox ("��д���PK-PFM(ֻ����pfm��������wield������jifa)", "mypfm", GetVariable("mypfm"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mypfm",l_result)
           end
           l_result=utils.inputbox ("��д���buff-PFM(pkʱʹ�õ�buff����)", "mybuff", GetVariable("mybuff"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mybuff",l_result)
           end
           l_result=utils.inputbox ("��д���debuff-PFM(pkʱʹ�õ�debuff����)", "mydebuff", GetVariable("mydebuff"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mydebuff",l_result)
           end
end
function setLian()
      l_result=utils.inputbox ("�������Ĵ�����? ", "mycishu", GetVariable("mycishu"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mycishu",l_result)
      lianxi_times = l_result
           end
end
function setxcexp()
      l_result=utils.msgbox ( "Ѳ�ǵ�2M", "xcexp", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('Ѳ�ǵ�2M')
      xcexp=1
   else
      print('Ѳ�ǵ�1M')
      xcexp=0
   end
end
function xuepot()
      l_result=utils.msgbox ( "�Ƿ�ѧϰ", "xuexi", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('ѧϰ����')
      needxuexi=1
   else
      needxuexi=0
      print('ѧϰ�ر�')
   end
end
function dolostletter()
      l_result=utils.inputbox ("�����뵱ǰʧ����ſɽ���������? Ĭ��Ϊ10�⣡", "mylostletter", GetVariable("mylostletter"), "����" , "12")
   if not isNil(l_result) then
      SetVariable("mylostletter",l_result)
      lostno=l_result
	 end
      l_result=utils.msgbox ( "�Ƿ���LL", "ʧ�����", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('������LL')
      needdolost=1
      switch_name4="ʧ����ż�--��"
   else
      needdolost=0
      switch_name4="ʧ����ż�--��"
      print('�ر���LL')
   end
      l_result=utils.msgbox ( "��LL�Ƿ��Զ���Vpearl", "�Զ���Vpearl", "yesno", "?", 1 )
   if l_result and l_result=="yes" then
      print('�����Զ��һ�Vpearl')
      needvpearl=1
   else
      print('�ر��Զ��һ�Vpearl')
      needvpearl=0
   end
end
function dolostAg()
   --l_result=utils.msgbox ( "��Ҫ����ʧ�������", "����", "yesno", "?", 1 )
   do_lost_again = tonumber(GetVariable('do_lost_again'))
   if do_lost_again == 1 then 
   --if l_result and l_result=="yes" then
      print('����ʧ�����10�Σ�')
        lostno=lostno+10
        dis_all()
        return go(dhlost,'���ݳ�','����')
   else
      needdolost=0
      print('�ر���LL')
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
    create_trigger_t('dzxy1',"^>*\\s*���������죬̫����������У����ƶ�䣬����˳���Ʋ�ı�Ե���������������Щ���ۡ�",'','dzxy_finish')
    create_trigger_t('dzxy2',"^>*\\s*���������죬���Ϸ��ǵ�㣬���������Ƕ����ƶ�������ѧ�ġ���ת���ơ���Ī�����ϵ��ȴ����ʵս���鲻�㣬�޷����㿴���Ķ�����ʵ����ս��ϵ��һ��",'','dzxy_finish')
    create_trigger_t('dzxy3','^>*\\s*��� "action" �趨Ϊ "Ľ�ݶ�ת����" �ɹ���ɡ�','','dzxy_goon')    
    create_trigger_t('dzxy4',"^>*\\s*�������������",'','dzxy_finish') 
    create_trigger_t('dzxy5',"^>*\\s*�ȴ�ľ׮��������\\(down\\)��˵�ɣ�",'','dzxy_finish') 
    create_trigger_t('dzxy6',"^>*\\s*��ϲ��ϲ�����Ѿ��ڻ��ͨ�˶�ת���Ƶľ���֮����",'','dzxy_finish')
    create_trigger_t('dzxy7',"^>*\\s*���Ѿ�û��Ǳ��������ѧϰ��ת�����ˡ�",'','dzxy_finish') 
    
    create_trigger_t('dzxy8',"^>*\\s*���������죬���Ϸ��ǵ�㣬��˳�����ӵķ���ȥ��ȴ���ֲ��ֵ�ҹ�ձ���Χ�����ڵ�ס�ˡ�",'','dzxy_goon') 
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
		 dzxy_level=1  --Ľ�ݸ���ʼ(#3 w;jump liang;lingwu zihua)�����Ե�171����
		 return dzxy()
	   end
	   if skills["douzhuan-xingyi"].lvl>170 and skills["douzhuan-xingyi"].lvl<200 then
		 dzxy_level=2  --��ʩˮ�� ȥ:sit chair;zhuan;n;lingwu miji ��:s;push shujia�����Ե�201����
		 return dzxy()
	   end
		if skills["douzhuan-xingyi"].lvl>200 and skills["douzhuan-xingyi"].lvl<hp.pot_max-100 and (locl.time=="��" or locl.time=="��" or locl.time=="��" or locl.time=="��") then
		 dzxy_level=3  --����̨ ��ȥjump zhuang;look sky������jump down��ֻ������look sky�����Ե�N����
		 return dzxy()
	   end
		messageShow('�����أ�Ľ������ת����������������������','white')
		print("dzxy_level:"..dzxy_level)
	end
    
 return go(xueshan_finish_ask,'��ѩɽ','���Ŀ�')
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
    exe('nick �������ˮ������')
    messageShow('�����أ�ȥĽ�������ֻ�ȥ�ˣ�','white')
    go(dzxy1_unwield,'������','��ˮ��')
end
function dzxy2_go()
    exe('nick �����뻹ʩˮ������')
    messageShow('�����أ�ȥĽ�������ؼ�ȥ�ˣ�','white')
    go(dzxy2_unwield,'������','��ʩˮ��')
end
function dzxy3_go()
    exe('nick ���������̨����')
    messageShow('�����أ�ȥĽ�ݿ�����ȥ�ˣ�','white')
    go(dzxy3_unwield,'������','����̨')
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
    if not (locl.room=="����̨" or locl.room=="��ʩˮ��" or locl.room=="����") then
	messageShow("Ľ�����򣺶�ת���Ƶ�λ�ò��ԣ���ǰλ�ã�"..locl.room)
       return dzxy_finish()
    end
    EnableTriggerGroup("dzxy",true)
	local leweapon=GetVariable("learnweapon")
	exe('wield '..leweapon)
	
	if not skills["douzhuan-xingyi"] or skills["douzhuan-xingyi"].lvl==0 or skills["douzhuan-xingyi"].lvl>=hp.pot_max-100 then
	messageShow("Ľ�����򣺶�ת���Ƶĵȼ����ԣ���ǰ�ȼ���"..skills["douzhuan-xingyi"].lvl)
	   return check_busy(dzxy_finish)
	end
    if flag.idle>7 then
       return check_busy(dzxy_finish)
    end
    if hp.neili<hp.neili_max*0.5 then
	messageShow("Ľ�����򣺶�ת���Ƶ�������������ǰ������"..hp.neili.."��",'white')
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
    exe('alias action Ľ�ݶ�ת����')
end
function dzxy_finish()
    EnableTimer('mr_dzxy_timer',false)
    DeleteTimer("mr_dzxy_timer")
    messageShow('�����أ�Ľ�ݶ�ת������ɣ�')
    exe('jump down')
    EnableTriggerGroup("dzxy",false)
    DeleteTriggerGroup("dzxy")
    exe('cha;hp')
    weapon_unwield()
   local leweapon=GetVariable("learnweapon")
   exe('unwield '..leweapon)
   exe('jump down')
   return go(xueshan_finish_ask,'��ѩɽ','���Ŀ�') 
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
        ---pumkmai����
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
        tmp_lxskill=tmp_lxskill..'bei cuff;hp;unset ����'
end
function set_sxlian()
        print('set_sxlian..........2222222222222222222222')
        dazuo_lianxi_auto()
		print('tmp_lxskill...:'..tmp_lxskill)
        create_alias('sx1lian','sx1lian','alias sxlian '..tmp_lxskill)
        Execute('sx1lian')
end

-----------�Զ�ץѩ��by�һ����޷���2019.3.16----------
function check_xuezhu_status()
        local xuezhu_status=GetVariable("xuezhu_status")
        if xuezhu_status==nil then
           messageShow('δ�ҵ�ѩ�������xuezhu_status���뾡�����ã�','white','black')
        elseif xuezhu_status=="0" then
           messageShow('���ܻ�δץ��ѩ�룬�����Զ�ץѩ������ˣ�ǰ��ץѩ�룡','white','black')
           return xuezhu_status
        elseif xuezhu_status=="1" then
           messageShow('���ʳ�����Ҫ���浤������ǰ��ץѩ�룡','white','black')
           return xuezhu_status
        elseif xuezhu_status=="-1" then
           messageShow('�����ظ��˼ٵ���С���ˣ�ŭ����������ǰ��ץѩ�룡','white','black')
           return xuezhu_status
        end
end
cnt_yaoshuteng=0
function xuezhuTrigger()
    cnt_yaoshuteng=0
    DeleteTriggerGroup("xuezhuAsk")
    create_trigger_t('xuezhuAsk1',"^(> )*��������ش����йء��嶾�̡�����Ϣ",'','xuezhuAsk')
    create_trigger_t('xuezhuAsk2',"^(> )*����û������ˡ�$",'','xuezhuNobody')
    SetTriggerOption("xuezhuAsk1","group","xuezhuAsk")
    SetTriggerOption("xuezhuAsk2","group","xuezhuAsk")
    EnableTriggerGroup("xuezhuAsk",false)
    DeleteTriggerGroup("xuezhuAccept")
    create_trigger_t('xuezhuAccept1',"^(> )*������˵�������嶾�̵Ľ��������˸����滨��ݣ����д󲿷־��о޶�\\D*",'','xuezhuAccept')
    create_trigger_t('xuezhuAccept2',"^(> )*����һ�ž�ѩ���Ƶ���$",'','eatDan')
    create_trigger_t('xuezhuAccept3',"^(> )*���һ�ž�ѩ���Ƶ�������ҧ�麬������پ��������ʣ���ɫ����$",'','xuezhu_go')
    create_trigger_t('xuezhuAccept4',"^(> )*������˵���������ϴδ�Ӧ�ҵ����黹û��\\D*",'','fakeDan')
    SetTriggerOption("xuezhuAccept1","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept2","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept3","group","xuezhuAccept")
    SetTriggerOption("xuezhuAccept4","group","xuezhuAccept")
    EnableTriggerGroup("xuezhuAccept",false)
    DeleteTriggerGroup("xuezhuFight")
    create_trigger_t('xuezhuFight1','^(> )*��ζ��˰��죬����ʲ��Ҳû��','','xuezhuFailNew')
    create_trigger_t('xuezhuFight2','^(> )*������ҡ�����٣���Ȼ����һֻѩ�롣','','xuezhuFight')
    create_trigger_t('xuezhuFight3','^(> )*ѩ����־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','getxuezhuX')
    create_trigger_t('xuezhuFight4',"^(> )*�㽫ѩ������������ڱ��ϡ�",'','givecheng')
        create_trigger_t('xuezhuFight5',"^(> )*ѩ�롸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','xuezhuFailNew')
        --create_trigger_t('xuezhuFight6',"^(> )*(�㸽��û������������|ѩ��ͻȻ�ڵ����ϲ����ˡ�)",'','xuezhuFail')
        create_trigger_t('xuezhuFight6',"^(> )*ѩ��ͻȻ�ڵ����ϲ����ˡ�",'','xuezhuFailNew')
    SetTriggerOption("xuezhuFight1","group","xuezhuFight")
    SetTriggerOption("xuezhuFight2","group","xuezhuFight")
    SetTriggerOption("xuezhuFight3","group","xuezhuFight")
    SetTriggerOption("xuezhuFight4","group","xuezhuFight")
        SetTriggerOption("xuezhuFight5","group","xuezhuFight")
        SetTriggerOption("xuezhuFight6","group","xuezhuFight")
    EnableTriggerGroup("xuezhuFight",false)
    DeleteTriggerGroup("xuezhuFinish")
    create_trigger_t('xuezhuFinish1','^(> )*������˵���������Ȼ�Զ����ţ��´���Ҫ��ȥ�嶾�������Ұɡ���','','xuezhuFinish')
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
        go(askcheng,'�置','ҩ����')
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
        exe('ask cheng about �嶾��')
        create_timer_s('walkWait4',3.0,'askcheng1')
end
function askcheng1()
        exe('ask cheng about �嶾��')
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
        if not Bag["����"] and drugPrepare["����"] then
           if locl.weekday == '��' and locl.hour ==8 then
          return checkPrepareOver()
           else
                  return checkFire()
           end
        end
        EnableTriggerGroup("xuezhuAccept",false)
        EnableTriggerGroup("xuezhuFight",true)
        go(yaoshuteng,'�置','ɽ��')
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
            messageShow('ѩ�벻�ڣ�һ������ץ��','white','black')
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
        go(givexuezhu,'�置','ҩ����')
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
           messageShow('�����ѳɹ�ץ��ѩ�룬�밲����Ϸ����)','red','black')
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
-----------�Զ�ץѩ��by�һ����޷���2019.3.16----------
zxz_dfly=function()
DeleteTriggerGroup("zxz_dfly")
create_trigger_t('zxz_dfly1','^(> )*ѩ����־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��','','getxue_zhuX')
create_trigger_t('zxz_dfly2',"^(> )*�㽫ѩ������������ڱ��ϡ�",'','give_cheng')
create_trigger_t('zxz_dfly3',"^(> )*���������һֻѩ�롣",'','xz_finish')
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
go(yao_shuteng,'�置','ɽ��')
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
			 local l, w = wait.regexp('^(> )*�������е����˱�ȥ��������˸���',1)
			 if l~=nil then break end 
		 end
   end)
end

function getxue_zhuX()
exe('get xue zhu')
end
function give_cheng()
   go(give_xuezhu,'�置','ҩ����')
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
messageShow('�����ѳɹ�ץ��ѩ�룡��)','red','black')
SetVariable("xuezhu_status","2")
SetVariable('xuezhu_time',10)
return checkPrepareOver()
end
-------------ʳ�����ˮ---------------
function buyrl()
go(ylbuy,"�����","����")
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
return go(wudang_eat,'�䵱ɽ','��ͤ')
end

-------------�һ�����--------------
function dh_tlbb()
go(tlbbb,"���ݳ�","����")
end
function tlbbb()
exe('duihuan tianlong')
DoAfterSpecial(3,'read book;hp;setjob',10)
end
------------�η���----------
killrfy=function()
DeleteTriggerGroup("killrfy")
create_trigger_t('killrfy1','^(> )*�η��ࡸž����һ�����ڵ��ϣ������ų鶯�˼��¾�����','','get_jinchai')
create_trigger_t('killrfy2','^(> )*����û�������','','get_jinchai')
SetTriggerOption("killrfy1","group","killrfy")
SetTriggerOption("killrfy2","group","killrfy")
EnableTriggerGroup("killrfy",true)
go(krfy,"huanghe/huanghe6")
end

function krfy()
   exe('look')
   if not locl.id["�η���"] then
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
--------------������-------------
jinheTrigger=function()
print('jinheTrigger........')
DeleteTriggerGroup("jinheTrigger")
create_trigger_t('jinheTrigger1',"^>*\\s*�㿴�˰��죬Ҳû����������ӵ�������ô���¡�",'','jinhe_goon')
create_trigger_t('jinheTrigger2',"^>*\\s*���ӵļв��Ѿ��򿪣��������ϸ�����ӣ�look jinhe��Ȼ���ȡ��Ӧ�ж���",'','jinhe_find')
create_trigger_t('jinheTrigger3',"^>*\\s*���ݺὭ��ʱ����(\\D*)����Щ�����£�����Ե��ǰȥ�ھ�",'','jinhe_get')
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

--------------�Զ�������-------------
jinhe_city=nil
jinhe_room=nil
jinhe_rooms={}
dig_num=0
room_idx=0
autojinheTrigger=function()
print('autojinheTrigger........')
DeleteTriggerGroup("autojinheTrigger")
--create_trigger_t('autojinheTrigger1',"^>*\\s*�㿴�˰��죬Ҳû����������ӵ�������ô���¡�",'','autojinhe_goon')
create_trigger_t('autojinheTrigger2',"^>*\\s*���ӵļв��Ѿ��򿪣��������ϸ�����ӣ�look jinhe��Ȼ���ȡ��Ӧ�ж���",'','autojinhe_find')
create_trigger_t('autojinheTrigger3',"^>*\\s*���ݺὭ��ʱ����(\\D*)����Щ�����£�����Ե��ǰȥ�ھ�",'','autojinhe_get')
--SetTriggerOption("autojinheTrigger1","group","autojinheTrigger")
SetTriggerOption("autojinheTrigger2","group","autojinheTrigger")
SetTriggerOption("autojinheTrigger3","group","autojinheTrigger")
EnableTriggerGroup("autojinheTrigger",true)
 messageShow('�Զ��ڿ�׼������ʼ������!','red')
 create_timer_s('walkWait4',1.0,'autojinhe_goon')
 exe('jiancha jinhe')

end
autojinhe_goon=function()
   exe('jiancha jinhe')
end

function autojinhe_get_test()
 local jinhe_didian='�����볤��'
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
 
 ColourNote ("red","blue","׼��ȥ"..jinhe_didian..'�ڱ�.......')
 
 if jinhe_city and countTab(jinhe_rooms)==1 then
    print('������������......')
    return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 elseif jinhe_city and countTab(jinhe_rooms)>1 then 
    print('�����������......')
	job.name='get_jinhe'
    room_idx=1
	--jinhe_room = jinhe_rooms[room_idx]
	return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 else
    ColourNote ("red","blue","�޷��鵽������еص㣺"..jinhe_didian)
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
 
 ColourNote ("red","blue","׼��ȥ"..jinhe_didian..'�ڱ�.......')
  messageShow('�Զ��ڿ�ʼ��׼��ȥ��'..jinhe_didian..'���ڱ���','red')
 
 if jinhe_city and countTab(jinhe_rooms)==1 then
    print('������������......')
    return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 elseif jinhe_city and countTab(jinhe_rooms)>1 then 
    print('�����������......')
	job.name='get_jinhe'
    room_idx=1
	--jinhe_room = jinhe_rooms[room_idx]
	return go(autoDigTrigger,jinhe_city,jinhe_room)
	
 else
    ColourNote ("red","blue","�޷��鵽������еص㣺"..jinhe_didian)
	return checkPrepareOver()
 end
 
end
autojinhe_find=function()
    EnableTimer('walkWait4',false)
    exe('look he')
end

function autoDigTrigger()
  DeleteTriggerGroup("autoDigTrigger")
  create_trigger_t('autoDigTrigger1',"^>*\\s*��������ѽ��",'','autoDigAgain')
  create_trigger_t('autoDigTrigger2',"^>*\\s*������һ��ʲôҲû���ҵ���",'','autoDigAgain')
  create_trigger_t('autoDigTrigger3',"^>*\\s*������������ó���(\\D*)",'','autoDigFinish')
  create_trigger_t('autoDigTrigger4',"^>*\\s*���Ȼ����������һ��������",'','autoDigAgain')
  create_trigger_t('autoDigTrigger5',"^>*\\s*�㻹��ר����ս�ɣ�",'','autoDigAgain')
  create_trigger_t('autoDigTrigger6',"^>*\\s*����һ��ʱ���Ѱ�ң����ڵ���һЩҩ�ݡ�",'','autoDigAgain')
  
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
   ColourNote ("red","blue","�Ѿ���"..jinhe_city..jinhe_room..'����ڱ�')
   messageShow('�Զ��ڿ���ɣ���á�'..get_gold..'����','red')
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
     print('����һ���ط�......')
	 room_idx = room_idx  + 1
	 return go(autoDigTrigger,jinhe_city,jinhe_room)
   end    
end 

function autoDig()
   exe('dig')
end

-----------����Ʊ-----------
function checkcash()
return go(check_cun_cash,"������","����ի")
end
function check_cun_cash()
local l_cnt=Bag["ҼǪ����Ʊ"].cnt
exe('cun '.. l_cnt ..' cash')
   return check_halt(check_jobx)
end


weapon_lose=function()
  DeleteTriggerGroup("weapon_lose")
  create_trigger_t('weapon_lose1',"^>*\\s*��ʿ��һת�۾���ûӰ���ˣ�һ����������һ��(\\D*)��Ȼ��֪������ȥ�ˡ�",'','weapon_found')
  create_trigger_t('weapon_lose2',"^>*\\s*��ʿ������ص����㣬����ܲ����˵����ӡ�",'','weapon_no_found')
  create_trigger_t('weapon_lose3',"^>*\\s*���״̬���ȶ������Ժ�",'','weapon_no_found')
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



-----�һ�����ʯͷ----
function stoneSet() 
   stonePrepare={}
   local t={
   ["�ྦྷʯ"] = "�ྦྷʯ",
   ["����ʯ"] = "����ʯ",
   }
   if GetVariable("stoneprepare") then
      tmp.stone = utils.split(GetVariable("stoneprepare"),'|')
	  tmp.pre = {}
      for _,p in pairs(tmp.stone) do
          tmp.pre[p]=true
      end
   end
   local l_tmp=utils.multilistbox ("��׼���Ե�ʯͷ(�밴CTRL��ѡ)��?", "��Ʒ���", t,tmp.pre)
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
   l_result=utils.inputbox ("��һ�ʯͷ�Ĵ����ǣ�", "stonecishu", GetVariable("stonecishu"), "����" , "12")
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
	   ColourNote ("red","blue","�鱦����ţ��޷���ʯͷ�����һ���ٳ��ԣ�")
    else
      return go(duihuan_prepare,'���ݳ�','����')
    end
end
function duihuan_prepare()
	tmp.redstone=0
	tmp.bluestone=0
	flag.redstone=false
	flag.bluestone=false
	flag.duihuan=0
    DeleteTriggerGroup("duihuanstone")
    create_trigger_t('duihuanstone1',"^(> )*�����ϰ�ߺ��һ����"..score.name.."�һ����Ƽ�����(�ྦྷʯ|����ʯ).*",'','stone_consider')
    create_trigger_t('duihuanstone2',"^(> )*���ϰ�һ��ץ��(�ྦྷʯ|����ʯ)�������ۣ��ö���ѽ����",'','maistone_set')
	create_trigger_t('duihuanstone3',"^(> )*�㻹�Ƕ�Ŭ��һ��ʱ��ɡ�",'','duihuan_done')
	create_trigger_t('duihuanstone4',"^(> )*����Ҫ�������е���Ʒ�����ٴζһ���",'','check_stoneT')
    SetTriggerOption("duihuanstone1","group","duihuanstone")
    SetTriggerOption("duihuanstone2","group","duihuanstone")
	SetTriggerOption("duihuanstone3","group","duihuanstone")
	SetTriggerOption("duihuanstone4","group","duihuanstone")
    return duihuanStone()
end
function duihuanStone()
    if stonePrepare["�ྦྷʯ"] and tmp.redstone<tonumber(GetVariable("stonecishu")) then
	   flag.duihuan=1
       exe('duihuan redstone')
    end
    return check_busy(duihuanStone1,3)
end
function duihuanStone1()
    if stonePrepare["����ʯ"] and tmp.bluestone<tonumber(GetVariable("stonecishu")) then
	   flag.duihuan=2
       exe('duihuan bluestone')
	end
end
function stone_consider(n,l,w)
	local x=tostring(w[2])
    if x=='�ྦྷʯ' then
	   flag.redstone=true
       tmp.redstone=tmp.redstone+1
    end
    if x=='����ʯ' then
	   flag.bluestone=true
       tmp.bluestone=tmp.bluestone+1
    end
	return stone_consider_go()
end
function stone_consider_go()
	if stonePrepare["�ྦྷʯ"] and stonePrepare["����ʯ"] and flag.redstone and flag.bluestone then 
	   return check_busy(mai_stone,3)
	end
	if stonePrepare["�ྦྷʯ"] and not stonePrepare["����ʯ"] and flag.redstone then 
	   return check_busy(mai_stone,3)
	end
	if not stonePrepare["�ྦྷʯ"] and stonePrepare["����ʯ"] and flag.bluestone then 
	   return check_busy(mai_stone,3)
	end
end
function duihuan_done()
	if stonePrepare["�ྦྷʯ"] and stonePrepare["����ʯ"] then 
	   if flag.duihuan==1 then
		  stonePrepare["�ྦྷʯ"]=false
		  tmp.redstone=tonumber(GetVariable("stonecishu"))
		  return
	   end
	   if flag.duihuan==2 then
		  stonePrepare["����ʯ"]=false
		  tmp.bluestone=tonumber(GetVariable("stonecishu"))
	   end
	end
	if stonePrepare["�ྦྷʯ"] and not stonePrepare["����ʯ"] then
	   stonePrepare["�ྦྷʯ"]=false
       tmp.redstone=tonumber(GetVariable("stonecishu"))
       tmp.bluestone=tonumber(GetVariable("stonecishu")) 
	end
	if not stonePrepare["�ྦྷʯ"] and stonePrepare["����ʯ"] then
	   stonePrepare["����ʯ"]=false
       tmp.redstone=tonumber(GetVariable("stonecishu"))
       tmp.bluestone=tonumber(GetVariable("stonecishu"))
	end
	return check_stone()	
end
function mai_stone()
	return go(mai_stone_check,"���ݳ�","�鱦��")
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
	if w[2]=='�ྦྷʯ' then flag.redstone=false end
	if w[2]=='����ʯ' then flag.bluestone=false end
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
	return go(duihuanStone,"���ݳ�","����")
end
function check_stone1()
	if Bag and Bag["�ྦྷʯ"] then
	   flag.redstone=true
	end
	if Bag and Bag["����ʯ"] then
	   flag.bluestone=true
	end
	if flag.redstone or flag.bluestone then
	   return mai_stone()
	else
	   ColourNote ("red","blue","��ѡ���ʯͷ����һ��ļ��ޣ����ζһ���ϣ�")
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

------- ΤС�� -----------------------
function buy_wxb_weapon_prepare()
    dis_all()
    DeleteTriggerGroup("buywxbweapon")
    create_trigger_t('buywxbweapon1',"^>*\\s*Τ����˵��������λ��̨��������˵�����ǹԶ�������(\\D*)�������ء���",'','buy_wxb_weapon_go')
	create_trigger_t('buywxbweapon2',"^>*\\s*¹������С������ΤС��\\(Wei xiaobao\\)",'','follow_wxb')
	create_trigger_t('buywxbweapon3',"^>*\\s*ΤС��Ŀǰ�������»��",'','buy_wxb_weapon')
    SetTriggerOption("buywxbweapon1","group","buywxbweapon")
	SetTriggerOption("buywxbweapon2","group","buywxbweapon")
	SetTriggerOption("buywxbweapon3","group","buywxbweapon")
	EnableTriggerGroup('buywxbweapon',true)
	
    return go(buy_wxb_weapon_ask_wei,'���ݳ�','����Ժ')
end

function buy_wxb_weapon_ask_wei()
   exe('ask wei about ΤС��')
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



-----�����Զ�����ϼ�� by �޷���2019.12.25------
xxkFind=function()
    DeleteTriggerGroup("xxkFind")
    create_trigger_t('xxkFind1','^(> )*\\s*��ϼ��\\(Xu xiake\\)','','xxkFindFollow')
    create_trigger_t('xxkFind2','^(> )*����û�� xu xiake','','xxkFindGoon')
    create_trigger_t('xxkFind3','^(> )*���������\\D*һ���ж���','','xxkFindDone')
    create_trigger_t('xxkFind4','^(> )*���Ѿ��������ˡ�','','xxkFindDone')
    SetTriggerOption("xxkFind1","group","xxkFind")
    SetTriggerOption("xxkFind2","group","xxkFind")
    SetTriggerOption("xxkFind3","group","xxkFind")
    SetTriggerOption("xxkFind4","group","xxkFind")
    EnableTriggerGroup("xxkFind",false)
        cntr1 = countR(20)
        job.name="����ϼ��"
        return go(xxkFindFact,"���ݳ�","������")
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
        ColourNote ("red","blue","�����ҵ���ϼ�������ͷ���뿪ʼ��ĺٺٺ١�����")
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
           ColourNote ("red","blue","������ϵ�����ϣ�Ŀǰ�ǡ�ѩɽ��+����ɽ����")
    end        
        if hp.shen>0 then
           if job.zuhe["xueshan"] then 
          job.zuhe["xueshan"]=nil
                  job.zuhe["songmoya"]=nil
          job.zuhe["wudang"]=true 
       end
           l_result = 'huashan_wudang'
           SetVariable("jobzuhe",l_result)
           ColourNote ("red","blue","������ϵ�����ϣ�Ŀǰ�ǡ��䵱��+����ɽ����")
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

----- ����׼�� --------------

function reboot_prepare()
    wait.make(function()
	    await_go('���ݳ�','�ӻ���')
		thread = coroutine.running()
	    cunSomeThing('fire',3,thread)
		coroutine.yield()
		cunSomeThing('sheng zi',3,thread)
		coroutine.yield()
		cunSomeThing('jin chai',3,thread)
		coroutine.yield()
	end)
end

---- ÿ��������12�� �Զ�worship lao ren  -------------------
---- ��ȡ�ɹ���д�뵽���������ļ���
function auto_worship_laoren()
    wait.make(function()
	    await_go('̩ɽ','����֮��')
		wait_busy()
		exe('worship lao ren')
		wait_busy()
		SetVariable('worship_done','1')
		return checkJob_ex()
	end)
end





