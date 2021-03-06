local npc_name={}
local npc_id={}
local npc_kezhi={}
local npc_wugong={}
local npc_buff={}
local npc_num=0
local kflag={}
local kezhisuccess=0
local npc_order={}
local npcdienum={}
local kezhi_order={--优先级设置，数值约小优先级越高
	["正"]=9,
	["奇"]=8,
	["刚"]=7,
	["柔"]=6,
	["快"]=5,
	["慢"]=4,
	["妙"]=3,
	["险"]=2,
	["空"]=10,
	["无"]=1,
	["坑"]=11,
}
local kezhi_valuecmd={--mush的变量名称，对应武功使用哪种克制
	["正"]='pmiao',--p版mush请改pmiao
	["奇"]='pxian',--p版mush请改pxian
	["刚"]='pkuai',--p版mush请改pkuai
	["柔"]='pman',--p版mush请改pman
	["快"]='prou',--p版mush请改prou
	["慢"]='pgang',--p版mush请改pgang
	["妙"]='pqi',--p版mush请改pqi
	["险"]='pzhen',--p版mush请改pzhen
	["空"]='pkong',
	["无"]='pwu',
	["坑"]='pkeng',
}

local kezhi_si_valuecmd={--mush的变量名称，对应武功使用哪种克制
	["正"]='si_pmiao',--p版mush请改pmiao
	["奇"]='si_pxian',--p版mush请改pxian
	["刚"]='si_pkuai',--p版mush请改pkuai
	["柔"]='si_pman',--p版mush请改pman
	["快"]='si_prou',--p版mush请改prou
	["慢"]='si_pgang',--p版mush请改pgang
	["妙"]='si_pqi',--p版mush请改pqi
	["险"]='si_pzhen',--p版mush请改pzhen
	["空"]='si_pkong',
	["无"]='si_pwu',
}


local kezhi_sq_valuecmd={--mush的变量名称，对应武功使用哪种克制
	["正"]='sq_pmiao',--p版mush请改pmiao
	["奇"]='sq_pxian',--p版mush请改pxian
	["刚"]='sq_pkuai',--p版mush请改pkuai
	["柔"]='sq_pman',--p版mush请改pman
	["快"]='sq_prou',--p版mush请改prou
	["慢"]='sq_pgang',--p版mush请改pgang
	["妙"]='sq_pqi',--p版mush请改pqi
	["险"]='sq_pzhen',--p版mush请改pzhen
	["空"]='sq_pkong',
	["无"]='sq_pwu',
	["坑"]='sq_pkeng',
}


local pk_valuecmd={--mush的pk变量名称，对应武功使用哪种克制
	["正"]='zpk_pmiao',--p版mush请改pmiao
	["奇"]='zpk_pxian',--p版mush请改pxian
	["刚"]='zpk_pkuai',--p版mush请改pkuai
	["柔"]='zpk_pman',--p版mush请改pman
	["快"]='zpk_prou',--p版mush请改prou
	["慢"]='zpk_pgang',--p版mush请改pgang
	["妙"]='zpk_pqi',--p版mush请改pqi
	["险"]='zpk_pzhen',--p版mush请改pzhen
	["空"]='zpk_pkong',
	["无"]='zpk_pwu',
}
local damage_level=0

