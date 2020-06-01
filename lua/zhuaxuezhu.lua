function hp_zhuaxuezhu_find()
    DeleteTriggerGroup("zhuaxuezhu_find")
    create_trigger_t('zhuaxuezhu_find1',"^(> )*你轻轻摇晃树藤，忽然掉下一只雪蛛",'','hitzhu')
	create_trigger_t('zhuaxuezhu_find2',"^(> )*雪蛛神志迷糊，脚下一个不稳，倒在地上昏了过去",'','getzhu')
	create_trigger_t('zhuaxuezhu_find3',"^(> )*看起来雪蛛想杀死你",'','hitzhu')
	create_trigger_t('zhuaxuezhu_find4',"^(> )*你获得一颗九雪碧云丹",'','mjsd')
	create_trigger_t('zhuaxuezhu_find5',"^(> )*你给程灵素一只雪蛛",'','xuezhufinish')
	create_trigger_t('zhuaxuezhu_find6',"^(> )*(你突然觉得微微头晕，浑身无力，无法再凝聚内息)",'','eatdan')
	create_trigger_t('zhuaxuezhu_find7',"^(> )*你晃动了半天，发现什麽也没有",'','yst1')
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
    
    go(yst,"苗疆","山洞")
	return yst()
end
function hitzhu()
          weapon_unwield()
     DeleteTimer( 'ystTo' )
     exe('jiali 80;unset wimpy;hit zhu')
end
function getzhu()
    	exe('get zhu')
    	go(givezhu,"苗疆","药王居")
end
function givezhu()
    exe('set 雪蛛 yes;set;抓雪蛛 yes;give cheng zhu')
end
function xuezhufinish()
 EnableTriggerGroup("zhuaxuezhu_find",false)
 print('雪蛛已经抓到')
 return check_busy(checkPrepare,1)
end





