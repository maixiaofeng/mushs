
n_cnt = 0
s_cnt = 0
w_cnt = 0
e_cnt = 0
_bagua_con = 0
sw_cur = 0
zhou_visited = 0
hb_ok = 1
_dir = ''
_bagua_des = ''
quest_name = ''
quest_learned = ''
function thz_triggers()
    DeleteTriggerGroup('thzdazuo')
    create_trigger_t('thzdazuo1','^(> )*(����Ƭ�̣���о��Լ��Ѿ��������޼���|�㽫��������������֮�ư�����һ��|��ֻ��������ת˳����������������|�㽫������ͨ���������|��ֻ����Ԫ��һ��ȫ��������|�㽫��Ϣ���˸�һ������|�㽫��Ϣ����ȫ������ȫ���泩|�㽫�����������ڣ���ȫ��ۼ�����ɫ��Ϣ|�㽫����������������һ������|���˹���ϣ�վ������|��һ�������н������������ӵ�վ������|��ֿ�˫�֣�������������|�㽫��Ϣ����һ�����죬ֻ�е�ȫ��̩ͨ|������������������һ�����죬�����������ڵ���|������������������һ�����죬���������ڵ���|��˫��΢�գ���������ؾ���֮����������|���������������뵤������۾�|�㽫��Ϣ������һ��С���죬�������뵤��|��о�����ԽתԽ�죬�Ϳ�Ҫ������Ŀ����ˣ�|�㽫������Ϣ��ͨ���������������۾���վ������|������������һ��Ԫ����������˫��|�������뵤�������ת�����������չ�|�㽫����������������������һȦ���������뵤��|�㽫��Ϣ����������ʮ�����죬���ص���|�㽫��Ϣ���˸�С���죬���ص���չ�վ������|����Ƭ�̣������������Ȼ�ں���һ�𣬾����ӵ�վ����|��е��Լ��������Ϊһ�壬ȫ����ˬ��ԡ���磬�̲�ס�泩��������һ���������������۾�)','','thz_thd')
	create_trigger_t('thzdazuo2','^(> )*һ��ů�����Ե�������ȫ�����������ָֻ���֪������','','thz_error')	
	SetTriggerOption('thzdazuo1','group','thzdazuo')
	SetTriggerOption('thzdazuo2','group','thzdazuo')
    DeleteTriggerGroup('shizi')
	create_trigger_t('shizi1','^(> )*\\s*(\\D*)��ʯ��\\(Shizi\\)','','thz_szcnt')
	SetTriggerOption('shizi1','group','shizi')
	EnableTriggerGroup('shizi',false)
	DeleteTriggerGroup('thzthd')
	create_trigger_t('thzthd','^(> )*�����ۡ���һ��ײ���˰��ߣ��㼱æ���������˰���','','thz_thd')
	SetTriggerOption('thzthd','group','thzthd')
	DeleteTriggerGroup('thzcal')
	create_trigger_t('thzcal1','^(> )*\\s*(\\D*)��ʯ��\\(Shizi\\)','','thz_cal1')
	SetTriggerOption('thzcal1','group','thzcal')
	EnableTriggerGroup('thzcal',false)
	DeleteTriggerGroup('thzact')
	create_trigger_t('thzact1','^(> )*�һ���\\s*-','','thz_act1')
	create_trigger_t('thzact2','^(> )*�㶪��һЩʯ�ӡ�','','thz_north')
	create_trigger_t('thzact3','^(> )*�һ���\\s*-','','thz_steps')
	SetTriggerOption('thzact1','group','thzact')
	SetTriggerOption('thzact2','group','thzact')
	SetTriggerOption('thzact3','group','thzact')
	EnableTriggerGroup('thzact',false)
	DeleteTriggerGroup('thzout')
	create_trigger_t('thzout1','^(> )*СԺ\\s*-','','thz_out')
	SetTriggerOption('thzout1','group','thzout')
	DeleteTriggerGroup('thzpath')
	create_trigger_t('thzpath1','^(> )*һ����ֵ������ԣ����水˳ʱ��˳�������ţ�(\\D*)��','','thz_path')
	SetTriggerOption('thzpath1','group','thzpath')
	DeleteTriggerGroup('thzzhou')
	create_trigger_t('thzzhou1','^(> )*��Ҫ��˭�����������','','thz_wrong_path')
	create_trigger_t('thzzhou2','^(> )*�����ǰȥ�������ؽ�����ס�ܲ�ͨ��˫�֣�������˵����������','','thz_correct_path')
	SetTriggerOption('thzzhou1','group','thzzhou')
	SetTriggerOption('thzzhou2','group','thzzhou')
	DeleteTriggerGroup('thzask')
	create_trigger_t('thzask1','^(> )*�ܲ�ͨ˵������(\\D*)��','','thz_zhouask')
	create_trigger_t('thzask2','^(> )*����ܲ�ͨһ�����С�','','thz_jyzj1')	
	create_trigger_t('thzask3','^(> )*�ܲ�ͨ������˵�������ԹԵ�����˵���°ɡ���','','thz_jyzj2')
	create_trigger_t('thzask4','^(> )*�ܲ�ͨ���㲻�ʺ����������������˵�ˡ�','','thz_jyzj3')
	create_trigger_t('thzask5','^(> )*�ܲ�ͨ˵����£������ĵ��ʵ������ֵܣ���ʲô������书ô����','','thz_jyzj4')
	create_trigger_t('thzask6','^(> )*�����³�¼��һ�ݾ����澭���Ͼ�','','thz_jyzjx')
	create_trigger_t('thzask7','^(> )*���������ʳָ�ڵ��ϻ��������������ķ����е���ԲȦ��ԲȦ���е��󷽿顣','','thz_fangyuan')
	create_trigger_t('thzask8','^(> )*�ܲ�ͨ¶���Ի�����顣','','thz_jywait')
	SetTriggerOption('thzask1','group','thzask')
	SetTriggerOption('thzask2','group','thzask')
	SetTriggerOption('thzask3','group','thzask')
	SetTriggerOption('thzask4','group','thzask')
	SetTriggerOption('thzask5','group','thzask')
	SetTriggerOption('thzask6','group','thzask')
	SetTriggerOption('thzask7','group','thzask')
	SetTriggerOption('thzask8','group','thzask')
	DeleteTriggerGroup('thzqok')
	create_trigger_t('thzqok1','^(> )*��ѧ���ˡ����һ�������','','thz_questdone1')
	create_trigger_t('thzqok2','^(> )*��ġ�����ȭ�������ˣ�','','thz_questdone2')
	create_trigger_t('thzqok3','^(> )*�㽫�����澭���Ͼ�С�ĵĳ�¼������','','thz_questdone3')
	SetTriggerOption('thzqok1','group','thzqok')
	SetTriggerOption('thzqok2','group','thzqok')
    SetTriggerOption('thzqok3','group','thzqok')
	DeleteTriggerGroup('thz_leave')
	create_trigger_t('thzleave1','^(> )*��ҩʦһ���֣�����һ��������������λ׳ʿ��½�ء�','','thz_leave')
	SetTriggerOption('thzleave1','group','thzleave')