kezhiDesc={}
kezhiDesc["正"]={

    ["参合指"]={"「目不识丁","「画龙点睛","「扑朔迷离","「受宠若惊","「滔滔不绝","「退避三舍","「卧薪尝胆","「相煎何急",},

	["金刚降伏轮"]={"光明势」",},

	["全真剑法"]={"「横行漠北","「排山倒海","剑自左而右划出一个大弧，一式「顺水推舟」","「马蹴落花","「开天辟地」，剑从上至下猛劈","「雷电交加","「人神共愤","剑影晃动，踏奇门，走偏锋，一式「分花拂柳」",},

	["震山绵掌"]={"「虎纵步","「印掌","「横云断峰","「倒提金钟","「烘云托月","「雪拥蓝关","「盘弓射雕","「鸳鸯腿","「仙鹤亮翅","「白露横江","「九转丹成","「横架金梁","接着右掌一招「白虹贯日","左手一掌「拨云见日」","脸前虚势一扬，接着化掌为指，伸食中双指从下",},

	["五虎断门刀"]={"「猛虎下山","「西风倒卷","「飞沙走石","「天昏地暗","「横扫天下","「气吞山河",},

	["寒冰神掌"]={"接着运寒冰真气于右手，伸出食中二","这一掌居高临下，夹杂寒风，势道奇劲","手腕一翻，左右两掌分别拍出，","看似全然处于下风，双臂出招极","右手连指三指，逼得你连退三步","寒冰神掌中的",},

	["七伤拳"]={"在场中暴走，出手既快且狠","以阴柔之气，左手一翻，格","开口说话，猛然出拳打","拳出如风，砰砰接连四拳，","双目尽赤，一声吆喝，宛似","暗运几口真气，跨上一步，","一拳击出，缩回手臂，又发","双臂一沉一扬，拳如巨刃开","大喝一声，双拳连环虚击，","双目微阖，步法飘忽，轻飘",},

	---["一阳指"]={"屏息凝神，脚步沉着，剑走刀势","看准时机一剑刺出，激起呼呼","传动，将一阳指神功化于","剑走，端凝自重，极飘逸的一","渐沉重，使动时略比先前滞涩","「晓天初阳","「日出霞光","「赤日焦阳","「晓阳云暖","「暮云映日","手指涌出，正是一招「阳春暖融」","气象森严，雍容肃穆，于威猛之中不脱王者风度","头顶白气氤氲，渐聚渐浓，便似蒸笼一般",},
	
	["一阳指指法"]={"面带微笑，伸出右食指","激出的一股罡气","伸指凌空轻轻一点","白气氤氲，渐聚渐浓","九天乾阳」","「阳春暖融","伸出右食指，缓缓点向","晓天初阳」",},
	

	["一指禅"]={"「佛恩济世","「佛光普照","「佛门广渡","一式「佛法无边」，左手握拳托肘，右手拇指直立",},

	["穿云腿法"]={"「划地为牢","「追风逐电","「左右穿花","「倒踢北斗","「登云步月","「横扫九州","「无影无踪","「雷霆天下",},

	["华山剑法"]={"「白云出岫","「天绅倒悬","「青山隐隐","「古柏森森","「苍松迎客","「玉井天池","「叠翠浮青","「无双无对","「落花无意","「有凤来仪」，剑势飞舞而出，轻盈灵动","突然剑锋一转，使出「白虹贯日」直刺","斜晃反挑，一式「无边落木」，这一下出招急快，抑且如梦如幻",},

	["雁行刀法"]={"「让字诀","「打字诀","故示其弱，一招「引字诀","「套字诀","「藏字诀","「错字诀",},

	--["天山杖法"]={"「雪海冰雹","「天山雪野","使出一招「满天飞雪」","「雪峰插云",},
	["天山杖法"]={"「风霜碎影","「天山雪崩","「山风凛冽","「峰回路转","「回光幻电","「冰谷初虹","「断石狼烟","「残阳照雪","「天狼食日","「长空雷隐","「雪海冰雹","「天山雪野","使出一招「满天飞雪」","「雪峰插云",},
	--["般若掌"]={"「横空出世","「长虹贯日","「云断秦岭","「铁索拦江","「怀中抱月","「翻江搅海","摘星换斗」","「金刚伏魔」，双手合十","全身飞速旋转，双掌一前一后","向上高高跃起，一式「高山流水」，居高临下",},
	
	["玉箫剑法"]={"「棹歌中流","「山外清音","「月落曲惶","「狂歌九天","「箫史乘龙","凭空虚刺了几下，剑身上寒光点点","斜指向上，剑锋直出却又抑扬","剑意绵绵，似有波澜，剑光幻化做水面残阳","轻颤有声，呜咽作响，忽然快如闪电般划向","忽然又纵身向前，剑意如音缈九天",},
	

}
kezhiDesc["奇"]={

	["圣火令法"]={"「以意相求","「风回路转","「三虚七实","「头头是道","「翻江倒海","「瞒天过海","「应左则后","「须右仍前","「无中生有","「天方地园",},

	["如来千叶手"]={"「南海礼佛","「金玉瓦砾","「人命呼吸","「镜里观影","「水中捉月","「浮云去来","「水泡出没","「梦里明明","「觉后空空",},

	["日月鞭法"]={"阿那律刺」","目捷连刺」","舍利佛刺」","富楼那刺」","迦旋延刺」","弘忍能刺」",},

	["反两仪刀"]={"日月晦明」","万劫不复」","无色无相」","太乙生萌」","两仪合德」","混沌一破」",},

	["星移掌"]={"「幻形变影","「星星点点","「漫天星斗","「五斗星辰","「北斗七星","「追星赶月",},

	["漫天花雨"]={"「月下踏径","「破云见日","「秋日落叶","「雪地追踪","「回首沧桑」","「雨打浮萍","「流星电闪",},

	["密宗大手印"]={"莲花合掌印」","合掌观音印」","准提佛母印」","红阎婆罗印」","药师佛根本印」","威德金刚印」","上乐金刚印」","六臂智慧印」",},

	["大嵩阳手"]={'左掌一提，右掌一招便即劈','大喝一声道："小心了！”随','两手连续挥舞，双掌交错，','坻壁而行，双手快如风、迅如电','运气丹田，连续几个斜步围','蹂身向前，身行猛的一窜','一掌高，一掌低，摆出了“嵩阳手”',},

	["段家剑法"]={"「其利断金","「碧鸡报晓","「金马腾空","「碧渊腾蛟","「笑指天南","「逐鹿中原",},

	["天罗地网式"]={"左掌划一半圆，右掌划出另一半圆，呈合拢之势，疾拍","左掌护胸，右拳凝劲后发，深吸一口气","纵身向前扑去，一下急冲疾缩，就在两臂将合未合之际","两掌上下护胸，掌势突然一变，","长袖挥处，两股袖风扑出，","双臂飞舞，双掌宛似化成了千手千掌",},

	["三阴蜈蚣爪"]={"「蜈蚣盘步","「毒蚣盘身","「蜈蚣摆尾","挟带一股从指尖冒出的阴气向","接着右手斜斜探出，阴狠的抓向","面显阴笑，腾身飞出","惨笑一声，人如中风发狂一般",},
	
	["残阳峨嵋刺"]={"横削直击，迅捷无比，白光闪烁中","「越女追魂」，反手疾刺","「蜈蚣摆尾","「素女掸尘","「金针渡劫","「文姬挥笔","「西子洗面","「玉带围腰","「分花拂柳」，泛起层层光影，向左右推开",},

}
kezhiDesc["刚"]={

	["大金刚拳"]={"「礼敬如来","「遇佛传法","「幽冥搜魂","「引火炼妖","「魂散心魔","「无相法相","「攀天祥云","「超度极乐",},

	["盘根错结斧"]={"「力劈华山","「幻影流动","「震山式","「枯树盘根","向左一个滑步，一招「高山流水」，出其不意转到",},

	["劈石破玉拳"]={"「起手式","「石破天惊","「铁闩横门","「千斤坠地","「傍花拂柳","「金刚挚尾","「封闭手","「粉石碎玉",},

	["降龙十八掌"]={"「亢龙有悔","利涉大川」","「飞龙在天","「鸿渐于陆","「潜龙勿用","「突如其来","「或跃在渊","「双龙取水","「鱼跃于渊","「时乘六龙","「密云不雨","「损则有孚","「龙战于野","「履霜冰至","「羝羊触蕃","神龙摆尾」拍向身后的","「神龙摆尾」出其不意","「见龙在田」，迅捷无比地劈向","中宫空门大开，双掌一上一下","这是一招「震惊百里」"},

	["燃木刀法"]={"「烈火烧身","「点木生火","「张弓望月","左挡右开，使出一招「烈火腾云","「火中取栗","「玉石俱焚",},

	["玄铁剑法"]={"当胸平平刺出一剑，看似毫无变化","借助下行之势向下猛劈一剑","轻叹一声，随手横劈一剑","迅疾挑出一剑，此剑之快","顺刺，逆击，横削，倒劈","仰首长啸，令风云变幻","空中满是剑影，宛若千道银链","一时迅疾如流星划空","剑力有如海潮一般","内力却如海潮一般汹涌","防范一疏，一股大力劈头而来","竟如同暴风之中一般","如狂风怒潮一边","接着你周围布满了密密麻麻的剑气","剑势如风似幻无迹可寻","洒出点点剑意，犹如春雨细","好似身陷大海漩涡之中","一浪接着一浪一浪高过一浪","宛如秋风绵绵，悠然而不狂烈","身在大海般暗流汹涌难以抗拒","风声越来越响，竟如同暴风之中一般","独孤求败的至高境界","已入无剑胜有剑的境界","急如飞虹闪电却无丝毫声息","泛起淡淡海蓝，无声无息","招式毫无征兆随意而创","心中竟无半点波澜，纯以意运剑","招式越是平平威力却是越大","剑法已然反璞归真而无招自胜","一招挺剑击刺却是挡无可挡避无可避无坚不摧",},

	["神龙腿法"]={"「星罗棋布","神龙追星」","一式「神龙追电」","「倒踩七星","「神龙摆尾」，右脚前跨","「蛇行无踪","「旋风无敌","「无影神腿","神龙追风」","「神龙八腿","「流星赶月」，连腿影都看不清",},
	
	

}
kezhiDesc["柔"]={

	["莲花掌"]={"「小莲初绽","「叶底清荷","「莲池泛舟","「藕断丝连","「千叶莲花","「并蒂莲开","「池底清荷","「双莲争艳","「雨打莲花","「旧藕新莲","「遍野荷香","反身错步，突然使出一招「雨后清莲」",},

	["散花掌"]={"「春深芳草尽","「夏闲独兰馨","「秋酣菊霜清","「冬卧听梅吟",},

	["玉女素心剑"]={"「雁行斜击","「浪迹天涯","「花前月下","「清饮小酌","「抚琴按箫","「彩笔画眉","「举案齐眉","「木兰回射","「如影相随","一招「分花拂柳」",},

	["回风拂柳剑"]={"「清风袭月","「飘雪穿云","「千峰竞秀","「万流归宗","「乌龙搅柱","「大雁啼沙","「进退龙游","「天地鹤翔",},

	["慈航鞭"]={"「未牧」","「初调」","「受制」","「回首」","「驯服」","「无碍」","「任运」","「相望」","「独照」","「双泯」",},

	["太极拳"]={"一抱一合","似松非松，将展未展","虚灵顶劲、涵胸拔背","右掌微颤，吞吐","掌力若有若无","太极式的阴阳变化","双手一圈，如抱太极","左拨右带，一卷","右手虚划，手背","流云翻舞","双手随意划弧","双手一翻，连消","右掌挥出，一拒一迎","左手凭空划了","右掌划个圈子","双掌轻翻，柔","走一虚步，右手","双掌一摆一抄","双手自然挥动","双手内旋，如","左掌阳，右掌阴","右手突从圈中","划个圆圈，右臂一伸","左手从右至左","双手划弧止于","左手高，右手低","右脚实，左脚虚","身前上下连划","身前左右连划","虚灵顶劲、涵胸","似松非松，将展","「揽雀尾","「单鞭","「提手上势","「白鹤亮翅","「搂膝勾步","「手挥琶琶","「进步搬拦锤","「指裆锤","「双风贯耳","「白蛇吐信","「高探马","「伏虎式","「肘底看锤","「海底针","「闪通臂","「揽月势","「马步靠","「金鸡独立","「玉女穿梭","「反身撇锤","「转身蹬腿","「栽锤","「进步七星","「倒撵猴","「转身摆莲","「弯弓射虎","「云手","「猢狲跃","「野马分鬃","「十字手",},

	["化骨绵掌"]={"「灵蛇出洞","「轻风细雨","「半雨半晴","「如影随形","不停转圈，身法奇快，一式「春风拂柳」，一掌又一掌","不备，一式「风行草偃」，猛地一掌","凝重的拍出一掌「柔中带刚」","化骨绵掌中的精要「刚柔并济」",},

	["兰花拂穴手"]={"左手忽做兰花之形","便如兰花浴风般划向","右掌自上而下，一抄一带","双手如两只玉蝶","如一柄长剑般横削而来",},	
    ["缠魂索"]={"「虐目」","「催胆」","「伤肝」","「损心」","「摄魄」","「收魂」",},

    
}
kezhiDesc["快"]={

	["嵩山剑法"]={"「万岳朝宗","「开门见山","「独劈华山","「天外玉龙","「龙啸九天","使出一式「千古人龙」，剑气古朴","轰然一动，犹如千军万马奔驰而来","俨然长枪大戟，黄沙千里",},

	["四象掌"]={"「五气呈祥","「逆流捧沙","「雷洞霹雳","梵心降魔」，双掌似让非让，似顶非顶，","遥遥一鞠，一式「三阳开泰」，双掌大开大阖",},

	["烈炎刀"]={"「黑龙现身","「万水千山","「横扫千里","「左右开弓","「直摧万马","「上步劈山","刀光流泻，如一片雪白瀑布砍向","一个猛转身，连刀带人往",},

	["如影随形腿"]={"「仗义执言","「七星伴月","「佛界无边","「转世轮回","「西天极乐","「佛祖慈悲",},

	["旋风扫叶腿"]={"「魁星踢斗","「倒踢紫金冠","「旁敲侧击","「连环三踢","「秋风扫落叶","「凤舞九天",},

	["迅雷十六剑"]={"「海底寻针","「灵猿探洞","「斜插神枝","「电闪雷动","「夫子揖手","「玉带缠腰","「举火烧天","「败马斩蹄","「玉女穿针","「灵猿登枝","「苏武挥鞭","「挑灯看剑","剑尖向右，绕身一周","身体凌空侧翻，一剑从身下刺出","踏步向前，一式「拨草寻蛇」，手中长剑摆动",},

	["柳叶刀法"]={"刀锋回转，连出数刀","左一刀，右一刀","突然刀交左手，一刀砍向","正撞上刀锋来路","十六刀连续往","集全身之力于刀锋上",},
	
	["疯魔杖"]={"秦王鞭石」","鲁达拔柳」","「翻身劈山","「金铰剪月","「雷针轰木","霸王扛鼎」","八仙醉打」","长虹经天」",},

}
kezhiDesc["慢"]={

	["黯然销魂掌"]={"「徘徊空谷","「力不从心","「行尸走肉","「庸人自扰","「倒行逆施","饮恨吞声」","「废寝忘食","孤形只影」","「穷途末路","「面无人色","想入非非」","翻身坐倒，旋及旋向空中，凭空一式","身畔，一式「呆若木鸡」，乘",},

	["寒冰绵掌"]={"「如罩寒霜","「如寒冰头","「白露为霜","「寒梅纷飞","「天寒地冻","「冰天雪地」，双掌突的变成雪白","「雪花纷飞","「满天冰雨",},

	["少林醉棍"]={"蓝采和，提篮劝酒醉朦胧","何仙姑，拦腰敬酒醉仙步","曹国舅，千杯不醉倒金盅","韩湘子，铁棍提胸醉拔萧","汉钟离，跌步翻身醉盘龙","铁拐李，踢倒金山醉玉池","张果老，醉酒抛杯倒骑驴","吕洞宾，酒醉提壶力千钧",},

	["混元掌"]={"「云断秦岭","「青松翠翠","「金玉满堂","「风伴流云","「湮雨飘渺","双掌互错，变幻莫测，一招「高山流水」","「山回路转」，自巧转拙，却是去势奇快","「青山断河」，右手一拳击出，左掌紧跟着",},

	["昆仑叠掌"]={"「日入空山","「天清云淡","「秋风不尽","「北风卷地","「天山雪飘","双掌交错，若有若无，一招「天衣无缝」",},

	["太极剑法"]={"「手挥五弦","捏了个剑诀，剑尖虚指","送远方翩鸿孤飞","剑法吞吐开合","剑劲之柔韧","剑法中最精要之处","登峰造极的剑术","漫步扬长而步","出剑以蜿蜒之势","剑法中破绽之少","太极剑「剑意」","剑势犹如浪潮一般","剑招古朴浑厚","剑刃平刺，锋口向","脚走八卦，拔剑","神在剑先、绵绵不绝","画剑成圈，一点","缓缓伸出，随手画","一阵尖锐的破空声出","右手剑诀戳出","三环套月","左手持剑缓缓向上提起","一剑刺到，青光闪闪","剑尖急颤，看不出攻","左手剑诀斜引，","剑势绵绵不绝，","剑招精奇，轻翔灵动","以己之钝，挡敌之无锋","以意驭剑，千变万化","每一招均是以弧形刺出","以意驭剑，神在剑先","剑法纵横变化，奇幻无方","半点渣滓，以意运剑","出剑递招，可说","剑法吞吐开合","只觉一股森森寒气，直逼","突然平刺，剑尖急颤","剑招未曾使老，已然圈转","「宿鸟投林」","「大魁星」","「天马行空」","「黄峰入洞」","「射雁式」","「燕子抄水」","「小魁星」","「挑帘式」","「风扫梅花」","「车轮剑」",'「顺水推舟」，剑势绵绵不断',"「探海式」","「白猿献果」","「野马跳涧」","「海底捞月」","「虎抱头」","「右拦扫」",'迎风掸尘',"「乌龙摆尾」","「圆转如意」","「青龙出水」","「指南针」","「燕子掠波」","「却步抽剑」","一招「拨云瞻日」",},

	["嵩阳鞭"]={"犹如一条灵蛇窜越而出，径直扑向","已完全笼罩在漫天鞭影之中，丝毫","随即连续舞了两个圆圈，光环之中","却以一道弧线从旁向你缠去",'末梢在地上划出"呲呲”的爆响，猛',"撤身，打了个转，双手仍不断抖动","凌空划了个弧圈，身子围绕你奔走","运起嵩山内功，继而凌空踏起",},

	["银钩笔法"]={"「锋」","「天」","「下」","「不」","「武」","「刀」","「龙」","「争」",},

	["落英神剑掌"]={"「落英缤纷","「江城飞花","「雨打桃花","「雨急风狂","「满天花雨","「断艳残红","一招「无边落木",},

	["火焰刀"]={"「示诞生","「始心镜","「现宝莲","「破法执","「开显圆","「显真常","「归真法","「吉祥逝",},
	
}
kezhiDesc["妙"]={
    ["天山追魂钩"]={"蓦而急颤晃动，在眨眼的瞬息间","半空中气流旋荡，地上的尘土亦四散溅射","附近地面蓦而滚滚飞扬，五丈方圆内起了一阵回旋的","神色沈凝，钩势刹那间又出","尖突然闪起一团强烈的寒光，「嗡」地一颤","划出溃无章法，锋利的刃身幌摇不定","真气宛如海啸山崩，呼天唤地，滚翻而至","似是一片闪亮的雪花晶体",},
	["打狗棒法"]={"「打草惊蛇","左右晃动，一招「拨草寻蛇」向","「关门打狗","「拨狗朝天","「狗急跳墙","「棒打双犬","「恶犬拦路","「棒打狗头","「反截狗臀","「打狗入洞","「压肩狗背","「斜打狗背」",},

	--["玉箫剑法"]={"「棹歌中流","「山外清音","「月落曲惶","「狂歌九天","「箫史乘龙","凭空虚刺了几下，剑身上寒光点点","斜指向上，剑锋直出却又抑扬","剑意绵绵，似有波澜，剑光幻化做水面残阳","轻颤有声，呜咽作响，忽然快如闪电般划向","忽然又纵身向前，剑意如音缈九天",},

	["血刀经"]={"「斩头式","「破膛刀","「去魂电","「流星经天","「蛇行","「三界咒","「魔分身",},

	["慕容刀法"]={"「劈天盖地满壮志","「弯刀逆转倒乾坤","「遥看万疆千里雪","「壮志豪气满江湖","「笑指银汉摘星斗",},

	["美女拳法"]={"「貂禅拜月","「西施捧心","「昭君出塞","「麻姑献寿","「天女织梭","「则天垂帘","「丽华梳妆","「红玉击鼓","「弄玉吹箫",},

	["独孤九剑"]={"华山剑法的「白云出岫」","竟然是华山「玉女十九剑」","「雁回祝融」衡山五神剑","松风剑法的「鸿飞冥冥」","衡山的「一剑落九雁」","运使「太极剑」剑意","竟化「泰山十八盘」为一剑","「伏魔剑」剑意表露无遗","恒山剑法为一剑","一手关外的「乱披风剑法」","尽括嵩山剑势击向","衡山的「百变千幻云雾十三式」","吐气开声，一招似是「独劈华山」","泰山剑法的「来鹤清泉」","华山剑法「有凤来仪」的趋势","恒山剑招「绵里藏针」","已转为「风声鹤泣」","嵩山剑法中的「千古人龙」","尽融「达摩剑」为一式","虽一剑却暗藏无数后着","破绽所在，端的是神妙无伦","撞将上来，神剑之威，实人所难测","刺出一剑，不知使的是什么剑法","大开大阖地乱砍一通","武功招式，胸有成竹","满场游走，东刺一剑，西刺一剑","似有招似无招的一剑，威力却是奇大",},

	["韦驮杵"]={"「仙鹤展翅入灵山","「玉马衔环拜仙宫","「鸣鹿踏蹄觅仙草","「金鲤跃水潜天池","「灵猿献果赴蓬莱","「飞鹰盘旋扫乾坤","「天龙出水腾宇宙","「白象卷云憾天柱",},

	["拈花指"]={"「瓶花落砚","「寒梅吐蕊","「初杏问酒","「露草斜阳","「仰月承霖","「叶底留莲","「清风拂桂","「菊圃秋霜","「伽叶微笑","「佛祖拈花",},

	["灵蛇鞭法"]={"反手一招「神龙摆尾","「乌龙绞柱","「天龙下凡","「地龙打滚","身形伏低，一招「游龙归巢」","一招「金龙出海」，沿着","攀龙附凤」，手中长鞭","身形不动，一招「飞龙夺珠」，手中",},

	["五罗轻烟掌"]={"「五陵烟云","「烟雾弥漫","「烟雨朦胧","「烟飘云散","「五罗轻烟",},

	["铁掌掌法"]={"「推窗望月","「分水擒龙","「白云幻舞","「掌中乾坤","「落日赶月","「蛰雷为动","「天罗地网","「五指幻山",},

	["玄虚刀法"]={"「劈风展翅","「风拂山岗","「抽刀断水","「苍鹰望月","虚砍一刀，刀刃忽又转向","陡然身行飞起，一招「满天飞雪」",},
	
	---["四象六合刀"]={"一式天穹如盖","「乾坤倒转」","好一招两仪四象","「气吞六合」",},
	 ["大嵩阳掌"]={"起首式「大嵩阳」","「天河水」","「铁梁道」","「万仞壑」","「观胜峰」","「小铁梁」","「朝天闸」","「千丈渊」",},

}
kezhiDesc["险"]={
    ["抽髓掌"]={"催动内力，衣袖挥动，","双脚一曲一弯，身体旋转起来,","身形飘动，围着","突然厉声大喝，跃于半空，立掌如斧，上上下下向","身形微晁抢前一步，运起十成功力，","面露诡异的笑容，猛地向前冲出，对准","心念一转，计上心来，一招",},
	["四象六合刀"]={"一式天穹如盖","「乾坤倒转」","好一招两仪四象","「气吞六合」",},

	["天王爪"]={"「凝云」","「捻灯」","「清乐」","「撞钟」","「暗香」",},

	["截手九式"]={"「虚式分金","「月落西山","「铁锁横江","「黑沼灵狐","「生死茫茫","衣袖轻摆,右手上封，左手下压","一招「高山流水」，掌影犹如飞瀑般","突然愁眉紧缩，神态间散发万种风情",},

	["慕容剑法"]={"「洗耳恭听","「明察秋毫","「甜言蜜语","「望尘莫及","「骑虎难下","「抛砖引玉",},

	["银索金铃"]={"忽地甩了出来，直扑","矫矢似灵蛇击向你，","大惊之下，身子後仰","翻将过去，自下而上","犹如水蛇般蜿蜒而出","矫夭飞舞，好比彩凤",},

	["龙爪功"]={"「捉影式","「抚琴式","「鼓瑟式","「批亢式","「掏虚式","「抢珠式","「捞月式","「抱残式","「守缺式",},

	["腾龙匕法"]={"「龙腾虎跃","「描龙绣凤","「游龙戏凤","「龙翔凤舞","游龙归巢」",},

	["弹指神通"]={"「指点江山","「如来神指","「一衣带水","「弹指惊雷","你一错愕间，只听“嗤嗤”之声连响",},

	["裂天斧"]={"「风云起","「力推山","「狂风破","「力开山","「震天地",},

	["绝户手"]={"「老牛拉车","「壮士断腕","「落叶归根","「空前绝后","「断子绝孙","四肢贴地，头部底垂",},

	["两仪剑法"]={"「大漠平沙","「横扫千军","「峭壁断云","「木叶萧萧","「江河不竭","「高塔挂云","「雪拥蓝桥","「无声无色」，悄无声息地疾向","剑柄斜斜向右外","右手剑朝天不动","但七八招斜势中偶尔又挟着一招正势","剑锋从半空中直泻下来",},
	
    ["一阳指剑法"]={"身随剑走，端凝自重","激起呼呼风声","动时略比先前滞涩","左手捏个剑诀，右腕传动","剑走刀势，一式横劈",},

}
kezhiDesc["空"]={

	["空明拳"]={"「空」","「朦」","「洞」","「松」","「风」","「通」","「容」","「梦」","「冲」","「穷」","「中」","「弄」","「童」","「庸」","「弓」","「虫」",},

	["辟邪剑法"]={"「江上弄笛","「花开见佛","「紫气东来","「流星赶月」，蓦地里疾冲上前","「飞燕穿柳","「流星飞堕","锺馗抉目","「群邪辟易",},

	

	["千蛛万毒手"]={"「万蛛吸血」","身形纵起，十指轻弹，只见缕缕内劲犹如飞瀑般向","阴喝一声，双手向前舞动，突然一股内劲顺指尖破空而出，疾射","深吸口气，身体急纵而上，右手食指疾伸，直戳",},

}
kezhiDesc["无"]={

	["武当长拳"]={"「七星手","「推手","「一条鞭","「直击","「雁回头","「井栏",},

	["段家拳"]={"「釜底抽薪","「连绵不绝","「左右逢源","「逆水行舟",},

	["太祖拳"]={"「千里横行","「冲阵斩将","「河朔立威","「击鼓三通","「扬马立威",},

	["罗汉拳"]={"「黄莺落架","「丹凤朝阳","「洛钟东应","「偏花七星","「挟山超海","「慑服外道",},

	["温家拳"]={"「兔戏苍鹰","「飞流直泻","「风雨归人","双拳犹如狂风骤雨般打向","身后，双脚落地后双拳向后挥出",},

	["伏虎拳"]={"「灌顶」","「解苦」","「颦眉」","「嗔恚」","「静寂」","「明心」","「制胜」",},

	["韦陀掌"]={"双掌齐推，一招「开天辟地」","即世即空」","无相无色」","谁入地狱」","禅心永明」",},

	["天罡掌"]={"揩磨尘垢」","无欠无余」","虎门手」","灵光照耀」","天地无用」","脚踩七星方位，双掌翻飞施出「高山流水」",},

	["风云手"]={"风满长空」","草深雾泽」","天目昭辉」","雷震四方」","水到渠成」","山高林密」","地老天荒」","左手虚晃，一式「烈火腾云」，右手上下直击，反扣",},

	["鹰抓擒拿手"]={"金针渡线」","双阳沓手」","飞鹰现爪」","孔雀剔翎」","猿猴摆手」","自在飞花」","身形住回一撤，一个斜身塌式","整个身体歪歪斜斜，右手斜斜的拍向","眼露凶光，招招不离你的要害部位",},

	["锁喉擒拿手"]={"左手扬起，右手伸出，","单臂伸出，手指直取","左手一掠，将","身形急跳，早落到","双臂弯出，柔若无骨，","右手一抬，势做阴柔，","连出阴招，不离锁喉，撩阴。",},

	["少林弹腿"]={"落燕式」","抚平式」","追月式」","连环式」","扫叶式」","盘龙式」",},

	["摩诃指"]={"叶不归根」","我心向佛」","以慈度心」","念经诵佛」",},

	["鹰爪功"]={"凶鹰袭兔」","雄鹰展翅」","拔翅横飞」","迎风振翼」","飞龙献爪」","搏击长空」","鹰扬万里」","一式「拨云瞻日」，上手袭向膻中大穴",},

	["寂灭爪"]={"众生无我」","苦乐随缘」","普度众生」","七星聚会」","以逸待劳」","佛门善地」","双爪无数道劲气破空而出，，一式「天衣无缝」",},

	["金顶绵掌"]={"罡风推云」","金顶佛光」"},

	["金蛇秘籍"]={"金蛇出洞」","金蛇游水」","金蛇挺身」","金蛇过涧」","金蛇缠身」","升天入地」","金蛇翻腾」","蛇跨彩虹」","双蛇钻腋」","金蛇望月」","金蛇摆尾」","灵蛇盘腾」","飞龙戏蛇」","蛇影无踪」",},

	

	["无相截指"]={"无相劫」",},

	--["疯魔杖法"]={"秦王鞭石」","鲁达拔柳」","霸王扛鼎」","八仙醉打」","长虹经天」",},

	["未知"]={"双拳犹如狂风骤雨般打向","提起拳头","的左耳一抓","挥拳攻击","狠狠地踢了一脚",},

	["烈火剑"]={"「无声无色」，剑尖无声无色","万川归海」","在天一方」","飞瀑倒悬」","四通八达」","四海云飘」","怪蟒翻身」",},

	["达摩剑"]={"万事随缘往","轮回法舟轻","浮世沧桑远","来去若梦行","水月通禅寂","鱼龙听梵音","千里一苇去","禅心顿自明",},

	--["大嵩阳神掌"]={"起首式「大嵩阳」","「天河水」","「铁梁道」","「万仞壑」","「观胜峰」","「小铁梁」","「朝天闸」","「千丈渊」",},

	["冲灵剑法"]={"「雨后乍逢」","「柳叶似眉」","「雾中初见」","「同生共死」","「青梅如豆」",},
	
	["无上大力杵"]={"「荡乾坤」","「扳山式」","「崩天柱」","大吼一声“死！”，一招「风卷残云」",},
	
	["白陀蛇杖"]={"一柱擎天」犹如一条黑蟒般","由下往上一撩，双手握住","杖法显得灵巧之极","正是招「蛟蛇化龙」","「一杖定海」","扫出一道道灰影从四面八方围向",},
	["霸王枪"]={"「迎门三不过」","「举火烧天势」","抖出五朵枪花","「飞鸟投林势」","百忙中使出一招「回马枪」",},
	["碧波掌法"]={"「水天一色」","「水花四溅」","「碧海蓝天」","「波涛汹涌」","「怒涛拍岸」",},
	["沧浪钩法"]={"「莲叶托桃」","「群魔乱舞」","「尔虞我诈」","「殊路同归」","「飞横拔户」","「不阴不阳」","「鱼死网破」",},
	["慈悲刀"]={"「停车问路」","「童子挂画」","「临溪观鱼」","「张弓望的」","「风送轻舟」","「川流不息」",},
	["夺命金花"]={"「变幻多端」","「倏左倏右」","「仙女散花」","「满天星雨」","「千里追魂」","「回头望月」","「闪电风雷」","「金花夺命」","「梅花顿现」",},
	["伏魔剑"]={"「穿云势」","「破雾势」","「推山势」","「搅海势」","「开天势」","「劈地势」","「雷针势」","「龙吞势」",},
	["天山六阳掌"]={"「凤鸣朝阳」","「阳春白雪」","「山阳夜笛」","「阳煦山立」","「三阳开泰」，双掌连划三个半圆","「阳开阴闭」","「阳关三叠」，双掌内拢","「阳歌天钧」","「燮理阴阳」",},
	["朱砂掌"]={"「偷漏掌","「双封掌","「反摔掌","「单臂挑山","「引针腰斩","「开门见山」，招式沉稳，双掌暗红","「破风穿云","「虚步推手",},
	
}

