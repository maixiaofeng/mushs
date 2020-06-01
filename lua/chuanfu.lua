-- ����ϵ��
Chuanfu = {
    enable = false,
    -- �½��ɿ� �ƺ������ɿ�
    -- ���Ķɿ� ���ݶɿ�
    -- �����ɿ� ���׽�
    sanjin = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    },
    huanghe = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    },
    xixia = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    },
    lanzhou = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    },
    changjiang = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    },
    lancangjiang = {
        enable = false,
        arriveTime = 0,
        departTime = 0
    }
}

function Chuanfu:addtrigger()
    DeleteTriggerGroup("chuanfu")
    create_trigger_t('chuanfu1', "^(> )*\\D*�����㣺�����ɴ�����ʱ��",
                     '', 'changjiangOpen')
    create_trigger_t('chuanfu2',
                     "^(> )*\\D*�����㣺���׽��ɴ�����ʱ��", '',
                     'lancangjiangOpen')
    create_trigger_t('chuanfu3',
                     "^(> )*\\D*�����㣺���׽��ɴ�����ʱ��", '',
                     'lancangjiangClose')
    create_trigger_t('chuanfu4', "^(> )*\\D*�����㣺�����ɴ�����ʱ��",
                     '', 'changjiangClose')
    create_trigger_t('chuanfu5',
                     "^(> )*\\D*�����㣺�ƺ������ɿڳ���ʱ��",
                     '', 'huangheOpen')
    create_trigger_t('chuanfu6',
                     "^(> )*\\D*�����㣺�ƺ������ɿڵ���ʱ��",
                     '', 'huangheClose')
    create_trigger_t('chuanfu7', "^(> )*\\D*�����㣺�½��ɿڳ���ʱ��",
                     '', 'sanjinOpen')
    create_trigger_t('chuanfu8', "^(> )*\\D*�����㣺�½��ɿڵ���ʱ��",
                     '', 'sanjinClose')
    create_trigger_t('chuanfu9', "^(> )*\\D*�����㣺���Ķɿڳ���ʱ��",
                     '', 'xixiaOpen')
    create_trigger_t('chuanfu10', "^(> )*\\D*�����㣺���Ķɿڵ���ʱ��",
                     '', 'xixiaClose')
    create_trigger_t('chuanfu11', "^(> )*\\D*�����㣺���ݶɿڳ���ʱ��",
                     '', 'lanzhouOpen')
    create_trigger_t('chuanfu12', "^(> )*\\D*�����㣺���ݶɿڵ���ʱ��",
                     '', 'lanzhouClose')
    SetTriggerOption("chuanfu1", "group", "chuanfu")
    SetTriggerOption("chuanfu2", "group", "chuanfu")
    SetTriggerOption("chuanfu3", "group", "chuanfu")
    SetTriggerOption("chuanfu4", "group", "chuanfu")
    SetTriggerOption("chuanfu5", "group", "chuanfu")
    SetTriggerOption("chuanfu6", "group", "chuanfu")
    SetTriggerOption("chuanfu7", "group", "chuanfu")
    SetTriggerOption("chuanfu8", "group", "chuanfu")
    SetTriggerOption("chuanfu9", "group", "chuanfu")
    SetTriggerOption("chuanfu10", "group", "chuanfu")
    SetTriggerOption("chuanfu11", "group", "chuanfu")
    SetTriggerOption("chuanfu12", "group", "chuanfu")
    EnableTriggerGroup("chuanfu", true)
end
function sanjinOpen()
    -- �½��ɿڿ���->��Ӧ��ϵ���ƺ������ɿ�
    Chuanfu.ck_hhdk1 = 0
    Chuanfu.dkopen1 = os.clock()

    Chuanfu.sanjin.enable = true
    Chuanfu.sanjin.departTime = os.clock()
end
function sanjinClose()
    -- �½��ɿڹر�->��Ӧ��ϵ���ƺ������ɿ�
    Chuanfu.sanjin.enable = false
    Chuanfu.sanjin.arriveTime = os.clock()
end
function huangheOpen()
    -- �ƺ������ɿڿ���->��Ӧ��ϵ���½��ɿ�
    Chuanfu.huanghe.enable = true
    Chuanfu.huanghe.departTime = os.clock()
end
function huangheClose()
    -- �ƺ������ɿڹر�->��Ӧ��ϵ���½��ɿ�
    Chuanfu.huanghe.enable = false
    Chuanfu.huanghe.arriveTime = os.clock()
end
function xixiaOpen()
    -- ���Ķɿڿ���->��Ӧ��ϵ�����ݶɿ�
    Chuanfu.xixia.enable = true
    Chuanfu.xixia.departTime = os.clock()
    Chuanfu.ck_hhdk3 = 0
    Chuanfu.dkopen3 = os.clock()