end
function thz_triggers_remove()
    DeleteTriggerGroup('thzdazuo')
	DeleteTriggerGroup('shizi')
	DeleteTriggerGroup('thzthd')
	DeleteTriggerGroup('thzcal')
	DeleteTriggerGroup('thzact')
	DeleteTriggerGroup('thzout')
	DeleteTriggerGroup('thzpath')
	DeleteTriggerGroup('thzzhou')
	DeleteTriggerGroup('thzask')
	DeleteTriggerGroup('thzqok')
	DeleteTriggerGroup('thz_leave')
end
function thz_bfstart()
    create_alias_s('th_start','th_start','thz_start')
	print('������Ķ��������ݣ�')
    ColourNote('red','black','�٣����շ��һ����ϵĸ���ǰ��������δ�����������������׼������')
	ColourNote('red','black','�٣�����ȷ�����Ǳ���㹻���н��գ���ģ�鲻���м��')
	ColourNote('skyblue','black','�ڣ������Ƿ��һ������Ӷ�����ʹ��')
	ColourNote('skyblue','black','�ۣ������һ�������ʱ�������Ͻ�����������ȴ������ٽ���')
	ColourNote('skyblue','black','�ܣ����ܲ�ͨ��ģ���ȴ������ӣ���ʱ����˵��')
	ColourNote('skyblue','black','����Ҹ���˵����������ʱ�����Զ����ش�½��')
	ColourNote('yellow','black','�ݣ�ż�������ε��ˣ���ģ����Զ�������Ϊ')
	ColourNote('yellow','black','˵���Ķ������Ҫ��ʼ�����룺 th_start')