kezhiDesc["坑"]={
    ["般若掌"]={"「横空出世","「长虹贯日","「云断秦岭","「铁索拦江","「怀中抱月","「翻江搅海","摘星换斗」","「金刚伏魔」，双手合十","全身飞速旋转，双掌一前一后","向上高高跃起，一式「高山流水」，居高临下",},
}

function kezhiwugong()
	kezhiwugongclose()
    npc_name={}
	npc_id={}
	npc_kezhi={}
	npc_wugong={}
	npc_buff={}
	npcdienum={}
	--print("检测变量")
end

function kezhiwugongAddTarget(t_name,t_id)
	local tflag=true
	for i=1,4 do
		if npc_id[i]==t_id then
			tflag=false
		end
	end
	if tflag then
		table.insert(npc_name,t_name)
		table.insert(npc_id,t_id)
		kezhiwugongStart()
	end
end
function kezhiwugongRemoveTarget(t_name)
	table.insert(npcdienum,t_name)
end
function kezhiwugongStart()
	--print("开启检测")
	npc_num=0
	haichaoID=nil
	kezhisuccess=0
	for i=1,4 do
		if(npc_name[i]~=nil) then
			--print("npcname["..i.."]="..npc_name[i])
			kflag[i]=1
			npc_num=npc_num+1
			create_trigger_t('afight1'..i,'^(> )*(\\D*)'..npc_name[i]..'(\\D*)'..'！$','','kezhiwugongcheck'..i)
			create_trigger_t('afight2'..i,'^(> )*(\\D*)'..npc_name[i]..'见势不妙，(便拿出\\D*做武器|招式一变，改用\\D*向你发起攻击)。$','','kezhiwugongReStart'..i)
			create_trigger_t('afight3'..i,'^(> )*(\\D*)'..npc_name[i]..'(\\D*)'..'(青|穴道|伤害)。$','','kezhiwugongcheck'..i)
			SetTriggerOption("afight1"..i,"group","afight")
			SetTriggerOption("afight2"..i,"group","afight")
			SetTriggerOption("afight3"..i,"group","afight")
            SetTriggerOption("afight1"..i,"keep_evaluating","y")
		else
			kflag[i]=0
		end
	end
	EnableTriggerGroup('afight',true)   
