function hp_zhuaxuezhu_find()
    DeleteTriggerGroup("zhuaxuezhu_find")
    create_trigger_t('zhuaxuezhu_find1',"^(> )*������ҡ�����٣���Ȼ����һֻѩ��",'','hitzhu')
	create_trigger_t('zhuaxuezhu_find2',"^(> )*ѩ����־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ",'','getzhu')
	create_trigger_t('zhuaxuezhu_find3',"^(> )*������ѩ����ɱ����",'','hitzhu')
	create_trigger_t('zhuaxuezhu_find4',"^(> )*����һ�ž�ѩ���Ƶ�",'','mjsd')
	create_trigger_t('zhuaxuezhu_find5',"^(> )*���������һֻѩ��",'','xuezhufinish')
	create_trigger_t('zhuaxuezhu_find6',"^(> )*(��ͻȻ����΢΢ͷ�Σ������������޷���������Ϣ)",'','eatdan')
	create_trigger_t('zhuaxuezhu_find7',"^(> )*��ζ��˰��죬����ʲ��Ҳû��",'','yst1')
	SetTriggerOption("zhuaxuezhu_find1","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find2","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find3","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find4","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find5","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find6","group","zhuaxuezhu_find")
	SetTriggerOption("zhuaxuezhu_find7","group","zhuaxuezhu_find")
end
function yst1()
    create_timer_s('ystTo',1.0,'ystTo')
end
function ystTo()
    exe('cond')
    exe('yao shuteng ')
end
function eatdan()
    exe('fu jiuxuebiyun dan')
end
function yst()
 exe('dian fire')
 exe('yao shuteng')
end
function mjsd()
    
    go(yst,"�置","ɽ��")
	return yst()
end
function hitzhu()
          weapon_unwield()
     DeleteTimer( 'ystTo' )
     exe('jiali 80;unset wimpy;hit zhu')
end
function getzhu()
    	exe('get zhu')
    	go(givezhu,"�置","ҩ����")
end
function givezhu()
    exe('set ѩ�� yes;set;ץѩ�� yes;give cheng zhu')
end
function xuezhufinish()
 EnableTriggerGroup("zhuaxuezhu_find",false)
 print('ѩ���Ѿ�ץ��')
 return check_busy(checkPrepare,1)
end