end
function thz_start()
    n_cnt = 0
    s_cnt = 0
    w_cnt = 0
    e_cnt = 0
    _bagua_con = 0
    sw_cur = 0
    zhou_visited = 0
    hb_ok = 1
    _dir = ''
    _bagua_des = ''
    quest_name = ''
    quest_learned = ''
	thz_triggers_remove()
    exe('nick ȥ���ܲ�ͨ����')
	EnableTriggerGroup('fight',false)
    EnableTimer('idle',false)
    thz_triggers()
	EnableTriggerGroup('shizi',true)
    exe('hp;cha')
	if score.party == '�һ���' then
	   return thz_prework()
	else
	   if hp.food < 60 or hp.water < 60 then
	      return thz_eat()
	   else
          checkBags()	   
          return checkWait(thz_check,1)
	   end
	end
end
function thz_eat()
    if locl.room == '��ͤ' then
	   exe('sit chair;knock table;get tao;#3(eat tao);get cha;#3(drink cha);drop cha;drop tao;hp')
	   checkBags()	   
       return checkWait(thz_check,1)
	else
	   return go(thz_eat,'�䵱ɽ','��ͤ')
	end
end
function thz_check()
    if not Bag['ʯ��'] then
       return thz_shizi()
	else
	   return exe('i')
	end
end
function thz_szcnt(n,l,w)
	if tonumber(trans(w[2])) < 80 then
	   return thz_shizi()
	else
	   return thz_go()
	end
end
function thz_shizi()
    if locl.room == '������' then
	   exe('buy shizi')	   
	   return check_bei(thz_go)
	else
	   return go(thz_shizi,'���ݳ�','������')
	end
end
function thz_go()
	if locl.room == '����' then
	   exe('look rock;jump boat')
	else
	   return go(thz_go,'�һ���','����')
	end
end
function thz_thd()
    exe('time')
	if MidNight[locl.time] then
	   return check_bei(thz_dazuo)
	elseif not MidNight[locl.time] then
       return check_bei(thz_ready)
	end
end
function thz_dazuo()
    exe('time;yun qi;sxlian;yun jingli;dazuo '..hp.dazuo)
end
function thz_ready()
    EnableTriggerGroup('shizi',false)
    EnableTriggerGroup('thzcal',true)
	EnableTriggerGroup('thzact',true)
	EnableTrigger('thzact3',false)
    exe('northup;northdown')
end
function thz_cal1(n,l,w)
    if _dir == 'north' then
	   n_cnt = tonumber(trans(w[2]))	   
    elseif _dir == 'south' then
	   s_cnt = tonumber(trans(w[2]))
    elseif _dir == 'west' then
	   w_cnt = tonumber(trans(w[2]))
    elseif _dir == 'east' then
	   e_cnt = tonumber(trans(w[2]))
    end
end
function thz_steps()
    if _dir == 'north' then
	   return checkWait(thz_south,0.2)
	elseif _dir == 'south' then
	   return checkWait(thz_west,0.2)
	elseif _dir == 'west' then
	   return checkWait(thz_east,0.2)
	elseif _dir == 'east' then
	   return checkWait(thz_act3,0.5)
	end