end
function kezhiwugongReStart()
	--npc_num=0
	kezhisuccess=0
end
function kezhiwugongkill(p_num)
	--print(npcdienum[npc_name[p_num]])
	local tempv=false
	for v in pairs(npcdienum) do 
		if npcdienum[v]==npc_name[p_num] then
			tempv=true
		end
	end
	
	---print('npc_val.....: '..npc_val)
	
	if kflag[p_num]==2 and not tempv then
		--print("heqi="..heqi)
		if pkheqi==1 and (job.name=='diemenglou' or job.name=='pk' or job.name == 'guanfu') then
		   if heqi and heqi > tonumber(GetVariable("heqi_number")) then
			    print ('合气憋足了！老子要放大招刷死你！')
				print ('天！地！玄！黄！唯！我！独！尊！杀。。。。。。')
				---pumkmai注释 guanfu 后面单独改
                ---exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\mypfm\\hp')
				print('dml...1.....')
				exe('jiali max;perform finger.shentong;perform strike.pikong;jiali 1')
				haichaoID=npc_id[p_num]
		        kflag[p_num]=1
                return
			else
                ---pumkmai注释
				---exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
				print('dml...2.....')
				exe('set wimpy 100;set wimpycmd hp')
		        haichaoID=npc_id[p_num]
		        kflag[p_num]=1
                print ('积攒合气！')
                return
           end
		else ---else 不憋合气 ,不会走到这里
		   if job.name=='diemenglou' or job.name=='pk' or job.name == 'guanfu' then
		    ---pumkmai注释
			---
			    exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\mypfm\\hp')
		        haichaoID=npc_id[p_num]
		        kflag[p_num]=1
		   else
		        print('普通任务走到这里......heqi_count:'..heqi_count)
				--[[if heqi_count==-1 and heqi >= 300 then 
				   print('heqi 超过300,将设置heqi_count 为1')
				   heqi_count=1
				end ]]--
				exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
				
				--[[
				if heqi_count==-1 and heqi < 300 then 
				   exe('set wimpycmd pppp'..p_num..'\\hp')
				   exe('unset wimpy')
				elseif heqi_count==-1 and heqi >= 300 then 
				   exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
				   heqi_count=1
				else 
                   exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
                end 
                ]]--				

                						
		        --exe('set wimpy 100;set wimpycmd pppp'..p_num..'\\hp')
		        haichaoID=npc_id[p_num]
		        kflag[p_num]=1
		   end
		end
	else
		if pkheqi==1 and (job.name=='diemenglou' or job.name=='pk' or job.name == 'guanfu') then
		   if heqi and heqi > tonumber(GetVariable("heqi_number")) then
		      ---pumkmai注释 guanfu 后面单独改
                ---exe('set wimpy 100;set wimpycmd pkpfm\\mypfm\\hp')
				print('dml...3.....')
				exe('jiali max;perform finger.shentong;perform strike.pikong;jiali 1')
                return
		   else
                ---exe('set wimpy 100;set wimpycmd pkpfm\\hp')
				print('dml...4.....')
				exe('set wimpy 100;set wimpycmd hp')
                print ('积攒合气！')
                return
           end
		else ---dml不会走到这里
		   if job.name=='diemenglou' or job.name=='pk' or job.name == 'guanfu' then
                exe('set wimpy 100;set wimpycmd pkpfm\\mypfm\\hp')
		   else
			    exe('set wimpy 100;set wimpycmd pfmpfm\\hp')
		   end
		end
	end