end
function xixiaClose()
    -- ���Ķɿڹر�->��Ӧ��ϵ�����ݶɿ�
    Chuanfu.xixia.enable = false
    Chuanfu.xixia.arriveTime = os.clock()
    Chuanfu.ck_hhdk3 = 1
    Chuanfu.dkclose3 = os.clock()
end
function lanzhouOpen()
    -- ���ݶɿڿ���->��Ӧ��ϵ�����Ķɿ�
    Chuanfu.lanzhou.enable = true
    Chuanfu.lanzhou.departTime = os.clock()
    Chuanfu.ck_hhdk4 = 0
    Chuanfu.dkopen4 = os.clock()
end
function lanzhouClose()
    -- ���ݶɿڹر�->��Ӧ��ϵ�����Ķɿ�
    Chuanfu.lanzhou.enable = false
    Chuanfu.lanzhou.arriveTime = os.clock()
    Chuanfu.ck_hhdk4 = 1
    Chuanfu.dkclose4 = os.clock()
end


function Chuanfu:closeSanjin()
    map.rooms["changan/road2"].ways["#duHhe"] = nil
    map.rooms["changan/road3"].ways["#duHhe"] = nil
end

function Chuanfu:closeHuanghe()
    map.rooms["huanghe/road2"].ways["#duHhe"] = nil
    map.rooms["huanghe/road3"].ways["#duHhe"] = nil
end


function Chuanfu:openHuangHeArea()
    map.rooms["lanzhou/road3"].ways["#duHhe"]='lanzhou/road2'
    map.rooms["lanzhou/road2"].ways["#duHhe"]='lanzhou/road3'
    map.rooms["lanzhou/dukou3"].ways["#duHhe"]='lanzhou/dukou2'
    map.rooms["lanzhou/dukou2"].ways["#duHhe"]='lanzhou/dukou3'
    map.rooms["changan/road3"].ways["#duHhe"]='changan/road2'
    map.rooms["changan/road2"].ways["#duHhe"]='changan/road3'
    map.rooms["huanghe/road3"].ways["#duHhe"]='huanghe/road2'
    map.rooms["huanghe/road2"].ways["#duHhe"]='huanghe/road3'
   end

function Chuanfu:check_hh()
    Chuanfu:openHuangHeArea()
    
-- �½��ɿ� changan/road2  changan/road3
-- �ƺ������ɿ� huanghe/road2 huanghe/road3
    if Chuanfu.sanjin.enable and Chuanfu.huanghe.enable then
        if Chuanfu.sanjin.departTime > Chuanfu.huanghe.departTime then
            Chuanfu:closeHuanghe()
        else
            Chuanfu:closeSanjin()
        end
    elseif Chuanfu.huanghe.enable then
        Chuanfu:closeSanjin()
    elseif Chuanfu.sanjin.enable then
        Chuanfu:closeHuanghe()
    else
        if Chuanfu.sanjin.arriveTime > Chuanfu.huanghe.arriveTime then
            Chuanfu:closeSanjin()
        else
            Chuanfu:closeHuanghe()
        end
    end
    return Chuanfu:checkXixiaLanzhou()
end

function Chuanfu:closeLanzhou()
    map.rooms["lanzhou/road2"].ways["#duHhe"] = nil
    map.rooms["lanzhou/road3"].ways["#duHhe"] = nil
end

function Chuanfu:closeXixia()
    map.rooms["lanzhou/dukou2"].ways["#duHhe"] = nil
    map.rooms["lanzhou/dukou3"].ways["#duHhe"] = nil
end


function Chuanfu:checkXixiaLanzhou()
-- ���Ķɿ� lanzhou/dukou2 lanzhou/dukou3
-- ���ݶɿ� lanzhou/road2 lanzhou/road3
    if Chuanfu.xixia.enable and Chuanfu.lanzhou.enable then
        if Chuanfu.xixia.departTime > Chuanfu.lanzhou.departTime then
            Chuanfu:closeLanzhou()
        else
            Chuanfu:closeXixia()
        end
    elseif Chuanfu.xixia.enable then
        Chuanfu:closeLanzhou()
    elseif Chuanfu.lanzhou.enable then
        Chuanfu:closeXixia()
    else
        if Chuanfu.xixia.arriveTime > Chuanfu.lanzhou.arriveTime then
            Chuanfu:closeXixia()
        else
            Chuanfu:closeLanzhou()
        end
    end
end

function changjiangOpen()
    Chuanfu.enable = true
    -- print('�����ɿڿ���')
    Chuanfu.changjiang.enable = true
    Chuanfu.changjiang.departTime = os.clock()
end
function changjiangClose()
    Chuanfu.enable = true
    -- print('�����ɿڹر�')
    Chuanfu.changjiang.enable = false
    Chuanfu.changjiang.arriveTime = os.clock()
end
function lancangjiangOpen()
    -- print('���׽��ɿڿ���')
    Chuanfu.lancangjiang.enable = true
    Chuanfu.lancangjiang.departTime = os.clock()