end
function thz_cal2()
	if _dir == 'north' then
	   n_cnt = 10000
	elseif _dir =='south' then
	   s_cnt = 10000
	elseif _dir =='west' then
	   w_cnt = 10000
	elseif _dir =='east' then
	   e_cnt = 10000
	end
end
function thz_act1()
    EnableTriggerGroup('thzact',true)
    EnableTrigger('thzact1',false)
    exe('drop 1 shizi')
end
function thz_north()
    _dir = 'north'
	n_cnt = 0
    exe('look north')
end
function thz_south()
    _dir = 'south'
	s_cnt = 0
    exe('look south')
end
function thz_west()
	_dir = 'west'
	w_cnt = 0
    exe('look west')
end
function thz_east()
    _dir = 'east'
	e_cnt = 0
	exe('look east')
end
function thz_act3()
    EnableTrigger('thzact1',true)
	EnableTrigger('thzact3',false)
    if n_cnt < s_cnt and n_cnt < w_cnt and n_cnt < e_cnt then
	   exe('north')
	elseif s_cnt < n_cnt and s_cnt < w_cnt and s_cnt < e_cnt then
	   exe('south')
	elseif w_cnt < n_cnt and w_cnt < s_cnt and w_cnt < e_cnt then
	   exe('west')
	elseif e_cnt < n_cnt and e_cnt < s_cnt and e_cnt < w_cnt then
	   exe('east')
	else
	   print('�޷��ж���ȷ���򣬳�������ƶ�!')
	   return checkWait(thz_random,0.2)
	end
end
function thz_random()
    if math.random(1,4) == 1 then
	   return exe('north')
	elseif math.random(1,4) == 2 then
	   return exe('south')
	elseif math.random(1,4) == 3 then
	   return exe('west')
	else
	   return exe('east')
	end
end
function thz_error()
    if zhou_visited == 0 then
       return thz_start()
	else
	   return thz_leave()
	end
end
function thz_out()
    EnableTriggerGroup('thzact',false)
	EnableTriggerGroup('thzcal',false)
	exe('north;north')
	score.party = '�һ���'
	if zhou_visited == 0 then
	   locate()
	   return checkWait(thz_prework,1.2)
	else
	   return thz_fin()
	end
end
function thz_prework()
    if locl.room == '����ͤ' then
	   exe('ask huang yaoshi about �ܲ�ͨ')
	   return check_bei(thz_prework2)
	else
	   return go(thz_prework,'�һ���','����ͤ')
	end
end
function thz_prework2()
    score.party = '�һ���'
    if locl.room == '����' then
	   exe('ask huang rong about �ܲ�ͨ')
	   score.party = ''
	   exe('score')
	   if score.party == '�һ���' then
	      return go(thz_correct_path,'�һ���','�Ҷ�')
	   else
	      score.party = '�һ���'
	      return check_bei(thz_bagua)
	   end
	else
	   return go(thz_prework2,'�һ���','����')
	end
end
function thz_bagua()
    score.party = '�һ���'
	if locl.room == '����' then
	   exe('east;drop bagua;drop bagua;west;look bagua;east;get bagua;get bagua')
	   return thz_bagua_ok()
	else
	   return go(thz_bagua,'�һ���','����')
	end
end
function thz_bagua_ok()
    if locl.room == 'ɽ��' then
	   return checkWait(thz_zhou,1)
	else
	   return go(thz_bagua_ok,'�һ���','ɽ��')
	end