end

npc_skill = ''
npc_val = ''
function kezhiwugongValue(kzValue,i,kezhiwugongName)
    print('kezhiwugongValue.....i='..i..','..kzValue)
	local tflag=true
	if npc_kezhi[i]==kzValue then
		   kflag[i]=2
           tflag=false
		   print('敌人武功没变化，不变招！')
		end
	if tflag then
		table.remove(npc_kezhi,i,kzValue)
		table.insert(npc_kezhi,i,kzValue)
		kezhiwugongsuccess(kzValue,kezhi_order[kzValue],i,kezhiwugongName)
	end
        table.remove(npc_wugong,i,kezhiwugongName)
	    table.insert(npc_wugong,i,kezhiwugongName)
		print("npc_wugong="..npc_wugong[i])
	ColourNote ("red","blue",npc_name[i].."使用武功【"..kezhiwugongName.."】,武功属性："..kzValue)
	npc_skill = kezhiwugongName
	npc_val = kzValue
end

function kezhiwugongValueBuff(kzValue,i,kezhiwugongName,buffName)
    print('kezhiwugongValueBuff.....i='..i..','..kzValue..','..buffName)
	table.remove(npc_buff,i,buffName)
	table.insert(npc_buff,i,buffName)
	kezhiwugongsuccess(kzValue,kezhi_order[kzValue],i,kezhiwugongName)