end
function lancangjiangClose()
    -- print('���׽��ɿڹر�')
    Chuanfu.lancangjiang.enable = false
    Chuanfu.lancangjiang.arriveTime = os.clock()
end

function Chuanfu:openAllareas()
    Chuanfu:openChangJiangArea()
    Chuanfu:openHuangHeArea()
end

function Chuanfu:openChangJiangArea()
    map.rooms["city/jiangbei"].ways["#duCjiang"] = 'city/jiangnan'
    map.rooms["city/jiangnan"].ways["#duCjiang"] = 'city/jiangbei'
    map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] =
        'dali/dalisouth/jiangbei'
    map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] =
        'dali/dalisouth/jiangnan'
end

function Chuanfu:closeChangJiang()
    map.rooms["city/jiangbei"].ways["#duCjiang"] = nil
    map.rooms["city/jiangnan"].ways["#duCjiang"] = nil
end

function Chuanfu:closeLanCangJiang()
    map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = nil
    map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = nil
end

function Chuanfu:check_cjn()
    Chuanfu:openChangJiangArea()
    if Chuanfu.changjiang.enable and Chuanfu.lancangjiang.enable then
        if Chuanfu.changjiang.departTime > Chuanfu.lancangjiang.departTime then
            Chuanfu:closeLanCangJiang()
        else
            Chuanfu:closeChangJiang()
        end
    elseif Chuanfu.changjiang.enable then
        Chuanfu:closeLanCangJiang()
    elseif Chuanfu.lancangjiang.enable then
        Chuanfu:closeChangJiang()
    else
        if Chuanfu.changjiang.arriveTime < Chuanfu.lancangjiang.arriveTime then
            Chuanfu:closeLanCangJiang()
        else
            Chuanfu:closeChangJiang()
        end
    end
end

function Chuanfu:closeLoclroom() -- ��նɽ��ɺ�·��
    if locl.room_relation == '��˫����---���׽������׽���' or
        locl.room_relation == '�ɴ�����˫����---���׽������׽���' then
        map.rooms["dali/dalisouth/jiangnan"].ways["#duCjiang"] = nil
    elseif locl.room_relation == '���׽���---�ּ�����׽���' or
        locl.room_relation == '�ɴ������׽���---�ּ�����׽���' then
        map.rooms["dali/dalisouth/jiangbei"].ways["#duCjiang"] = nil
    elseif locl.room == '��������' then
        map.rooms["city/jiangbei"].ways["#duCjiang"] = nil
        map.rooms["city/jiangbei"].ways["enter"] = nil
        map.rooms["city/jiangbei"].ways["west"] = nil
        map.rooms["city/jiangbei"].ways["east"] = nil
    elseif locl.room == '�����ϰ�' then
        map.rooms["city/jiangnan"].ways["#duCjiang"] = nil
    elseif locl.room_relation == '����I��ɿڴ�ɿ�' or
        locl.room_relation == '����ƺӶɴ��I�Ĵ�ɿڴ�ɿ�' then
        map.rooms["lanzhou/road3"].ways["#duHhe"] = nil
    elseif locl.room_relation == '��ɿ�----�����ɿ�' or
        locl.room_relation == '�ƺӶɴ��Ĵ�ɿ�----�����ɿ�' then
        map.rooms["lanzhou/road2"].ways["#duHhe"] = nil
    elseif locl.room_relation == '�ƺӨI���Ķɿ����Ķɿ�' or
        locl.room_relation == '�ƺӻƺӶɴ��I�����Ķɿ����Ķɿ�' then
        map.rooms["lanzhou/dukou3"].ways["#duHhe"] = nil
    elseif locl.room_relation == '���ĶɿڨKɽ�������Ķɿ�' or
        locl.room_relation ==
        '�ƺӶɴ������ĶɿڨKɽ�������Ķɿ�' then
        map.rooms["lanzhou/dukou2"].ways["#duHhe"] = nil
    elseif locl.room_relation == '������½��ɿ��½��ɿ�' then
        map.rooms["changan/road3"].ways["#duHhe"] = nil
    elseif locl.room_relation ==
        '�½��ɿڣ��K��·������ԭ�½��ɿ�' or locl.room_relation ==
        '�ɴ����½��ɿڣ��K��·������ԭ�½��ɿ�' then
        map.rooms["changan/road2"].ways["#duHhe"] = nil
    elseif locl.room_relation == '�ٵ�����ɿڴ�ɿ�' then
        map.rooms["huanghe/road3"].ways["#duHhe"] = nil
    elseif locl.room_relation == '��ɿڣ��ƺ��뺣�ڴ�ɿ�' or
        locl.room_relation == '�ɴ��Ĵ�ɿڣ��ƺ��뺣�ڴ�ɿ�' then
        map.rooms["huanghe/road2"].ways["#duHhe"] = nil
    end
end