end
--[[
 Ǭ���� �� ��
 ������ �� ��
 �㣺�� �� �� 
 �𣺶� �� ��
 �룺�� �� ��
 ������ �� ��
 �ޣ��� �� �� 
 �ң��� �� ��
]]
function thz_path(n,l,w)
    _bagua_des = w[2]
	print('ԭʼ���� ='.._bagua_des)
	_bagua_des = string.gsub(_bagua_des,'Ǭ','a;aa;aa;a')
	_bagua_des = string.gsub(_bagua_des,'��','b;bb;bb;b')
	_bagua_des = string.gsub(_bagua_des,'��','a;aa;ab;b')
	_bagua_des = string.gsub(_bagua_des,'��','b;bb;ba;a')
	_bagua_des = string.gsub(_bagua_des,'��','a;ab;ba;a')
	_bagua_des = string.gsub(_bagua_des,'��','b;ba;ab;b')
	_bagua_des = string.gsub(_bagua_des,'��','a;ab;bb;b')
	_bagua_des = string.gsub(_bagua_des,'��','b;ba;aa;a')
	_bagua_des = string.gsub(_bagua_des,'ab','w')
    _bagua_des = string.gsub(_bagua_des,'aa','n')
	_bagua_des = string.gsub(_bagua_des,'ba','w')
	_bagua_des = string.gsub(_bagua_des,'bb','n')
	_bagua_des = string.gsub(_bagua_des,'a;','w;')
	_bagua_des = string.gsub(_bagua_des,'b;','w;')
	_bagua_des = string.gsub(_bagua_des,';a','')
	_bagua_des = string.gsub(_bagua_des,';b','')
	print('��һ�����ܵ�����Ϊ�� '.._bagua_des)
	print('�ڶ������ܵ�����Ϊ�� '..string.gsub(_bagua_des,'w','e'))
end
function thz_zhou()
    _bagua_con = _bagua_con + 1
    if _bagua_con == 1 then
	   _bagua_des = string.gsub(_bagua_des,'e','w')
	   print('��һ�γ��ԣ�����������')
	   exe(_bagua_des..';enter;touch zhou botong')
	elseif _bagua_con == 2 then 
	   _bagua_des = string.gsub(_bagua_des,'w','e')
	   print('�ٴγ��ԣ��Ӷ�������')
	   exe(_bagua_des..';enter;touch zhou botong')
	else
	   print('�ٴγ���ʧ�ܣ��������½���')
	   _bagua_con = 0
	   return thz_out()
	end	
end
function thz_wrong_path()
    score.party = '�һ���'
	return go(thz_bagua_ok,'�һ���','ɽ��')
end
function thz_correct_path()
    zhou_visited = 1
	exe('quest')
	DeleteTimer('idlecheck')
	create_timer_m('idlecheck',2,'thz_zhoudone')
	create_alias_s('jyzhenjing','jyzhenjing','thz_jyzj')
	create_alias_s('zyhubo','zyhubo','thz_hb')
	create_alias_s('kmquan','kmquan','thz_kmq')
	create_alias_s('kmquan1','kmquan1','thz_kmq1')
	create_alias_s('leaveth','leaveth','thz_zhoudone')
    print('�ѵ����ܲ�ͨ�����Ҷ�������ϸ�Ķ�����˵����')
    ColourNote('skyblue','black','�٣�������������룺   jyzhenjing')
	ColourNote('skyblue','black','�ڣ������һ��������룺 zyhubo')
	ColourNote('skyblue','black','�ۣ������ȭ�����룺   kmquan')
	ColourNote('white','black','�ܣ�����Ϊ�˼���ѧϰ����ȭ�����룺 kmquan1 ���ֶ����ܲ�ͨѧϰ��')
	ColourNote('white','black','�ݣ������þ����澭�ؼ���ֱ������ ask zhou botong about �����澭��')
	ColourNote('red','black','���� 2 ��������������ָ����򽫻��Զ��ش�½��')
	ColourNote('yellow','black','������ǰ���������룺    leaveth')
end
function thz_hb()
    DeleteTimer('idlecheck')
	exe('ask zhou botong about ���һ���')
	return check_bei(thz_huafangyuan1)
end
function thz_fangyuan()
    hb_ok = 0
end
function thz_huafangyuan1()
    create_timer_s('huafy',2,'thz_huafangyuan2')
    exe('#20(hua fang yuan)')