end


function kezhiwugongcheck1(n,l,w)
	kezhiwugongcheck(1,n,l,w)
end
function kezhiwugongcheck2(n,l,w)
	kezhiwugongcheck(2,n,l,w)
end
function kezhiwugongcheck3(n,l,w)
	kezhiwugongcheck(3,n,l,w)
end
function kezhiwugongcheck4(n,l,w)
	kezhiwugongcheck(4,n,l,w)
end
function kezhiwugongcheck(i,n,l,w)
    --print('kezhiwugongcheck.....')
	local tmpdes=""
		if string.find(w[2],"对着你的背部踢去，正是一招「神龙追逝")  or string.find(w[3],"对着你的背部踢去，正是一招「神龙追逝") then
		  return kezhiwugongValue("刚",i,"神龙腿法")
	    end
	--[[if string.find(w[2],"只听“嗤嗤”之声连响")  or string.find(w[3],"只听“嗤嗤”之声连响") then
		return kezhiwugongValue("险",i,"弹指神通")
	end]]
	if string.find(w[2],"一道如烟似雾的掌气在")  or string.find(w[3],"一道如烟似雾的掌气在") then
		return kezhiwugongValue("柔",i,"化骨绵掌")
	end
	if string.find(w[2],"掌印就如追魂跗骨般，眨眼就印到了")  or string.find(w[3],"掌印就如追魂跗骨般，眨眼就印到了")   then
		return kezhiwugongValue("柔",i,"化骨绵掌")
	end
	if string.find(w[2],"太极圆圈套")  or string.find(w[3],"太极圆圈套")   then
		return kezhiwugongValue("柔",i,"太极拳")
	end
	if string.find(w[2],"无相劫")  or string.find(w[3],"无相劫")   then
		return kezhiwugongValue("无",i,"无相劫指")
	end
	if string.find(w[2],"满场游走，东刺一剑，西刺一剑")  or string.find(w[3],"满场游走，东刺一剑，西刺一剑") then
		return kezhiwugongValue("妙",i,"独孤九剑")
	end
	if string.find(w[2],"一式「想入非非」")  or string.find(w[3],"一式「想入非非」") then
		return kezhiwugongValue("慢",i,"黯然销魂掌")
	end
	if string.find(w[2],"一招「饮恨吞声」")  or string.find(w[3],"一招「饮恨吞声」") then
		return kezhiwugongValue("慢",i,"黯然销魂掌")
	end
	
	if string.find(w[2],"凝结了一面气盾")  or string.find(w[3],"凝结了一面气盾") then
	    if npc_kezhi[i]~=nil and npc_wugong[i]~=nil and npc_buff[i]==nil then 
	         kezhiwugongValueBuff(npc_kezhi[i],i,npc_wugong[i],"气盾")
	    end 
	end
	
	if string.find(w[2],"正迷沉恍惚中，") or
		string.find(w[2],"犹如身陷洪涛巨浪，随着") or
		string.find(w[2],"略一迟疑，浑身已为") then
		return kezhiwugongValue("慢",i,"黯然销魂掌")
	end
	if job.name=='hubiao' and (string.find(w[2],hb_team_name)  or string.find(w[3],hb_team_name)) then
		return
	end

	--天地会临时加入，防止同伙招式误判为克制武功
	if job.name=='tdh' and ((job.target2 and (string.find(w[2],job.target2)  or string.find(w[3],job.target2))) or 
	(job.target3 and (string.find(w[2],job.target3)  or string.find(w[3],job.target3)))) then
		return
	end
	if string.find(w[2],"蓦地里一股力道飞来，将")  or 
		string.find(w[2],"当下一股内力冲向") or 
		string.find(w[3],"双手前探，左臂搭上") or 
		string.find(w[3],"星移斗转，") or 
		string.find(w[3],"作壁上观，双手与对方相交数掌，谈笑间竟使出") or 
		string.find(w[3],"使出的招数好") or 
		string.find(w[3],"身如飘风，恰似漫天星移，诡异地一式，双掌动向无定不可捉摸地拍向") or 
		string.find(w[3],"身行飘忽不定，在星移斗转之间反用") then
		return kezhiwugongdzxy()
	end
	if string.find(w[3],"双手分使，灵活异常") then
		return kezhiwugonghubo()
	end
	if w[2]~=nil then
		if string.find(w[2],"你") then
			--print("----------检测到自己出招-----------")
			return
		end
		tmpdes=tmpdes..w[2]
	end
	if w[3]~=nil then
		tmpdes=tmpdes.."|"..w[3]
	end
	--print(tmpdes)
	--print("----------正在检测-----------")
	if string.find(tmpdes,"「摘星换斗」") and string.find(tmpdes,"的后背斫去") then
		return kezhiwugongValue("快",i,"四象掌")
	end
	if string.find(tmpdes,"一个太极圆圈套出")  then
		return kezhiwugongValue("柔",i,"太极拳")
	end
	if string.find(tmpdes,"掌气在你胸前形成一个掌印形。")  then
		return kezhiwugongValue("柔",i,"化骨绵掌")
	end
	if string.find(tmpdes,"对着你的背部踢去，正是一招「神龙追逝")  then
		return kezhiwugongValue("刚",i,"神龙腿法")
	end
	if npc_wugong[i] then
	print("npc_wugong="..npc_wugong[i])
	end
	
	if string.find(w[3],"总算变招迅速，没给你拂中") then 
	   --print('兰花手没有命中...')
	   if heqi_count>0 then 
	       pfm_heqi_count_add = pfm_heqi_count_add - 1
	      print('pfm_heqi_count_add='..pfm_heqi_count_add)
	   end 
	  
	end 
	
	
	   if npc_wugong[i] and npc_wugong[i]=="般若掌" then
	      if string.find(tmpdes,"的伤处造成一处瘀") then
		     damage_level=damage_level+1
	      end
	      --[[if string.find(tmpdes,"造成任何") then
		     damage_level=damage_level+1
	      end]]
	      if string.find(tmpdes,"没给你拂中") then
		    damage_level=damage_level+1
	      end
	      print("damage_level="..damage_level)
	      --[[if damage_level>5 then 
		     return kezhiwugongValue("正",i,"般若掌")
	      end]]--
	   end
	for v,p in pairs(kezhiDesc) do 
		for j,k in pairs(p) do
			for q in pairs(k) do
				if string.find(tmpdes,k[q]) then
					return kezhiwugongValue(v,i,j)
				end
			end
		end
	end
