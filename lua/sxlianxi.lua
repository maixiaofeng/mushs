function dazuo_lianxi_auto() 
         tmp.lxskill='bei none;unwield mu jian;unwield kunlun sword;unwield sanqing sword;unwield wuji xiao;unwield tiandi xiao;unwield coin'
        lianxi_times = 30
        
        for p in pairs(skills) do
                if (skillEnable[p] and skills[p].lvl<hp.pot_max-100) or (skillEnable[p] and skills[p].lvl==hp.pot_max-100 and skills[p].pot<(skills[p].lvl+1)^2) then
                        if skillEnable[p]=="force" then
                                tmp.lxskill=tmp.lxskill..'lian force '..lianxi_times..';'
                        end
                        if skillEnable[p]=="strike" then
                                tmp.lxskill=tmp.lxskill..'jifa strike '..p..';lian strike '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="hand" then
                                tmp.lxskill=tmp.lxskill..'jifa hand '..p..';lian hand '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="leg" then
                                tmp.lxskill=tmp.lxskill..'lian leg '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="sword" then
                                tmp.lxskill=tmp.lxskill..'jifa sword '..p..';wield kunlun sword;lian sword '..lianxi_times..';unwield kunlun sword;yun jingli;'
                        end
                        if skillEnable[p]=="whip" then
                                tmp.lxskill=tmp.lxskill..'wield whip;lian whip '..lianxi_times..';unwield whip;yun jingli;'
                        end
                        if skillEnable[p]=="axe" then
                                tmp.lxskill=tmp.lxskill..'wield axe;lian axe '..lianxi_times..';unwield axe;yun jingli;'
                        end
                        if skillEnable[p]=="finger" then
                                tmp.lxskill=tmp.lxskill..'jifa finger '..p..';lian finger '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="cuff" then
                                tmp.lxskill=tmp.lxskill..'jifa cuff '..p..';lian cuff '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="claw" then
                                tmp.lxskill=tmp.lxskill..'jifa claw '..p..';lian claw '..lianxi_times..';yun jingli;'
                        end
                        if skillEnable[p]=="throwing" then
                                tmp.lxskill=tmp.lxskill..'wield coin;lian throwing '..lianxi_times..';unwield coin;yun jingli;'
                        end
                        if skillEnable[p]=="blade" then
                                tmp.lxskill=tmp.lxskill..'jifa blade '..p..';wield blade;lian blade '..lianxi_times..';unwield blade;yun jingli;'
                        end
                        if skillEnable[p]=="dagger" then
                                tmp.lxskill=tmp.lxskill..'wield dagger;lian dagger '..lianxi_times..';unwield dagger;yun jingli;'
                        end
                        if skillEnable[p]=="dodge" then
                                tmp.lxskill=tmp.lxskill..'lian dodge '..lianxi_times..';yun jingli;'
                        end
                end                
        end
        tmp.lxskill=tmp.lxskill..'bei cuff'
        end
end
function set_sxlian()
        dazuo_lianxi_auto()
        create_alias('sxlianxi','sxlianxi','alias sxlian '..tmp.lxskill)
        exe('sxlianxi')
end