end
function thz_huafangyuan2()
    DeleteTimer('huafy')
	if hb_ok == 0 then	   
	   return check_bei(thz_huafangyuan1)	   
	end
end
function thz_kmq()
    DeleteTimer('idlecheck')
    exe('ask zhou botong about ����ȭ')
end
function thz_kmq1()
    DeleteTimer('idlecheck')
	exe('cha;hp')
end
function thz_zhouask(n,l,w)
    if string.find(w[2],'���ֽ���������ʹ�˾��Ӿ�����������������ʲô��') then
	   _answer = 'answer pixie-jian'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'һ�ƴ�ʦ�����־�ѧ��ʲô��') then
	   _answer = 'answer yiyang-zhi'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��ȫ��̵��ڹ��ķ���ʲô��') then
	   _answer = 'answer xiantian-gong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���������С�ӽ��ҵ��Ʒ�����ʲô���ƣ�') then
	   _answer = 'answer anran-zhang'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�һ��Ŀ�����Ҫ��ʲô������ɨҶ�����ʩչ��') then
	   _answer = 'answer luoying-zhang'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���ֺ����ǵ��ڹ���ʲô��') then
	   _answer = 'answer yijin-jing'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'����а��������ָ����ʲô��') then
	   _answer = 'answer tanzhi-shentong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��ɽ���ڵĸ߼������ǣ�') then
	   _answer = 'answer dugu-jiujian'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��Ĺ�ɵ��ڹ��ķ���ʲô��') then
	   _answer = 'answer yunu-xinjing'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���ҵ����ʦ̫���������ֹ������޼ɴ�ĵ��ز���') then
	   _answer = 'answer jieshou-jiushi'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�μ�������ָΪ���Ľ�������ʲô���֣�') then
	   _answer = 'answer liumai-shenjian'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���õĸ�������ʲô��') then
	   _answer = 'answer niqiugong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�����ɶ������õĹ�����ʲô��') then
	   _answer = 'answer huagong-dafa'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�䵱����ͷ������������ȭ����ʲô����') then
	   _answer = 'answer taiji-quan'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�Ͻл��̻�����СѾͷ����ʲôȭ��') then
	   _answer = 'answer xiaoyaoyou'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'����ǰ������������ʲô���������߻�����ģ�') then
	   _answer = 'answer qiankun-danuoyi'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�������޼���С�ӵ��ڹ���ʲô��') then
	   _answer = 'answer jiuyang-shengong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'����а���������������ڹ�����������ڹ��������ǣ�') then
	   _answer = 'answer bihai-chaosheng'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'������ͯ���Դ�ȭ����ʲô��') then
	   _answer = 'answer kongming-quan'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���ư�������Ṧ�ǣ�') then
	   _answer = 'answer shuishangpiao'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�϶��������ڹ���ʲô') then
	   _answer = 'answer hamagong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���ҵĽ�����ʲô') then
	   _answer = 'answer huifeng-jian'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'����а���˽������ָ��ͨ��������ʲô��') then
	   _answer = 'answer yuxiao-jian'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��Ĺһ�ɵ�����ȭ������ʲô����') then
	   _answer = 'answer meinu-quan'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��ɽ���ڵ���ɽ֮����ʲô') then
	   _answer = 'answer zixia-gong'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'���صļҴ��ַ���ʲô����') then
	   _answer = 'answer lanhua-shou'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�����ɾ���ѩ�˵Ľ�����ʲô���ƣ�') then
	   _answer = 'answer jinshe-jianfa'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'�Ͻл��͹��ֵܶ�����Ʒ���ʲô') then
	   _answer = 'answer xianglong-zhang'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'Ľ�ݼҵļҴ������мܼ����ǣ�') then
	   _answer = 'answer douzhuan-xingyi'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'��������ͷ�İ����ǽ���ʲ') then
	   _answer = 'answer hansha-sheying'
	   return checkWait(thz_answer,0.2)
	end
	if string.find(w[2],'ԭ��������ͬ�����˰���') then
	   return checkWait(thz_jyzj5,0.2)
	end
	if string.find(w[2],'�����ɣ��ҽ�������Ĺ���') then
	   return checkWait(thz_jyzj5,0.2)
	end
	if string.find(w[2],'����ȭ����ʮ��·���ھ��ǣ��������ɡ���ͨ���Ρ�������Ū��ͯӹ���档') then
	   return check_bei(thz_kongmingquan1)
	end
	if string.find(w[2],'�����ڿ�û�գ���æ�����ء�') then
	   print('������Ľ���ǰ��������')
	   return thz_correct_path()
	end