end
function kezhiwugongAttribue(kezhiSkillName)
	for v,p in pairs(kezhiDesc) do 
		for j,k in pairs(p) do
			if j==kezhiSkillName then
				return v
			end
		end
	end
end
function kezhiwugongSetPerform(tempatt,i,targetid,kezhiwugongName)
	if job.name == 'diemenglou' or job.name == 'pk' or job.name == 'guanfu' then
	   create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pppp'..i..' '..GetVariable(pk_valuecmd[tempatt]))
	   --exe('kezhiwugongpfm')
	   Execute('kezhiwugongpfm')
	   create_alias('mypfm_kezhi','mypfm_kezhi','alias mypfm '..GetVariable("mypfm")..' '.. targetid)
       --exe('mypfm_kezhi')
	   Execute('mypfm_kezhi')
	else
	  print('设置克制alias....')
	  local valuecmd = kezhi_valuecmd_func(tempatt,i,kezhiwugongName)
	  print('heqi_count..'..heqi_count)
	  print('valuecmd..'..valuecmd)
	  create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pppp'..i..' '..valuecmd..' '.. targetid)
	  --exe('kezhiwugongpfm')
	  Execute('kezhiwugongpfm')
	  	  
	  --pfm_xiangyun = GetVariable('pfm_xiangyun')
	  ---if  job.name == 'wudang' and string.find(pfm_xiangyun,score.xiangyun) then 
	 --[[if  string.find(pfm_xiangyun,score.xiangyun) then 
	     print('不好的理相，特殊的pfm......')
	      create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pppp'..i..' '..GetVariable(kezhi_si_valuecmd[tempatt])..' '.. targetid)
	      exe('kezhiwugongpfm')
	  else 
	   create_alias('kezhiwugongpfm','kezhiwugongpfm','alias pppp'..i..' '..GetVariable(kezhi_valuecmd[tempatt])..' '.. targetid)
	   exe('kezhiwugongpfm')
	  end ]]--
	end