end
function thz_answer()
    exe(_answer)
end
function thz_jywait()
    return checkWait(thz_jyzj50)
end
function thz_kongmingquan1()
    weapon_unwield()
    exe('ask zhou botong about ���')
	check_bei(thz_kongmingquan2)
end
function thz_kongmingquan2()
    exe('xue zhou kongming-quan')
end
function thz_questdone1(n,l,w)
    hb_ok = 1
    ColourNote('lime','black','�����һ�������������ɣ�')
	ColourNote('skyblue','black','��������ܲ�ͨ���������������Ӧָ�')
	ColourNote('skyblue','black','�٣��������������   jyzhenjing')
	ColourNote('skyblue','black','�ڣ������ȭ������   kmquan')
	ColourNote('yellow','black','������ǰ���������룺  leaveth')
end
function thz_questdone2()
    EnableTrigger('thzqok2',false)
    ColourNote('lime','black','������ȭ����������ɣ�')
	ColourNote('lime','black','����������������ֶ�ѧϰ')
	ColourNote('skyblue','black','��������ܲ�ͨ���������������Ӧָ�')
	ColourNote('skyblue','black','�٣��������������   jyzhenjing')
	ColourNote('skyblue','black','�ڣ������һ��������� zyhubo')
	ColourNote('yellow','black','������ǰ���������룺  leaveth')
end
function thz_questdone3()
    ColourNote('lime','black','�������澭����������ɣ�')
	ColourNote('skyblue','black','��������ܲ�ͨ���������������Ӧָ�')
	ColourNote('skyblue','black','�٣������ȭ������   kmquan')
	ColourNote('skyblue','black','�ڣ������һ��������� zyhubo')
	ColourNote('yellow','black','������ǰ���������룺  leaveth')
end
function thz_jyzjx()
    exe('read jiuyin-zhenjing;y')
	return thz_questdone3()
end
function thz_jyzj()
    return check_bei(thz_jyzj10)	
end
function thz_jyzj10()
    exe('give zhou fan he')	
end
function thz_jyzj1()
    return check_bei(thz_jyzj11)
end
function thz_jyzj11()
    exe('ask zhou botong about �����澭')
end
function thz_jyzj2()
    return check_bei(thz_jyzj20)
end
function thz_jyzj20()
    exe('ask zhou botong about ����')
end
function thz_jyzj3()
    return check_bei(thz_jyzj30)
end
function thz_jyzj30()
    exe('ask zhou botong about ��������')
end
function thz_jyzj4()
    return check_bei(thz_jyzj40)
end
function thz_jyzj4()
    return exe('answer n')
end
function thz_jyzj5()
    return check_bei(thz_jyzj50)
end
function thz_jyzj50()
    exe('ask zhou botong about ����')
end
function thz_zhoudone()
    EnableTriggerGroup('thzcal',true)
	EnableTriggerGroup('thzact',true)
	EnableTrigger('thzact3',false)
	return exe('out;north')
end
function thz_fin()
    if locl.room == '����ͤ' then
	   score.party = ''
	   exe('score')
	   return exe('ask huang yaoshi about �뿪')
	else
	   return go(thz_fin,'�һ���','����ͤ')
	end
end
function thz_leave()
    zhou_visited = 0
	hb_ok = 1
    EnableTriggerGroup('fight',true)	
    thz_triggers_remove()
	return check_food()
end