end

function kezhi_valuecmd_func(tempatt,i,kezhiwugongName)
    pfm_xiangyun = GetVariable('pfm_xiangyun') 
	pfm_xiangyun_score = tonumber(GetVariable('pfm_xiangyun_score')) 
	pfm_add = GetVariable('pfm_add') 
	pfm_add_si = GetVariable('pfm_add_si')
	pfm_yanchi = GetVariable('pfm_yanchi')
	pfm_bieqie_mode = tonumber(GetVariable('pfm_bieqie_mode'))
 	local use_wxb_sq = tonumber(GetVariable('use_wxb_sq'))
	local pfm_tail = GetVariable('pfm_tail')
	
	local valuecmd = ''
	
	if shenqi_id ~= nil and use_wxb_sq==1  then
	    print('获取神器的cmd.........')
	    valuecmd = GetVariable(kezhi_sq_valuecmd[tempatt])
		local s = nil
		_,_,s = string.find(shenqi_id, "(%a+)%s*jian")
		valuecmd = string.gsub(valuecmd,'shenqi_id',s) 
	else
	    valuecmd = GetVariable(kezhi_valuecmd[tempatt])
	end
	
    ---valuecmd = GetVariable(kezhi_valuecmd[tempatt])

	if job.name == 'huashan' and heqi_count==1 and pfm_bieqie_mode==1 then 
	   if string.find(pfm_yanchi,kezhiwugongName) then 
	      print('hsjob..mode 1')
		  heqi_count = -1
	   end 
	end
	
	if job.name == 'huashan' and heqi_count==1 and pfm_bieqie_mode==2 then 
	   if string.find(pfm_yanchi,kezhiwugongName) and string.find(pfm_xiangyun,score.xiangyun) then	   
	      print('hsjob..mode 2')
		  heqi_count = -1
	   end 
	end
	
	if job.name == 'huashan' and heqi_count==1 and pfm_bieqie_mode==3 then 
	   if string.find(pfm_xiangyun,score.xiangyun) then
          print('hsjob..mode 3')		   
	      heqi_count = -1
	   end 
	end
	
	if job.name == 'huashan' and heqi_count==1 and pfm_bieqie_mode==4 then 
	   if string.find(pfm_xiangyun,score.xiangyun) and score.xiangyun_score >= pfm_xiangyun_score  then	 
        print('hsjob..mode 4')	   
	      heqi_count = -1
	   end 
	end
		
	
	if heqi_count == -1 then  
           local idx, _ = string.find(valuecmd,'jiali max')
           valuecmd = string.sub(valuecmd,1,idx-2)
           valuecmd = valuecmd .. pfm_tail	   
		  
	end 
	
	if heqi_count == -2 then 
	  
           local idx, _ = string.find(valuecmd,'jiali max')
           valuecmd = string.sub(valuecmd,1,idx-2)	
		   print('heqi_count=-2....valuecmd'..valuecmd)
		   
		   if string.find(pfm_xiangyun,score.xiangyun) or pfm_use_kuangfeng == 1  then
                print('1111')
		        valuecmd = valuecmd .. pfm_add_si
		   else
		        print('333333')
		        valuecmd = valuecmd .. pfm_add
		   end 
		     
	   --end 
	end 
	
	
	
	return valuecmd
	
end 

function kezhiwugongsuccess(kezhi_cmd,k_order,npci,kezhiwugongName)
    print('kezhiwugongsuccess....')
	for i=1,npc_num do
		--print("kflag"..i.."="..kflag[i]..npc_name[i])
		if npc_name[i]~=nil and kflag[i]>0 and npc_name[i]==npc_name[npci] then
			kezhiwugongSetPerform(kezhi_cmd,i,npc_id[i],kezhiwugongName)
			npc_order[i]=k_order
			kflag[i]=2
			kezhisuccess=kezhisuccess+1
			if i==npc_num then
				break
			end
		end
	end
	print("kezhisuccess="..kezhisuccess.."","npc_num="..npc_num)
	if kezhisuccess>=npc_num or table.getn(npcdienum)>0 then
		local tflag=1
		for i=2,npc_num do
			if npc_order[i]~=nil and npc_order[i]<npc_order[tflag] then
				print(npc_order[i],npc_order[tflag])
				tflag=i
			end
		end
		if job.name~="songmoya" then
			kezhiwugongkill(tflag)
		end
		if job.name~='xueshan' and job.name~='wudang' and job.name~='Dummyjob' and job.name~='songmoya' and job.name ~= 'diemenglou' and job.name ~= 'songxin' and job.name ~= 'songxin2' and job.name ~= 'idle' and job.name ~= 'pk' and job.name ~= 'guanfu' and job.name ~= 'huashan' then
			kezhiwugongclose()
		end
	end
end
function kezhiwugongclose()
	print("关闭检测")
	EnableTriggerGroup('afight',false)
    DeleteTriggerGroup("afight")
	npc_num=0
	haichaoID=nil
	kezhisuccess=0
	damage_level=0
end
function kezhiwugongdzxy()
	EnableTriggerGroup('afight',false)
	Note('斗转星移')
	wait.make(function()
		wait.time(0.5)
		EnableTriggerGroup('afight',true)
	 end)
end
function kezhiwugonghubo()
	EnableTriggerGroup('afight',false)
	wait.make(function()
		wait.time(0.5)
		EnableTriggerGroup('afight',true)
	 end)
end