


lookCitys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "���ݳ�",	["changan"] = "������",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ���",	["city"] = "���ݳ�",		["dali"] = "�����",
	["daliwest"] = "�������",["dalisouth"] = "�������",["dalieast"] = "����Ƕ�",
	["wuliang"] = "����ɽ",	["dlhg"] = "����ʹ�",	["wangfu"] = "��������",	["gumu"] = "����ɽ",
	["yuxu"] = "�����",		["death"] = "ʮ�˲����",	["emei"] = "����ɽ",	["yideng"] = "��Դ��",
	["foshan"] = "��ɽ��",	["fuzhou"] = "���ݳ�",	["gb"] = "ؤ��",	["fairyland"] = "����ɽ",		
	["jqg"] = "�����",		["xuantie"] = "��������",	["hengshan"] = "��ɽ",	["hj"] = "�ؽ�",	
	["hmy"] = "��ľ��",		["pingding"] = "ƽ����",	["huanghe"] = "�ƺ�����",	["yyd"] = "����",
	["huashan"] = "��ɽ��",	["hz"] = "���ݳ�",		["jiaxing"] = "���˳�",	["kunlun"] = "������",
	["lanzhou"] = "���ݳ�",	["meizhuang"] = "÷ׯ",	["miaojiang"] = "�置",	["mingjiao"] = "����",
	["hdg"] = "������",		["hhd"] = "����",		["lsd"] = "���ߵ�",		["mr"] = "����Ľ��",
	["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",	["nanyang"] = "������",	["ningbo"] = "������",
	["putian"] = "��������",	["shaolin"] = "������",	["sld"] = "������",		["songshan"] = "��ɽ��",
	["suzhou"] = "���ݳ�",	["taishan"] = "̩ɽ",	["tanggu"] = "������",	["thd"] = "�һ���",
	["niujia"] = "ţ�Ҵ�",	["guiyun"] = "����ׯ",	["tianshan"] = "��ɽ",	["tiezhang"] = "���ư�",
	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",	["wudang"] = "�䵱��",
	["houshan"] = "�䵱��ɽ",	["wuguan"] = "���",		["xiakedao"] = "���͵�",	["xiangyang"] = "������",	
	["lzz"] = "������",		["xingxiu"] = "������",	["yili"] = "�����",		["xueshan"] = "������",
	["caoyuan"] = "���ԭ",	["zhiye"] = "����",		["group"] = "��ԭ",		
	["entry"] = "",
}

citys = {
	["baituo"] = "����ɽ",	["beijing"] = "����",	["cangzhou"] = "����",	["changan"] = "����",
	["changle"] = "���ְ�",	["chengdu"] = "�ɶ�",	["city"] = "����",		["dali"] = "�����",
	["death"] = "ʮ�˲����",	["emei"] = "����ɽ",		["fairyland"] = "�����ɾ�",["foshan"] = "��ɽ", 
	["fuzhou"] = "����",		["gb"] = "ؤ��ֶ�",	    ["gumu"] = "��Ĺ",		["hengshan"] = "��ɽ",
	["hj"] = "�ؽ�",			["hmy"] = "��ľ��",		["huanghe"] = "�ƺ�����",	["huashan"] = "��ɽ",
	["hz"] = "����",			["jiaxing"] = "����",	["kunlun"] = "����ɽ",
	["lanzhou"] = "����",	["miaojiang"] = "�置",	["mingjiao"] = "����",	["murong"] = "Ľ��",
	["mr"] = "s",		["nanyang"] = "����",	["ningbo"] = "����",		["putian"] = "��������",
	["meizhuang"] = "÷ׯ",	["shaolin"] = "��ɽ����",	["sld"] = "������",		["songshan"] = "��ɽ",
	["suzhou"] = "����",		["taishan"] = "̩ɽ",	["tanggu"] = "����",		["thd"] = "�һ���",
	["tiezhang"] = "����ɽ",	["tls"] = "������",		["village"] = "��ɽ��",	["wizard"] = "��������",
	["wudang"] = "�䵱ɽ",	["wuguan"] = "���",		["xiangyang"] = "����",	["xingxiu"] = "���޺�",
	["xueshan"] = "��ѩɽ",	["yangzhou"] = "����",	["guiyun"] = "����ׯ",	["hdg"] = "������",
	["jqg"] = "�����",		["bhd"] = "����",		["lsd"] = "���ߵ�",		["pingding"] = "ƽ����",
	["caoyuan"] = "���ԭ",	["niujia"] = "ţ�Ҵ�",	["wuliang"] = "����ɽ",	["wangfu"] = "��������",
	["yideng"] = "��Դ��",	["yili"] = "����",		["yanziwu"] = "������",	["mtl"] = "��٢��ɽׯ",
	["shijian"] = "�Խ�ɽׯ",	["zhiye"] = "��ԭ����",	
}
otherCitys = {
	["gumu"] = "��Ĺ��", "�ɶ�����", "����Ǳ�", "˿��֮·", "�ؽ���ԭ",
}

function getFirstWords()
	require("firstwords")
	return FirstWords
end

function getFirstWord(word)
	if not word then
		return ""
	end
	local fws = {}
	for w in string.gmatch(word,"..") do
		table.insert(fws,getFirstWords()[w])
	end
	return table.concat(fws)
end

function countTab(tab)
	local count = 0
	for _ in pairs(tab) do
		count = count + 1
	end
	return count
end

function isCity(p_city)
        local l_result=false
	for k,v in pairs(citys) do
	    if v==p_city then
	       l_result=true
	    end
	end
        for k,v in pairs(lookCitys) do
	    if v==p_city then
	       l_result=true
	    end
	end
	for k,v in pairs(otherCitys) do
	    if v==p_city then
	       l_result=true
	    end
	end
	return l_result
end

function getAddr(addr)
	local name, city = getAddr0(addr, citys)
	if name then
		return name, city
	else
		name, city = getAddr0(addr, lookCitys)
		if name then
			return name, city
		else
			return getAddr0(addr, otherCitys)
		end
	end
end

function getAddr0(addr, citys)
	for k,v in pairs(citys) do
		local _,_,city,name = string.find(addr,"^(" .. v .. ")(.+)$")
		if city and countTab(getRooms(name,city)) > 0 then
			return name, city
		end
	end
	if tmp.goto then
	   for _,v in pairs(map.rooms) do
	      if addr and type(v)=="table" and v.name and addr==v.name then
	         return v.name,getLookCity(v.id)
	      end
	   end
	end
	return false
end

function getLookCity(path)
	if path == "meizhuang/plum_maze" then
		return nil
	end
	local place = getPlace(path)
	for k,v in pairs(place) do
		if (v == "zhiye" or v == "entry") and not tmp.goto then
			return nil
		end
		if v ~= "entry" then
		   city = lookCitys[v]
		end
		if city then
			return city
		end
	end
end

function getPlace(path)
	local place = {}
	local i = 1
	while true do
		local n = string.find(path, "/", i)
		if n then
			table.insert(place,1,string.sub(path, i, n - 1))
			i = n + 1
		else
			break
		end
	end
	return place
end

function getCityRooms(city)
    local rooms = {}
	local isCityFw = city and string.find(city,"^%l+$")
	for id,room in pairs(map.rooms) do
	    local lookCity = isCityFw and getFirstWord(getLookCity(room.id)) or getLookCity(room.id)
		local taskCity = isCityFw and getFirstWord(getCity(room.id)) or getCity(room.id)
		if (city == lookCity) or (city == taskCity) or (room.outdoor and room.outdoor == city) then
		   table.insert(rooms,id)
	    end
	end
	return rooms
end 

function getRooms(name, city, type)
	local type = type or "all"
	local isLookCity = type == "all" or type == "look"
	local isTaskCity = type == "all" or type == "task"
	if string.find(name,"/") then
		return {name}
	end
	local isNameFw = string.find(name,"^%l+$")
	local isCityFw = city and string.find(city,"^%l+$")
	local rooms = {}
	for id,room in pairs(map.rooms) do
		local roomName = isNameFw and getFirstWord(room.name) or room.name
		if roomName == name then
			if not city then
			    print('getRooms...not city..'..id)
				table.insert(rooms,id)
			else
				local lookCity = isCityFw and getFirstWord(getLookCity(room.id)) or getLookCity(room.id)
				local taskCity = isCityFw and getFirstWord(getCity(room.id)) or getCity(room.id)
				if (isLookCity and city == lookCity) or (isTaskCity and city == taskCity) or (room.outdoor and room.outdoor == city) then
				print('getRooms...have city..'..id)
					table.insert(rooms,id)
				end
			end
		end
	end
	--if countTab(rooms) == 0 and score.id=="joshua" then
	--	Note("û�ҵ����䣺name = " .. name .. " , city = " .. tostring(city) .. " , type = " .. type)
	--end
	return rooms
end

function getCity(path)
	local place = getPlace(path)
	for k,v in pairs(place) do
		city = citys[v]
		if city then
			return city
		end
	end
	return ""
end

function getAroundRooms(name, city, length, type)
    print('getAroundRooms...'..name..','..city..','..length)
	local rooms = getRooms(name, city, type)
	local allRooms = {}
	for _, id in pairs(rooms) do
	    print('id='..id)
		local aroundRooms = map:getAroundRooms(id, length)
		for _, aroundRoom in pairs(aroundRooms) do
		    print('aroundRoom..'..aroundRoom)
			if not map.rooms[aroundRoom].nofind then
				allRooms[aroundRoom] = true
			end
		end
	end
	return allRooms
end

function getFindPath(from,name,city,length)
        local rooms=getAroundRooms(name, city, length)
	local f_path=""
	local l_dest,l_p 
        local to={}

	for id in pairs(rooms) do
	    table.insert(to,id)
	end

        for i=1,countTab(to) do
	    l_dest,l_p=getNearRoom(from,to)
        
	    local path, length = map:getPath(from, l_dest)
	    if path then
	       from=l_dest
	       f_path=f_path .. path
	    end
	    table.remove(to,l_p)
	end

	f_path=del_string(f_path,"halt;")
	return f_path        
end

function getNearRoom(from,to)
    if type(from)=="table" then
	   from = from[1]
	end
    if countTab(to)==1 then
	   return to[1]
	end

    local parents,distances = map:lookPath(from)
	local length,p
	
	for k,v in pairs(to) do
	    if distances[v] and (length==nil or length>distances[v]) then
	       length=distances[v]
	       p=k
	    end
	end

	return to[p],p

end
-- SjRoom class

SjRoom = {ways = {},lengths = {},nolooks = {}}

function SjRoom:new(room)
	local room = room or {}
	setmetatable(room,self)
	self.__index = self
	return room
end

function SjRoom:length(route)
	local length = self.lengths[route] or 1
	local isStr = length and type(length) == "string" or false
	if isStr then
		return loadstring(length)()
	else
		return length
	end
end

-- SjMap class

SjMap = {count = 0}

function SjMap:new(map)
	local map = map or {rooms={}}
	setmetatable(map,self)
	self.__index = self
	return map
end

function SjMap:addRoom(room)
	self.rooms[room.id]=SjRoom:new(room)
	self.count = self.count + 1
end

function SjMap:room(id)
	return self.rooms[id]
end

function SjMap:getMinRoom(pending)
	local processRoomId
	local minDistance
	for roomId, length in pairs(pending) do
		if minDistance == nil or length < minDistance then
			minDistance = length
			processRoomId = roomId
		end
	end
	if processRoomId then
		pending[processRoomId] = nil
	end
	return processRoomId
end

function SjMap:process(red,distances,pending,parents,from)
	red[from] = true
	local fromRoom = self:room(from)
	for route, to in pairs(fromRoom.ways) do
		local routeLength = fromRoom:length(route)
		if routeLength then
			local length = distances[from] + routeLength
			local distance = distances[to]
			if distance == nil or length < distance then
				distances[to] = length
				if red[to] == nil then
					pending[to] = length
				end
				parents[to] = {parent = from, route = route}
			end
		end
	end
end

function SjMap:init(red,distances,pending,parents,from)
	red[from] = true
	distances[from] = 0
	parents[from] = {parent = from, route = ""}
	self:process(red,distances,pending,parents,from)
end

Cache = {}
local DEFAUTL_CACHE_TIME = 10

function Cache:new(size, time)
	time = time or DEFAUTL_CACHE_TIME
	local cache = {size = size, time = time}
	setmetatable(cache, self)
	self.__index = self
	return cache
end

function Cache:get(key)
	local value
	for k, v in pairs(self) do
		if type(k) == "number" and v.key == key and os.time() - v.time <= self.time then
			--log.debug("Cache ���У�key = " .. v.key)
			value = v.value
			table.remove(self, k)
			table.insert(self, 1, v)
			break
		end
	end
	if not value then
		--log.debug("Cache δ���У�key = " .. key)
	end
	return value
end

function Cache:add(key, value)
	local v = {}
	v.key = key
	v.value = value
	v.time = os.time()
	table.insert(self, 1, v)
	if table.getn(self) > self.size then
		table.remove(self, self.size + 1)
	end
end

local cache = Cache:new(2)

function SjMap:lookPath(from)
	local value = cache:get(from)
	if not value then
		local red = {}
		local pending = {}
		distances = {}
		parents = {}
		self:init(red,distances,pending,parents,from)
		for i = 0, self.count do
			local processRoomId = self:getMinRoom(pending)
			if processRoomId then
				self:process(red,distances,pending,parents,processRoomId)
			else
				break
			end
		end
		-- cache last parents and distances
		parentsCache = {}
		distancesCache = {}
		value = {}
		value.parents = parents
		value.distances = distances
		cache:add(from, value)
	end
	return value.parents, value.distances
end

function SjMap:getAroundRooms(path, length)
	if length == 0 then
		return {path}
	end
	local parents, distances = self:lookPath(path)
	local rooms = {}
	for k, v in pairs(distances) do
		if string.find(path,'mr/') and string.find(k,'mr/') and v <= length then
			table.insert(rooms, k)
		end
		if string.find(path,'yanziwu/') and string.find(k,'yanziwu/') and v <= length then
			table.insert(rooms, k)
		end
		if string.find(path,'mtl/') and string.find(k,'mtl/') and v <= length then
			table.insert(rooms, k)
		end
		if not string.find(path,'mr/') and not string.find(path,'yanziwu/') and not string.find(path,'mtl/') and v <= length then
			table.insert(rooms, k)
		end
	end
	return rooms
end

function SjMap:getPath(from, to, try)
	--TraceOut("SjMap:getPath�� from = " .. from .. " ��to = " .. to)
	local parents,distances = self:lookPath(from)
	local length = distances[to]
	local path = {""}
	local room = to
	repeat
		local parentInfo = parents[room]
		local fromRoom = map.rooms[from]
		local toRoom = map.rooms[to]
		if parentInfo == nil then
			if not try then
				--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���޷����")
			end
			return false
		end
		local parent = parentInfo.parent
		local route = parentInfo.route
		local parentRoom = map.rooms[parent]
		local precmds = parentRoom.precmds
		local precmd = precmds and precmds[route]
		local postcmds = parentRoom.postcmds
		local postcmd = postcmds and postcmds[route]
		local blocks = parentRoom.blocks
		local block = blocks and blocks[route]
		local lengths = parentRoom.lengths
		local len = lengths and lengths[route]
		if postcmd then
			table.insert(path,1,";")
			table.insert(path,1,postcmd)
		end
		table.insert(path,1,";")
		table.insert(path,1,route)
		if precmd then
			table.insert(path,1,";")
			table.insert(path,1,precmd)
		end
		if block then
			for _, b in pairs(block) do
				local sameParty = b.party and b.party == score.party
				local cond = b.cond and b.cond()
				if not sameParty and not cond then
					if hp.exp < b.exp then
						return false
					else
						table.insert(path,1,";")
						table.insert(path,1,"#wipe " .. b.id)
					end
				end
			end
		end
		if len then
		   local isStr = len and type(len) == "string" or false
	           if isStr then
		      if not loadstring(len)() then return false end
	           end
		end
		room = parent
	until room == from
	table.insert(path,1,";")
	table.insert(path,1,"halt")
	local p = table.concat(path)
	--print("length="..length)
	return p, length
end

function SjMap:getPathWd(from, to, try)
	TraceOut("SjMap:getPath�� from = " .. from .. " ��to = " .. to)
	local parents,distances = self:lookPath(from)
	local length = distances[to]
	local path = {""}
	local room = to
	repeat
		local parentInfo = parents[room]
		local fromRoom = map.rooms[from]
		local toRoom = map.rooms[to]
		if parentInfo == nil then
			if not try then
				--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���޷����")
			end
			return false
		end
		local parent = parentInfo.parent
		local route = parentInfo.route
		local parentRoom = map.rooms[parent]
		local precmds = parentRoom.precmds
		local precmd = precmds and precmds[route]
		local postcmds = parentRoom.postcmds
		local postcmd = postcmds and postcmds[route]
		local blocks = parentRoom.blocks
		local block = blocks and blocks[route]
		if postcmd then
			table.insert(path,1,";")
			table.insert(path,1,postcmd)
		end
		table.insert(path,1,";")
		table.insert(path,1,route)
		if precmd then
			table.insert(path,1,";")
			table.insert(path,1,precmd)
		end
		if block then
			for _, b in pairs(block) do
				--local sameParty = b.party and b.party == getParty()
				--local cond = b.cond and b.cond()
				--if not sameParty and not cond then
					--if hp.exp < b.exp then
					if hp.exp + 1000000 < b.exp then
						if not try then
							--Note("�ӣ�" .. fromRoom .. " ����" .. toRoom .. "���У�" .. b.id .. "����·��")
						end
						return false
					else
						table.insert(path,1,";")
						table.insert(path,1,"#wipe " .. b.id)
					end
				--end
			end
		end
		room = parent
	until room == from
	table.insert(path,1,";")
	table.insert(path,1,"halt")
	--table.insert(path,1,";")
	--table.insert(path,1,"set brief")
	local p = table.concat(path)
	return p, length
end

-- Init Rooms
map = SjMap:new()

function Room(room)
	local r = SjRoom:new(room)
	local group = string.find(r.id, "group/")
	if group == 1 then
		r.nolook = true
	end
	map:addRoom(r)
end

Room {
	id = "baituo/btshan",
	name = "����ɽ",
	ways = {
		["westup"] = "baituo/shanmen",
		["east"] = "hj/gebin",
	},
}
Room {
	id = "baituo/chucang",
	name = "������",
	ways = {
		["east"] = "baituo/kongdi",
	},
}
Room {
	id = "baituo/fengxi",
	name = "��϶",
	ways = {
		["north"] = "baituo/fengxi1",
		["out"] = "baituo/yuanzi2",
	},
}
Room {
	id = "baituo/fengxi1",
	name = "��϶",
	ways = {
		["south"] = "baituo/fengxi",
		["west"] = "baituo/fengxi2",
		["out"] = "baituo/yuanzi3",
	},
}
Room {
	id = "baituo/fengxi2",
	name = "��϶",
	ways = {
		["east"] = "baituo/fengxi1",
		["out"] = "baituo/yuanzi4",
	},
}
Room {
	id = "baituo/kongdi",
	name = "�յ�",
	ways = {
		["northup"] = "baituo/tangwu",
		["southdown"] = "baituo/shanmen",
		["west"] = "baituo/chucang",
	},
}
Room {
	id = "baituo/midao",
	name = "�ص�",
	ways = {
		["west"] = "baituo/midao1",
	},
}
Room {
	id = "baituo/midao1",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao2",
		["east"] = "baituo/midao",
	},
}
Room {
	id = "baituo/midao2",
	name = "�ص�",
	ways = {
		["eastdown"] = "baituo/midao5",
		["westdown"] = "baituo/midao3",
		["eastup"] = "baituo/midao1",
	},
}
Room {
	id = "baituo/midao3",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao3",
		["eastup"] = "baituo/midao3",
		["south"] = "baituo/midao4",
		["north"] = "baituo/midao4",
	},
}
Room {
	id = "baituo/midao4",
	name = "�ص�",
	ways = {
		["westdown"] = "baituo/midao4",
		["eastup"] = "baituo/midao4",
		["south"] = "baituo/midao3",
		["north"] = "baituo/midao3",
	},
}
Room {
	id = "baituo/midao5",
	name = "�ص�",
	ways = {
		["eastdown"] = "baituo/midao6",
		["westup"] = "baituo/midao2",
	},
}
Room {
	id = "baituo/midao6",
	name = "�ص�",
	ways = {
		["westup"] = "baituo/midao5",
		["south"] = "baituo/midao8",
		["north"] = "baituo/midao8",
		["east"] = "baituo/midao7",
		["west"] = "baituo/midao6",
	},
}
Room {
	id = "baituo/midao7",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midaoout",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao7",
		["west"] = "baituo/midao6",
	},
}
Room {
	id = "baituo/midao8",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midao8",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao6",
		["west"] = "baituo/midao7",
	},
}
Room {
	id = "baituo/midaoout",
	name = "�ص�",
	ways = {
		["south"] = "baituo/midaoout",
		["east"] = "baituo/midao8",
		["north"] = "baituo/midao7",
		["west"] = "baituo/midaoout",
	},
}
Room {
	id = "baituo/shanmen",
	name = "����ɽׯɽ��",
	ways = {
		["northup"] = "baituo/kongdi",
		["eastdown"] = "baituo/btshan",
	},
}
Room {
	id = "baituo/shetan",
	name = "��̶",
}
Room {
	id = "baituo/shuifang",
	name = "˯��",
	no_fight = true,
	ways = {
		["west"] = "baituo/tangwu",
	},
}
Room {
	id = "baituo/tangwu",
	name = "����",
	ways = {
		["north"] = "baituo/tuitang",
		["southdown"] = "baituo/kongdi",
		["west"] = "baituo/yaofang",
	},
}
Room {
	id = "baituo/tianjing",
	name = "�쾮",
	ways = {
		["out"] = "baituo/midao4",
	},
}
Room {
	id = "baituo/tuitang",
	name = "����",
	ways = {
		["south"] = "baituo/tangwu",
		["north"] = "baituo/yuanzi",
		["east"] = "baituo/shuifang",
	},
}
Room {
	id = "baituo/yaofang",
	name = "ҩ��",
	ways = {
		["east"] = "baituo/tangwu",
	},
}
Room {
	id = "baituo/yuanzi",
	name = "��԰",
	ways = {
		["south"] = "baituo/tuitang",
	},
}
Room {
	id = "baituo/yuanzi1",
	name = "Ժ��",
	ways = {
		["northwest"] = "baituo/yuanzi2",
		["jumpdown"] = "baituo/shetan",
	},
}
Room {
	id = "baituo/yuanzi2",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi1",
		["northwest"] = "baituo/yuanzi4",
		["northeast"] = "baituo/yuanzi3",
	},
}
Room {
	id = "baituo/yuanzi3",
	name = "Ժ��",
	ways = {
		["southwest"] = "baituo/yuanzi2",
		["northwest"] = "baituo/yuanzi5",
		["west"] = "baituo/yuanzi4",
	},
}
Room {
	id = "baituo/yuanzi4",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi2",
		["east"] = "baituo/yuanzi3",
		["northeast"] = "baituo/yuanzi5",
	},
}
Room {
	id = "baituo/yuanzi5",
	name = "Ժ��",
	ways = {
		["southeast"] = "baituo/yuanzi3",
		["southwest"] = "baituo/yuanzi4",
	},
}
Room {
	id = "beijing/jiuguan1",
	name = "С�ƹ�",
}
Room {
	id = "beijing/road1",
	name = "������",
	ways = {
		["south"] = "beijing/jiuguan1",
	},
}
Room {
	id = "cangzhou/bank",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "cangzhou/beijie1",
	},
	objs = {
          ["������"] = "jiang tiaohou",
           },
	room_relative="����----������������",
}
Room {
	id = "cangzhou/beijie1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/beijie2",
		["north"] = "cangzhou/beimen",
		["east"] = "cangzhou/bank",
		["west"] = "cangzhou/mihang",
	},
	room_relative="���ţ�����-----����-----����������ֱ���",
}
Room {
	id = "cangzhou/beijie2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/beijie3",
		["east"] = "cangzhou/gongdi",
		["north"] = "cangzhou/beijie1",
		["west"] = "cangzhou/fuya",
	},
	room_relative="���֣����ݸ���-----����-----���أ����ֱ���",
}
Room {
	id = "cangzhou/beijie3",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/dongjie1",
		["southwest"] = "cangzhou/xijie1",
		["south"] = "cangzhou/kezhan",
		["east"] = "cangzhou/feiyuan",
		["north"] = "cangzhou/beijie2",
		["west"] = "cangzhou/mingju",
	},
room_relative="���֣����-----����-----��԰�L���K���ִ��ջ���ֱ���",
}
Room {
	id = "cangzhou/beimen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/beijie1",
		["north"] = "cangzhou/dyd1",
	},
	room_relative="����������ţ����ֱ���",
}
Room {
	id = "cangzhou/dyd1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/beimen",
		["north"] = "cangzhou/dyd2",
	},
	room_relative="�����������������Ŵ����",
}
Room {
	id = "cangzhou/dyd2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "cangzhou/dyd3",
		["south"] = "cangzhou/dyd1",
	},
	room_relative="������I�����������������",
}
Room {
	id = "cangzhou/dyd3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/dyd2",
	},
room_relative="������K����������",
}
Room {
	id = "cangzhou/changku",
	name = "�ֿ�",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "cangzhou/mihang",
	},
	room_relative="���У��ֿ�ֿ�",
}
Room {
	id = "cangzhou/dangpu",
	name = "���ݵ���",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "cangzhou/xijie1",
	},
	objs = {
          ["���ϰ�"] = "huang laoban",
           },
	room_relative="���֣����ݵ��̲��ݵ���",
}
Room {
	id = "cangzhou/dongjie1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "cangzhou/nanjie1",
		["northwest"] = "cangzhou/beijie3",
		["east"] = "cangzhou/dongmen",
	},
room_relative="���֨I����-----���ŨL�Ͻֶ���",
}
Room {
	id = "cangzhou/dongmen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/eroad1",
		["west"] = "cangzhou/dongjie1",
	},
	room_relative="����-----����-----���������",
}
Room {
	id = "cangzhou/eroad1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/eroad2",
		["west"] = "cangzhou/dongmen",
	},
	room_relative="����----�����----����������",
}
Room {
	id = "cangzhou/eroad2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "group/entry/czeroad3",
		["west"] = "cangzhou/eroad1",
	},
	room_relative="������J�����----����������",
}
Room {
	id = "cangzhou/eroad4",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "group/entry/czeroad3",
		["northeast"] = "tanggu/wroad4",
	},
	objs = {
          ["�������"] = "jiangbei dadao",
    },
	room_relative="������J������L����������",
}
Room {
	id = "cangzhou/feiyuan",
	name = "��԰",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "cangzhou/tingtang",
		["west"] = "cangzhou/beijie3",
	},
	objs = {
          ["������"] = "fang duozhu",
          ["����"] = "jian zhanglao",
           },
	room_relative="���áı���-----��԰��԰",
}
Room {
	id = "cangzhou/fuya",
	name = "���ݸ���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/beijie2",
		["west"] = "cangzhou/zhenting",
	},
	blocks = {
		["west"] = {
			{id = "ya yi", exp = 17500},
		},
        	precmds = {
              ["west"] = "kill ya yi",
	},
	},
}
Room {
	id = "cangzhou/gongdi",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "cangzhou/beijie2",
	},
	room_relative="����-----���ع���",
}
Room {
	id = "cangzhou/huadian",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "cangzhou/nanjie1",
	},
	room_relative="�Ͻ�-----���껨��",
}
Room {
	id = "cangzhou/kezhan",
	name = "���ջ",
	ways = {
		["south"] = "cangzhou/nanjie1",
		["north"] = "cangzhou/beijie3",
		-- ["up"] = "cangzhou/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	objs = {
          ["������"] = "miao ruolan",
           },
}
Room {
	id = "cangzhou/kezhan2",
	name = "��ջ��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["enter"] = "cangzhou/sleeproom",
		["down"] = "cangzhou/kezhan",
	},
}
Room {
	id = "cangzhou/mihang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/changku",
		["east"] = "cangzhou/beijie1",
	},
	objs = {
          ["������"] = "wang dami",
           },
	room_relative="����-----���֣��ֿ�����",
}
Room {
	id = "cangzhou/mingju",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/beijie3",
	},
	room_relative="���-----�������",
}
Room {
	id = "cangzhou/nanjie1",
	name = "�Ͻ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/nanmen",
		["northwest"] = "cangzhou/xijie1",
		["north"] = "cangzhou/kezhan",
		["east"] = "cangzhou/huadian",
		["northeast"] = "cangzhou/dongjie1",
		["west"] = "cangzhou/xiyuanzi",
	},
room_relative="���ִ��ջ���֨I���JϷ԰-----�Ͻ�-----����������Ͻ�",
}
Room {
	id = "cangzhou/nanmen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/sroad1",
		["north"] = "cangzhou/nanjie1",
	},
	room_relative="�Ͻ֣����ţ��ٵ�����",
}
Room {
	id = "cangzhou/sancakou",
	name = "����·",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/wroad4",
		["west"] = "hmy/pingding/road9",
	},
room_relative="��·----����·�K�������·",
}
Room {
	id = "cangzhou/sleeproom",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "cangzhou/kezhan2",
	},
}
Room {
	id = "cangzhou/sroad1",
	name = "�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/sroad2",
		["north"] = "cangzhou/nanmen",
	},
	room_relative="���ţ��ٵ����ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad2",
	name = "�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/sroad3",
		["north"] = "cangzhou/sroad1",
	},
	room_relative="�ٵ����ٵ��K�ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad3",
	name = "�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/sroad4",
		["northwest"] = "cangzhou/sroad2",
	},
	room_relative="�ٵ��I�ٵ��K�ٵ��ٵ�",
}
Room {
	id = "cangzhou/sroad4",
	name = "�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "huanghe/road3",
		["northwest"] = "cangzhou/sroad3",
	},
	room_relative="�ٵ��I�ٵ�����ɿڹٵ�",
}
Room {
	id = "cangzhou/tingtang",
	name = "����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "cangzhou/feiyuan",
	},
	room_relative="���áŷ�԰����",
}
Room {
	id = "cangzhou/wroad1",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/ximen",
		["west"] = "group/entry/czwroad2",
	},
room_relative="���-----���-----�������",
}
Room {
	id = "cangzhou/wroad3",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "group/entry/czwroad2",
		["west"] = "cangzhou/wroad4",
	},
 room_relative="����J���-----������",
}
Room {
	id = "cangzhou/wroad4",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "cangzhou/sancakou",
		["east"] = "cangzhou/wroad3",
	},
	room_relative="����·�I���-----������",
}
Room {
	id = "cangzhou/xijie1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "cangzhou/nanjie1",
		["south"] = "cangzhou/dangpu",
		["north"] = "cangzhou/yizhan",
		["northeast"] = "cangzhou/beijie3",
		["west"] = "cangzhou/ximen",
	},
room_relative="��վ���֣��J����-----���֣��K���ݵ����Ͻ�����",
}
Room {
	id = "cangzhou/ximen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/xijie1",
		["west"] = "cangzhou/wroad1",
	},
	room_relative="���-----����-----��������",
}
Room {
	id = "cangzhou/xiyuanzi",
	name = "Ϸ԰",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/nanjie1",
	},
	room_relative="�Ͻ֣�Ϸ԰",
}
Room {
	id = "cangzhou/yizhan",
	name = "��վ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "cangzhou/xijie1", 
	},
	room_relative="��վ��������վ",
}
Room {
	id = "cangzhou/zhenting",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "cangzhou/fuya",
	},
	room_relative="���ݸ��ã���������",
}
Room {
	id = "changan/baishulin1",
	name = "������",
	outdoor = "������",
	ways = {
		["southeast"] = "changan/baishulin1",
		["southwest"] = "changan/baishulin1",
		["north"] = "changan/baishulin1",
		["east"] = "changan/baishulin1",
		["west"] = "changan/baishulin1",
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = "changan/xiaoyanta1",
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/beilin",
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = "changan/yongkeng2",
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = "changan/changjie2",
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = "changan/baishulin2",
	},
	nolooks = {
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = true,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = true,
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = true,
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = true,
	},
	lengths = {
		["n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n;n"] = 30,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = 30,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = 30,
		["sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw;sw"] = 30,
		["se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se;se"] = 30,
	},
}
Room {
	id = "changan/baishulin2",
	name = "������",
	outdoor = "������",
	ways = {
		["northwest"] = "changan/baishulin2",
		["east"] = "changan/baishulin2",
		["northeast"] = "changan/baishulin2",
		["west"] = "changan/baishulin2",
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = "changan/baishulin1",
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = "changan/shihuangling",
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = "changan/wenquan",
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/jiashan",
	},
	nolooks = {
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = true,
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = true,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = true,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
	},
	lengths = {
		["nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw;nw"] = 30,
		["ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne;ne"] = 30,
		["e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e;e"] = 30,
		["w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w;w"] = 30,
	},
}
Room {
	id = "changan/beilin",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "changan/baishulin1",
	},
	room_relative="�����֣�����",
}
Room {
	id = "changan/biaoju",
	name = "�����ھ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/biaoju2",
		["north"] = "changan/westjie3",
	},
	room_relative="����֣������ھ֣��ھִ��������ھ�",
}
Room {
	id = "changan/biaoju2",
	name = "�ھִ���",
	outdoor = "������",
	ways = {
		["north"] = "changan/biaoju",
	},
	objs = {
          ["�ܻ���"] = "zhou huwei",
     },
	 room_relative="�����ھ֣��ھִ����ھִ���",
}
Room {
	id = "changan/bingqipu",
	name = "������",
	outdoor = "������",
	ways = {
		["west"] = "changan/southjie2",
	},
	room_relative="�ϴ��----�����̱�����",
}
Room {
	id = "changan/bingying",
	name = "��Ӫ����",
	outdoor = "������",
	ways = {
		["south"] = "changan/bingying2",
		["north"] = "changan/eastjie4",
	},
	blocks = {
		["south"] = {
			{id = "guan bing", exp = 10000},
		},
          	precmds = {
              ["south"] = "kill guan bing",
	},
	},
	
}
Room {
	id = "changan/bingying2",
	name = "��Ӫ",
	outdoor = "������",
	ways = {
		["north"] = "changan/bingying",
	},
	room_relative="��Ӫ����Ӫ����",
}
Room {
	id = "changan/chaguan",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjie2",
	},
	room_relative="��ݣ�����ֲ��",
}
Room {
	id = "changan/changjie1",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "changan/changjie1",
		["west"] = "changan/changjie1",
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = "changan/jiashan",
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = "changan/dayanta1",
	},
	nolooks = {
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = true,
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = true,
	},
	lengths = {
		["w;w;w;w;w;w;w;w;w;w;w;w;w"] = 12,
		["e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se;e;se"] = 24,
	},
}
Room {
	id = "changan/changjie2",
	name = "����",
	outdoor = "������",
	ways = {
		["southeast"] = "changan/ciensi",
		["east"] = "changan/baishulin2",
		["northeast"] = "changan/baishulin1",
		["west"] = "changan/changjie1",
	},
	room_relative="�����֣�������--���֣��ȶ��³���",
}
Room {
	id = "changan/chm",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "changan/westjie4",
	},
	room_relative="�����--������",
}
Room {
	id = "changan/ciensi",
	name = "�ȶ���",
	outdoor = "������",
	ways = {
		["northwest"] = "changan/changjie2",
		["east"] = "changan/dayanta1",
	},
	room_relative="���֣��������ȶ���",
}
Room {
	id = "changan/dadian",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/qingzhensi",
		["north"] = "changan/houdian",
	},
	room_relative="�������������´��",
}
Room {
	id = "changan/dangpu",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "changan/southjie1",
	},
	room_relative="�ϴ��-----���̵���",
}
Room {
	id = "changan/dayanta1",
	name = "������",
	outdoor = "������",
	ways = {
		["west"] = "changan/ciensi",
		["up"] = "changan/dayanta2",
	},
	room_relative="������������������ȶ���",
}
Room {
	id = "changan/dayanta2",
	name = "����������",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta1",
		["up"] = "changan/dayanta3",
	},
}
Room {
	id = "changan/dayanta3",
	name = "����������",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta2",
		["up"] = "changan/dayanta4",
	},
}
Room {
	id = "changan/dayanta4",
	name = "�������Ĳ�",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta3",
		["up"] = "changan/dayanta5",
	},
}
Room {
	id = "changan/dayanta5",
	name = "���������",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta4",
		["up"] = "changan/dayanta6",
	},
}
Room {
	id = "changan/dayanta6",
	name = "����������",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta5",
		["up"] = "changan/dayanta7",
	},
}
Room {
	id = "changan/dayanta7",
	name = "�������߲�",
	outdoor = "������",
	ways = {
		["down"] = "changan/dayanta6",
	},
}
Room {
	id = "changan/dewentang",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "changan/southjie2",
	},
	objs = {
          ["���ĵ�"] = "tang wende",
     },
	 room_relative="������----�ϴ�ֵ�����",
}
Room {
	id = "changan/duchang",
	name = "�ĳ�",
	outdoor = "������",
	ways = {
		["north"] = "changan/eastjie1",
	},
	room_relative="����֣��ĳ��ĳ�",
}
Room {
	id = "changan/eastchl",
	name = "���ų�¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjl2",
		["down"] = "changan/eastmen",
		["north"] = "changan/eastjl1",
	},
	room_relative="��¥�����ų�¥����¥���ų�¥",
}
Room {
	id = "changan/eastchq1",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastchq2",
		["north"] = "changan/lwtne",
	},
	room_relative="����̨������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/eastchq2",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjl1",
		["north"] = "changan/eastchq1",
	},
	room_relative="����ǽ������ǽ����¥����ǽ",
}
Room {
	id = "changan/eastchq3",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastchq4",
		["north"] = "changan/eastjl2",
	},
	room_relative="��¥������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/eastchq4",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/lwtse",
		["north"] = "changan/eastchq3",
	},
	room_relative="����ǽ������ǽ������̨����ǽ",
}
Room {
	id = "changan/eastjie1",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/duchang",
		["north"] = "changan/wanhonglou",
		["east"] = "changan/eastjie2",
		["west"] = "changan/zhonglou",
	},
	room_relative="���¥����¥----�����----����֣��ĳ������",
}
Room {
	id = "changan/eastjie2",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/qingchi",
		["east"] = "changan/eastjie3",
		["north"] = "changan/chaguan",
		["west"] = "changan/eastjie1",
	},
	room_relative="��ݣ������----�����----����֣���ض����",
}
Room {
	id = "changan/eastjie3",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/huadian",
		["north"] = "changan/shuiguodian",
		["east"] = "changan/eastjie4",
		["west"] = "changan/eastjie2",
	},
	room_relative="ˮ����������----�����----����֣����궫���",
}
Room {
	id = "changan/eastjie4",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/bingying",
		["north"] = "changan/neijie7",
		["east"] = "changan/eastmen",
		["west"] = "changan/eastjie3",
	},
	room_relative="�ڽ֣������----�����----�����ţ���Ӫ���Ŷ����",
}
Room {
	id = "changan/eastjl1",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastchl",
		["north"] = "changan/eastchq2",
	},
	room_relative="����ǽ����¥�����ų�¥��¥",
}
Room {
	id = "changan/eastjl2",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastchq3",
		["north"] = "changan/eastchl",
	},
	room_relative="���ų�¥����¥������ǽ��¥",
}
Room {
	id = "changan/eastmen",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "changan/eastroad1",
		["west"] = "changan/eastjie4",
		["up"] = "changan/eastchl",
	},
	blocks = {
		["up"] = {
			{id = "guan bing", exp = 10000},
			{id = "wu jiang", exp = 75000},
		},
          precmds = {
              ["up"] = "kill guan bing;kill wu jiang",
	},
	},
	
}
Room {
	id = "changan/eastroad1",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["east"] = "changan/eastroad2",
		["west"] = "changan/eastmen",
	},
	room_relative="������-----�ٵ�-----�ٵ��ٵ�",
}

Room {
	id = "changan/eastroad2",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["east"] = "group/entry/caeroad3",
		["west"] = "changan/eastroad1",
	},
	room_relative="�ٵ�-----�ٵ�-----��·�ٵ�",
}
Room {
	id = "changan/fengchi",
	name = "���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "changan/qingchi",
	},
	room_relative="��أ����",
}
Room {
	id = "changan/gulou",
	name = "��¥",
	outdoor = "������",
	ways = {
		["southeast"] = "changan/zhonglou",
		["south"] = "changan/westjie1",
	},
	room_relative="��¥���K�������¥��¥",
}
Room {
	id = "changan/heishi",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "changan/shiji",
	},
	room_relative="����-----�м�����",
}
Room {
	id = "changan/houdian",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/dadian",
	},
	room_relative="���������",
}
Room {
	id = "changan/huadian",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "changan/eastjie3",
	},
	room_relative="����֣����껨��",
}
Room {
	id = "changan/jiangjunfu",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "changan/jjfzht",
		["north"] = "changan/westjie2",
		["west"] = "changan/jjfxf",
	},
	room_relative="����֣��᷿----������������������",
}
Room {
	id = "changan/jiashan",
	name = "��ɽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/jinghu",
	},
	room_relative="��ɽ-----������ɽ",
}
Room {
	id = "changan/jinghu",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "changan/southjie3",
		["west"] = "changan/jiashan",
	},
	room_relative="��ɽ-----����-----�ϴ�־���",
}
Room {
	id = "changan/jiuguan",
	name = "�ƹ�",
	outdoor = "������",
	ways = {
		["north"] = "changan/neijie1",
	},
	room_relative="�ڽ֣��ƹݾƹ�",
}
Room {
	id = "changan/jjfhhy",
	name = "��԰",
	outdoor = "������",
	ways = {
		["north"] = "changan/jjfhm",
		["west"] = "changan/jjflt",
	},
	room_relative="���ţ���ͤ��԰",
}
Room {
	id = "changan/jjfhm",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "changan/jjfhhy",
		["north"] = "changan/jjfzht",
	},
	room_relative="���ţ�������԰",
}
Room {
	id = "changan/jjflt",
	name = "��ͤ",
	outdoor = "������",
	ways = {
		["east"] = "changan/jjfhhy",
	},
	room_relative="��ͤ--��԰",
}
Room {
	id = "changan/jjfws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "changan/jjfzht",
	},
	room_relative="����--����",
}
Room {
	id = "changan/jjfxf",
	name = "�᷿",
	outdoor = "������",
	ways = {
		["east"] = "changan/jiangjunfu",
	},
	room_relative="�᷿-----�������᷿",
}
Room {
	id = "changan/jjfyt",
	name = "����",
	outdoor = "������",
	ways = {
		["west"] = "changan/jjfzht",
	},
	room_relative="����--����",
}
Room {
	id = "changan/jjfzht",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "changan/jjfhm",
		["east"] = "changan/jjfyt",
		["north"] = "changan/jiangjunfu",
		["west"] = "changan/jjfws",
	},
	blocks = {
		["west"] = {
			{id = "guan jia", exp = 10000},
		},
		["south"] = {
			{id = "guan jia", exp = 10000},
		},
		["east"] = {
			{id = "guan jia", exp = 10000},
		},
         precmds = {
              ["west"] = "kill guan jia",
			  ["south"] = "kill guan jia",
			  ["east"] = "kill guan jia",
	},
	},
}
Room {
	id = "changan/juhao",
	name = "�ۺ���¥",
	outdoor = "������",
	ways = {
		["west"] = "changan/northjie1",
		["up"] = "changan/juhao2",
	},
	room_relative="��¥��¥�������---�ۺ���¥�ۺ���¥",
}
Room {
	id = "changan/juhao2",
	name = "��¥��¥",
	outdoor = "������",
	no_fight = true,
	ways = {
		["down"] = "changan/juhao",
	},
	room_relative="��¥��¥���ۺ���¥��¥��¥",
}
Room {
	id = "changan/kezhan",
	name = "�ۺ���ջ",
	no_fight = true,
	ways = {
		["#jhkzout"] = "changan/northjie1",
		["#jhkz"] = "changan/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	lengths ={
	    ["#jhkz"] = 5,
	},
	room_relative="���ȡ��ۺ���ջ---����־ۺ���ջ",
}
Room {
	id = "changan/kezhan2",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "changan/kezhan3",
		["down"] = "changan/kezhan",
	},
}
Room {
	id = "changan/kezhan3",
	name = "�ͷ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "changan/kezhan2",
	},
}
Room {
	id = "changan/lijia",
	name = "��Ҵ�Ժ",
	outdoor = "������",
	ways = {
		["east"] = "changan/neijie7",
		["north"] = "changan/ljzhangfang",
		["west"] = "changan/ljzt",
	},
	room_relative="�ʷ�������---��Ҵ�Ժ---�ڽ���Ҵ�Ժ",
}
Room {
	id = "changan/ljwoshi",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "changan/ljzt",
	},
	room_relative="����-----��������",
}
Room {
	id = "changan/ljyanting",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "changan/ljzt",
	},
	room_relative="��������������",
}
Room {
	id = "changan/ljzhangfang",
	name = "�ʷ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/lijia",
	},
	room_relative="�ʷ�����Ҵ�Ժ�ʷ�",
}
Room {
	id = "changan/ljzt",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "changan/ljyanting",
		["east"] = "changan/lijia",
		["west"] = "changan/ljwoshi",
	},
	room_relative="����������-----����-----��Ҵ�Ժ����",
	objs = {
          ["��Ա��"] = "li yuanwai",
     },
}
Room {
	id = "changan/longchi",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "changan/qingchi",
	},
	room_relative="���--����",
}
Room {
	id = "changan/lwtne",
	name = "����̨",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastchq1",
		["west"] = "changan/northchq6",
	},
	
	blocks = {
		["south"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["west"] = {
			{id = "zhiqin bing", exp = 10000},
		},
         	 precmds = {
              ["west"] = "kill zhiqin bing",
			  ["south"] = "kill zhiqin bing",
			  },
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtnw",
	name = "����̨",
	outdoor = "������",
	ways = {
		["south"] = "changan/westchq1",
		["east"] = "changan/northchq1",
	},
	
	blocks = {
		["south"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["east"] = {
			{id = "zhiqin bing", exp = 10000},
		},
          	precmds = {
              ["east"] = "kill zhiqin bing",
			  ["south"] = "kill zhiqin bing",
	},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtse",
	name = "����̨",
	outdoor = "������",
	ways = {
		["north"] = "changan/eastchq4",
		["west"] = "changan/southchq6",
	},
	
	blocks = {
		["north"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["west"] = {
			{id = "zhiqin bing", exp = 10000},
        	},
		precmds = {
              ["north"] = "kill zhiqin bing",
			  ["west"] = "kill zhiqin bing",
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/lwtsw",
	name = "����̨",
	outdoor = "������",
	ways = {
		["north"] = "changan/westchq4",
		["east"] = "changan/southchq1",
	},
	
	blocks = {
		["north"] = {
			{id = "zhiqin bing", exp = 10000},
		},
		["east"] = {
			{id = "zhiqin bing", exp = 10000},
		},
	},
	objs = {
          ["ֵ�ڱ�"] = "zhiqin bing",
     },
}
Room {
	id = "changan/minju1",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/shiji",
	},
	room_relative="��ӣ��м����",
}
Room {
	id = "changan/minju2",
	name = "���",
	outdoor = "������",
	ways = {
		["north"] = "changan/shiji",
	},
	objs = {
          ["������"] = "da laoshu",
     },
	 room_relative="�м���������",
}
Room {
	id = "changan/minju3",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie1",
	},
	room_relative="��ӣ��ڽ����",
}
Room {
	id = "changan/minju4",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie2",
	},
	room_relative="��ӣ��ڽ����",
}
Room {
	id = "changan/minju5",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie3",
	},
	room_relative="��ӣ��ڽ����",
}
Room {
	id = "changan/minju6",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie4",
	},
	room_relative="��ӣ��ڽ����",
}
Room {
	id = "changan/minju7",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie5",
	},
	room_relative="��ӣ��ڽ����",
}
Room {
	id = "changan/neijie1",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/jiuguan",
		["east"] = "changan/northjie3",
		["north"] = "changan/minju3",
		["west"] = "changan/shiji",
	},
	room_relative="��ӣ��м�-----�ڽ�-----����֣��ƹ��ڽ�",
}
Room {
	id = "changan/neijie2",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/xiyuan",
		["east"] = "changan/neijie3",
		["north"] = "changan/minju4",
		["west"] = "changan/northjie3",
	},
	room_relative="��ӣ������-----�ڽ�-----�ڽ֣�ϷԺ�ڽ�",
}
Room {
	id = "changan/neijie3",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/tupiaoguan",
		["east"] = "changan/neijie4",
		["north"] = "changan/minju5",
		["west"] = "changan/neijie2",
	},
	room_relative="��ӣ��ڽ�-----�ڽ�-----�ڽ֣����ι��ڽ�",
	objs = {
          ["��С��"] = "he xiaowu",
          ["��С��"] = "lian xiaosan",
          ["��С��"] = "dong xiaoer",
     },
}
Room {
	id = "changan/neijie4",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/zahuopu",
		["east"] = "changan/neijie5",
		["north"] = "changan/minju6",
		["west"] = "changan/neijie3",
	},
	room_relative="��ӣ��ڽ�-----�ڽ�-----�ڽ֣��ӻ����ڽ�",
}
Room {
	id = "changan/neijie5",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie6",
		["north"] = "changan/minju7",
		["west"] = "changan/neijie4",
	},
	room_relative="��ӣ��ڽ�-----�ڽ֣��ڽ��ڽ�",
}
Room {
	id = "changan/neijie6",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/neijie7",
		["north"] = "changan/neijie5",
	},
	room_relative="�ڽ֣��ڽ֣��ڽ��ڽ�",
	objs = {
          ["�蹷"] = "feng gou",
     },
}
Room {
	id = "changan/neijie7",
	name = "�ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjie4",
		["north"] = "changan/neijie6",
		["west"] = "changan/lijia",
	},
	room_relative="�ڽ֣���Ҵ�Ժ-----�ڽ֣�������ڽ�",
}
Room {
	id = "changan/northchl",
	name = "���ų�¥",
	outdoor = "������",
	ways = {
		["down"] = "changan/northmen",
		["east"] = "changan/northjl2",
		["west"] = "changan/northjl1",
	},
	room_relative="��¥---���ų�¥---��¥����Զ�ű��ų�¥",
}
Room {
	id = "changan/northchq1",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchq2",
		["west"] = "changan/lwtnw",
	},
	room_relative="����̨----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq2",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchq3",
		["west"] = "changan/northchq1",
	},
	room_relative="����ǽ----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq3",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/northjl1",
		["west"] = "changan/northchq2",
	},
	room_relative="����ǽ----����ǽ----��¥����ǽ",
}
Room {
	id = "changan/northchq4",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchq5",
		["west"] = "changan/northjl2",
	},
	room_relative="��¥----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq5",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchq6",
		["west"] = "changan/northchq4",
	},
	room_relative="����ǽ----����ǽ----����ǽ����ǽ",
}
Room {
	id = "changan/northchq6",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/lwtne",
		["west"] = "changan/northchq5",
	},
	room_relative="����ǽ----����ǽ----����̨����ǽ",
}
Room {
	id = "changan/northjie1",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/zhonglou",
		["north"] = "changan/northjie2",
		["east"] = "changan/juhao",
		["west"] = "changan/kezhan",
	},
	room_relative="����֣��ۺ���ջ----�����----�ۺ���¥����¥�����",
}
Room {
	id = "changan/northjie2",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/northjie1",
		["east"] = "zhiye/zhibufang1",
		["north"] = "changan/northjie3",
		["west"] = "zhiye/caifengpu1",
	},
	room_relative="����֣��÷���----�����----֯����������ֱ����",
}
Room {
	id = "changan/northjie3",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/northjie2",
		["north"] = "changan/northmen",
		["east"] = "changan/neijie2",
		["west"] = "changan/neijie1",
	},
	room_relative="��Զ�ţ��ڽ�----�����----�ڽ֣�����ֱ����",
}
Room {
	id = "changan/northjl1",
	name = "��¥",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchl",
		["west"] = "changan/northchq3",
	},
	room_relative="����ǽ-----��¥-----���ų�¥��¥",
}
Room {
	id = "changan/northjl2",
	name = "��¥",
	outdoor = "������",
	ways = {
		["east"] = "changan/northchq4",
		["west"] = "changan/northchl",
	},
	room_relative="���ų�¥-----��¥-----����ǽ��¥",
}
Room {
	id = "changan/northmen",
	name = "��Զ��",
	outdoor = "������",
	ways = {
		["south"] = "changan/northjie3",
		["north"] = "changan/northroad1",
		["up"] = "changan/northchl",
	},
	blocks = {
		["up"] = {
			{id = "guan bing", exp = 10000},
			{id = "wu jiang", exp = 75000},
		},
         precmds = {
              ["up"] = "kill guan bing;kill wu jiang",
			  
	},
	},
	
}
Room {
	id = "changan/northroad1",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/northmen",
		["north"] = "changan/northroad2",
	},
	room_relative="�ٵ����ٵ�����Զ�Źٵ�",
}
Room {
	id = "changan/northroad10",
	name = "���",
	outdoor = "������",
	ways = {
		["northup"] = "hengshan/jinlongxia",
		["south"] = "changan/northroad9",
		["east"] = "hmy/pingding/road1",
	},
	room_relative="����Ͽ�����-----��·��������",
}
Room {
	id = "changan/northroad2",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/northroad1",
		["north"] = "changan/northroad3",
	},
	room_relative="������ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/northroad3",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/northroad2",
		["northeast"] = "changan/northroad4",
	},
	room_relative="��·�J������ٵ����",
}
Room {
	id = "changan/northroad4",
	name = "��·",
	outdoor = "������",
	ways = {
		["northup"] = "changan/northroad5",
		["southwest"] = "changan/northroad3",
		["south"] = "zhiye/nongtian0",
		["north"] = "zhiye/sanglin0",
	},
	room_relative="ɣ�������·�L�����ũ�����·",
}
Room {
	id = "changan/northroad5",
	name = "��·",
	outdoor = "������",
	ways = {
		["northeast"] = "group/entry/canroad6",
		["southdown"] = "changan/northroad4",
	},
	room_relative="��·�J��·����·��·",
}
Room {
	id = "changan/northroad7",
	name = "��·",
	outdoor = "������",
	ways = {
		["southup"] = "group/entry/canroad6",
		["northeast"] = "changan/northroad8",
	},
	room_relative="��·�J��·����·��·",
	objs = {
          ["��������"] = "changan keshang",
     },
}
Room {
	id = "changan/northroad8",
	name = "��·",
	outdoor = "������",
	ways = {
		["southwest"] = "changan/northroad7",
		["north"] = "changan/road2",
	},
	room_relative="�½��ɿڣ���·�L��·��·",
}
Room {
	id = "changan/northroad9",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "changan/road3",
		["north"] = "changan/northroad10",
	},
	room_relative="�����������½��ɿڴ��",
}
Room {
	id = "changan/qianzhuang",
	name = "����Ǯׯ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southjie1",
	},
	objs = {
          ["Ǯ�ۿ�"] = "qian yankai",
     },
	 room_relative="����Ǯׯ---�ϴ������Ǯׯ",
}
Room {
	id = "changan/qingchi",
	name = "���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["north"] = "changan/eastjie2",
		-- ["east"] = "changan/fengchi",
		-- ["west"] = "changan/longchi",
	},
	nolooks = {
		["east"] = true,
		["west"] = true,
	},
	
}
Room {
	id = "changan/qingzhensi",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "changan/westjie4",
		["north"] = "changan/dadian",
	},
	room_relative="���������£������������",
}
Room {
	 id = "changan/road2",
        name = "�½��ɿ�",
        ways = {
                ["southeast"] = "huanghe/huangtu",
                ["south"] = "changan/northroad8",
                ["#duHhe"] = "changan/road3",
        },
        lengths = {
                ["#duHhe"] = "if road.huanghe2 then return 10000 else return false end",
        },
        nolooks = {
                ["enter"] = true,
                ["#duHhe"] = true,
        },
		room_relative="�½��ɿڣ��K��·������ԭ�½��ɿ�",
}
Room {
	id = "changan/road3",
        name = "�½��ɿ�",
        ways = {
                ["north"] = "changan/northroad9",
                ["#duHhe"] = "changan/road2",
        },
        lengths = {
                ["#duHhe"] = "if road.huanghe2 then return 10000 else return false end",
        },
        nolooks = {
                ["enter"] = true,
                ["#duHhe"] = true,
        },
		room_relative="������½��ɿ��½��ɿ�",
}
Room {
	id = "changan/shihuangling",
	name = "ʼ����",
	outdoor = "������",
	ways = {
		["southwest"] = "changan/baishulin2",
		["east"] = "changan/yongkeng2",
		["north"] = "changan/yongkeng1",
		["west"] = "changan/baishulin1",
	},
}
Room {
	id = "changan/shiji",
	name = "�м�",
	outdoor = "������",
	ways = {
		["south"] = "changan/minju2",
		["east"] = "changan/neijie1",
		["north"] = "changan/minju1",
		["west"] = "changan/heishi",
	},
	room_relative="��ӣ�����-----�м�-----�ڽ֣�����м�",
}
Room {
	id = "changan/shuiguodian",
	name = "ˮ����",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjie3",
	},
	room_relative="ˮ����������ˮ����",
}
Room {
	id = "changan/southchl",
	name = "���ų�¥",
	outdoor = "������",
	ways = {
		["down"] = "changan/southmen",
		["east"] = "changan/southjl2",
		["west"] = "changan/southjl1",
	},
	room_relative="��¥---���ų�¥---��¥�����������ų�¥",
}
Room {
	id = "changan/southchq1",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchq2",
		["west"] = "changan/lwtsw",
	},
	room_relative="����̨----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq2",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchq3",
		["west"] = "changan/southchq1",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq3",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southjl1",
		["west"] = "changan/southchq2",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----��¥�ϳ�ǽ",
}
Room {
	id = "changan/southchq4",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchq5",
		["west"] = "changan/southjl2",
	},
	room_relative="��¥----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq5",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchq6",
		["west"] = "changan/southchq4",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----�ϳ�ǽ�ϳ�ǽ",
}
Room {
	id = "changan/southchq6",
	name = "�ϳ�ǽ",
	outdoor = "������",
	ways = {
		["east"] = "changan/lwtse",
		["west"] = "changan/southchq5",
	},
	room_relative="�ϳ�ǽ----�ϳ�ǽ----����̨�ϳ�ǽ",
}
Room {
	id = "changan/southjie1",
	name = "�ϴ��",
	outdoor = "������",
	ways = {
		["south"] = "changan/southjie2",
		["north"] = "changan/zhonglou",
		["east"] = "changan/dangpu",
		["west"] = "changan/qianzhuang",
	},
	room_relative="��¥������Ǯׯ----�ϴ��----���̣��ϴ���ϴ��",
}
Room {
	id = "changan/southjie2",
	name = "�ϴ��",
	outdoor = "������",
	ways = {
		["south"] = "changan/southjie3",
		["north"] = "changan/southjie1",
		["east"] = "changan/bingqipu",
		["west"] = "changan/dewentang",
	},
	room_relative="�ϴ�֣�������----�ϴ��----�����̣��ϴ���ϴ��",
}
Room {
	id = "changan/southjie3",
	name = "�ϴ��",
	outdoor = "������",
	ways = {
		["south"] = "changan/southmen",
		["north"] = "changan/southjie2",
		["east"] = "changan/changjie1",
		["west"] = "changan/jinghu",
	},
	room_relative="�ϴ�֣�����----�ϴ��----���֣��������ϴ��",
	lengths ={
	    ["east"] = "if job.name and job.name=='husong' then return 10 else return 1 end",
	},
}
Room {
	id = "changan/southjl1",
	name = "��¥",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchl",
		["west"] = "changan/southchq3",
	},
	room_relative="�ϳ�ǽ-----��¥-----���ų�¥��¥",
}
Room {
	id = "changan/southjl2",
	name = "��¥",
	outdoor = "������",
	ways = {
		["east"] = "changan/southchq4",
		["west"] = "changan/southchl",
	},
	room_relative="���ų�¥-----��¥-----�ϳ�ǽ��¥",
}
Room {
	id = "changan/southmen",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "changan/southroad1",
		["north"] = "changan/southjie3",
		["up"] = "changan/southchl",
	},
	blocks = {
		["up"] = {
			{id = "wu jiang", exp = 75000},
			{id = "guan bing", exp = 10000},
		},
        precmds = {
              ["up"] = "kill guan bing;kill wu jiang",
	},
	},
	
}
Room {
	id = "changan/southroad1",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/southroad2",
		["north"] = "changan/southmen",
	},
	room_relative="�����ţ��ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/southroad2",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["south"] = "changan/southroad3",
		["north"] = "changan/southroad1",
	},
	room_relative="�ٵ����ٵ����ٵ��ٵ�",
}
Room {
	id = "changan/southroad3",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lantian",
		["north"] = "changan/southroad2",
		["west"] = "xiangyang/caiyongmanor",
	},
	room_relative="�ٵ�������ׯ-----�ٵ�������ٵ�",
}
Room {
	id = "changan/tupiaoguan",
	name = "���ι�",
	outdoor = "������",
	ways = {
		["north"] = "changan/neijie3",
	},
	room_relative="�ڽ֣����ι����ι�",
}
Room {
	id = "changan/wanhonglou",
	name = "���¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/eastjie1",
	},
	objs = {
          ["ѩ�ɶ�"] = "xue xianer",
     },
	 room_relative="���¥����������¥",
}
Room {
	id = "changan/wenquan",
	name = "��Ȫ",
	outdoor = "������",
	ways = {
		["west"] = "changan/baishulin2",
	},
	room_relative="�����֣���Ȫ",
}
Room {
	id = "changan/westchl",
	name = "���ų�¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/westjl2",
		["down"] = "changan/westmen",
		["north"] = "changan/westjl1",
	},
	room_relative="��¥�����ų�¥����¥���ų�¥",
}
Room {
	id = "changan/westchq1",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/westchq2",
		["north"] = "changan/lwtnw",
	},
	room_relative="����̨������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/westchq2",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/westjl1",
		["north"] = "changan/westchq1",
	},
	room_relative="����ǽ������ǽ����¥����ǽ",
}
Room {
	id = "changan/westchq3",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/westchq4",
		["north"] = "changan/westjl2",
	},
	room_relative="��¥������ǽ������ǽ����ǽ",
}
Room {
	id = "changan/westchq4",
	name = "����ǽ",
	outdoor = "������",
	ways = {
		["south"] = "changan/lwtsw",
		["north"] = "changan/westchq3",
	},
	room_relative="����ǽ������ǽ������̨����ǽ",
}
Room {
	id = "changan/westjie1",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/zhubaohang",
		["east"] = "changan/zhonglou",
		["north"] = "changan/gulou",
		["west"] = "changan/westjie2",
	},
	room_relative="��¥�������----�����----��¥���鱦�������",
}
Room {
	id = "changan/westjie2",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/jiangjunfu",
		["north"] = "changan/yamen",
		["east"] = "changan/westjie1",
		["west"] = "changan/westjie3",
	},
	room_relative="���Ŵ��ţ������----�����----����֣������������",
}
Room {
	id = "changan/westjie3",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/biaoju",
		["north"] = "changan/yizhan",
		["east"] = "changan/westjie2",
		["west"] = "changan/westjie4",
	},
	room_relative="��վ�������----�����----����֣������ھ������",
}
Room {
	id = "changan/westjie4",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "changan/chm",
		["east"] = "changan/westjie3",
		["north"] = "changan/qingzhensi",
		["west"] = "changan/westmen",
	},
	room_relative="�����£�������----�����----����֣������������",
}
Room {
	id = "changan/westjl1",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/westchl",
		["north"] = "changan/westchq2",
	},
	room_relative="����ǽ����¥�����ų�¥��¥",
}
Room {
	id = "changan/westjl2",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/westchq3",
		["north"] = "changan/westchl",
	},
	room_relative="���ų�¥����¥������ǽ��¥",
}
Room {
	id = "changan/westmen",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "changan/westjie4",
		["west"] = "changan/westroad1",
		["up"] = "changan/westchl",
	},
	blocks = {
		["up"] = {
			{id = "wu jiang", exp = 75000},
			{id = "guan bing", exp = 10000},
		},
        	precmds = {
              ["up"] = "kill guan bing;kill wu jiang",
	},
	},
	
}
Room {
	id = "changan/westroad1",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["east"] = "changan/westmen",
		["west"] = "changan/westroad2",
	},
	room_relative="�ٵ�-----�ٵ�-----�����Źٵ�",
}
Room {
	id = "changan/westroad2",
	name = "�ٵ�",
	outdoor = "������",
	ways = {
		["northwest"] = "lanzhou/lpshan",
		["east"] = "changan/westroad1",
	},
	room_relative="����ɽ�I�ٵ�-----�ٵ��ٵ�",
}
Room {
	id = "changan/xiaoyanta1",
	name = "С����",
	outdoor = "������",
	ways = {
		["south"] = "changan/baishulin1",
		["up"] = "changan/xiaoyanta2",
	},
}
Room {
	id = "changan/xiaoyanta10",
	name = "С����ʮ��",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta9",
		["up"] = "changan/xiaoyanta11",
	},
}
Room {
	id = "changan/xiaoyanta11",
	name = "С����ʮһ��",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta10",
		["up"] = "changan/xiaoyanta12",
	},
}
Room {
	id = "changan/xiaoyanta12",
	name = "С����ʮ����",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta11",
		["up"] = "changan/xiaoyanta13",
	},
}
Room {
	id = "changan/xiaoyanta13",
	name = "С����ʮ����",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta12",
		["up"] = "changan/xiaoyanta14",
	},
}
Room {
	id = "changan/xiaoyanta14",
	name = "С����ʮ�Ĳ�",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta13",
		["up"] = "changan/xiaoyanta15",
	},
}
Room {
	id = "changan/xiaoyanta15",
	name = "С����ʮ���",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta14",
	},
}
Room {
	id = "changan/xiaoyanta2",
	name = "С��������",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta1",
		["up"] = "changan/xiaoyanta3",
	},
}
Room {
	id = "changan/xiaoyanta3",
	name = "С��������",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta2",
		["up"] = "changan/xiaoyanta4",
	},
}
Room {
	id = "changan/xiaoyanta4",
	name = "С�����Ĳ�",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta3",
		["up"] = "changan/xiaoyanta5",
	},
}
Room {
	id = "changan/xiaoyanta5",
	name = "С�������",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta4",
		["up"] = "changan/xiaoyanta6",
	},
}
Room {
	id = "changan/xiaoyanta6",
	name = "С��������",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta5",
		["up"] = "changan/xiaoyanta7",
	},
}
Room {
	id = "changan/xiaoyanta7",
	name = "С�����߲�",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta6",
		["up"] = "changan/xiaoyanta8",
	},
}
Room {
	id = "changan/xiaoyanta8",
	name = "С�����˲�",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta7",
		["up"] = "changan/xiaoyanta9",
	},
}
Room {
	id = "changan/xiaoyanta9",
	name = "С�����Ų�",
	outdoor = "������",
	ways = {
		["down"] = "changan/xiaoyanta8",
		["up"] = "changan/xiaoyanta10",
	},
}
Room {
	id = "changan/xiyuan",
	name = "ϷԺ",
	outdoor = "������",
	ways = {
		["north"] = "changan/neijie2",
	},
	room_relative="�ڽ֣�ϷԺϷԺ",
}
Room {
	id = "changan/yamen",
	name = "���Ŵ���",
	outdoor = "������",
	ways = {
		["south"] = "changan/westjie2",
		["north"] = "changan/yamen2",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 17500},
		},
    precmds = {
              ["north"] = "kill ya yi",
	},
	},
}
Room {
	id = "changan/yamen2",
	name = "��������",
	outdoor = "������",
	ways = {
		["south"] = "changan/yamen",
	},
	room_relative="��������--���Ŵ���",
}
Room {
	id = "changan/yizhan",
	name = "��վ",
	outdoor = "������",
	ways = {
		["south"] = "changan/westjie3",
	},
	room_relative="��վ���������վ",
}
Room {
	id = "changan/yongkeng1",
	name = "����ٸ��",
	outdoor = "������",
	ways = {
		["south"] = "changan/shihuangling",
	},
}
Room {
	id = "changan/yongkeng2",
	name = "����ٸ��",
	outdoor = "������",
	ways = {
		["west"] = "changan/shihuangling",
	},
}
Room {
	id = "changan/zahuopu",
	name = "�ӻ���",
	outdoor = "������",
	ways = {
		["north"] = "changan/neijie4",
	},
	objs = {
          ["����ʵ"] = "liu laoshi",
     },
	 room_relative="�ڽ֣��ӻ����ӻ���",
}
Room {
	id = "changan/zhonglou",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "changan/southjie1",
		["northwest"] = "changan/gulou",
		["north"] = "changan/northjie1",
		["east"] = "changan/eastjie1",
		["west"] = "changan/westjie1",
	},
	room_relative="��¥����֨I�������-----��¥-----����֣��ϴ����¥",
}
Room {
	id = "changan/zhubaohang",
	name = "�鱦��",
	outdoor = "������",
	ways = {
		["north"] = "changan/westjie1",
	},
	room_relative="����֣��鱦���鱦��",
}
Room {
	id = "changle/bajiao",
	name = "�˽�ͤ",
	outdoor = "���ְ�",
	ways = {
		["west"] = "changle/huayuan",
	},
	objs = {
          ["����"] = "ding dang",
           },
	room_relative="��԰----�˽�ͤ�˽�ͤ",
}
Room {
	id = "changle/chaifang",
	name = "��",
	outdoor = "���ְ�",
	ways = {
		["north"] = "changle/zoulang3",
	},
	room_relative="�����ȣ��񷿲�",
}
Room {
	id = "changle/chufang",
	name = "����",
	outdoor = "���ְ�",
	no_fight = true,
	ways = {
		["north"] = "changle/zoulang2",
	},
       precmds = {
              ["north"] = "drop cha;drop rice",
       },
	   objs = {
          ["���"] = "xiang cha",
          ["�׷�"] = "mi fan",
           },
	room_relative="�����ȣ���������",
}
Room {
	id = "changle/damen",
	name = "����",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/xiaolu",
		["enter"] = "changle/dating",
	},
	objs = {
          ["��ɽ��"] = "qiu shanfeng",  
	room_relative="�����Ĵ��ţ���ʯ·����",
	},
}
Room {
	id = "changle/dating",
	name = "����",
	outdoor = "���ְ�",
	ways = {
		["north"] = "changle/zoulang4",
		["out"] = "changle/damen",
	},
	room_relative="���ȣ������Ŵ��Ŵ���",
}
Room {
	id = "changle/huayuan",
	name = "��԰",
	outdoor = "���ְ�",
	ways = {
		["north"] = "changle/yongdao",
		["east"] = "changle/bajiao",
		["west"] = "changle/xiaoting",
	},
  room_relative="С������-----�˽�ͤ��԰",
}
Room {
	id = "changle/road1",
	name = "�����",
	outdoor = "���ְ�",
	ways = {
		["southeast"] = "changle/road2",
		["northwest"] = "city/eroad2",
		["northeast"] = "changle/road3",
	},
	room_relative="�����������I�J������K��ʯ·�����",
}
Room {
	id = "changle/road2",
	name = "��ʯ·",
	outdoor = "���ְ�",
	ways = {
		["northwest"] = "changle/road1",
		["east"] = "changle/xiaolu",
	},
room_relative="������I��ʯ·----��ʯ·��ʯ·",
}
Room {
	id = "changle/road3",
	name = "�����",
	outdoor = "���ְ�",
	ways = {
		["southwest"] = "changle/road1",
	},
	room_relative="������L����������",
}

Room {
	id = "changle/shishi",
	name = "ʯ��",
	outdoor = "���ְ�",
	ways = {
		["west"] = "changle/yongdao",
},
	objs = {
          ["չ��"] = "zhan fei",
	},
	room_relative="��-----ʯ��ʯ��",
}
Room {
	id = "changle/shuifang",
	name = "˯��",
	outdoor = "���ְ�",
	no_fight = true,
	ways = {
		["south"] = "changle/zoulang3",
	},
	room_relative="˯����������˯��",
}
Room {
	id = "changle/woshi",
	name = "����",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/xiaoting",
	},
	room_relative="���ң�С������",
}
Room {
	id = "changle/xiaolu",
	name = "��ʯ·",
	outdoor = "���ְ�",
	ways = {
		["north"] = "changle/damen",
		["west"] = "changle/road2",
	},
	room_relative="���ţ���ʯ·----��ʯ·��ʯ·",
}
Room {
	id = "changle/xiaoting",
	name = "С��",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/zoulang4",
		["north"] = "changle/woshi",
		["east"] = "changle/huayuan",
	},
	objs = {
          ["�׺�Ұ"] = "mi hengye",
          ["����ʯ"] = "bei haishi",
  room_relative="���ң�С��-----��԰������С��",
           },
}
Room {
	id = "changle/xiaowu",
	name = "С��",
	outdoor = "���ְ�",
	ways = {
		["north"] = "changle/zoulang1",
	},
	room_relative="�����ȣ�С��С��",
}
Room {
	id = "changle/yongdao",
	name = "��",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/huayuan",
		["east"] = "changle/shishi",
	},
	room_relative="��-----ʯ�ң���԰��",
}
Room {
	id = "changle/zoulang1",
	name = "������",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/xiaowu",
		["east"] = "changle/zoulang2",
		["west"] = "changle/zoulang4",
	},
	room_relative="����----������----�����ȣ�С�ݶ�����",
}
Room {
	id = "changle/zoulang2",
	name = "������",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/chufang",
		["west"] = "changle/zoulang1",
	},
	objs = {
          ["�³�֮"] = "chen chongzhi",
	room_relative="������----�����ȣ�����������",
           },
}
Room {
	id = "changle/zoulang3",
	name = "������",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/chaifang",
		["east"] = "changle/zoulang4",
		["north"] = "changle/shuifang",
	},
	room_relative="˯����������----���ȣ���������",
}
Room {
	id = "changle/zoulang4",
	name = "����",
	outdoor = "���ְ�",
	ways = {
		["south"] = "changle/dating",
		["north"] = "changle/xiaoting",
		["east"] = "changle/zoulang1",
		["west"] = "changle/zoulang3",
	},
	room_relative="С����������-----����-----�����ȣ���������",
}
Room {
	id = "chengdu/bank",
	name = "ī��ի",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/nandajie2",  
	},
	objs = {
          ["���ƹ�"] = "wang zhanggui",
           },
		room_relative="ī��ի----�ϴ��ī��ի",
}
Room {
	id = "chengdu/beidajie1",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/center",
		["north"] = "chengdu/beidajie2",
	},
	room_relative="����֣�����֣������ı����",
}
Room {
	id = "chengdu/beidajie2",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/beidajie1",
		["east"] = "zhiye/yaochang1",
		["north"] = "chengdu/beidajie3",
		["west"] = "zhiye/yaodian1",
	},
	room_relative="����֣�ҩ��----�����----��ҩ����������ֱ����",
}
Room {
	id = "chengdu/beidajie3",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/beidajie2",
		["north"] = "chengdu/beidajie4",
	},
	room_relative="����֣�����֣�����ֱ����",
}
Room {
	id = "chengdu/beidajie4",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/beidajie3",
		["north"] = "chengdu/dabeimen",
		["east"] = "chengdu/cgenlu1",
	},
	room_relative="���ţ������----�Ǹ�·������ֱ����",
}
Room {
	id = "chengdu/center",
	name = "������",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/nandajie1",
		["east"] = "chengdu/ddajie1",
		["north"] = "chengdu/beidajie1",
		["west"] = "chengdu/xidajie1",
	},
	room_relative="����֣������----������----����֣��ϴ�ֳ�����",
}
Room {
	id = "chengdu/cgenlu1",
	name = "�Ǹ�·",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/cgenlu2",
		["west"] = "chengdu/beidajie4",
	},
	room_relative="�����----�Ǹ�·----�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu2",
	name = "�Ǹ�·",
	outdoor = "�ɶ���",
	ways = {
		["southeast"] = "chengdu/cgenlu3",
		["west"] = "chengdu/cgenlu1",
	},
	room_relative="�Ǹ�·----�Ǹ�·�K�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu3",
	name = "�Ǹ�·",
	outdoor = "�ɶ���",
	ways = {
		["southeast"] = "chengdu/cgenlu4",
		["northwest"] = "chengdu/cgenlu2",
	},
	room_relative="�Ǹ�·�I�Ǹ�·�K�Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu4",
	name = "�Ǹ�·",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/cgenlu5",
		["northwest"] = "chengdu/cgenlu3",
	},
	room_relative="�Ǹ�·�I�Ǹ�·���Ǹ�·�Ǹ�·",
}
Room {
	id = "chengdu/cgenlu5",
	name = "�Ǹ�·",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/ddajie4",
		["north"] = "chengdu/cgenlu4",
	},
	room_relative="�Ǹ�·���Ǹ�·������ֳǸ�·",
}
Room {
	id = "chengdu/dabeimen",
	name = "����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/beidajie4",
		["north"] = "chengdu/road4",
	},
	room_relative="��������ţ�����ִ���",
}
Room {
	id = "chengdu/dadongmen",
	name = "����",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/eroad1",
		["west"] = "chengdu/ddajie4",
	},
	room_relative="�����----����----�������",
}
Room {
	id = "chengdu/dananmen",
	name = "������",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/sroad1",
		["north"] = "chengdu/nandajie2",
	},
	room_relative="�ϴ�֣������ţ������������",
}
Room {
	id = "chengdu/daximen",
	name = "������",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/xidajie2",
		["west"] = "chengdu/wroad1",
	},
	room_relative="���----������----����ִ�����",
}
Room {
	id = "chengdu/ddajie1",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["north"] = "group/cailiao-hang",
		["east"] = "chengdu/ddajie2",
		["west"] = "chengdu/center",
	},
	room_relative="�����У�������----�����----����ֶ����",
}
Room {
	id = "chengdu/ddajie2",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/zjmen",
		["east"] = "chengdu/ddajie3",
		["west"] = "chengdu/ddajie1",
	},
	room_relative="�����----�����----����֣��Ӿ����Ŷ����",
}
Room {
	id = "chengdu/ddajie3",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/nancejie1",
		["east"] = "chengdu/ddajie4",
		["west"] = "chengdu/ddajie2",
	},
	room_relative="�����----�����----����֣��ϲ�ֶ����",
}
Room {
	id = "chengdu/ddajie4",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/dadongmen",
		["north"] = "chengdu/cgenlu5",
		["west"] = "chengdu/ddajie3",
	},
	room_relative="�Ǹ�·�������----�����----���Ŷ����",
}
Room {
	id = "chengdu/eroad1",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["northeast"] = "chengdu/eroad2",
		["west"] = "chengdu/dadongmen",
	},
	room_relative="����J����-----������",
	objs = {
          ["����ׯ"] = "liu zhuzhuang",
           },
}
Room {
	id = "chengdu/eroad2",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["southwest"] = "chengdu/eroad1",
		["northeast"] = "chengdu/eroad3",
	},
	room_relative="����J����L������",
}
Room {
	id = "chengdu/eroad3",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["southwest"] = "chengdu/eroad2",
		["east"] = "group/entry/cderoad4",
	},
	room_relative="���-----����L������",
}
Room {
	id = "chengdu/guandm",
	name = "�ص���",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/xidajie2",
		["north"] = "chengdu/houyuan",
	},
	objs = {
          ["ȫ����"] = "quan guanqing",
          ["���"] = "li chunlai",
           },
  room_relative="��Ժ���ص��������ֹص���",
}
Room {
	id = "chengdu/houyuan",
	name = "��Ժ",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["south"] = "chengdu/guandm",
	},
	objs = {
          ["��ͷ"] = "man tou",
           },
	room_relative="��Ժ���ص����Ժ",
}
Room {
	id = "chengdu/nancejie1",
	name = "�ϲ��",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/nancejie2",
		["north"] = "chengdu/ddajie3",
	},
	room_relative="����֣��ϲ�֣��ϲ���ϲ��",
}
Room {
	id = "chengdu/nancejie2",
	name = "�ϲ��",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/nanmen",
		["north"] = "chengdu/nancejie1",
	},
	room_relative="�ϲ�֣��ϲ�֣�С�����ϲ��",
}
Room {
	id = "chengdu/nandajie1",
	name = "�ϴ��",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/nandajie2",
		["north"] = "chengdu/center",
	},
	room_relative="�����ģ��ϴ�֣��ϴ���ϴ��",
}
Room {
	id = "chengdu/nandajie2",
	name = "�ϴ��",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/dananmen",
		["north"] = "chengdu/nandajie1",
		["west"] = "chengdu/bank",
	},
	room_relative="�ϴ�֣�ī��ի----�ϴ�֣��������ϴ��",
}
Room {
	id = "chengdu/nanmen",
	name = "С����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "dali/shanlu2",
		["north"] = "chengdu/nancejie2",
	},
	room_relative="�ϲ�֣�С���ţ�ɽ·С����",
}
Room {
	id = "chengdu/road1",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["southwest"] = "chengdu/road4",
		["east"] = "zhiye/gaoshan0",
		["north"] = "lanzhou/qingcheng",
	},
	room_relative="��ǣ����-----��ɽ���¨L������",
}
Room {
	id = "chengdu/road4",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/dabeimen",
		["northeast"] = "chengdu/road1",
	},
	room_relative="����J��������Ŵ��",
}
Room {
	id = "chengdu/shufang",
	name = "�鷿",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/zjhall",
	},
	room_relative="����--�鷿",
}
Room {
	id = "chengdu/sroad1",
	name = "������",
	outdoor = "�ɶ���",
	ways = {
		["southwest"] = "chengdu/tulu3",
		["north"] = "chengdu/dananmen",
	},
	room_relative="�����ţ�������L��·������",
}
Room {
	id = "chengdu/tulu1",
	name = "����ɽ����",
	outdoor = "�ɶ���",
	ways = {
		["northeast"] = "group/entry/cdtulu2",  
		["west"] = "emei/qingshijie",
	},
	room_relative="��·�J��ʯ��--����ɽ���¶���ɽ����",	
}
Room {
	id = "chengdu/tulu3",
	name = "��·",
	outdoor = "�ɶ���",
	ways = {
		["southwest"] = "group/entry/cdtulu2",
		["northeast"] = "chengdu/sroad1",  
	},
	room_relative="������J��·�L��·��·",	
}
Room {
	id = "chengdu/wroad1",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/daximen",
		["west"] = "chengdu/wroad2",
	},
	room_relative="���-----���-----�����Ŵ��",
}
Room {
	id = "chengdu/wroad2",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/wroad1",
		["west"] = "xueshan/tulu1",
	},
	room_relative="������·-----���-----������",
}
Room {
	id = "chengdu/xidajie1",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/center",
		["west"] = "chengdu/xidajie2",
	},
	room_relative="�����----�����----�����������",
}
Room {
	id = "chengdu/xidajie2",
	name = "�����",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "chengdu/xidajie1",
		["north"] = "chengdu/guandm",
		["west"] = "chengdu/daximen",
	},
	room_relative="�ص����������----�����----����������",
}
Room {
	id = "chengdu/zjhall",
	name = "����",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["north"] = "chengdu/zjmen",
	--	["west"] = "chengdu/shufang",
	},
	--precmds = {
	--	["west"] = "#guessNum",
	--},
	objs = {
          ["������"] = "liu haoyi",
           },
	room_relative="�Ӿ����ţ��鷿-----��������",
}
Room {
	id = "chengdu/zjmen",
	name = "�Ӿ�����",
	outdoor = "�ɶ���",
	ways = {
		["south"] = "chengdu/zjhall",  
		["north"] = "chengdu/ddajie2",
	},
	room_relative="����֣��Ӿ����ţ������Ӿ�����",
}
Room {
	id = "city/banfang",
	name = "�෿",	
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/menlang",
	},
	room_relative="����---�෿",
}
Room {
	id = "city/beidajie1",
	name = "�����",	
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/beidajie2",
		["east"] = "city/xiaochidian",
		["north"] = "city/beimen",
		["west"] = "city/chmiao",
	},
	precmds = {
		["north"] = "#walkBusy",
	},
	room_relative="���ţ�������----�����----С�Ե������ֱ����",
}
Room {
	id = "city/beidajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/beidajie3",
		["east"] = "city/kedian",
		["north"] = "city/beidajie1",
		["west"] = "city/qianzhuang",
	},
	room_relative="����֣����ի----�����----������ջ������ֱ����",
}
Room {
	id = "city/beidajie3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/guangchangdong",
		["east"] = "city/yizhan",
		["north"] = "city/beidajie2",
		["west"] = "city/guangchangbei",
	},
	room_relative="����֣��㳡��----�����----��վ���㳡�������",
	objs = {
          ["���ǿ�"] = "jingcheng ke",
           },
}
Room {
	id = "city/beimen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/beidajie1",
		["north"] = "city/hsroad1",
	},
	lengths = {
	    ["north"] = "if job.name and job.area and (job.area=='�ƺ�����' or job.area=='̩ɽ') and job.name=='hubiao' then return false else return 1 end",
	},
	room_relative="����������ţ�����ֱ���",
}
Room {
	id = "city/bingqiku",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/bingying",
	},
	room_relative="��Ӫ---������",
}
Room {
	id = "city/bingying",
	name = "��Ӫ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/bingyingmen",
		["south"] = "city/bingqiku"
	},
	blocks = {
                ["south"] = {
                        {id = "guan bing", exp = 10000},
                },
         precmds = {
			  ["south"] = "kill guan bing",
	},
        },
	objs = {
          ["ʷ��ɽ"] = "shi qingshan",
           },
	
}
Room {
	id = "city/bingyingmen",
	name = "��Ӫ����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/guangchangxi",
		["west"] = "city/bingying",
	},
	room_relative="�㳡������Ӫ��Ӫ����",
}
Room {
	id = "city/chaguan",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/nandajie2",
	},
	room_relative="���-----�ϴ�ֲ��",
}
Room {
	id = "city/chemahang",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/guangchangdong",
	},
	room_relative="�㳡��----�����г�����",
}
Room {
	id = "city/chmiao",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["northwest"] = "wizard/guest_room",
		["east"] = "city/beidajie1",
	},
	objs = {
          ["������"] = "gongde xiang",
          ["����Ա����������񹫸��"] = "board",
           },
}
Room {
	id = "city/damingsi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/xidajie2",
	},
	room_relative="����֣������´�����",
}
Room {
	id = "city/dangpu",
	name = "����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/guangchangnan",
	},
	room_relative="�㳡�ϣ����̵���",
}
Room {
	id = "city/dating1",
	name = "�ĳ�����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/duchang4",
		["east"] = "city/duchang",
		["down"] = "city/dixiashi",
	},
	precmds = {
		["down"] = "give 1 gold to ping wei",
	},
	lengths ={
		["down"] = 10,
	},
	objs = {
          ["ƽ��"] = "ping wei",
           },
	
}

Room {
	id = "city/dhq",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/sxh",
		["east"] = "city/xjs",
		["north"] = "city/hubian1",
	},
	room_relative="�������ߣ������----С��ɽ�������������",
}
Room {
	id = "city/diemenglou1",
	name = "����¥һ¥",
	outdoor = "���ݳ�",
	ways = {
		["up"] = "city/diemenglou2",
	},
}

Room {
	id = "city/laofang",
	name = "�η�",
	outdoor = "���ݳ�",
	ways = {
		["give 2 silver to yu zu;wear all"] = "city/dilao",
	},
	nolooks = {
		["give 2 silver to yu zu;wear all"] = true,
	},
}
Room {
	id = "city/dilao",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southup"] = "city/fyhouyuan",
	},
	room_relative="���ú�Ժ--����",
}
Room {
	id = "city/dixiashi",
	name = "���º�ȭ��",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["up"] = "city/dating1",
	},
}
Room {
	id = "city/dongdajie0",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "zhiye/bingqipu1",
		["north"] = "zhiye/datiepu1",
		["east"] = "city/dongmen",
		["west"] = "city/dongdajie1",
	},
	room_relative="�����̣������----�����----���ţ������̶����",
}
Room {
	id = "city/dongdajie1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "city/yltw",
		["south"] = "zhiye/jimaidian1",
		["north"] = "city/yaopu",
		["east"] = "city/dongdajie0",
		["west"] = "city/dongdajie2",
	},
	room_relative="ҩ�̣������----�����----����֣��K����������ͤ�ⶫ���",
}
Room {
	id = "city/dongdajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/zahuopu",
		["north"] = "city/shuyuan",
		["east"] = "city/dongdajie1",
		["west"] = "city/dongdajie3",
	},
	room_relative="��Ժ�������----�����----����֣��ӻ��̶����",
}
Room {
	id = "city/dongdajie3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/yueqidian",
		["north"] = "city/guangchangdong",
		["east"] = "city/dongdajie2",
		["west"] = "city/guangchangnan",
	},
	room_relative="�㳡�����㳡��----�����----����֣������궫���",
}
Room {
	id = "city/dongmen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/yzyunhe",
		["north"] = "zhiye/biaoju1",
		["east"] = "group/entry/yzeroad1",
		["northeast"] = "city/guandimiao",
		["west"] = "city/dongdajie0",
	},
	room_relative="�����ھֹص�����J�����-----����-----���������ͷ����",
}
Room {
	id = "city/dongting",
	name = "����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["west"] = "city/ymzhengting",
	},
	objs = {
          ["���ʷ�"] = "zhang zhangfang",
           },
	room_relative="��������---����",
}
Room {
	id = "city/dongting2",
	name = "�ξֶ���",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["west"] = "city/yanju",
	},
	room_relative="�����ξ�---�ξֶ����ξֶ���",
}
Room {
	id = "city/dongxiangfang",
	name = "���᷿",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/lichunyuan",
	},
	objs = {
          ["éʮ��"] = "mao shiba",
           },
	room_relative="����Ժ----���᷿���᷿",
}
Room {
	id = "city/duchang",
	name = "�ĳ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/gusaifang",
		["east"] = "city/nandajie3",
		["west"] = "city/dating1",
		["up"] = "city/duchang2",
	},
	room_relative="�ĳ����ĳ�����-----�ĳ�-----�ϴ�֣��ĳ��ĳ�",
}
Room {
	id = "city/duchang2",
	name = "�ĳ�",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["down"] = "city/duchang",
		["east"] = "city/eproom",
		["west"] = "city/wproom",
		["south"] = "city/sproom",
		["north"] = "city/nproom",
	},
	objs = {
          ["������վ"] = "board",
          ["Ǯ�ϱ�"] = "qian laoben",
           },
	room_relative="����������������-----�ĳ�-----�������������Ϸ��ĳ�",
}
Room {
	id = "city/eproom",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["west"] = "city/duchang2",
	},
	room_relative="�ĳ�--������",
}
Room {
	id = "city/nproom",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["south"] = "city/duchang2",
	},
	room_relative="�ĳ�--������",
}
Room {
	id = "city/wproom",
	name = "��������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["east"] = "city/duchang2",
	},
	room_relative="�ĳ�--��������",
}
Room {
	id = "city/sproom",
	name = "�����Ϸ�",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/duchang2",
	},
	room_relative="�ĳ�--�����Ϸ�",
}
Room {
	id = "city/duchang4",
	name = "���귿",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dating1",
	},
	objs = {
          ["ǧ���"] = "sai gui",
          ["���Ϲ�"] = "sai gui",
          ["���ٹ�"] = "sai gui",
          ["���ݹ�ͯ"] = "gui tong",
           },
	room_relative="�ĳ�����---���귿",
}
Room {
	id = "city/eroad2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "changle/road1",
		["west"] = "group/entry/yzeroad1",
	},
	objs = {
	 ["��������"] = "mn",
          ["������"] = "wang gonggong",
	room_relative="�����----������K����������",
           },
}
Room {
	id = "city/fenduo2",
	name = "Ĺ��",
	outdoor = "���ݳ�",
	ways = {
		["jump well"] = "city/shangang",
		["north"] = "city/mszoulang",
	},
	nolooks = {
		["up"] = true,
		["jump well"] = true,
	},
	objs = {
          ["�ɳ���"] = "xi zhanglao",
          ["�����"] = "ma duozhu",
          ["ؤ��-���ݴ��·ֶ����԰�"] = "board",
           },
	room_relative="ɽ�ԣ�Ĺ��ͨ��Ĺ��"
}
Room {
	id = "city/fyhouyuan",
	name = "���ú�Ժ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "city/ymzhengting",
		["northdown"] = "city/dilao",
	},
	objs = {
          ["���ǹ�"] = "lang gou",
          ["����"] = "ao weng",
           },
		 room_relative="�������������θ��ú�Ժ"
}

Room {
	id = "city/geyuan",
	name = "��԰",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/nandajie1",
		["west"] = "city/jiashan",
	},
	room_relative="��ɽ-----��԰-----�ϴ�ָ�԰",
}
Room {
	id = "city/guandimiao",
	name = "�ص���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "city/dongmen",
	},
	room_relative="�ص���L���Źص���",
}
Room {
	id = "city/guangchang",
	name = "����㳡",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/guangchangnan",
		["east"] = "city/guangchangdong",
		["north"] = "city/guangchangbei",
		["west"] = "city/guangchangxi",
	},
	room_relative="�㳡�����㳡��---����㳡---�㳡�����㳡������㳡",
}
Room {
	id = "city/guangchangbei",
	name = "�㳡��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/guangchang",
		["north"] = "city/yamen",
		["east"] = "city/beidajie3",
		["northeast"] = "city/kongchang",
		["west"] = "city/xidajie3",
	},
	room_relative="���Ŵ��Ź㳡���J�����----�㳡��----����֣�����㳡�㳡��",
}
Room {
	id = "city/guangchangdong",
	name = "�㳡��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongdajie3",
		["east"] = "city/chemahang",
		["north"] = "city/beidajie3",
		["west"] = "city/guangchang",
	},
	room_relative="����֣�����㳡----�㳡��----�����У�����ֹ㳡��",
}
Room {
	id = "city/guangchangnan",
	name = "�㳡��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dangpu",
		["north"] = "city/guangchang",
		["east"] = "city/dongdajie3",
		["west"] = "city/nandajie3",
	},
   room_relative="����㳡���ϴ��----�㳡��----����֣����̹㳡��",
}
Room {
	id = "city/guangchangxi",
	name = "�㳡��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/nandajie3",
		["north"] = "city/xidajie3",
		["east"] = "city/guangchang",
		["west"] = "city/bingyingmen",
	},
	room_relative="����֣���Ӫ����----�㳡��----����㳡���ϴ�ֹ㳡��",
}
Room {
	id = "city/gusaifang",
	name = "�ĳ�",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/duchang",
	},
	room_relative="�ĳ����ĳ��ĳ�",
}

Room {
	id = "city/hsroad1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/beimen",
		["northwest"] = "city/shangang",
		["north"] = "huanghe/caodi1",
	},
		room_relative="ɽ�ԲݵبI������������ű�����",
}
Room {
	id = "city/huadian",
	name = "�ʻ���",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["south"] = "city/yizhan",
	},
	objs = {
          ["����"] = "zi zhu",
           },
	room_relative="�ʻ������վ�ʻ���",
}
Room {
	id = "city/hubian",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/xidajie2",
		["north"] = "city/sxh",
	},
	room_relative="�����������ϣ�����ֺ���",
}
Room {
	id = "city/hubian1",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dhq",
		["west"] = "city/lxs",
	},
	room_relative="�����°���---�������ߣ��������������",
}
Room {
	id = "city/jiangbei",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["#duCjiang"] = "city/jiangnan",
		["north"] = "city/nanmen",
		["east"] = "city/jiangbei2",
		["west"] = "city/jiangbei1",
	},
	lengths = {
		["#duCjiang"] = 5000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="���ţ���������---��������---�����ϰ���������"
}
Room {
	id = "city/jiangbei1",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/jiangbei",
	},
	nolooks = {
		["enter"] = true,
	},
	room_relative="��������--��������"
}
Room {
	id = "city/jiangbei2",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/jiangbei",
	},
	nolooks = {
		["enter"] = true,
	},
	room_relative="��������--��������"
}
Room {
	id = "city/jiangnan",
	name = "�����ϰ�",
	outdoor = "���ݳ�",
	ways = {
		["#duCjiang"] = "city/jiangbei",
		["south"] = "city/sroad1",
		["east"] = "city/jiangnan2",
		["west"] = "city/jiangnan1",
	},
	lengths = {
		["#duCjiang"] = 5000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="�����ϰ�---�����ϰ�---�����ϰ������Ϲٵ������ϰ�"
}
Room {
	id = "city/jiangnan1",
	name = "�����ϰ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/jiangnan",
	},
	nolooks = {
		["enter"] = true,
	},
	room_relative="�����ϰ�--�����ϰ�"
}
Room {
	id = "city/jiangnan2",
	name = "�����ϰ�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/jiangnan",
	},
	nolooks = {
		["enter"] = true,
	},
	room_relative="�����ϰ�--�����ϰ�"
}
Room {
	id = "city/jiashan",
	name = "��ɽ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/geyuan",
	},
	room_relative="��ɽ-----��԰��ɽ"
}
Room {
	id = "city/jiulou",
	name = "�������ƹ�",
	outdoor = "���ݳ�",
	ways = {
		["stand;up"] = "city/jiulou2",
		["stand;south"] = "city/xidajie1",
	},
	objs = {
          ["���ƹ�"] = "xian zhanggui",
          ["������"] = "jia laolu",
           },
		room_relative="��������¥��������������ƹ�",
}
Room {
	id = "city/jiulou2",
	name = "��������¥",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "city/jiulou",
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="��������¥--�������ƹ�"
}
Room {
	id = "city/kedian",
	name = "������ջ",
	no_fight = true,
	ways = {
		["east"] = "city/kedian/pianting",
		["#bckzout"] = "city/beidajie2",
	    ["#bckz"] = "city/kedian2",
	},
	lengths = {
		["#bckz"] = 5,
	},
	nolooks = {
		["up"] = true,
	},
	objs = {
          ["�͵����԰�"] = "board",
           },
	room_relative="�͵��¥�������---������ջ---ƫ��������ջ",
}
Room {
	id = "city/kedian/pianting",
	name = "ƫ��",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/kedian",
	},
	objs = {
          ["�ױ���"] = "he biweng",
          ["����"] = "zhao min",
          ["�����о����۰�"] = "board",
          ["¹�ȿ�"] = "lu zhangke",
           },
		room_relative="������ջ-----ƫ��ƫ��",
}
Room {
	id = "city/kedian2",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "city/kedian3",
		["down"] = "city/kedian",
	},
}
Room {
	id = "city/kedian3",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "city/kedian2",
	},
}
Room {
	id = "city/kongchang",
	name = "�㳡",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "city/guangchangbei",
	},
	room_relative="�㳡�L�㳡���㳡",
}
Room {
	id = "city/lichunyuan",
	name = "����Ժ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/mingyufang",
		["east"] = "city/dongxiangfang",
		["west"] = "city/xixiangfang",
	},
	objs = {
          ["Τ����"] = "wei chunfang",
           },
	room_relative="���᷿----����Ժ----���᷿����������Ժ",
}
Room {
	id = "city/lxs",
	name = "�����°���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/hubian1",
	},
	room_relative="�����°���--�������������°���",
}
Room {
	id = "city/menlang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/yamen",
		["north"] = "city/ymzhengting",
		["east"] = "city/banfang",
	},
	room_relative="���Ŵ��ţ���������--�෿����",
}
Room {
	id = "city/miao",
	name = "Ӣ�ҷ�����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["east"] = "city/winmo",
	},
	room_relative="Ӣ�ҷ�����--��ʤɽӢ�ҷ�����",
}

Room {
	id = "city/mingyufang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/xidajie3",
		["north"] = "city/lichunyuan",
	},
	room_relative="����Ժ�����񷻣����������",
}
Room {
	id = "city/ml1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongmen",
		["east"] = "city/ml2",
		["north"] = "city/ml1",
		["west"] = "city/ml1",
	},
}

Room {
	id = "city/mszoulang",
	name = "Ĺ��ͨ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/fenduo2",
		["west"] = "city/xmushi",
	},
	room_relative="Ĺ�ң�СĹ��Ĺ��ͨ��",
}
Room {
	id = "city/nandajie1",
	name = "�ϴ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/nanmen",
		["east"] = "city/xiaopangu",
		["north"] = "city/nandajie2",
		["west"] = "city/geyuan",
		--["#yjh"] = "city/nanmen",
	},
	room_relative="�ϴ�֣���԰----�ϴ��----С�̹ţ������ϴ��",
	--nolooks = {
	--	["#yjh"] = true,
	--	["south"] = true,
	--},
}
Room {
	id = "city/nandajie2",
	name = "�ϴ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/nandajie1",
		["east"] = "city/yanju",
		["north"] = "city/nandajie3",
		["west"] = "city/chaguan",
	},
	room_relative="�ϴ�֣����----�ϴ��----�����ξ֣��ϴ���ϴ��",
}
Room {
	id = "city/nandajie3",
	name = "�ϴ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/nandajie2",
		["north"] = "city/guangchangxi",
		["east"] = "city/guangchangnan",
		["west"] = "city/duchang",
	},
	room_relative="�㳡�����ĳ�----�ϴ��----�㳡�ϣ��ϴ���ϴ��",
}
Room {
	id = "city/nanmen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/jiangbei",
		["north"] = "city/nandajie1",
       },
	precmds = {
		["south"] = "#walkBusy",
	},
	room_relative="�ϴ�֣����ţ�������������",
}

Room {
	id = "city/pinqiting",
	name = "Ʒ��ͤ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/yueqidian",
	},
	room_relative="�������Ʒ��ͤƷ��ͤ",
}

Room {
	id = "city/qianzhuang",
	name = "���ի",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/beidajie2",
	},
	objs = {
          ["Ǯ��"] = "qian feng",
           },
	room_relative="���ի----��������ի",
}
Room {
	id = "city/shangang",
	name = "ɽ��",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "city/hsroad1",
		["north"] = "city/tomb",
	},
	room_relative="��Ĺ��ɽ�ԨK������ɽ��",
}
Room {
	id = "city/shuyuan",
	name = "��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongdajie2",
		["up"] = "city/wizroom",
	},
	objs = {
          ["������"] = "gu yanwu",
           },
	room_relative="��ʦ��������ҡ���Ժ���������Ժ",
}
Room {
	id = "city/sroad1",
	name = "���Ϲٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/qsgdao6",
		["north"] = "city/jiangnan",
        },
		precmds = {
		["north"] = "#walkBusy",
	},
	room_relative="�����ϰ������Ϲٵ��K���ݱ������Ϲٵ�",
}
Room {
	id = "city/sxh",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/hubian",
		["north"] = "city/dhq",
	},
	room_relative="����ţ�������������������",
}
Room {
	id = "city/tomb",
	name = "��Ĺ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/shangang",
		["pull huan;d"] = "city/fenduo2",
	},
	nolooks = {
		["pull huan;d"] = true,
		["down"] = true,
	},
	
}
Room {
	id = "city/winmo",
	name = "��ʤɽ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "city/wroad1",
		["west"] = "city/miao",
	},
	objs = {
          ["��̶"] = "wang tan",
          ["�����"] = "wu dapeng",
           },
	room_relative="Ӣ�ҷ�����----��ʤɽ�K������ʤɽ",
}
Room {
	id = "city/wizroom",
	name = "��ʦ���������",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "city/shuyuan",
	},
	objs = {
          ["ɱ�ֵĵ���"] = "statuary",
          ["����ĵ���"] = "statuary",
           },
}
Room {
	id = "city/wroad1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "city/winmo",
		["east"] = "city/ximen",
		["west"] = "city/wroad2",
	},
	room_relative="��ʤɽ�I��ʯ���-----����-----��������",
}
Room {
	id = "city/wroad2",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/wroad1",
		["west"] = "city/wroad3",
	},
	room_relative="��·---��ʯ���---������ʯ���",
}
Room {
	id = "city/wroad3",
	name = "��·",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "mingjiao/hdg/shanbi",
		["east"] = "city/wroad2",
		["west"] = "xiangyang/outeroad1",
	},
	objs = {
          ["���"] = "jian jie",
           },
	room_relative="ɽ�ڣ�������-----��·-----��ʯ�����·",
}
Room {
	id = "city/xiaochidian",
	name = "С�Ե�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/beidajie1",
	},
	room_relative="�����----С�Ե�С�Ե�",
}
Room {
	id = "city/xiaopangu",
	name = "С�̹�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/nandajie1",
	},
	objs = {
          ["����"] = "ju you",
           },
	room_relative="�ϴ��----С�̹�С�̹�",
}
Room {
	id = "city/xidajie1",
	name = "�����",
	ways = {
		["south"] = "city/zhubaodian",
		["#gozbd"] = "city/zhubaodian",
		["east"] = "city/xidajie2",
		["north"] = "city/jiulou",
		["#gosxh"] = "city/jiulou",
		["west"] = "city/ximen",
	},
	nolooks = {
		["north"] = true,
		["south"] = true,
	},
	lengths = {
		["north"] = "if not MidDay[locl.time] then return 1 end",
		["south"] = "if not MidDay[locl.time] then return 1 end",
		["#gosxh"] = "if MidDay[locl.time] then return 1 else return false end",
		["#gozbd"] = "if MidDay[locl.time] then return 1 else return false end",
	},
}

Room {
	id = "city/xidajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/damingsi",
		["east"] = "city/xidajie3",
		["north"] = "city/hubian",
		["west"] = "city/xidajie1",
	},
	room_relative="���ϣ������----�����----����֣������������",
}
Room {
	id = "city/xidajie3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/guangchangxi",
		["north"] = "city/mingyufang",
		["east"] = "city/guangchangbei",
		["west"] = "city/xidajie2",
	},
	room_relative="���񷻣������----�����----�㳡�����㳡�������",
}
Room {
	id = "city/ximen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/xidajie1",
		["west"] = "city/wroad1",
	},
	lengths = {
	    ["west"] = "if job.name and job.area and job.area=='������' and job.name=='hubiao' then return false else return 1 end",
	},
	room_relative="����-----����-----���������",
}
Room {
	id = "city/xiting",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/ymzhengting",
	},
	room_relative="��������--����",
}

Room {
	id = "city/xixiangfang",
	name = "���᷿",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/lichunyuan",
	},
	room_relative="���᷿----����Ժ���᷿",
}
Room {
	id = "city/xjs",
	name = "С��ɽ",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "city/dhq",
	},
	objs = {
          ["��ʽ��"] = "li shikai",
           },
	room_relative="�����----С��ɽС��ɽ",
}
Room {
	id = "city/xmushi",
	name = "СĹ��",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["east"] = "city/mszoulang",
	},
	objs = {
          ["��ͷ"] = "man tou",
           },
	room_relative="Ĺ��ͨ��СĹ��",
}
Room {
	id = "city/yamen",
	name = "���Ŵ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/guangchangbei",
		["north"] = "city/menlang",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 17500},
		},
          precmds = {
              ["north"] = "kill ya yi",
       
	},
	},
	objs = {
          ["������ԩ��"] = "board",
           },
	
}
Room {
	id = "city/yanju",
	name = "�����ξ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/dongting2",
		["west"] = "city/nandajie2",
	},
	room_relative="�ϴ��---�����ξ�---�ξֶ��������ξ�",
}
Room {
	id = "city/yaopu",
	name = "ҩ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongdajie1",
	},
	room_relative="ҩ�̣������ҩ��",
}
Room {
	id = "city/yizhan",
	name = "��վ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/huadian",
		["west"] = "city/beidajie3",
	},
	room_relative="�ʻ���������-----��վ��վ",
}
Room {
	id = "city/yltw",
	name = "����ͤ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/yuelaoting",
		["northwest"] = "city/dongdajie1",
	},
	room_relative="����֨I����ͤ�������ͤ����ͤ��",
}
Room {
	id = "city/ymzhengting",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/menlang",
		["northwest"] = "city/fyhouyuan",
		["east"] = "city/dongting",
		["west"] = "city/xiting",
	},
	blocks = {
		["northwest"] = {
			{id = "da yayi", exp = 800000},
            	},
	precmds = {
              ["northwest"] = "kill da yayi",
		},
	},
	objs = {
          ["�Գ�֮"] = "zhao chengzhi",
          ["����ˮ"] = "wang huaishui",
           },
	
}
Room {
	id = "city/yuelaoting",
	name = "����ͤ",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/yltw",
		["west"] = "city/yueqidian",
	},
	objs = {
          ["˫��"] = "shuang er",
          ["��������������"] = "board",
          ["��������"] = "yuexia laoren",
           },
	room_relative="����ͤ���������----����ͤ����ͤ",
}
Room {
	id = "city/yueqidian",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/pinqiting",
		["north"] = "city/dongdajie3",
		["east"] = "city/yuelaoting",
	},
	objs = {
          ["���ϰ�"] = "xiao laoban",
           },
	room_relative="����֣�������----����ͤ��Ʒ��ͤ������",
}
Room {
	id = "city/yzyunhe",
	name = "��ͷ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/dongmen",
	},
	room_relative="���ţ���ͷ��ͷ",
}
Room {
	id = "city/zahuopu",
	name = "�ӻ���",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/dongdajie2",
	},
	room_relative="����֣��ӻ����ӻ���",
}
Room {
	id = "city/zhubaodian",
	name = "�鱦��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/xidajie1",
	},
	objs = {
          ["���ϰ�"] = "zhu laoban",
           },
	room_relative="�����---�鱦��",
}
Room {
	id = "dali/beijie1",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie1",
		["north"] = "dali/yamen",
		["east"] = "dali/beijie2",
		["west"] = "dali/chaguan",
	},
	room_relative="����ǰ�������----�����----����֣�����ֱ����",
}
Room {
	id = "dali/beijie2",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/fengwei",
		["east"] = "dali/beijie3",
		["west"] = "dali/beijie1",
	},
	room_relative="�����----̫�ͱ��֣���ζС�Ե걱���",
}
Room {
	id = "dali/beijie3",
	name = "̫�ͱ���",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dalics",
		["north"] = "dali/beimen",
		["east"] = "dali/beijie4",
		["west"] = "dali/beijie2",
	},
	room_relative="���ţ������----����֣�������̫�ͱ���",
}
Room {
	id = "dali/beijie4",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/jiulou",
		["north"] = "dali/qian",
		["east"] = "dali/beijie5",
		["west"] = "dali/beijie3",
	},
	room_relative="��ѩ¥��̫�ͱ���--����֣�����Ǯׯ�����",
}
Room {
	id = "dali/beijie5",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie1",
		["east"] = "dali/yanju",
		["north"] = "dali/duchang",
		["west"] = "dali/beijie4",
	},
	room_relative="����֣�����----�ĳ�������ֱ����",
}
Room {
	id = "dali/beimen",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/beijie3",
		["north"] = "dali/dadao4",
	},
	room_relative="����֣��������",
}
Room {
	id = "dali/bingying",
	name = "��Ӫ",
	outdoor = "�����",
	ways = {
		["west"] = "dali/dongjie3",
	},
	objs = {
          ["�ƴ���"] = "huang daxiong",
          ["��Ȫ"] = "zhang quan",
          },
	room_relative="�����--��Ӫ",
}
Room {
	id = "dali/caifeng",
	name = "�÷��",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie1",
	},
	objs = {
          ["�÷���"] = "caifeng zhuo",
          },
	room_relative="�����--�÷��",
}
Room {
	id = "dali/chaguan",
	name = "���",
	outdoor = "�����",
	ways = {
		["east"] = "dali/beijie1",
	},
	objs = {
          ["����"] = "ying gu",
          },
  room_relative="�����--���",
}
Room {
	id = "dali/chouduan",
	name = "���ׯ",
	outdoor = "�����",
	ways = {
		["east"] = "dali/xijie3",
	},
	objs = {
          ["Ů����"] = "nv dianzhu",
          },
	room_relative="�����--���ׯ",
}
Room {
	id = "dali/chyuan",
	name = "�軨԰",
	outdoor = "�����",
	ways = {
		["northup"] = "dali/chyuan2",
		["west"] = "dali/dongjie6",
	},
	precmds = {
		["northup"] = "give 5 silver to yizu xiaohuo",
	},
	
}
Room {
	id = "dali/chyuan2",
	name = "�軨԰",
	outdoor = "�����",
	ways = {
		["northup"] = "dali/chyuan3",
		["southdown"] = "dali/chyuan",
	},
	objs = {
          ["���ɹ���"] = "baxian guohai",
          },
	room_relative="�軨԰���軨԰�軨԰",
}
Room {
	id = "dali/chyuan3",
	name = "�軨԰",
	outdoor = "�����",
	ways = {
		["northwest"] = "dali/chyuan4",
		["northeast"] = "dali/chyuan5",
		["southdown"] = "dali/chyuan2",
	},
	objs = {
          ["������"] = "luodi xiucai",
          },
}
Room {
	id = "dali/chyuan4",
	name = "�軨԰",
	outdoor = "�����",
	ways = {
		["southeast"] = "dali/chyuan3",
	},
	objs = {
          ["��װ�ع�"] = "hongzhuang suguo",
          },
}
Room {
	id = "dali/chyuan5",
	name = "�軨԰",
	outdoor = "�����",
	ways = {
		["southwest"] = "dali/chyuan3",
	},
	objs = {
          ["ʮ��ѧʿ"] = "shiba xueshi",
          ["ץ��������"] = "mei renlian",
          },
}
Room {
	id = "dali/dadao1",
	name = "���",
	outdoor = "�����",
	ways = {
		["southwest"] = "dali/yuxu/xiaodao1",
		["south"] = "group/entry/dlndao2",
		["north"] = "dali/shanlu4",
	},
	room_relative="ɽ·������L��������Ұ������",
}
Room {
	id = "dali/dadao3",
	name = "���",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dadao4",
		["north"] = "group/entry/dlndao2",
		["northeast"] = "dali/htq",
	},
	room_relative="�������Ȫ���J�����������",
}
Room {
	id = "dali/dadao4",
	name = "���",
	outdoor = "�����",
	ways = {
		["south"] = "dali/beimen",
		["north"] = "dali/dadao3",
	},
	room_relative="�������������Ŵ��",
}
Room {
	id = "dali/dafujia",
	name = "��֮��",
	outdoor = "�����",
	ways = {
		["north"] = "dali/nanjie4",
	},
	objs = {
          ["�����"] = "ma wude",
          },
   room_relative="�ϴ��--��֮��",
}
Room {
	id = "dali/dalics",
	name = "������",
	outdoor = "�����",
	ways = {
		["south"] = "dali/qsjie1",
		["east"] = "dali/jiulou",
		["north"] = "dali/beijie3",
		["west"] = "dali/fengwei",
	},
	room_relative="̫�ͱ��֣���ζС�Ե�----������----��ѩ¥����ʯ�ֳ�����",
}
Room {
	id = "dali/dalieast/chengj",
	name = "�ν����ɺ�",
	outdoor = "����Ƕ�",
	ways = {
		["southup"] = "group/entry/dleyd",
		["east"] = "dali/dalieast/yzh",
		["north"] = "dali/dalieast/lunan",
	},
	room_relative="���Ӷ������ں�--·�ϴ��ˮ���ν����ɺ�",
}
Room {
	id = "dali/dalieast/dadian",
	name = "���",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/yuan1",
		["north"] = "dali/dalieast/houyuan1",
	},
	room_relative="�¼�С·����Ժ���",
}
Room {
	id = "dali/dalieast/houyuan1",
	name = "��Ժ",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/dadian",
	},
	objs = {
          ["��ü����"] = "huangmei heshang",
          },
	room_relative="��Ժ--���",
}
Room {
	id = "dali/dalieast/lunan",
	name = "·�ϴ��ˮ",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/chengj",
		["north"] = "dali/dalieast/xs1",
		["east"] = "dali/dalieast/sl",
	},
	room_relative="�ν����ɺ�����ɽɭ��--ʯ�֣�·�ϴ��ˮ",
}
Room {
	id = "dali/dalieast/nianhuasi",
	name = "�¼�С·",
	outdoor = "����Ƕ�",
	ways = {
		["north"] = "dali/dalieast/yuan1",
		["out"] = "dali/dalieast/simen",
	},
	room_relative="�¼�С·���¼�С·���黨���¼�С·",
}
Room {
	id = "dali/dalieast/road1",
	name = "ɽ��С·",
	outdoor = "����Ƕ�",
	ways = {
		["eastup"] = "dali/dalieast/road2",
		["southwest"] = "dali/dalieast/shanlu7",
	},
	room_relative="ɽ��С·��ɽ��С·�Lɽ·ɽ��С·",
}
Room {
	id = "dali/dalieast/road2",
	name = "ɽ��С·",
	outdoor = "����Ƕ�",
	ways = {
		["eastup"] = "dali/dalieast/road3",
		["westdown"] = "dali/dalieast/road1",
	},
	room_relative="ɽ��С·��ɽ��С·��ɽ��С·ɽ��С·",
}
Room {
	id = "dali/dalieast/road3",
	name = "ɽ��С·",
	outdoor = "����Ƕ�",
	ways = {
		["westdown"] = "dali/dalieast/road2",
		["southeast"] = "dali/dalieast/road4",
	},
	room_relative="ɽ��С·��ɽ��С·�Kɽ��С·ɽ��С·",
}
Room {
	id = "dali/dalieast/road4",
	name = "ɽ��С·",
	outdoor = "����Ƕ�",
	ways = {
		["southeast"] = "dali/dalieast/simen",
		["northwest"] = "dali/dalieast/road3",
	},
	room_relative="ɽ��С·�Iɽ��С·�K�黨��ɽ��С·",
}
Room {
	id = "dali/dalieast/shanlu7",
	name = "ɽ·",
	outdoor = "����Ƕ�",
	ways = {
		["southeast"] = "dali/dalieast/xs1",
		["northeast"] = "dali/dalieast/road1",
		["west"] = "dali/dongmen",
	},
	room_relative="��ɽɭ�֣��¼�С·--���ţ�ɽ·",
}
Room {
	id = "dali/dalieast/simen",
	name = "�黨��",
	outdoor = "����Ƕ�",
	ways = {
		["northwest"] = "dali/dalieast/road4",
		["enter"] = "dali/dalieast/nianhuasi",
	},
	room_relative="��ɽɭ�֣�ɽ��С·�黨��",
}
Room {
	id = "dali/dalieast/sl",
	name = "ʯ��",
	outdoor = "����Ƕ�",
	ways = {
		["west"] = "dali/dalieast/lunan",
	},
	room_relative="·�ϴ��ˮ--ʯ��",
}
Room {
	id = "dali/dalieast/xs1",
	name = "��ɽɭ��",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/lunan",
		["northwest"] = "dali/dalieast/shanlu7",
		["north"] = "dali/dalieast/xs2",
	},
	objs = {
          ["����"] = "song shu",
          ["Ұ��"] = "ye tu",
          },
	room_relative="��ɽɭ�֣�·�ϴ��ˮ--ɽ·������¥",
}
Room {
	id = "dali/dalieast/xs2",
	name = "����¥",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/xs1",
	},
	room_relative="��ɽɭ��---����¥",
}
Room {
	id = "dali/dalieast/ydk",
	name = "���Ӷ���",
	outdoor = "����Ƕ�",
	ways = {
		["down"] = "dali/dalieast/ydn",
		["out"] = "group/entry/dleyd",
	},
	room_relative="��һ������Ӷ����Ӷ���",
}
Room {
	id = "dali/dalieast/ydn",
	name = "��һ��",
	outdoor = "����Ƕ�",
	ways = {
		["down"] = "dali/dalieast/ydx",
		["up"] = "dali/dalieast/ydk",
	},
	room_relative="�ڶ������һ�����Ӷ���",
}
Room {
	id = "dali/dalieast/ydx",
	name = "�ڶ���",
	outdoor = "����Ƕ�",
	ways = {
		["down"] = "dali/dalieast/ydxx",
		["up"] = "dali/dalieast/ydn",
	},
	room_relative="�ڶ�����������һ��",
}
Room {
	id = "dali/dalieast/ydxx",
	name = "������",
	outdoor = "����Ƕ�",
	ways = {
		["east"] = "dali/dalieast/ydxxx",
		["up"] = "dali/dalieast/ydx",
	},
	room_relative="�۾�¥��������ڶ���",
}
Room {
	id = "dali/dalieast/ydxxx",
	name = "�۾�¥",
	outdoor = "����Ƕ�",
	ways = {
		["east"] = "dali/dalieast/ydxxxx",
		["west"] = "dali/dalieast/ydxx",
	},
	room_relative="�۾�¥��������۾�¥��",
}
Room {
	id = "dali/dalieast/ydxxxx",
	name = "�۾�¥��",
	outdoor = "����Ƕ�",
	ways = {
		["west"] = "dali/dalieast/ydxxx",
		["up"] = "dali/dalieast/ydxxxxx",
	},
	room_relative="�۾�¥�������۾�¥��",
}
Room {
	id = "dali/dalieast/ydxxxxx",
	name = "����",
	outdoor = "����Ƕ�",
	ways = {
		["east"] = "dali/dalieast/ydxxxxxx",
		["down"] = "dali/dalieast/ydxxxx",
	},
	room_relative="�����ѣ������۾�¥��",
}
Room {
	id = "dali/dalieast/ydxxxxxx",
	name = "������",
	outdoor = "����Ƕ�",
	ways = {
		["west"] = "dali/dalieast/ydxxxxx",
	},
}
Room {
	id = "dali/dalieast/yuan1",
	name = "�¼�С·",
	outdoor = "����Ƕ�",
	ways = {
		["south"] = "dali/dalieast/nianhuasi",
		["north"] = "dali/dalieast/dadian",
	},
	room_relative="�黨�£�����¼�С·",
}
Room {
	id = "dali/dalieast/yzh",
	name = "���ں�",
	outdoor = "����Ƕ�",
	ways = {
		["west"] = "dali/dalieast/chengj",
	},
	room_relative="�ν����ɺ�---���ں�",
}
Room {
	id = "dali/dalisouth/anning",
	name = "������Ȫ",
	outdoor = "�������",
	ways = {
		["west"] = "dali/dalisouth/xgf",
	},
	objs = {
          ["Ұ��"] = "ye tu",
          ["���ϴ���"] = "lingnan daxia",
          ["�˻���"] = "caihua she",
          },
	room_relative="�¹ط�---������Ȫ",
}
Room {
	id = "dali/dalisouth/dg1",
	name = "���¥",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/dalisouth/hg1",
		["south"] = "group/entry/dlstulin",
		["northwest"] = "dali/dalisouth/xgf",
		["west"] = "dali/dalisouth/dg2",
	},
	room_relative="�¹ط�I�ɻ���----���¥�����ִ��¥",
}
Room {
	id = "dali/dalisouth/dg2",
	name = "�ɻ���",
	outdoor = "�������",
	ways = {
		["east"] = "dali/dalisouth/dg1",
		["west"] = "dali/dalisouth/dg3",
	},
	room_relative="���¥����԰��ɻ���",
}
Room {
	id = "dali/dalisouth/dg3",
	name = "��԰��",
	outdoor = "�������",
	ways = {
		["east"] = "dali/dalisouth/dg2",
	},
	room_relative="�ɻ���---��԰��",
}
Room {
	id = "dali/dalisouth/hg1",
	name = "����",
	outdoor = "�������",
	ways = {
		["south"] = "dali/dalisouth/hg2",
		["north"] = "dali/dalisouth/hg3",
		["northdown"] = "dali/dalisouth/dg1",
	},
	room_relative="������������--�����������¥",
}
Room {
	id = "dali/dalisouth/hg2",
	name = "������",
	outdoor = "�������",
	ways = {
		["north"] = "dali/dalisouth/hg1",
	},
	room_relative="����---������",
}
Room {
	id = "dali/dalisouth/hg3",
	name = "������",
	outdoor = "�������",
	ways = {
		["south"] = "dali/dalisouth/hg1",
	},
	room_relative="����---������",
}
Room {
	id = "dali/dalisouth/jiangbei",
	name = "���׽���",
	outdoor = "�������",
	ways = {
		["east"] = "foshan/road6",
		["#duCjiang"] = "dali/dalisouth/jiangnan",
	},
	lengths = {
		["#duCjiang"] = 6000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="���׽���---�ּ�����׽���",
}
Room {
	id = "dali/dalisouth/jiangnan",
	name = "���׽���",
	outdoor = "�������",
	ways = {
		["west"] = "dali/dalisouth/xishuang",
		["#duCjiang"] = "dali/dalisouth/jiangbei",
	},
	lengths = {
		["#duCjiang"] = 6000,
	},
	nolooks = {
		["#duCjiang"] = true,
		["enter"] = true,
	},
	room_relative="��˫����---���׽������׽���",
}
Room {
	id = "dali/dalisouth/shanlu6",
	name = "ɽ·",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/dalisouth/xgf",
		["north"] = "dali/nanmen",
	},
	room_relative="���ţ�ɽ·���¹ط�ɽ·",
}
Room {
	id = "dali/dalisouth/xgf",
	name = "�¹ط�",
	outdoor = "�������",
	ways = {
		["southeast"] = "dali/dalisouth/dg1",
		["east"] = "dali/dalisouth/anning",
		["northdown"] = "dali/dalisouth/shanlu6",
	},
	room_relative="ɽ·���¹ط�----������Ȫ�K���¥�¹ط�",
}
Room {
	id = "dali/dalisouth/xishuang",
	name = "��˫����",
	outdoor = "�������",
	ways = {
		["east"] = "dali/dalisouth/jiangnan",
		["northeast"] = "dali/dalisouth/xiushan",
       },
	precmds = {
		["east"] = "#walkBusy",
	},
	room_relative="��ɽ�J��˫����---���׽�����˫����",
}
Room {
	id = "dali/dalisouth/xiushan",
	name = "��ɽ",
	outdoor = "�������",
	ways = {
		["southwest"] = "dali/dalisouth/xishuang",
		["northdown"] = "group/entry/dlstulin",
	},
	room_relative="���֡���ɽ�L��˫������ɽ",
}
Room {
	id = "dali/daliwest/futiao",
	name = "����Ͽ",
	outdoor = "�������",
	ways = {
		["southwest"] = "dali/daliwest/ninglang",
		["northwest"] = "group/entry/dlwqunsh",
		["east"] = "dali/daliwest/nj",
	},
	room_relative="�����������÷��ѩɽ--����Ͽ��ŭ��",
}
Room {
	id = "dali/daliwest/ninglang",
	name = "���������",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/daliwest/yuelong",
		["northeast"] = "dali/daliwest/futiao",
	},
	room_relative="���������������ѩɽ����Ͽ",
}
Room {
	id = "dali/daliwest/nj",
	name = "ŭ��",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/daliwest/xueshan",
		["northeast"] = "tls/diancang",
		["west"] = "dali/daliwest/futiao",
	},
	room_relative="����ѩɽ�����ɽ--����Ͽ��ŭ��",
}
Room {
	id = "dali/daliwest/tianchi1",
	name = "���",
	outdoor = "�������",
	ways = {
		["northeast"] = "group/entry/dlwqunsh",
		["up"] = "dali/daliwest/tianchi2",
	},
	room_relative="÷��ѩɽ����ذ�ɽ���",
}
Room {
	id = "dali/daliwest/tianchi2",
	name = "��ذ�ɽ",
	outdoor = "�������",
	ways = {
		["down"] = "dali/daliwest/tianchi1",
	},
	room_relative="��ذ�ɽ--���",
}
Room {
	id = "dali/daliwest/xueshan",
	name = "����ѩɽ",
	outdoor = "�������",
	ways = {
		["northdown"] = "dali/daliwest/nj",
	},
	room_relative="����ѩɽ--ŭ��",
}
Room {
	id = "dali/daliwest/yuelong",
	name = "����ѩɽ",
	outdoor = "�������",
	ways = {
		["northdown"] = "dali/daliwest/ninglang",
	},
	room_relative="����ѩɽ---���������",
}
Room {
	id = "dali/dangpu",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["west"] = "dali/dongjie1",
	},
	objs = {
          ["���ϰ�"] = "shen laoban",
          },
	room_relative="�����--����",
}
Room {
	id = "dali/datiepu",
	name = "������",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["east"] = "dali/nanjie1",
	},
	room_relative="�ϴ��---������",
}
Room {
	id = "dali/dinganfu",
	name = "������",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["north"] = "dali/nanjie2",
	},
	room_relative="�ϴ��---������",
}
Room {
	id = "dali/dlhg/chitang",
	name = "����",
	outdoor = "����ʹ�",
	ways = {
		["southeast"] = "dali/dlhg/xiaoqiao",
		["northwest"] = "dali/dlhg/jiashan",
	},
}
Room {
	id = "dali/dlhg/chufang",
	name = "���ŷ�",
	outdoor = "����ʹ�",
	ways = {
		["east"] = "dali/dlhg/huating",
	},
	objs = {
          ["��������"] = "guoqiao mixian",
          },
}
Room {
	id = "dali/dlhg/dadian",
	name = "���",
	outdoor = "����ʹ�",
	ways = {
		["east"] = "dali/dlhg/zoulang2",
	},
}
Room {
	id = "dali/dlhg/houyuan",
	name = "��Ժ",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/xiaoqiao",
		["north"] = "dali/dlhg/qingong",
	},
}
Room {
	id = "dali/dlhg/huating",
	name = "����",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/zoulang1",
		["east"] = "dali/dlhg/shufang",
		["west"] = "dali/dlhg/chufang",
	},
	nolooks = {
		["north"] = true,
	},
	objs = {
          ["������"] = "duan zhengming",
          },
}
Room {
	id = "dali/dlhg/jiashan",
	name = "��ɽʯ",
	outdoor = "����ʹ�",
	ways = {
		["southeast"] = "dali/dlhg/chitang",
	},
}
Room {
	id = "dali/dlhg/qingong",
	name = "�޹�",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/houyuan",
	},
}
Room {
	id = "dali/dlhg/shufang",
	name = "�鷿",
	outdoor = "����ʹ�",
	ways = {
		["west"] = "dali/dlhg/huating",
	},
}
Room {
	id = "dali/dlhg/xiangfang",
	name = "�᷿",
	outdoor = "����ʹ�",
	ways = {
		["west"] = "dali/dlhg/zoulang2",
	},
}
Room {
	id = "dali/dlhg/xiaoqiao",
	name = "С��",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/zoulang2",
		["northwest"] = "dali/dlhg/chitang",
		["north"] = "dali/dlhg/houyuan",
	},
}
Room {
	id = "dali/dlhg/zhengmen",
	name = "�ʹ�����",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/qsjie2",
		["north"] = "dali/dlhg/zoulang1",
	},
	blocks = {
		["north"] = {
			{id = "huanggong shiwei", exp = 500000, party = "������"},
		},
         	precmds = {
              ["north"] = "kill huanggong shiwei",
	},
	},
	objs = {
          ["�ʹ�����"] = "huanggong shiwei",
          },
}
Room {
	id = "dali/dlhg/zoulang1",
	name = "����",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/zhengmen",
		["north"] = "dali/dlhg/huating",
	},
}
Room {
	id = "dali/dlhg/zoulang2",
	name = "����",
	outdoor = "����ʹ�",
	ways = {
		["south"] = "dali/dlhg/huating",
		["north"] = "dali/dlhg/xiaoqiao",
		["east"] = "dali/dlhg/xiangfang",
		["west"] = "dali/dlhg/dadian",
	},
}
Room {
	id = "dali/dongjie1",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie2",
		["east"] = "dali/dangpu",
		["north"] = "dali/beijie5",
		["west"] = "dali/jiulou",
	},
	room_relative="����֣���ѩ¥----�����----���̣�����ֶ����",
}
Room {
	id = "dali/dongjie2",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie3",
		["east"] = "dali/yaopu",
		["north"] = "dali/dongjie1",
		["west"] = "dali/doufufang",
	},
	room_relative="����֣�������----�����----ҩ�̣�����ֶ����",
}
Room {
	id = "dali/dongjie3",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie4",
		["north"] = "dali/dongjie2",
		["east"] = "dali/bingying",
	},
	room_relative="����֣������----��Ӫ��̫�Ͷ��ֶ����",
}
Room {
	id = "dali/dongjie4",
	name = "̫�Ͷ���",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie5",
		["east"] = "dali/dongmen",
		["north"] = "dali/dongjie3",
	},
	room_relative="����֣�̫�Ͷ���---���ţ������̫�Ͷ���",
}
Room {
	id = "dali/dongjie5",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie6",
		["east"] = "dali/wangfu/damen",
		["north"] = "dali/dongjie4",
	},
	room_relative="̫�Ͷ��֣������----�����������ţ�����ֶ����",
}
Room {
	id = "dali/dongjie6",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dongjie7",
		["north"] = "dali/dongjie5",
		["east"] = "dali/chyuan",
	},
	room_relative="����֣������----�軨԰������ֶ����",
}
Room {
	id = "dali/dongjie7",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/nanjie5",
		["east"] = "dali/huadian",
		["north"] = "dali/dongjie6",
	},
	room_relative="����֣������----������ϴ�ֶ����",
}
Room {
	id = "dali/dongmen",
	name = "����",
	outdoor = "�����",
	ways = {
		["east"] = "dali/dalieast/shanlu7",
		["west"] = "dali/dongjie4",
	},
	room_relative="ɽ·��̫�Ͷ��ֶ���",
}
Room {
	id = "dali/doufufang",
	name = "������",
	outdoor = "�����",
	ways = {
		["north"] = "dali/jiulou",
		["east"] = "dali/dongjie2",
		["west"] = "dali/qsjie1",
	},
	objs = {
          ["������ʩ"] = "doufu xishi",
          },
	room_relative="��ѩ¥����ʯ��----������----����ֶ�����",
}
Room {
	id = "dali/duchang",
	name = "�ĳ�",
	outdoor = "�����",
	ways = {
		["south"] = "dali/beijie5",
	},
	room_relative="�����--�ĳ�",
}
Room {
	id = "dali/erhai",
	name = "����԰",
	outdoor = "�����",
	ways = {
		["eastup"] = "dali/jzs3",
		["west"] = "dali/hth",
	},
	room_relative="��ɽһ������������԰",
}
Room {
	id = "dali/fengwei",
	name = "��ζС�Ե�",
	outdoor = "�����",
	ways = {
		["east"] = "dali/dalics",
		["north"] = "dali/beijie2",
		["west"] = "dali/xijie1",
	},
	objs = {
          ["��ǧ"] = "zhang qian",
          },
	room_relative="�����ģ������--����֣���ζС�Ե�",
}
Room {
	id = "dali/hth",
	name = "������",
	outdoor = "�����",
	ways = {
		["east"] = "dali/erhai",
		["west"] = "dali/htq",
	},
	room_relative="����԰������Ȫ������",
}
Room {
	id = "dali/htq",
	name = "����Ȫ",
	outdoor = "�����",
	ways = {
		["southwest"] = "dali/dadao3",
		["east"] = "dali/hth",
	},
	room_relative="���������Ȫ������",
}
Room {
	id = "dali/huadian",
	name = "����",
	outdoor = "�����",
	ways = {
		["west"] = "dali/dongjie7",
	},
	room_relative="�����--����",
}
Room {
	id = "dali/jiulou",
	name = "��ѩ¥",
	outdoor = "�����",
	ways = {
		["south"] = "dali/doufufang",
		["east"] = "dali/dongjie1",
		["north"] = "dali/beijie4",
		["west"] = "dali/dalics",
	},
	objs = {
          ["ŷ���ϰ�"] = "ouyang laoban",
          },
	room_relative="����֣�������----��ѩ¥----����֣���������ѩ¥",
}
Room {
	id = "dali/jzs1",
	name = "����ɽ",
	outdoor = "�����",
	ways = {
		["westdown"] = "dali/jzs2",
	},
	room_relative="����ɽ��--����ɽ",
}
Room {
	id = "dali/jzs2",
	name = "����ɽ��",
	outdoor = "�����",
	ways = {
		["westdown"] = "dali/jzs3",
		["eastup"] = "dali/jzs1",
	},
	room_relative="����ɽ����ɽһ�ἦ��ɽ��",
}
Room {
	id = "dali/jzs3",
	name = "��ɽһ��",
	outdoor = "�����",
	ways = {
		["eastup"] = "dali/jzs2",
		["westdown"] = "dali/erhai",
	},
	room_relative="����ɽ�ϣ�����԰��ɽһ��",
}
Room {
	id = "dali/kedian",
	name = "ӭ����",
	outdoor = "�����",
	ways = {
		-- ["enter"] = "dali/kedian2",
		["north"] = "dali/qsjie1",
	},
	nolooks = {
		["enter"] = true,
	},
	room_relative="��ʯ��--ӭ����",
}
Room {
	id = "dali/kedian2",
	name = "����",
	outdoor = "�����",
	ways = {
		["north"] = "dali/kedian3",
		["out"] = "dali/kedian",
	},
}
Room {
	id = "dali/kedian3",
	name = "�ͷ�",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["south"] = "dali/kedian2",
	},
}
Room {
	id = "dali/mafang",
	name = "��",
	outdoor = "�����",
	ways = {
		["east"] = "dali/qsjie2",
	},
	objs = {
          ["�����"] = "ma fuzi",
          },
	room_relative="��-----��ʯ����",
}
Room {
	id = "dali/nanjie1",
	name = "�ϴ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/shudian",
		["north"] = "dali/xijie7",
		["east"] = "dali/nanjie2",
		["west"] = "dali/datiepu",
	},
	room_relative='����֣�������----�ϴ��----�ϴ�֣������ϴ��',
}
Room {
	id = "dali/nanjie2",
	name = "�ϴ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dinganfu",
		["east"] = "dali/nanjie3",
		["west"] = "dali/nanjie1",
	},
	room_relative='�ϴ��----�ϴ��----̫���Ͻ֣��������ϴ��',
}
Room {
	id = "dali/nanjie3",
	name = "̫���Ͻ�",
	outdoor = "�����",
	ways = {
		["south"] = "dali/nanmen",
		["north"] = "dali/qsjie2",
		["east"] = "dali/nanjie4",
		["west"] = "dali/nanjie2",
	},
	room_relative='��ʯ�֣��ϴ��---̫���Ͻ�---�ϴ�֣�����̫���Ͻ�',
}
Room {
	id = "dali/nanjie4",
	name = "�ϴ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dafujia",
		["east"] = "dali/nanjie5",
		["west"] = "dali/nanjie3",
	},
	room_relative='̫���Ͻ�----�ϴ��----�ϴ�֣���֮���ϴ��',
}
Room {
	id = "dali/nanjie5",
	name = "�ϴ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/zahuopu",
		["east"] = "dali/shuyuan",
		["north"] = "dali/dongjie7",
		["west"] = "dali/nanjie4",
	},
	room_relative='����֣��ϴ��---��Ժ���ӻ����ϴ��',
}
Room {
	id = "dali/nanmen",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dalisouth/shanlu6",
		["north"] = "dali/nanjie3",
	},
	room_relative='̫���Ͻ֣����ţ�ɽ·����',
}
Room {
	id = "dali/qian",
	name = "����Ǯׯ",
	outdoor = "�����",
	ways = {
		["south"] = "dali/beijie4",
	},
	objs = {
          ["���ƹ�"] = "yan zhanggui",
          },
  room_relative='����Ǯׯ������ִ���Ǯׯ',
}
Room {
	id = "dali/qsjie1",
	name = "��ʯ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/kedian",
		["north"] = "dali/dalics",
		["east"] = "dali/doufufang",
	},
	room_relative='�����ģ���ʯ��----��������ӭ������ʯ��',
}
Room {
	id = "dali/qsjie2",
	name = "��ʯ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/nanjie3",
		["east"] = "dali/yizhan",
		["north"] = "dali/dlhg/zhengmen",
		["west"] = "dali/mafang",
	},
	room_relative='�ʹ����ţ���----��ʯ��----��վ��̫���Ͻ���ʯ��',
}
Room {
	id = "dali/shanhou",
	name = "�Ʋ��",
	outdoor = "�����",
	ways = {
		["east"] = "dali/xijie5",
	},
	objs = {
          ["����̩"] = "gao shengtai",
          },
	room_relative='�Ʋ��---������Ʋ��',
}
Room {
	id = "dali/shanlu2",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["south"] = "dali/shanlu3",
		["north"] = "chengdu/nanmen",
	},
	room_relative="С���ţ�ɽ·��ɽ·ɽ·",
}
Room {
	id = "dali/shanlu3",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["south"] = "dali/shanlu4",
		["north"] = "dali/shanlu2",
		["northeast"] = "dali/wuliang/xiaoxi",
	},
	room_relative="ɽ·ɽ��СϪ���Jɽ·��ɽ·ɽ·",
}
Room {
	id = "dali/shanlu4",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["south"] = "dali/dadao1",
		["north"] = "dali/shanlu3",
	},
	room_relative="ɽ·��ɽ·�����ɽ·",
}
Room {
	id = "dali/shudian",
	name = "����",
	outdoor = "�����",
	ways = {
		["north"] = "dali/nanjie1",
	},
	room_relative="�ϴ��--����",
}
Room {
	id = "dali/shuyuan",
	name = "��Ժ",
	outdoor = "�����",
	ways = {
		["west"] = "dali/nanjie5",
	},
	room_relative="�ϴ��--��Ժ",
}
Room {
	id = "dali/sikong",
	name = "˾����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/yamen",
	},
	objs = {
          ["����ʯ"] = "ba tianshi",
          },
	room_relative="����ǰ��--˾����",
}
Room {
	id = "dali/sima",
	name = "˾����",
	outdoor = "�����",
	ways = {
		["east"] = "dali/yamen",
	},
	objs = {
          ["����"] = "fan ye",
          },
	room_relative="����ǰ��---˾����",
}
Room {
	id = "dali/situ",
	name = "˾ͽ��",
	outdoor = "�����",
	ways = {
		["west"] = "dali/yamen",
	},
	objs = {
          ["������"] = "hua hegen",
          },
	room_relative="����ǰ��---˾ͽ��",
}
Room {
	id = "dali/wangfu/chufang",
	name = "��������",
	outdoor = "��������",
	ways = {
		["west"] = "dali/wangfu/lang4",
	},
	objs = {
          ["ϸ�ž�ƿ"] = "jiu ping",
          ["ըɽ��"] = "zha shanji",
     },
}
Room {
	id = "dali/wangfu/damen",
	name = "������������",
	outdoor = "��������",
	ways = {
		["south"] = "dali/wangfu/dating",
		["west"] = "dali/dongjie5",
	},
	objs = {
          ["�������԰�"] = "board",
     },
	 room_relative="���������������������������",
}
Room {
	id = "dali/wangfu/dating",
	name = "��������",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang2",
		["north"] = "dali/wangfu/damen",
		["west"] = "dali/wangfu/lang1",
	},
	blocks = {
		["east"] = {
			{id = "dali guanbing", exp = 10000,party = "������"},
		},
		["west"] = {
			{id = "dali guanbing", exp = 10000,party = "������"},
		},
         precmds = {
              ["west"] = "kill guanbing",
			  ["east"] = "kill guanbing",
	},
	},
	objs = {
          ["��˼��"] = "fu sigui",
     },
}
Room {
	id = "dali/wangfu/huayuan",
	name = "��԰",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang8",
		["west"] = "dali/wangfu/lang7",
	},
	objs = {
          ["���Ƴ�"] = "gu ducheng",
     },
}
Room {
	id = "dali/wangfu/lang1",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "dali/wangfu/lang3",
		["east"] = "dali/wangfu/dating",
	},
	room_relative="����-----�������������ȳ���",
}
Room {
	id = "dali/wangfu/lang2",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "dali/wangfu/lang4",
		["west"] = "dali/wangfu/dating",
	},
	room_relative="��������-----���ȣ����ȳ���",
}
Room {
	id = "dali/wangfu/lang3",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "dali/wangfu/lang5",
		["east"] = "dali/wangfu/nuange",
		["north"] = "dali/wangfu/lang1",
		["west"] = "dali/wangfu/yizheng",
	},
	room_relative="���ȣ�������-----����-----ů������ȳ���",
}
Room {
	id = "dali/wangfu/lang4",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "dali/wangfu/lang6",
		["north"] = "dali/wangfu/lang2",
		["east"] = "dali/wangfu/chufang",
		["west"] = "dali/wangfu/zhangfang",
	},
	room_relative="���ȣ��ʷ�-----����-----�������������ȳ���",
}
Room {
	id = "dali/wangfu/lang5",
	name = "����",
	outdoor = "��������",
	ways = {
		["southeast"] = "dali/wangfu/lang7",
		["east"] = "dali/wangfu/shufang",
		["north"] = "dali/wangfu/lang3",
		["west"] = "dali/wangfu/woshi1",
	},
	room_relative="���ȣ�����-----����-----�鷿�K���ȳ���",
}
Room {
	id = "dali/wangfu/lang6",
	name = "����",
	outdoor = "��������",
	ways = {
		["southwest"] = "dali/wangfu/lang8",
		["east"] = "dali/wangfu/wupinfang",
		["north"] = "dali/wangfu/lang4",
		["west"] = "dali/wangfu/woshi2",
	},
	room_relative="���ȣ�����-----����-----�������L���ȳ���",
}
Room {
	id = "dali/wangfu/lang7",
	name = "����",
	outdoor = "��������",
	ways = {
		["northwest"] = "dali/wangfu/lang5",
		["east"] = "dali/wangfu/huayuan",
	},
	room_relative="���ȨI����-----��԰����",
}
Room {
	id = "dali/wangfu/lang8",
	name = "����",
	outdoor = "��������",
	ways = {
		["northeast"] = "dali/wangfu/lang6",
		["west"] = "dali/wangfu/huayuan",
	},
	room_relative="���ȨJ��԰-----���ȳ���",
}
Room {
	id = "dali/wangfu/nuange",
	name = "ů��",
	outdoor = "��������",
	ways = {
		["west"] = "dali/wangfu/lang3",
	},
	objs = {
          ["������"] = "duan zhengchun",
     },
}
Room {
	id = "dali/wangfu/shufang",
	name = "�鷿",
	outdoor = "��������",
	ways = {
		["west"] = "dali/wangfu/lang5",
	},
	objs = {
          ["��˷�"] = "dacheng fojing",
     },
}
Room {
	id = "dali/wangfu/woshi1",
	name = "����",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang5",
	},
}
Room {
	id = "dali/wangfu/woshi2",
	name = "����",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang6",
	},
}
Room {
	id = "dali/wangfu/wupinfang",
	name = "������",
	outdoor = "��������",
	ways = {
		["west"] = "dali/wangfu/lang6",
	},
}
Room {
	id = "dali/wangfu/yizheng",
	name = "������",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang3",
	},
}
Room {
	id = "dali/wangfu/zhangfang",
	name = "�ʷ�",
	outdoor = "��������",
	ways = {
		["east"] = "dali/wangfu/lang4",
	},
}
Room {
	id = "dali/wuliang/anbian",
	name = "���׽���",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "dali/wuliang/gaoshan",
	},
	room_relative="����ɽ��---���׽���",
}
Room {
	id = "dali/wuliang/anbian1",
	name = "���׽���",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/jiangan",
		["west"] = "dali/wuliang/shanlu8",
	},
room_relative="���������������׽���",
}
Room {
	id = "dali/wuliang/banshan1",
	name = "��ɽ",
	outdoor = "����ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan2",
	},
}
Room {
	id = "dali/wuliang/banshan2",
	name = "��ɽ",
	outdoor = "����ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan3",
	},
}
Room {
	id = "dali/wuliang/banshan3",
	name = "��ɽ",
	outdoor = "����ɽ",
	ways = {
		["down"] = "dali/wuliang/banshan4",
	},
}
Room {
	id = "dali/wuliang/banshan4",
	name = "��ɽ",
	outdoor = "����ɽ",
	ways = {
		["down"] = "dali/wuliang/gudi",
	},
	room_relative="ɽ�ȵײ�---��ɽ",
}
Room {
	id = "dali/wuliang/beihubian",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "dali/wuliang/nanhubian",
		["north"] = "dali/wuliang/shulin4",
		["northeast"] = "dali/wuliang/donghubian",
	},
	room_relative="ɽ�����֣��Ϻ���--�����߱�����",
}
Room {
	id = "dali/wuliang/caodi",
	name = "��ٹȹȿ�",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/xiaojing",
		["out"] = "dali/wuliang/hslin",
	},
	room_relative="����С������ɭ����ٹȹȿ�",
}
Room {
	id = "dali/wuliang/dlgong",
	name = "��������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/jhg",
	},
}
Room {
	id = "dali/wuliang/dong1",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "dali/wuliang/dong2",
		["up"] = "dali/wuliang/taijie",
		["out"] = "dali/wuliang/dongkou",
	},
}
Room {
	id = "dali/wuliang/dong2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "dali/wuliang/dong1",
	},
}
Room {
	id = "dali/wuliang/donghubian",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "dali/wuliang/beihubian",
		["north"] = "dali/wuliang/shulin1",
		["east"] = "dali/wuliang/gudi",
		["west"] = "dali/wuliang/xihubian",
	},
}
Room {
	id = "dali/wuliang/dongkou",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "dali/wuliang/shibi",
		["knock huan;tui huan;enter"] = "dali/wuliang/dong1",
	},
}
Room {
	id = "dali/wuliang/dting",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/wlj",
	},
}
Room {
	id = "dali/wuliang/gaoshan",
	name = "����ɽ��",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "dali/wuliang/anbian",
		["south"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/gudi",
	name = "ɽ�ȵײ�",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/donghubian",
	},
}
Room {
	id = "dali/wuliang/guzhong",
	name = "��ٹ�",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/keting",
		["north"] = "dali/wuliang/xiaojing",
		["west"] = "dali/wuliang/xiaoting",
	},
	objs = {
          ["������"] = "laifu er",
          ["��ϲ��"] = "jinxi er",
           },
}
Room {
	id = "dali/wuliang/houyuan",
	name = "��Ժ",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/jhg",
		["north"] = "dali/wuliang/songlin1",
	},
	nolooks = {
		["north"] = true,
	},
	lengths = {
	    ["north"] = 100 ,
	},
}
Room {
	id = "dali/wuliang/hslin",
	name = "��ɭ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/tiesuo",
		["enter ������"] = "dali/wuliang/caodi",
	},
	nolooks = {
		["enter ������"] = true,
	},
}
Room {
	id = "dali/wuliang/jhg",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/wlj",
		["north"] = "dali/wuliang/houyuan",
		["east"] = "dali/wuliang/dlgong",
		["west"] = "dali/wuliang/xlgong",
	},
	blocks = {
		["north"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
		["east"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
		["west"] = {
			{id = "xin shuangqing", exp = 350000},
			{id = "zuo zimu", exp = 400000},
			{id = "gong guangjie", exp = 200000},
		},
	},
	objs = {
          ["������"] = "zuo zimu",
          ["�����"] = "gong guangjie",
          ["��˫��"] = "xin shuangqing",
           },
}
Room {
	id = "dali/wuliang/jiangan",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["north"] = "dali/wuliang/tiesuo",
		["west"] = "dali/wuliang/anbian1",
	},
}
Room {
	id = "dali/wuliang/jiangpan",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "dali/wuliang/taijie",
		["down"] = "dali/wuliang/anbian1",
	},
}
Room {
	id = "dali/wuliang/keting",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["north"] = "dali/wuliang/guzhong",
		["east"] = "dali/wuliang/xiangfang",
	},
	blocks = {
		["east"] = {
			{id = "zhong wanchou", exp = 400000},
		},
	},
}
Room {
	id = "dali/wuliang/lsdui",
	name = "��ʯ��",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "dali/wuliang/xiaolu2",
	},
	objs = {
          ["˾����"] = "sikong xuan",
           },
}
Room {
	id = "dali/wuliang/midao1",
	name = "�ܵ�",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "dali/wuliang/midao2",
	},
}
Room {
	id = "dali/wuliang/midao2",
	name = "�ܵ�",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "dali/wuliang/midao1",
		["south"] = "dali/wuliang/midao3",
	},
}
Room {
	id = "dali/wuliang/midao3",
	name = "�ܵ�",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/midao4",
		["north"] = "dali/wuliang/midao2",
	},
}
Room {
	id = "dali/wuliang/midao4",
	name = "�ܵ�",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "dali/wuliang/midao5",
		["west"] = "dali/wuliang/midao3",
	},
}
Room {
	id = "dali/wuliang/midao5",
	name = "�ܵ�",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "dali/wuliang/midao4",
		["out"] = "dali/shanlu3",
	},
}
Room {
	id = "dali/wuliang/muwu1",
	name = "�յ�",
	outdoor = "����ɽ",
	ways = {
		["north"] = "dali/wuliang/muwu2",
	},
}
Room {
	id = "dali/wuliang/muwu2",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/muwu1",
	},
}
Room {
	id = "dali/wuliang/nanhubian",
	name = "�Ϻ���",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "dali/wuliang/beihubian",
		["north"] = "dali/wuliang/shulin3",
		["northeast"] = "dali/wuliang/xihubian",
	},
}
Room {
	id = "dali/wuliang/pubu",
	name = "���ٲ�",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "dali/wuliang/shanya",
		["west;south"] = "dali/wuliang/houyuan",
	},
	blocks = {
	    ["southeast"] = {
			{id = "ge guangpei", exp = 400000},
			{id = "gan guanghao", exp = 400000},
		},
	},
}
Room {
	id = "dali/wuliang/shanlin-1",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/shanlin-2",
		["west"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlin-2",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "dali/wuliang/shanlin-3",
		["west"] = "dali/wuliang/shanlin-1",
	},
}
Room {
	id = "dali/wuliang/shanlin-3",
	name = "ɭ��",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "dali/wuliang/shanlin-2",
		["north"] = "dali/wuliang/shanlin-4",
	},
}
Room {
	id = "dali/wuliang/shanlin-4",
	name = "ɭ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/shanlin-3",
		["west"] = "dali/wuliang/shanlin-5",
	},
}
Room {
	id = "dali/wuliang/shanlin-5",
	name = "ɭ��",
	outdoor = "����ɽ",
	ways = {
		["north"] = "dali/wuliang/shanlin-6",
		["east"] = "dali/wuliang/shanlin-4",
	},
}
Room {
	id = "dali/wuliang/shanlin-6",
	name = "ɭ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/shanlin-5",
	},
}
Room {
	id = "dali/wuliang/shanlu8",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/shanlu8",
		["east"] = "dali/wuliang/anbian1",
		["south"] = "dali/wuliang/xiaoxi",
		["north"] = "dali/wuliang/shanlu9",
	},
}
Room {
	id = "dali/wuliang/shanlu9",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/shanlu10",
		["east"] = "dali/wuliang/shanlu10",
		["south"] = "dali/wuliang/shanlu8",
		["north"] = "dali/wuliang/shanlu10",
	},
}
Room {
	id = "dali/wuliang/shanlu10",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/shanlu13",
		["east"] = "dali/wuliang/shanlu14",
		["south"] = "dali/wuliang/shanlu9",
		["north"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlu11",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["#outJjl"] = "dali/wuliang/xiaoxi",
	},
	nolooks = {
		["#outJjl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#outJjl"] = 500,
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shanlu12",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/shanlu14",
		["east"] = "dali/wuliang/shanlu13",
		["south"] = "dali/wuliang/shanlu12",
		["north"] = "dali/wuliang/shanlu11",
	},
}
Room {
	id = "dali/wuliang/shanlu13",
	name = "б��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/shanlu10",
		["north"] = "dali/wuliang/shanlu10",
		["west"] = "dali/wuliang/shanlu9",
		["east"] = "dali/wuliang/shanlu12",
	},
}
Room {
	id = "dali/wuliang/shanlu14",
	name = "б��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/shanlu10",
		["north"] = "dali/wuliang/shanlu10",
		["west"] = "dali/wuliang/shanlu12",
		["east"] = "dali/wuliang/shanlu9",
	},
}
Room {
	id = "dali/wuliang/shanlu5",
	name = "����ɽ·",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "dali/wuliang/xiaolu1",
		["northdown"] = "dali/wuliang/xiaoxi",
	},
}
Room {
	id = "dali/wuliang/shanya",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "dali/wuliang/pubu",
		["jump down"] = "dali/wuliang/banshan1",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shibi",
	name = "ʯ����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "dali/wuliang/shuhou",
		["si teng;huang dashi left;huang dashi left;tui dashi right;tui dashi right;enter"] = "dali/wuliang/dongkou",
	},
}
Room {
	id = "dali/wuliang/shuhou",
	name = "���Ժ�",
	outdoor = "����ɽ",
	ways = {
		["out"] = "dali/wuliang/shulin1",
		["si teng"] = "dali/wuliang/shibi",
	},
}
Room {
	id = "dali/wuliang/shulin1",
	name = "ɽ������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/donghubian",
		["enter"] = "dali/wuliang/shuhou",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin2",
	name = "ɽ������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/xihubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin3",
	name = "ɽ������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/nanhubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/shulin4",
	name = "ɽ������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/beihubian",
	},
	objs = {
          ["Ұ��"] = "ye guo",
           },
}
Room {
	id = "dali/wuliang/songlin1",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		--["south"] = "dali/wuliang/houyuan",
		--["east"] = "dali/wuliang/pubu",
		["#songlinIn"] = "dali/wuliang/pubu",
		["#songlinOut"] = "dali/wuliang/houyuan",
	},
	lengths = {
	    ["#songlinIn"] = 100 ,
		["#songlinOut"] = 10 ,
	},
}
Room {
	id = "dali/wuliang/taijie",
	name = "̨��",
	outdoor = "����ɽ",
	ways = {
		["down"] = "dali/wuliang/dong1",
		["out"] = "dali/wuliang/jiangpan",
	},
}
Room {
	id = "dali/wuliang/tiesuo",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/jiangan",
		["north"] = "dali/wuliang/hslin",
	},
}
Room {
	id = "dali/wuliang/wlj",
	name = "ʯ��·",
	outdoor = "����ɽ",
	ways = {
		["north"] = "dali/wuliang/jhg",
		["east"] = "dali/wuliang/dting",
		["west"] = "dali/wuliang/xting",
		["out"] = "dali/wuliang/wljmen",
	},
	blocks = {
		["north"] = {
			{id = "rong ziju", exp = 350000},
		},
		["east"] = {
			{id = "rong ziju", exp = 350000},
		},
		["west"] = {
			{id = "rong ziju", exp = 350000},
		},
	},
	objs = {
          ["���Ӿ�"] = "rong ziju",
           },
}
Room {
	id = "dali/wuliang/wljmen",
	name = "��������",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "dali/wuliang/wlj",
		["southdown"] = "dali/wuliang/xiaolu5",
	},
	blocks = {
		["enter"] = {
			{id = "yu guangbiao", exp = 200000},
			{id = "wu guangsheng", exp = 200000},
		},
	},
	objs = {
          ["�����"] = "yu guangbiao",
          ["���ʤ"] = "wu guangsheng",
           },
}
Room {
	id = "dali/wuliang/xiangfang",
	name = "�᷿",
	outdoor = "����ɽ",
	ways = {
		["west"] = "dali/wuliang/keting",
	},
	objs = {
          ["�ʱ���"] = "gan baobao",
           },
}
Room {
	id = "dali/wuliang/xiaojing",
	name = "����С��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "dali/wuliang/guzhong",
		["north"] = "dali/wuliang/caodi",
	},
}
Room {
	id = "dali/wuliang/xiaolu1",
	name = "��ʯС·",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "dali/wuliang/xiaolu2",
		["westdown"] = "dali/wuliang/shanlu5",
	},
}
Room {
	id = "dali/wuliang/xiaolu2",
	name = "��ʯС·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "dali/wuliang/xiaolu3",
		["westdown"] = "dali/wuliang/xiaolu1",
		["northeast"] = "dali/wuliang/lsdui",
	},
}
Room {
	id = "dali/wuliang/xiaolu3",
	name = "��ʯС·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "dali/wuliang/xiaolu4",
		["southdown"] = "dali/wuliang/xiaolu2",
	},
}
Room {
	id = "dali/wuliang/xiaolu4",
	name = "��ʯ̨��",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "dali/wuliang/xiaolu5",
		["southdown"] = "dali/wuliang/xiaolu3",
	},
}
Room {
	id = "dali/wuliang/xiaolu5",
	name = "��ʯ̨��",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "dali/wuliang/wljmen",
		["eastdown"] = "dali/wuliang/xiaolu4",
	},
}
Room {
	id = "dali/wuliang/xiaoting",
	name = "С��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/guzhong",
	},
	objs = {
          ["����"] = "zhong ling",
           },
}
Room {
	id = "dali/wuliang/xiaoxi",
	name = "ɽ��СϪ",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "dali/wuliang/shanlu5",
		["southwest"] = "dali/shanlu3",
		["north"] = "dali/wuliang/shanlu8",
	},
}
Room {
	id = "dali/wuliang/xihubian",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "dali/wuliang/nanhubian",
		["north"] = "dali/wuliang/shulin2",
		["east"] = "dali/wuliang/donghubian",
	},
}
Room {
	id = "dali/wuliang/xlgong",
	name = "��������",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/jhg",
	},
}
Room {
	id = "dali/wuliang/xting",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "dali/wuliang/wlj",
	},
}
Room {
	id = "dali/xijie1",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie2",
		["east"] = "dali/fengwei",
		["north"] = "dali/beijie1",
		["west"] = "dali/caifeng",
	},
	room_relative="����֣��÷��----�����----��ζС�Ե������������",
}
Room {
	id = "dali/xijie2",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie3",
		["north"] = "dali/xijie1",
		["west"] = "dali/xiulou",
	},
	room_relative="����֣���¥----����֣�����������",
}
Room {
	id = "dali/xijie3",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie4",
		["north"] = "dali/xijie2",
		["west"] = "dali/chouduan",
	},
	room_relative="����֣����ׯ----����֣�̫�����������",
}
Room {
	id = "dali/xijie4",
	name = "̫������",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie5",
		["north"] = "dali/xijie3",
		["west"] = "dali/ximen",
	},
	room_relative="����֣�����---̫�����֣������̫������",
}
Room {
	id = "dali/xijie5",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie6",
		["north"] = "dali/xijie4",
		["west"] = "dali/shanhou",
	},
	room_relative="̫�����֣��Ʋ��----����֣�����������",
}
Room {
	id = "dali/xijie6",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/xijie7",
		["north"] = "dali/xijie5",
		["west"] = "dali/xiyuan",
	},
	room_relative="����֣�Ϸ԰��----����֣�����������",
}
Room {
	id = "dali/xijie7",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "dali/nanjie1",
		["north"] = "dali/xijie6",
		["west"] = "dali/yanzhi",
	},
	room_relative="����֣�������----����֣��ϴ�������",
}
Room {
	id = "dali/ximen",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["westup"] = "tls/diancang",
		["east"] = "dali/xijie4",
	},
	objs = {
          ["�쵤��"] = "zhu danchen",
          },
	room_relative="���ɽ��̫����������",
}
Room {
	id = "dali/xiulou",
	name = "��¥",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie2",
	},
	room_relative="�����---��¥",
}
Room {
	id = "dali/xiyuan",
	name = "Ϸ԰��",
	outdoor = "�����",
	ways = {
		["east"] = "dali/xijie6",
	},
	room_relative="�����---Ϸ԰��",
}
Room {
	id = "dali/yamen",
	name = "����ǰ��",
	outdoor = "�����",
	ways = {
		["south"] = "dali/beijie1",
		["east"] = "dali/situ",
		["north"] = "dali/sikong",
		["west"] = "dali/sima",
	},
	blocks = {
		["north"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000, party = "������"},
		},
		["east"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000},
		},
		["west"] = {
			{id = "dali guanbing", exp = 10000, party = "������"},
			{id = "dali wujiang", exp = 75000, party = "������"},
		},
	},
	
}
Room {
	id = "dali/yanju",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["west"] = "dali/beijie5",
	},
	room_relative="�����--����",
}
Room {
	id = "dali/yanzhi",
	name = "������",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["east"] = "dali/xijie7",
	},
	room_relative="�����---������",
}
Room {
	id = "dali/yaopu",
	name = "ҩ��",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["west"] = "dali/dongjie2",
	},
	room_relative="�����---ҩ��",
}
Room {
	id = "dali/yideng/anbian",
	name = "����",
	outdoor = "��Դ��",
	ways = {
		["enter"] = "dali/yideng/shandong",
	    ["#jiaoZi"] = "dali/yideng/shanding",
	},
	lengths = {
	    ["#jiaoZi"] = 10,
	},
}
Room {
	id = "dali/yideng/caowu",
	name = "é��",
	outdoor = "��Դ��",
	ways = {
		["east"] = "dali/yideng/pubu",
		["enter tongdao"] = "dali/yideng/hetang",
	},
	lengths = {
	    ["enter tongdao"] = "if score.master and score.master == 'һ�ƴ�ʦ' then return 10 else return false end",
	},
}
Room {
	id = "dali/yideng/chufang",
	name = "ի��",
	outdoor = "��Դ��",
	ways = {
		["east"] = "dali/yideng/houyuan",
	},
}
Room {
	id = "dali/yideng/dadian",
	name = "��Ժ���",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/shiqiao",
		["north"] = "dali/yideng/houyuan",
		["east"] = "dali/yideng/dfang",
	},
}
Room {
	id = "dali/yideng/dfang",
	name = "���᷿",
	outdoor = "��Դ��",
	ways = {
		["west"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/fanpu",
	name = "С����",
	outdoor = "��Դ��",

	ways = {
		["southwest"] = "dali/yideng/xiaolu1",
		["east"] = "group/entry/dlstulin",
	},
}
Room {
	id = "dali/yideng/hetang",
	name = "����",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/liang",
		["north"] = "dali/yideng/shiqiao",
		["enter tongdao"] = "dali/yideng/caowu",
	},
	lengths = {
		["enter tongdao"] = 10,
	},
}
Room {
	id = "dali/yideng/houyuan",
	name = "��Ժ��Ժ",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/dadian",
		["northwest"] = "dali/yideng/xiaojing1",
		["east"] = "dali/yideng/liangong",
		["west"] = "dali/yideng/chufang",
	},
}
Room {
	id = "dali/yideng/liang",
	name = "ʯ����ͷ",
	outdoor = "��Դ��",
	ways = {
		["#duZi"] = "dali/yideng/hetang",
	},
	lengths = {
	    ["#duZi"] = 10,
	},
}
Room {
	id = "dali/yideng/liangong",
	name = "������",
	outdoor = "��Դ��",
	ways = {
		["west"] = "dali/yideng/houyuan",
	},
}
Room {
	id = "dali/yideng/pubu",
	name = "ɽ���ٲ�",
	outdoor = "��Դ��",
	ways = {
		["north"] = "dali/yideng/xiaolu2",
		["west"] = "dali/yideng/caowu",
		["#yuRen"] = "dali/yideng/shandong",
	},
	lengths = {
	    ["#yuRen"] = "if not skills['dodge'] or skills['dodge'].lvl<200 or job.name=='tdh' then return false else return 10 end",
	},
}
Room {
	id = "dali/yideng/shanding",
	name = "ɽ��",
	outdoor = "��Դ��",
	ways = {
		["eastup"] = "dali/yideng/shanpo",
	},
}
Room {
	id = "dali/yideng/shandong",
	name = "ɽ��",
	outdoor = "��Դ��",
	ways = {
		["out"] = "dali/yideng/anbian",
	},
}
Room {
	id = "dali/yideng/shanpo",
	name = "ɽ��",
	outdoor = "��Դ��",
	nofind = true,
	ways = {
		["westdown"] = "dali/yideng/shanding",
		["#nongFu"] = "dali/yideng/shiliang",
	},
	lengths = {
	    ["#nongFu"] = 10,
	},
	objs = {
	    ["ũ��"] = "nong fu",
	},
}
Room {
	id = "dali/yideng/shiliang",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["west"] = "dali/yideng/shanpo",
		["#liangFront"] = "dali/yideng/liang1",
	},
}
Room {
	id = "dali/yideng/liang1",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/shiliang",
		["#liangFront"] = "dali/yideng/liang2",
	},
}
Room {
	id = "dali/yideng/liang2",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang1",
		["#liangFront"] = "dali/yideng/liang3",
	},
}
Room {
	id = "dali/yideng/liang3",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang2",
		["#liangFront"] = "dali/yideng/liang4",
	},
}
Room {
	id = "dali/yideng/liang4",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang3",
		["#liangFront"] = "dali/yideng/liang5",
	},
}
Room {
	id = "dali/yideng/liang5",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang4",
		["#liangFront"] = "dali/yideng/liang6",
	},
}
Room {

	id = "dali/yideng/liang6",
	name = "ʯ��",
	outdoor = "��Դ��",
	ways = {
		["#liangBack"] = "dali/yideng/liang5",
		["#liangFront"] = "dali/yideng/liang",
	},
}
Room {
	id = "dali/yideng/shiqiao",
	name = "Сʯ��",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/hetang",
		["north"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/shiwu",
	name = "ʯ������",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/zhulin",
		["east"] = "dali/yideng/xiangfang",
	},
	objs = {
	    ["һ�ƴ�ʦ"] = "yideng dashi",
	},
}
Room {
	id = "dali/yideng/xfang",
	name = "���᷿",
	outdoor = "��Դ��",
	ways = {
		["east"] = "dali/yideng/dadian",
	},
}
Room {
	id = "dali/yideng/xiangfang",
	name = "ʯ���᷿",
	outdoor = "��Դ��",
	ways = {
		["west"] = "dali/yideng/shiwu",
	},
}
Room {
	id = "dali/yideng/xiaojing1",
	name = "��ʯС��",
	outdoor = "��Դ��",
	ways = {
		["southeast"] = "dali/yideng/houyuan",
		["northeast"] = "dali/yideng/xiaojing2",
	},
}
Room {
	id = "dali/yideng/xiaojing2",
	name = "��ʯС��",
	outdoor = "��Դ��",
	ways = {
		["southwest"] = "dali/yideng/xiaojing1",
		["west"] = "dali/yideng/xiaojing3",
	},

}
Room {
	id = "dali/yideng/xiaojing3",
	name = "��ʯС��",
	outdoor = "��Դ��",
	ways = {
		["east"] = "dali/yideng/xiaojing2",
		["west"] = "dali/yideng/zhulin",
	},
}
Room {
	id = "dali/yideng/xiaolu1",
	name = "ɽ��С·",
	outdoor = "��Դ��",
	ways = {
		["southwest"] = "dali/yideng/xiaolu2",
		["northeast"] = "dali/yideng/fanpu",
	},
}
Room {
	id = "dali/yideng/xiaolu2",
	name = "��·����",
	outdoor = "��Դ��",
	ways = {
		["south"] = "dali/yideng/pubu",
		["northeast"] = "dali/yideng/xiaolu1",
	},
}
Room {
	id = "dali/yideng/zhulin",
	name = "����",
	outdoor = "��Դ��",
	ways = {
		["east"] = "dali/yideng/xiaojing3",
		["north"] = "dali/yideng/shiwu",
	},
}
Room {
	id = "dali/yizhan",
	name = "��վ",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["west"] = "dali/qsjie2",
	},
	objs = {
          ["������"] = "zhu wanli",
          },
	room_relative="��ʯ��--��վ",
}
Room {
	id = "dali/yuxu/guanmen",
	name = "�������",
	outdoor = "�����",
	ways = {
		["enter"] = "dali/yuxu/yuxuguan",
		["east"] = "group/entry/dlndao5",
	},
}
Room {
	id = "dali/yuxu/shangang",
	name = "ɽ��",
	outdoor = "�����",
	ways = {
		["northwest"] = "group/entry/dlndao5",
		["east"] = "dali/yuxu/xiaodao2",
	},
	objs = {
          ["���ϴ��"] = "lingnan dadao",
      },
}
Room {
	id = "dali/yuxu/shufang1",
	name = "�鷿",
	outdoor = "�����",
	ways = {
		["east"] = "dali/yuxu/yuxuguan",
	},
}
Room {
	id = "dali/yuxu/shuifang",
	name = "˯��",
	outdoor = "�����",
	ways = {
		["west"] = "dali/yuxu/yuxuguan",
	},
}
Room {
	id = "dali/yuxu/xiaodao1",
	name = "������Ұ",
	outdoor = "�����",
	ways = {
		["northeast"] = "dali/dadao1",
		["west"] = "dali/yuxu/xiaodao2",
	},
}
Room {
	id = "dali/yuxu/xiaodao2",
	name = "������Ұ",
	outdoor = "�����",
	ways = {
		["east"] = "dali/yuxu/xiaodao1",
		["west"] = "dali/yuxu/shangang",
	},
}
Room {
	id = "dali/yuxu/yuxuguan",
	name = "�����",
	outdoor = "�����",
	ways = {
		["east"] = "dali/yuxu/shuifang",
		["west"] = "dali/yuxu/shufang1",
		["out"] = "dali/yuxu/guanmen",
	},
	objs = {
          ["����ɢ��"] = "yuxu sanren",
      },
}
Room {
	id = "dali/zahuopu",
	name = "�ӻ���",
	outdoor = "�����",
	ways = {
		["north"] = "dali/nanjie5",
	},
	objs = {
          ["���ϰ�"] = "zhao laoban",
          },
		  room_relative="�ϴ��---�ӻ���",
}
Room {
	id = "death/gate",
	name = "���Ź�",
		ways = {
		["enter"] = "death/gateway",
	},
}
Room {
	id = "death/gateway",
	name = "���޴��",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "death/mpting",
	name = "����ͤ",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "death/pusadian",
	name = "�ز���������",
	ways = {
		["out"] = "death/gate",
	},
}
Room {
	id = "emei/bailongdong",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["northup"] = "emei/wannianan",
		["southeast"] = "emei/qingyinge",
		["west"] = "emei/gudelin",
	},
	room_relative="�����֡��ŵ���----�������K�����������",
}
Room {
	id = "emei/baoguosi",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/milin",
		["enter"] = "emei/daxiongdian",
		["east"] = "emei/baoguosm",
		["west"] = "emei/baoguosixq",
	},
room_relative="���۵�ı�������ǽ----������----������ɽ�ŨL���ֱ�����",
}
Room {
	id = "emei/baoguosicf",
	name = "����������",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/daxiongdian",
	},
	room_relative="����������--���۵��������",
}
Room {
	id = "emei/baoguosixq",
	name = "��������ǽ",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/baoguosi",
	},
	room_relative="��������ǽ--�����±�������ǽ",
}
Room {
	id = "emei/baoguosm",
	name = "������ɽ��",
	outdoor = "��üɽ",
	ways = {
		["northdown"] = "emei/qingshijie",
		["west"] = "emei/baoguosi",
	},
	room_relative="��ʯ�ס�������--������ɽ�ű�����ɽ��",
}
Room {
	id = "emei/basipan1",
	name = "��ʮ����",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/basipan2",
		["northwest"] = "emei/lengshanlin",
		["northdown"] = "emei/leidongping",
	},
	room_relative="��ɼ���׶�ƺ�I����ʮ���̨L��ʮ���̰�ʮ����",
}
Room {
	id = "emei/basipan2",
	name = "��ʮ����",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/basipan3",
		["southeast"] = "emei/lengshanlin1",
		["northeast"] = "emei/basipan1",
	},
	room_relative="��ʮ���̨J��ʮ���̡��K��ʮ������ɼ�ְ�ʮ����",
}
Room {
	id = "emei/basipan3",
	name = "��ʮ����",
	outdoor = "��üɽ",
	ways = {
		["southeast"] = "emei/jieyindian",
		["northwest"] = "emei/lengshanlin2",
		["northdown"] = "emei/basipan2",
	},
	room_relative="��ɼ�ְ�ʮ���̨I����ʮ���̨K�������ʮ����",
}
Room {
	id = "emei/cangjinglou",
	name = "�ؾ�¥",
	outdoor = "��üɽ",
	ways = {
		["out"] = "emei/daxiongdian",
	},
	room_relative="���۵�---�ؾ�¥",
}
Room {
	id = "emei/caodi",
	name = "�ݵ�",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/xiaojing",
		["east"] = "emei/xiaowu",
		["north"] = "emei/mu",
		["northeast"] = "emei/xiaojing2",
	},
	room_relative="ɽ��С����С��--����֮Ĺ��С���ݵ�",
}
Room {
	id = "emei/caopeng",
	name = "����",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/qingshijie",
	},
	room_relative="����-----��ʯ�ײ���",
}
Room {
	id = "emei/chanfang",
	name = "����",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["west"] = "emei/lingwenge",
	},
	room_relative="���ĸ�-----��������",
}
Room {
	id = "emei/chanfang2",
	name = "����",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["west"] = "emei/qianfoandd",
	},
	room_relative="ǧ���ִ��-----��������",
}
Room {
	id = "emei/chanfang3",
	name = "����",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["west"] = "emei/wanniananzd",
	},
	nolooks = {
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
}
Room {
	id = "emei/chunyangdian",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/guiyunge",
		["westup"] = "emei/shenshuian",
	},
	objs = {
          ["������"] = "ding minjun",
           },
	room_relative="��ˮ�֡�����������Ƹ�����",
}
Room {
	id = "emei/chuwujian",
	name = "�����",
	outdoor = "��üɽ",
	ways = {
		["north"] = "emei/huazanganzt",
		["up"] = "emei/huazangancj",
	},
	objs = {
          ["����ʦ̫"] = "jingfeng shitai",
           },
	blocks = {
		["up"] = {
			{id = "jingfeng shitai", exp = 2000000},
		},
        	precmds = {
              ["up"] = "kill jingfeng shitai",
	},
	},
   
}
Room {
	id = "emei/daxiong",
	name = "�����ִ��۱���",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/houdian",
		["east"] = "emei/huazanganzt",
		["northdown"] = "emei/huazangangc",
		["west"] = "emei/huazangancf",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open door",
	},
	room_relative="�ؾ�¥�ı���������----���۵�----��Ϣ�ҡű����´��۵�",
}
Room {
	id = "emei/daxiongdian",
	name = "���۵�",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/cangjinglou",
		["east"] = "emei/xiuxishi2",
		["west"] = "emei/baoguosicf",
		["out"] = "emei/baoguosi",
	},
	room_relative="�����ֹ㳡������--�����ִ��۱���--ի�ã������ִ��۱���",
}
Room {
	id = "emei/dcedian",
	name = "�����",
	outdoor = "��üɽ",
	ways = {
		["west"] = "emei/huazanganzd",
	},
	objs = {
          ["����Сʦ̫"] = "wen hui",
          ["����ʦ̫"] = "jinghe shitai",
           },
	room_relative="����������----�������",
}
Room {
	id = "emei/dcelang",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/huazanganzt",
		["west"] = "emei/huazangangc",  
	},
	room_relative="�����ֹ㳡----�����ȣ�ի�ö�����",
}
Room {
	id = "emei/dongkou",
	name = "���϶���",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/jiulaodong1",
		["out"] = "emei/jiulaodong",
	},
	
}
Room {
	id = "emei/duguangtai",
	name = "�ù�̨",
	outdoor = "��üɽ",
	ways = {
		["north"] = "emei/huazangan",
		["northdown"] = "emei/woyunan",
		["west"] = "emei/sheshenya",
	},
	objs = {
          ["������"] = "bei jinyi",
           },
	room_relative="�����֣��ù�̨������----�ù�̨�ù�̨",
}
Room {
	id = "emei/fuhusi",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/milin2",
		["east"] = "emei/milin",
	},
room_relative="���֡�������----���ַ�����",
}
Room {
	id = "emei/fushouan",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/lingwenge",
		["north"] = "emei/shenshuian",
	},
	room_relative="��ˮ�֣������ָ�����",
}
Room {
	id = "emei/fushouanxxs",
	name = "��Ϣ��",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["southdown"] = "emei/fushouanzt",
	},
	room_relative="������ի��---��Ϣ��",
}
Room {
	id = "emei/fushouanzt",
	name = "������ի��",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/lingwenge",
	},
	nolooks = {
		["northup"] = true,
	},
	room_relative="��Ϣ�ҡ�������ի��--���ĸ�����ի��",
}
Room {
	id = "emei/guanyinqiao",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/jietuopo",
		["west"] = "emei/guanyintang",
	},
	room_relative="������----������----�����¹�����",
}
Room {
	id = "emei/guanyintang",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/guiyunge",
		["east"] = "emei/guanyinqiao",
	},
	room_relative="���Ƹ��������----�����Ź�����",
}
Room {
	id = "emei/gudelin",
	name = "�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/gudelin",
		["north"] = "emei/gudelin2",
		["east"] = "emei/gudelin",
		["west"] = "emei/gudelin",
	},
}
Room {
	id = "emei/gudelin2",
	name = "�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/gudelin3",
		["north"] = "emei/gudelin2",
		["east"] = "emei/gudelin2",
		["west"] = "emei/gudelin2",
	},
}
Room {
	id = "emei/gudelin3",
	name = "�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/bailongdong",
		["north"] = "emei/gudelin3",
		["east"] = "emei/gudelin3",
		["west"] = "emei/gudelin3",
		["jump zhuang"] = "emei/muzhuang",
	},
	nolooks = {
		["jump zhuang"] = true,
	},
	room_relative="���������ŵ���--�ŵ��֣��ŵ��ֹŵ���",
}
Room {
	id = "emei/guiyunge",
	name = "���Ƹ�",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/yunvfeng",
		["eastdown"] = "emei/guanyintang",
		["westup"] = "emei/chunyangdian",
	},
	room_relative="����������Ƹ�������á���Ů����Ƹ�",
}
Room {
	id = "emei/heilongjiangzd",
	name = "������ջ��",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/heilongjiangzd2",
		["northeast"] = "emei/qingyinge",
	},
	room_relative="������J������ջ����������ջ��������ջ��",
}
Room {
	id = "emei/heilongjiangzd2",
	name = "������ջ��",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/qianfoan",
		["north"] = "emei/heilongjiangzd",
	},
	room_relative="������ջ����������ջ����ǧ���ֺ�����ջ��",
}
Room {
	id = "emei/houdian",
	name = "���",
	outdoor = "��üɽ",
	ways = {
		["north"] = "emei/daxiong",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["���ʦ̫"] = "miejue shitai",
           },
	room_relative="�����ִ��۱���������",
}
Room {
	id = "emei/houshan",
	name = "��ɽ",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/houshanxl2",
		["east"] = "emei/houshansl",
		["northeast"] = "emei/houshanty",
	},
	room_relative="̿Ҥ�J��ɽ-----��ɽ���֡���ɽС·��ɽ",
}
Room {
	id = "emei/houshandk",
	name = "����",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/houshansd",
	},
	room_relative="���ڣ�ɽ��",
}
Room {
	id = "emei/houshangm",
	name = "��ľ��",
	outdoor = "��üɽ",
	ways = {
	    ["#outemgmc"] = "emei/houshangm1",
	    ["eastdown"] = "emei/houshangm",
		["westup"] = "emei/houshangm",
		["southwest"] = "emei/houshangm",
		["northeast"] = "emei/houshangm",
	},
	nolooks = {
		["#outemgmc"] = true,
	},
	room_relative="��ľ�ԨJ��ľ�ԡ���ľ�ԡ���ľ�ԨL��ľ�Թ�ľ��",
}
Room {
	id = "emei/houshangm1",
	name = "��ľ��",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/houshangm",
        ["yue qiaobi"] = "emei/houshandk",  
	},
	nolooks = {
		["yue qiaobi"] = true,
	},
	room_relative="��ľ�ԡ���ľ�Թ�ľ��",
}
Room {
	id = "emei/houshansd",
	name = "ɽ��",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/qingyinge",
		["out"] = "emei/houshandk",
	},
	objs = {
          ["�º���"] = "guhong zi",

    },
	room_relative="�����������ɽ��",
}
Room {
	id = "emei/shuitan",
	name = "ˮ̶",
	outdoor = "��üɽ",
	ways = {
		["#emeishuitan"] = "emei/qingyinge",
		["pa up"] = "emei/shuitan",
	},
	nolooks = {
		["#emeishuitan"] = true,
		},
    room_relative="�������ˮ̶",
}
Room {
	id = "emei/houshansl",
	name = "��ɽ����",
	outdoor = "��üɽ",
	ways = {
		["northdown"] = "emei/houshanxl3",
		["west"] = "emei/houshan",
	},
	room_relative="��ɽС·����ɽ---��ɽ���ֺ�ɽ����",
}
Room {
	id = "emei/houshanty",
	name = "̿Ҥ",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/houshan",
	},
	room_relative="̿Ҥ�L��ɽ̿Ҥ",
}
Room {
	id = "emei/houshanxl",
	name = "��ɽС·",
	outdoor = "��üɽ",
	ways = {
		["northeast"] = "emei/houshanxl2",
	},
	room_relative="��ɽС·�J��ɽС·��ɽС·",
}
Room {
	id = "emei/houshanxl2",
	name = "��ɽС·",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/houshanxl",
		["northdown"] = "emei/houshan",
	},
	room_relative="��ɽ����ɽС·�L��ɽС·��ɽС·",
}
Room {
	id = "emei/houshanxl3",
	name = "��ɽС·",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/houshansl",
		["northdown"] = "emei/houshanxl4",
        ["#Toghz"] = "emei/houshangm"
	},
	nolooks = {
		["#Toghz"] = true,
	},
	lengths = {
		["#Toghz"] = 30,
	},
	room_relative="��ɽС·����ɽС·����ɽ���ֺ�ɽС·",
}
Room {
	id = "emei/houshanxl4",
	name = "��ɽС·",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/houshanxl3",
		["move stone;nd"] = "emei/qingyinge",
	},
	room_relative="���������ɽС·����ɽС·��ɽС·",
}
Room {
	id = "emei/huayanding",
	name = "���϶�",
	outdoor = "��üɽ",
	ways = {
		["eastup"] = "emei/xianfengsi",
		["westup"] = "emei/lianhuashi",
		["down"] = "emei/shierpan4",
		["north"] = "emei/maji",
	},
	room_relative="��ǣ�����ʯ�����϶����ɷ��¡�ʮ���̻��϶�",
}
Room {
	id = "emei/huazangan",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/duguangtai",
		["enter"] = "emei/huazanganzd",  
		["northdown"] = "emei/jinding",
	},
	room_relative="�𶥡������֣��ù�̨������",
}
Room {
	id = "emei/huazangancf",
	name = "����",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["south"] = "emei/xiuxishi",
		["north"] = "emei/xcelang",
		["east"] = "emei/daxiong",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["south"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	precmds = {
		["south"] = "open door",
	},
	room_relative="�����ȣ�����-----�����ִ��۱������Ϣ������",
}
Room {
	id = "emei/huazangancj",
	name = "�ؾ�¥",
	outdoor = "��üɽ",
	ways = {
		["down"] = "emei/chuwujian",
	},
	objs = {
          ["������;�"] = "shu",
          ["����ʦ̫"] = "jingdao shitai",
          ["��Ⱦ�"] = "shu",
           },
	room_relative="�ؾ�¥�������",
}
Room {
	id = "emei/huazangangc",
	name = "�����ֹ㳡",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/daxiong",
		["north"] = "emei/huazanganzd",  
		["east"] = "emei/dcelang",
		["west"] = "emei/xcelang",       
	},
	objs = {
          ["����ʦ̫"] = "jingxu shitai",
          ["�����Ե���±�"] = "board",
           },
	room_relative="�����������������--�����ֹ㳡--�����ȡ������ִ��۱�����ֹ㳡",
}
Room {
	id = "emei/huazanganzd",
	name = "����������",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/huazangangc",   
		["east"] = "emei/dcedian",
		["west"] = "emei/xcedian",
		["out"] = "emei/huazangan",
	},
	objs = {
          ["����ʦ̫"] = "jingxin shitai",
           },
	room_relative="�����--����������--�����������ֹ㳡����������",
}
Room {
	id = "emei/huazanganzt",
	name = "ի��",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/chuwujian",
		["north"] = "emei/dcelang",
		["west"] = "emei/daxiong",
	},
	objs = {
          ["��������"] = "liuli qiezi",
          ["��������"] = "mala doufu",
          ["��֭��ź"] = "mizhi tianou",
          ["��ˮ��«"] = "qingshui hulu",
           },
	room_relative="�����ȣ������ִ��۱���-----ի�ã������ի��",	
}
Room {
	id = "emei/jietuopo",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/milin2",
		["west"] = "emei/guanyinqiao",
	},
	room_relative="������----�����¡����ֽ�����",
}
Room {
	id = "emei/jieyindian",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/wanxingan",
		["northwest"] = "emei/basipan3",
	},
	room_relative="��ʮ���̨I�����֡������������",
}
Room {
	id = "emei/jinding",
	name = "��",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/huazangan",
		["southwest"] = "emei/woyunan",  
		["northdown"] = "emei/wanxingan",  
	},
	room_relative="�����֡��𶥨L�������ֻ����ֽ�",
}
Room {
	id = "emei/jiudaoguai1",
	name = "��ʮ�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/jiudaoguai2",
		["northeast"] = "emei/qianfoan",  
	},
	room_relative="ǧ���֨J��ʮ�ŵ��ա���ʮ�ŵ��վ�ʮ�ŵ���",
}
Room {
	id = "emei/jiudaoguai2",
	name = "��ʮ�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/jiudaoguai1",
		["southwest"] = "emei/jiudaoguai3",
	},
	room_relative="��ʮ�ŵ��ա���ʮ�ŵ��ըL��ʮ�ŵ��վ�ʮ�ŵ���",
}
Room {
	id = "emei/jiudaoguai3",
	name = "��ʮ�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/jiudaoguai4",
		["northeast"] = "emei/jiudaoguai2",
	},
	room_relative="��ʮ�ŵ��ըJ��ʮ�ŵ��ա���ʮ�ŵ��վ�ʮ�ŵ���",
}
Room {
	id = "emei/jiudaoguai4",
	name = "��ʮ�ŵ���",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/jiudaoguai3",
		["southwest"] = "emei/jiulaodong",
	},
	room_relative="��ʮ�ŵ��ա���ʮ�ŵ��ըL���϶���ʮ�ŵ���",
}
Room {
	id = "emei/jiulaodong",
	name = "���϶�",
	outdoor = "��üɽ",
	ways = {
		["northwest"] = "emei/lianhuashi",
		["enter"] = "emei/dongkou",
		["northeast"] = "emei/jiudaoguai4",
		["west"] = "emei/wanfoding",
	},
	room_relative="����ʯ���϶��ھ�ʮ�ŵ��ըI�ĨJ���----���϶����϶�",
}
Room {
	id = "emei/jiulaodong1",
	name = "���϶�",
	ways = {
		["#jldout"] = "emei/dongkou",
		["#jldin"] = "emei/shanpo",
	},
	lengths = {
		["#jldin"] = "if Bag['����'] then return 20 else return false end",
	},
	room_relative="���϶����϶�",
}
Room {
	id = "emei/leidongping",
	name = "�׶�ƺ",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/basipan1",
		["northdown"] = "emei/lingyunti",
	},
	room_relative="�����ݡ��׶�ƺ����ʮ�����׶�ƺ",
}
Room {
	id = "emei/lengshanlin",
	name = "��ɼ��",
	outdoor = "��üɽ",
	ways = {
		["southeast"] = "emei/basipan1",
		["southwest"] = "emei/lengshanlin",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/lengshanlin1",
	},
	room_relative="��ɼ����ɼ�֨I�J��ɼ�֨L�K��ɼ�ְ�ʮ������ɼ��",
}
Room {
	id = "emei/lengshanlin1",
	name = "��ɼ��",
	outdoor = "��üɽ",
	ways = {
		["southeast"] = "emei/lengshanlin1",
		["southwest"] = "emei/lengshanlin2",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/zhulin",
	},
	room_relative="��ɼ�֨J��ɼ�֨L�K��ɼ����ɼ����ɼ��",
}
Room {
	id = "emei/lengshanlin2",
	name = "��ɼ��",
	outdoor = "��üɽ",
	ways = {
		["southeast"] = "emei/basipan3",
		["southwest"] = "emei/lengshanlin2",
		["northwest"] = "emei/lengshanlin1",
		--["northeast"] = "emei/lengshanlin",
	},
}
Room {
	id = "emei/lianhuashi",
	name = "����ʯ",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/huayanding",
		["southeast"] = "emei/jiulaodong",
		["westup"] = "emei/zuantianpo",
	},
	objs = {
          ["������"] = "zhao lingzhu",
          ["������"] = "su mengqing",
	room_relative="�����¡�����ʯ�����϶��K���϶�����ʯ",
           },
}
Room {
	id = "emei/lingwenge",
	name = "���ĸ�",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/chanfang",
		["west"] = "emei/fushouanzt",
		["out"] = "emei/fushouan",
	},
	room_relative="������ի��----���ĸ�----�����Ÿ��������ĸ�",
}
Room {
	id = "emei/lingyunti",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/leidongping",
		["northdown;eastdown"] = "emei/zuantianpo2",
	},
	room_relative="ϴ��رߡ������ݡ��׶�ƺ������",
}
Room {
	id = "emei/maji",
	name = "���",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/huayanding",
	["#emhsxl"] = "emei/houshanxl",
	},
	room_relative="��ǣ����϶����",
}
Room {
	id = "emei/milin",
	name = "����",
	outdoor = "��üɽ",
	ways = {
		["northeast"] = "emei/baoguosi",
		["west"] = "emei/fuhusi",
	},
	room_relative="�����¨J������-----��������",
}
Room {
	id = "emei/milin2",
	name = "����",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/fuhusi",
		["westup"] = "emei/jietuopo",
	},
	room_relative="�����¡����֡�����������",
}
Room {
	id = "emei/mu",
	name = "����֮Ĺ",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/caodi",
		["east"] = "emei/xiaojing2",
	},
	room_relative="�ݵأ�С������֮Ĺ",
}
Room {
	id = "emei/mu2",
	name = "Ĺ��",
	outdoor = "��üɽ",
	ways = {
		["up"] = "emei/mu", 
	},
	room_relative="Ĺ�ң�����֮Ĺ",
}
Room {
	id = "emei/mupeng",
	name = "ľ��",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/wanfoding",
	},
	room_relative="ľ������",
}
Room {
	id = "emei/muzhuang",
	name = "÷��׮",
	outdoor = "��üɽ",
	ways = {
		["down"] = "emei/gudelin3",
	},
}
Room {
	id = "emei/podao1",
	name = "�µ�",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/podao2",
		["east"] = "emei/lianhuashi",
	},
	room_relative="����ʯ���µ��µ�",
}
Room {
	id = "emei/podao2",
	name = "�µ�",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/podao1",
	},
	room_relative="�µ�--�µ�",
}
Room {
	id = "emei/qianfoan",
	name = "ǧ����",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/jiudaoguai1",
		["enter"] = "emei/qianfoandd",
		["north"] = "emei/heilongjiangzd2",
	},
	room_relative="������ջ����ǧ���֨L��ǧ���ִ�����ʮ�ŵ���ǧ����",
}
Room {
	id = "emei/qianfoandd",
	name = "ǧ���ִ��",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/chanfang2",
		["out"] = "emei/qianfoan",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	room_relative="ǧ���ִ��--������ǧ����ǧ���ִ��",
}
Room {
	id = "emei/qingshijie",
	name = "��ʯ��",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/baoguosm",
		["east"] = "chengdu/tulu1",
		["west"] = "emei/caopeng",
	},
 room_relative="����----��ʯ��----����ɽ���¡�������ɽ����ʯ��",
}
Room {
	id = "emei/qingyinge",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["southeast"] = "emei/zhongfengsi",
		["southwest"] = "emei/heilongjiangzd",
		["northwest"] = "emei/bailongdong",
	},
	objs = {
          ["����ʦ̫"] = "jingxian shitai",
	room_relative="�������I������L�K������ջ���з���������",
           },
}
Room {
	id = "emei/shangu",
	name = "ɽ��",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/xiaojing",
	},
}
Room {
	id = "emei/shanpo",
	name = "ɽ��",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/jiulaodong1",
	},
	objs = {
        ["������"] = "zhou zhiruo",
    },
	
}
Room {
	id = "emei/shenshuian",
	name = "��ˮ��",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/chunyangdian",
		["westup"] = "emei/zhongfengsi",
		["south"] = "emei/fushouan",
	},
	room_relative="�з��¡���ˮ�֡����������������ˮ��",
}
Room {
	id = "emei/sheshenya",
	name = "�ù�̨������",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/duguangtai",  
	},
	room_relative="�ù�̨������--�ù�̨�ù�̨������",
}
Room {
	id = "emei/shierpan",
	name = "ʮ����",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/wannianan",
		["southwest"] = "emei/shierpan2",
	},
	room_relative="ʮ���̡������֨Lʮ����ʮ����",
}
Room {
	id = "emei/shierpan2",
	name = "ʮ����",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/shierpan3",
		["northeast"] = "emei/shierpan",
	},
	room_relative="ʮ���̨Jʮ���̡�ʮ����ʮ����",
}
Room {
	id = "emei/shierpan3",
	name = "ʮ����",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/shierpan2",
		["southwest"] = "emei/shierpan4",
	},
	room_relative="ʮ���̡�ʮ���̨Lʮ����ʮ����",
}
Room {
	id = "emei/shierpan4",
	name = "ʮ����",
	outdoor = "��üɽ",
	ways = {
		["northeast"] = "emei/shierpan3",
		["up"] = "emei/huayanding",
	},
	room_relative="���϶�ʮ���̡��Jʮ����ʮ����",
}
Room {
	id = "emei/shushang",
	name = "����",
	outdoor = "��üɽ",
	ways = {
		["down"] = "emei/jiudaoguai3",
	},
	blocks = {
		["down"] = {
			{id = "ju mang", exp = 0},
		},
          --precmds = {
           --   ["down"] = "kill ju mang",
	--},	      
		
	},	
	lengths ={
   ["down"] = 10,
   },
   room_relative="����--��ʮ�ŵ�������",
}
Room {
	id = "emei/wanfoding",
	name = "���",
	outdoor = "��üɽ",
	ways = {
		["enter"] = "emei/wanfota",
		["north"] = "emei/mupeng",
		["west"] = "emei/jiulaodong",
	},
	lengths = {
		--["enter"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	lengths = {
		["north"] = "if score.party and score.party=='������' then return 1 else return false end",
	},
	room_relative="�������ľ��-----���϶����",
}
Room {
	id = "emei/wanfota",
	name = "�����",
	outdoor = "��üɽ",
	ways = {
		["out"] = "emei/wanfoding",
	},
	room_relative="����������",
}
Room {
	id = "emei/wannianan",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["westup"] = "emei/shierpan",
		["enter"] = "emei/wanniananzd",
		["southdown"] = "emei/bailongdong",
	},
	room_relative="������ש���ʮ���̡������֡�������������",
}
Room {
	id = "emei/wanniananzd",
	name = "������ש��",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/chanfang3",
		["out"] = "emei/wannianan",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	
}
Room {
	id = "emei/wanxingan",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/jinding",
		["eastdown"] = "emei/jieyindian",
	},
	objs = {
          ["����ʦ̫"] = "jingjia shitai",
           },
   room_relative="�����֡����������������",
}
Room {
	id = "emei/woyunan",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["southup"] = "emei/duguangtai",  
		["northeast"] = "emei/jinding",
	},
	objs = {
          ["����ʦ̫"] = "jingxuan shitai",
           },
	room_relative="�𶥨J�����֡��ù�̨������",
}
Room {
	id = "emei/xcedian",
	name = "�����",
	outdoor = "��üɽ",
	ways = {
		["east"] = "emei/huazanganzd",
	},
	objs = {
          ["����Сʦ̫"] = "wen qing",
          ["����ʦ̫"] = "fengling shitai",
           },
	room_relative="�����----���������������",
}
Room {
	id = "emei/xcelang",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/huazangancf",
		["east"] = "emei/huazangangc",
	},
	room_relative="������----�����ֹ㳡������������",
}
Room {
	id = "emei/xianfengsi",
	name = "�ɷ���",
	outdoor = "��üɽ",
	ways = {
		["westdown"] = "emei/huayanding",
	},
	room_relative="���϶����ɷ����ɷ���",
}
Room {
	id = "emei/xiaojing",
	name = "ɽ��С��",
	outdoor = "��üɽ",
	ways = {
		["northeast"] = "emei/caodi",
		["west"] = "emei/shangu",
	},
}
Room {
	id = "emei/xiaojing2",
	name = "С��",
	outdoor = "��üɽ",
	ways = {
		["southwest"] = "emei/caodi",
		["northdown"] = "emei/jiudaoguai3",
		["west"] = "emei/mu", 
	},
	room_relative="�ݵأ�����֮Ĺ--��ʮ�ŵ���С��",
}
Room {
	id = "emei/xiaowu",
	name = "С��",
	outdoor = "��üɽ",
	ways = {
		["west"] = "emei/caodi",
	},
	room_relative="�ݵأ�С��",
}
Room {
	id = "emei/xiuxishi",
	name = "��Ϣ��",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["north"] = "emei/huazangancf",
	},
	room_relative="��������Ϣ��",
}
Room {
	id = "emei/xiuxishi2",
	name = "��Ϣ��",
	outdoor = "��üɽ",
	no_fight = true,
	ways = {
		["west"] = "emei/daxiongdian", 
	},
	room_relative="���۵�----��Ϣ����Ϣ��",
}
Room {
	id = "emei/yunvfeng",
	name = "��Ů��",
	outdoor = "��üɽ",
	ways = {
		["northdown"] = "emei/guiyunge",
	},
	objs = {
          ["������"] = "fang bilin",
           },
	room_relative="���Ƹ����Ů����Ů��",
}
Room {
	id = "emei/zhongfengsi",
	name = "�з���",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/shenshuian", 
		["northwest"] = "emei/qingyinge",
	},
	room_relative="������I�з��¡���ˮ���з���",
}
Room {
	id = "emei/zhulin",
	name = "С����",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/zhulin",
		["north"] = "emei/zhulin",
		["east"] = "emei/zhulin",
		["west"] = "emei/zhulin",
	},
}
Room {
	id = "emei/zuantianpo",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/lianhuashi",
		["westup"] = "emei/zuantianpo2",
	},
	room_relative="�����¡������¡�����ʯ������",
}
Room {
	id = "emei/zuantianpo2",
	name = "������",
	outdoor = "��üɽ",
	ways = {
		["eastdown"] = "emei/zuantianpo",
		["westup"] = "emei/xixiangchi",
	},
	room_relative="ϴ��رߡ������¡�������������",
	
}
Room {
	id = "emei/xixiangchi",
	name = "ϴ��ر�",
	outdoor = "��üɽ",
	ways = {
		["#emxxc"] = "emei/zuantianpo2",
		["southup"] = "emei/lingyunti",
		["north"] = "emei/xixiangchi1",
	},
	 postcmds = {
                ["eastdown"] = "#walkBusy", 
	room_relative="ϴ��رߣ�ϴ��رߡ������¡�������ϴ��ر�",
	},
}
Room {
	id = "emei/xixiangchi1",
	name = "ϴ��ر�",
	outdoor = "��üɽ",
	ways = {
		["south"] = "emei/xixiangchi",
	},
	room_relative="ϴ��ر�--ϴ��ر�",
}
Room {
	id = "fairyland/conglin2",
	name = "ѩɽ����",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "fairyland/xuanya",
		["southdown"] = "group/entry/klclin1",
	},
	room_relative="���¡�ѩɽ���֡�ѩɽ����ѩɽ����",
}
Room {
	id = "fairyland/cuigu",
	name = "���츣��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "fairyland/shanbi",
		["south"] = "fairyland/cuigu3",
		["north"] = "fairyland/shanlu5",
		["west"] = "fairyland/shanlu3",
	},
}
Room {
	id = "fairyland/cuigu1",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/shanlu6",
	},
}
Room {
	id = "fairyland/cuigu3",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["north"] = "fairyland/cuigu",
	},
}
Room {
	id = "fairyland/dapingtai",
	name = "��ƽ̨",
	outdoor = "����ɽ",
	ways = {
		["west"] = "fairyland/dashibi",
	},
}
Room {
	id = "fairyland/dashibi",
	name = "��ʯ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "fairyland/dapingtai",
	},
}
Room {
	id = "fairyland/dating",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/hmzhuang",
		["north"] = "fairyland/nuange",
		["east"] = "fairyland/houyuan",
	},
	objs = {
          ["�쳤��"] = "zhu changling",
     },
	 room_relative="��÷ɽׯ��ů��--��Ժ����",
}
Room {
	id = "fairyland/hmzhuang",
	name = "��÷ɽׯ",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "fairyland/shanxi",
		["east"] = "fairyland/shanlu2",
		["north"] = "fairyland/dating",
	},
	objs = {
          ["�Ǹ�"] = "qiao fu",
     },
	 room_relative="������ɽϪ�ߡ���÷ɽׯ---ɽ·��÷ɽׯ",
}
Room {
	id = "fairyland/houyuan",
	name = "��Ժ",
	outdoor = "����ɽ",
	ways = {
		["north"] = "fairyland/lggong",
		["west"] = "fairyland/dating",
	},
	room_relative="���Ṭ����Ժ������",
}
Room {
	id = "fairyland/lggong",
	name = "���Ṭ",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/houyuan",
	},
	objs = {
          ["ƽ�ܽ���"] = "pingkou jiangjun",
          ["���ｫ��"] = "cheqi jiangjun",
          ["��������"] = "zhengdong jiangjun",
          ["�۳彫��"] = "zhechong jiangjun",
          ["����"] = "gou pu",
          ["�����"] = "zhu jiuzhen",
     },
	blocks={
	    ["south"] = {
			{id = "pingkou jiangjun", exp = 150000},
			{id = "cheqi jiangjun", exp = 150000},
			{id = "zhengdong jiangjun", exp = 150000},
			{id = "zhechong jiangjun", exp = 150000},
		},
	},
	
}
Room {
	id = "fairyland/nuange",
	name = "ů��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/dating",
	},
	room_relative="������ů��",
}
Room {
	id = "fairyland/pubu",
	name = "�ٲ�",
	outdoor = "����ɽ",
	ways = {
		["east"] = "fairyland/shanlu4",
		["southdown"] = "fairyland/tanbian",
	},
	room_relative="��ȣ�����ٲ�",
}
Room {
	id = "fairyland/shanbi",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "fairyland/shangou",
		["westdown"] = "fairyland/cuigu",
	},
}
Room {
	id = "fairyland/shangou",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "fairyland/shanbi",
	},
}
Room {
	id = "fairyland/shanlu1",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/klshanlu",
		["southdown"] = "fairyland/xuedi1",
		["west"] = "fairyland/shanlu2",
	},
	room_relative="ɽ·-----ɽ·-----����ɽ´��ѩ��ɽ·",
}
Room {
	id = "fairyland/shanlu2",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["east"] = "fairyland/shanlu1",
		["west"] = "fairyland/hmzhuang",
	},
	room_relative="��÷ɽׯ-----ɽ·-----ɽ·ɽ·",
}
Room {
	id = "fairyland/shanlu3",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["east"] = "fairyland/cuigu",
		["west"] = "fairyland/shanlu4",
	},
	room_relative="��ȣ���ȴ��",
}
Room {
	id = "fairyland/shanlu4",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["east"] = "fairyland/shanlu3",
		["west"] = "fairyland/pubu",
	},
}
Room {
	id = "fairyland/shanlu5",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/cuigu",
		["north"] = "fairyland/shanlu6",
	},
}
Room {
	id = "fairyland/shanlu6",
	name = "���",
	outdoor = "����ɽ",
	ways = {
		["south"] = "fairyland/shanlu5",
		["north"] = "fairyland/cuigu1",
	},
}
Room {
	id = "fairyland/shanxi",
	name = "ɽϪ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "fairyland/hmzhuang",
		["westup"] = "group/entry/klclin1",
	},
	nolooks = {
		["down"] = true,
	},
	room_relative="ѩɽ���֡�ɽϪ�ߡ���÷ɽׯɽϪ��",
}
Room {
	id = "fairyland/tanbian",
	name = "���",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["northup"] = "fairyland/pubu",
	},
}
Room {
	id = "fairyland/xuanya",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "fairyland/conglin2",
	},
	room_relative="���¡�ѩɽ��������",
}
Room {
	id = "fairyland/xuedi",
	name = "ѩ��",
	outdoor = "����ɽ",
	ways = {
		["northeast"] = "fairyland/xuedi1",
	},
	room_relative="ѩ�بJѩ��ѩ��",
}
Room {
	id = "fairyland/xuedi1",
	name = "ѩ��",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "fairyland/shanlu1",
		["southwest"] = "fairyland/xuedi",
	},
	room_relative="ɽ·��ѩ�بLѩ��ѩ��",
}
Room {
	id = "foshan/alleyway",
	name = "С��",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/zhongjia",
		["west"] = "foshan/nanjie2",
	},
	room_relative="��ɽ�Ͻ�-----С����Ӽ�С��",
}
Room {
	id = "foshan/beidimiao",
	name = "������",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/xijie2",
	},
	objs = {
          ["��һ��"] = "feng yiming",
      },
	  room_relative="���������ɽ���ֱ�����",
}
Room {
	id = "foshan/beijie",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/guangchang",
		["north"] = "foshan/beimen",
	},
	room_relative="��ɽ���ţ���ɽ���֣���ɽ�㳡��ɽ����",
}
Room {
	id = "foshan/beimen",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/beijie",
		["north"] = "foshan/lingnan",
	},
	room_relative="���ϣ���ɽ���ţ���ɽ���ַ�ɽ����",
}
Room {
	id = "foshan/caidi",
	name = "�˵�",
	outdoor = "��ɽ��",
	ways = {
		["west"] = "foshan/zhongjia",
	},
	room_relative="�Ӽң��˵�",
}
Room {
	id = "foshan/caomeidi",
	name = "��ݮ��",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/dukou_tanbao",
		["northeast"] = "foshan/shulin1",
		["west"] = "foshan/shulin2",
	},
	room_relative="���֨J����----��ݮ�أ��϶ɿڲ�ݮ��",
}
Room {
	id = "foshan/dangpu",
	name = "����",
	outdoor = "��ɽ��",
	no_fight = true,
	ways = {
		["north"] = "foshan/dongjie3",
	},
	objs = {
          ["�ᳯ��"] = "yu chaofeng",
      },
	room_relative="��ɽ���֣����̵���",
}
Room {
	id = "foshan/dating",
	name = "�︮����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/shufang",
		["west"] = "foshan/dayuan",
	},
	objs = {
          ["����ӯ"] = "gongsun ying",
          ["��ʦү"] = "he shiye",
      },
	  room_relative="�︮��Ժ---�︮�������鷿�︮����",
}
Room {
	id = "foshan/dayuan",
	name = "�︮��Ժ",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/dating",
		["west"] = "foshan/villa-gate",
	},
	room_relative="�︮����---�︮��Ժ---�︮�����︮��Ժ",
}
Room {
	id = "foshan/dongjie",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "foshan/grocer",
		["east"] = "foshan/dongjie2",
		["west"] = "foshan/guangchang",
	},
	room_relative="�ӻ������ɽ�㳡---��ɽ���ַ�ɽ����",
}
Room {
	id = "foshan/dongjie2",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/ironsmith",
		["north"] = "foshan/shaobing",
		["east"] = "foshan/dongjie3",
		["west"] = "foshan/dongjie",
	},
	room_relative="�ձ�̯����ɽ����---��ɽ����---��ɽ���֣������̷�ɽ����",
}
Room {
	id = "foshan/dongjie3",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/dangpu",
		["east"] = "foshan/dongmen",
		["west"] = "foshan/dongjie2",
	},
	room_relative="��ɽ����---��ɽ���ţ����̷�ɽ����",
}
Room {
	id = "foshan/dongmen",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/road8",
		["west"] = "foshan/dongjie3",  
	},
	room_relative="��ɽ����---��ɽ����---�ּ����ɽ����",
}
Room {
	id = "foshan/duchang",
	name = "Ӣ�ۻ��",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "foshan/xijie",
	},
	objs = {
          ["������"] = "kuang baoguan",
      },
	  room_relative="��ɽ���֣�Ӣ�ۻ��Ӣ�ۻ��",
}
Room {
	id = "foshan/dukou",
	name = "�϶ɿ�",
	outdoor = "��ɽ��",
	no_fight = true,
	ways = {
		["north"] = "foshan/shulin_dzd",
		["east"] = "foshan/haibing",
		["southwest"] = "foshan/dukou_tanbao",
	},
	lengths = {
		["southwest"] = "if false then return 1 else return false end",
	},
	room_relative="���֣��϶ɿ��϶ɿ�",
}

Room {
	id = "foshan/haibing",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["west"] = "foshan/dukou",
	},
	room_relative="�������϶ɿ�",
}

Room {
	id = "foshan/dukou_tanbao",
	name = "�϶ɿ�",
	outdoor = "��ɽ��",
	no_fight = true,
	ways = {
		["north"] = "foshan/caomeidi",
	},
	room_relative="��ݮ�أ��϶ɿ��϶ɿ�",
}
Room {
	id = "foshan/fenchang",
	name = "�س�",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "foshan/xiaolu1",
	},
	room_relative="�س��LС·�س�",
}
Room {
	id = "foshan/grocer",
	name = "�ӻ���",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/dongjie",
	},
	objs = {
          ["���ϰ�"] = "li",
      },
	  room_relative="�ӻ������ɽ�����ӻ���",
}
Room {
	id = "foshan/guangchang",
	name = "��ɽ�㳡",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/herohotel",
		["east"] = "foshan/dongjie",
		["north"] = "foshan/beijie",
		["west"] = "foshan/xijie",
	},
	room_relative="��ɽ���֣���ɽ����---��ɽ�㳡---��ɽ���֣�Ӣ��¥��ɽ�㳡",
}
Room {
	id = "foshan/hanghai_room",
	name = "���Ϻ�̽������ֻ",
	outdoor = "��ɽ��",
	ways = {
		["out"] = "foshan/dukou_tanbao",  
	},
	room_relative="�϶ɿڣ����Ϻ�̽������ֻ",
}
Room {
	id = "foshan/herohotel",
	name = "Ӣ��¥",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/nanjie",
		["north"] = "foshan/guangchang",
		["up"] = "foshan/herohotel2",
	},
	objs = {
          ["���ϰ�"] = "wan laoban",
      },
	  room_relative="��ɽ�㳡��Ӣ��¥����ɽ�Ͻ�Ӣ��¥",
}
Room {
	id = "foshan/herohotel2",
	name = "Ӣ��¥��¥",
	outdoor = "��ɽ��",
	ways = {
		["down"] = "foshan/herohotel",
	},
	room_relative="Ӣ��¥��¥��Ӣ��¥",
}
Room {
	id = "foshan/ironsmith",
	name = "������",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "foshan/dongjie2",
	},
	objs = {
          ["������"] = "shen tiejiang",
      },
	  room_relative="��ɽ���֣�������������",
}
Room {
	id = "foshan/kedian",
	name = "Ӣ�ۿ�ջ",
	no_fight = true,
	ways = {
		["#fskzout"] = "foshan/nanjie",
		["#fskz"] = "foshan/kedian2",
	},
	lengths = {
		["#fskz"] = 5,
	},
	room_relative="��ջ��¥��Ӣ�ۿ�ջ---��ɽ�Ͻ�Ӣ�ۿ�ջ",
}
Room {
	id = "foshan/kedian2",
	name = "��ջ��¥",
	outdoor = "��ɽ��",
	ways = {
		["enter"] = "foshan/kedian3",
		["down"] = "foshan/kedian",
	},
}
Room {
	id = "foshan/kedian3",
	name = "�͵��¥",
	outdoor = "��ɽ��",
	no_fight = true,
	ways = {
		["out"] = "foshan/kedian2",
	},
}
Room {
	id = "foshan/lingnan",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/beimen",
		["north"] = "foshan/xiaolu1",
	},
	room_relative="С·�����ϣ���ɽ��������",
}
Room {
	id = "foshan/milin",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "foshan/xiaolu3",
	},
	blocks={
	    ["southwest"] = {
			{id = "ma zei", exp = 150000},
		},
       precmds = {
              ["southwest"] = "kill ma zei",
	},
	},
	
}
Room {
	id = "foshan/mishi",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["up"] = "foshan/shufang",
	},
	room_relative="�鷿������",
}
Room {
	id = "foshan/nanjie",
	name = "��ɽ�Ͻ�",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/nanjie2",
		["east"] = "foshan/villa-gate",
		["north"] = "foshan/herohotel",
		["west"] = "foshan/kedian",
	},
	room_relative="Ӣ��¥��Ӣ�ۿ�ջ---��ɽ�Ͻ�---�︮���ţ���ɽ�Ͻַ�ɽ�Ͻ�",
}
Room {
	id = "foshan/nanjie2",
	name = "��ɽ�Ͻ�",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/nanmen",
		["north"] = "foshan/nanjie",
		["east"] = "foshan/alleyway",
		["west"] = "foshan/noshery",
	},
	room_relative="��ɽ�Ͻ֣�С�Ե�---��ɽ�Ͻ�---С������ŷ�ɽ�Ͻ�",
}
Room {
	id = "foshan/nanmen",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/shulin1",
		["north"] = "foshan/nanjie2",
	},
	room_relative="��ɽ�Ͻ֣����ţ���������",
}
Room {
	id = "foshan/noshery",
	name = "С�Ե�",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/nanjie2",
	},
	objs = {
          ["���ϰ�"] = "song",
      },
	  room_relative="С�Ե�----��ɽ�Ͻ�С�Ե�",
}
Room {
	id = "foshan/road1",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/ximen",
		["west"] = "foshan/road2",
	},
	objs = {
          ["С��֦"] = "shu zhi",
      },
	  room_relative="�ּ��----�ּ��----�����ּ��",
}
Room {
	id = "foshan/road10",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southeast"] = "foshan/road12",
		["northeast"] = "foshan/road11",
		["west"] = "foshan/road9",
	},
	objs = {
          ["ޥ����"] = "huilan hua",
      },
	  room_relative="�ּ���J�ּ��----�ּ���K�ּ���ּ��",
}
Room {
	id = "foshan/road11",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "foshan/road10",
		["northeast"] = "group/entry/fsroad13",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
          ["����"] = "tu fei",
      },
	  room_relative="�ּ���J�ּ���L�ּ���ּ��",
}
Room {
	id = "foshan/road12",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["northwest"] = "foshan/road10",
	},
	room_relative="�ּ�����ּ���ּ��",
}
Room {
	id = "foshan/road14",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "group/entry/fsroad13",
		["north"] = "fuzhou/bridge",
	},
	objs = {
          ["ޥ����"] = "huilan hua",
      },
	  room_relative="���ŵ��ţ��ּ���L�ּ���ּ��",
}
Room {
	id = "foshan/road2",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/road1",
		["west"] = "foshan/road3",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
      },
	  room_relative="�ּ��----�ּ��----�ּ���ּ��",
}
Room {
	id = "foshan/road3",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["northwest"] = "foshan/road4",
		["east"] = "foshan/road2",
	},
	room_relative="�ּ���I�ּ��----�ּ���ּ��",
}
Room {
	id = "foshan/road4",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southeast"] = "foshan/road3",
		["southwest"] = "group/entry/fsroad5",
	},
	room_relative="�ּ���L�K�ּ���ּ���ּ��",
}
Room {
	id = "foshan/road6",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "group/entry/fsroad5",
		["west"] = "dali/dalisouth/jiangbei",
        },
	precmds = {
		["west"] = "#walkBusy",
	},
	objs = {
          ["�۷�"] = "mi feng",
          ["�׺ϻ�"] = "baihe hua",
      },
	  room_relative="���׽���----�ּ��----�ּ���ּ��",
}
Room {
	id = "foshan/road8",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/road9",
		["west"] = "foshan/dongmen",
	},
	objs = {
          ["�ų���"] = "zhang chaotang",
          ["�ſ�"] = "zhang kang",
      },
	  room_relative="��ɽ����----�ּ��----�ּ���ּ��",
}
Room {
	id = "foshan/road9",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/road10",
		["west"] = "foshan/road8",
	},
	objs = {
          ["ɯ须�"] = "shaluo huaflower",
      },
	  room_relative="�ּ��----�ּ��----�ּ���ּ��",
}
Room {
	id = "foshan/shaobing",
	name = "�ձ�̯",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/dongjie2",
	},
	objs = {
          ["���Ϻ�"] = "wang laohan",
      },
	  room_relative="�ձ�̯����ɽ�����ձ�̯",
}
Room {
	id = "foshan/shufang",
	name = "�鷿",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "foshan/dating",
	},
	room_relative="�︮�������鷿�鷿",
}
Room {
	id = "foshan/shulin1",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["southeast"] = "foshan/shulin_dzd",
		["southwest"] = "foshan/caomeidi",
		["north"] = "foshan/nanmen",
		["east"] = "foshan/pingyuanxiaolu",
	},
	room_relative="���ţ�����-----ƽԭС·�L�K��ݮ����������",
}
Room {
	id = "foshan/shulin2",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/caomeidi",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
      },
	room_relative="����-----��ݮ������",  
}
Room {
	id = "foshan/shulin_dzd",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/dukou",
		["northwest"] = "foshan/shulin1",
	},
	room_relative="���֨I���֣��϶ɿ�����",
}
Room {
	id = "foshan/villa-gate",
	name = "�︮����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/dayuan",
		["west"] = "foshan/nanjie",
	},
	room_relative="��ɽ�Ͻ�---�︮����---�︮��Ժ�︮����",
}
Room {
	id = "foshan/xiaolu1",
	name = "С·",
	outdoor = "��ɽ��",
	ways = {
		["northup"] = "foshan/xiaolu2",
		["south"] = "foshan/lingnan",
		["northwest"] = "foshan/zumiao",
		["northeast"] = "foshan/fenchang",
	},
	room_relative="��ɽ����С·�س��I���JС·������С·",
}
Room {
	id = "foshan/xiaolu2",
	name = "С·",
	outdoor = "��ɽ��",
	ways = {
		["northup"] = "foshan/xiaolu3",
		["southdown"] = "foshan/xiaolu1",
	},
	room_relative="С·��С·��С·С·",
}
Room {
	id = "foshan/xiaolu3",
	name = "С·",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "fuzhou/wroad10",
		["northeast"] = "foshan/milin",
		["southdown"] = "foshan/xiaolu2",
	},
	room_relative="ɽ·���֣��JС·��С·С·",
}
Room {
	id = "foshan/xijie",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/duchang",
		["east"] = "foshan/guangchang",
		["west"] = "foshan/xijie2",
	},
	room_relative="��ɽ����---��ɽ����---��ɽ�㳡��Ӣ�ۻ�ݷ�ɽ����",
}
Room {
	id = "foshan/xijie2",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/xijie",
		["north"] = "foshan/beidimiao",
		["west"] = "foshan/ximen",
	},
	room_relative="�����������---��ɽ����---��ɽ���ַ�ɽ����",
}
Room {
	id = "foshan/ximen",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/xijie2",
		["west"] = "foshan/road1",
	},
	room_relative="�ּ��-----����-----��ɽ��������",
}
Room {
	id = "foshan/zhongjia",
	name = "�Ӽ�",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/caidi",
		["north"] = "foshan/alleyway",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	objs = {
          ["�Ӱ���"] = "zhong asi",
          ["����ɩ"] = "zhong sisao",
          ["³Ⱥά"] = "lu qunwei",
          ["��С��"] = "zhong xiaoer",
      },
	  
}
Room {
	id = "foshan/zumiao",
	name = "��ɽ����",
	outdoor = "��ɽ��",
	ways = {
		["southeast"] = "foshan/xiaolu1",
	},
	room_relative="��ɽ����KС·��ɽ����",
}
--add by xieky@sj 20170809
Room {
	id = "foshan/pingyuanxiaolu",
	name = "ƽԭС·",
	outdoor = "��ɽ��",
	ways = {
		["west"] = "foshan/shulin1",
		["south"] = "foshan/nanhaiyucun",
	},
	 room_relative="����---ƽԭС·���Ϻ����ƽԭС·",
}
Room {
	id = "foshan/nanhaiyucun",
	name = "�Ϻ����",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "foshan/pingyuanxiaolu",
		["west"] = "foshan/yugang",
		["east"] = "foshan/shaiwangchang",
	},
	room_relative="ƽԭС·�����---�Ϻ����---���ɹ�����Ϻ����",
}
Room {
	id = "foshan/yugang",
	name = "���",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "foshan/nanhaiyucun",
	},
	objs = {
          ["����ʹ��"] = "shi zhe",
           },
	room_relative="���-----�Ϻ�������",
}
Room {
	id = "foshan/shaiwangchang",
	name = "���ɹ����",
	outdoor = "��ɽ��",
	ways = {
		["west"] = "foshan/nanhaiyucun",
		["north"] = "foshan/yucunxiaowu",
	},
	objs = {
          ["�к�"] = "boy",
          ["Ů��"] = "girl",
          ["���"] = "yu fu",
           },
	room_relative="���С�ݣ��Ϻ����--���ɹ�������ɹ����",
}
Room {
	id = "foshan/yucunxiaowu",
	name = "���С��",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "foshan/shaiwangchang",
	},
	objs = {
          ["С��"] = "kid",
    },
	room_relative="���С�ݣ����ɹ�������С��",
}
--add end
Room {
	id = "fuzhou/bank",
	name = "ͨ��ի",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/dongxiang2",
	},
	objs = {
          ["���ϰ�"] = "liu laoban",
           },
	room_relative="����----ͨ��իͨ��ի",
}
Room {
	id = "fuzhou/beijie",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/zhongxin",
		["north"] = "fuzhou/beimen",
	},
	room_relative="���ţ����֣������ı���",
}
Room {
	id = "fuzhou/beimen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/beijie",
		["north"] = "fuzhou/road6",
	},
	room_relative="����ɽ·�����ţ����ֱ���",
}
Room {
	id = "fuzhou/biaoju",
	name = "�����ھ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/zhengting",
		["east"] = "fuzhou/zhangfang",
		["north"] = "fuzhou/xijie",
	},
	objs = {
          ["��ƽ֮"] = "lin pingzhi",
          ["����ͷ"] = "zhang biaotou",
          ["����ͷ"] = "xu biaotou",
           },
	room_relative="���֣������ھ�---�ھ��ʷ����ھ����������ھ�",
}
Room {
	id = "fuzhou/bridge",
	name = "���ŵ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "foshan/road14",
		["north"] = "fuzhou/nanmen",
		["#fznmdq"] = "fuzhou/nanmen",
	},
	nolooks = {
		["north"] = true,
	},
	lengths = {
                ["north"] = "if MidNight[locl.time] or MidHsDay[locl.time] then return false else return 1 end",
                ["#fznmdq"] = "if tmp.find then return 3 else return false end",
	},
	room_relative="���ţ����ŵ��ţ��ּ�����ŵ���",
}
Room {
	id = "fuzhou/chalou",
	name = "��¥",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/xixiang4",
		["up"] = "fuzhou/chalou2",
	},
	room_relative="��¥����¥-----�����¥",
}
Room {
	id = "fuzhou/chalou2",
	name = "��¥",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "fuzhou/chalou",
	},
	room_relative="��¥����¥��¥",
}
Room {
	id = "fuzhou/dangpu",
	name = "����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["south"] = "fuzhou/xijie",
	},
	objs = {
          ["���ϰ�"] = "lao ban",
           },
	room_relative="���̣����ֵ���",
}
Room {
	id = "fuzhou/dongjie",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/shiqiao",
		["east"] = "fuzhou/haigang",
		["north"] = "fuzhou/dongxiang",
		["west"] = "fuzhou/zhongxin",
	},
	room_relative="�����������-----����-----���ۣ�ʯ�Ŷ���",
}
Room {
	id = "fuzhou/dongxiang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/dongjie",
		["east"] = "fuzhou/jiuguan",
		["north"] = "fuzhou/dongxiang2",
	},
	room_relative="���������-----�ƹݣ����ֶ���",
}
Room {
	id = "fuzhou/dongxiang2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/dongxiang",
		["east"] = "fuzhou/bank",
	},
	room_relative="����-----ͨ��ի�����ﶫ��",
}
Room {
	id = "fuzhou/feiyuan",
	name = "��԰",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/xyxiang",
	},
	room_relative="������-----��԰��԰",
}
Room {
	id = "fuzhou/fenduo1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["out"] = "fuzhou/yuchuan5",
	},
	objs = {
          ["������"] = "jiang duozhu",
          ["ؤ����Ӽ��������԰�"] = "board",
          ["�ⳤ��"] = "wu zhanglao",
           },
}
Room {
	id = "fuzhou/haigang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/yugang",
		["west"] = "fuzhou/dongjie",
		["swim"] = "fuzhou/island1",
	},
	nolooks = {
		["swim"] = true,
	},
	lengths = {
		["swim"] = 10,
	},
	room_relative="����-----����-----�����ͷ����",
}
Room {
	id = "fuzhou/houyuan",
	name = "��լ��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "fuzhou/well",
	},
	room_relative="����---��լ��Ժ"
}
Room {
	id = "fuzhou/huadian",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/xixiang3",
	},
	room_relative="����-----���ﻨ��"
}
Room {
	id = "fuzhou/island1",
	name = "С��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "fuzhou/island3",
		["swim"] = "fuzhou/haigang",
	},
	nolooks = {
		["swim"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
	},
	lengths = {
		["swim"] = 10,
	},
}
Room {
	id = "fuzhou/island2",
	name = "ɳ̲",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/island1",
	},
	nolooks = {
		["east"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "fuzhou/island3",
	name = "ɳ̲",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "fuzhou/rock",
		["east"] = "fuzhou/island1",
		["west"] = "fuzhou/island4",
	},
	room_relative="���ң�ɳ̲-----ɳ̲-----С��ɳ̲"
}
Room {
	id = "fuzhou/island4",
	name = "ɳ̲",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/island5",
		["east"] = "fuzhou/island3",
		["west"] = "fuzhou/island1",
	},
}
Room {
	id = "fuzhou/island5",
	name = "ɳ̲",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "fuzhou/lagoon",
		["north"] = "fuzhou/island4",
	},
}
Room {
	id = "fuzhou/jiuguan",
	name = "�ƹ�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/dongxiang",
	},
	room_relative="����-----�ƹݾƹ�"
}
Room {
	id = "fuzhou/kezhan",
	name = "�����ջ",
	no_fight = true,
	ways = {
		["north"] = "fuzhou/xixiang4",
		-- ["up"] = "fuzhou/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="����������ջ�����ջ"
}
Room {
	id = "fuzhou/kezhan2",
	name = "��ջ��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["down"] = "fuzhou/kezhan",
	},
}
Room {
	id = "fuzhou/lagoon",
	name = "��ʯ",
	outdoor = "���ݳ�",
	ways = {
		["westdown"] = "fuzhou/island5",
	},
	objs = {
          ["�ȱ�"] = "bei ke",
           },
}
Room {
	id = "fuzhou/laozhai",
	name = "������լ",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/xyxiang2",
	},
	room_relative="������---������լ������լ"
}
Room {
	id = "fuzhou/liang",
	name = "���ҷ���",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "fuzhou/mishi",
	},
}
Room {
	id = "fuzhou/midao",
	name = "�ܵ�",
	ways = {
		["out"] = "fuzhou/well",
	},
}
Room {
	id = "fuzhou/minzhai",
	name = "��լ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/xixiang",
	},
	room_relative="��լ-----������լ",
}
Room {
	id = "fuzhou/mishi",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["out"] = "fuzhou/midao",
	},
}
Room {
	id = "fuzhou/mupeng",
	name = "Сľ��",
	outdoor = "���ݳ�",
	ways = {
		["out"] = "fuzhou/rock",
	},
	room_relative="Сľ��ž���Сľ��",
}
Room {
	id = "fuzhou/nanjie",
	name = "�Ͻ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/nanmen",
		["north"] = "fuzhou/zhongxin",
	},
	room_relative="�����ģ��Ͻ֣������Ͻ�",
}
Room {
	id = "fuzhou/nanmen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "fuzhou/nanjie",
		["south"] = "fuzhou/bridge",
		 ["#fznm"] = "fuzhou/bridge",
	},
	--nolooks = {
		--["south"] = true,
	--},
	lengths = {
                ["south"] = "if MidNight[locl.time] or MidHsDay[locl.time] then return false else return 1 end",
                ["#fznm"] = "if tmp.find then return 3 else return false end",
	},
	room_relative="�Ͻ֣����ţ����ŵ�������",
}

Room {
	id = "fuzhou/road2",
	name = "ɽ·",
	outdoor = "���ݳ�",
		ways = {
		["southwest"] = "fuzhou/road3",
		["northeast"] = "ningbo/ttcsi",
	},
	room_relative="��ͯ���¨Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/road3",
	name = "ɽ·",
	outdoor = "���ݳ�",
		ways = {
	    ["southeast"] = "putian/road01",
		["southwest"] = "fuzhou/road4",
		["northeast"] = "fuzhou/road2",
			},
	  room_relative="ɽ·�Jɽ·�L�Kɽ·ɽ·ɽ·",
}
Room {
	id = "fuzhou/road4",
	name = "ɽ·",
	outdoor = "���ݳ�",
		ways = {
		["south"] = "fuzhou/road5",
		["northeast"] = "fuzhou/road3",
   		},
		room_relative="��֪������ɽ· ��֪������ ɽ·",
}
Room {
	id = "fuzhou/road5",
	name = "ɽ·",
	outdoor = "���ݳ�",
		ways = {
		["south"] = "fuzhou/road6",
		["north"] = "fuzhou/road4",
	},
	room_relative="ɽ·��ɽ·������ɽ·ɽ·",
}
Room {
	id = "fuzhou/road6",
	name = "����ɽ·",
	outdoor = "���ݳ�",
		ways = {
		["south"] = "fuzhou/beimen",
		["north"] = "fuzhou/road5",
	},
	objs = {
          ["Ұ��"] = "ye tu",
          ["���۽���"] = "baipao jianxia",
           },
		   room_relative="ɽ·������ɽ·����������ɽ·",
}
Room {
	id = "fuzhou/rock",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/island3",
		["enter"] = "fuzhou/mupeng",
	},
	room_relative="Сľ��ľ��ң�ɳ̲����",
}
Room {
	id = "fuzhou/shanpo",
	name = "ɽ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/wroad2",
	},
	objs = {
          ["Ұ��"] = "ye tu",
           },
  room_relative="ɽ�£�С·ɽ��",
}
Room {
	id = "fuzhou/shiqiao",
	name = "ʯ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xyxiang",
		["north"] = "fuzhou/dongjie",
	},
  room_relative="���֣�ʯ�ţ�������ʯ��",
}
Room {
	id = "fuzhou/well",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["down"] = "fuzhou/well1",
		["up"] = "fuzhou/houyuan",
	},
	room_relative="���ף���լ��Ժ����",
}
Room {
	id = "fuzhou/well1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["up"] = "fuzhou/well",
	},
}
Room {
	id = "fuzhou/wjiuguan",
	name = "С�ƹ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/wroad2",
	},
	objs = {
          ["���ϰ�"] = "sa laoban",
           },
	room_relative="С�ƹ�----С·С�ƹ�",
}
Room {
	id = "fuzhou/wroad",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "fuzhou/wroad2",
		["east"] = "fuzhou/ximen",
	},
	nolooks = {
		["east"] = true,
	},
	room_relative="С·�Iɽ·-----����ɽ·",
}
Room {
	id = "fuzhou/wroad10",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "foshan/xiaolu3",
		["east"] = "fuzhou/wroad9",
	},
	room_relative="ɽ·-----ɽ·��С·ɽ·",
}
Room {
	id = "fuzhou/wroad2",
	name = "С·",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "fuzhou/wroad",
		["southwest"] = "fuzhou/wroad3",
		["north"] = "fuzhou/shanpo",
		["west"] = "fuzhou/wjiuguan",
	},
	room_relative="ɽ�£�С�ƹ�-----С·�L�Kɽ·ɽ·С·",
}
Room {
	id = "fuzhou/wroad3",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad4",
		["northeast"] = "fuzhou/wroad2",
	},
	room_relative="С·�Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/wroad4",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "fuzhou/wroad3",
		["west"] = "group/entry/fzwroad5",
		["southwest"] = "putian/road02",
	},
	room_relative="ɽ·�Jɽ·-----ɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/wroad6",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad7",
		["northeast"] = "group/entry/fzwroad5",
	},
	room_relative="ɽ·�Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/wroad7",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad8",
		["northeast"] = "fuzhou/wroad6",
	},
	room_relative="ɽ·�Jɽ·�Lɽ·ɽ·",
}
Room {
	id = "fuzhou/wroad8",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad9",
		["northeast"] = "fuzhou/wroad7",
},
	objs = {
          ["����"] = "tiao fu",
	room_relative="ɽ·�Jɽ·�Lɽ·ɽ·",
	},
	
}
Room {
	id = "fuzhou/wroad9",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "fuzhou/wroad8",
		["west"] = "fuzhou/wroad10",
	},
	room_relative="ɽ·�Jɽ·-----ɽ·ɽ·",
}
Room {
	id = "fuzhou/xijie",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/biaoju",
		["east"] = "fuzhou/zhongxin",
		["north"] = "fuzhou/dangpu",
		["west"] = "fuzhou/xijie2",
	},
	objs = {
          ["֣��ͷ"] = "zheng biaotou",
          ["����"] = "jiang xu",
          ["ʷ��ͷ"] = "shi biaotou",
           },
   room_relative="���̣�����-----����-----�����ģ������ھ�����",
}
Room {
	id = "fuzhou/xijie2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xixiang3",
		["north"] = "fuzhou/xixiang2",
		["east"] = "fuzhou/xijie",
		["west"] = "fuzhou/ximen",
	},
	room_relative="���������-----����-----���֣���������",
}
Room {
	id = "fuzhou/ximen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/xijie2",
		["west"] = "fuzhou/wroad",
	},
	nolooks = {
		["west"] = true,
	},
	room_relative="ɽ·-----����-----��������",
}
Room {
	id = "fuzhou/xixiang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xixiang2",
		["east"] = "fuzhou/zahuopu",
		["west"] = "fuzhou/minzhai",
	},
	room_relative="��լ-----����-----�ӻ��̣���������",
}
Room {
	id = "fuzhou/xixiang2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xijie2",
		["north"] = "fuzhou/xixiang",
		["west"] = "fuzhou/yaopu",
	},
	room_relative="�����ҩ��-----�������������",
}
Room {
	id = "fuzhou/xixiang3",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xixiang4",
		["north"] = "fuzhou/xijie2",
		["west"] = "fuzhou/huadian",
	},
	room_relative="���֣�����-----�������������",
}
Room {
	id = "fuzhou/xixiang4",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/kezhan",
		["north"] = "fuzhou/xixiang3",
		["west"] = "fuzhou/chalou",
	},
	room_relative="�������¥-----����������ջ����",
}
Room {
	id = "fuzhou/xyxiang",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/xyxiang2",
		["north"] = "fuzhou/shiqiao",
		["east"] = "fuzhou/feiyuan",
	},
	room_relative="ʯ�ţ�������----��԰��������������",
}
Room {
	id = "fuzhou/xyxiang2",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "fuzhou/xyxiang",
		["east"] = "fuzhou/laozhai",
	},
	room_relative="�������������----������լ������",
}
Room {
	id = "fuzhou/yaopu",
	name = "ҩ��",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "fuzhou/xixiang2",
	},
	room_relative="ҩ��-----����ҩ��",
}
Room {
	id = "fuzhou/yuchuan1",
	name = "�洬",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan1",
		["east"] = "fuzhou/yuchuan2",
		["north"] = "fuzhou/yuchuan1",
		["west"] = "fuzhou/yuchuan1",
		["out"] = "fuzhou/yugang",
	},
}
Room {
	id = "fuzhou/yuchuan2",
	name = "�洬",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan2",
		["east"] = "fuzhou/yuchuan3",
		["north"] = "fuzhou/yuchuan2",
		["west"] = "fuzhou/yuchuan1",
	},
	room_relative="�洬���洬-----�洬-----�洬���洬�洬",
}
Room {
	id = "fuzhou/yuchuan3",
	name = "�洬",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan3",
		["east"] = "fuzhou/yuchuan4",
		["north"] = "fuzhou/yuchuan3",
		["west"] = "fuzhou/yuchuan2",
	},
}
Room {
	id = "fuzhou/yuchuan4",
	name = "�洬",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan4",
		["east"] = "fuzhou/yuchuan5",
		["north"] = "fuzhou/yuchuan4",
		["west"] = "fuzhou/yuchuan3",
	},
}
Room {
	id = "fuzhou/yuchuan5",
	name = "�洬",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan5",
		["enter"] = "fuzhou/fenduo1",
		["north"] = "fuzhou/yuchuan5",
		["east"] = "fuzhou/yuchuan2",
		["west"] = "fuzhou/yuchuan4",
	},
}
Room {
	id = "fuzhou/yugang",
	name = "�����ͷ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/yuchuan1",
		["enter"] = "fuzhou/yuchuan1",
		["west"] = "fuzhou/haigang",
	},
	room_relative="�洬�ĺ���---�����ͷ���洬�����ͷ",
}
Room {
	id = "fuzhou/zahuopu",
	name = "�ӻ���",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/xixiang",
	},
	objs = {
          ["�°���"] = "chen apo",
           },
	room_relative="����----�ӻ����ӻ���",
}
Room {
	id = "fuzhou/zhangfang",
	name = "�ھ��ʷ�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "fuzhou/biaoju",
	},
	objs = {
          ["���ʷ�"] = "zhang fang",
           },
	room_relative="�����ھ�---�ھ��ʷ��ھ��ʷ�",
}
Room {
	id = "fuzhou/zhengting",
	name = "�ھ�����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "fuzhou/biaoju",
	},
	objs = {
          ["������"] = "lin zhennan",
           },
	room_relative="�����ھ֣��ھ������ھ�����",
}
Room {
	id = "fuzhou/zhongxin",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "fuzhou/nanjie",
		["east"] = "fuzhou/dongjie",
		["north"] = "fuzhou/beijie",
		["west"] = "fuzhou/xijie",
	},
	room_relative="���֣�����----������----���֣��Ͻֳ�����",
}
Room {
	id = "gb/houyuan",
	name = "��Ժ",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/pomiao",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open door",
	},
	objs = {
          ["���߹�"] = "hong qigong",
           },
	
}
Room {
	id = "gb/island1",
	name = "С��",
	outdoor = "ؤ��",
	ways = {
		["north"] = "gb/island3",
	},
	room_relative="С��--С��",
}
Room {
	id = "gb/island2",
	name = "С��",
	outdoor = "ؤ��",
	ways = {
		["west"] = "gb/island1",
	},
	room_relative="С��--С��",
}
Room {
	id = "gb/island3",
	name = "ɳ̲",
	outdoor = "ؤ��",
	ways = {
		["north"] = "gb/rock",
		["east"] = "gb/island1",
		["west"] = "gb/island4",
	},
	room_relative="���ң�С��-----ɳ̲ɳ̲",
}
Room {
	id = "gb/island4",
	name = "ɳ̲",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/island5",
		["east"] = "gb/island3",
		["west"] = "gb/island1",
	},
	room_relative="ɳ̲��ɳ̲-----С��ɳ̲",
}
Room {
	id = "gb/island5",
	name = "ɳ̲",
	outdoor = "ؤ��",
	ways = {
		["eastup"] = "gb/lagoon",
		["north"] = "gb/island4",
	},
	room_relative="ɳ̲����ʯɳ̲",
}
Room {
	id = "gb/kongdi2",
	name = "�յ�",
	outdoor = "ؤ��",
	ways = {
		["east"] = "gb/xinglin9",
	},
	objs = {
          ["�³���"] = "chen zhanglao",
           },
	room_relative="�յ�-----�����ֿյ�",
}
Room {
	id = "gb/lagoon",
	name = "��ʯ",
	outdoor = "ؤ��",
	ways = {
		["westdown"] = "gb/island5",
	},
	room_relative="ɳ̲--��ʯ",
}
Room {
	id = "gb/liangcang1",
	name = "���",
	outdoor = "ؤ��",
	ways = {
		["northup"] = "gb/xiaodao",
		["south"] = "gb/liangcang2",
	},
	room_relative="С·���вֺ��",
}
Room {
	id = "gb/liangcang2",
	name = "�в�",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/liangcang3",
		["east"] = "gb/liangcang4",
		["north"] = "gb/liangcang1",
		["west"] = "gb/liangcang5",
	},
	room_relative="ǰ�֣����----��֣��Ҳ��в�",
}
Room {
	id = "gb/liangcang3",
	name = "ǰ��",
	outdoor = "ؤ��",
	ways = {
		["north"] = "gb/liangcang2",
	},
	room_relative="�в�--ǰ��",
}
Room {
	id = "gb/liangcang4",
	name = "���",
	outdoor = "ؤ��",
	ways = {
		["west"] = "gb/liangcang2",
	},
	room_relative="�в�--ǰ��",
}
Room {
	id = "gb/liangcang5",
	name = "�Ҳ�",
	outdoor = "ؤ��",
	ways = {
		["east"] = "gb/liangcang2",
	},
	room_relative="�в�--�Ҳ�",
}
Room {
	id = "gb/mupeng",
	name = "Сľ��",
	outdoor = "ؤ��",
	ways = {
		["out"] = "gb/rock",
	},
	room_relative="����--Сľ��",
}
Room {
	id = "gb/pomiao",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/xinglin9",
		["north"] = "gb/houyuan",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["³�н�"] = "lu youjiao",
           },
	
}
Room {
	id = "gb/rock",
	name = "����",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/island3",
		["enter"] = "gb/mupeng",
	},
	room_relative="Сľ���ɳ̲����",
}
Room {
	id = "gb/tianjing",
	name = "�ﾶ",
	outdoor = "ؤ��",
	ways = {
		["east"] = "suzhou/qsgdao6",
		["north"] = "gb/xinglin1",
	},
	room_relative="�����֣��ﾶ-----���ݱ����ﾶ",
}
Room {
	id = "gb/xiaodao",
	name = "С·",
	outdoor = "ؤ��",
	ways = {
		["northup"] = "gb/yading",
		["southdown"] = "gb/liangcang1",
	},
	room_relative="�¶������С·",
}
Room {
	id = "gb/xinglin1",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
		["east"] = "gb/xinglin2",
	--	["north"] = "gb/xinglin1",
	--	["west"] = "gb/xinglin1",
	},
}
Room {
	id = "gb/xinglin2",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin3",
	--	["east"] = "gb/xinglin2",
	--	["west"] = "gb/xinglin2",
	},
}
Room {
	id = "gb/xinglin3",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
	--	["east"] = "gb/xinglin3",
	--	["north"] = "gb/xinglin3",
		["west"] = "gb/xinglin4",
	},
}
Room {
	id = "gb/xinglin4",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin5",
	--	["east"] = "gb/xinglin4",
	--	["west"] = "gb/xinglin4",
	},
}
Room {
	id = "gb/xinglin5",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
		["east"] = "gb/xinglin6",
	--	["north"] = "gb/xinglin5",
	--	["west"] = "gb/xinglin5",
	},
}
Room {
	id = "gb/xinglin6",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
	--	["north"] = "gb/xinglin6",
	--	["east"] = "gb/xinglin6",
		["west"] = "gb/xinglin7",
	},
}
Room {
	id = "gb/xinglin7",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/tianjing",
		["north"] = "gb/xinglin8",
	--	["east"] = "gb/xinglin7",
	--	["west"] = "gb/xinglin7",
	},
}
Room {
	id = "gb/xinglin8",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/xinglin7",
		["north"] = "gb/xinglin9",
	},
	objs = {
         ["������"] = "bai shijing",
          ["�γ���"] = "song zhanglao",
           },
	room_relative="�����֣������֣�������������",
}
Room {
	id = "gb/xinglin9",
	name = "������",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/xinglin8",
		["north"] = "gb/pomiao",
		["west"] = "gb/kongdi2",
	},
	objs = {
          ["������"] = "liang zhanglao",
           },
	room_relative="��������յ�----�����֣�������������",
}
Room {
	id = "gb/yading",
	name = "�¶�",
	outdoor = "ؤ��",
	ways = {
		["down"] = "nanyang/duanya",
		["southdown"] = "gb/xiaodao",
	},
	room_relative="���£�С·�¶�",
}
Room {
	id = "gb/zhongjun1",
	name = "�о�ԯ��",
	outdoor = "ؤ��",
	ways = {
		["north"] = "gb/zhongjun2",
	},
	room_relative="�о�--�о�ԯ��",
}
Room {
	id = "gb/zhongjun2",
	name = "�о�",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/zhongjun1",
		["north"] = "gb/zhongjun3",
	},
	room_relative="�о�ԯ�ţ��о��о�",
}
Room {
	id = "gb/zhongjun3",
	name = "�о�",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/zhongjun2",
		["north"] = "gb/zhongjun4",
	},
	room_relative="�о����о��о�",
}
Room {
	id = "gb/zhongjun4",
	name = "�о�",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/zhongjun3",
		["north"] = "gb/zhongjun5",
	},
	room_relative="�о����о��о�",
}
Room {
	id = "gb/zhongjun5",
	name = "�о�����",
	outdoor = "ؤ��",
	ways = {
		["south"] = "gb/zhongjun4",
	},
	room_relative="�о��о�",
}
Room {
	id = "group/cailiao-hang",
	outdoor = "�ɶ���",
	name = "������",
	ways = {
		["south"] = "chengdu/ddajie1",
	},
	objs = {
          ["���ƹ�"] = "wang zhanggui",
           },
	room_relative="�����У�����ֲ�����",
}
Room {
	id = "group/entry/caeroad3",
	name = "��·",
	outdoor = "������",
	ways = {
		["southeast"] = "village/shilu5",
		["west"] = "changan/eastroad2",
	},
	room_relative="��֪��������· ��֪������ ��·",
}
Room {
	id = "group/entry/canroad6",
	name = "��·",
	outdoor = "������",
	ways = {
		["southwest"] = "changan/northroad5",
		["northdown"] = "changan/northroad7",
	},
      lengths = {
	    ["northdown"] = "if job.name and job.name=='husong' then exe('northdown') end",
		},
	room_relative="��֪��������· ��֪������ ��·",

}
Room {
	id = "group/entry/cderoad4",
	name = "���",
	outdoor = "�ɶ���",
	ways = {
		["east"] = "xiangyang/xiaolu2",
		["west"] = "chengdu/eroad3",
	},
	room_relative="��֪�������� ��֪������ ���",
}
Room {
	id = "group/entry/cdtulu2",
	name = "��·",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "chengdu/tulu1",
		["northeast"] = "chengdu/tulu3",
	},
room_relative="��·-----����ɽ����",
}
Room {
	id = "group/entry/czeroad3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "cangzhou/eroad2",
		["northeast"] = "cangzhou/eroad4",
	},
	room_relative="��֪���������� ��֪������ �����",
}
Room {
	id = "group/entry/czwroad2",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "cangzhou/wroad3",
		["east"] = "cangzhou/wroad1",
	},
	room_relative="��֪��������� ��֪������ ���",
}
Room {
	id = "group/entry/dleyd",
	name = "���Ӷ�",
	outdoor = "����Ƕ�",
	ways = {
		["enter"] = "dali/dalieast/ydk",
		["northdown"] = "dali/dalieast/chengj",
	},
}
Room {
	id = "group/entry/dlndao2",
	name = "���",
	outdoor = "����Ǳ�",
	ways = {
		["south"] = "dali/dadao3",
		["north"] = "dali/dadao1",
	},
	room_relative="��֪�������� ��֪������ ���",
}
Room {
	id = "group/entry/dlndao5",
	name = "���",
	outdoor = "�����",
	ways = {
		["southeast"] = "dali/yuxu/shangang",
		["west"] = "dali/yuxu/guanmen",
	},
	room_relative="ɽ�ڣ�������ţ����",
}
Room {
	id = "group/entry/dlstulin",
	name = "����",
	outdoor = "�������",
	ways = {
		["southup"] = "dali/dalisouth/xiushan",
		["north"] = "dali/dalisouth/dg1",
		["west"] = "dali/yideng/fanpu",
	},
	room_relative="��֪���������� ��֪������ ����",
}
Room {
	id = "group/entry/dlwqunsh",
	name = "÷��ѩɽ",
	outdoor = "�������",
	ways = {
		["southeast"] = "dali/daliwest/futiao",
		["southwest"] = "dali/daliwest/tianchi1",
	},
	room_relative="����Ͽ����أ�÷��ѩɽ",
}
Room {
	id = "group/entry/fsroad13",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["southwest"] = "foshan/road11",
		["northeast"] = "foshan/road14",
	},
	room_relative="��֪�������ּ�� ��֪������ �ּ��",
}
Room {
	id = "group/entry/fsroad5",
	name = "�ּ��",
	outdoor = "��ɽ��",
	ways = {
		["northeast"] = "foshan/road4",
		["west"] = "foshan/road6",
	},
	room_relative="��֪�������ּ�� ��֪������ �ּ��",
}

Room {
	id = "group/entry/fzwroad5",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "fuzhou/wroad6",
		["east"] = "fuzhou/wroad4",
	},
	room_relative="��֪������ɽ· ��֪������ ɽ·",
}
Room {
	id = "group/entry/gmchang",
	name = "���Ϲ㳡",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "gumu/jishi",
		["northwest"] = "gumu/xiaolu2",
	},
	room_relative="��֪���������Ϲ㳡 ��֪������ ���Ϲ㳡",
}
Room {
	id = "group/entry/hhshulin5",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["southeast"] = "huanghe/shulin4",
		["northeast"] = "huanghe/tiandi2",
		["west"] = "huanghe/shulin6",
	},
	room_relative="��֪���������� ��֪������ ����",
}
Room {
	id = "group/entry/hjroad",
	name = "С·",
	outdoor = "�ؽ���ԭ",
	ways = {
		["westup"] = "hj/shanqiu",
		["east"] = "hj/pmchang",
	},
	room_relative="��֪������С· ��֪������ С·",
}
Room {
	id = "group/entry/hmyroad2",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["eastup"] = "hmy/pingding/road3",
		["southwest"] = "hmy/pingding/road1",
	},
	room_relative="��֪��������· ��֪������ ��·",
}
Room {
	id = "group/entry/hmyroad8",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["southeast"] = "hmy/pingding/road9",
		["west"] = "hmy/pingding/road7",
	},
room_relative="��֪��������· ��֪������ ��·",
}
Room {
	id = "group/entry/hzqsd7",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/beimen",
		["north"] = "hz/shanlu3",
	},
	room_relative="��֪��������ʯ��� ��֪������ ��ʯ���",
}
Room {
	id = "group/entry/klclin1",
	name = "ѩɽ����",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "fairyland/conglin2",
		["eastdown"] = "fairyland/shanxi",
	},
	room_relative="��֪������ѩɽ���� ��֪������ ѩɽ����",
}
Room {
	id = "group/entry/lzroad1",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/road5",
		["northeast"] = "lanzhou/jingyuan",
	},
	room_relative="��֪�������� ��֪������ ���",
}
Room {
	id = "group/entry/lzshixia",
	name = "ʯϿ��",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/tumenzi",
		["northeast"] = "lanzhou/bingcao",
	},
	room_relative="��֪������ʯϿ�� ��֪������ ʯϿ��",
}
Room {
	id = "group/entry/lzsroad3",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/qingcheng",
		["northwest"] = "lanzhou/sroad2",
	    },
        room_relative="��֪�������� ��֪������ ���",
	}
Room {
	id = "group/entry/mjshamo1",
	name = "��ɳĮ",
	outdoor = "˿��֮·",
	ways = {
		["northeast"] = "xingxiu/silk6",
		["west"] = "mingjiao/shaqiu1",
	},
	room_relative="˿��֮·��Сɳ���ɳĮ",
}
Room {
	id = "group/entry/mjshan2",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["south"] = "miaojiang/shandao2",
		["northeast"] = "xiangyang/hunanroad2",
	},
 room_relative="��֪������ɽ· ��֪������ ɽ·",
}
Room {
	id = "group/entry/nbqsddao",
	name = "��ʯ�ٵ�",
	outdoor = "������",
	ways = {
		["southeast"] = "ningbo/shilu",
		["northwest"] = "ningbo/qsddao1",
	},
	room_relative="��֪��������ʯ�ٵ� ��֪������ ��ʯ�ٵ�",
}
Room {
	id = "group/entry/slxiaoj1",
	name = "ɽ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/xiaojing2",
		["east"] = "shaolin/shijie1",
	},
	room_relative="��֪������ɽ�� ��֪������ ɽ��",
}
Room {
	id = "group/entry/sztulu2",
	name = "��·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/jiangbian",
		["northeast"] = "suzhou/tulu1",
	},
	room_relative="��֪��������· ��֪������ ��·",
}
Room {
	id = "group/entry/thdroad1",
	name = "��·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["southeast"] = "thd/niujia/road2",
		["north"] = "thd/niujia/road",
	},
	room_relative="��֪��������· ��֪������ ��·",
}
Room {
	id = "group/entry/tsyidao3",
	name = "�����",
	outdoor = "̩ɽ",
	ways = {
		["north"] = "taishan/daizong",
		["west"] = "taishan/yidao2",
	},
	room_relative="��֪���������� ��֪������ �����",
}
Room {
	id = "group/entry/wdroad7",
	name = "����·",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/wdroad6",
		["west"] = "wudang/wdroad8",
	},
	room_relative="��֪���������· ��֪������ ����·",
}
Room {
	id = "group/entry/xstulu2",
	name = "�ر���·",
	outdoor = "��ѩɽ",
	ways = {
		["southwest"] = "xueshan/tulu3",
		["northeast"] = "xueshan/tulu1",
	},
	room_relative="��֪������ر���· ��֪������ �ر���·",
}
Room {
	id = "group/entry/xsxiao2",
	name = "����С·",
	outdoor = "��ѩɽ",
	ways = {
		["northwest"] = "xueshan/xiaolu1",
		["east"] = "xueshan/xiaolu3",
	},
	room_relative="��֪���������С· ��֪������ ����С·",
}
Room {
	id = "group/entry/yzeroad1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "city/eroad2",
		["west"] = "city/dongmen",
	},
	room_relative="��֪���������� ��֪������ �����",
}
Room {
	id = "gumu/bzy",
	name = "������",
	ways = {
		["southup"] = "gumu/lyy",
		["eastdown"] = "gumu/ryy",
	},
	room_relative="�����ҡ������ҡ������ұ�����",
}
Room {
	id = "gumu/dongkou",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "gumu/shanxia",
	},
	room_relative="����ɽ��--����",
}
Room {
	id = "gumu/fang",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/gmcc",
		["open door;east"] = "gumu/yaofang",
		["open door;north"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/fchuan",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "xiangyang/shanxiroad1",
		["west"] = "gumu/xiaolu1",
	},
	room_relative="���С·-----����-----��·����",
}
Room {
	id = "gumu/gmanhe1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "gumu/sshi1",
		["westdown"] = "gumu/gmql1",
	},
}
Room {
	id = "gumu/gmanhe2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "gumu/dongkou",
		["eastdown"] = "gumu/gmql2",
	},
}
Room {
	id = "gumu/gmcc",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["open door;north"] = "gumu/fang",
	},
}
Room {
	id = "gumu/gmht",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/gmws",
		["open door;north"] = "gumu/gmws1",
		["open door;east"] = "gumu/gmqs",
		["open door;west"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg1",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["open door;enter"] = "gumu/gmlg4",
		["open door;north"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg2",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/gmzt",
	},
}
Room {
	id = "gumu/gmlg4",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/gmlg5",
		["out"] = "gumu/gmlg1",
	},
}
Room {
	id = "gumu/gmlg5",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["north"] = "gumu/gmlg4",
	},
}
Room {
	id = "gumu/gmlw",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/gmqt",
	},
}
Room {
	id = "gumu/gmqc",
	name = "�д���",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["open door;north"] = "gumu/gmqt",
	},
}
Room {
	id = "gumu/gmql1",
	name = "Ǳ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "gumu/gmanhe1",
		["west"] = "gumu/gmql2",
	},
}
Room {
	id = "gumu/gmql2",
	name = "Ǳ��",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "gumu/gmanhe2",
		["east"] = "gumu/gmql1",
	},
}
Room {
	id = "gumu/gmqs",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/fang",
		["open door;east"] = "gumu/shitou",   
		["open door;north"] = "gumu/jianshi",
		["open door;west"] = "gumu/gmht",
	},
}
Room {
	id = "gumu/gmqt",
	name = "ǰ��",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/gmqc",
		["open door;east"] = "gumu/gmzt",
		["open door;north"] = "gumu/gmlw",
		["open door;out"] = "gumu/rukou",
	},
}
Room {
	id = "gumu/gmws",
	name = "��Ϣ��",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["north"] = "gumu/gmht",
	},
}
Room {
	id = "gumu/gmws1",
        name = "����",
		outdoor = "����ɽ",
        ways = {
                ["south"] = "gumu/gmht",
                ["tang bed;ban shiban"] = "gumu/ss0",
        },
        nolooks = {
                ["tang bed;ban shiban"] = true,
        },
}
Room {
	id = "gumu/gmzt",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["open door;south"] = "gumu/gmlg1",
		["open door;north"] = "gumu/gmlg2",
		["open door;east"] = "gumu/gmht",
		["open door;west"] = "gumu/gmqt",
		["zong bian"] = "gumu/bianhou",
	},
	nolooks = {
        ["zong bian"] = true,
    },
}
Room {
	id = "gumu/bianhou",
	name = "�Һ�",
	outdoor = "����ɽ",
	ways = {
		["jump down"] = "gumu/gmzt",
	},
	nolooks = {
        ["jump down"] = true,
    },
}
Room {
	id = "gumu/guolin1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/guoyuan",
		["north"] = "gumu/guolin1",
		["east"] = "gumu/guolin1",
		["west"] = "gumu/guolin2",
	},
}
Room {
	id = "gumu/guolin2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/guolin2",
		["east"] = "gumu/guolin3",
		["north"] = "gumu/guolin2",
		["west"] = "gumu/guolin2",
	},
}
Room {
	id = "gumu/guolin3",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/guolin4",
		["north"] = "gumu/guolin3",
		["east"] = "gumu/guolin3",
		["west"] = "gumu/guolin3",
	},
}
Room {
	id = "gumu/guolin4",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/guolin4",
		["east"] = "gumu/huacong",
		["north"] = "gumu/guolin4",
		["west"] = "gumu/guolin4",
	},
}
Room {
	id = "gumu/guolin5",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "gumu/guoyuan",
	},
}
Room {
	id = "gumu/guoyuan",
	name = "��԰",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "gumu/shanpo",
		["south"] = "gumu/rukou",
		["north"] = "gumu/guolin1",
		["west"] = "gumu/guolin5",
	},
}
Room {
	id = "gumu/huacong",
	name = "�컨��",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["south"] = "gumu/guolin5",
		["west"] = "gumu/guolin4",
	},
}
Room {
	id = "gumu/jianshi",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/jishi",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "group/entry/gmchang",
	},
	room_relative="���Ϲ㳡�I���м���",
}
Room {
	id = "gumu/jlg",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "gumu/ztm",  
		["southup"] = "gumu/ryy",
	},
	objs = {
          ["����"] = "ma yu",
     },
	 room_relative="�����š�������������ҽ�����",
}
Room {
	id = "gumu/jqg/boat2",
	name = "С��",
	outdoor = "�����",
	ways = {
		["out"] = "gumu/jqg/xiaoxi",  
	},
	
}
Room {
	id = "gumu/jqg/boat5",
	name = "С��",
	outdoor = "�����",
	ways = {
		["out"] = "gumu/jqg/xibian",
	},
}
Room {
	id = "gumu/jqg/cave3",
	name = "��",
	outdoor = "�����",
	ways = {
		["west"] = "gumu/jqg/shiyao",
	},
}
Room {
	id = "gumu/jqg/danfang",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/lang2",
	},
	
}
Room {
	id = "gumu/jqg/dashi",
	name = "����",
	outdoor = "�����",
	ways = {
		["west"] = "gumu/jqg/xiaoshi",
	},
	objs = {
          ["С��Ů"] = "xiao longnv",
           },
	room_relative="С��-----���Ҵ���",
}
Room {
	id = "gumu/jqg/dating",
	name = "����",
	outdoor = "�����",
	ways = {
		["out"] = "gumu/jqg/shiwu",
		["#goHt"] = "gumu/jqg/houtang",
	},
	nolooks = {
		["#goHt"] = true,
	},
	lengths = {
		["#goHt"] = "if hp.exp < 200000 then return false else return 1 end",
	},
	
}
Room {
	id = "gumu/jqg/fyy",
	name = "������",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/shanjing",
		["southdown"] = "gumu/jqg/xqx",
	},
	room_relative="ɽ���������������",
}
Room {
	id = "gumu/jqg/glt",
	name = "����ͤ",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/xqx",
		["southdown"] = "gumu/jqg/xiaoxi",
	},
	room_relative="����鿣����������ͤ",
}
Room {
	id = "gumu/jqg/houtang",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/dating",
		["north"] = "gumu/jqg/lang1",
	},
	room_relative="���ȣ����ã���������",
}
Room {
	id = "gumu/jqg/huacong",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["west"] = "gumu/jqg/xiaolu",
	},
	room_relative="����С·-----���Ի���",
}
Room {
	id = "gumu/jqg/huayuan",
	name = "��԰",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/lang1",
	},
	room_relative="��԰�����Ȼ�԰",
}
Room {
	id = "gumu/jqg/jianshi",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/lang5",
	},
	
}
Room {
	id = "gumu/jqg/lang1",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/houtang",  
		["east"] = "gumu/jqg/lang2",
		["north"] = "gumu/jqg/huayuan",
		["west"] = "gumu/jqg/lang4",
	},
	room_relative="��԰�����᳤��-----����-----���᳤�ȣ����ó���",
}
Room {
	id = "gumu/jqg/lang2",
	name = "���᳤��",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/lgf",
		["east"] = "gumu/jqg/lang3",
		["north"] = "gumu/jqg/danfang",
		["west"] = "gumu/jqg/lang1",  
	},
	room_relative="����������---���᳤��---���᳤�ȣ����������᳤��",
}
Room {
	id = "gumu/jqg/lang3",
	name = "���᳤��",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/shufang",
		["west"] = "gumu/jqg/lang2",   
	},
	room_relative="���᳤��---���᳤��---�鷿���᳤��",
}
Room {
	id = "gumu/jqg/lang4",
	name = "���᳤��",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/sleep2",
		["north"] = "gumu/jqg/sleep1",
		["east"] = "gumu/jqg/lang1",
		["west"] = "gumu/jqg/lang5",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	room_relative="��Ϣ�ң����᳤��---���᳤��---���ȣ���Ϣ�����᳤��",
}
Room {
	id = "gumu/jqg/lang5",
	name = "���᳤��",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/zhifang",
		["east"] = "gumu/jqg/lang4",
		["north"] = "gumu/jqg/jianshi",
	},
	lengths = {
		["north"] = "if not skills['dodge'] or skills['dodge'].lvl>130 then return 1 else return false end",
	},
	room_relative="���ң����᳤��---���᳤�ȣ�֥�����᳤��",
}
Room {
	id = "gumu/jqg/lgf",
	name = "������",
	outdoor = "�����",
	ways = {
		["north"] = "gumu/jqg/lang2",  
	},
	room_relative="���᳤�ȣ�������������",
}
Room {
	id = "gumu/jqg/qsroad",
	name = "��ʯ��·",
	outdoor = "�����",
	ways = {
		["eastup"] = "gumu/jqg/shuitang",
		["north"] = "gumu/jqg/shiwu",
	},
	room_relative="��ʯ�ݣ���ʯ��·��ˮ����ʯ��·",
}
Room {
	id = "gumu/jqg/shanding",
	name = "ɽ��ƽ��",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/shanlu4",
		["southdown"] = "gumu/jqg/shanjing1",
		["northdown"] = "gumu/jqg/zhulinn",
		["west"] = "gumu/jqg/xshiwu",
	},
	room_relative="ˮ����Сʯ��---ɽ��ƽ��---ɽ·��ɽ��ɽ��ƽ��",
}
Room {
	id = "gumu/jqg/shanjing",
	name = "ɽ��",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/shanjing1",
		["southdown"] = "gumu/jqg/fyy",
	},
	room_relative="ɽ����������ɽ��",
}
Room {
	id = "gumu/jqg/shanjing1",
	name = "ɽ��",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/shanding",
		["southdown"] = "gumu/jqg/shanjing",  
	},
	room_relative="ɽ��ƽ�أ�ɽ��ɽ��",
}
Room {
	id = "gumu/jqg/shanlu1",
	name = "ɽ��С·",
	outdoor = "�����",
	ways = {
		["southeast"] = "gumu/jqg/shanlu2",
		["north"] = "gumu/jqg/xibian",
	},
room_relative="СϪ�ߣ�ɽ��С·�Kɽ��С·ɽ��С·",
}
Room {
	id = "gumu/jqg/shanlu10",
	name = "�ϳ���",
	outdoor = "�����",
	ways = {
		["westdown"] = "gumu/jqg/shanlu9",
		["l ya;jump qiaobi;xiao"] = "gumu/jqg/tanan",
		["l ya;jump qiaobi"] = "gumu/jqg/qiaobi",
	},
	nolooks = {
		["l ya;jump qiaobi;xiao"] = true,
		["l ya;jump qiaobi"] = true,
	},
	lengths = {
		["l ya;jump qiaobi;xiao"] = "if score.party and score.party=='��Ĺ��' and job.name~='tdh' then return 10 else return false end",
		["l ya;jump qiaobi"] = "if score.party and score.party~='��Ĺ��' and job.name=='tdh' then return false else return 10 end",
	},
	
}
Room {
	id = "gumu/jqg/qiaobi",
	name = "�ͱ�",
	outdoor = "�����",
	ways = {
		["#Togudi"] = "gumu/jqg/gudi",
		["jump back"] = "gumu/jqg/shanlu10",
	},
	nolooks = {
		["#Togudi"] = true,
		["jump back"] = true,
	},
	lengths = {
		["#Togudi"] = 100,
		["jump back"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/yabi",
	name = "�±�",
	outdoor = "�����",
	ways = {
		["#Goyadi"] = "gumu/jqg/gudi",
		["#Goqiaobi"] = "gumu/jqg/qiaobi",
	},
	nolooks = {
		["#Goyadi"] = true,
		["#Goqiaobi"] = true,
	},
	lengths = {
		["#Goyadi"] = 100,
		["#Goqiaobi"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/gudishuitan",
	name = "�ȵ�ˮ̶",
	outdoor = "�����",
	ways = {
		["#Hyadi"] = "gumu/jqg/gudi",
	},
	nolooks = {
		["#Hyadi"] = true,
	},
	lengths = {
		["#Hyadi"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/shuiditongdao",
	name = "ˮ��ͨ��",
	outdoor = "�����",
	ways = {
		["#qQydok"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["#qQydok"] = true,
	},
	lengths = {
		["#qQydok"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/shuitanbiaomian",
	name = "ˮ̶����",
	outdoor = "�����",
	ways = {
		["pa up"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["pa up"] = true,
	},
	lengths = {
		["pa up"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/gudi",
	name = "�ȵ�",
	outdoor = "�����",
	ways = {
		["#Toqiaobi"] = "gumu/jqg/qiaobi",
		["#Totanan"] = "gumu/jqg/tanan",
	},
	nolooks = {
		["#Toqiaobi"] = true,
		["#Totanan"] = true,
	},
	lengths = {
		["#Toqiaobi"] = 100,
		["#Totanan"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/shanlu2",
	name = "ɽ��С·",
	outdoor = "�����",
	ways = {
		["southeast"] = "gumu/jqg/shanlu3",
		["northwest"] = "gumu/jqg/shanlu1",
	},
	room_relative="ɽ��С·�Iɽ��С·�Kɽ��С·ɽ��С·",
}
Room {
	id = "gumu/jqg/shanlu3",
	name = "ɽ��С·",
	outdoor = "�����",
	ways = {
		["south"] = "xiangyang/outwroad1",
		["northwest"] = "gumu/jqg/shanlu2",
	},
	room_relative="ɽ��С·�Iɽ��С·��������ɽ��С·",
}
Room {
	id = "gumu/jqg/shanlu4",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/shanlu5",
		["west"] = "gumu/jqg/shanding",
	},
	room_relative="ɽ·��ɽ��ƽ��ɽ·",
}
Room {
	id = "gumu/jqg/shanlu5",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/shanlu6",
		["eastup"] = "gumu/jqg/shanlu9",
		["west"] = "gumu/jqg/shanlu4",  
	},
	
}
Room {
	id = "gumu/jqg/shanlu6",
	name = "�����",
	outdoor = "�����",
	ways = {
		["southdown"] = "gumu/jqg/shanlu5",
	},
	
}
Room {
	id = "gumu/jqg/shanlu9",
	name = "ɽ·",
	outdoor = "�����",
	ways = {
		["westdown"] = "gumu/jqg/shanlu5",
		["eastup"] = "gumu/jqg/shanlu10",
	},
	
}
Room {
	id = "gumu/jqg/shiwu",
	name = "��ʯ��",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/qsroad",
		["enter"] = "gumu/jqg/dating",
	},
	blocks = {
		["enter"] = {
			{id = "fan yiweng", exp = 400000},
		},
       
	},
	
}
Room {
	id = "gumu/jqg/shiyao",
	name = "ʯ��",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/cave3",
	},
}
Room {
	id = "gumu/jqg/shufang",
	name = "�鷿",
	outdoor = "�����",
	ways = {
		["west"] = "gumu/jqg/lang3",
	},
	room_relative="���᳤��-----�鷿�鷿",
}
Room {
	id = "gumu/jqg/shuitang",
	name = "ˮ��",
	outdoor = "�����",
	ways = {
		["#jqgzlout"] = "gumu/jqg/shanding",
		["westdown"] = "gumu/jqg/qsroad",
	},
	nolooks = {
		["#jqgzlout"] = true,
		["eastup"] = true,
	},
	lengths = {
		["#jqgzlout"] = 100,
	},
	
}
Room {
	id = "gumu/jqg/sleep1",
	name = "��Ϣ��",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/lang4",  
	},
	
}
Room {
	id = "gumu/jqg/sleep2",
	name = "��Ϣ��",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["north"] = "gumu/jqg/lang4",  
	},
	
}
Room {
	id = "gumu/jqg/tanan",
	name = "ˮ̶����",
	outdoor = "�����",
	ways = {
		["north"] = "gumu/jqg/xiaolu",
		["xiao;jump back"] = "gumu/jqg/shanlu10", 
		["#Hgudi"] = "gumu/jqg/gudi",  
	},
	nolooks = {
		["xiao;jump back"] = true,
		["#Hgudi"] = true,
	},
	lengths = {
		["xiao;jump back"] = "if score.party and score.party=='��Ĺ��' then return 10 else return false end",
		["#Hgudi"] = "if score.party and score.party=='��Ĺ��' then return false else return 10 end",
	},
	
}
Room {
	id = "gumu/jqg/wshi",
	name = "����",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["south"] = "gumu/jqg/zhongtang",
	},
	room_relative="���ң���������",
}
Room {
	id = "gumu/jqg/xiaolu",
	name = "����С·",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/tanan",  
		["enter"] = "gumu/jqg/zhongtang",
		["east"] = "gumu/jqg/huacong",
	},
	room_relative="���áĹ���С·---���ԣ�ˮ̶���߹���С·",
}
Room {
	id = "gumu/jqg/xiaoshi",
	name = "С��",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/dashi",
		["west"] = "gumu/jqg/zhongtang",
	},
	objs = {
          ["���"] = "yang guo",
           },
	room_relative="����-----С��-----����С��",
}
Room {
	id = "gumu/jqg/xiaoxi",
	name = "������",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/glt",
		["#jqgout"] = "gumu/jqg/xibian",
	},
	nolooks = {
		["#jqgout"] = true,
	},
	lengths = {
		["#jqgout"] = 200,
	},
	
}
Room {
	id = "gumu/jqg/xibian",
	name = "СϪ��",
	outdoor = "�����",
	ways = {
		["south"] = "gumu/jqg/shanlu1",
		["#jqgin"] = "gumu/jqg/xiaoxi",  
	},
	nolooks = {
		["#jqgin"] = true,
	},
	lengths = {
		["#jqgin"] = 200,
	},
	
}
Room {
	id = "gumu/jqg/xqx",
	name = "�����",
	outdoor = "�����",
	ways = {
		["northup"] = "gumu/jqg/fyy",
		["west"] = "gumu/jqg/glt",
	},
	
}
Room {
	id = "gumu/jqg/xshiwu",
	name = "Сʯ��",
	outdoor = "�����",
	no_fight = true,
	ways = {
		["east"] = "gumu/jqg/shanding",
	},
	
}
Room {
	id = "gumu/jqg/zhifang",
	name = "֥��",
	outdoor = "�����",
	ways = {
		["north"] = "gumu/jqg/lang5",  
	},
	room_relative="���᳤�ȣ�֥��֥��",
}
Room {
	id = "gumu/jqg/zhongtang",
	name = "����",
	outdoor = "�����",
	ways = {
		["east"] = "gumu/jqg/xiaoshi",  
		["north"] = "gumu/jqg/wshi",
		["out"] = "gumu/jqg/xiaolu",   
	},
	room_relative="���ң�����-----С�ҡŹ���С·����",
}
Room {
	id = "gumu/jqg/zhulinn",
	name = "����",
	outdoor = "�����",
	ways = {
		["#jqgzlin"] = "gumu/jqg/shuitang",   
		["#jqgzlout"] = "gumu/jqg/shanding",
	},
	lengths = {
		["#jqgzlin"] = 50,
		["#jqgzlout"] = 50,
	},
	
}
Room {
	id = "gumu/lgf",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/shitou",
	},
	
}
Room {
        id = "gumu/lingshi",
        name = "����",
		outdoor = "����ɽ",
        ways = {
                ["out"] = "gumu/ss5",
                ["get fire;tui guangai;tang guan;use fire;search;search;search;search;search;search;search;search;search;turn ao left;#walkBusy;ti up"] = "gumu/sshi1",
                ["get fire;tui guangai;tang guan"] = "gumu/shiguan",
        },
        nolooks = {
                ["get fire;tui guangai;tang guan;use fire;search;search;search;search;search;search;search;search;search;turn ao left;#walkBusy;ti up"] = true,
                ["get fire;tui guangai;tang guan"] = true,
        },
}
Room {
	id = "gumu/lyy",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["east"] = "gumu/shulin1",
		["northdown"] = "gumu/bzy",
	},
	room_relative="�����ҡ�������----����������",
}
Room {
	id = "gumu/rukou",
	name = "��Ĺ",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/xuanya",
		["enter"] = "gumu/gmqt",
		["north"] = "gumu/guoyuan",
	},
	room_relative="���£�ǰ��--��԰��Ĺ",
}
Room {
	id = "gumu/ryy",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "gumu/bzy",
		["northdown"] = "gumu/jlg",
	},
	room_relative="������������ҡ�������������",
}
Room {
	id = "gumu/shanlu1",
	name = "ɽ´",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "gumu/shanlu2",
		["northdown"] = "gumu/xiaolu3",
	},
	room_relative="���С����ɽ´���ڶ�ɽ´",
}
Room {
	id = "gumu/shanlu2",
	name = "�ڶ�",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "gumu/shanlu3",
		["northdown"] = "gumu/shanlu1",
	},
	room_relative="ɽ´���ڶ���ɽ·�ڶ�",
}
Room {
	id = "gumu/shanlu3",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "gumu/ztm",
		["northdown"] = "gumu/shanlu2",
	},
	room_relative="�ڶ���ɽ·��������ɽ·",
}
Room {
	id = "gumu/shanpo",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "gumu/guoyuan",
		["northeast"] = "gumu/shanpo1",
	},
	room_relative="�����ţ���԰ɽ��",
}
Room {
	id = "gumu/shanpo1",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "gumu/shanpo",
	},
	room_relative="ɽ�£�ɽ��",
}
Room {
	id = "gumu/shanxia",
	name = "����ɽ��",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "gumu/xiaolu3",
		["enter"] = "gumu/dongkou",
	},
	room_relative="���С�����ڨI������ɽ������ɽ��",
}

Room {
        id = "gumu/shengou",
        name = "�",
		outdoor = "����ɽ",
        ways = {
                ["west"] = "gumu/shulin2",
                ["tiao gou"] = "gumu/rukou",
        },
        nolooks = {
                ["tiao gou"] = true,
        },
        lengths = {
                ["tiao gou"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
        },
        objs = {
          ["������"] = "sun popo",
     },
}

Room {
	id = "gumu/shiguan",
	name = "ʯ����",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["out"] = "gumu/lingshi",
	},
}
Room {
	id = "gumu/shitou",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/yaofang",
		["north"] = "gumu/lgf",
		["west"] = "gumu/gmqs",
	},
}
Room {
	id = "gumu/shulin",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "gumu/shulin2",
	},
}
Room {
	id = "gumu/shulin1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "gumu/sln",
		["west"] = "gumu/lyy",
	},
	room_relative="���֣�����������",
}
Room {
	id = "gumu/shulin2",
	name = "��ľ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "gumu/shengou",
		["west"] = "gumu/sln",
	},
	room_relative="������ֹ�ľ��",
}
--[[
Room {
	id = "gumu/sln",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/sln",
		["north"] = "gumu/sln",
		["east"] = "gumu/sln",
		["west"] = "gumu/sln",
		["e;e;e;e;e;e;e;e;e;e;e;e;w"] = "gumu/shulin2",
		["w;w;w;w;w;w;w;w;w;w;w;w;e"] = "gumu/shulin1",
	},
	objs = {
          ["���"] = "yu feng",
     },
}
--]]
Room {
	id = "gumu/sln",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/sl3",
	},
}
Room {
	id = "gumu/sl3",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["north"] = "gumu/sl2",
	},
}
Room {
	id = "gumu/sl2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/sl4",
	},
	objs = {
          ["���"] = "yu feng",
     },
}
Room {
	id = "gumu/sl4",
	name = "����",
	outdoor = "����ɽ",
	ways = {	
		["e;e;e;e;e;e;e;e;e;e;e;e;w"] = "gumu/shulin2",
		["w;w;w;w;w;w;w;w;w;w;w;w;e"] = "gumu/shulin1",
	},
}
Room {
        id = "gumu/ss0",
        name = "ʯ��",
		outdoor = "����ɽ",
        ways = {
                ["out"] = "gumu/ss4",
        },
}
Room {
        id = "gumu/ss1",
        name = "ʯ��",
		outdoor = "����ɽ",
        ways = {
                ["out"] = "gumu/ss1",
        },
}
Room {
        id = "gumu/ss4",
        name = "ʯ��",
		outdoor = "����ɽ",
        ways = {
                ["w;w;w;w;w;s;s;s;s;s;s;n;n;n;n;n;e;e;e;e;e;#walkBusy;enter"] = "gumu/lingshi",
                ["w;w;w;w;w;s;s;s;s;s;s;n;n;n;n;n;e;e;e;e;e"] = "gumu/ss5",
        },
		room_relative='ʯ�ң�ʯ��-----ʯ��-----ʯ�ң�ʯ��ʯ��'
}
Room {
	id = "gumu/ss5",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "gumu/lingshi",
		["west"] = "gumu/ss4",
	},
}
Room {
        id = "gumu/sshi1",
        name = "ʯ��",
		outdoor = "����ɽ",
        ways = {
                ["up"] = "gumu/shiguan",
                ["l map;#walkBusy;walk down"] = "gumu/gmanhe1",
        },
}
Room {
	id = "gumu/xiaolu1",
	name = "���С·",
	outdoor = "����ɽ",
	ways = {
		["south"] = "gumu/xiaolu2",
		["east"] = "gumu/fchuan",
	},
	room_relative="���С·---����������С�����С·",
}
Room {
	id = "gumu/xiaolu2",
	name = "����С��",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "group/entry/gmchang",
		["south"] = "gumu/xiaolu3",
		["north"] = "gumu/xiaolu1",  
	},
	room_relative="���С·������С�����K���С�����Ϲ㳡����С��",
}
Room {
	id = "gumu/xiaolu3",
	name = "���С��",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "gumu/shanlu1",
		["southeast"] = "gumu/shanxia",
		["north"] = "gumu/xiaolu2",
	},
	room_relative="����С�������С�����Kɽ´����ɽ�����С��",
}
Room {
	id = "gumu/xuantie/dongkou",
	name = "����",
	outdoor = "��������",
	ways = {
		["southeast"] = "gumu/xuantie/xiaolu3",
		["enter"] = "gumu/xuantie/shandong",
	},
	blocks = {
		["enter"] = {
			{id = "shen diao", exp = 100000},
		},
          	precmds = {
              ["enter"] = "kill shen diao",
	},
	},
	objs = {
          ["���"] = "shen diao",
     },
	 
}
Room {
	id = "gumu/xuantie/pubu",
	name = "�ٲ�",
	outdoor = "��������",
	ways = {
		["west"] = "gumu/xuantie/xiaolu3",
	},
	room_relative="ɽ·���ٲ�",
}
Room {
	id = "gumu/xuantie/qiaobi",
	name = "�ͱ�",
	outdoor = "��������",
	ways = {
		["southdown"] = "gumu/xuantie/shanlu8",
		["l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;mo qingtai;cuan up"] = "gumu/xuantie/pingtai",
	},
	nolooks = {
		["l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;l shibi;mo qingtai;cuan up"] = true,
	},
	room_relative="��ȣ��ͱ�-ƽ̨",
}
Room {
	id = "gumu/xuantie/pingtai",
	name = "ƽ̨",
	outdoor = "��������",
	ways = {
		["enter"] = "gumu/xuantie/jianzhong",
		["tiao down"] = "gumu/xuantie/qiaobi",
	},
	nolooks = {
		["tiao down"] = true,
		["enter"] = true,
	},
	precmds = {
		["enter"] = "move stone",
	},
	
}
Room {
	id = "gumu/xuantie/jianzhong",
	name = "��ڣ",
	outdoor = "��������",
	ways = {
		["out"] = "gumu/xuantie/pingtai",
	},
	nolooks = {
		["out"] = true,
	},
	precmds = {
		["out"] = "tui shi",
	},
	
}
Room {
	id = "gumu/xuantie/shandong",
	name = "��ɽ��",
	outdoor = "��������",
	ways = {
		["out"] = "gumu/xuantie/dongkou",
	},
}
Room {
	id = "gumu/xuantie/shanlu7",
	name = "���",
	outdoor = "��������",
	ways = {
		["south"] = "gumu/xuantie/shandong",
		["northwest"] = "gumu/xuantie/shanlu8",
	},
	room_relative="��ɽ����ɽ·�����",
}
Room {
	id = "gumu/xuantie/shanlu8",
	name = "���",
	outdoor = "��������",
	ways = {
		["northup"] = "gumu/xuantie/qiaobi",
		["southeast"] = "gumu/xuantie/shanlu7",
	},
	room_relative="�ͱڣ���ȣ����",
}
Room {
	id = "gumu/xuantie/shushang",
	name = "����",
	outdoor = "��������",
	ways = {
		["down"] = "gumu/xuantie/shanlu7",
	},
}
Room {
	id = "gumu/xuantie/xiaolu1",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["northup"] = "gumu/xuantie/xiaolu2",
		["south"] = "gumu/xuantie/xiaolu4",
		["s"] = "gumu/xuantie/linhain",
	},
	nolooks = {
		["south"] = true,
		["s"] = true,
	},
	lengths = {
		["south"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
		["s"] = "if score.party and score.party=='��Ĺ��' then return false else return 30 end",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/xiaolu2",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["northup"] = "gumu/xuantie/xiaolu3",
		["southdown"] = "gumu/xuantie/xiaolu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/xiaolu3",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["northwest"] = "gumu/xuantie/dongkou",
		["east"] = "gumu/xuantie/pubu",
		["southdown"] = "gumu/xuantie/xiaolu2",
	},
	room_relative="���ڨIɽ·-----�ٲ���ɽ·ɽ·",
}
Room {
	id = "gumu/xuantie/linhain",
	name = "����",
	outdoor = "��������",
	ways = {
		["#goXtj"] = "gumu/xuantie/xiaolu1",
		["#outXtj"] = "gumu/xuantie/xiaolu4",
	},
	nolooks = {
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "gumu/xuantie/xiaolu4",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["southeast"] = "xiangyang/conglin4",
		["north"]     = "gumu/xuantie/xiaolu1",
		["n"]     = "gumu/xuantie/linhain",
		},
        nolooks = {
                ["north"] = true,
                ["n"] = true,
        },
        lengths = {
                ["north"] = "if score.party and score.party=='��Ĺ��' then return 1 else return false end",
		        ["n"] = "if score.party and score.party=='��Ĺ��' then return false else return 30 end",
		},
		room_relative='ɽ·��ɽ·�Kɽ��յ�ɽ·',
}
Room {
	id = "gumu/xuanya",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["north"] = "gumu/rukou",
	},
	room_relative='��Ĺ������',
}
Room {
	id = "gumu/yaofang",
	name = "ҩ��",
	outdoor = "����ɽ",
	ways = {
		["north"] = "gumu/shitou",   
		["west"] = "gumu/fang",
	},
	room_relative='ʯ�ң�ʯ��ҩ��',
}
Room {
	id = "gumu/ztm",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "gumu/shanlu3",
		["southdown"] = "gumu/jlg",
	},
	room_relative='ɽ·�������š�������������',
}
Room {
	id = "hengshan/baiyunan",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/square",
	},
	objs = {
          ["����ʦ̫"] = "dingxian shitai",
          ["֣��"] = "zheng e",
          ["�ؾ�"] = "qin juan",
           },
	room_relative="�����֣����Է�㳡������",
}
Room {
	id = "hengshan/beiyuedian",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "hengshan/shandao1",
		["eastup"] = "hengshan/yuyang",
		["westup"] = "hengshan/huixiantai",
		["southdown"] = "hengshan/beiyuemiao",
	},
	room_relative="���Է�ɽ��������̨����������������ơ�����������",
}
Room {
	id = "hengshan/beiyuemiao",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "hengshan/beiyuedian",
		["east"] = "hengshan/kutianjing",
		["southdown"] = "hengshan/guolaoling",
		["west"] = "hengshan/jijiaoshi",
	},
	objs = {
          ["�Ǻ�"] = "yi he",
          ["����"] = "yi lin",
	room_relative="�����������ʯ----������----���𾮡������뱱����",
           },
}
Room {
	id = "hengshan/cuiping1",
	name = "����ɽ��",
	outdoor = "��ɽ",
	ways = {
		["westup"] = "hengshan/cuiping2",
		["down"] = "hengshan/cuipinggu2",
	},
	room_relative="����ɽ��������ɽ���������ȴ���ɽ��",
}
Room {
	id = "hengshan/cuiping2",
	name = "����ɽ��",
	outdoor = "��ɽ",
	ways = {
		["eastdown"] = "hengshan/cuiping1",
		["eastup"] = "hengshan/xuankong1",
	},
	room_relative="����ɽ��������ɽ������ɽ��",
}
Room {
	id = "hengshan/cuipinggu1",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "hengshan/cuipinggu2",
		["northeast"] = "hengshan/jinlongxia",
	},
	objs = {
          ["����"] = "yi wen",
	room_relative="����Ͽ�J�����ȨK�����ȴ�����",
           },
}
Room {
	id = "hengshan/cuipinggu2",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northwest"] = "hengshan/cuipinggu1",
		["up"] = "hengshan/cuiping1",
	},
	room_relative="�����ȴ���ɽ���I�������ȴ�����",
}
Room {
	id = "hengshan/daziling",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northeast"] = "hengshan/hufengkou",
		["west"] = "hengshan/yunge",
	},
	room_relative="����ڨJ�Ƹ����----�����������",
}
Room {
	id = "hengshan/guolaoling",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "hengshan/beiyuemiao",
		["westdown"] = "hengshan/tongyuangu",
		["southwest"] = "hengshan/hufengkou",
	},
	room_relative="�������ͨԪ�ȡ�������L����ڹ�����",
}
Room {
	id = "hengshan/hufengkou",
	name = "�����",
	outdoor = "��ɽ",
	ways = {
		["southwest"] = "hengshan/daziling",
		["northeast"] = "hengshan/guolaoling",
		["west"] = "hengshan/xgsong",
	},
 room_relative="������J������----����ڨL�����뻢���",
}
Room {
	id = "hengshan/huixiantai",
	name = "����̨",
	outdoor = "��ɽ",
	ways = {
		["eastdown"] = "hengshan/beiyuedian",
	},
	room_relative="����̨�����������̨",
}
Room {
	id = "hengshan/jijiaoshi",
	name = "����ʯ",
	outdoor = "��ɽ",
	ways = {
		["east"] = "hengshan/beiyuemiao",
	},
	room_relative="����ʯ----��������ʯ",
}
Room {
	id = "hengshan/jinlongxia",
	name = "����Ͽ",
	outdoor = "��ɽ",
	ways = {
		["southwest"] = "hengshan/cuipinggu1",
		["southdown"] = "changan/northroad10",
		["west"] = "hengshan/mtroad1",
	},
	objs = {
          ["����ʦ̫"] = "dingjing shitai",
	room_relative="����----����Ͽ�L�������ȴ������Ͽ",
           },
}
Room {
	id = "hengshan/kutianjing",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["west"] = "hengshan/beiyuemiao",
	},
	room_relative="������----���𾮿���",
}
Room {
	id = "hengshan/shandao1",
	name = "���Է�ɽ��",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "hengshan/shandao2",
		["southdown"] = "hengshan/beiyuedian",
	},
room_relative="���Է�ɽ�������Է�ɽ������������Է�ɽ��",
}
Room {
	id = "hengshan/shandao2",
	name = "���Է�ɽ��",
	outdoor = "��ɽ",
	ways = {
		["eastup"] = "hengshan/square",
		["southdown"] = "hengshan/shandao1",
	},
	room_relative="���Է�ɽ�������Է�㳡�����Է�ɽ�����Է�ɽ��",
}
Room {
	id = "hengshan/sjdian",
	name = "���̵�",
	outdoor = "��ɽ",
	ways = {
		["down"] = "hengshan/xuankong1",
	},
	room_relative="���̵�������±�¥���̵�",
}
Room {
	id = "hengshan/square",
	name = "���Է�㳡",
	outdoor = "��ɽ",
	ways = {
		["westdown"] = "hengshan/shandao2",
		["north"] = "hengshan/baiyunan",
	},
	objs = {
          ["����ʦ̫"] = "dingyi shitai",
          ["����"] = "yi qing",
  
           },
  room_relative="�����֣����Է�ɽ�������Է�㳡���Է�㳡",
}
Room {
	id = "hengshan/tongyuangu",
	name = "ͨԪ��",
	outdoor = "��ɽ",
	ways = {
		["eastup"] = "hengshan/guolaoling",
	},
	room_relative="ͨԪ�ȡ�������ͨԪ��",
}
Room {
	id = "hengshan/xgsong",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["east"] = "hengshan/hufengkou",
	},
	room_relative="������----�����������",
}
Room {
	id = "hengshan/xuankong1",
	name = "�����±�¥",
	outdoor = "��ɽ",
	ways = {
		["westdown"] = "hengshan/cuiping2",
		["south"] = "hengshan/zhanqiao",
		["up"] = "hengshan/sjdian",
	},
room_relative="���̵������ɽ���������±�¥������ջ�������±�¥",
}
Room {
	id = "hengshan/xuankong2",
	name = "��������¥",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "hengshan/zhandao",
		["north"] = "hengshan/zhanqiao",
	},
room_relative="����ջ�ţ���������¥����ʽջ����������¥",
}
Room {
	id = "hengshan/yunge",
	name = "�Ƹ����",
	outdoor = "��ɽ",
	ways = {
		["east"] = "hengshan/daziling",
		["northdown"] = "hengshan/zhandao",
	},
	objs = {
          ["����"] = "yi zhi",
	room_relative="��ʽջ�����Ƹ����---�������Ƹ����",
           },
}
Room {
	id = "hengshan/yuyang",
	name = "��������",
	outdoor = "��ɽ",
	ways = {
		["westdown"] = "hengshan/beiyuedian",
	},
	room_relative="�����������������������",
}
Room {
	id = "hengshan/zhandao",
	name = "��ʽջ��",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "hengshan/yunge",
		["northdown"] = "hengshan/xuankong2",
	},
	room_relative="��������¥����ʽջ�����Ƹ������ʽջ��",
}
Room {
	id = "hengshan/zhanqiao",
	name = "����ջ��",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/xuankong2",
		["north"] = "hengshan/xuankong1",   
	},
	room_relative="�����±�¥������ջ�ţ���������¥����ջ��",
}
--add by xieky@sj 20170809
Room {
	id = "hengshan/mtroad",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtyadi",
		["east"] = "hengshan/mtroad1",
	},
	objs = {
          ["����"] = "ding dang",
           },
		   room_relative="ɽ·-----���֣��µ�ɽ·",
}
Room {
	id = "hengshan/mtyadi",
	name = "�µ�",
	outdoor = "��ɽ",
	ways = {
		["north"] = "hengshan/mtroad",
--		["climb lian"] = "???",
	},
}
Room {
	id = "hengshan/mtroad1",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad2",
		["north"] = "hengshan/mtroad1",
		["west"] = "hengshan/mtroad",
		["east"] = "hengshan/jinlongxia",
	},
	room_relative="���֣�ɽ·-----����-----����Ͽ����������",
}
Room {
	id = "hengshan/mtroad2",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad2",
		["north"] = "hengshan/mtroad3",
		["east"] = "hengshan/mtroad1",
		["west"] = "hengshan/mtroad2",
	},
	objs = {
        ["����"] = "Li si",
        ["����"] = "Zhang san",
    },
	room_relative="���֣�����-----����-----���֣���������",
}
Room {
	id = "hengshan/mtroad3",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad3",
		["east"] = "hengshan/mtroad2",
		["west"] = "hengshan/mtroad3",
	},
	objs = {
        ["�Է�"] = "Qiao fu",
    },
}
Room {
	id = "hengshan/mtroad4",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad6",
		["east"] = "hengshan/mtroad3",
		["west"] = "hengshan/mtroad5",
	},
}
Room {
	id = "hengshan/mtroad5",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad5",
		["north"] = "hengshan/mtroad5",
		["east"] = "hengshan/mtroad4",
		["west"] = "hengshan/mtroad5",
	},
}
Room {
	id = "hengshan/mtroad6",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "hengshan/mtroad4",
		["north"] = "hengshan/mtroad4",
		["east"] = "hengshan/mtroad4",
		["west"] = "hengshan/mtroad4",
	},
	objs = {
        ["ʷ����"] = "shi popo",
    },
}
--add end
Room {
	id = "hj/caochang",
	name = "�ݳ�",
	outdoor = "�ؽ�",
	ways = {
		["westdown"] = "hj/shuijing",
		["east"] = "hj/caoyuan1",
		["northdown"] = "hj/pmchang",
	},
	room_relative="���������������ݳ�-----���ԭ�ݳ�",
}
Room {
	id = "hj/caoyuan",
	name = "��ԭ��Ե",
	outdoor = "�ؽ�",
	ways = {
		["westup"] = "hj/caoyuan2",
		["southwest"] = "hj/caoyuan1",
		["south"] = "hj/caoyuan",
		["east"] = "xingxiu/shamo",
		["north"] = "hj/caoyuan",
		["s;s;s;s"] = "hj/caoyuan8",
		["n;n;n;n"] = "hj/hswz",
	},
	nolooks = {
		["s;s;s;s"] = true,
		["n;n;n;n"] = true,
	},
	lengths = {
		["s;s;s;s"] = 4,
		["n;n;n;n"] = 4,
	},
	objs = {
          ["������"] = "xiaoxiang zi",
           },
}
Room {
	id = "hj/caoyuan1",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/majiu",
		["north"] = "hj/caoyuan2",
		["northeast"] = "hj/caoyuan",
		["west"] = "hj/caochang",
	},
	room_relative = "��ԭ��ԭ��Ե���J�ݳ�----���ԭ��������ԭ",
	nolooks = {
		["down"] = true,
	},
	objs = {
          ["����"] = "mian yang",
           },
}
Room {
	id = "hj/caoyuan10",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan",
		["north"] = "hj/caoyuan9",
		["east"] = "hj/caoyuan8",
		["west"] = "hj/caoyuan7",
	},
	room_relative="���ԭ�����ԭ----���ԭ----���ԭ����ԭ��Ե���ԭ",
}
Room {
	id = "hj/caoyuan2",
	name = "��ԭ",
	outdoor = "�ؽ�",
	ways = {
		["northup"] = "hj/road1",
		["eastdown"] = "hj/caoyuan",
		["south"] = "hj/caoyuan1",
		["northwest"] = "hj/shop",
		["north"] = "xueshan/caoyuan/caohai1",
		["west"] = "hj/pmchang",
	},
	room_relative="������С��ݺ��I������-----��ԭ����ԭ��Ե�����ԭ��ԭ",
}
Room {
	id = "hj/caoyuan4",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan5",
		["north"] = "hj/caoyuan5",
		["east"] = "hj/caoyuan5",
		["west"] = "hj/caoyuan5",
	},
	room_relative="���ԭ�����ԭ----���ԭ----���ԭ�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan5",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan4",
		["north"] = "hj/caoyuan4",
		["east"] = "hj/caoyuan4",
		["west"] = "hj/road1",
	},
	room_relative="���ԭ��С·----���ԭ----���ԭ�����ԭ���ԭ",
	objs = {
          ["����"] = "mian yang",
          ["������"] = "tianlin niao",
           },
}
Room {
	id = "hj/caoyuan6",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["southwest"] = "hj/road2",
		["south"] = "hj/caoyuan",
		["northwest"] = "hj/room-ji",
		["east"] = "hj/caoyuan",
	},
	room_relative="����I���ԭ----��ԭ��Ե�L��С·��ԭ��Ե���ԭ",
}
Room {
	id = "hj/caoyuan7",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan8",
		["north"] = "hj/room-su",
		["east"] = "hj/caoyuan",
		["west"] = "hj/caoyuan9",
	},
	room_relative ="��³�˵ļң����ԭ----���ԭ----��ԭ��Ե�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan8",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan9",
		["north"] = "hj/room-che",
		["east"] = "hj/caoyuan",
		["west"] = "hj/caoyuan7",
	},
	room_relative ="������ļң����ԭ----���ԭ----��ԭ��Ե�����ԭ���ԭ",
}
Room {
	id = "hj/caoyuan9",
	name = "���ԭ",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan",
		["east"] = "hj/caoyuan8",
		["north"] = "hj/caoyuan",
		["west"] = "hj/caoyuan7",
	},
	room_relative ="��ԭ��Ե�����ԭ----���ԭ----���ԭ����ԭ��Ե���ԭ",
	objs = {
          ["����"] = "mian yang",
           },
}
Room {
	id = "hj/gebin",
	name = "����",
	outdoor = "�ؽ�",
	ways = {
		["#outGb"] = "hj/room-ji",
	},
	nolooks = {
		["#outGb"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
}
Room {
	id = "hj/hsk",
	name = "����������",
	outdoor = "�ؽ�",
	ways = {
		["southwest"] = "hj/room-che",
		["east"] = "hj/caoyuan",
		["west"] = "hj/majiu",
	},
	objs = {
          ["������"] = "tianlin niao",
          ["����"] = "ru lao",
          ["�����˸�Ů"] = "hasake",
           },
		   room_relative="������ļң���ԭ��Ե���������������",
}
Room {
	id = "hj/hswz",
	name = "��ʯΧ��",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "xingxiu/shamo13",
		["southwest"] = "hj/caoyuan10",
		["south"] = "xingxiu/shamo13",
		["north"] = "hj/gebin",
	},
	lengths={
	    ["north"] = 10 ,
	},
	room_relative="��ɳĮ�����ԭ--��ɳĮ�����ں�ʯΧ��",
}
Room {
	id = "hj/luzhou",
	name = "�ؽ�����",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/gebin",
		["southwest"] = "hj/gebin",
		["northwest"] = "hj/gebin",
		["northeast"] = "hj/gebin",
	},
}
Room {
	id = "hj/majiu",
	name = "����",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/hsk",
		["north"] = "hj/caoyuan1",
		["west"] = "hj/caoyuan7",
	},
	room_relative="��������������ԭ--���ԭ������",
}
Room {
	id = "hj/mg-door",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["eastdown"] = "hj/shulin1",
	},
	
}
Room {
	id = "hj/mg-indoor",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/mg3",
		["west"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg-room1",
	name = "�Թ�����",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/tianjin",
		["northwest"] = "hj/mg-room3",
		["north"] = "hj/mg-room2",
		["northeast"] = "hj/mg-room4",
	},
}
Room {
	id = "hj/mg-room2",
	name = "�Թ�����",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/mg-room1",
	},
}
Room {
	id = "hj/mg-room3",
	name = "�Թ�����",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/mg-room1",
		["northeast"] = "hj/mg-room5",
	},
}
Room {
	id = "hj/mg-room4",
	name = "�Թ�����",
	outdoor = "�ؽ�",
	ways = {
		["southwest"] = "hj/mg-room1",
		["northwest"] = "hj/mg-room5",
	},
}
Room {
	id = "hj/mg-room5",
	name = "�Թ�����",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/mg-room4",
		["southwest"] = "hj/mg-room3",
	},
}
Room {
	id = "hj/mg1",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["north"] = "hj/mg2",
	},
}
Room {
	id = "hj/mg2",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/mg1",
		["north"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg3",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/mg4",
		["east"] = "hj/mg4",
		["north"] = "hj/mg4",
		["west"] = "hj/mg4",
	},
}
Room {
	id = "hj/mg4",
	name = "�߲��Թ�",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/mg3",
		["north"] = "hj/mg3",
		["east"] = "hj/mg3",
		["west"] = "hj/mg3",
	},
}
Room {
	id = "hj/pmchang",
	name = "����",
	outdoor = "�ؽ�",
	ways = {
		["southup"] = "hj/caochang",
		["southwest"] = "hj/shuijing",
		["north"] = "hj/shop",
		["east"] = "hj/caoyuan2",
		["west"] = "group/entry/hjroad",
	},
	objs = {
          ["�´ﺣ"] = "chen dahai",
          ["����"] = "mian yang",
           },
		room_relative="������С���С·----����----��ԭ�L���������ݳ�����",
}
Room {
	id = "hj/road1",
	name = "С·",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/caoyuan4",
		["northeast"] = "hj/road2",
		["southdown"] = "hj/caoyuan2",
		["west"] = "hj/shop",
	},
	room_relative="С·�J������С��-----С·-----���ԭ����ԭС·",
}
Room {
	id = "hj/road2",
	name = "С·",
	outdoor = "�ؽ�",
	ways = {
		["southwest"] = "hj/road1",
		["north"] = "hj/room-ji",
		["northeast"] = "hj/caoyuan6",
	},
	room_relative="������ԭ���JС·�LС·С·",
}
Room {
	id = "hj/room-che",
	name = "������ļ�",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan8",
		["east"] = "hj/caoyuan8",
		["northeast"] = "hj/hsk",
		["west"] = "hj/caoyuan8",
	},
	room_relative="���ԭ�����ԭ--��������������ԭ--������ļ�",
}
Room {
	id = "hj/room-ji",
	name = "����",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/caoyuan6",
		["south"] = "hj/road2",
		["enter"] = "hj/room-ji1",
		--["northwest"] = "hj/gebin",
	},
	room_relative="����С�ݨI�Ĳ�����KС·���ԭ����",
}
Room {
	id = "hj/room-ji1",
	name = "С��",
	outdoor = "�ؽ�",
	ways = {
		["out"] = "hj/room-ji",
	},
	objs = {
          ["������"] = "ji laoren",
          ["������"] = "li wenxiu",
           },
	room_relative="С�ݡŲ���С��",
}
Room {
	id = "hj/room-su",
	name = "��³�˵ļ�",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/caoyuan7",
		["east"] = "hj/caoyuan7",
		["northeast"] = "hj/shuijing",
		["west"] = "hj/caoyuan7",
	},
	objs = {
          ["��³��"] = "su luke",
           },
		 room_relative="�������J���ԭ--��³�˵ļ�--���ԭ�����ԭ��³�˵ļ�",
}
Room {
	id = "hj/senlin",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/shanqiu",
		["northwest"] = "xingxiu/tianshan",
		["northeast"] = "xingxiu/shanjiao",
	},
}

--[[
Room {
	id = "hj/senlinn",
	name = "��Ҷ��",
	ways = {
		["#outZyl"] = "hj/senlin",
	},
	nolooks = {
		["#outZyl"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	lengths = {
		["#outZyl"] = 80,
	},
}
--]]
Room {
	id = "hj/senlinn",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/senlin2",
	},
}
Room {
	id = "hj/senlin2",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/senlin3",
	},
}
Room {
	id = "hj/senlin3",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["west"] = "hj/senlin4",
	},
}
Room {
	id = "hj/senlin4",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["north"] = "hj/senlin5",
	},
}
Room {
	id = "hj/senlin5",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/senlin6",
	},
}
Room {
	id = "hj/senlin6",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/senlin7",
	},
}
Room {
	id = "hj/senlin7",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["west"] = "hj/senlin8",
	},
}
Room {
	id = "hj/senlin8",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["north"] = "hj/senlin9",
	},
}

Room {
	id = "hj/senlin9",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["north"] = "hj/senlin10",
	},
}
Room {
	id = "hj/senlin10",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["east"] = "hj/senlin11",
	},
}
Room {
	id = "hj/senlin11",
	name = "��Ҷ��",
	outdoor = "�ؽ�",
	ways = {
		["#outZyl"] = "hj/senlin",
	},
	nolooks = {
		["#outZyl"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	lengths = {
		["#outZyl"] = 80,
	},
}
Room {
	id = "hj/shanqiu",
	name = "Сɽ��",
	outdoor = "�ؽ�",
	ways = {
		["eastdown"] = "group/entry/hjroad",
		["westdown"] = "hj/senlinn",
		["south"] = "hj/caoyuan9",
	},
	objs = {
          ["����"] = "su pu",
           },
	room_relative="��Ҷ�֡�Сɽ���С·�����ԭСɽ��",
}
Room {
	id = "hj/shop",
	name = "������С��",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/caoyuan2",
		["south"] = "hj/pmchang",
		["northwest"] = "hj/sroom",
		["east"] = "hj/road1",
	},
	room_relative="����������I������С��--С·���K������ԭ������С��",
}
Room {
	id = "hj/shuijing",
	name = "������",
	outdoor = "�ؽ�",
	ways = {
		["eastup"] = "hj/caochang",
		["southwest"] = "hj/room-su",
		["northeast"] = "hj/pmchang",
	},
	room_relative="�����J���������ݳ��L��³�˵ļҿ�����",
}
Room {
	id = "hj/shulin",
	name = "ɽ��",
	outdoor = "�ؽ�",
	ways = {
		["south"] = "hj/gebin",
		["northwest"] = "hj/shulin1",
		["east"] = "hj/gebin",
		["north"] = "hj/gebin",
	},
}
Room {
	id = "hj/shulin1",
	name = "ɽ��",
	outdoor = "�ؽ�",
	ways = {
		["southeast"] = "hj/shulin",
		["westup"] = "hj/mg-door",
	},
}
Room {
	id = "hj/sroom",
	name = "����������",
	outdoor = "�ؽ�",
	no_fight = true,
	ways = {
		["southeast"] = "hj/shop",
	},
	room_relative="����������K������С�����������",
}
Room {
	id = "hj/tianjin",
	name = "�쾮",
	outdoor = "�ؽ�",
	ways = {
		["north"] = "hj/mg-room1",
	},
}
Room {
	id = "hmy/andao1",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/andao2",
		["west"] = "hmy/houdian",
	},
}
Room {
	id = "hmy/andao2",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/andao1",
		["east"] = "hmy/andao3",
	},
}
Room {
	id = "hmy/andao3",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/andao4",
		["west"] = "hmy/andao2",
	},
}
Room {
	id = "hmy/andao4",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/andao3",
		["west"] = "hmy/andao5",
	},
}
Room {
	id = "hmy/andao5",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/andao4",
		["northeast"] = "hmy/andao6",
	},
}
Room {
	id = "hmy/andao6",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["southwest"] = "hmy/andao5",
		["northwest"] = "hmy/andao7",
	},
}
Room {
	id = "hmy/andao7",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["southeast"] = "hmy/andao6",
		["north"] = "hmy/andao8",
	},
}
Room {
	id = "hmy/andao8",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["southeast"] = "hmy/andao7",
		["enter"] = "hmy/jail_gate",
	},
}
Room {
	id = "hmy/baichi",
	name = "�����",
	outdoor = "��ľ��",
	ways = {
		["eastup"] = "hmy/suo",
		["westup"] = "hmy/shijie",
		["south"] = "hmy/meimao",
		["eastdown"] = "hmy/shandao2",
	},
	room_relative="������ʯ��--üë�£�ɽ�������",
}
Room {
	id = "hmy/baihutang",
	name = "�׻���",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/changlang",
		["east"] = "hmy/zhuquetang",
	},
	objs = {
          ["ɣ����"] = "sang sanniang",
           },
	room_relative="�׻���----��ȸ�ã����Ȱ׻���",
}
Room {
	id = "hmy/baizhang",
	name = "����Ȫ",
	outdoor = "��ľ��",
	ways = {
		["eastup"] = "hmy/yupingpu",
		["south"] = "hmy/qiangu",
	},
	room_relative="����Ȫ�������٣�ǧ��ʯ����Ȫ",
}
Room {
	id = "hmy/cddian",
	name = "�ɵµ�",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/dadian",
		["north"] = "hmy/changlang2",
		["west"] = "hmy/zhuquetang",
	},
	room_relative="���ȣ���ȸ��----�ɵµ�����ɵµ�",
}
Room {
	id = "hmy/changlang",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/fleitang",
		["east"] = "hmy/dadian",
		["north"] = "hmy/baihutang",
		["west"] = "hmy/qiandian",
	},
	objs = {
          ["������"] = "chou songnian",
           },
	room_relative="�׻��ã�ǰ��-----����-----���������ó���",
}
Room {
	id = "hmy/changlang2",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/cddian",
		["east"] = "hmy/qqiudian",
		["west"] = "hmy/qlongtang",
	},
	room_relative="������-----����-----ǧ�����ɵµ��",
}
Room {
	id = "hmy/changlang3",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/shufang",
		["north"] = "hmy/lgfang",
		["east"] = "hmy/changlang4",
		["west"] = "hmy/qqiudian",
	},
	room_relative="��������ǧ���-----����-----���ȣ��鷿����",
}
Room {
	id = "hmy/changlang4",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/changlang6",
		["north"] = "hmy/xiuxishi",
		["east"] = "hmy/shifang",
		["west"] = "hmy/changlang3",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
	room_relative="��Ϣ�ң�����-----����-----��ʳ�������ȳ���",
}
Room {
	id = "hmy/changlang5",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/houhuayen",
		["east"] = "hmy/houdian",
		["north"] = "hmy/dadian",
		["west"] = "hmy/fleitang",
	},
	room_relative="����������-----����-----������԰����",
}
Room {
	id = "hmy/changlang6",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/houdian",
		["east"] = "hmy/yiting",
		["north"] = "hmy/changlang4",
		["west"] = "hmy/dadian",
	},
	room_relative="���ȣ����-----����-----������������",
}
Room {
	id = "hmy/changtan",
	name = "��̲",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/shandao",
		["dutan"] = "hmy/xxtan",
	},
	room_relative="��̲-----ɽ����̲",
}
Room {
	id = "hmy/chengdedian",
	name = "�ɵµ�",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/dadian",
		["north"] = "hmy/changlang2",
		["west"] = "hmy/zhuquetang",
	},
	room_relative="���ȣ���ȸ��--�����ɵµ�",
}
Room {
	id = "hmy/dadian",
	name = "���",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/changlang5",
		["east"] = "hmy/changlang6",
		["north"] = "hmy/cddian",
		["west"] = "hmy/changlang",
	},
	room_relative="�ɵµ������-----���-----���ȣ����ȴ��",
}
Room {
	id = "hmy/dedao",
	name = "�ص�",
	outdoor = "��ľ��",
	ways = {
		["down"] = "hmy/xhuayuan",
		["up"] = "hmy/shiwu",
	},
}

Room {
	id = "hmy/fleitang",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/changlang5",
		["north"] = "hmy/changlang",
	},
	room_relative="���ȣ�������----���ȷ�����",
}
Room {
	id = "hmy/guanpu",
	name = "����ͤ",
	outdoor = "��ľ��",
	ways = {
		["northup"] = "hmy/moyun",
		["south"] = "hmy/yupingpu",
	},
	room_relative="�����¡�����ͤ�������ٹ���ͤ",
}
Room {
	id = "hmy/houdian",
	name = "���",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/changlang6",
		["west"] = "hmy/changlang5",
	},
	objs = {
          ["�ܹ�ͩ"] = "zhou gutong",
          ["���Ӣ"] = "wu baiying",
           },
	room_relative="���ȣ�����-----�����",
}
Room {
	id = "hmy/houhuayen",
	name = "��԰",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/changlang5",
		["west"] = "hmy/shiwu",
	},
	room_relative="���ȣ�Сʯ��----��԰��԰",
}
Room {
	id = "hmy/jail_gate",
	name = "��������",
	outdoor = "��ľ��",
	ways = {
		["out"] = "hmy/andao8",
	},
}
Room {
	id = "hmy/lgfang",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/changlang3",
	},
	room_relative="������������������",
}
Room {
	id = "hmy/liangting",
	name = "��ͤ",
	outdoor = "��ľ��",
	ways = {
		["west"] = "hmy/shidao2",
	},
	objs = {
          ["������"] = "xiang wentian",
           },
	room_relative="ʯ��-----��ͤ��ͤ",
}
Room {
	id = "hmy/lianhua",
	name = "��Ѫ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/xianren",
		["east"] = "hmy/wulao",
		["west"] = "hmy/yupingpu",
	},
	objs = {
          ["Ұ��"] = "ye lang",
          ["�۷�"] = "mi feng",
           },
	room_relative="������----��Ѫ��----���Ϸ��Ѫ��",
}
Room {
	id = "hmy/meimao",
	name = "üë��",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/baichi",
		["southdown"] = "hmy/taohua",
	},
	objs = {
          ["С��"] = "xiao hou",
           },
	room_relative="����ڣ�üë�¡��һ���üë��",
}
Room {
	id = "hmy/midao6",
	name = "�ص�",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/suo",
		["west"] = "hmy/suo",
	},
}
Room {
	id = "hmy/moyun",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["southdown"] = "hmy/guanpu",
	},
	room_relative="�����¡�����ͤ������",
}
Room {
	id = "hmy/pailou",
	name = "��¥",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/xiangfang",
		["north"] = "hmy/shibanlu",
		["west"] = "hmy/yading",
	},
	room_relative="ʯ��·���¶�-----��¥-----�᷿��¥",
}
Room {
	id = "hmy/pingding/cj1",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/cj2",
		["west"] = "hmy/pingding/gate1",
	},
	room_relative="����-----����-----���ֳ���",
}
Room {
	id = "hmy/pingding/cj2",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["northeast"] = "hmy/pingding/cj3",
		["west"] = "hmy/pingding/cj1",
		["south"] = "hmy/pingding/xchidian",
	},
	room_relative="���֨J����-----���֣�С�Ե곤��",
}
Room {
	id = "hmy/pingding/cj3",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/cj5",
		["southeast"] = "hmy/pingding/kedian",
		["southwest"] = "hmy/pingding/cj2",
		["north"] = "hmy/pingding/cj4",
		["west"] = "hmy/pingding/yaopu",
	},
	room_relative="���֣�ҩ��-----����-----���֨L�K����ƽ���͵곤��",
}
Room {
	id = "hmy/pingding/cj4",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["south"] = "hmy/pingding/cj3",
		["north"] = "hmy/pingding/gate2",
	},
	room_relative="���ţ����֣����ֳ���",
}
Room {
	id = "hmy/pingding/cj5",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/dongmen",
		["west"] = "hmy/pingding/cj3",
	},
	room_relative="����-----����-----���ų���",
}
Room {
	id = "hmy/pingding/dongmen",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/road6",
		["west"] = "hmy/pingding/cj5",
	},
	room_relative="����-----����-----��·����",
}
Room {
	id = "hmy/pingding/gate1",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/cj1",
		["west"] = "hmy/pingding/road3",
	},
	room_relative="��·-----����-----��������",
}
Room {
	id = "hmy/pingding/gate2",
	name = "����",
	outdoor = "ƽ����",
	ways = {
		["south"] = "hmy/pingding/cj4",
		["north"] = "hmy/pingding/road4",
	},
	room_relative="��·�����ţ����ֱ���",
}
Room {
	id = "hmy/pingding/kedian",
	name = "ƽ���͵�",
	no_fight = true,
	ways = {
		["northwest"] = "hmy/pingding/cj3",
		["north"] = "hmy/pingding/kefang",
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="���ֿͷ��I��ƽ���͵�ƽ���͵�",
}
Room {
	id = "hmy/pingding/kedian2",
	name = "�͵��¥",
	outdoor = "ƽ����",
	ways = {
		["enter"] = "hmy/pingding/kedian3",
		["down"] = "hmy/pingding/kedian",
	},
}
Room {
	id = "hmy/pingding/kedian3",
	name = "�͵��¥",
	outdoor = "ƽ����",
	no_fight = true,
	ways = {
		["out"] = "hmy/pingding/kedian2",
	},
}
Room {
	id = "hmy/pingding/kefang",
	name = "�ͷ�",
	outdoor = "ƽ����",
	no_fight = true,
	ways = {
		["south"] = "hmy/pingding/kedian",
	},
}
Room {
	id = "hmy/pingding/road1",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["northeast"] = "group/entry/hmyroad2",
		["west"] = "changan/northroad10",
	},
	room_relative="��·�J���-----��·��·",
}
Room {
	id = "hmy/pingding/road3",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["westdown"] = "group/entry/hmyroad2",
		["east"] = "hmy/pingding/gate1",
	},
	room_relative="��·����·-----������·",
}
Room {
	id = "hmy/pingding/road4",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["south"] = "hmy/pingding/gate2",
		["northwest"] = "hmy/pingding/road5",
	},
	room_relative="��·�I��·��������·",
}
Room {
	id = "hmy/pingding/road5",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["northwest"] = "hmy/shidao",
		["southeast"] = "hmy/pingding/road4",
	},
	room_relative="ʯ���I��·�K��·��·",
}
Room {
	id = "hmy/pingding/road6",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["eastup"] = "hmy/pingding/road7",
		["west"] = "hmy/pingding/dongmen",
	},
	room_relative="����-----��·����·��·",
}
Room {
	id = "hmy/pingding/road7",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["westdown"] = "hmy/pingding/road6",
		["east"] = "group/entry/hmyroad8",
	},
	room_relative="��·����·-----��·��·",
}
Room {
	id = "hmy/pingding/road9",
	name = "��·",
	outdoor = "ƽ����",
	ways = {
		["northwest"] = "group/entry/hmyroad8",
		["east"] = "cangzhou/sancakou",
	},
	room_relative="��·�I��·-----����·��·",
}
Room {
	id = "hmy/pingding/xchidian",
	name = "С�Ե�",
	outdoor = "ƽ����",
	ways = {
		["north"] = "hmy/pingding/cj2",
	},
	room_relative="���֣�С�Ե�С�Ե�",
}
Room {
	id = "hmy/pingding/yaopu",
	name = "ҩ��",
	outdoor = "ƽ����",
	ways = {
		["east"] = "hmy/pingding/cj3",
	},
	room_relative="ҩ��-----����ҩ��",
}
Room {
	id = "hmy/qiandian",
	name = "ǰ��",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/changlang",
		["west"] = "hmy/shibanlu",
	},
	blocks = {
		["east"] = {
			{id = "shi zhe", exp = 1500000},
		},
	precmds = {
              ["east"] = "kill shi zhe",
	},
	},
	
}
Room {
	id = "hmy/qiangu",
	name = "ǧ��ʯ",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/baizhang",
	},
	objs = {
          ["Ұ��"] = "ye lang",
           },
	room_relative="����Ȫ��ǧ��ʯǧ��ʯ",
}
Room {
	id = "hmy/qlongtang",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/changlang2",
	},
	objs = {
          ["�Ϲ���"] = "shangguan yun",
           },
	room_relative="������----����������",
}
Room {
	id = "hmy/qqiudian",
	name = "ǧ���",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/changlang3",
		["west"] = "hmy/changlang2",
	},
	objs = {
          ["����"] = "qu yang",
           },
	room_relative="����----ǧ���----����ǧ���",
}
Room {
	id = "hmy/rusheng",
	name = "��ʤͤ",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/wulao",
	},
	objs = {
          ["С��"] = "xiao hou",
           },
	room_relative="���Ϸ����ʤͤ��ʤͤ",
}
Room {
	id = "hmy/ryping",
	name = "����ƺ",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/shimen",
		["#hmyUp"] = "hmy/yading",
	},
	lengths = {
		["#hmyUp"] = "if not skills['dodge'] or skills['dodge'].lvl<200 or hp.neili_max<4000 then return false else return 10 end",
	},
}
Room {
	id = "hmy/shandao",
	name = "ɽ��",
	outdoor = "��ľ��",
	ways = {
		["westup"] = "hmy/shandao2",
		["west"] = "hmy/changtan",
	},
	room_relative="ɽ��--��̲ɽ��",
}
Room {
	id = "hmy/shandao2",
	name = "ɽ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/shandao",
		["westup"] = "hmy/baichi",
	},
	room_relative="����ڡ�ɽ����ɽ��ɽ��",
}
Room {
	id = "hmy/shibanlu",
	name = "ʯ��·",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/pailou",
		["east"] = "hmy/qiandian",
	},
	lengths = {
		["east"] = "if hp.exp > 1500000 then return 1 else return false end",
	},
}
Room {
	id = "hmy/shidao",
	name = "ʯ��",
	outdoor = "��ľ��",
	ways = {
		["southeast"] = "hmy/pingding/road5",
		["north"] = "hmy/shidao2",
	},
	room_relative="ʯ����ʯ���K��·ʯ��",
}
Room {
	id = "hmy/shidao2",
	name = "ʯ��",
	outdoor = "��ľ��",
	ways = {
		["westdown"] = "hmy/xxtan",
		["south"] = "hmy/shidao",
		["east"] = "hmy/liangting",
	},
	objs = {
          ["����"] = "wang cheng",
           },
	room_relative="����̲��ʯ��-----��ͤ��ʯ��ʯ��",
}
Room {
	id = "hmy/shifang",
	name = "��ʳ��",
	outdoor = "��ľ��",
	no_fight = true,
	ways = {
		["west"] = "hmy/changlang4",
	},
	objs = {
          ["��÷��"] = "suanmei tang",
          ["����"] = "zong zi",
          ["��ʦ"] = "chu zi",
           },
	room_relative="����----��ʳ����ʳ��",
}
Room {
	id = "hmy/shijie",
	name = "ʯ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/baichi",
		["westup"] = "hmy/shijie2",
	},
	room_relative="ʯ�ס�ʯ�ס������ʯ��",
}
Room {
	id = "hmy/shijie2",
	name = "ʯ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/shijie",
		["westup"] = "hmy/shimen",
	},
	room_relative="ʯ�š�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "hmy/shimen",
	name = "ʯ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/shijie2",
		["#toRyp"] = "hmy/ryping",
	},
	nolooks = {
		["#toRyp"] = true,
		["westup"] = true,
	},
	lengths = {
		["#toRyp"] = 50,
	},
	objs = {
          ["�ֲ�"] = "jia bu",
           },
}
Room {
	id = "hmy/shiwu",
	name = "Сʯ��",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/houhuayen", 
	},
	room_relative="Сʯ��----��԰Сʯ��",
}
Room {
	id = "hmy/shufang",
	name = "�鷿",
	outdoor = "��ľ��",
	ways = {
		["north"] = "hmy/changlang3",
	},
	room_relative="���ȣ��鷿�鷿",
}
Room {
	id = "hmy/suo",
	name = "����",
	outdoor = "��ľ��",
	ways = {
		["westdown"] = "hmy/baichi",
	},
	room_relative="����ڡ���������",
}
Room {
	id = "hmy/taohua",
	name = "�һ���",
	outdoor = "��ľ��",
	ways = {
		["northup"] = "hmy/meimao",
		["westup"] = "hmy/zisi",
		["west"] = "hmy/ziyun",
	},
	objs = {
          ["����"] = "hou zi",
           },
	room_relative="üë�¡�������----�һ����һ���",
}
Room {
	id = "hmy/wulao",
	name = "���Ϸ�",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/rusheng",
		["east"] = "hmy/ziyun",
		["north"] = "hmy/yiping",
		["west"] = "hmy/lianhua",
	},
	objs = {
          ["Ұ��"] = "ye lang",
          ["С��"] = "xiao hou",
           },
	room_relative="һƷ�£���Ѫ��----���Ϸ�----�����£���ʤͤ���Ϸ�",
}
Room {
	id = "hmy/xhuayuan",
	name = "С��԰",
	outdoor = "��ľ��",
	ways = {
		["west"] = "hmy/xiaoshe",
		["up"] = "hmy/dedao",
	},
	
}
Room {
	id = "hmy/xian",
	name = "���˶�",
	outdoor = "��ľ��",
	ways = {
		["westdown"] = "hmy/xianren",
	},
	room_relative="����ָ·�����˶����˶�",
}
Room {
	id = "hmy/xiangfang",
	name = "�᷿",
	outdoor = "��ľ��",
	no_fight = true,
	ways = {
		["west"] = "hmy/pailou",
	},
	room_relative="��¥-----�᷿�᷿",
}
Room {
	id = "hmy/xianren",
	name = "����ָ·",
	outdoor = "��ľ��",
	ways = {
		["eastup"] = "hmy/xian",
		["westup"] = "hmy/lianhua",
	},
	objs = {
          ["����"] = "hu die",
           },
	room_relative="��Ѫ�¡�����ָ·�����˶�����ָ·",
}
Room {
	id = "hmy/xiaoshe",
	name = "С��",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/xhuayuan",
	},
	room_relative="С��԰--С��",
}
Room {
	id = "hmy/xiuxishi",
	name = "��Ϣ��",
	outdoor = "��ľ��",
	no_fight = true,
	ways = {
		["south"] = "hmy/changlang4",
	},
	room_relative="����--��Ϣ��",
}
Room {
	id = "hmy/xxtan",
	name = "����̲",
	outdoor = "��ľ��",
	ways = {
		["eastup"] = "hmy/shidao2",
		["dutan"] = "hmy/changtan"
	},
	room_relative="����̲��ʯ������̲",
}
Room {
	id = "hmy/yading",
	name = "�¶�",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/pailou",
		["#hmyDown"] = "hmy/ryping",
	},
	lengths = {
		["#hmyDown"] = "if hp.neili_max>4000 then return 10 else return false end",
	},
	objs = {
          ["����ʹ��"] = "shi zhe",
           },
}
Room {
	id = "hmy/yiping",
	name = "һƷ��",
	outdoor = "��ľ��",
	ways = {
		["south"] = "hmy/wulao", 
	},
	room_relative="һƷ�£����Ϸ�һƷ��",
}
Room {
	id = "hmy/yiting",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["west"] = "hmy/changlang6",
	},
	room_relative="����----������������",
}
Room {
	id = "hmy/yupingpu",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["westdown"] = "hmy/baizhang",
		["east"] = "hmy/lianhua",
		["north"] = "hmy/guanpu", 
	},
	room_relative="����ͤ������Ȫ��������----��Ѫ��������",
}
Room {
	id = "hmy/zhuquetang",
	name = "��ȸ��",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/cddian",
		["west"] = "hmy/baihutang",
	},
	objs = {
          ["�����"] = "bao dachu",
           },
	room_relative="�׻���----��ȸ��----�ɵµ���ȸ��",
}
Room {
	id = "hmy/zisi",
	name = "��ʯ��",
	outdoor = "��ľ��",
	ways = {
		["eastdown"] = "hmy/taohua",  
	},
	objs = {
          ["�۷�"] = "mi feng",
           },
	room_relative="��ʯ�¡��һ�����ʯ��",
}
Room {
	id = "hmy/ziyun",
	name = "������",
	outdoor = "��ľ��",
	ways = {
		["east"] = "hmy/taohua",  
		["west"] = "hmy/wulao",  
	},
	room_relative="���Ϸ�----������----�һ���������",
}
Room {
	id = "huanghe/bingcao",
	name = "������",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/shixiazi",
		["northeast"] = "huanghe/yinpanshui",
	},
	room_relative="ʯϿ�ӣ�Ӫ��ˮ������",
}
Room {
	id = "huanghe/caodi1",
	name = "�ݵ�",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "city/hsroad1",
		["west"] = "huanghe/caodi2",
	},
	room_relative="�ݵ�-----�ݵأ�������ݵ�",
}
Room {
	id = "huanghe/caodi2",
	name = "�ݵ�",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/caodi1",
		["west"] = "huanghe/shulin1",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
   room_relative="����-----�ݵ�-----�ݵزݵ�",
           },
}
Room {
	id = "huanghe/cschang",
	name = "��ʯ��",
	outdoor = "�ƺ�����",
	no_fight = true,
	ways = {
		["northup"] = "huanghe/hhgate",
	},
	objs = {
          ["���"] = "li gonggong",
           },
    room_relative="�ƺӰ�կ��--��ʯ��",
}
Room {
	id = "huanghe/daba",
	name = "�ƺӴ��",
	outdoor = "�ƺ�����",
	no_fight = true,
	ways = {
		["southdown"] = "huanghe/huanghe7",
	},
	room_relative="�ƺӴ�̡��ƺӰ��߻ƺӴ��",
}
Room {
	id = "huanghe/dacaigou",
	name = "���",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/gulang",
		["north"] = "huanghe/wuqiao",
	},
	room_relative="���ˣ���������",
}
Room {
	id = "huanghe/fendi",
	name = "Ĺ��",
	outdoor = "�ƺ�����",
	no_fight = true,
	ways = {
		["south"] = "huanghe/shulin6",
	},
	objs = {
          ["���"] = "hu fei",
           },
  room_relative="Ĺ�أ�����Ĺ��",
}
Room {
	id = "huanghe/gchang",
	name = "�㳡",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/hhgate",
		["west"] = "huanghe/xyting",
	},
	objs = {
          ["Ǯ�ཡ"] = "qian qingjian",
          ["������"] = "wu qinglie",
           },
  room_relative="������-----�㳡-----�ƺӰ�կ�Ź㳡",
}

Room {
	id = "huanghe/hetao",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/weifen",
		["northwest"] = "huanghe/huanghe_1",
	},
	room_relative="�ƺӨI���ף�μ���������",
}
Room {
	id = "huanghe/hhgate",
	name = "�ƺӰ�կ��",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/huanghe1",
		["southdown"] = "huanghe/cschang",
		["west"] = "huanghe/gchang",
	},
	objs = {
          ["�����"] = "shen qinggang",
          ["������"] = "ma qingxiong",
  
           },
		   room_relative="�㳡--�ƺӰ�կ��--�ƺӰ��ߡ���ʯ���ƺӰ�կ��",
}

Room {
	id = "huanghe/huanghe1",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/tiandi4",
		["north"] = "huanghe/weifen",
		["east"] = "huanghe/huanghe2",
		["west"] = "huanghe/hhgate",
	},
	objs = {
          ["��ͨ��"] = "hou tonghai",
  room_relative="μ��������ƺӰ�կ��---�ƺӰ���---�ƺӰ��ߣ���ػƺӰ���",
           },
}
Room {
	id = "huanghe/huanghe2",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/huanghe3",
		["west"] = "huanghe/huanghe1",
	},
	room_relative="�ƺӰ���---�ƺӰ���---�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe3",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/huanghe4",
		["west"] = "huanghe/huanghe2",
	},
	room_relative="�ƺӰ���---�ƺӰ���---�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe4",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["northeast"] = "huanghe/huanghe5",
		["west"] = "huanghe/huanghe3",
	},
	room_relative="�ƺӰ��ߨJ�ƺӰ���---�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe5",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/huanghe4",
		["east"] = "taishan/daizong",
		["northeast"] = "huanghe/huanghe6",
	},
 room_relative="�ƺӰ��ߨJ�ƺӰ���---��ڷ��L�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe6",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/huanghe5",
		["northeast"] = "huanghe/huanghe7",
	},
	objs = {
          ["������"] = "lin yulong",
          ["�η���"] = "ren feiyan",
           },
	room_relative="�ƺӰ��ߨJ�ƺӰ��ߨL�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe7",
	name = "�ƺӰ���",
	outdoor = "�ƺ�����",
	ways = {
		["northup"] = "huanghe/daba",
		["southwest"] = "huanghe/huanghe6",
		["northwest"] = "huanghe/yyd/damen",
		["northeast"] = "huanghe/huanghe8",
	},
room_relative="�������ŻƺӴ�̻ƺ��뺣�ڨI���J�ƺӰ��ߨL�ƺӰ��߻ƺӰ���",
}
Room {
	id = "huanghe/huanghe8",
	name = "�ƺ��뺣��",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/huanghe7",
		["north"] = "huanghe/road2",
	},
	room_relative="��ɿڣ��ƺ��뺣�ڨL�ƺӰ��߻ƺ��뺣��",
}
Room {
	id = "huanghe/huanghe_1",
	name = "�ƺ�",
	outdoor = "�ƺ�����",
	ways = {
		["southeast"] = "huanghe/hetao",
		["northwest"] = "huanghe/huangtu",
	},
	room_relative="������ԭ�I�ƺӨK���׻ƺ�",
}
Room {
	id = "huanghe/huanghe_2",
	name = "�ƺ�",
	outdoor = "�ƺ�����",
	ways = {
		["northeast"] = "huanghe/huangtu",
		["west"] = "huanghe/huanghe_3",
	},
	room_relative="������ԭ���ƺӻƺ�",
}
Room {
	id = "huanghe/huanghe_3",
	name = "�ƺ�",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/huanghe_2",
	},
	room_relative="�ƺ�--�ƺ�",
}
Room {
	id = "huanghe/huangtu",
	name = "������ԭ",
	outdoor = "�ƺ�����",
	ways = {
		["southeast"] = "huanghe/huanghe_1",
		["northwest"] = "changan/road2",
	},
room_relative="�½��ɿڨI������ԭ�K�ƺӻ�����ԭ",
}

Room {
	id = "huanghe/kedian",
	name = "�͵�",
	outdoor = "�ƺ�����",
	no_fight = true,
	ways = {
		["up"] = "huanghe/kedian2",
	},
}
Room {
	id = "huanghe/kedian2",
	name = "�͵��¥",
	outdoor = "�ƺ�����",
	ways = {
		["enter"] = "huanghe/kedian3",
		["down"] = "huanghe/kedian",
	},
}
Room {
	id = "huanghe/kedian3",
	name = "�͵��¥",
	outdoor = "�ƺ�����",
	no_fight = true,
	ways = {
		["out"] = "huanghe/kedian2",
	},
}
Room {
	 id = "huanghe/road2",
        name = "��ɿ�",
        ways = {
                ["south"] = "huanghe/huanghe8",
                ["#duHhe"] = "huanghe/road3",
                ["#ptoSld"] = "sld/dukou",
        },
        nolooks = {
                ["enter"] = true,
                ["#duHhe"] = true,
                ["#ptoSld"] = true,
        },
        lengths = {
                ["#duHhe"] = "if not road.huanghe2 then return 10000 else return false end",
                ["#ptoSld"] = "if score.party and score.party=='������' then return 10 else return false end",
     },
	 room_relative="��ɿڣ��ƺ��뺣�ڴ�ɿ�",
}
Room {
	id = "huanghe/road3",
        name = "��ɿ�",
        ways = {
                ["north"] = "cangzhou/sroad4",
                ["#duHhe"] = "huanghe/road2",
        },
        lengths = {
                ["#duHhe"] = "if not road.huanghe2 then return 10000 else return false end",
        },
        nolooks = {
                ["enter"] = true,
                ["#duHhe"] = true,
        },
		room_relative="�ٵ�����ɿڴ�ɿ�",
}
Room {
	id = "huanghe/shamo",
	name = "ɳĮ",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/shamo1",
		["east"] = "huanghe/shamo",
		["north"] = "huanghe/shamo",
		["west"] = "huanghe/shamo",
	},
}
Room {
	id = "lanzhou/shamo1",
	name = "ɳĮ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/shamo",
		["enter"] = "lanzhou/shidong",
		["east"] = "lanzhou/shamo",
		["north"] = "lanzhou/shamo",
		["west"] = "lanzhou/shamo",
	},
}

Room {
	id = "huanghe/shidong",
	name = "ʯ��",
	outdoor = "�ƺ�����",
	ways = {
		["out"] = "huanghe/shamo1",
	},
}
Room {
	id = "huanghe/shimen",
	name = "ʯ��",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/hongshanxia",
		["northwest"] = "huanghe/yinpanshui",
		["north"] = "huanghe/wufosi",
	},
	room_relative="��ɽϿ��Ӫ��ˮ-----�����ʯ��",
}
Room {
	id = "huanghe/shixiazi",
	name = "ʯϿ��",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/tumenzi",
		["northeast"] = "huanghe/bingcao",
	},
	room_relative="�����ӣ�������ʯϿ��",
}
Room {
	id = "huanghe/shulin1",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["north"] = "huanghe/shulin3",
		["east"] = "huanghe/caodi2",
		["west"] = "huanghe/shulin2",
	},
	objs = {
          ["ʯ��"] = "shi kuai",
	room_relative="���֣�����-----����-----�ݵ�����",
           },
}
Room {
	id = "huanghe/shulin2",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "zhiye/caikuang-chang0",
		["north"] = "huanghe/shulin4",
		["east"] = "huanghe/shulin1",
	},
	objs = {
          ["����"] = "hui lang",
	room_relative="���֣�����-----���֨L�ɿ��������",
           },
}
Room {
	id = "huanghe/shulin3",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/shulin1",
		["north"] = "huanghe/tiandi1",
		["west"] = "huanghe/shulin4",
	},
	room_relative="��أ�����-----���֣���������",
}
Room {
	id = "huanghe/shulin4",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/shulin2",
		["northwest"] = "group/entry/hhshulin5",
		["east"] = "huanghe/shulin3",
	},
	objs = {
          ["����"] = "hu li",
           },
   room_relative="���֨I����-----���֣���������",
}
Room {
	id = "huanghe/shulin6",
	name = "����",
	outdoor = "�ƺ�����",
	ways = {
		["north"] = "huanghe/fendi",
		["east"] = "group/entry/hhshulin5",
	},
	room_relative="Ĺ�أ�����-----��������",
}
Room {
	id = "huanghe/tiandi1",
	name = "���",
	outdoor = "�ƺ�����",
	ways = {
		["south"] = "huanghe/shulin3",
		["east"] = "huanghe/tiandi3",
		["west"] = "huanghe/tiandi2",
	},
	room_relative="���-----���-----��أ��������",
}
Room {
	id = "huanghe/tiandi2",
	name = "���",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "group/entry/hhshulin5",
		["east"] = "huanghe/tiandi1",
	},
	objs = {
          ["���ţ"] = "da huangniu",
           },
	room_relative="���֣�������",
}
Room {
	id = "huanghe/tiandi3",
	name = "���",
	outdoor = "�ƺ�����",
	ways = {
		["northeast"] = "huanghe/tiandi4",
		["west"] = "huanghe/tiandi1",
	},
 room_relative="��بJ���-----������",
}
Room {
	id = "huanghe/tiandi4",
	name = "���",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "huanghe/tiandi3",
		["east"] = "taishan/hsroad2",
		["north"] = "huanghe/huanghe1",
	},
	objs = {
          ["Ұ��"] = "ye gou",
	room_relative="�ƺӰ��ߣ����-----��ʯ����L������",
           },
}
Room {
	id = "huanghe/weifen",
	name = "μ������",
	outdoor = "�ƺ�����",
	ways = {
		["southwest"] = "nanyang/yidao4",
		["south"] = "huanghe/huanghe1",
		["north"] = "huanghe/hetao",
	},
	room_relative="���ף�μ������L�����ֻƺӰ���μ������",
}

Room {
	id = "huanghe/xyting",
	name = "������",
	outdoor = "�ƺ�����",
	ways = {
		["east"] = "huanghe/gchang",
	},
	objs = {
          ["������"] = "peng lianhu",
          ["������"] = "liang ziweng",
          ["ɳͨ��"] = "sha tongtian",
           },
	room_relative="������----�㳡������",
}
Room {
	id = "huanghe/yyd/chufang",
	name = "����",
	outdoor = "����",
	ways = {
		["east"] = "huanghe/yyd/dating",
	},
}
Room {
	id = "huanghe/yyd/damen",
	name = "��������",
	outdoor = "����",
	no_fight = true,
	ways = {
		["southeast"] = "huanghe/huanghe7",
		["#inxiaofu"] = "huanghe/yyd/dating",
	},
	nolooks = {
		["#inxiaofu"] = true,
	},
	objs = {
          ["����"] = "zhang ma",
    },
}
Room {
	id = "huanghe/yyd/dating",
	name = "��������",
	outdoor = "����",
	ways = {
		["south"] = "huanghe/yyd/damen",
		["north"] = "huanghe/yyd/houyuan",
		["west"] = "huanghe/yyd/chufang",
		["east"] = "huanghe/yyd/shufang",
	},
}
Room {
	id = "huanghe/yyd/houshan",
	name = "��ɽ",
	outdoor = "����",
	ways = {
		["south"] = "huanghe/yyd/houyuan",
	},
}
Room {
	id = "huanghe/yyd/houyuan",
	name = "��Ժ",
	outdoor = "����",
	ways = {
		["south"] = "huanghe/yyd/dating",
	},
}  
Room {
	id = "huanghe/yyd/shufang",
	name = "�鷿",
	outdoor = "����",
	ways = {
		["west"] = "huanghe/yyd/dating",
	},
	room_relative="��������-----�鷿�鷿",
}
Room {
	id = "huashan/baichi",
	name = "�ٳ�Ͽ",
	outdoor = "��ɽ",
	ways = {
		["eastup"] = "huashan/laojun",
		["northdown"] = "huashan/qianchi",
	},
room_relative="ǧ�ߴ����ٳ�Ͽ���Ͼ����ٳ�Ͽ",
}
Room {
	id = "huashan/canglong",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["westup"] = "huashan/sheshen",
		["northdown"] = "huashan/husun",
		["southdown"] = "huashan/zhenyue",
	},
	objs = {
          ["����"] = "hou zi",
	 room_relative="�����������¡��������������������",
           },
}
Room {
	id = "huashan/cave",
	name = "�ܶ�",
	outdoor = "��ɽ",
	ways = {
		["right"] = "huashan/rukou",
	},
}
Room {
	id = "huashan/celang1",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["east"] = "huashan/qianting",
		["west"] = "huashan/lianwu1",
	},
	room_relative="���䳡-----����-----ǰ������",
}
Room {
	id = "huashan/celang2",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["east"] = "huashan/lianwu2",
		["west"] = "huashan/qianting",
	},
	room_relative="ǰ��-----����-----���䳡����",
}
Room {
	id = "huashan/celang3",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/xiuxi1",
		["east"] = "huashan/houtang",
		["west"] = "huashan/fanting",
	},
	room_relative="����-----����-----���ã�Ů��Ϣ�Ҳ���",
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
         ["west"] = "if job.room=='����' or job.room=='ҩ��' then return 1 elseif flag.times and flag.times<3 then return 6 else return 1 end",
	},
}
Room {
	id = "huashan/celang4",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/xiuxi2",
		["east"] = "huashan/shuyuan",
		["west"] = "huashan/houtang",
	},
	room_relative="����-----����-----��Ժ������Ϣ�Ҳ���",
	lengths = {
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "huashan/chaoyang",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["westdown"] = "huashan/zhenyue",
	},
	room_relative="�������������峯����",
}
Room {
	id = "huashan/fanting",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "huashan/yaofang",
		["east"] = "huashan/celang3",
	},
	precmds = {
    ["north"] = "drop hulu;drop rice;drop jitui;drop rou pian;drop huasheng;drop tangcu liyu",
	["east"] = "drop hulu;drop rice;drop jitui;drop rou pian;drop huasheng;drop tangcu liyu",
	},
	objs = {
          ["��ˮ��«"] = "qingshui hulu",
           },
  room_relative="ҩ��������-----���ȷ���",
}
Room {
	id = "huashan/hole",
	name = "˼���¶���",
	outdoor = "��ɽ",
	ways = {
		["out"] = "huashan/siguoya",
	},
	room_relative="˼���¶��ڡ�˼����˼���¶���",
}
Room {
	id = "huashan/hole2",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["out"] = "huashan/song",
	},
}
Room {
	id = "huashan/houshan",
	name = "��ɽ",
	outdoor = "��ɽ",
	ways = {
		["northdown"] = "huashan/midong",
	},
}
Room {
	id = "huashan/houtang",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/qinshi",
		["north"] = "huashan/zhengqi",
		["east"] = "huashan/celang4",
		["west"] = "huashan/celang3",
	},
	objs = {
          ["½����"] = "lu dayou",
	room_relative="�����ã�����-----����-----���ȣ����Һ���",
           },
}
Room {
	id = "huashan/husun",
	name = "�����",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "huashan/canglong",
		["northdown"] = "huashan/laojun",
	},
	objs = {
          ["����"] = "hou zi",
	room_relative="�Ͼ����������������������",
           },
}
Room {
	id = "huashan/jiabi",
	name = "��ɽ��",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shiwu1",
		["out"] = "huashan/siguoya",
	},
	
}
Room {
	id = "huashan/jinshe/biding",
	name = "�ڶ�",
	outdoor = "��ɽ",
	ways = {
		["down"] = "huashan/husun",
	},
}
Room {
	id = "huashan/jitan",
	name = "��̳",
	outdoor = "��ɽ",
	ways = {
		["out"] = "huashan/yunuci",
	},
	objs = {
          ["����ɺ"] = "yue lingshan",
	 },
	 room_relative="��̳����Ů����̳",
}
Room {
	id = "huashan/kongdi",
	name = "�յ�",
	outdoor = "��ɽ",
	ways = {
		["north"] = "huashan/shulin1",
		["southdown"] = "huashan/v-road-1",
	},
	room_relative="�����֣��յء��յ�",
}
Room {
	id = "huashan/laojun",
	name = "�Ͼ���",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "huashan/husun",
		["westdown"] = "huashan/baichi",
	},
	objs = {
          ["����"] = "hou zi",
           },
	room_relative="�ٳ�Ͽ���Ͼ�����������Ͼ���",
}
Room {
	id = "huashan/lianwu1",
	name = "���䳡",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/yaofang",
		["east"] = "huashan/celang1",
	},
	room_relative="���䳡----���ȣ�ҩ�����䳡",
	objs = {
          ["�͵�ŵ"] = "lao denuo",
           },
}
Room {
	id = "huashan/lianwu2",
	name = "���䳡",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/wuqiku",
		["west"] = "huashan/celang2",
	},
	
	objs = {
          ["ʩ����"] = "shi daizi",
           },
	room_relative="����----���䳡���������䳡",
}
Room {
	id = "huashan/maowu",
	name = "é��",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/v-road-1",
	},
}
Room {
	id = "huashan/midao",
	name = "�ܵ�",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/midong",
		["left"] = "huashan/rukou",
	},
}
Room {
	id = "huashan/midong",
	name = "�ض�",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/midong",
		["southwest"] = "huashan/midong",
		["south"] = "huashan/midong",
		["northwest"] = "huashan/midong",
		["north"] = "huashan/midong",
		["east"] = "huashan/midong",
		["northeast"] = "huashan/midong",
		["west"] = "huashan/midong",
	},
}
Room {
	id = "huashan/path1",
	name = "ɽ����",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/shaluo",
		["south"] = "huashan/shulin",
		["north"] = "huashan/yuquan",
		["west"] = "village/eexit",
	},
	
	lengths = {
		["south"] = 7,
	},	
	room_relative="��ȪԺ�������----ɽ���£��K����ɯ��ƺɽ����",
	
}
Room {
	id = "huashan/pubu",
	name = "�ٲ�",
	outdoor = "��ɽ",
	ways = {
		["east"] = "huashan/yunu",
		["tiao tan;#walkBusy"] = "huashan/shuitan",
	},
	nolooks = {
		["tiao tan;#walkBusy"] = true,
	},
	lengths = {
		["tiao tan;#walkBusy"] = 20,
	},
	objs = {
          ["����"] = "qing wa",
           },
	room_relative="�ٲ�-----��Ů���ٲ�",
}
Room {
	id = "huashan/shuitan",
	name = "�ٲ���",
	outdoor = "��ɽ",
	ways = {
		["qian up"] = "huashan/pubu",
	},
	nolooks = {
		["qian up"] = true,
	},
	objs = {
          ["����"] = "e yu",
           },
}
Room {
	id = "huashan/qianchi",
	name = "ǧ�ߴ�",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "huashan/baichi",
		["westdown"] = "huashan/qingke",
	},
	room_relative="���ƺ��ǧ�ߴ����ٳ�Ͽǧ�ߴ�",
}
Room {
	id = "huashan/qianting",
	name = "ǰ��",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/zhengqi",
		["east"] = "huashan/celang2",
		["northdown"] = "huashan/taijie",
		["west"] = "huashan/celang1",
	
	},
        precmds = {
              ["south"] = "#walkBusy",
	},
	objs = {
          ["��ɽ������"] = "board",
	room_relative="̨�ס�����-----ǰ��-----���ȣ�������ǰ��",
           },
}
Room {
	id = "huashan/qingke",
	name = "���ƺ",
	outdoor = "��ɽ",
	ways = {
		["eastup"] = "huashan/qianchi",
		["northdown"] = "huashan/shaluo",
	},
  room_relative="ɯ��ƺ�����ƺ��ǧ�ߴ����ƺ",
}
Room {
	id = "huashan/qinshi",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "huashan/houtang",
	},
	objs = {
          ["����"] = "sheng zi",
           },
	room_relative="���ã���������",
}
Room {
	id = "huashan/rukou",
	name = "ɽ��",
	outdoor = "��ɽ",
}
Room {
	id = "huashan/shaluo",
	name = "ɯ��ƺ",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "huashan/qingke",
		["northwest"] = "huashan/path1",
		["northeast"] = "huashan/shanhong",
	},
	room_relative="ɽ����ɽ���ٲ��I�Jɯ��ƺ�����ƺɯ��ƺ",
}
Room {
	id = "huashan/shanhong",
	name = "ɽ���ٲ�",
	outdoor = "��ɽ",
	ways = {
		["southwest"] = "huashan/shaluo",
	},
	room_relative="ɽ���ٲ��Lɯ��ƺɽ���ٲ�",
}
Room {
	id = "huashan/shanlu1",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/shanlu2",
		["north"] = "huashan/yunu",
	},
	objs = {
          ["����"] = "hou zi",
	room_relative="��Ů���ɽ·�Kɽ·ɽ·",
           },
}
Room {
	id = "huashan/shanlu2",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["southup"] = "huashan/taijie",
		["southwest"] = "huashan/xiaoxi",
		["northwest"] = "huashan/shanlu1",
	},
	objs = {
          ["����"] = "hou zi",
	room_relative="ɽ·�Iɽ·�L��СϪ̨��ɽ·",
           },
}
Room {
	id = "huashan/sheshen",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["eastdown"] = "huashan/canglong",
	},
	room_relative="�����¡�������������",
}
Room {
	id = "huashan/shiwu",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulin4",
	},
	objs = {
          ["������"] = "mu renqing",
           },
   room_relative="������-----ʯ��ʯ��",
}
Room {
	id = "huashan/shiwu1",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["east"] = "huashan/jiabi",
	},
	
}
Room {
	id = "huashan/shulin",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "huashan/shulinn",
		["east"] = "huashan/shulin1",
		["west"] = "huashan/shulinn",
	},
	room_relative="�����֣�������-----����-----����������",
}
Room {
	id = "huashan/shulin1",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/kongdi",
		["north"] = "huashan/shulinn",
		["east"] = "huashan/shulin1",
		["west"] = "huashan/shulin1",
	},
	room_relative="�����֣�������----������----�����֣��յ�������",
}
--[[Room {
	id = "huashan/shulinn",
	name = "������",
	ways = {
		["#hsssl"] = "huashan/shiwu",
	},
	nolooks = {
		["#hsssl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#hsssl"] = 50,
	},
	find = {
		path = {"n;w"}, count = 20,
	},
}]]
Room {
	id = "huashan/shulinn",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn1",
	},
}
Room {
	id = "huashan/shulinn1",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn2",
	},
}
Room {
	id = "huashan/shulinn2",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn3",
	},
}
Room {
	id = "huashan/shulinn3",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn4",
	},
}
Room {
	id = "huashan/shulinn4",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn5",
	},
}
Room {
	id = "huashan/shulinn5",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn6",
	},
}
Room {
	id = "huashan/shulinn6",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn7",
	},
}
Room {
	id = "huashan/shulinn7",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn8",
	},
}
Room {
	id = "huashan/shulinn8",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinn9",
	},
}
Room {
	id = "huashan/shulinn9",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "huashan/shulinnn",
	},
}
Room {
	id = "huashan/shulinnn",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["#hsssl"] = "huashan/shiwu",
	},
	nolooks = {
		["#hsssl"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#hsssl"] = 50,
	},
	find = {
		path = {"n;w"}, count = 20,
	},
}
Room {
	id = "huashan/shulin4",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/path1",
		["east"] = "huashan/shiwu",
		["north"] = "huashan/kongdi",
		["west"] = "huashan/shulin4",
	},
	room_relative="ɽ���£�ʯ��-----�յأ�������������",
}
Room {
	id = "huashan/shuyuan",
	name = "��Ժ",
	outdoor = "��ɽ",
	ways = {
		["north"] = "huashan/wuqiku",
		["west"] = "huashan/celang4",
	},
	objs = {
          ["������Ҫ"] = "shu",
	room_relative="����������-----��Ժ��Ժ",
           },
}
Room {
	id = "huashan/siguoya",
	name = "˼����",
	outdoor = "��ɽ",
	ways = {
		["eastdown"] = "huashan/xiaolu2",
		["enter"] = "huashan/hole",
		["#Fqy"] = "huashan/fengqingyang",
	},
	nolooks = {
		["#Fqy"] = true,
		["enter"] = true,
	},
	objs = {
          ["�����"] = "linghu chong",
           },
	lengths = {
		["#Fqy"] = "if MidHsDay[locl.time] and score.master=='������' then return false else return 1 end",
	},
	room_relative="˼���¶��ڡ�˼���¡�Сɽ·˼����",
}
Room {
	id = "huashan/fengqingyang",
	name = "��ɽ��",
	outdoor = "��ɽ",
	ways = {
		["out"] = "huashan/siguoya",
	},
	objs = {
          ["������"] = "feng qingyang",
           },
}
Room {
	id = "huashan/taijie",
        name = "̨��",
		outdoor = "��ɽ",
        ways = {
                ["southup"] = "huashan/qianting",
                ["northdown"] = "huashan/shanlu2",
        },
        objs = {
          ["����"] = "liang fa",
           },
        room_relative="ɽ·��̨�ס�ǰ��̨��",
}
Room {
	id = "huashan/shentan",
	name = "ɽ��",
	outdoor = "��ɽ",
	ways = {
		["northeast"] = "huashan/v-road-1",
	},
	room_relative="ɽ���Jɽ��ɽ��",
}
Room {
	id = "huashan/v-road-1",
	name = "ɽ��",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/v-road-5",
		["southwest"] = "huashan/shentan",
		["northeast"] = "huashan/v-road-2",
		["bo guanmu"] = "huashan/maowu",
	},
	nolooks = {
		["bo guanmu"] = true,
	},
	room_relative="ɽ���Jɽ���L�Kɽ��ɽ��ɽ��",
}
Room {
	id = "huashan/v-road-2",
	name = "ɽ��",
	ways = {
		["eastup"] = "huashan/v-road-3",
		["southwest"] = "huashan/v-road-1",
	},
	room_relative="ɽ����ɽ���Lɽ��ɽ��",
}
Room {
	id = "huashan/v-road-3",
	name = "ɽ��",
	outdoor = "��ɽ",
	ways = {
		["westdown"] = "huashan/v-road-2",
		["southeast"] = "huashan/shulinn",
	},
	room_relative="ɽ����ɽ���Kɽ��",
}
Room {
	id = "huashan/v-road-5",
	name = "ɽ��",
	outdoor = "��ɽ",
	ways = {
		["northwest"] = "huashan/v-road-1",
		["bang shengzi;pa up"] = "huashan/song",
	},
	nolooks = {
		["bang shengzi;pa up"] = true,
	},
	lengths = {
		["bang shengzi;pa up"] = "if Bag['����'] then return 6 else return false end",
	},
	room_relative="ɽ���Iɽ��ɽ��",
}
Room {
	id = "huashan/song",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["enter"] = "huashan/hole2",
		["down"] = "huashan/v-road-5",
	},
}
Room {
	id = "huashan/wuqiku",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/shuyuan",
		["north"] = "huashan/lianwu2",
	},
room_relative="���䳡����������Ժ����",
}
Room {
	id = "huashan/xiaolu1",
	name = "Сɽ·",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/yunu",
		["northwest"] = "huashan/xiaolu2",
	},
	room_relative="Сɽ·�IСɽ·�K��Ů��Сɽ·",
}
Room {
	id = "huashan/xiaolu2",
	name = "Сɽ·",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "huashan/xiaolu1",
		["westup"] = "huashan/siguoya",
	},
	room_relative="˼���¡�Сɽ·�KСɽ·Сɽ·",
}
Room {
	id = "huashan/xiaoxi",
	name = "СϪ",
	outdoor = "��ɽ",
	ways = {
		["northeast"] = "huashan/shanlu2",
	},
	room_relative="ɽ·�JСϪСϪ",
}
Room {
	id = "huashan/xiuxi1",
	name = "Ů��Ϣ��",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["north"] = "huashan/celang3",
	},
	room_relative="����--Ů��Ϣ��",
}
Room {
	id = "huashan/xiuxi2",
	name = "����Ϣ��",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["north"] = "huashan/celang4",
	},
	room_relative="����--����Ϣ��",
}
Room {
	id = "huashan/yaofang",
	name = "ҩ��",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/fanting",
		["north"] = "huashan/lianwu1",
	},
    lengths = {
                ["south"] = "if job.room=='����' or job.room=='ҩ��' then return 1 elseif flag.times and flag.times<3 then return 6 else return 1 end",
        },
	room_relative="���䳡��ҩ��������ҩ��",
}
Room {
	id = "huashan/yunu",
	name = "��Ů��",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/shanlu1",
		["northwest"] = "huashan/xiaolu1",
		["east"] = "huashan/yunuci",
		["northdown"] = "huashan/zhenyue",
		["west"] = "huashan/pubu",
	},
	room_relative="Сɽ·�������I���ٲ�----��Ů��----��Ů����ɽ·��Ů��",
}
Room {
	id = "huashan/yunuci",
	name = "��Ů��",
	outdoor = "��ɽ",
	ways = {
		["enter"] = "huashan/jitan",
		["west"] = "huashan/yunu",
	
	},
	room_relative="��̳����Ů��----��Ů����Ů��",
}
Room {
	id = "huashan/yuquan",
	name = "��ȪԺ",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/path1",
	},
	objs = {
          ["������"] = "li tiezui",
           },
   room_relative="��ȪԺ��ɽ������ȪԺ",
}
Room {
	id = "huashan/zhengqi",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["south"] = "huashan/houtang",
		["north"] = "huashan/qianting",
	},
	
	
	objs = {
          ["����Ⱥ"] = "yue buqun",
          ["������"] = "ning zhongze",
	room_relative="ǰ���������ã�����������",
           },
}
Room {
	id = "huashan/zhenyue",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "huashan/canglong",
		["southup"] = "huashan/yunu",
		["eastup"] = "huashan/chaoyang",
	},
	 room_relative="������������������������Ů��������",
}
Room {
	id = "hz/baidi",
	name = "�׵�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/yuemiao",
		["southwest"] = "hz/gushan",
		["northwest"] = "hz/duanqiao",
		["north"] = "hz/qsddao1",
		["northeast"] = "hz/hubian",
		["west"] = "hz/pinghu",
	},
	 room_relative="���Ų�ѩ��ʯ��������ߨI���Jƽ������-----�׵̨L�K��ɽ������׵�",
}
Room {
	id = "hz/baoshuta",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["northdown"] = "hz/shanlu",
		["southdown"] = "hz/qsddao1",
	},
	room_relative="ɽ·����ʯ���������",
}
Room {
	id = "hz/beimen",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/qsddao6",
		["north"] = "group/entry/hzqsd7",
	},
	room_relative="��ʯ��������ţ���ʯ�������",
}
Room {
	id = "hz/changlang1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/changlang1",
		["north"] = "hz/changlang2",
		["east"] = "hz/changlang1",
		["west"] = "hz/changlang1",
	},
}
Room {
	id = "hz/changlang2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/changlang3",
		["north"] = "hz/changlang2",
		["east"] = "hz/changlang2",
		["west"] = "hz/changlang2",
	},
}
Room {
	id = "hz/changlang3",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/changlang3",
		["east"] = "hz/changlang4",
		["north"] = "hz/changlang3",
		["west"] = "hz/changlang3",
	},
}
Room {
	id = "hz/changlang4",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/changlang4",
		["north"] = "hz/changlang4",
		["east"] = "hz/changlang4",
		["west"] = "hz/huanglong",
	},
	room_relative="���ȣ�����---���ȣ�����������",
}
Room {
	id = "hz/cuihezhai",
	name = "���ի",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["west"] = "hz/qsddao4",
	},
	objs = {
          ["������"] = "zhang suanpan",
           },
	room_relative="��ʯ���--���ի",
}
Room {
	id = "hz/duanqiao",
	name = "���Ų�ѩ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/baidi",
	},
	room_relative="���Ų�ѩ�K�׵̶��Ų�ѩ",
}
Room {
	id = "hz/dxbdian",
	name = "���۱���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/tianwang",
	},
	room_relative="���۱������������۱���",
}
Room {
	id = "hz/fangheting",
	name = "�ź�ͤ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/gushan",
	},
	room_relative="�ź�ͤ����ɽ�ź�ͤ",
}
Room {
	id = "hz/feilaifeng",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/yxsdong",
		["west"] = "hz/qsddao3",
	},
	objs = {
          ["������"] = "gui xinshu",
          ["�����"] = "gui erniang",
           },
   room_relative="��ʯ���----������Kʯ�ݶ�������",
}
Room {
	id = "hz/gushan",
	name = "��ɽ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/wenlange",
		["east"] = "meizhuang/hubian",
		["north"] = "hz/fangheting",
		["northeast"] = "hz/baidi",
		["west"] = "hz/xilengqiao",
	},
	room_relative="�ź�ͤ�׵̣��J������-----��ɽ-----�����ߣ��������ɽ",
}
Room {
	id = "hz/hggyu",
	name = "���۹���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/hubian1",
		["south"] = "hz/hubian2",
		["north"] = "hz/sudi",
		["east"] = "hz/hongyuchi",
		["west"] = "hz/mudanyuan",
	},
room_relative="�յ̣������-----ĵ��԰----�����ߨK�������߻��۹���",
}
Room {
	id = "hz/hongyuchi",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "hz/hggyu",
	},
	room_relative="���۹���--�����",
}
Room {
	id = "hz/huanglong",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/shuichi",
		["southdown"] = "hz/shanlu",
	},
	room_relative="���������Kɽ·ˮ�ػ�����",
}
Room {
	id = "hz/hubian",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "hz/baidi",
		["south"] = "hz/llwying",
},
		objs = {
		["��λ�ο�"] = "you ke",
		["����"] = "dao ke",
	},
	room_relative="�����ߨL���׵�������ݺ������",
}
Room {
	id = "hz/hubian1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/jingcisi",
		["northwest"] = "hz/hggyu",
		["north"] = "hz/llwying",
		["west"] = "hz/hubian2",
},
		objs = {
		["�ο�"] = "you ke",
	},
	room_relative="���۹���I������ݺ��������----�����ߨK������������",
}
Room {
	id = "hz/hubian2",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/hupao",
		["east"] = "hz/hubian1",
		["north"] = "hz/hggyu",
},
		objs = {
		["�ο�"] = "you ke",
	},
	room_relative="���۹����������----�����ߣ�����������",
}
Room {
	id = "hz/hubian3",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "hz/baidi",
		["east"] = "hz/yuemiao",
	},
	room_relative="�׵̨I������----������������",
	objs = {
          ["ŷ����"] = "ouyang ke",
          ["������Ů"] = "shao nv",
           },
}
Room {
	id = "hz/hupao",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "hz/longjing",
		["north"] = "hz/hubian2",
		["northeast"] = "hz/yuhuang",
	},
 room_relative="�������������ɽ�I���J���ܻ���",
}
Room {
	id = "hz/huxinting",
	name = "����ͤ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/santan",
		["west"] = "hz/ruangong",
	},
	room_relative="��̶ӳ�£���պ���ͤ",
}
Room {
	id = "hz/jingcisi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/yuhuang",
		["northwest"] = "hz/hubian1",
	},
	room_relative="�����ߨI�����¨K���ɽ������",
}
Room {
	id = "hz/jingzhong",
	name = "���Ұ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/mu",
		["west"] = "hz/yuanmen",
	},
	room_relative="����Ĺ��԰�ž��Ұ�",
}
Room {
	id = "hz/jinhuazhai",
	name = "��ի",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/qsddao4",
	},
	objs = {
          ["������"] = "cui suanpan",
           },
	room_relative="��ʯ���--��ի",
}
Room {
	id = "hz/jiulou",
	name = "����¥",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/qsddao6",
	},
	room_relative="����¥----��ʯ�������¥",
}
Room {
	id = "hz/juquqiao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/santan",
		["north"] = "hz/xiaoying",
	},
	room_relative="��̶ӳ�£�СӮ�޾�����",
}
Room {
	id = "hz/kedian2",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "hz/kedian3",
		["down"] = "hz/tianxiang",
	},
}
Room {
	id = "hz/kedian3",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "hz/kedian2",
	},
}
Room {
	id = "hz/kuahong",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "hz/quyuan",
		["north"] = "hz/yingboqiao",
		["west"] = "hz/sudi",
	},
	room_relative="��԰���ӳ���ŨI���յ�----����ſ����",
}
Room {
	id = "hz/leifengta",
	name = "�׷���",
	outdoor = "���ݳ�",
	ways = {
		["westdown"] = "hz/shanlu",
	},
	room_relative="ɽ·--�׷���",
}
Room {
	id = "hz/lingyinsi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/qsddao3",
		["west"] = "hz/tianwang",
	},
	room_relative="������----������----��ʯ���������",
}
Room {
	id = "hz/liulin",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/liulin",
		["north"] = "hz/liulin1",
		["east"] = "hz/liulin",
		["west"] = "hz/liulin",
	},
	room_relative="���֣�����-----����-----���֣���������",
}
Room {
	id = "hz/liulin1",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/liulin1",
		["north"] = "hz/liulin2",
		["east"] = "hz/liulin1",
		["west"] = "hz/liulin1",
	},
	room_relative="���֣�����-----����-----���֣���������",
}
Room {
	id = "hz/liulin2",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/liulin2",
		["north"] = "hz/shanlu1",
		["east"] = "hz/liulin2",
	},
	room_relative="ɽ·������-----���֣���������",
}
Room {
	id = "hz/llwying",
	name = "������ݺ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/hubian1",
		["north"] = "hz/hubian",
	},
	room_relative="�����ߣ�������ݺ��������������ݺ",
}
Room {
	id = "hz/longjing",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/hupao",
		["northwest"] = "hz/yxsdong2",
	},
	room_relative="��ϼ���I�����ܨK����",
}
Room {
	id = "hz/majiu",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "hz/tianxiang",
	},
	room_relative="����¥--���",
}
Room {
	id = "hz/maoshe",
	name = "û����",
	ways = {
		["out"] = "hz/shanquan",
	},
}
Room {
	id = "hz/mu",
	name = "����Ĺ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "hz/jingzhong",
	},
	room_relative="���Ұ�--����Ĺ",
}
Room {
	id = "hz/mudanyuan",
	name = "ĵ��԰",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/hggyu",
	},
	room_relative="���۹���--ĵ��԰",
}
Room {
	id = "hz/pinghu",
	name = "ƽ������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/baidi",
	},
	room_relative="ƽ������---�׵�ƽ������",
}
Room {
	id = "hz/qsddao1",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["northup"] = "hz/baoshuta",
		["south"] = "hz/baidi",
	},
	room_relative="����������ʯ������׵���ʯ���",
}
Room {
	id = "hz/qsddao2",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/qsddao3",
		["south"] = "hz/sudi",
		["northwest"] = "hz/yuemiao",
		["west"] = "hz/yuquan",
	},
	room_relative="������I��Ȫ---��ʯ������K�յ���ʯ�����ʯ���",
}
Room {
	id = "hz/qsddao3",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "thd/niujia/road",
		["northwest"] = "hz/qsddao2",
		["east"] = "hz/feilaifeng",
		["west"] = "hz/lingyinsi",
	},
	room_relative="��ʯ����I������---��ʯ���---������K��·��ʯ���",
}
Room {
	id = "hz/qsddao4",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/tianxiang",
		["north"] = "hz/qsddao5",
		["east"] = "hz/cuihezhai",
		["west"] = "hz/jinhuazhai",
	},
	room_relative="��ʯ�������ի---��ʯ���---���ի�������ջ��ʯ���",
}
Room {
	id = "hz/qsddao5",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/qsddao4",
		["east"] = "hz/yaopu",
		["north"] = "hz/qsddao6",
		["west"] = "hz/zahuopu",
	},
	room_relative="��ʯ������ӻ���---��ʯ���---���괺����ʯ�����ʯ���",
}
Room {
	id = "hz/qsddao6",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/qsddao5",
		["east"] = "hz/shuyuan",
		["north"] = "hz/beimen",
		["west"] = "hz/jiulou",
	},
	room_relative="���ţ�����¥---��ʯ���---��Ժ����ʯ�����ʯ���",
}
Room {
	id = "hz/quanwu",
	name = "Ȫ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/yuquan",
	},
	room_relative="Ȫ�ݣ���ȪȪ��",
}
Room {
	id = "hz/quyuan",
	name = "��԰���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/kuahong",
		["east"] = "hz/yingxunge",
	},
	room_relative="��԰���---ӭѬ��K�������԰���",
}
Room {
	id = "hz/ruangong",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/huxinting",
	},
	room_relative="����ͤ--���",
}
Room {
	id = "hz/santan",
	name = "��̶ӳ��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "hz/juquqiao",
		["west"] = "hz/huxinting",
	},
	room_relative="�����ţ�����ͤ��̶ӳ��",
}
Room {
	id = "hz/shanlu",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["northup"] = "hz/huanglong",
		["southup"] = "hz/baoshuta",
		["eastup"] = "hz/leifengta",
	},
	room_relative="��������ɽ·���׷�����������ɽ·",
}
Room {
	id = "hz/shanlu1",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/shanlu3",
		["east"] = "hz/liulin",
		["northeast"] = "suzhou/qsgdao2",
		["west"] = "hz/liulin",
	},
	room_relative="��ʯ�ٵ��J����-----ɽ·-----���֣�ɽ·ɽ·",
}
Room {
	id = "hz/shanlu2",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["eastdown"] = "ningbo/qsddao1",
		["northdown"] = "hz/zilaidong",
	},
	room_relative="��������ɽ·����ʯ�ٵ�ɽ·",
}
Room {
	id = "hz/shanlu3",
	name = "ɽ·",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "group/entry/hzqsd7",
		["north"] = "hz/shanlu1",
		["east"] = "hz/liulin",
		["west"] = "hz/liulin",
	},
	room_relative="ɽ·������-----ɽ·-----���֣���ʯ���ɽ·",
}
Room {
	id = "hz/shanquan",
	name = "ɽȪ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/shanlu1",
		["enter"] = "hz/maoshe",
		["east"] = "hz/shanquan",
	},

}
Room {
	id = "hz/shuichi",
	name = "ˮ��",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "hz/huanglong",
		["west"] = "hz/xiaozhu",
	},
	room_relative="��������С��ˮ��",
}
Room {
	id = "hz/shuyuan",
	name = "��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "hz/qsddao6",
	},
	room_relative="��ʯ���--��Ժ",
}
Room {
	id = "hz/sudi",
	name = "�յ�",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/hggyu",
		["north"] = "hz/qsddao2",
		["east"] = "hz/kuahong",
		["west"] = "hz/yingboqiao",
	},
room_relative="��ʯ�����ӳ����-----�յ�-----����ţ����۹����յ�",
}
Room {
	id = "hz/tianwang",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/lingyinsi",
		["north"] = "hz/dxbdian",
	},
	room_relative="���۱����������----������������",
}
Room {
	id = "hz/tianxiang",
	name = "�����ջ",
	no_fight = true,
	ways = {
		["north"] = "hz/qsddao4",
		["east"] = "hz/majiu",
		["west"] = "hz/yuemiao",
	    ["#hckz"] = "hz/kedian2",
	},
	lengths = {
		["#hckz"] = 5,
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="��ʯ�����������---�����ջ---��Ǻ����ջ",
}
Room {
	id = "hz/wenlange",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "hz/gushan",
	},
	room_relative="��ɽ��������������",
}
Room {
	id = "hz/xiaoying",
	name = "СӮ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/juquqiao",
	},
	room_relative="������--СӮ��",
}
Room {
	id = "hz/xiaozhu",
	name = "С��",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "hz/changlang1",
		["east"] = "hz/shuichi",
	},
	room_relative="ˮ�أ�����С��",
}
Room {
	id = "hz/xilengqiao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/gushan",
	},
	room_relative="������----��ɽ������",
}
Room {
	id = "hz/yaopu",
	name = "���괺",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "hz/qsddao5",
	},
	room_relative="��ʯ���--���괺",
}
Room {
	id = "hz/yingboqiao",
	name = "ӳ����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "hz/kuahong",
		["east"] = "hz/sudi",
	},
	room_relative="ӳ����----�յ̣������ӳ����",
}
Room {
	id = "hz/yingxunge",
	name = "ӭѬ��",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "hz/quyuan",
	},
	room_relative="��԰���----ӭѬ��ӭѬ��",
}
Room {
	id = "hz/yuanmen",
	name = "԰��",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/jingzhong",
		["out"] = "hz/yuemiao",
	},
	room_relative="���Ұأ�������԰��",
}
Room {
	id = "hz/yuemiao",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["southeast"] = "hz/qsddao2",
		["enter"] = "hz/yuanmen",
		["northwest"] = "hz/baidi",
		["east"] = "hz/tianxiang",
		["west"] = "hz/hubian3",
	},
room_relative="�׵̨I�������ջ---������----԰�ţ���ʯ����K������",
}
Room {
	id = "hz/yuhuang",
	name = "���ɽ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "hz/hupao",
		["south"] = "hz/zilaidong",
		["northwest"] = "hz/jingcisi",
	},
	room_relative="�����¨I���ɽ�L���������������ɽ",
}
Room {
	id = "hz/yuquan",
	name = "��Ȫ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "hz/quanwu",
		["east"] = "hz/qsddao2",
	},
	room_relative="Ȫ�ݣ���Ȫ-----��ʯ�����Ȫ",
}
Room {
	id = "hz/yxsdong",
	name = "ʯ�ݶ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/yxsdong1",
		["northwest"] = "hz/feilaifeng",
	},
	room_relative="������Iʯ�ݶ��Kˮ�ֶ�ʯ�ݶ�",
}
Room {
	id = "hz/yxsdong1",
	name = "ˮ�ֶ�",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "hz/yxsdong",
		["west"] = "hz/yxsdong2",
	},
	room_relative="ʯ�ݶ��I��ϼ��----ˮ�ֶ�ˮ�ֶ�",
}
Room {
	id = "hz/yxsdong2",
	name = "��ϼ��",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "hz/longjing",
		["east"] = "hz/yxsdong1",
	},
	room_relative="��ϼ��----ˮ�ֶ��K������ϼ��",
}
Room {
	id = "hz/zahuopu",
	name = "�ӻ���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "hz/qsddao5",
	},
	objs = {
          ["���ϰ�"] = "li laoban",
           },
	room_relative="��ʯ���--�ӻ���",
}
Room {
	id = "hz/zilaidong",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southup"] = "hz/shanlu2",
		["north"] = "hz/yuhuang",
	},
	room_relative="���ɽ����������ɽ·������",
}

Room {
	id = "jiaxing/road2",
	name = "��ʯ�ٵ�",
	outdoor = "���˳�",
	ways = {
		["southeast"] = "jiaxing/road1",
		["northwest"] = "suzhou/qsgdao2",
	},
	room_relative="��ʯ�ٵ��I��ʯ�ٵ��K��ʯ�ٵ���ʯ�ٵ�",
}
Room {
	id = "jiaxing/road1",
	name = "��ʯ�ٵ�",
	outdoor = "���˳�",
	ways = {
		["southeast"] = "jiaxing/beimen",
		["northwest"] = "jiaxing/road2",
	},
	room_relative="��ʯ�ٵ��I��ʯ�ٵ��K������ʯ�ٵ�",
}
Room {
	id = "jiaxing/beimen",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/jiaxing",
		["northwest"] = "jiaxing/road1",
	},
	room_relative="��ʯ�ٵ��I���ţ��м�����",
}
Room {
	id = "jiaxing/beijie",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/beimen",
		["south"] = "jiaxing/jiaxing",
	},
	room_relative="���ţ��м�����",
}
Room {
	id = "jiaxing/jiaxing",
	name = "�м�",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/jxnanmen",
		["east"] = "jiaxing/dbianmen",
		["north"] = "jiaxing/beimen",
	},
	room_relative="���ţ��м�-----�����ţ������м�",
}
Room {
	id = "jiaxing/dongjie",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/jiaxing",
		["east"] = "jiaxing/dbianmen",
	},
	room_relative="�м��������Ŷ���",
}
Room {
	id = "jiaxing/dbianmen",
	name = "������",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/tieqiang",
		["east"] = "jiaxing/nanhu",
		["west"] = "jiaxing/jiaxing",
	},
	room_relative="�м�----������----�Ϻ�����ǹ������",
}
Room {
	id = "jiaxing/nanhu",
	name = "�Ϻ�",
	outdoor = "���˳�",
	ways = {
		["southeast"] = "jiaxing/nanhu1",
		["east"] = "jiaxing/hubian",
		["west"] = "jiaxing/dbianmen",
	},
	room_relative="������-----�Ϻ�-----���ߨK�Ϻ��Ϻ�",
}
Room {
	id = "jiaxing/nanhu1",
	name = "�Ϻ�",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/jxyanyu",
		["northwest"] = "jiaxing/nanhu",
	},
	room_relative="�Ϻ��I�Ϻ�������¥�Ϻ�",
}
Room {
	id = "jiaxing/yanyu",
	name = "����¥",
	outdoor = "���˳�",
	ways = {
		["down"] = "jiaxing/jxyanyu",
	},
	room_relative="��֪����������¥ ��֪������ ����¥",
}
Room {
	id = "jiaxing/jxyanyu",
	name = "����¥",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/nanhu1",
	},
	objs = {
          ["�"] = "yang kang",
           },
	room_relative="�Ϻ�--����¥",
}
Room {
	id = "jiaxing/hubian",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/nanhu",
	},
	room_relative="�Ϻ�-----���ߺ���",
}
Room {
	id = "jiaxing/zahuopu",
	name = "�ӻ���",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/dbianmen",
	},
	room_relative="������--�ӻ���",
}
Room {
	id = "jiaxing/xijie1",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["east"] = "jiaxing/jiaxing",
		["west"] = "jiaxing/xijie2",
	},
	room_relative="�м�����������",
}
Room {
	id = "jiaxing/xijie2",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["east"] = "jiaxing/xijie1",
		["west"] = "jiaxing/ximen",
		["south"] = "jiaxing/xiaoxiang1",
		["north"] = "jiaxing/kedian",
	},
	room_relative="���֣�����----С����м��ջ����",
}
Room {
	id = "jiaxing/kedian",
	name = "�м��ջ",
	ways = {
		["south"] = "jiaxing/xijie2",
		-- ["up"] = "jiaxing/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "jiaxing/kedian2",
	name = "�͵��¥",
	outdoor = "���˳�",
	ways = {
		["down"] = "jiaxing/kedian",
		["enter"] = "jiaxing/kefang",
	},
}
Room {
	id = "jiaxing/kefang",
	name = "�ͷ�",
	outdoor = "���˳�",
	ways = {
		["out"] = "jiaxing/xijie2",
	},
}
Room {
	id = "jiaxing/ximen",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["east"] = "jiaxing/xijie2",
	},
	room_relative="����--����",
}
Room {
	id = "jiaxing/xiaoxiang1",
	name = "С��",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/xijie2",
		["east"] = "jiaxing/xiaoxiang2",
		["south"] = "jiaxing/jiuyuan",
	},
	room_relative="���֣�С�����԰С��",
}
Room {
	id = "jiaxing/xiaoxiang2",
	name = "С��",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/xiaoxiang1",
		["east"] = "jiaxing/nanjie",
	},
	room_relative="С����Ͻ�С��",
}
Room {
	id = "jiaxing/jiuyuan",
	name = "��԰",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/xiaoxiang1",
	},
	room_relative="С��--��԰",
}
Room {
	id = "jiaxing/nanjie",
	name = "�Ͻ�",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/xiaoxiang2",
		["north"] = "jiaxing/jiaxing",
		["south"] = "jiaxing/jxnanmen",
	},
	room_relative="С����м�---�����Ͻ�",
}
Room {
	id = "jiaxing/jxnanmen",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/xiaojing2",
		["north"] = "jiaxing/jiaxing",
		["east"] = "jiaxing/tieqiang",
	},
  room_relative="�м�������-----��ǹ������С������",
}

Room {
	id = "jiaxing/tieqiang",
	name = "��ǹ��",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/jxnanmen",
		["north"] = "jiaxing/dbianmen",
	},
	objs = {
          ["��Ī��"] = "li mochou",
          ["��ѻ"] = "wu ya",
	room_relative="�����ţ�����----��ǹ����ǹ��",
           },
}
Room {
	id = "jiaxing/xiaojing2",
	name = "���С��",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/jxnanmen",
		["east"] = "jiaxing/river",
		["southeast"] = "jiaxing/shulin1",
	},
	room_relative="���ţ����С��---�Ӱ��K�������С��",
}
Room {
	id = "jiaxing/river",
	name = "�Ӱ�",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/xiaojing2",
	},
	room_relative="���С��--�Ӱ�",
}
Room {
	id = "jiaxing/shulin1",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/luzhuang",
		["northwest"] = "jiaxing/xiaojing2",
		["east"] = "jiaxing/lumu",
	},
	room_relative="���С���I����-----��Ĺ��½��ׯ����",
}
Room {
	id = "jiaxing/lumu",
	name = "��Ĺ",
	outdoor = "���˳�",
	ways = {
		["west"] = "jiaxing/shulin1",
	},
	objs = {
          ["����ͨ"] = "wu santong",
           },
	room_relative="����-----��Ĺ��Ĺ",
}
Room {
	id = "jiaxing/luzhuang",
	name = "½��ׯ",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/shulin1",
		["west"] = "jiaxing/tianjing",
	},
	room_relative="���֣��쾮----½��ׯ½��ׯ",
}
Room {
	id = "jiaxing/tianjing",
	name = "�쾮",
	outdoor = "���˳�",
	ways = {
		["east"] = "jiaxing/luzhuang",
		["west"] = "jiaxing/dating",
	},
	objs = {
          ["����"] = "pu ren",
	room_relative="����-----�쾮-----½��ׯ�쾮",	  
           },
}
Room {
	id = "jiaxing/dating",
	name = "����",
	outdoor = "���˳�",
	ways = {
		["south"] = "jiaxing/houyuan",
		["east"] = "jiaxing/tianjing",
	},
	objs = {
          ["½����"] = "lu liding",
           },
	room_relative="����-----�쾮����Ժ����",
}
Room {
	id = "jiaxing/houyuan",
	name = "��Ժ",
	outdoor = "���˳�",
	ways = {
		["north"] = "jiaxing/dating",
	},
	room_relative="��������Ժ��Ժ",
}

Room {
	id = "kunlun/bainiushan",
	name = "��ţɽ",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "kunlun/fufengshan",
	},
	room_relative="����ɽ--��ţɽ",
}
Room {
	id = "kunlun/bayankala",
	name = "���տ���ɽ",
	outdoor = "����ɽ",
	ways = {
		["northdown"] = "kunlun/shanlu2",
		["west"] = "kunlun/kekexili",
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
     },
	 room_relative="����ɽ·���ɿ�����ɽ--���տ���ɽ���տ���ɽ",
}
Room {
	id = "kunlun/chufang",
	name = "����",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["west"] = "kunlun/shilu2",
	},
	room_relative="ʯ·--����",
}
Room {
	id = "kunlun/conglinggu",
	name = "�����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "kunlun/shanlinn5",
	},
	objs = {
          ["�����"] = "dongchong cao",
          ["����"] = "huang qi",
     },
	 room_relative="��ɼ��--�����",
}
Room {
	id = "kunlun/elang01",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/keting1",
		["west"] = "kunlun/qianting",
	},
	room_relative="ǰ��----������----����������",
}
Room {
	id = "kunlun/fufengshan",
	name = "����ɽ",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "kunlun/houyuan",
		["northeast"] = "kunlun/bainiushan",
		["climb"] = "kunlun/sanshengao",
	},
	precmds = {
		["enter"] = "open door",
	},
	
}
Room {
	id = "kunlun/gate",
	name = "��Ժ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/shilu2",
		["west"] = "kunlun/lang",
	},
	lengths = {
		["east"] = "if score.party and score.party=='����ɽ' then return 1 else return false end",
	},
	
}
Room {
	id = "kunlun/guangchang",
	name = "�㳡",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/pingfeng",
		["north"] = "kunlun/shanlu04",
		["east"] = "kunlun/guangchange",
		["west"] = "kunlun/guangchangw",
	},
	objs = {
          ["�����"] = "gao zecheng",
   room_relative="ɽ·���㳡��-----�㳡-----�㳡����ʯ����㳡",
     },
}
Room {
	id = "kunlun/guangchange",
	name = "�㳡��",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "kunlun/shanlu04",
		["west"] = "kunlun/guangchang",
	},
	objs = {
          ["������"] = "yuling zi",
     },
	 room_relative="ɽ·�I�㳡----�㳡���㳡��",
}
Room {
	id = "kunlun/guangchangw",
	name = "�㳡��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/guangchang",
		["northeast"] = "kunlun/shanlu04",
	},
	room_relative="ɽ·�J�㳡��----�㳡�㳡��",
}
Room {
	id = "kunlun/houyuan",
        name = "��Ժ",
		outdoor = "����ɽ",
        ways = {
                ["south"] = "kunlun/shanlinn3",
                ["open door;out"] = "kunlun/fufengshan",
                ["#klffsclimb"] = "kunlun/fufengshan",
        },
        nolooks = {
                ["open door;out"] = true,
        },
        lengths = {
                ["open door;out"] = "if job.name=='huashan' then return false else return 1 end",
                ["#klffsclimb"] = "if job.name=='huashan' then return 1 else return false end",
        },
}
Room {
	id = "kunlun/huayuan1",
	name = "��԰",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/lang1",
		["north"] = "kunlun/shilu1",
		["east"] = "kunlun/lang",
		["west"] = "kunlun/shiqiao",
	},
	room_relative="ʯ·��Сʯ��-----��԰-----���ȣ����Ȼ�԰",
}
Room {
	id = "kunlun/jingshenfeng",
	name = "�����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/sanshengao",
	},
	objs = {
          ["�����"] = "he zudao",
     },
	 room_relative="��ʥ��--�����",
}
Room {
	id = "kunlun/jingxiushi",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/shiqiao",
		["east"] = "kunlun/shilu1",
	},
	room_relative="������----ʯ·��Сʯ�ž�����",
}
Room {
	id = "kunlun/jiuqulang1",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "kunlun/tieqinju",
		["east"] = "kunlun/shiqiao",
	},
	room_relative="������----Сʯ�ŨL���پӾ�����",
}
Room {
	id = "kunlun/jiuqulang2",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "kunlun/shanlinn",
		["northeast"] = "kunlun/sanshengtang",
	},
	room_relative="��ʥ�èJ�����ȨL��ɼ�־�����",
}
Room {
	id = "kunlun/kekexili",
	name = "�ɿ�����ɽ",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "kunlun/shankou",
		["east"] = "kunlun/bayankala",
	},
	room_relative="����ɽ��ڨI�ɿ�����ɽ--���տ���ɽ�ɿ�����ɽ",
}
Room {
	id = "kunlun/keting1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["west"] = "kunlun/elang01",
	},
	room_relative="������-----��������",
}
Room {
	id = "kunlun/keting2",
	name = "����",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["east"] = "kunlun/wlang01",
	},
	room_relative="����-----�����ȿ���",
}
Room {
	id = "kunlun/klshanlu",
	name = "����ɽ´",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "kunlun/shanmen",
		["east"] = "kunlun/shankou",
		["west"] = "fairyland/shanlu1",
	},
	room_relative="������ɽ�š�ɽ·---����ɽ´---����ɽ�������ɽ´",
}
Room {
	id = "kunlun/kuhanlou1",
	name = "�ຮ¥һ��",
	outdoor = "����ɽ",
	ways = {
		["out"] = "kunlun/shanlinn",
		["up"] = "kunlun/kuhanlou2",
	},
}
Room {
	id = "kunlun/kuhanlou2",
	name = "�ຮ¥����",
	outdoor = "����ɽ",
	ways = {
		["down"] = "kunlun/kuhanlou1",
		["up"] = "kunlun/kuhanlou3",
	},
}
Room {
	id = "kunlun/kuhanlou3",
	name = "�ຮ¥����",
	outdoor = "����ɽ",
	ways = {
		["down"] = "kunlun/kuhanlou2",
	},
}
Room {
	id = "kunlun/lang",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/lang2",
		["north"] = "kunlun/shufang",
		["east"] = "kunlun/gate",
		["west"] = "kunlun/huayuan1",
	},
	room_relative="�鷿����԰-----����-----��Ժ�ţ���������",
}
Room {
	id = "kunlun/lang1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/sanshengtang",
		["east"] = "kunlun/lang2",
		["north"] = "kunlun/huayuan1",
	},
	room_relative="��԰������-----���ȣ���ʥ������",
}
Room {
	id = "kunlun/lang2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/liangong",
		["north"] = "kunlun/lang",
		["west"] = "kunlun/lang1",
	},
	room_relative="���ȣ�����-----����-----����������",
}
Room {
	id = "kunlun/liangong",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["west"] = "kunlun/lang2",
	},
	room_relative="����----������������",
}
Room {
	id = "kunlun/pingfeng",
	name = "ʯ����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/qianting",
		["north"] = "kunlun/guangchang",
	},
	room_relative="�㳡��ʯ�����ǰ��ʯ����",
}
Room {
	id = "kunlun/qianting",
	name = "ǰ��",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/shilu1",
		["north"] = "kunlun/pingfeng",
		["east"] = "kunlun/elang01",
		["west"] = "kunlun/wlang01",
	},
	objs = {
          ["������"] = "xi huazi",
   room_relative="ʯ�����������-----ǰ��-----�����ȣ�ʯ·ǰ��",
     },
}
Room {
	id = "kunlun/sanshengao",
	name = "��ʥ��",
	outdoor = "����ɽ",
	ways = {
		["north"] = "kunlun/jingshenfeng",
		["down"] = "kunlun/fufengshan",
	},
	room_relative="����������ɽ��ʥ��",
}
Room {
	id = "kunlun/sanshengtang",
	name = "��ʥ��",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "kunlun/jiuqulang2",
		["north"] = "kunlun/lang1",
	},
	objs = {
          ["�����"] = "ban shuxian",
          ["�ӷ�"] = "xing fang",
   room_relative="���ȣ���ʥ�èL��������ʥ��",
     },
}
Room {
	id = "kunlun/shankou",
	name = "����ɽ���",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "kunlun/kekexili",
		["west"] = "kunlun/klshanlu",
	},
	room_relative="����ɽ´--����ɽ��ڨK�ɿ�����ɽ����ɽ���",
}
--[[Room {
	id = "kunlun/shanlinn",
	name = "��ɼ��",
	ways = {
		["se;e;s;w;e;out;se;e;s;w;e"] = "kunlun/kuhanlou1",
		["se;e;s;w;e;out;se;e;s;s"] = "kunlun/conglinggu",
		["se;e;s;w;e;out;ne"] = "kunlun/jiuqulang2",
		["se;e;s;w;e;out;w;n"] = "kunlun/houyuan",
	},
	nolooks = {
		["se;e;s;w;e;out;se;e;s;w;e"] = true,
		["se;e;s;w;e;out;se;e;s;s"] = true,
		["se;e;s;w;e;out;ne"] = true,
		["se;e;s;w;e;out;w;n"] = true,
		["southeast"] = true,
		["northeast"] = true,
		["west"] = true,
		["east"] = true,
		["north"] = true,
		["south"] = true,
	},
	lengths = {
		["se;e;s;w;e;out;se;e;s;w;e"] = 11,
		["se;e;s;w;e;out;se;e;s;s"] = 10,
		["se;e;s;w;e;out;ne"] = 7,
		["se;e;s;w;e;out;w;n"] = 8,
	},
	find = {
		path = {"w", "e", "se", "e", "s", "w", "e", "out"},
	},
}]]
Room {
  id = "kunlun/shanlinn",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["northeast"] = "kunlun/jiuqulang2",
    ["southeast"] = "kunlun/shanlinn2",
    ["west"] = "kunlun/shanlinn3",
  },
room_relative="�����ȨJ��ɼ��----��ɼ�֨K��ɼ����ɼ��",
}
Room {
  id = "kunlun/shanlinn3",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["east"] = "kunlun/shanlinn",
    ["north"] = "kunlun/houyuan",
  },
room_relative="��Ժ����ɼ��----��ɼ��----��ɼ�֣���ɼ����ɼ��",
}
Room {
  id = "kunlun/shanlinn2",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["east"] = "kunlun/shanlinn4",
  },
}
Room {
  id = "kunlun/shanlinn4",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["south"] = "kunlun/shanlinn5",
  },
}
Room {
  id = "kunlun/shanlinn5",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["west"] = "kunlun/shanlinn6",
    ["south"] = "kunlun/conglinggu",
  },
room_relative="��ɼ�֣���ɼ��----��ɼ��----��ɼ�֣��������ɼ��",
}
Room {
  id = "kunlun/shanlinn6",
  name = "��ɼ��",
  outdoor = "����ɽ",
  ways = {
    ["east"] = "kunlun/kuhanlou1",
  },
room_relative="��ɼ�֣���ɼ��----��ɼ��----�ຮ¥һ�����ɼ����ɼ��",
}
Room {
	id = "kunlun/shanlu",
	name = "����ɽ·",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/zhenyuanqiao",
		["west"] = "kunlun/shanlu1",
	},
	room_relative="����ɽ·---����ɽ·---��Զ������ɽ·",
}
Room {
	id = "kunlun/shanlu01",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "kunlun/shanlu02",
		["westdown"] = "kunlun/shanmen",
	},
	room_relative="������ɽ�š�ɽ·��ɽ·ɽ·",
}
Room {
	id = "kunlun/shanlu02",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "kunlun/shanlu03",
		["northdown"] = "kunlun/shanlu01",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "kunlun/shanlu03",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "kunlun/shanlu04",
		["northdown"] = "kunlun/shanlu02",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "kunlun/shanlu04",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "kunlun/guangchange",
		["southwest"] = "kunlun/guangchangw",
		["south"] = "kunlun/guangchang",
		["northdown"] = "kunlun/shanlu03",
	},
	room_relative="ɽ·��ɽ·�L���K�㳡���㳡�㳡��ɽ·",
}
Room {
	id = "kunlun/shanlu1",
	name = "����ɽ·",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "kunlun/shanlu2",
		["east"] = "kunlun/shanlu",
	},
	room_relative="����ɽ·������ɽ·---����ɽ·����ɽ·",
}
Room {
	id = "kunlun/shanlu2",
	name = "����ɽ·",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "kunlun/bayankala",
		["eastdown"] = "kunlun/shanlu1",
	},
	room_relative="����ɽ·������ɽ·�����տ���ɽ����ɽ·",
}
Room {
	id = "kunlun/shanmen",
	name = "������ɽ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "kunlun/shanlu01",
		["southdown"] = "kunlun/klshanlu",
	},
	objs = {
          ["����"] = "jiang tao",
     },
	 room_relative="������ɽ�š�ɽ·������ɽ´������ɽ��",
}
Room {
	id = "kunlun/shilu1",
	name = "ʯ·",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/huayuan1",
		["east"] = "kunlun/shufang",
		["north"] = "kunlun/qianting",
		["west"] = "kunlun/jingxiushi",
	},
	room_relative="ǰ����������-----ʯ·-----�鷿����԰ʯ·",
}
Room {
	id = "kunlun/shilu2",
	name = "ʯ·",
	outdoor = "����ɽ",
	ways = {
		["north"] = "kunlun/xiuxishi",
		["east"] = "kunlun/chufang",
		["west"] = "kunlun/gate",
	},
	room_relative="��Ϣ�ң�����-----��Ժ��ʯ·",
}
Room {
	id = "kunlun/shiqiao",
	name = "Сʯ��",
	outdoor = "����ɽ",
	ways = {
		["north"] = "kunlun/jingxiushi",
		["east"] = "kunlun/huayuan1",
		["west"] = "kunlun/jiuqulang1",
	},
	objs = {
          ["��ϰ֮"] = "su xizhi",
     },
	 room_relative="�����ң�������----Сʯ��----��԰Сʯ��",
}
Room {
	id = "kunlun/shufang",
	name = "�鷿",
	outdoor = "����ɽ",
	ways = {
		["south"] = "kunlun/lang",
		["west"] = "kunlun/shilu1",
	},
	objs = {
          ["���ټ����š�"] = "art's book",
     },
	 room_relative="ʯ·-----�鷿�������鷿",
}
Room {
	id = "kunlun/sleeproom",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/tieqinju",
	},
	nolooks = {
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
	objs = {
          ["ղ��"] = "zhan chun",
     },
	 room_relative="���پ�--����",
}
Room {
	id = "kunlun/tieqinju",
	name = "���پ�",
	outdoor = "����ɽ",
	ways = {
		["west"] = "kunlun/sleeproom",
		["northeast"] = "kunlun/jiuqulang1",
		["up"] = "kunlun/tieqinju2",
	},
	precmds = {
		["west"] = "open door",
	},
	objs = {
          ["��̫��"] = "he taichong",
     },
	 
}
Room {
	id = "kunlun/tieqinju2",
	name = "���پӶ�¥",
	outdoor = "����ɽ",
	ways = {
		["down"] = "kunlun/tieqinju",
	},
	room_relative="���پӶ�¥--���پ�",
}
Room {
	id = "kunlun/wlang01",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["east"] = "kunlun/qianting",
		["west"] = "kunlun/keting2",
	},
	room_relative="����----������----ǰ��������",
}
Room {
	id = "kunlun/xiuxishi",
	name = "��Ϣ��",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["south"] = "kunlun/shilu2",
	},
	room_relative="ʯ·--��Ϣ��",
}
Room {
	id = "kunlun/zhenyuanqiao",
	name = "��Զ��",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "mingjiao/shanjiao",
		["west"] = "kunlun/shanlu",
	},
	room_relative="����ɽ·----��Զ�š�ɽ������Զ��",
}
Room {
	id = "lanzhou/bingcao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "group/entry/lzshixia",
		["northeast"] = "lanzhou/yinpanshui",
	},
	objs = {
          ["���"] = "wu gong",
           },
	room_relative="Ӫ��ˮ�J������LʯϿ�ӱ�����",
}
Room {
	id = "lanzhou/dacaigou",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/gulang",
		["north"] = "lanzhou/wuqiao",
	},
	objs = {
          ["�Է�"] = "qiao fu",
           },
	room_relative="���������񹵨K���˴��",
}
Room {
	id = "lanzhou/dukou2",
        name = "���Ķɿ�",
        ways = {
                ["southeast"] = "lanzhou/shanlu1",
                ["#duHhe"] = "lanzhou/dukou3",
        },
        nolooks = {
                ["#duHhe"] = true,
                ["enter"] = true,
        },
        lengths = {
                ["#duHhe"] = "if not road.huanghe1 then return 10000 else return false end",
        },
		room_relative="���ĶɿڨKɽ�������Ķɿ�",
}
Room {
	id = "lanzhou/dukou3",
        name = "���Ķɿ�",
        ways = {
                ["northwest"] = "lanzhou/huanghe_3",
                ["#duHhe"] = "lanzhou/dukou2",
        },
        nolooks = {
                ["#duHhe"] = true,
                ["enter"] = true,
        },
        lengths = {
                ["#duHhe"] = "if not road.huanghe1 then return 10000 else return false end",
        },
		room_relative="�ƺӨI���Ķɿ����Ķɿ�",
}
Room {
	id = "lanzhou/gccheng",
	name = "�ų���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "lanzhou/shimen",
		["west"] = "lanzhou/yinpanshui",
	},
	nolooks = {
		["down"] = true,
	},
	room_relative="Ӫ��ˮ----�ų���----ʯ�Źų���",
}
Room {
	id = "lanzhou/gulang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/xjqiao",
		["northwest"] = "lanzhou/dacaigou",
		["east"] = "lanzhou/yaocaidian",
	},
	room_relative="��񹵨I����-----Ƥ��ҩ�ĵ�K�����Ź���",
}
Room {
	id = "lanzhou/hongsx",
	name = "��ɽϿ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/jintai",
		["north"] = "lanzhou/shimen",
	},
	room_relative="ʯ�ţ���ɽϿ�K��̩��ɽϿ",
}
Room {
	id = "lanzhou/houyuan",
	name = "��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/zhenting",
	},
	postcmds = {
		["south"] = "#walkBusy",
	},
	room_relative="����--��Ժ",
}
Room {
	id = "lanzhou/huanghe_2",
	name = "�ƺ�",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "lanzhou/jintai",
		["east"] = "lanzhou/huanghe_3",
	},
	room_relative="��̩�I�ƺ�-----�ƺӻƺ�",
}
Room {
	id = "lanzhou/huanghe_3",
	name = "�ƺ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/dukou3",
		["west"] = "lanzhou/huanghe_2",
	},
	room_relative="�ƺ�-----�ƺӨK���Ķɿڻƺ�",
}
Room {
	id = "lanzhou/jingyuan",
	name = "��Զ",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "lanzhou/lpshan",
		["southwest"] = "group/entry/lzroad1",
		["northeast"] = "lanzhou/kongdong",
	},
	room_relative="���ɽ�J��Զ������ɽ�L�����Զ",
}
Room {
	id = "lanzhou/jintai",
	name = "��̩",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/huanghe_2",
		["northwest"] = "lanzhou/hongsx",
	},
	room_relative="��ɽϿ�I��̩�K�ƺӾ�̩",
}
Room {
	id = "lanzhou/kedian",
	name = "�͵�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "lanzhou/yongdeng",
		-- ["up"] = "lanzhou/kedian2",
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="�͵��¥���͵�-----���ǿ͵�",
}
Room {
	id = "lanzhou/kedian2",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "lanzhou/kedian3",
		["down"] = "lanzhou/kedian",
	},
}
Room {
	id = "lanzhou/kedian3",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "lanzhou/kedian2",
	},
}
Room {
	id = "lanzhou/kongdong",
	name = "���ɽ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/jingyuan",
		["northdown"] = "lanzhou/shanlu1",
	},
	room_relative="ɽ���¡����ɽ�L��Զ���ɽ",
}
Room {
	id = "lanzhou/lanzhou",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/lanzhous",
		["east"] = "lanzhou/lanzhoue",
		["west"] = "lanzhou/lanzhouw",
	},
	room_relative="������----������----�����ţ��ϳ��ų�����",
}
Room {
	id = "lanzhou/lanzhoue",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "lanzhou/road5",
		["west"] = "lanzhou/lanzhou",
	},
	room_relative="������----������----���������",
}
Room {
	id = "lanzhou/lanzhous",
	name = "�ϳ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/sroad1",
		["north"] = "lanzhou/lanzhou",
	},
	room_relative="�����ģ��ϳ��ţ�����ϳ���",
}
Room {
	id = "lanzhou/lanzhouw",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "lanzhou/road6",
		["east"] = "lanzhou/lanzhou",
	},
	room_relative="����I������----������������",
}
Room {
	id = "lanzhou/lpshan",
	name = "����ɽ",
	outdoor = "���ݳ�",
	ways = {
		["westdown"] = "lanzhou/jingyuan",
		["southeast"] = "changan/westroad2",
	},
	room_relative="��Զ������ɽ�K�ٵ�����ɽ",
}
Room {
	id = "lanzhou/qianting",
	name = "ǰ��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "lanzhou/zhenting",
		["east"] = "lanzhou/zhengmen",
	},
	postcmds = {
		["north"] = "#walkBusy",
	},
	room_relative="���������ׯ�ſ�ǰ��",
}
Room {
	id = "lanzhou/qingcheng",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "chengdu/road1",
		["northwest"] = "group/entry/lzsroad3",
	},
	room_relative="����I�J��ǣ�������",
}
Room {
	 id = "lanzhou/road2",
        name = "��ɿ�",
        ways = {
                ["#duHhe"] = "lanzhou/road3",
                ["east"] = "lanzhou/road6",
        },
        lengths = {
                ["#duHhe"] = "if road.huanghe1 then return 10000 else return false end",
        },
        nolooks = {
                ["enter"] = true,
                ["#duHhe"] = true,
        },
  room_relative="��ɿ�----�����ɿ�",
}
Room {
	id = "lanzhou/road3",
        name = "��ɿ�",
        ways = {
                ["#duHhe"] = "lanzhou/road2",
                ["northwest"] = "lanzhou/road4",
        },
        lengths = {
                ["#duHhe"] = "if road.huanghe1 then return 10000 else return false end",
        },
        nolooks = {
                ["#duHhe"] = true,
                ["enter"] = true,
        },
		room_relative="����I��ɿڴ�ɿ�",
}
Room {
id = "lanzhou/duchuan1",
	name = "�ƺӶɴ�",
	ways = {
		["out"] = "lanzhou/road3",
	},
}
Room {
	id = "lanzhou/duchuan2",
	name = "�ƺӶɴ�",
	ways = {
		["out"] = "lanzhou/road2",
	},
}
Room {
	id = "lanzhou/road4",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/road3",
		["west"] = "lanzhou/yongdeng",
	},
	room_relative="����-----����K��ɿڴ��",
}
Room {
	id = "lanzhou/road5",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "group/entry/lzroad1",
		["west"] = "lanzhou/lanzhoue",
	},
	room_relative="����J������-----������",
}
Room {
	id = "lanzhou/road6",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/lanzhouw",
		["west"] = "lanzhou/road2",
	},
	room_relative="��ɿ�-----����K�����Ŵ��",
}
Room {
	id = "lanzhou/shamo",
	name = "ɳĮ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/shamo1",
		["east"] = "lanzhou/shamo",
		["north"] = "lanzhou/shamo",
		["west"] = "lanzhou/shamo",
		["#toQc"] = "lanzhou/qingcheng",
	},
	nolooks = {
		["#toQc"] = true,
	},
	lengths = {
		["#toQc"] = 50,
	},
}
--Room {
--	id = "lanzhou/shamo1",
--	name = "ɳĮ",
--	ways = {
--		["south"] = "lanzhou/shamo",
--		["enter"] = "lanzhou/shidong",
--		["east"] = "lanzhou/shamo",
--		["north"] = "lanzhou/shamo",
--		["west"] = "lanzhou/shamo",
--	},
--}
Room {
	id = "lanzhou/shanlu1",
	name = "ɽ����",
	outdoor = "���ݳ�",
	ways = {
		["southup"] = "lanzhou/kongdong",
		["northwest"] = "lanzhou/dukou2",
	},
	room_relative="���ĶɿڨIɽ���¡����ɽɽ����",
}
Room {
	id = "lanzhou/shidong",
	name = "ʯ��",
	outdoor = "���ݳ�",
	ways = {
		["out"] = "lanzhou/shamo1",
	},
	objs = {
          ["÷����"] = "mei chaofeng",
		  ["������"] = "chen xuanfeng",
           },
}
Room {
	id = "lanzhou/shimen",
	name = "ʯ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/hongsx",
		["north"] = "lanzhou/wufosi",
		["west"] = "lanzhou/gccheng",
	},
	objs = {
          ["��ʯ��"] = "caishi ren",
           },
	room_relative="����£��ų���-----ʯ�ţ���ɽϿʯ��",
}
Room {
	id = "lanzhou/sroad1",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/sroad2",
		["north"] = "lanzhou/lanzhous",
		["west"] = "lanzhou/zhengmen",
	},
	room_relative="�ϳ��ţ����ׯ�ſ�-----�����������",
}
Room {
	id = "lanzhou/sroad2",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "group/entry/lzsroad3",
		["north"] = "lanzhou/sroad1",
},
	objs = {
          ["�������"] = "xiyu keshang",
	},
	room_relative="���������K������",
}
Room {
	id = "lanzhou/tumenzi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "group/entry/lzshixia",
		["west"] = "lanzhou/wuwei",
	},
	nolooks = {
		["down"] = true,
	},
	room_relative="ʯϿ�ӨJ����----������������",
}
Room {
	id = "lanzhou/wufosi",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/shimen",
	},
	nolooks = {
		["down"] = true,
	},
	room_relative="����£�ʯ�������",
}
Room {
	id = "lanzhou/wuqiao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "lanzhou/dacaigou",
		["northwest"] = "lanzhou/wuwei",
	},
	room_relative="�����I����������������",
}
Room {
	id = "lanzhou/wuwei",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/wuqiao",
		["northwest"] = "xingxiu/road4",
		["east"] = "lanzhou/tumenzi",
	},
	room_relative="���ﳤ�ǨI����-----�����ӨK����������",
}
Room {
	id = "lanzhou/xjqiao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "lanzhou/yongdeng",
		["northwest"] = "lanzhou/gulang",
	},
	room_relative="���˨I�����ŨK����������",
}
Room {
	id = "lanzhou/yaocaidian",
	name = "Ƥ��ҩ�ĵ�",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "lanzhou/gulang",
	},
	room_relative="����--Ƥ��ҩ�ĵ�Ƥ��ҩ�ĵ�",
}
Room {
	id = "lanzhou/yinpanshui",
	name = "Ӫ��ˮ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "lanzhou/bingcao",
		["east"] = "lanzhou/gccheng",
	},
	room_relative="Ӫ��ˮ----�ų��ǨL������Ӫ��ˮ",
}
Room {
	id = "lanzhou/yongdeng",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "lanzhou/xjqiao",
		["east"] = "lanzhou/road4",
		["west"] = "lanzhou/kedian",
	},
	room_relative="�����ŨI�͵�-----����-----�������",
}
Room {
	id = "lanzhou/zhengmen",
	name = "���ׯ�ſ�",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["east"] = "lanzhou/sroad1",
		["west"] = "lanzhou/qianting",
	},
	precmds = {
		["east"] = "#walkBusy",
		["west"] = "#walkBusy",
	},
	
}
Room {
	id = "lanzhou/zhenting",
	name = "����",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["south"] = "lanzhou/qianting",
		["north"] = "lanzhou/houyuan",
	},
	objs = {
          ["���˷�"] = "miao renfeng",
           },
	room_relative="ǰ������Ժ����",
}
Room {
	id = "meizhuang/ceting2",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["west"] = "meizhuang/huilang20",
	},
}
Room {
	id = "meizhuang/ceting3",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang21",
	},
}
Room {
	id = "meizhuang/door",
	name = "ׯԺ����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/road3",
		["mzDoor"] = "meizhuang/tianjing",
	},
	lengths = {
	    ["mzDoor"] = "if Bag['��������'] then return 1 else return false end",
	},
}
Room {
	id = "meizhuang/gushan",
	name = "��ɽ",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/hubian",
	},
}
Room {
	id = "meizhuang/hall",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang",
		["north"] = "meizhuang/tianjing",
	},
}
Room {
	id = "meizhuang/houtang2",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/huilang12",
	},
}
Room {
	id = "meizhuang/houtang3",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/huilang13",
	},
}
Room {
	id = "meizhuang/huashi",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang6",
	},
}
Room {
	id = "meizhuang/hubian",
	name = "������",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/shiji",
		["west"] = "hz/gushan",
	},
	room_relative="��ɽ----������----ʯ��������",
}
Room {
	id = "meizhuang/huilang",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang3",
		["north"] = "meizhuang/hall",
		["west"] = "meizhuang/huilang2",
	},
}
Room {
	id = "meizhuang/huilang10",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang12",
		["east"] = "meizhuang/huilang8",
	},
}
Room {
	id = "meizhuang/huilang11",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang13",
		["west"] = "meizhuang/huilang9",
	},
}
Room {
	id = "meizhuang/huilang12",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/houtang2",
		["east"] = "meizhuang/huilang14",
		["north"] = "meizhuang/huilang10",
	},
}
Room {
	id = "meizhuang/huilang13",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/houtang3",
		["north"] = "meizhuang/huilang11",
		["west"] = "meizhuang/huilang15",
	},
}
Room {
	id = "meizhuang/huilang14",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang16",
		["west"] = "meizhuang/huilang12",
	},
}
Room {
	id = "meizhuang/huilang15",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang13",
		["west"] = "meizhuang/huilang17",
	},
}
Room {
	id = "meizhuang/huilang16",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang19",
		["west"] = "meizhuang/huilang14",
	},
}
Room {
	id = "meizhuang/huilang17",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang15",
		["west"] = "meizhuang/huilang19",
	},
}
Room {
	id = "meizhuang/huilang19",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/qinshi",
		["east"] = "meizhuang/huilang17",
		["west"] = "meizhuang/huilang16",
	},
}
Room {
	id = "meizhuang/huilang2",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang",
		["west"] = "meizhuang/huilang4",
	},
}
Room {
	id = "meizhuang/huilang20",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang4",
		["north"] = "meizhuang/huilang22",
		["east"] = "meizhuang/ceting2",
	},
}
Room {
	id = "meizhuang/huilang21",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang5",
		["north"] = "meizhuang/huilang23",
		["west"] = "meizhuang/ceting3",
	},
}
Room {
	id = "meizhuang/huilang22",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang20",
		["east"] = "meizhuang/huilang24",
		["west"] = "meizhuang/xiangfang2",
	},
}
Room {
	id = "meizhuang/huilang23",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang21",
		["east"] = "meizhuang/xiangfang3",
		["west"] = "meizhuang/huilang25",
	},
}
Room {
	id = "meizhuang/huilang24",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/tianjing",
		["west"] = "meizhuang/huilang22",
	},
}
Room {
	id = "meizhuang/huilang25",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang23",
		["west"] = "meizhuang/tianjing",
	},
}
Room {
	id = "meizhuang/huilang3",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang5",
		["west"] = "meizhuang/huilang",
	},
}
Room {
	id = "meizhuang/huilang4",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang6",
		["north"] = "meizhuang/huilang20",
		["east"] = "meizhuang/huilang2",
		["west"] = "meizhuang/jiushi",
	},
}
Room {
	id = "meizhuang/huilang5",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang7",
		["east"] = "meizhuang/qishi",
		["north"] = "meizhuang/huilang21",
		["west"] = "meizhuang/huilang3",
	},
}
Room {
	id = "meizhuang/huilang6",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang8",
		["north"] = "meizhuang/huilang4",
		["west"] = "meizhuang/huashi",
	},
}
Room {
	id = "meizhuang/huilang7",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang9",
		["east"] = "meizhuang/shufang",
		["north"] = "meizhuang/huilang5",
	},
}
Room {
	id = "meizhuang/huilang8",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/huilang6",
		["west"] = "meizhuang/huilang10",
	},
}
Room {
	id = "meizhuang/huilang9",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["north"] = "meizhuang/huilang7",
		["east"] = "meizhuang/huilang11",
	},
}
Room {
	id = "meizhuang/jiushi",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang4",
	},
}
Room {
	id = "meizhuang/neishi",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/qinshi",
	},
}
Room {
	id = "meizhuang/plum_maze",
	name = "÷��",
	ways = {
		["#mlOutt"] = "meizhuang/road2",
		["#inmz"] = "meizhuang/road3",
	},
}
Room {
	id = "meizhuang/qinshi",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/huilang19",
		["north"] = "meizhuang/neishi",
	},
}
Room {
	id = "meizhuang/qishi",
	name = "����",
	outdoor = "÷ׯ",
	ways = {
		["west"] = "meizhuang/huilang5",
	},
}
Room {
	id = "meizhuang/road1",
	name = "С·",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/road2",
		["west"] = "meizhuang/shiji",
	},
	room_relative="ʯ��-----С·��С·С·",
}
Room {
	id = "meizhuang/road2",
	name = "С·",
	outdoor = "÷ׯ",
	ways = {
		--["south"] = "meizhuang/plum_maze",
		["north"] = "meizhuang/road1",
	},
	lengths = {
		["south"] = 10000,
	},
}
Room {
	id = "meizhuang/road3",
	name = "��ʯ���·",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/door",
		["north"] = "meizhuang/plum_maze",
	},
}
Room {
	id = "meizhuang/shiji",
	name = "ʯ��",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/road1",
		["west"] = "meizhuang/hubian",
	},
	room_relative="������-----ʯ��-----С·ʯ��",
}
Room {
	id = "meizhuang/shufang",
	name = "�鷿",
	outdoor = "÷ׯ",
	ways = {
		["west"] = "meizhuang/huilang7",
	},
}
Room {
	id = "meizhuang/tianjing",
	name = "�쾮",
	outdoor = "÷ׯ",
	ways = {
		["south"] = "meizhuang/hall",
		["east"] = "meizhuang/huilang25",
		["north"] = "meizhuang/door",
		["west"] = "meizhuang/huilang24",
	},
}
Room {
	id = "meizhuang/xiangfang2",
	name = "�᷿",
	outdoor = "÷ׯ",
	ways = {
		["east"] = "meizhuang/huilang22",
	},
}
Room {
	id = "meizhuang/xiangfang3",
	name = "�᷿",
	outdoor = "÷ׯ",
	ways = {
		["west"] = "meizhuang/huilang23",
	},
}
Room {
	id = "miaojiang/bingqif",
	name = "������",
	outdoor = "�置",
	ways = {
		["west"] = "miaojiang/qiant",
	},
	room_relative="ǰ��----������������",
}
Room {
	id = "miaojiang/chufang",
	name = "����",
	outdoor = "�置",
	ways = {
		["east"] = "miaojiang/qiant",
	},
	room_relative="����-----ǰ������",
}
Room {
	id = "miaojiang/guoyuan",
	name = "��԰",
	outdoor = "�置",
	ways = {
		["west"] = "miaojiang/jiedao5",
	},
	room_relative="С��-----��԰��԰",
}
Room {
	id = "miaojiang/haozhai",
	name = "���",
	outdoor = "�置",
	ways = {
		["north"] = "miaojiang/jiedao3",
	},
	objs = {
          ["����"] = "chen qing",
           },
	room_relative="С���������",
}
Room {
	id = "miaojiang/houshan",
	name = "��ɽ",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/shanlu",
	},
	objs = {
          ["�ֻ�"] = "yan ji",
           },
}
Room {
	id = "miaojiang/jiedao1",
	name = "С��",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/jiedao2",
		["east"] = "miaojiang/zhd",
		["north"] = "miaojiang/xiaolu2",
	},
	room_relative="С·��С��-----�ӻ����С��С��",
	objs = {
          ["���"] = "miao bing",
           },
}
Room {
	id = "miaojiang/jiedao2",
	name = "С��",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/ywj",
		["south"] = "miaojiang/jiedao3",
		["east"] = "miaojiang/xiaotan",
		["north"] = "miaojiang/jiedao1",
	},
	room_relative="С���С��-----С̯���KС��ҩ����С��",
}
Room {
	id = "miaojiang/jiedao3",
	name = "С��",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/haozhai",
		["east"] = "miaojiang/jiedao5",
		["north"] = "miaojiang/jiedao2",
		["west"] = "miaojiang/jiedao4",
	},
	room_relative="С���С��-----С��-----С������С��",
}
Room {
	id = "miaojiang/jiedao4",
	name = "С��",
	outdoor = "�置",
	ways = {
		["north"] = "miaojiang/mzhai",
		["east"] = "miaojiang/jiedao3",
		["west"] = "miaojiang/slu1",
	},
	room_relative="���ݣ�ɽ��-----С��-----С��С��",
}
Room {
	id = "miaojiang/jiedao5",
	name = "С��",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/lianwuc",
		["east"] = "miaojiang/guoyuan",
		["west"] = "miaojiang/jiedao3",
	},
	room_relative="С��-----С��-----��԰�K���䳡С��",
}
Room {
	id = "miaojiang/lianwuc",
	name = "���䳡",
	outdoor = "�置",
	ways = {
		["northwest"] = "miaojiang/jiedao5",  
	},
	objs = {
          ["��������"] = "miaozu qingnian",
           },
	room_relative="С��I���䳡���䳡",
}
Room {
	id = "miaojiang/myp",
	name = "������",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/xiaolu1",
		["northeast"] = "miaojiang/shandao1",
	},
	room_relative="ɽ���J��������С·������",
}
Room {
	id = "miaojiang/myt",
	name = "������",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/qiant",
		["northwest"] = "miaojiang/shef",
	},
	objs = {
          ["�κ�ҩ"] = "he hongyao",
           },
	room_relative="�߷��I��������ǰ��������",
}
Room {
	id = "miaojiang/mzhai",
	name = "����",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/jiedao4",
	},
	objs = {
          ["�����Ϻ�"] = "miaozu laohan",
           },
		room_relative="���ݣ�С������",
}
Room {
	id = "miaojiang/qiant",
	name = "ǰ��",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/wddamen",
		["north"] = "miaojiang/myt",
		["east"] = "miaojiang/bingqif",
		["west"] = "miaojiang/chufang",
	},
	room_relative="������������-----ǰ��-----������������ǰ��",
}
Room {
	id = "miaojiang/shandao1",
	name = "ɽ��",
	outdoor = "�置",
	ways = {
		["southwest"] = "miaojiang/myp",
		["west"] = "miaojiang/shandao2",
	},
	room_relative="ɽ��-----ɽ���L������ɽ��",
}
Room {
	id = "miaojiang/shandao2",
	name = "ɽ��",
	outdoor = "�置",
	ways = {
		["east"] = "miaojiang/shandao1",
		["north"] = "group/entry/mjshan2",
	},
	room_relative="ɽ·��ɽ��-----ɽ��ɽ��",
}
Room {
	id = "miaojiang/shandong",
	name = "ɽ��",
	outdoor = "�置",
	ways = {
		["out"] = "miaojiang/slu9",
	},
}
Room {
	id = "miaojiang/shanlu",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/slu1",
		["northwest"] = "miaojiang/houshan",
	},
	room_relative="ɽ·�Kɽ��ɽ·",
	nolooks = {
		["northwest"] = true,
	},
	precmds = {
		["northwest"] = "push grass",
	},
}
Room {
	id = "miaojiang/shanlu1",
	name = "С·",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/xiaolu1",
	},
	room_relative="С·�KС·С·",
}
Room {
	id = "miaojiang/shanya2",
	name = "ɽ��",
	outdoor = "�置",
	ways = {
		["west"] = "miaojiang/wddamen",
	},
	room_relative="����-----ɽ��ɽ��",
}
Room {
	id = "miaojiang/shef",
	name = "�߷�",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/myt",
		["south"] = "miaojiang/woshi",
	},
	objs = {
          ["��ɫ����"] = "heise dushe",
           },
	room_relative="�߷����K�����������߷�",
}
Room {
	id = "miaojiang/slu1",
	name = "ɽ��",
	outdoor = "�置",
	ways = {
		["northwest"] = "miaojiang/shanlu",
		["east"] = "miaojiang/jiedao4",
		["#Inwdj"] = "miaojiang/slu2",
	},
	blocks={
	    ["#Inwdj"] = {
			{id = "wudujiao dizi", exp = 150000},
			},
	},
	lengths = {
		["#Inwdj"] = "if inwdj==0 then return false else return 1 end",
	},
	
}
Room {
	id = "miaojiang/slu2",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["northup"] = "miaojiang/slu4",
		["eastup"] = "miaojiang/slu3",
		["southdown"] = "miaojiang/slu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·��ɽ��ɽ·",
	objs = {
          ["����"] = "du she",
           },
}
Room {
	id = "miaojiang/slu3",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["northup"] = "miaojiang/slu6",
		["eastdown"] = "miaojiang/slu5",
		["westdown"] = "miaojiang/slu2",
	},
	room_relative="ɽ·��ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu4",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["northup"] = "miaojiang/wddamen",
		["southdown"] = "miaojiang/slu2",
	},
	room_relative="���š�ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu5",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["northup"] = "miaojiang/slu7",
		["westup"] = "miaojiang/slu3",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
	objs = {
          ["����"] = "du she",
           },
}
Room {
	id = "miaojiang/slu6",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["southdown"] = "miaojiang/slu3",
	},
	room_relative="ɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu7",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["northwest"] = "miaojiang/slu8",
		["southdown"] = "miaojiang/slu5",
	},
	room_relative="ɽ·�Iɽ·��ɽ·ɽ·",
}
Room {
	id = "miaojiang/slu8",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["southeast"] = "miaojiang/slu7",
		["east"] = "miaojiang/slu9",
	},
	room_relative="ɽ·-----ɽ·�Kɽ·ɽ·",
}
Room {
	id = "miaojiang/slu9",
	name = "ɽ·",
	outdoor = "�置",
	ways = {
		["enter"] = "miaojiang/shandong",
		["west"] = "miaojiang/slu8",
	},
	room_relative="ɽ����ɽ·-----ɽ·ɽ·",
}
Room {
	id = "miaojiang/wddamen",
	name = "����",
	outdoor = "�置",
	ways = {
		["east"] = "miaojiang/shanya2",
		["north"] = "miaojiang/qiant",  
		["southdown"] = "miaojiang/slu4",
	},
	objs = {
          ["�嶾�̵���"] = "wudujiao dizi",
           },
	room_relative="ǰ��������-----ɽ�¡�ɽ·����",
}
Room {
	id = "miaojiang/woshi",
	name = "����",
	outdoor = "�置",
	ways = {
		["north"] = "miaojiang/shef", 
	},
	objs = {
          ["������"] = "he tieshou",
           },
	room_relative="�߷�����������",
}
Room {
	id = "miaojiang/xiaolu1",
	name = "С·",
	outdoor = "�置",
	ways = {
		["northwest"] = "miaojiang/shanlu1",
		["east"] = "miaojiang/xiaolu2",
		["north"] = "miaojiang/myp",
	},
	room_relative="С·�������I��С·-----С·С·",
}
Room {
	id = "miaojiang/xiaolu2",
	name = "С·",
	outdoor = "�置",
	ways = {
		["south"] = "miaojiang/jiedao1",
		["west"] = "miaojiang/xiaolu1",
	},
	room_relative="С·-----С·��С��С·",
}
Room {
	id = "miaojiang/xiaotan",
	name = "С̯",
	outdoor = "�置",
	ways = {
		["west"] = "miaojiang/jiedao2",
	},
	objs = {
          ["���Ů��"] = "miaojia nuzi",
           },
	room_relative="С��-----С̯С̯",
}
Room {
	id = "miaojiang/yaofang1",
	name = "ҩ����",
	outdoor = "�置",
	no_fight = true,
	ways = {
		["south"] = "miaojiang/ywj",
	},
	objs = {
          ["��¯"] = "dan lu",
           },
	room_relative="ҩ���֣�ҩ����ҩ����",
}
Room {
	id = "miaojiang/ywj",
	name = "ҩ����",
	outdoor = "�置",
	no_fight = true,
	ways = {
		["northwest"] = "miaojiang/jiedao2",
		["north"] = "miaojiang/yaofang1",
	},
	objs = {
          ["������"] = "cheng lingsu",
           },
	room_relative="С��ҩ���֨I��ҩ����ҩ����",
}
Room {
	id = "miaojiang/zhd",
	name = "�ӻ���",
	outdoor = "�置",
	ways = {
		["west"] = "miaojiang/jiedao1",
	},
	room_relative="С��----�ӻ����ӻ���",
}
Room {
	id = "mingjiao/bank",
	name = "����ի",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/shejing",
	},
	objs = {
          ["�����"] = "long juanfeng",
           },
  room_relative="����ի----ɳĮ��������ի",
}
Room {
	id = "mingjiao/baota",
	name = "��������",
	outdoor = "����",
	ways = {
		["enter"] = "mingjiao/baota0",
		["southdown"] = "mingjiao/sht",
	},
	room_relative="����һ¥�Ĺ���������ʥ���ù�������",
}
Room {
	id = "mingjiao/baota0",
	name = "����һ¥",
	outdoor = "����",
	ways = {
		["out"] = "mingjiao/baota",
	},
}
Room {
	id = "mingjiao/bhd/cling",
	name = "����",
	ways = {
		["south"] = "mingjiao/bhd/shishan",
		["north"] = "mingjiao/bhd/cling1",
	},
}
Room {
	id = "mingjiao/bhd/cling1",
	name = "����",
	ways = {
		["south"] = "mingjiao/bhd/cling",
	},
}
Room {
	id = "mingjiao/bhd/dbshan",
	name = "��ɽ",
	ways = {
		["east"] = "mingjiao/bhd/dbshan1",
	},
}
Room {
	id = "mingjiao/bhd/dbshan1",
	name = "��ɽ",
	ways = {
		["west"] = "mingjiao/bhd/dbshan",
	},
}
Room {
	id = "mingjiao/bhd/hsjiao",
	name = "��ɽ����",
	ways = {
		["westup"] = "mingjiao/bhd/huoshan1",
		["east"] = "mingjiao/bhd/ysroad2",
	},
}
Room {
	id = "mingjiao/bhd/huoshan1",
	name = "��ɽ",
	ways = {
		["northup"] = "mingjiao/bhd/huoshan2",
		["eastdown"] = "mingjiao/bhd/hsjiao",
	},
}
Room {
	id = "mingjiao/bhd/huoshan2",
	name = "��ɽ��",
	ways = {
		["southdown"] = "mingjiao/bhd/huoshan1",
	},
}
Room {
	id = "mingjiao/bhd/pingyan1",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/yanshi",
		["north"] = "mingjiao/bhd/pingyan2",
	},
}
Room {
	id = "mingjiao/bhd/pingyan2",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/yanshi",
		["north"] = "mingjiao/bhd/shishan",
		["east"] = "mingjiao/bhd/pingyan4",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/pingyan3",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/pingyan4",
		["north"] = "mingjiao/bhd/pingyan1",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/pingyan4",
	name = "��Ұ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/pingyan4",
		["north"] = "mingjiao/bhd/pingyan1",
		["west"] = "mingjiao/bhd/pingyan3",
	},
}
Room {
	id = "mingjiao/bhd/shishan",
	name = "ʯɽ",
	ways = {
		["south"] = "mingjiao/bhd/pingyan2",
		["east"] = "mingjiao/bhd/shishan1",
		["north"] = "mingjiao/bhd/cling",
		["west"] = "mingjiao/bhd/ysroad1",
	},
}
Room {
	id = "mingjiao/bhd/shishan1",
	name = "Сʯɽ",
	ways = {
		["west"] = "mingjiao/bhd/shishan",
	},
}
Room {
	id = "mingjiao/bhd/xdong",
	name = "ʯ��",
	ways = {
		["out"] = "mingjiao/bhd/shishan1",
	},
}
Room {
	id = "mingjiao/bhd/xiongdong",
	name = "�ܶ�",
	ways = {
		["out"] = "mingjiao/bhd/shishan",
	},
}
Room {
	id = "mingjiao/bhd/yanshi",
	name = "��ʯ",
	ways = {
		["north"] = "mingjiao/bhd/pingyan1",
	},
}
Room {
	id = "mingjiao/bhd/ysroad1",
	name = "��ʯ·",
	ways = {
		["east"] = "mingjiao/bhd/shishan",
		["west"] = "mingjiao/bhd/ysroad2",
	},
}
Room {
	id = "mingjiao/bhd/ysroad2",
	name = "��ʯ·",
	ways = {
		["east"] = "mingjiao/bhd/ysroad1",
		["west"] = "mingjiao/bhd/hsjiao",
	},
}
Room {
	id = "mingjiao/bingqi",
	name = "������",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/huoqi",
	},
	postcmds = {
		["north"] = "#walkBusy",
	},
	objs = {
          ["�⾢��"] = "wu jincao",
           },
}
Room {
	id = "mingjiao/bishui",
	name = "��ˮ��̶",
	outdoor = "����",
	ways = {
		["west"] = "mingjiao/shanlu2",
		["jump down"] = "mingjiao/tandi",
	},
	nolooks = {
		["jump down"] = true,
	},
	precmds = {
		["west"] = "#walkBusy",
		["jump down"] = "#walkBusy",
	},
}
Room {
	id = "mingjiao/cl1",
	name = "����",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/wu3",
		["west"] = "mingjiao/huoqi",
	},
	room_relative="�һ���-----����-----���䳡����",
}
Room {
	id = "mingjiao/cl2",
	name = "����",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/shuiqi",
		["west"] = "mingjiao/wu3",
	},
	room_relative="���䳡-----����-----��ˮ�쳤��",
}
Room {
	id = "mingjiao/dashaqiu",
	name = "��ɳ��",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/htping",
		["west"] = "mingjiao/shejing",
	},
	room_relative="ɳĮ����----��ɳ��----����ƺ��ɳ��",
}
Room {
	id = "mingjiao/didao/bidao1",
	name = "�ص����",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/didao/bidao2",
		["out"] = "mingjiao/wxiang",
	},
}
Room {
	id = "mingjiao/didao/bidao10",
	name = "�ص�",
	outdoor = "����",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao11",
		["westup"] = "mingjiao/didao/bidao9",
	},
}
Room {
	id = "mingjiao/didao/bidao11",
	name = "�ص�",
	outdoor = "����",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao12",
		["westup"] = "mingjiao/didao/bidao10",
	},
}
Room {
	id = "mingjiao/didao/bidao12",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao11",
		["south"] = "mingjiao/didao/bidao13",
	},
}
Room {
	id = "mingjiao/didao/bidao13",
	name = "�ؽ���",
	ways = {
		["north"] = "mingjiao/didao/bidao12",
	},
}
Room {
	id = "mingjiao/didao/bidao15",
	name = "�ص�",
	ways = {
		["northup"] = "mingjiao/didao/bidao20",
		["eastup"] = "mingjiao/didao/bidao16",
		["north"] = "mingjiao/didao/bidao22",
	},
}
Room {
	id = "mingjiao/didao/bidao16",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao17",
		["westdown"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao17",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao18",
		["eastdown"] = "mingjiao/didao/bidao4",
		["northdown"] = "mingjiao/didao/bidao16",
	},
}
Room {
	id = "mingjiao/didao/bidao18",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao19",
		["northdown"] = "mingjiao/didao/bidao17",
	},
}
Room {
	id = "mingjiao/didao/bidao19",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao18",
		["out"] = "mingjiao/shanyao",
	},
}
Room {
	id = "mingjiao/didao/bidao2",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/bidao1",
		["east"] = "mingjiao/didao/bidao3",
	},
}
Room {
	id = "mingjiao/didao/bidao20",
	name = "�ص�",
	ways = {
		["east"] = "mingjiao/didao/bidao21",
		["southdown"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao21",
	name = "�ص�",
	ways = {
		["west"] = "mingjiao/didao/bidao20",
		["out"] = "mingjiao/tuqi",
	},
}
Room {
	id = "mingjiao/didao/bidao22",
	name = "����",
	ways = {
		["south"] = "mingjiao/didao/bidao15",
	},
}
Room {
	id = "mingjiao/didao/bidao3",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/bidao4",
		["west"] = "mingjiao/didao/bidao2",
	},
}
Room {
	id = "mingjiao/didao/bidao4",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao17",
		["south"] = "mingjiao/didao/bidao3",
	},
}
Room {
	id = "mingjiao/didao/bidao5",
	name = "�ص�",
	ways = {
		["northdown"] = "mingjiao/didao/bidao6",
	},
}
Room {
	id = "mingjiao/didao/bidao6",
	name = "�ص�",
	ways = {
		["southup"] = "mingjiao/didao/bidao5",
		["eastdown"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/bidao7",
	name = "�ص�",
	ways = {
		["westup"] = "mingjiao/didao/bidao6",
	},
}
Room {
	id = "mingjiao/didao/bidao8",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao9",
		["out"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/bidao9",
	name = "�ص�",
	ways = {
		["eastdown"] = "mingjiao/didao/bidao10",
		["westup"] = "mingjiao/didao/bidao8",
	},
}
Room {
	id = "mingjiao/didao/mbidao1",
	name = "�ص�",
	ways = {
		["west"] = "mingjiao/didao/mbidao2",
	},
}
Room {
	id = "mingjiao/didao/mbidao2",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/mbidao3",
		["east"] = "mingjiao/didao/mbidao1",
	},
}
Room {
	id = "mingjiao/didao/mbidao3",
	name = "�ص�",
	ways = {
		["east"] = "mingjiao/didao/mbidao4",
		["north"] = "mingjiao/didao/mbidao2",
	},
}
Room {
	id = "mingjiao/didao/mbidao4",
	name = "�ص�",
	ways = {
		["south"] = "mingjiao/didao/mbidao5",
		["west"] = "mingjiao/didao/mbidao3",
	},
}
Room {
	id = "mingjiao/didao/mbidao5",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/mbidao4",
		["west"] = "mingjiao/didao/mbidao6",
	},
}
Room {
	id = "mingjiao/didao/mbidao6",
	name = "�ص�",
	ways = {
		["north"] = "mingjiao/didao/mchukou",
		["east"] = "mingjiao/didao/mbidao5",
	},
}
Room {
	id = "mingjiao/didao/mchukou",
	name = "�ص�����",
	ways = {
		["up"] = "mingjiao/didao/bidao7",
	},
}
Room {
	id = "mingjiao/didao/men-di",
	name = "������",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-feng",
	name = "������",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-lei",
	name = "������",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northwest"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/men-tian",
	name = "������",
	outdoor = "����",
	ways = {
		["southwest"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["northeast"] = "mingjiao/didao/senlin",
		["southwest"] = "mingjiao/didao/senlin",
	},
	objs = {
          ["�����Ž���"] = "jiao zhong",
           },
}
Room {
	id = "mingjiao/didao/senlin",
	name = "��ɼ��",
	outdoor = "����",
	ways = {
		["#outzsl"] = "mingjiao/shuiqi",
		["#tianMen"] = "mingjiao/didao/men-tian",
		["#diMen"] = "mingjiao/didao/men-di",
		["#fengMen"] = "mingjiao/didao/men-feng",
		["#leiMen"] = "mingjiao/didao/men-lei",
	},
	lengths = {
		["#outzsl"] = 50,
		["#tianMen"] = 1,
		["#diMen"] = 1,
		["#fengMen"] = 1,
		["#leiMen"] = 1,
	},
}
Room {
	id = "mingjiao/didao/shenchu1",
	name = "�����",
	outdoor = "����",
	ways = {
		["northwest"] = "mingjiao/didao/shenchu2",
		["north"] = "mingjiao/didao/shuling2",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
    },
	room_relative="��������֨I������������",
}
Room {
	id = "mingjiao/didao/shenchu2",
	name = "�����",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/didao/shenchu4",
		["north"] = "mingjiao/didao/shenchu5",
		["northeast"] = "mingjiao/didao/shenchu3",
		["west"] = "mingjiao/didao/shenchu1",
	},
	objs = {
          ["ҩ��"] = "yao cao",
          ["������"] = "da shugan",
    },
	room_relative="�������������J�����---������K����������",
}
Room {
	id = "mingjiao/didao/shenchu3",
	name = "�����",
	outdoor = "����",
	ways = {
		["southwest"] = "mingjiao/didao/shenchu2",
		["south"] = "mingjiao/didao/shenchu5",
		["northwest"] = "mingjiao/didao/shenchu1",
		["east"] = "mingjiao/didao/shenchu4",
	},
	objs = {
          ["����"] = "du she",
           },
	room_relative="������I�����---������L�����������������",
}
Room {
	id = "mingjiao/didao/shenchu4",
	name = "�����",
	outdoor = "����",
	ways = {
		["northwest"] = "mingjiao/didao/shuling6",
		["west"] = "mingjiao/didao/shenchu3",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
          ["Ұ��"] = "ye tu",
    },
	room_relative="���֨I�����---����������",
}
Room {
	id = "mingjiao/didao/shenchu5",
	name = "�����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/didao/shenchu2",
		["north"] = "mingjiao/didao/shenchu3",
	},
	room_relative="������������������������",
}
Room {
	id = "mingjiao/didao/shuling1",
	name = "����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/didao/shuling3",
		["east"] = "mingjiao/muqi",
		["west"] = "mingjiao/didao/shuling4",
	},
	nolooks = {
		["north"] = true,
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
          ["Сʯͷ"] = "xiao shitou",
    },
	room_relative="���֣�����-----����-----��ľ�����������",
}
Room {
	id = "mingjiao/didao/shuling2",
	name = "����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/didao/shenchu5",
		["north"] = "mingjiao/didao/shuling6",
		["west"] = "mingjiao/muqi",
	},
	objs = {
          ["������"] = "da shugan",
    },
	room_relative="���֣���ľ��-----����-----���֣����������",
}

Room {
	id = "mingjiao/didao/shuling3",
	name = "����",
	outdoor = "����",
	ways = {
		["#mjSlout1"] = "mingjiao/didao/shenchu1",
	},
}
Room {
	id = "mingjiao/didao/shuling4",
	name = "����",
	outdoor = "����",
	ways = {
		["#mjSlout1"] = "mingjiao/didao/shenchu1",
	},
	objs = {
          ["���"] = "xu da",
    },
	room_relative="�����������-----����-----���֣���������",
}
Room {
	id = "mingjiao/didao/shuling5",
	name = "����",
	outdoor = "����",
	ways = {
		["#mjSlout4"] = "mingjiao/didao/shenchu4",
	},
	objs = {
          ["��Ԫ�"] = "zhu yuanzhang",
    },
}
Room {
	id = "mingjiao/didao/shuling6",
	name = "����",
	outdoor = "����",
	ways = {
		["#mjSlout4"] = "mingjiao/didao/shenchu4",
		["east"] = "mingjiao/didao/shuling5",
	
	},
	objs = {
          ["������"] = "chang yuchun",
    },
	room_relative="���֣�����-----����-----���֣����������",
}
Room {
	id = "mingjiao/eatroom",
	name = "����",
	outdoor = "����",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/xting",
	},
	objs = {
          ["����"] = "zong zi",
          ["��÷��"] = "suanmei tang",
           },
	room_relative="����-----С������",
}
Room {
	id = "mingjiao/gmd",
	name = "������",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/wu3",
		["southdown"] = "mingjiao/muqi",
	},
	objs = {
          ["����ʥ��"] = "board",
          ["����»"] = "yin wulu",
		  ["������"] = "nan jiaozhong",
		  ["�ⰲ"] = "nan jiaozhong",
		  ["������"] = "yin tianzheng",
	room_relative="���䳡������������ľ�������",
           },
}
Room {
	id = "mingjiao/guangc",
	name = "�㳡",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/wu3",
		["east"] = "mingjiao/zl2",
		["north"] = "mingjiao/wu1",
		["west"] = "mingjiao/zl1",
	},
	objs = {
          ["ΤһЦ"] = "wei yixiao",
		  ["�ܽ�"] = "nan jiaozhong",
		  ["����"] = "nv jiaozhong",
	room_relative="���䳡������-----�㳡-----���ȣ����䳡�㳡",
           },
}
Room {
	id = "mingjiao/hdg/caojing",
	name = "�ݾ�",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/niupeng",
		["east"] = "mingjiao/hdg/xfang1",
		["north"] = "mingjiao/hdg/maowu",
		["west"] = "mingjiao/hdg/maopeng",
	},
	room_relative="é�ݣ�é��-----�ݾ�-----�᷿��ţ��ݾ�",
}
Room {
	id = "mingjiao/hdg/caotang",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/maowu",
		["enter"] = "mingjiao/hdg/xfang4",
		["east"] = "mingjiao/hdg/xfang3",
		["west"] = "mingjiao/hdg/chufang",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
	room_relative="�᷿�ĳ���-----����-----�᷿��é�ݲ���",
}
Room {
	id = "mingjiao/hdg/chufang",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/xfang2",
		["north"] = "mingjiao/hdg/huapu4",
		["east"] = "mingjiao/hdg/caotang",
	},
	precmds = {
		["south"] = "drop rice;drop miantang;drop qingcai",
		["north"] = "drop rice;drop miantang;drop qingcai",
		["east"] = "drop rice;drop miantang;drop qingcai",
	},
	room_relative="���ԣ�����-----���ã��᷿����",
}
Room {
	id = "mingjiao/hdg/houshan",
	name = "��ɽ",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/huapu4",
	},
	
}
Room {
	id = "mingjiao/hdg/huacong1",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "mingjiao/hdg/xiaojing",
		["out"] = "mingjiao/hdg/shanbi",
	},
	room_relative="С���������С�ɽ�ڻ�����",
}
Room {
	id = "mingjiao/hdg/huapu1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/huapu1",
		["north"] = "mingjiao/hdg/huapu1",
		["east"] = "mingjiao/hdg/huapu1",
		["west"] = "mingjiao/hdg/huapu1",
	},
}
Room {
	id = "mingjiao/hdg/huapu2",
	name = "����",
	outdoor = "������",
	ways = {
		["west"] = "mingjiao/hdg/xfang1",
	},
	room_relative="�᷿--����",
}
Room {
	id = "mingjiao/hdg/huapu3",
	name = "����",
	ways = {
		["east"] = "mingjiao/hdg/maopeng",
	},
	room_relative="é��--����",
}
Room {
	id = "mingjiao/hdg/huapu4",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/chufang",
		["north"] = "mingjiao/hdg/houshan",
	},
	
}
Room {
	id = "mingjiao/hdg/kongdi",
	name = "�յ�",
	outdoor = "������",
	ways = {
		["southwest"] = "mingjiao/hdg/xiaojing2",
		["northwest"] = "mingjiao/hdg/shanlu2",
		["north"] = "mingjiao/hdg/niupeng",
		["northeast"] = "mingjiao/hdg/shanlu1",
	},
	room_relative="ɽ·ţ��ɽ·�I���J�յبLС���յ�",
}
Room {
	id = "mingjiao/hdg/maopeng",
	name = "é��",
	outdoor = "������",
	ways = {
		["north"] = "mingjiao/hdg/xfang2",
		["east"] = "mingjiao/hdg/caojing",
		["west"] = "mingjiao/hdg/huapu3",
	},
	
}
Room {
	id = "mingjiao/hdg/maowu",
	name = "é��",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/caojing",
		["east"] = "mingjiao/hdg/yaofang",
		["north"] = "mingjiao/hdg/caotang",
		["west"] = "mingjiao/hdg/xfang2",
	},
	room_relative="���ã��᷿-----é��-----ҩ�����ݾ�é��",
}
Room {
	id = "mingjiao/hdg/niupeng",
	name = "ţ��",
	outdoor = "������",
	
		 ways = {
                ["south"] = "mingjiao/hdg/kongdi",
                --["northdown"] = "mingjiao/hdg/caojing",
                ["#hdgleavein"] = "mingjiao/hdg/caojing",          
        },
  
}
Room {
	id = "mingjiao/hdg/shanbi",
	name = "ɽ��",
	outdoor = "������",
        ways = {
                ["south"] = "city/wroad3",
                --["right"] = "mingjiao/hdg/huacong1",
                ["#bohuacong"] = "mingjiao/hdg/huacong1",
        },
        nolooks = {
                ["#bohuacong"] = true,
        },
    ---room_relative="ɽ�ڣ���·ɽ��",
}
Room {
	id = "mingjiao/hdg/shanlu1",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["northup"] = "mingjiao/hdg/shanlu3",
		["southwest"] = "mingjiao/hdg/kongdi",
	},
	room_relative="ɽ·��ɽ·�L�յ�ɽ·",
}
Room {
	id = "mingjiao/hdg/shanlu2",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["northup"] = "mingjiao/hdg/shanlu4",
		["southeast"] = "mingjiao/hdg/kongdi",
	},
	room_relative="ɽ·��ɽ·�K�յ�ɽ·",
}
Room {
	id = "mingjiao/hdg/shanlu3",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["eastdown"] = "mingjiao/hdg/huapu1",
		["southdown"] = "mingjiao/hdg/shanlu1",
	},
	room_relative="ɽ·�����ԡ�ɽ·ɽ·",
}
Room {
	id = "mingjiao/hdg/shanlu4",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["westdown"] = "mingjiao/hdg/huapu1",
		["southdown"] = "mingjiao/hdg/shanlu2",
	},
	room_relative="���ԡ�ɽ·��ɽ·ɽ·",
}
Room {
	id = "mingjiao/hdg/shufang",
	name = "�鷿",
	outdoor = "������",
	ways = {
		["west"] = "mingjiao/hdg/xfang3",
	},
	room_relative="�᷿-----�鷿�鷿",
}
Room {
	id = "mingjiao/hdg/xfang1",
	name = "�᷿",
	outdoor = "������",
	ways = {
		["north"] = "mingjiao/hdg/yaofang",
		["east"] = "mingjiao/hdg/huapu2",
		["west"] = "mingjiao/hdg/caojing",
	},
	room_relative="ҩ�����ݾ�-----�᷿-----�����᷿",
}
Room {
	id = "mingjiao/hdg/xfang2",
	name = "�᷿",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/maopeng",
		["east"] = "mingjiao/hdg/maowu",
		["north"] = "mingjiao/hdg/chufang",
	},
	room_relative="�������᷿-----é�ݣ�é���᷿",
}
Room {
	id = "mingjiao/hdg/xfang3",
	name = "�᷿",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/yaofang",
		["east"] = "mingjiao/hdg/shufang",
		["west"] = "mingjiao/hdg/caotang",
	},
	room_relative="����-----�᷿-----�鷿��ҩ���᷿",
}
Room {
	id = "mingjiao/hdg/xfang4",
	name = "�᷿",
	outdoor = "������",
	ways = {
		["out"] = "mingjiao/hdg/caotang",
	},
	nolooks = {
		["out"] = true,
	},
	precmds = {
		["out"] = "open door",
	},
	
}
Room {
	id = "mingjiao/hdg/xiaojing",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/huacong1",
		["north"] = "mingjiao/hdg/xiaojing1",
	},
	room_relative="С����С����������С��",
}
Room {
	id = "mingjiao/hdg/xiaojing1",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/xiaojing",
		["north"] = "mingjiao/hdg/xiaojing2",
	},
	room_relative="С����С����С��С��",
}
Room {
	id = "mingjiao/hdg/xiaojing2",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "mingjiao/hdg/xiaojing1",
		["northeast"] = "mingjiao/hdg/kongdi",
	},
	room_relative="�յبJС����С��С��",
}
Room {
	id = "mingjiao/hdg/yaofang",
	name = "ҩ��",
	outdoor = "������",
		ways = {
		["south"] = "mingjiao/hdg/xfang1",
		["north"] = "mingjiao/hdg/xfang3",
		["west"] = "mingjiao/hdg/maowu",
	},
	room_relative="�᷿��é��-----ҩ�����᷿ҩ��",
}
Room {
	id = "mingjiao/htping",
	name = "����ƺ",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/shaqiu4",
		["west"] = "mingjiao/dashaqiu",
	},
	nolooks = {
		["south"] = true,
		["east"] = true,
	},
	objs = {
          ["���޸�"] = "yin wufu",
		  ["����"] = "nan jiaozhong",
           },
	room_relative="��ɳ��----����ƺ----Сɳ����KСɳ��Сɳ�����ƺ",
}
Room {
	id = "mingjiao/huoqi",
	name = "�һ���",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/bingqi",
		["north"] = "mingjiao/wu2",
		["east"] = "mingjiao/cl1",
		["west"] = "mingjiao/didao/senlin",
	},
	postcmds = {
		["south"] = "#walkBusy",
	},
	lengths={
	     ["west"] = 3,
	},
	objs = {
          ["��Ȼ"] = "xin ran",
	
           },
room_relative="���ȣ����䳡-----���������ɼ���һ���",
}
Room {
	id = "mingjiao/jinqi",
	name = "�����",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/rukou",
		["south"] = "mingjiao/zl7",
		["west"] = "mingjiao/shiwang",
		["east"] = "mingjiao/didao/senlin",
	},
	lengths={
	     ["east"] = 3,
	},
	objs = {
          ["ׯ�"] = "zhuang zheng",
	room_relative="ʨ���������-----��ɼ�֣�������������",
           },
}
Room {
	id = "mingjiao/jyt",
	name = "������",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/sht",
		["south"] = "mingjiao/xting",
		["east"] = "mingjiao/shiwang",
		["west"] = "mingjiao/longwang",
	},
	objs = {
          ["��ң"] = "fan yao",
		  ["������"] = "nv jiaozhong",
		  ["����"] = "nv jiaozhong",
  room_relative="ʥ���á�������----������----ʨ�����С��������",
           },
}
Room {
	id = "mingjiao/ljroad1",
	name = "�ּ�С·",
	outdoor = "����",
	ways = {
		["westdown"] = "mingjiao/shanyao",
		["northwest"] = "mingjiao/ljroad2",
		["northeast"] = "mingjiao/ljroad2a",
	},
	room_relative="�ּ�С·�ּ�С·�I�J��ɽ�����ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad2",
	name = "�ּ�С·",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/ljroad1",
		["northwest"] = "mingjiao/ljroad3",
	},
	room_relative="�ּ�С·�I�ּ�С·�K�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad2a",
	name = "�ּ�С·",
	outdoor = "����",
	ways = {
		["southwest"] = "mingjiao/ljroad1",
		["northeast"] = "mingjiao/ljroad3",
	},
	room_relative="�ּ�С·�J�ּ�С·�L�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/ljroad3",
	name = "�ּ�С·",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/qianting",
		["southeast"] = "mingjiao/ljroad2",
		["southwest"] = "mingjiao/ljroad2a",
	},
	room_relative="��̳ǰ�����ּ�С·�L�K�ּ�С·�ּ�С·�ּ�С·",
}
Room {
	id = "mingjiao/longwang",
	name = "������",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/jyt",
		["west"] = "mingjiao/tuqi",
		--["northwest"] = "mingjiao/yuanzi",
	},
	objs = {
          ["����"] = "yang xiao",
           },
	room_relative="СԺ�ӨI������----������----������������",
}
Room {
	id = "mingjiao/lsd/anbian",
	name = "����",
	ways = {
		["eastup"] = "mingjiao/lsd/shanguang",
	},
}
Room {
	id = "mingjiao/lsd/lsgu",
	name = "���߹�",
	ways = {
		["southup"] = "mingjiao/lsd/shanguang",
		["north"] = "mingjiao/lsd/sfjiao",
	},
}
Room {
	id = "mingjiao/lsd/sfjiao",
	name = "ɽ�����",
		ways = {
		["northup"] = "mingjiao/lsd/shanfeng",
		["south"] = "mingjiao/lsd/lsgu",
	},
}
Room {
	id = "mingjiao/lsd/shanfeng",
	name = "ɽ��",
	
	ways = {
		["southdown"] = "mingjiao/lsd/sfjiao",
	},
}
Room {
	id = "mingjiao/lsd/shanguang",
	name = "ɽ��",
	
	ways = {
		["westdown"] = "mingjiao/lsd/anbian",
		["northdown"] = "mingjiao/lsd/lsgu",
	},
}
Room {
	id = "mingjiao/muqi",
	name = "��ľ��",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/gmd",
		["south"] = "mingjiao/tingtang",
		["east"] = "mingjiao/didao/shuling2",
		["west"] = "mingjiao/didao/shuling1",
	},
	objs = {
          ["�Ų���"] = "wen cangsong",
           },
	blocks = {
		["northup"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["south"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["east"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
		["west"] = {
			{id = "jiao zhong", exp = 100000, party = "����"},
		},
	},
	
}
Room {
	id = "mingjiao/qianting",
	name = "��̳ǰ��",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/tingtang",
		["southdown"] = "mingjiao/ljroad3",
	},
	objs = {
          ["��Ұ��"] = "yin yewang",
		  ["�ֿ���"] = "nan jiaozhong",
		  ["����"] = "nan jiaozhong",
           },
	room_relative="���ã���̳ǰ�����ּ�С·��̳ǰ��",
}
Room {
	id = "mingjiao/rukou",
	name = "�������",
	outdoor = "����",
	ways = {
		["southwest"] = "mingjiao/zl7",
		["northwest"] = "mingjiao/jinqi",
	},
	objs = {
          ["��ǫ"] = "leng qian",
           },
	room_relative="�����I������ڨL���ȼ������",
}
Room {
	id = "mingjiao/shanjiao",
	name = "ɽ����",
	outdoor = "����",
	ways = {
		["eastup"] = "mingjiao/sshanlu1",
		["westup"] = "kunlun/zhenyuanqiao",
		["south"] = "mingjiao/shejing",
	},
	room_relative="��Զ�š�ɽ���¡�ɽ·��ɳĮ����ɽ����",
}
Room {
	id = "mingjiao/shanlu1",
	name = "ɽ��С·",
	outdoor = "����",
	ways = {
		["eastdown"] = "mingjiao/shanlu2",
		["westup"] = "mingjiao/shuiqi",
	},
	room_relative="���ȣ������������",
}
Room {
	id = "mingjiao/shanlu2",
	name = "ɽ��С·",
	outdoor = "����",
	ways = {
		["westup"] = "mingjiao/shanlu1",
		["east"] = "mingjiao/bishui",
	},
	blocks = {
		["east"] = {
			{id = "jiao zhong", exp = 1000000},
		},

	},
	
}
Room {
	id = "mingjiao/shanting",
	name = "ɽͤ",
	outdoor = "����",
	ways = {
		["westup"] = "mingjiao/sshanlu6",
		["northdown"] = "mingjiao/sshanlu5",
	},
	room_relative="ɽ·��ɽ·��ɽͤɽͤ",
}
Room {
	id = "mingjiao/shanyao",
	name = "��ɽ��",
	outdoor = "����",
	ways = {
		["eastup"] = "mingjiao/ljroad1",
		["northdown"] = "mingjiao/sshanlu6",
	},
	room_relative="ɽ·����ɽ�����ּ�С·��ɽ��",
}
Room {
	id = "mingjiao/shaqiu1",
	name = "Сɳ��",
	outdoor = "����",
	ways = {
		["east"] = "group/entry/mjshamo1",
		["west"] = "mingjiao/shaqiu2",
	},
	room_relative="Сɳ���Сɳ��----Сɳ��----��ɳĮ��Сɳ��Сɳ��",
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shaqiu2",
	name = "Сɳ��",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/shaqiu1",
		["west"] = "mingjiao/shaqiu3",
	},
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
	room_relative="Сɳ���Сɳ��Сɳ��",
}
Room {
	id = "mingjiao/shaqiu3",
	name = "Сɳ��",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/shaqiu2",
		["west"] = "mingjiao/shaqiu4",
	},
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
	room_relative="Сɳ���Сɳ��Сɳ��",
}
Room {
	id = "mingjiao/shaqiu4",
	name = "Сɳ��",
	outdoor = "����",
	ways = {
		["northwest"] = "mingjiao/htping",
		["east"] = "mingjiao/shaqiu3",
	},
	room_relative="����ƺСɳ��I��Сɳ��----Сɳ���Сɳ��Сɳ��",
	nolooks = {
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "mingjiao/shejing",
	name = "ɳĮ����",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/shanjiao",
		["east"] = "mingjiao/dashaqiu",
		["west"] = "mingjiao/bank",
	},
	room_relative="ɽ���£�����ի---ɳĮ����---��ɳ��ɳĮ����",
}
Room {
	id = "mingjiao/shiwang",
	name = "ʨ����",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/jinqi",
		["west"] = "mingjiao/jyt",
},
	objs = {
          ["�����"] = "nv jiaozhong",
		  ["����"] = "nan jiaozhong",
	},
	room_relative="������----ʨ����----�����ʨ����",
}
Room {
	id = "mingjiao/sht",
	name = "ʥ����",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/baota",
		["southdown"] = "mingjiao/jyt",
	},
	objs = {
          ["���޼�"] = "zhang wuji",
		  ["������"] = "nv jiaozhong",
	room_relative="����������ʥ���á�������ʥ����",
           },
}
Room {
	id = "mingjiao/shuiqi",
	name = "��ˮ��",
	outdoor = "����",
	ways = {
		["eastdown"] = "mingjiao/shanlu1",
		["north"] = "mingjiao/wu4",
		["west"] = "mingjiao/cl2",
		["east"] = "mingjiao/didao/senlin",
	},
	lengths={
	     ["east"] = 3,
	},
	objs = {
          ["����"] = "tang yang",
	room_relative="��ɼ�֣�ɽ��С·-----���䳡�����Ⱥ�ˮ��",
           },
}
Room {
	id = "mingjiao/shuyuan",
	name = "��Ժ",
	outdoor = "����",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/wu1",
	},
	objs = {
          ["���¾����Ͼ�"] = "jing",
          ["������"] = "shu",
          ["������;�"] = "shu",
          ["���ݸ�Ŀ"] = "bencao gangmu",
          ["ҩ��"] = "yaoli jing",
           },
	room_relative="��Ժ-----���䳡��Ժ",
}
Room {
	id = "mingjiao/sleeproom",
	name = "��Ϣ��",
	outdoor = "����",
	no_fight = true,
	ways = {
		["west"] = "mingjiao/xting",
	},
	room_relative="С��----��Ϣ����Ϣ��",
}
Room {
	id = "mingjiao/sshanlu1",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["southup"] = "mingjiao/sshanlu2",
		["westdown"] = "mingjiao/shanjiao",
	},
	room_relative="ɽ���¡�ɽ·��ɽ·ɽ·",
}
Room {
	id = "mingjiao/sshanlu2",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["westup"] = "mingjiao/sshanlu3",
		["northdown"] = "mingjiao/sshanlu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "mingjiao/sshanlu3",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["northup"] = "mingjiao/sshanlu4",
		["eastdown"] = "mingjiao/sshanlu2",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "mingjiao/sshanlu4",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/xuanya1",
		["southdown"] = "mingjiao/sshanlu3",
	},
	room_relative="ջ����ɽ·��ɽ·ɽ·",
}
Room {
	id = "mingjiao/sshanlu5",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["southup"] = "mingjiao/shanting",
		["westdown"] = "mingjiao/xuanya3",
	},
	room_relative="ջ����ɽ·��ɽͤɽ·",
}
Room {
	id = "mingjiao/sshanlu6",
	name = "ɽ·",
	outdoor = "����",
	ways = {
		["southup"] = "mingjiao/shanyao",
		["eastdown"] = "mingjiao/shanting",
	},
	room_relative="ɽ·��ɽͤ����ɽ��ɽ·",
}
Room {
	id = "mingjiao/tandi",
	name = "̶��",
	outdoor = "����",
	ways = {
		["up"] = "mingjiao/bishui",
	},
}
Room {
	id = "mingjiao/tearoom",
	name = "����",
	outdoor = "����",
	no_fight = true,
	ways = {
		["east"] = "mingjiao/tingtang",
	},
	objs = {
          ["��÷��"] = "suanmei tang",
          ["�̲�С��"] = "xiao tong",
           },
	room_relative="����-----���ò���",
}
Room {
	id = "mingjiao/tingtang",
	name = "����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/qianting",
		["east"] = "mingjiao/xiangfang",
		["north"] = "mingjiao/muqi",
		["west"] = "mingjiao/tearoom",
},
        objs = {
          ["СѾ��"] = "xiao yahuan",
		  ["С��ͯ"] = "xiao shitong",
	room_relative="��ľ�������-----����-----�᷿����̳ǰ������",
	},
}
Room {
	id = "mingjiao/tuqi",
	name = "������",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/zl6",
		["east"] = "mingjiao/longwang",
		["west"] = "mingjiao/didao/senlin",
	},
	lengths = {
		["east"] = "if hp.exp < 1600000 then return false else return 1 end",
		["west"] = 3;
	},
	objs = {
          ["��ԫ"] = "yan tan",
	room_relative="���ȣ�������-----��ɼ�ֺ�����",
           },
}
Room {
	id = "mingjiao/wu1",
	name = "���䳡",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/guangc",
		["east"] = "mingjiao/yaofang",
		["north"] = "mingjiao/xting",
		["west"] = "mingjiao/shuyuan",
	},
	objs = {
          ["����"] = "zhang zhong",
		  ["�⻨"] = "nv jiaozhong",
		  ["�Ÿ�"] = "nan jiaozhong",
	room_relative="С������Ժ----���䳡----ҩ�����㳡���䳡",
		  
           },
}
Room {
	id = "mingjiao/wu2",
	name = "���䳡",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/huoqi",
		["east"] = "mingjiao/zl1",
		["north"] = "mingjiao/zl6",
	},
	objs = {
          ["������"] = "nan jiaozhong",
		  ["֣����"] = "nv jiaozhong",
	},
	room_relative="���ȣ����䳡----���ȣ��һ������䳡",
}
Room {
	id = "mingjiao/wu3",
	name = "���䳡",
	outdoor = "����",
	ways = {
		["north"] = "mingjiao/guangc",
		["east"] = "mingjiao/cl2",
		["southdown"] = "mingjiao/gmd",
		["west"] = "mingjiao/cl1",
},
	objs = {
          ["������"] = "yin wushou",
		  ["֣Тʤ"] = "nan jiaozhong",
		  ["֣��ܰ"] = "nv jiaozhong",
	room_relative="�㳡������----���䳡----���ȡ����������䳡",
	},
}
Room {
	id = "mingjiao/wu4",
	name = "���䳡",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/shuiqi",
		["north"] = "mingjiao/zl7",
		["west"] = "mingjiao/zl2",
	},
room_relative="���ȣ�����----���䳡����ˮ�����䳡",
}
Room {
	id = "mingjiao/wxiang",
	name = "���᷿",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/yuanzi",
	},
	room_relative="СԺ��--���᷿",
}
Room {
	id = "mingjiao/xiangfang",
	name = "�᷿",
	outdoor = "����",
	no_fight = true,
	ways = {
		["#walkBusy;west"] = "mingjiao/tingtang",
	},
	room_relative="����-----�᷿�᷿",
}
Room {
	id = "mingjiao/xting",
	name = "С��",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/wu1",
		["east"] = "mingjiao/sleeproom",
		["north"] = "mingjiao/jyt",
		["west"] = "mingjiao/eatroom",
	},
	objs = {
          ["�ܵ�"] = "zhou dian",
		  ["л���"] = "nv jiaozhong",
		  ["�Ŷ���"] = "nan jiaozhong",
           },
	room_relative="������������-----С��-----��Ϣ�ң����䳡С��",
}
Room {
	id = "mingjiao/xuanya1",
	name = "ջ��",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/sshanlu4",
		["northwest"] = "mingjiao/xuanya2a",
		["northeast"] = "mingjiao/xuanya2",
	},
	room_relative="ջ��ջ���I�Jջ����ɽ·ջ��",
}
Room {
	id = "mingjiao/xuanya2",
	name = "ջ��",
	outdoor = "����",
	ways = {
		["southwest"] = "mingjiao/xuanya1",
		["northeast"] = "mingjiao/xuanya3",
	},
	room_relative="ջ���Jջ���Lջ��ջ��",
}
Room {
	id = "mingjiao/xuanya2a",
	name = "ջ��",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/xuanya1",
		["northwest"] = "mingjiao/xuanya3",
	},
	room_relative="ջ���Iջ���Kջ��ջ��",
}
Room {
	id = "mingjiao/xuanya3",
	name = "ջ��",
	outdoor = "����",
	ways = {
		["eastup"] = "mingjiao/sshanlu5",
		["southeast"] = "mingjiao/xuanya2a",
		["southwest"] = "mingjiao/xuanya2",
	},
	room_relative="ջ����ɽ·�L�Kջ��ջ��ջ��",
}
Room {
	id = "mingjiao/yaofang",
	name = "ҩ��",
	outdoor = "����",
	ways = {
		["west"] = "mingjiao/wu1",
	},
	objs = {
          ["ҩʦ"] = "yao shi",
           },
	room_relative="���䳡-----ҩ��ҩ��",
}
Room {
	id = "mingjiao/yuanzi",
	name = "СԺ��",
	outdoor = "����",
	ways = {
		["southeast"] = "mingjiao/longwang",
		["west"] = "mingjiao/wxiang",
	},
	room_relative="����������᷿СԺ��",
}
Room {
	id = "mingjiao/zl1",
	name = "����",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/guangc",
		["west"] = "mingjiao/wu2",
	},
	room_relative="���䳡-----����-----�㳡����",
}
Room {
	id = "mingjiao/zl2",
	name = "����",
	outdoor = "����",
	ways = {
		["east"] = "mingjiao/wu4",
		["west"] = "mingjiao/guangc",
	},
	room_relative="�㳡-----����-----���䳡����",
}
Room {
	id = "mingjiao/zl6",
	name = "����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/wu2",
		["north"] = "mingjiao/tuqi",
	},
	objs = {
          ["˵����"] = "shuo bude",
	room_relative="����������ȣ����䳡����",
           },
}
Room {
	id = "mingjiao/zl7",
	name = "����",
	outdoor = "����",
	ways = {
		["south"] = "mingjiao/wu4",
		["north"] = "mingjiao/jinqi",
		["northeast"] = "mingjiao/rukou",
	},
	objs = {
          ["��Ө��"] = "peng yingyu",
	room_relative="����������ڣ��J���ȣ����䳡����",
           },
}
Room {
	id = "mr/cangshuge",
	name = "�����",
	outdoor = "����Ľ��",
	no_fight = true,
	ways = {
		["down"] = "mr/yunjinlou",
	},
	room_relative="�ƽ�¥--�����",
}
Room {
	id = "mr/chufang",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/xiaoting",
	},
	objs = {
          ["��Ҷ������"] = "dongsun-tang",
          ["���Ϻ��"] = "lingbai xiaren",
          ["ӣ�һ���"] = "yingtao huotui",
           },
	room_relative="С��--����",
}
--Room {
--	id = "mr/cl",
--	name = "����",
--	ways = {
--		["north"] = "mr/qianyuan",
--		["east"] = "mr/cl1",
--	},
--}
Room {
	id = "mr/cufang",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["east"] = "mr/didao1",
	},
	
}
Room {
	id = "mr/didao",
	name = "�ص�",
	outdoor = "����Ľ��",
	ways = {
		["xiaodao"] = "mr/houtang",
		["north"] = "mr/didao1",
		["yanziwu"] = "yanziwu/shuixie",
		["shanzhuang"] = "mtl/shiqiao1",
		["out"] = "mr/shiqiao",
	},
}
Room {
	id = "mr/didao1",
	name = "�ص�",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/didao",
		["east"] = "mr/sleeproom",
		["west"] = "mr/cufang",
	},
}
Room {
	id = "mr/didao2",
	name = "�ص�",
	outdoor = "����Ľ��",
	ways = {
		["north"] = "mr/migong1",
	},
}
Room {
	id = "mr/duchuan3",
	name = "�ɴ�",
	outdoor = "����Ľ��",
	ways = {
		["out"] = "mr/xiaodao",
	},
}
Room {
	id = "mr/houtang",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["north"] = "mr/xiaoting",
		["zuan didao"] = "mr/didao",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
	room_relative="С�������ú���",
}
Room {
	id = "mr/hubian",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["east"] = "mr/hubian1",
		["west"] = "suzhou/qingshidadao",
	},
	room_relative="��ʯ���-----����-----���ߺ���",
}
Room {
	id = "mr/hubian1",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["east"] = "mr/hubian2",
		["west"] = "mr/hubian",
	},
	room_relative="���ߣ����ߺ���",
}
Room {
	id = "mr/hubian2",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["southeast"] = "mr/shiqiao",
		["west"] = "mr/hubian1",
	},
	
}
Room {
	id = "mr/kongfang",
	name = "�շ���",
	outdoor = "����Ľ��",
	ways = {
		["west"] = "mr/migong2",
	},
}
Room {
	id = "mr/migong1",
	name = "�Թ�",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/migong1",
		["north"] = "mr/migong4",
		["east"] = "mr/migong2",
		["west"] = "mr/migong3",
	},
}
Room {
	id = "mr/migong2",
	name = "�Թ�",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/migong3",
		["east"] = "mr/migong4",
		["north"] = "mr/migong2",
		["west"] = "mr/migong3",
	},
}
Room {
	id = "mr/migong3",
	name = "�Թ�",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/migong1",
		["north"] = "mr/migong3",
		["east"] = "mr/migong2",
		["west"] = "mr/migong4",
	},
}
Room {
	id = "mr/migong4",
	name = "�Թ�",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/migong3",
		["east"] = "mr/migong4",
		["north"] = "mr/migong4",
		["west"] = "mr/migong1",
	},
}
Room {
	id = "mr/mishi",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/fenmu",
	},
}
Room {
	id = "mr/mishi1",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["up"] = "mr/mishi",
	},
}
Room {
	id = "mtl/anbian",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mtl/hc",
		["east"] = "mtl/hc1",
		["west"] = "mtl/hc2",
	},
	room_relative="������-----����-----�����У������а���",
}
Room {
	id = "mtl/anbian1",
	name = "����",
	outdoor = "����Ľ��",
	ways = {
		["north"] = "mtl/xiaojing11",
		["qu xiaozhu;#CboatWait"] = "mr/xiaodao",
		["qu yanziwu;#CboatWait"] = "yanziwu/anbian2",
	},
	nolooks = {
		["qu xiaozhu;#CboatWait"] = true,
		["qu yanziwu;#CboatWait"] = true,
	},
	lengths = {
		["qu xiaozhu;#CboatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		["qu yanziwu;#CboatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		},
		
}
Room {
	id = "mtl/cangshuge",
	name = "�����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["down"] = "mtl/yunjinlou",
	},
	room_relative="�ƽ�¥--�����",
}
Room {
	id = "mtl/cl",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["north"] = "mtl/qianyuan",
		["east"] = "mtl/cl1",
	},
	room_relative="ǰԺ������-----���ȳ���",
}
Room {
	id = "mtl/cl1",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/cl2",
		["west"] = "mtl/cl",
	},
	room_relative="����-----����-----���ȳ���",
}
Room {
	id = "mtl/cl2",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl3",
		["north"] = "mtl/xiaojing5",
		["west"] = "mtl/cl1",
	},
	room_relative="С��������-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl3",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiangfang1",
		["east"] = "mtl/houyuan",
		["north"] = "mtl/cl2",
		["west"] = "mtl/cl3-1",
	},
	room_relative="���ȣ�����-----����-----��Ժ���᷿����",
}
Room {
	id = "mtl/cl3-1",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl3-2",
		["east"] = "mtl/cl3",
	},
	room_relative="����-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl3-2",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl3-3",
		["east"] = "mtl/xiangfang1",
		["north"] = "mtl/cl3-1",
	},
	room_relative="���ȣ�����-----�᷿�����ȳ���",
}
Room {
	id = "mtl/cl3-3",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/hffang",
		["north"] = "mtl/cl3-2",
	},
	room_relative="���ȣ�����-----���ʷ�����",
}
Room {
	id = "mtl/cl4",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl4-2",
		["north"] = "mtl/xiaojing7",
		["east"] = "mtl/cl4-1",
	},
	room_relative="С��������-----���ȣ����ȳ���",
}
Room {
	id = "mtl/cl4-1",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["eastup"] = "mtl/tingzi",
		["west"] = "mtl/cl4",
	},
	room_relative="����-----���ȡ�ͤ�ӳ���",
}
Room {
	id = "mtl/cl4-2",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/keting",
		["north"] = "mtl/cl4",
		["east"] = "mtl/cl4-3",
		["west"] = "mtl/houyuan",
	},
	room_relative="���ȣ���Ժ-----����-----��������",
}
Room {
	id = "mtl/cl4-3",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl4-4",
		["east"] = "mtl/fanting",
		["west"] = "mtl/cl4-2",
	},
	room_relative="����-----����-----���������ȳ���",
	blocks = {
		["east"] = {
			{id = "jia ding", exp = 30000, party = "����Ľ��"}
		},
        	precmds = {
              ["east"] = "kill jia ding",
	},
	},
}
Room {
	id = "mtl/cl4-4",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl4-5",
		["east"] = "mtl/guifang",
		["north"] = "mtl/cl4-3",
		["west"] = "mtl/keting",
	},
	room_relative="���ȣ�����-----����-----�뷿�����ȳ���",
	blocks = {
		["east"] = {
			{id = "ya huan", exp = 5000},
		},
	},
}
Room {
	id = "mtl/cl4-5",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["north"] = "mtl/cl4-4",
		["west"] = "mtl/zahuoshi",
	},
	room_relative="���ȣ��ӻ���-----���ȳ���",
}
Room {
	id = "mtl/fanting",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["west"] = "mtl/cl4-3",
	},
	objs = {
          ["������Ҷ��"] = "longjing caiyeji",
          ["�����Բ"] = "feicui yuyuan",
          ["÷����Ѽ"] = "meihua zaoya",
           },
	room_relative="����--����",
}
Room {
	id = "mtl/guifang",
	name = "�뷿",
	outdoor = "��٢��ɽׯ",
	ways = {
		["west"] = "mtl/cl4-4",
		["jump window"] = "mtl/ytyuan1"
	},
	nolooks = {
		["jump window"] = true,
	},
}
Room {
	id = "mtl/hc",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/zhuangmen",
		["north"] = "mtl/anbian",
		["west"] = "mtl/hc3",
	},
	room_relative="�����У�ׯ��-----���߻�����",
}
Room {
	id = "mtl/hc1",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/zhuangmen",
		["east"] = "mtl/hc4",
		["west"] = "mtl/anbian",
	},
	room_relative="����----������----�����У�ׯ�Ż�����",
}
Room {
	id = "mtl/hc2",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/hc3",
		["east"] = "mtl/anbian",
	},
	room_relative="������----���ߣ������л�����",
}
Room {
	id = "mtl/hc3",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["north"] = "mtl/hc2",
		["east"] = "mtl/hc",
	},
room_relative="�����У�������----�����л�����",
}
Room {
	id = "mtl/hc4",
	name = "������",
	ways = {
		["south"] = "mtl/qianyuan",
		["west"] = "mtl/hc1",
	},
  room_relative="������----�����У�ǰԺ������",
}
Room {
	id = "mtl/hffang",
	name = "���ʷ�",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/hhyuan",
		["west"] = "mtl/cl3-3",
	},
	objs = {
          ["�ƹ���"] = "tang guangxiong",
          ["������"] = "yan mama",
           },
   room_relative="����----���ʷ�----��԰���ʷ�",
}
Room {
	id = "mtl/hhyuan",
	name = "��԰",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/zahuoshi",
		["north"] = "mtl/yunjinlou",
		["west"] = "mtl/hffang",
	},
	room_relative="�ƽ�¥�����ʷ�----��԰----�ӻ��Һ�԰",
}
Room {
	id = "mtl/houyuan",
	name = "��Ժ",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/yunjinlou",
		["north"] = "mtl/xiaojing8",
		["east"] = "mtl/cl4-2",
		["west"] = "mtl/cl3",
	},
	room_relative="�ƽ�¥��С��----���ȣ����Ⱥ�Ժ",
}
Room {
	id = "mtl/huandong",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["north"] = "mtl/ytyuan",
		["combat"] = "mtl/ytyuansz",
		["gift"] = "mtl/ytyuantf",
		["misc"] = "mtl/ytyuanzx",
		["weapon"] = "mtl/ytyuansb",
	},
	objs = {
          ["������"] = "wang yuyan",
           },
	room_relative="ӣ��԰��������������",
}
Room {
	id = "mtl/ytyuansz",
	name = "������-ʵս��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuantf",
	name = "������-�츳��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuanzx",
	name = "������-���",
	outdoor = "��٢��ɽׯ",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/ytyuansb",
	name = "������-�����",
	ways = {
		["out"] = "mtl/huandong",
	},
}
Room {
	id = "mtl/keting",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/cl4-4",
		["north"] = "mtl/cl4-2",
		["west"] = "mtl/yunjinlou",
	},
	objs = {
          ["���"] = "xiang cha",
          ["��Բ"] = "gui yuan",
          ["����"] = "pu tao",
	room_relative="���ȣ��ƽ�¥-----����-----���ȿ���",
           },
}
Room {
	id = "mtl/liulin",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing5",
		["east"] = "mtl/liulin1",
	},
	objs = {
          ["����"] = "liu tiao",
  room_relative="������----�����֣�С��������",
           },
}
Room {
	id = "mtl/liulin1",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing6",
		["north"] = "mtl/liulin3",
		["east"] = "mtl/liulin2",
		["west"] = "mtl/liulin",
	},
room_relative="�����֣�������----������----�����֣�С��������",
}
Room {
	id = "mtl/liulin2",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing7",
		["west"] = "mtl/liulin1",
	},
room_relative="������----�����֣�С��������",
}
Room {
	id = "mtl/liulin3",
	name = "������",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/liulin1",
		["yue tree"] = "mtl/shushang",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
           },
  
}
Room {
	id = "mtl/shushang",
	name = "����",
	outdoor = "��٢��ɽׯ",
	ways = {
		["jump down"] = "mtl/liulin3",
	},
	room_relative="������--����",
}
Room {
	id = "mtl/midao",
	name = "�ص�",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/ytyuan",
		["north"] = "mtl/hhyuan",
	},
}
Room {
	id = "mtl/qianyuan",
	name = "ǰԺ",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl",
		["east"] = "mtl/shiqiao1",
		["north"] = "mtl/hc4",
		["west"] = "mtl/zhuangmen",
	},
room_relative="�����У�ׯ��-----ǰԺ-----Сʯ�ţ�����ǰԺ",
}
Room {
	id = "mtl/shiqiao1",
	name = "Сʯ��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/xiaojing5",
		["west"] = "mtl/qianyuan",
		["zuan didao"] = "mr/didao",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
	room_relative="ǰԺ----Сʯ��----С��Сʯ��",
}
Room {
	id = "mtl/shuichi",
	name = "ˮ��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["west"] = "mtl/xiaojing7",
	},
	room_relative="С��-----ˮ��ˮ��",
}
Room {
	id = "mtl/tingzi",
	name = "ͤ��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["westdown"] = "mtl/cl4-1",
	},
	room_relative="���ȡ�ͤ��ͤ��",
}
Room {
	id = "mtl/xiangfang1",
	name = "�᷿",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/yunjinlou",
		["north"] = "mtl/cl3",
		["west"] = "mtl/cl3-2",
	},
	room_relative="���ȣ�����-----�᷿-----�ƽ�¥�᷿",
}
Room {
	id = "mtl/xiaojing10",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing11",
		["north"] = "mtl/zhuangmen",
	},
	room_relative="ׯ�ţ�С����С��С��",
}
Room {
	id = "mtl/xiaojing11",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/anbian1",
		["north"] = "mtl/xiaojing10",
	},
	room_relative="С����С��������С��",
}
Room {
	id = "mtl/xiaojing5",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl2",
		["east"] = "mtl/xiaojing6",
		["north"] = "mtl/liulin",
		["west"] = "mtl/shiqiao1",
	},
	room_relative="�����֣�Сʯ��-----С��-----С��������С��",
}
Room {
	id = "mtl/xiaojing6",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing8",
		["east"] = "mtl/xiaojing7",
		["north"] = "mtl/liulin1",
		["west"] = "mtl/xiaojing5",
	},
	room_relative="�����֣�С��-----С��-----С����С��С��",
}
Room {
	id = "mtl/xiaojing7",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/cl4",
		["east"] = "mtl/shuichi",
		["north"] = "mtl/liulin2",
		["west"] = "mtl/xiaojing6",
	},
room_relative="�����֣�С��-----С��-----ˮ�أ�����С��",
}
Room {
	id = "mtl/xiaojing8",
	name = "С��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/houyuan",
		["north"] = "mtl/xiaojing6",
	},
	room_relative="��Ժ��С��С��",
}
Room {
	id = "mtl/ytyuan",
	name = "ӣ��԰",
	outdoor = "��٢��ɽׯ",
	no_fight = true,
	ways = {
		["south"] = "mtl/huandong",
		["north"] = "mtl/midao",
		["west"] = "mtl/ytyuan2",
	},
	room_relative="�ص���ӣ��԰----ӣ��԰��������ӣ��԰",
}
Room {
	id = "mtl/ytyuan1",
	name = "ӣ��԰",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/huandong",
		["east"] = "mtl/ytyuan2",
		["north"] = "mtl/ytyuan1",
		["west"] = "mtl/ytyuan1",
	},
	room_relative="�����񶴣�ӣ��԰-----ӣ��԰��ӣ��԰ӣ��԰",
}
Room {
	id = "mtl/ytyuan2",
	name = "ӣ��԰",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/huandong",
		["north"] = "mtl/ytyuan2",
		["east"] = "mtl/ytyuan",
		["west"] = "mtl/ytyuan2",
	},
	room_relative="�����񶴣�ӣ��԰-----ӣ��԰��ӣ��԰ӣ��԰",
}
Room {
	id = "mtl/yunjinlou",
	name = "�ƽ�¥",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/hhyuan",
		["east"] = "mtl/keting",
		["north"] = "mtl/houyuan",
		["west"] = "mtl/xiangfang1",
	},
	objs = {
          ["������"] = "Wang furen",
   room_relative="��Ժ���᷿----�ƽ�¥----��������԰�ƽ�¥",
           },
}
Room {
	id = "mtl/zahuoshi",
	name = "�ӻ���",
	outdoor = "��٢��ɽׯ",
	ways = {
		["east"] = "mtl/cl4-5",
		["west"] = "mtl/hhyuan",
	},
	objs = {
          ["������"] = "bingqi jia",
           },
   room_relative="��԰----�ӻ���----�����ӻ���",
}
Room {
	id = "mtl/zhuangmen",
	name = "ׯ��",
	outdoor = "��٢��ɽׯ",
	ways = {
		["south"] = "mtl/xiaojing10",
		["east"] = "mtl/qianyuan",
		["north"] = "mtl/hc1",
		["west"] = "mtl/hc",
	},
room_relative="�����У�������-----ׯ��-----ǰԺ��С��ׯ��",
}
Room {
	id = "mr/shiqiao",
	name = "Сʯ��",
	outdoor = "����Ľ��",
	ways = {
		["push ����;d"] = "mr/didao",
		["south"] = "mr/testmatou1",
		["northwest"] = "mr/hubian2",
	},
	nolooks = {
		["push ����;d"] = true,
	},
	lengths = {
		["push ����;d"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
}
Room {
	id = "mr/sleeproom",
	name = "��Ϣ��",
	outdoor = "����Ľ��",
	no_fight = true,
	ways = {
		["west"] = "mr/didao1",
	},
	
}
Room {
	id = "mr/testmatou1",
	name = "��ͷ",
	outdoor = "����Ľ��",
	ways = {
		["north"] = "mr/shiqiao",
		["qu mr;#boatWait"] = "mr/xiaodao",
		["qu yanziwu;#boatWait"] = "yanziwu/anbian2",
	},
	nolooks = {
		["qu mr;#boatWait"] = true,
		["qu yanziwu;#boatWait"] = true,
	},
	lengths = {
		["qu mr;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
		["qu yanziwu;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
	room_relative="Сʯ�ţ�С������ͷ",
}
Room {
	id = "mr/tingyuju",
	name = "�����",
	outdoor = "����Ľ��",
	ways = {
		["southeast"] = "mr/xiaojing2",
		["tan qin;#boatWait"] = "mtl/anbian",
	},
	nolooks = {
		["tan qin;#boatWait"] = true,
	},
	lengths = {
		["tan qin;#boatWait"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
	room_relative="����ӨKС�������",
}
Room {
	id = "mr/tingzi",
	name = "ͤ��",
	outdoor = "����Ľ��",
	ways = {
		["westdown"] = "mr/cl4-1",
	},
	
}
Room {
	id = "mr/xiangfang",
	name = "�᷿",
	outdoor = "����Ľ��",
	no_fight = true,
	ways = {
		["west"] = "mr/xiaoting",
	},
	room_relative="С��-----�᷿�᷿",
}
Room {
	id = "mr/xiaodao",
	name = "С����",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/xiaoshe",
		["#boatYell"] = "mr/testmatou1",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
	room_relative="С���ߣ�С��С����",
}
Room {
	id = "mr/xiaojing1",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["east"] = "mr/xiaoshe",
		["west"] = "mr/xiaojing2",
	},
	room_relative="С��-----С��-----С��С��",
}
Room {
	id = "mr/xiaojing2",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["northwest"] = "mr/tingyuju",
		["east"] = "mr/xiaojing1",
	},
	room_relative="����ӨIС��-----С��С��",
}
Room {
	id = "mr/xiaojing3",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["northeast"] = "mr/xiaojing4",
		["west"] = "mr/xiaoshe",
	},
	room_relative="С���JС��-----С��С��",
}
Room {
	id = "mr/xiaojing4",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["southwest"] = "mr/xiaojing3",
		["east"] = "mr/xiaoting",
	},
	room_relative="С��-----С���LС��С��",
}
Room {
	id = "mr/xiaoshe",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["east"] = "mr/xiaojing3",
		["north"] = "mr/xiaodao",
		["#weaponUnWalk;west;#weaponWWalk"] = "mr/xiaojing1",
	},
	objs = {
          ["����ͬ"] = "bao butong",
           },
	room_relative="С���ߣ�С��-----С��-----С��С��",
}
Room {
	id = "mr/xiaoting",
	name = "С��",
	outdoor = "����Ľ��",
	ways = {
		["south"] = "mr/houtang",
		["east"] = "mr/xiangfang",
		["north"] = "mr/chufang",
		["west"] = "mr/xiaojing4",
	},
	blocks = {
		["north"] = {
			{id = "a bi", exp = 50000, party = "����Ľ��"},
		},
        precmds = {
              ["north"] = "kill a bi",
	},
	},
	objs = {
          ["���"] = "xiang cha",
          ["����"] = "a bi",
           },
	
}
Room {
	id = "mr/xiaozhou3",
	name = "�ɴ�",
	outdoor = "����Ľ��",
	ways = {
		["out"] = "mtl/anbian",
	},
}
Room {
	id = "yanziwu/anbian2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/shuixie",
	},
	room_relative="����ˮ�--����",
}
Room {
	id = "yanziwu/anbian3",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/houyuan1",
		["#boatYell"] = "mr/hubian2",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
 		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
	
}
Room {
	id = "yanziwu/anbian4",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/shuixie",
		["#boatYell"] = "mtl/anbian1",
	},
	nolooks = {
		["#boatYell"] = true,
		["enter"] = true,
	},
	lengths = {
		["#boatYell"] = "if score.party and score.party=='����Ľ��' then return false else return 1 end",
	},
	
}
Room {
	id = "yanziwu/bishuiting",
	name = "��ˮͤ",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/muqiao",
		["jump liang"] = "yanziwu/lianshang",
	},
}
Room {
	id = "yanziwu/lianshang",
	name = "����",
	outdoor = "������",
	ways = {
		["jump down"] = "yanziwu/bishuiting",
	},
}
Room {
	id = "yanziwu/cl5-0",
        name = "����",
		outdoor = "������",
        ways = {
                ["south"] = "yanziwu/cl5-1",
                ["east"] = "yanziwu/fanting1",
                ["west"] = "yanziwu/shufang",
                ["#yzwchanglang2shufang"] = "yanziwu/shufang",
        },
        nolooks = {
                ["#yzwchanglang2shufang"] = true,
        },
        lengths = {
                ["west"] = "if job.name=='huashan' or job.name=='wudang' then return false else return 1 end",
                ["#yzwchanglang2shufang"] = "if job.name=='huashan' or job.name=='wudang' then return 1 else return false end",
        },
        
        blocks = {
                ["east"] = {
                        {id = "guan jia", exp = 50000},
                },
         	precmds = {
              ["east"] = "kill guan jia",
	},
        },
}
Room {
	id = "yanziwu/cl5-1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl5-2",
		["east"] = "yanziwu/cl5-3",
		["north"] = "yanziwu/cl5-0",
		["west"] = "yanziwu/xiangfang2",
	},
        objs = {
          ["Ѿ��"] = "ya huan",
	},
	room_relative="���ȣ��᷿-----����-----���ȣ����ȳ���",
}
Room {
	id = "yanziwu/cl5-2",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/cl5-1",
		["west"] = "yanziwu/shangyue",
	},
        objs = {
          ["�ܼ�"] = "guan jia",
	},
	room_relative="���ȣ�����ի-----���ȳ���",
}
Room {
	id = "yanziwu/cl5-3",
	name = "����",
	outdoor = "������",
		ways = {
		["south"] = "yanziwu/xiaomen",
		["west"] = "yanziwu/cl5-1",
},
        objs = {
          ["��λ�Ҷ�"] = "jia ding",
	},
	room_relative="����-----���ȣ�С�ų���",
}
Room {
	id = "yanziwu/cl5-4",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/xiaomen",
		["east"] = "yanziwu/xiaojing3",
		["west"] = "yanziwu/cl5-5",
	},
	room_relative="С�ţ�����-----����-----С������",
}
Room {
	id = "yanziwu/cl5-5",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/shangyue",
		["east"] = "yanziwu/cl5-4",
		["west"] = "yanziwu/cl5-6",
	},
	room_relative="����ի������-----����-----���ȳ���",
}
Room {
	id = "yanziwu/cl5-6",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/cl5-5",
		["west"] = "yanziwu/cl6-5",
	},
	room_relative="����-----����-----���ȳ���",
}
Room {
	id = "yanziwu/cl6-0",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl6-1",
		["east"] = "yanziwu/jushi",
},
        objs = {
          ["Ѿ��"] = "ya huan",
	},
	room_relative="����-----���ң����ȳ���",
}
Room {
	id = "yanziwu/cl6-1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl6-2",
		["east"] = "yanziwu/xiangfang3",
		["north"] = "yanziwu/cl6-0",
		["west"] = "yanziwu/cl6-3",
},
        objs = {
          ["��λ����"] = "pu ren",
	},
	room_relative="���ȣ�����-----����-----�᷿�����ȳ���",
}
Room {
	id = "yanziwu/cl6-2",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/jingyinge",
		["north"] = "yanziwu/cl6-1",
	},
        objs = {
          ["�ܼ�"] = "guan jia",
	},
	room_relative="����-----��������",
}
Room {
	id = "yanziwu/cl6-3",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/xiaomen1",
		["east"] = "yanziwu/cl6-1",
},
        objs = {
          ["��λ�Ҷ�"] = "jia ding"
	},
	room_relative="����-----���ȣ�С�ų���",
}
Room {
	id = "yanziwu/cl6-4",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/xiaomen1",
		["east"] = "yanziwu/cl6-5",
	},
	room_relative="С�ţ�����-----���ȳ���",
}
Room {
	id = "yanziwu/cl6-5",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/jingyinge",
		["east"] = "yanziwu/cl5-6",
		["west"] = "yanziwu/cl6-4",
	},
	room_relative="�����������-----����-----���ȳ���",
}
Room {
	id = "yanziwu/dating",
        name = "����",
		outdoor = "������",
        ways = {
                ["south"] = "yanziwu/houting",
                ["north"] = "yanziwu/xiaojing2",
                ["east"] = "yanziwu/shufang",
                ["west"] = "yanziwu/jushi",
                ["#yzwdating2shufang"] = "yanziwu/shufang",
        },
        nolooks = {
                ["#yzwdating2shufang"] = true,
        },
        lengths = {
                ["east"] = "if job.name=='huashan' or job.name=='wudang' then return false else return 1 end",
                ["#yzwdating2shufang"] = "if job.name=='huashan' or job.name=='wudang' then return 1 else return false end",
        },        
        objs = {
                ["���"] = "xiang cha",
                ["��ұǬ"] = "gongye gan",
        },
		room_relative="С��������-----����-----�鷿����������",
}
Room {
	id = "yanziwu/fanting1",
	name = "����",
	outdoor = "������",
	ways = {
		["west"] = "yanziwu/cl5-0",
	},
	room_relative="����-----��������",
}
Room {
	id = "yanziwu/fenmu",
	name = "Ĺ��",
	outdoor = "������",
	ways = {
		["west"] = "yanziwu/xiaojing4",
	},
	room_relative="С��-----Ĺ��Ĺ��",
}
Room {
	id = "yanziwu/guanxing",
	name = "����̨",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/xiaojing4",
	},
	room_relative="����̨��С������̨",
}
Room {
	id = "yanziwu/houting",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/neitang",
		["east"] = "yanziwu/xiangfang2",
		["north"] = "yanziwu/dating",
		["west"] = "yanziwu/xiangfang3",
	},
	room_relative="�������᷿-----����-----�᷿�����ú���",
}
Room {
	id = "yanziwu/houyuan1",
	name = "��Ժ",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/anbian3",
		["east"] = "yanziwu/yanziwu",
		["north"] = "yanziwu/shuixie",
		["west"] = "yanziwu/muqiao",
	},
	room_relative="����ˮ鿣�ľ��-----��Ժ-----Ժ�ţ����ߺ�Ժ",
}
Room {
	id = "yanziwu/hssg",
	name = "��ʩˮ��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/jiabi",
	},
	
}
Room {
	id = "yanziwu/jiabi",
	name = "�б�",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/hssg",
		["push shujia"] = "yanziwu/shufang",
	},
	nolooks = {
		["push shujia"] = true,
	},
	lengths = {
		["north"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
	room_relative="��ʩˮ����鷿�б�",
}
Room {
	id = "yanziwu/jingyinge",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl6-5",
		["east"] = "yanziwu/neitang",
		["west"] = "yanziwu/cl6-2",
	},
	room_relative="����----������----���ã����Ⱦ�����",
}
Room {
	id = "yanziwu/jushi",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/xiangfang3",
		["east"] = "yanziwu/dating",
		["west"] = "yanziwu/cl6-0",
	},
	room_relative="����-----����-----�������᷿����",
}
Room {
	id = "yanziwu/mishi",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/fenmu",
	},
}
Room {
	id = "yanziwu/mishi1",
	name = "����",
	outdoor = "������",
	ways = {
		["up"] = "yanziwu/mishi",
	},
}
Room {
	id = "yanziwu/muqiao",
	name = "ľ��",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/houyuan1",
		["west"] = "yanziwu/bishuiting",
	},
	room_relative="��ˮͤ-----ľ��-----��Ժľ��",
}
Room {
	id = "yanziwu/neitang",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/shangyue",
		["north"] = "yanziwu/houting",
		["west"] = "yanziwu/jingyinge",
	},
	room_relative="������������-----����-----����ի����",
}
Room {
	id = "yanziwu/shangyue",
	name = "����ի",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl5-5",
		["east"] = "yanziwu/cl5-2",
		["west"] = "yanziwu/neitang",
	},
	room_relative="����----����ի----���ȣ���������ի",
}
Room {
        id = "yanziwu/shufang",
        name = "�鷿",
		outdoor = "������",
        ways = {
                ["south"] = "yanziwu/xiangfang2",
                ["north"] = "yanziwu/sishu",
                ["east"] = "yanziwu/cl5-0",
                ["west"] = "yanziwu/dating",
                ["sit chair;zhuan"] = "yanziwu/jiabi",
                ["#yzwshufang2jiabi"] = "yanziwu/jiabi",
        },
        nolooks = {
                ["sit chair;zhuan"] = true,
                ["#yzwshufang2jiabi"] = true,
        },
        lengths = {
                ["sit chair;zhuan"] = "if job.name=='huashan' or job.name=='wudang' then return false else return 1 end",
                ["#yzwshufang2jiabi"] = "if job.name=='huashan' or job.name=='wudang' then return 1 else return false end",
        },
        objs = {
                ["�粨��"] = "feng boe",
        },
		room_relative="˽�ӣ�����-----�鷿-----���ȣ��᷿�鷿",
}
Room {
        id = "yanziwu/sishu",
        name = "˽��",
		outdoor = "������",
        ways = {
                ["south"] = "yanziwu/shufang",
                ["#yzwsishu2shufang"] = "yanziwu/shufang",
        },
        nolooks = {
                ["#yzwsishu2shufang"] = true,
        },
        lengths = {
                ["north"] = "if job.name=='huashan' or job.name=='wudang' then return false else return 1 end",
                ["#yzwsishu2shufang"] = "if job.name=='huashan' or job.name=='wudang' then return 1 else return false end",
        },
}
Room {
	id = "yanziwu/shuixie",
	name = "����ˮ�",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/houyuan1",
		["north"] = "yanziwu/anbian2",
		["zuan didao"] = "mr/didao",
		["west"] = "yanziwu/anbian4",
	},
	nolooks = {
		["zuan didao"] = true,
	},
	lengths = {
		["zuan didao"] = "if score.party and score.party=='����Ľ��' then return 1 else return false end",
	},
	objs = {
          ["����"] = "a zhu",
           },
	room_relative="���ߣ�����---����ˮ鿣���Ժ����ˮ�",
}
Room {
	id = "yanziwu/wuchang",
	name = "���䳡",
	outdoor = "������",
	ways = {
		["west"] = "yanziwu/yanziwu",
	},
	objs = {
          ["������"] = "bingqi jia",
		  ["��λ�Ҷ�"] = "jia ding",
           },
	room_relative="Ժ��----���䳡���䳡",
}
Room {
	id = "yanziwu/xiangfang2",
        name = "�᷿",
		outdoor = "������",
        no_fight = true,
        ways = {
                ["north"] = "yanziwu/shufang",
                ["east"] = "yanziwu/cl5-1",
                ["west"] = "yanziwu/houting",
                ["#yzwxiangfang2shufang"] = "yanziwu/shufang",
        },
        nolooks = {
                ["#yzwxiangfang2shufang"] = true,
        },
        lengths = {
                ["north"] = "if job.name=='huashan' or job.name=='wudang' then return false else return 1 end",
                ["#yzwxiangfang2shufang"] = "if job.name=='huashan' or job.name=='wudang' then return 1 else return false end",
        },
		room_relative="�鷿������-----�᷿-----�����᷿",
}
Room {
	id = "yanziwu/xiangfang3",
	name = "�᷿",
	outdoor = "������",
	no_fight = true,
	ways = {
		["north"] = "yanziwu/jushi",
		["east"] = "yanziwu/houting",
		["west"] = "yanziwu/cl6-1",
	},
	room_relative="���ң�����-----�᷿-----�����᷿",
}
Room {
	id = "yanziwu/xiaojing2",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/dating",
		["north"] = "yanziwu/yanziwu",
	},
	room_relative="Ժ�ţ�С��������С��",
}
Room {
	id = "yanziwu/xiaojing3",
	name = "С��",
	outdoor = "������",
	ways = {
		["east"] = "yanziwu/xiaojing4",
		["west"] = "yanziwu/cl5-4",
	},
	room_relative="����-----С��-----С��С��",
}
Room {
	id = "yanziwu/xiaojing4",
	name = "С��",
	outdoor = "������",
	ways = {
		["north"] = "yanziwu/guanxing",
		["east"] = "yanziwu/fenmu",
		["west"] = "yanziwu/xiaojing3",
	},
	objs = {
          ["�˰ٴ�"] = "deng baichuan",
           },
	room_relative="����̨��С��-----С��-----Ĺ��С��",
}
Room {
	id = "yanziwu/xiaomen",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl5-4",
		["north"] = "yanziwu/cl5-3",
	},
	room_relative="���ȣ�С�ţ�����С��",
}
Room {
	id = "yanziwu/xiaomen1",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/cl6-4",
		["north"] = "yanziwu/cl6-3",
	},
	room_relative="���ȣ�С�ţ�����С��",
}
Room {
	id = "yanziwu/yanziwu",
	name = "Ժ��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/xiaojing2",
		["east"] = "yanziwu/wuchang",
		["west"] = "yanziwu/houyuan1",
	},
	objs = {
          ["Ľ�ݸ�"] = "murong fu",
          ["Ľ����Ϯͼ��"] = "board",
           },
	room_relative="��Ժ-----Ժ��-----���䳡��С��Ժ��",
}
Room {
	id = "yanziwu/zishu",
	name = "˽��",
	outdoor = "������",
	ways = {
		["south"] = "yanziwu/shufang",
	},
	room_relative="�鷿--˽��",
}
Room {
	id = "mr/zhou3",
	name = "С��",
	outdoor = "������",
	ways = {
		["out"] = "yanziwu/anbian2",
	},
}
Room {
	id = "mr/zhou9",
	name = "С��",
	outdoor = "������",
	ways = {
		["out"] = "mr/xiaodao",
	},
}
Room {
	id = "nanyang/dating",
	name = "����ׯ����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "nanyang/jxzhuang",
		["east"] = "nanyang/houyuan",
	},
	objs = {
          ["�ξ�"] = "you ju",
          ["����"] = "you ji",
           },
 room_relative="����ׯ����--����ׯ��Ժ������ׯ���ž���ׯ����",
}
Room {
	id = "nanyang/duanya",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "nanyang/yidao4",
	},
	room_relative="���֣����¶���",
}
Room {
	id = "nanyang/houyuan",
	name = "����ׯ��Ժ",
	outdoor = "������",
	ways = {
		["west"] = "nanyang/dating",
	},
	room_relative="����ׯ����--����ׯ��Ժ����ׯ��Ժ",
}
Room {
	id = "nanyang/jiulou1",
	name = "ӭ��¥",
	outdoor = "������",
	ways = {
		["east"] = "nanyang/nanyang",
		["up"] = "nanyang/jiulou2",
	},
	room_relative="ӭ��¥��¥��ӭ��¥----������ӭ��¥",
}
Room {
	id = "nanyang/jiulou2",
	name = "ӭ��¥��¥",
	outdoor = "������",
	ways = {
		["down"] = "nanyang/jiulou1",
	},
	room_relative="ӭ��¥��¥��ӭ��¥ӭ��¥��¥",
}
Room {
	id = "nanyang/jxzhuang",
	name = "����ׯ����",
	outdoor = "������",
	ways = {
		["southwest"] = "nanyang/xiaolu3",
		["north"] = "nanyang/dating",
	},
	room_relative="����ׯ����������ׯ���ŨLС·����ׯ����",
}
Room {
	id = "nanyang/kedian1",
	name = "��ջ",
	ways = {
		["#nykzout"] = "nanyang/xujiaji",
		["#nykz"] = "nanyang/kedian2",
		},
	lengths = {
		["#nykz"] = 5,
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="�͵��¥����Ҽ�-----��ջ��ջ",
}
Room {
	id = "nanyang/kedian2",
	name = "�͵��¥",
	outdoor = "������",
	no_fight = true,
	ways = {
		["down"] = "nanyang/kedian1",
	},
}
Room {
	id = "nanyang/nanyang",
	name = "������",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "nanyang/yidao2",
		["north"] = "nanyang/yidao3",
		["west"] = "nanyang/jiulou1",
	},
	room_relative="�������ӭ��¥----�����ģ�ʯ��·������",
}
Room {
	id = "nanyang/qslu",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["south"] = "nanyang/xujiaji",
		["east"] = "nanyang/xiaolu3",
		["west"] = "nanyang/xiaolu",
	},
	room_relative="С·----��ʯ·----С·����Ҽ���ʯ·",
}
Room {
	id = "nanyang/qslu2",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["north"] = "nanyang/xujiaji",
	},
	room_relative="��Ҽ�����ʯ·��ʯ·",
}
Room {
	id = "nanyang/xiaolu",
	name = "С·",
	outdoor = "������",
	ways = {
		["east"] = "nanyang/qslu",
		["west"] = "nanyang/yidao2",
	},
	room_relative="ʯ��·-----С·-----��ʯ·С·",
}
Room {
	id = "nanyang/xiaolu2",
	name = "��·",
	outdoor = "������",
	ways = {
		["northeast"] = "nanyang/xujiaji",
		["west"] = "nanyang/yidao",
	},
	room_relative="��Ҽ��J���-----��·��·",
}
Room {
	id = "nanyang/xiaolu3",
	name = "С·",
	outdoor = "������",
	ways = {
		["northeast"] = "nanyang/jxzhuang",
		["west"] = "nanyang/qslu",
	},
	objs = {
          ["����"] = "xiao feng",
           },
   room_relative="����ׯ���ŨJ��ʯ·-----С·С·",
}
Room {
	id = "nanyang/xujiaji",
	name = "��Ҽ�",
	outdoor = "������",
	ways = {
		["southwest"] = "nanyang/xiaolu2",
		["south"] = "nanyang/qslu2",
		["north"] = "nanyang/qslu",
		["east"] = "nanyang/kedian1",
	},
	room_relative="��ʯ·����Ҽ�----��ջ�L����·��ʯ·��Ҽ�",
}
Room {
	id = "nanyang/yidao",
	name = "���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/henanroad2",
		["north"] = "nanyang/yidao1",
		["east"] = "nanyang/xiaolu2",
	},
	room_relative="���ţ����-----��·����·���",
}
Room {
	id = "nanyang/yidao1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "nanyang/yidao",  
		["north"] = "nanyang/yidao2",
	},
	room_relative="ʯ��·�����ţ��������",
}
Room {
	id = "nanyang/yidao2",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["south"] = "nanyang/yidao1",
		["east"] = "nanyang/xiaolu",
		["north"] = "nanyang/nanyang",
	},
	room_relative="�����ģ�ʯ��·----С·������ʯ��·",
}
Room {
	id = "nanyang/yidao3",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "nanyang/nanyang",
		["north"] = "shaolin/ruzhou",
		["east"] = "nanyang/yidao4",
	},
	lengths = {
	    ["east"] = "if job.name and job.name=='husong' then return false else return 1 end",
	},
	room_relative="���ݳǣ������----���֣������Ĵ����",
}
Room {
	id = "nanyang/yidao4",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "nanyang/duanya",
		["northeast"] = "huanghe/weifen",
		["west"] = "nanyang/yidao3",
	},
	room_relative="μ������J�����-----���֣���������",
}
Room {
	id = "ningbo/aywsi",
	name = "��������",
	outdoor = "������",
	ways = {
		["southeast"] = "ningbo/ningbo",
		["northwest"] = "ningbo/tianyige",
		["east"] = "ningbo/xikou",
		["west"] = "ningbo/tianfengta",
	},
	room_relative="��һ��I�����---��������---Ϫ�ڨK�����İ�������",
}
Room {
	id = "ningbo/baoguosi",
	name = "������",
	outdoor = "������",
	ways = {
		["northdown"] = "ningbo/shilu",
	},
	room_relative="ʯ·�������±�����",
}
Room {
	id = "ningbo/dongqianhu",
	name = "��Ǯ��",
	outdoor = "������",
	ways = {
		["southwest"] = "ningbo/kedian",
		["south"] = "ningbo/xuedoushan",
		["north"] = "ningbo/xikou",
		["west"] = "ningbo/ningbo",
	},
	room_relative="Ϫ�ڣ�������----��Ǯ���L���͵�ѩ�ɽ��Ǯ��",
}
Room {
	id = "ningbo/kedian",
	name = "�͵�",
	outdoor = "������",
	ways = {
		["north"] = "ningbo/ningbo",
		["northeast"] = "ningbo/dongqianhu",
		["west"] = "ningbo/majiu",
		["#nbkz"] = "ningbo/kedian2",
		},
	lengths = {
		["#nbkz"] = 5,
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="�����Ķ�Ǯ�����J���-----�͵�͵�",
}
Room {
	id = "ningbo/kedian2",
	name = "�͵��¥",
	outdoor = "������",
	ways = {
		["enter"] = "ningbo/kedian3",
		["down"] = "ningbo/kedian",
	},
}
Room {
	id = "ningbo/kedian3",
	name = "�͵��¥",
	outdoor = "������",
	ways = {
		["out"] = "ningbo/kedian2",
	},
}
Room {
	id = "ningbo/majiu",
	name = "���",
	outdoor = "������",
	ways = {
		["east"] = "ningbo/kedian",
		["northeast"] = "ningbo/ningbo",
	},
	room_relative="�����ĨJ���-----�͵����",
}
Room {
	id = "ningbo/ningbo",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "ningbo/kedian",
		["northwest"] = "ningbo/aywsi",
		["east"] = "ningbo/dongqianhu",
		["west"] = "ningbo/ttcsi",
	},
	room_relative="�������¨I��ͯ����----������----��Ǯ�����͵������",
}
Room {
	id = "ningbo/qsddao1",
	name = "��ʯ�ٵ�",
	outdoor = "������",
	ways = {
		["southeast"] = "group/entry/nbqsddao",
		["westup"] = "hz/shanlu2",
	},
	room_relative="ɽ·����ʯ�ٵ��K��ʯ�ٵ���ʯ�ٵ�",
}
Room {
	id = "ningbo/shilu",
	name = "ʯ·",
	outdoor = "������",
	ways = {
		["southup"] = "ningbo/baoguosi",
		["south"] = "ningbo/tianfengta",  
		["northwest"] = "group/entry/nbqsddao",
		["east"] = "ningbo/tianyige",  
	},
	room_relative="��ʯ�ٵ��Iʯ·-----��һ��������ʯ·",
}
Room {
	id = "ningbo/tianfengta",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "ningbo/ttcsi",
		["north"] = "ningbo/shilu",  
		["east"] = "ningbo/aywsi",
	},
	room_relative="ʯ·�������----�������£���ͯ���������",
}
Room {
	id = "ningbo/tianyige",
	name = "��һ��",
	outdoor = "������",
	ways = {
		["southeast"] = "ningbo/aywsi",
		["west"] = "ningbo/shilu",  
	},
	room_relative="ʯ·----��һ��K����������һ��",
}
Room {
	id = "ningbo/ttcsi",
	name = "��ͯ����",
	outdoor = "������",
	ways = {
		["southwest"] = "fuzhou/road2",
		["north"] = "ningbo/tianfengta",  
		["east"] = "ningbo/ningbo",
	},
	room_relative="���������ͯ����---�����ĨLɽ·��ͯ����",
}
Room {
	id = "ningbo/xikou",
	name = "Ϫ��",
	outdoor = "������",
	ways = {
		["south"] = "ningbo/dongqianhu",
		["west"] = "ningbo/aywsi",
	},
	objs = {
          ["����"] = "shao gong",
           },
	room_relative="��������-----Ϫ�ڣ���Ǯ��Ϫ��",
}
Room {
	id = "ningbo/xuedoushan",
	name = "ѩ�ɽ",
	outdoor = "������",
	ways = {
		["north"] = "ningbo/dongqianhu",
	},
	room_relative="��Ǯ����ѩ�ɽѩ�ɽ",
}
Room {
	id = "putian/cb-dian",
	name = "�ȱ���",
	outdoor = "��������",
	ways = {
		["south"] = "putian/guangchang",
		["north"] = "putian/qianyuan",
	},
	objs = {
          ["Ԫ������"] = "yuanjue zunzhe",
      },
	  room_relative="ǰԺ���ȱ�����㳡�ȱ���",
}
Room {
	id = "putian/celang2",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xiaoyuan4",
		["north"] = "putian/xiaoyuan2",
	},
	room_relative="СԺ�����ȣ�СԺ����",
}
Room {
	id = "putian/celang3",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xiaoyuan5",
		["north"] = "putian/xiaoyuan3",
	},
	room_relative="СԺ�����ȣ�СԺ����",
}
Room {
	id = "putian/celang4",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xj4",
		["north"] = "putian/sengshe",
		["west"] = "putian/xiaoyuan4",
	},
	room_relative="ɮ���СԺ-----���ȣ�С������",
}
Room {
	id = "putian/celang5",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xj3",
		["east"] = "putian/xiaoyuan5",
		["north"] = "putian/chufang",
	},
	room_relative="����������-----СԺ��С������",
}
Room {
	id = "putian/changlang2",
	name = "����",
	outdoor = "��������",
	ways = {
		["east"] = "putian/jcyuan",
		["west"] = "putian/fzshi",
	},
	room_relative="������-----����-----���Ժ����",
}
Room {
	id = "putian/changlang3",
	name = "����",
	outdoor = "��������",
	ways = {
		["east"] = "putian/nuange",
		["west"] = "putian/jcyuan",
	},
	room_relative="���Ժ-----����-----ů����",
}
Room {
	id = "putian/chufang",
	name = "����",
	outdoor = "��������",
	ways = {
		["south"] = "putian/celang5",
	},
	room_relative="���������ȷ���",
}
Room {
	id = "putian/cjg",
	name = "�ؾ���",
	outdoor = "��������",
	ways = {
		["northdown"] = "putian/mf-dian",
	},
	objs = {
          ["��������"] = "shaolin wuji",
          ["�޺�ȭ��"] = "shaolin wuji",
          ["��մ�ʦ"] = "dachi dashi",
      },
}
Room {
	id = "putian/dc-dian",
	name = "��˵�",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/wgg",
		["north"] = "putian/xj4",
		["west"] = "putian/lhtang",
	},
	room_relative="С�����޺���----��˵���书���˵�",
}
Room {
	id = "putian/dmyuan",
	name = "��ĦԺ",
	outdoor = "��������",
	ways = {
		["west"] = "putian/mf-dian",
	},
	objs = {
          ["�쾵��ʦ"] = "tianjing chanshi",
      },
	 room_relative="���----��ĦԺ��ĦԺ",
}
Room {
	id = "putian/dxb-dian",
	name = "���۱���",
	outdoor = "��������",
	ways = {
		["northdown"] = "putian/guangchang",
		["southdown"] = "putian/qiandian",
	},
	objs = {
          ["����ʦ"] = "daku dashi",
      },
	  room_relative="�㳡�����۱����ǰ����۱���",
}
Room {
	id = "putian/fatang2",
	name = "����",
	outdoor = "��������",
	ways = {
		["east"] = "putian/houdian",
	},
	room_relative="����-----����",
}
Room {
	id = "putian/fatang3",
	name = "����",
	outdoor = "��������",
	ways = {
		["west"] = "putian/houdian",
	},
	room_relative="���-----���÷���",
}
Room {
	id = "putian/fzshi",
	name = "������",
	outdoor = "��������",
	ways = {
		["east"] = "putian/changlang2",
	},
	room_relative="������----���ȷ�����",
}
Room {
	id = "putian/guangchang",
	name = "�㳡",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/dxb-dian",
		["east"] = "putian/xiaoyuan4",
		["north"] = "putian/cb-dian",
		["west"] = "putian/xiaoyuan5",
	},
	room_relative="�ȱ����СԺ-----�㳡-----СԺ�����۱���㳡",
}
Room {
	id = "putian/houdian",
	name = "���",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xm-dian",
		["north"] = "putian/zhongdian",
		["east"] = "putian/fatang3",
		["west"] = "putian/fatang2",
	},
	objs = {
          ["Ԫ������"] = "yuanshang zunzhe",
      },
	 room_relative="�е������-----���-----���ã����ֵ���",
}
Room {
	id = "putian/jcyuan",
	name = "���Ժ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/jingshi",
		["north"] = "putian/xm-dian",
		["east"] = "putian/changlang3",
		["west"] = "putian/changlang2",
	},
	blocks = {
		["south"] = {
			{id = "dadian dashi", exp = 2200000},
		},
	precmds = {
              ["south"] = "kill dadian dashi",
	},
	},
	objs = {
          ["��ߴ�ʦ"] = "dadian dashi",
      },
}
Room {
	id = "putian/jingshi",
	name = "����",
	outdoor = "��������",
	ways = {
		["north"] = "putian/jcyuan",
	},
	objs = {
          ["�����ʦ"] = "tianhong chanshi",
      },
	  room_relative="���Ժ�����Ҿ���",
}
Room {
	id = "putian/jnlw-dian",
	name = "����������",
	outdoor = "��������",
	ways = {
		["north"] = "putian/xiaoyuan5",
	},
	objs = {
          ["Ԫŭ����"] = "yuannu zunzhe",
      },
	  room_relative="СԺ���������������������",
}
Room {
	id = "putian/lhtang",
	name = "�޺���",
	outdoor = "��������",
	ways = {
		["east"] = "putian/dc-dian",
	},
	objs = {
          ["Ԫʹ����"] = "yuantong zunzhe",
      },
	  room_relative="�޺���----��˵��޺���",
}
Room {
	id = "putian/liangt",
	name = "��ͤ",
	outdoor = "��������",
	no_fight = true,
	ways = {
		["stand;out"] = "putian/road07",
	},
	room_relative="��ͤ��ɽ·",
}
Room {
	id = "putian/lz-dian",
	name = "�����",
	outdoor = "��������",
	ways = {
		["north"] = "putian/xiaoyuan4",
	},
	objs = {
          ["Ԫ������"] = "yuanai zunzhe",
      },
	  room_relative="СԺ������������",
}
Room {
	id = "putian/mf-dian",
	name = "���",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/cjg",
		["north"] = "putian/xj3",
		["east"] = "putian/dmyuan",
	},
	blocks = {
		["southup"] = {
			{id = "wu seng", exp = 200000},
		},
        precmds = {
              ["southup"] = "kill wu seng",
	},
	},
}
Room {
	id = "putian/mtd1",
	name = "�����",
	outdoor = "��������",
	ways = {
		["northup"] = "putian/mtd2",
	},
	objs = {
          ["Ԫ������"] = "yuanhui zunzhe",
      },
	room_relative="����ء�����������",
}
Room {
	id = "putian/mtd2",
	name = "�����",
	outdoor = "��������",
	ways = {
		["north"] = "putian/xl8",
		["southdown"] = "putian/mtd1",
	},
	room_relative="С·������ء�����������",
}
Room {
	id = "putian/nuange",
	name = "ů��",
	outdoor = "��������",
	ways = {
		["west"] = "putian/changlang3",
	},
	room_relative="���ȣ�ů��",
}
Room {
	id = "putian/qiandian",
	name = "ǰ��",
	outdoor = "��������",
	ways = {
		["northup"] = "putian/dxb-dian",
		["south"] = "putian/zhongdian",
	},
	room_relative="���۱�����е�ǰ��",
}
Room {
	id = "putian/qianyuan",
	name = "ǰԺ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/cb-dian",
		["east"] = "putian/xiaoyuan2",
		["west"] = "putian/xiaoyuan3",
		["north"] = "putian/shanmen",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open gate",
	},
}
Room {
	id = "putian/road01",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["south"] = "putian/road02",
		["northwest"] = "fuzhou/road3",
	},
	room_relative="ɽ·�Iɽ·��ɽ·ɽ· ",
}
Room {
	id = "putian/road02",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["southeast"] = "putian/road03",
		["northeast"] = "fuzhou/wroad4",
		["north"] = "putian/road01",
	},
	room_relative="ɽ·ɽ·���Jɽ·�Kɽ·ɽ· ",
}
Room {
	id = "putian/road03",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["northwest"] = "putian/road02",
		["east"] = "putian/road04",
	},
	room_relative="ɽ·�Iɽ·-----ɽ·ɽ· ",
}
Room {
	id = "putian/road04",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["northeast"] = "putian/road05",
		["west"] = "putian/road03",
	},
	room_relative="ɽ·�Jɽ·-----ɽ·ɽ· ",
}
Room {
	id = "putian/road05",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["eastup"] = "putian/road06",
		["southwest"] = "putian/road04",
},
		objs = {
		["����"] = "tiao fu",
	},
	room_relative="ɽ·��ʯ�רLɽ·ɽ· ",
}
Room {
	id = "putian/road06",
	name = "ʯ��",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/road07",
		["westdown"] = "putian/road05",
	},
	room_relative="ɽ·��ʯ�ס�ɽ·ʯ��",
}
Room {
	id = "putian/road07",
	name = "ɽ·",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/road08",
		["enter"] = "putian/liangt",
		["northdown"] = "putian/road06",
	},
	room_relative="ʯ�ס�ɽ·��ʯ��ɽ·",
}
Room {
	id = "putian/road08",
	name = "ʯ��",
	outdoor = "��������",
	ways = {
		["southup"] = "putian/shanmen",
		["northdown"] = "putian/road07",
	},
	room_relative="ɽ·��ʯ�ס�ɽ��ʯ��",
}
Room {
	id = "putian/sengshe",
	name = "ɮ��",
	outdoor = "��������",
	no_fight = true,
	ways = {
		["south"] = "putian/celang4",
	},
	room_relative="����----ɮ��",
}
Room {
	id = "putian/shanmen",
	name = "ɽ��",
	outdoor = "��������",
	ways = {
		["east"] = "putian/xl3",
		["northdown"] = "putian/road08",
		["west"] = "putian/xl2",
		["south"] = "putian/qianyuan",  
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "knock gate",
	},
}
Room {
	id = "putian/wgg",
	name = "�书��",
	outdoor = "��������",
	ways = {
		["northdown"] = "putian/dc-dian",
	},
	objs = {
          ["Ԫ������"] = "yuanbei zunzhe",
      },
	  room_relative="��˵���书���书��",
}
Room {
	id = "putian/xiaoyuan2",
	name = "СԺ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/celang2",
		["west"] = "putian/qianyuan",  
	},
	room_relative="ǰԺ-----СԺ������СԺ",
}
Room {
	id = "putian/xiaoyuan3",
	name = "СԺ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/celang3",
		["east"] = "putian/qianyuan",   
	},
	room_relative="СԺ-----ǰԺ������СԺ",
}
Room {
	id = "putian/xiaoyuan4",
	name = "СԺ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/lz-dian",
		["east"] = "putian/celang4",
		["north"] = "putian/celang2",
		["west"] = "putian/guangchang",  
	},
	room_relative="���ȣ��㳡-----СԺ-----���ȣ������СԺ",
}
Room {
	id = "putian/xiaoyuan5",
	name = "СԺ",
	outdoor = "��������",
	ways = {
		["south"] = "putian/jnlw-dian",
		["east"] = "putian/guangchang",  
		["north"] = "putian/celang3",
		["west"] = "putian/celang5",
	},
	room_relative="���ȣ�����-----СԺ-----�㳡������������СԺ",
}
Room {
	id = "putian/xj3",
	name = "С��",
	outdoor = "��������",
	ways = {
		["south"] = "putian/mf-dian",  
		["north"] = "putian/celang5",
	},
	room_relative="���ȣ�С�������С��",
}
Room {
	id = "putian/xj4",
	name = "С��",
	outdoor = "��������",
	ways = {
		["south"] = "putian/dc-dian",
		["north"] = "putian/celang4",
	},
	room_relative="���ȣ�С������˵�С��",
}
Room {
	id = "putian/xl2",
	name = "С·",
	outdoor = "��������",
	ways = {
		["east"] = "putian/shanmen",
		["west"] = "putian/xl4",
	},
	room_relative="С·-----С·-----ɽ��С·",
}
Room {
	id = "putian/xl3",
	name = "С·",
	outdoor = "��������",
	ways = {
		["east"] = "putian/xl5",
		["west"] = "putian/shanmen",
	},
	room_relative="ɽ��-----С·-----С·С·",
}
Room {
	id = "putian/xl4",
	name = "С·",
	outdoor = "��������",
	ways = {
		["east"] = "putian/xl2",
		["west"] = "putian/xl6",
	},
	room_relative="С·-----С·-----С·С·",
}
Room {
	id = "putian/xl5",
	name = "С·",
	outdoor = "��������",
	ways = {
		["eastdown"] = "putian/xl7",
		["west"] = "putian/xl3",
	},
	room_relative="С·-----С·��С·С·",
}
Room {
	id = "putian/xl6",
	name = "С·",
	outdoor = "��������",
	ways = {
		["southwest"] = "putian/xl8",
		["east"] = "putian/xl4",
	},
	room_relative="С·-----С·�LС·С·",
}
Room {
	id = "putian/xl7",
	name = "С·",
	outdoor = "��������",
	ways = {
		["westup"] = "putian/xl5",
		["north"] = "putian/youcaidi",
	},
	objs = {
          ["��˿ȸ"] = "jinsi que",
      },
	  room_relative="�Ͳ˵أ�С·��С·С·",
}
Room {
	id = "putian/xl8",
	name = "С·",
	outdoor = "��������",
	ways = {
		["south"] = "putian/mtd2",
		["northeast"] = "putian/xl6",
	},
	room_relative="С·�JС·�������С·",
}
Room {
	id = "putian/xm-dian",
	name = "���ֵ�",
	outdoor = "��������",
	ways = {
		["south"] = "putian/jcyuan",   
		["north"] = "putian/houdian",  
	},
	room_relative="���Ժ��������ֵ�",
}
Room {
	id = "putian/youcaidi",
	name = "�Ͳ˵�",
	outdoor = "��������",
	ways = {
		["south"] = "putian/xl7",
	},
	room_relative="�Ͳ˵أ�С·�Ͳ˵�",
}
Room {
	id = "putian/zhongdian",
	name = "�е�",
	outdoor = "��������",
	ways = {
		["south"] = "putian/houdian",
		["north"] = "putian/qiandian",
	},
	room_relative="����ǰ���е�",
}
Room {
	id = "shaolin/andao1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/rukou",
		["north"] = "shaolin/jianyu1",
	},
}
Room {
	id = "shaolin/andao2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["up"] = "shaolin/gulou1",
	},
}
--Room {
--	id = "shaolin/bamboon",
--	name = "����",
--	ways = {
--		["sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = "shaolin/damodong",
--	},
--	lengths = {
--		["sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = 3,
--	},
--}
Room {
	id = "shaolin/bamboo1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["southwest"] = "shaolin/bamboo2",
		["south"] = "shaolin/shanlu6",
		["southeast"] = "shaolin/bamboo1",
		["northwest"] = "shaolin/bamboo1",
	},
	--lengths = {
	--    ["southeast"] = "if 1=1 then return false else return false end",
	--	["northwest"] = "if 1=1 then return false else return false end",
	--},
	room_relative="���֣�ɽ·----���֣���������",
}
Room {
	id = "shaolin/bamboo2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/bamboo3",
		["southwest"] = "shaolin/bamboo2",
	},
	--lengths = {
	--	["southwest"] = "if 1=1 then return false else return false end",
	--},
}
Room {
	id = "shaolin/bamboo3",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/bamboo4",
	},
}
Room {
	id = "shaolin/bamboo4",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/bamboo5",
	},
}
Room {
	id = "shaolin/bamboo5",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/bamboo6",
	},
}
Room {
	id = "shaolin/bamboo6",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/bamboo7",
	},
}
Room {
	id = "shaolin/bamboo7",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/bamboo8",
	},
}
Room {
	id = "shaolin/bamboo8",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/bamboo9",
	},
}
Room {
	id = "shaolin/bamboo9",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/bamboo10",
	},
}
Room {
	id = "shaolin/bamboo10",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/bamboo11",
	},
}
Room {
	id = "shaolin/bamboo11",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/bamboo12",
	},
}
Room {
	id = "shaolin/bamboo12",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/bamboo13",
	},
}
Room {
	id = "shaolin/bamboo13",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["northwest"] = "shaolin/bamboo14",
	},
	room_relative="��������",
}
Room {
	id = "shaolin/bamboo14",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/damodong",
	},
	room_relative="��Ħ������",
}
Room {
	id = "shaolin/banruo1",
	name = "������һ��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/banruo2",
	},
	objs = {
          ["����"] = "chengxin luohan",
           },
	room_relative="�����ö�����������һ��������һ��",
}
Room {
	id = "shaolin/banruo2",
	name = "�����ö���",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo1",
		["north"] = "shaolin/banruo3",
	},
	objs = {
          ["����"] = "chengyi luohan",
           },
	room_relative="�����������������ö�����������һ�������ö���",
}
Room {
	id = "shaolin/banruo3",
	name = "����������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo2",
		["north"] = "shaolin/banruo4",
	},
	objs = {
          ["��˼"] = "chengsi luohan",
           },
	room_relative="�������Ĳ��������������������ö�������������",
}
Room {
	id = "shaolin/banruo4",
	name = "�������Ĳ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo3",
		["north"] = "shaolin/banruo5",
	},
	objs = {
          ["��ʶ"] = "chengshi luohan",
           },
	room_relative="�������岿���������Ĳ��������������������Ĳ�",
}
Room {
	id = "shaolin/banruo5",
	name = "�������岿",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo4",
		["north"] = "shaolin/banruo6",
		["west"] = "shaolin/lwc11",
	},
	objs = {
          ["��־"] = "chengzhi luohan",
           },
	room_relative="���������������䳡--�������岿���������Ĳ��������岿",
}
Room {
	id = "shaolin/banruo6",
	name = "����������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo5",
		["north"] = "shaolin/banruo7",
	},
	objs = {
          ["����"] = "chengxin luohan",
           },
	room_relative="�������߲����������������������岿����������",
}
Room {
	id = "shaolin/banruo7",
	name = "�������߲�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo6",
		["north"] = "shaolin/banruo8",
	},
	objs = {
          ["����"] = "chengling luohan",
           },
	room_relative="�����ð˲����������߲��������������������߲�",
}
Room {
	id = "shaolin/banruo8",
	name = "�����ð˲�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo7",
		["north"] = "shaolin/banruo9",
	},
	objs = {
          ["����"] = "chengyu luohan",
           },
	room_relative="�����þŲ��������ð˲����������߲������ð˲�",
}
Room {
	id = "shaolin/banruo9",
	name = "�����þŲ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/banruo8",
	},
	objs = {
          ["����"] = "chengshang luohan",
           },
	room_relative="�����þŲ��������ð˲������þŲ�",
}
Room {
	id = "shaolin/brtang",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/lwc16",
		["west"] = "shaolin/stoneroad3",
	},
	objs = {
          ["���Ѵ�ʦ"] = "xuannan dashi",
           },
	room_relative="ʯ��·----������----���䳡������",
}
Room {
	id = "shaolin/bydian",
	name = "���µ�",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/kchang",
	},
	room_relative="�ճ�----���µ���µ�",
}
Room {
	id = "shaolin/cdian-1",
	name = "�����",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/gchang-3",
	},
	room_relative="�㳡����----�������",
}
Room {
	id = "shaolin/cdian-2",
	name = "�����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/gchang-2",
	},
	room_relative="�����----�㳡���������",
}
Room {
	id = "shaolin/celang-1",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/gchang-2",
		["north"] = "shaolin/celang-2",
		["west"] = "shaolin/gulou",
	},
	room_relative="�����ȣ���¥СԺ----�����ȣ��㳡����������",
}
Room {
	id = "shaolin/celang-2",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/celang-1",
		["northeast"] = "shaolin/sblu-1",
		["west"] = "shaolin/zdyuan",
	},
	room_relative="ʯ��·�J֤��Ժ----�����ȣ�������������",
}
Room {
	id = "shaolin/celang-3",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/gchang-3",
		["east"] = "shaolin/zhonglou",
		["north"] = "shaolin/celang-4",
	},
	room_relative="�����ȣ�������----��¥СԺ���㳡���ණ����",
}
Room {
	id = "shaolin/celang-4",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/celang-3",
		["northwest"] = "shaolin/sblu-1",
		["east"] = "shaolin/zhaitang",
	},
	room_relative="ʯ��·�I������----ի�ã������ȶ�����",
}
Room {
	id = "shaolin/celang1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/stoneroad4",
		["northwest"] = "shaolin/huaishu2",
		["west"] = "shaolin/sengshe4",
	},
	room_relative="�����֨Iɮ��-----���ȣ�ʯ��·����",
}
Room {
	id = "shaolin/celang2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/stoneroad3",
		["east"] = "shaolin/sengshe1",
		["northeast"] = "shaolin/songshu3",
	},
	room_relative="�����֨J����-----ɮ���ʯ��·����,"
}
Room {
	id = "shaolin/chanfang-1",
	name = "����",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/chanfang-3",
		["east"] = "shaolin/zdyuan",
		["north"] = "shaolin/chanfang-2",
	},
	objs = {
          ["���δ�ʦ"] = "xuancheng dashi",
           },
		room_relative="����������-----֤��Ժ����������",
}
Room {
	id = "shaolin/chanfang-2",
	name = "����",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/chanfang-1",
	},
	room_relative="��������������",
}
Room {
	id = "shaolin/chanfang-3",
	name = "����",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["north"] = "shaolin/chanfang-1",
	},
	objs = {
          ["������"] = "shu",
           },
	room_relative="��������������",
}
Room {
	id = "shaolin/chufang1",
	name = "�����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/chufang2",
		["west"] = "shaolin/fanting1",
	},
	room_relative="����----�����������������",
}
Room {
	id = "shaolin/chufang2",
	name = "�����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xiaolu-1",
		["north"] = "shaolin/chufang1",
		["west"] = "shaolin/fanting3",
	},
	room_relative="�����������----�������С·�����",
}
Room {
	id = "shaolin/cjlou",
	name = "�ؾ���һ¥",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/xiaoxi1",
		["up"] = "shaolin/cjlou1",
	},
	blocks = {
		["up"] = {
			{id = "daoyi chanshi", exp = 2000000, cond = function()
				if score.master and (score.master=="������ɮ" or score.master=="Ľ�ݲ�") then
					return true
				else
					return false
				end
			end,
			},
            
		},
	},
  
}
Room {
	id = "shaolin/cjlou1",
	name = "�ؾ����¥",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/cjlou",
		["push chuang;jump chuang"] = "shaolin/xiaojin1",
	},
	nolooks = {
		["push chuang;jump chuang"] = true,
	},
	objs = {
	 ["��������"] = "huizhen zunzhe",
		
           },
	
}
Room {
	id = "shaolin/cyzi-1",
	name = "��԰��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/cyzi-2",
		["north"] = "shaolin/xiaolu-3",
		["east"] = "shaolin/cyzi-4",
	},
	room_relative="С·����԰��----��԰�ӣ���԰�Ӳ�԰��",
	objs = {
          ["Ե��"] = "yuan gen",
           },
}
Room {
	id = "shaolin/cyzi-2",
	name = "��԰��",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/cyzi-3",
		["north"] = "shaolin/cyzi-1",
	},
	room_relative="��԰�ӣ���԰��----��԰�Ӳ�԰��",
}
Room {
	id = "shaolin/cyzi-3",
	name = "��԰��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/cyzi-4",
		["west"] = "shaolin/cyzi-2",
	},
	room_relative="��԰�ӣ���԰��----��԰�Ӳ�԰��",
}
Room {
	id = "shaolin/cyzi-4",
	name = "��԰��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/cyzi-3",
		["west"] = "shaolin/cyzi-1",
	},
	room_relative="��԰��----��԰�ӣ���԰�Ӳ�԰��"
}
Room {
	id = "shaolin/czan",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shanlu4",
		["north"] = "shaolin/shanlu5",
	},
	room_relative="ɽ·�������֣�ɽ·������"
}
Room {
	id = "shaolin/dabeidia",
	name = "�󱯵�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/stoneroad1",
		["north"] = "shaolin/hguangz2",
		["west"] = "shaolin/xumidian",
	},
	objs = {
          ["������ʦ"] = "daozheng chanshi",
          ["ľ���"] = "muyu chui",
           },
		room_relative="���㳡�����ֵ�----�󱯵��ʯ��·�󱯵�",
}
Room {
	id = "shaolin/damodong",
	name = "��Ħ��",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/bamboo1",
	},
	room_relative="���ִ�Ħ��",
}
Room {
	id = "shaolin/daxiong",
	name = "���۱���",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/pingtai",
		["north"] = "shaolin/stoneroad1",
	},
	room_relative="ʯ��·�����۱����ƽ̨���۱���",
}
Room {
	id = "shaolin/dmyuan",
	name = "��ĦԺ",
	no_fight = true,
	ways = {
		["south"] = "shaolin/huilang4",
		["north"] = "shaolin/dmyuan2",
	},
	objs = {
          ["������ʦ"] = "xuanbei dashi",
           },
	room_relative="��ĦԺ������ĦԺ�����ȴ�ĦԺ",
}
Room {
	id = "shaolin/dmyuan2",
	name = "��ĦԺ���",
	no_fight = true,
	ways = {
		["south"] = "shaolin/dmyuan",
	},
	room_relative="��ĦԺ������ĦԺ��ĦԺ���",
}
Room {
	id = "shaolin/duanya",
	name = "����ƺ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xctang",
	--	["#goYd"] = "shaolin/yading",
	},
	--nolooks = {
	--	["#goYd"] = true,
	--},
	--lengths = {
	--	["#goYd"] = "if getCha()['wuxiang-zhi'].level > 0 and getWeight() < 20 then return 10 else return false end",
	--},
}
Room {
	id = "shaolin/dxshijie",
	name = "̨��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/pingtai",
		["south"] = "shaolin/stoneroad2",
	},
	room_relative="ƽ̨��̨�ף�ʯ��·̨��",
}
Room {
	id = "shaolin/dzdian",
	name = "�زص�",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/kchang",
	},
	room_relative="�زص�----�ճ��زص�",
}
Room {
	id = "shaolin/entrance",
	name = "ľ�������",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/murenxiang",
	},
	room_relative="ľ����--ľ�������",
}
Room {
	id = "shaolin/fangjuku",
	name = "���߿�",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/lshuyuan",
	},
	objs = {
          ["������ʦ"] = "daoxiang chanshi",
           },
	room_relative="����Ժ�����߿���߿�",
}
Room {
	id = "shaolin/fanting1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/fanting3",
		["north"] = "shaolin/fanting2",
		["east"] = "shaolin/chufang1",
		["west"] = "shaolin/zhaitang",
	},
	room_relative="������ի��-----����-----���������������",
}
Room {
	id = "shaolin/fanting2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/fanting1",
	},
	room_relative="��������������",
}
Room {
	id = "shaolin/fanting3",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/fanting1",
		["east"] = "shaolin/chufang2",
	},
	room_relative="����������-----���������",
}
Room {
	id = "shaolin/fatang",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/jietan4",
		["southwest"] = "shaolin/jietan3",
		["east"] = "shaolin/xcping",
		["north"] = "shaolin/kchang",
		["west"] = "shaolin/huilang1",
	},
	room_relative="�ճ�������-----����-----����ƺ�L�K��̳��̳����",
}
Room {
	id = "shaolin/fota1",
	name = "����һ��",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fotaout",
		["up"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/fota2",
	name = "ʥɮ��",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/fota1",
		["up"] = "shaolin/fota3",
	},
}
Room {
	id = "shaolin/fota3",
	name = "��������",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/fotaout",
	name = "�ŷ�������",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/fota1",
		["s;ne;se;n;e;sw;e;ne;se;s;se;open door;e"] = "shaolin/slyuan",
	},
}
Room {
	id = "shaolin/fumoquan",
	name = "��շ�ħȦ",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/qyping",
	},
	objs = {
          ["����"] = "du nan",
          ["�ɽ�"] = "du jie",
          ["�ɶ�"] = "du e",
           },
}
Room {
	id = "shaolin/fxjing",
	name = "���ľ�",
	outdoor = "��ɽ����",
	ways = {
		["westdown"] = "shaolin/shijie9",
	},
	room_relative="ʯ�ס����ľ����ľ�",
}
Room {
	id = "shaolin/fzjs",
	name = "���ɾ���",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/xiaolu7",
		["up"] = "shaolin/fzjs1",
	},
	room_relative="���ҡ����ɾ���---����С·���ɾ���",
}
Room {
	id = "shaolin/fzjs1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/fzjs2",
		["down"] = "shaolin/fzjs",
	},
	objs = {
          ["���ֱ���"] = "qingle biqiu",
           },
	room_relative="�����ң����ҡ����ɾ������",
}
Room {
	id = "shaolin/fzjs2",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/fzjs1",
	},
	objs = {
          ["���ȴ�ʦ"] = "xuanci dashi",
           },
	room_relative="�����ң����ҷ�����",
}
Room {
	id = "shaolin/gchang-1",
	name = "�㳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/smdian",
		["north"] = "shaolin/qdian",
		["east"] = "shaolin/gchang-3",
		["west"] = "shaolin/gchang-2",
	},
	room_relative="ǰ����㳡����-----�㳡-----�㳡�����ɽ�ŵ�㳡",
}
Room {
	id = "shaolin/gchang-2",
	name = "�㳡����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/gchang-1",
		["north"] = "shaolin/celang-1",
		["west"] = "shaolin/cdian-2",
	},
	room_relative="�����ȣ������---�㳡����---�㳡�㳡����",
}
Room {
	id = "shaolin/gchang-3",
	name = "�㳡����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/celang-3",
		["east"] = "shaolin/cdian-1",
		["west"] = "shaolin/gchang-1",
	},
	room_relative="�����ȣ��㳡---�㳡����---�����㳡����",
}
Room {
	id = "shaolin/gchange",
	name = "��ǰ�㳡",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/guangchang",
	},
	objs = {
          ["���ޱ���"] = "qingwu biqiu",
           },
	room_relative="�㳡---��ǰ�㳡��ǰ�㳡",
}
Room {
	id = "shaolin/gchangw",
	name = "��ǰ�㳡",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/guangchang",
	},
	objs = {
          ["��Ϊ����"] = "qingwei biqiu",
           },
	room_relative="��ǰ�㳡---�㳡��ǰ�㳡",
}
Room {
	id = "shaolin/guangchang",
	name = "�㳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shifang",
		["east"] = "shaolin/gchange",
		["north"] = "shaolin/smdian",
		["west"] = "shaolin/gchangw",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "knock gate",
	},
	objs = {
          ["�巨����"] = "qingfa biqiu",
          ["��������������"] = "board",
           },
	
}
Room {
	id = "shaolin/gulou",
	name = "��¥СԺ",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/gulou1",
		["east"] = "shaolin/celang-1",
	},
	room_relative="��¥һ������ȹ�¥СԺ",
}
Room {
	id = "shaolin/gulou1",
	name = "��¥һ��",
	outdoor = "��ɽ����",
	ways = {
		["up"] = "shaolin/gulou2",
		["out"] = "shaolin/gulou",
	},
}
Room {
	id = "shaolin/gulou2",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou1",
		["up"] = "shaolin/gulou3",
	},
}
Room {
	id = "shaolin/gulou3",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou2",
		["up"] = "shaolin/gulou4",
	},
}
Room {
	id = "shaolin/gulou4",
	name = "��¥�Ĳ�",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou3",
		["up"] = "shaolin/gulou5",
	},
}
Room {
	id = "shaolin/gulou5",
	name = "��¥���",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou4",
		["up"] = "shaolin/gulou6",
	},
}
Room {
	id = "shaolin/gulou6",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou5",
		["up"] = "shaolin/gulou7",
	},
}
Room {
	id = "shaolin/gulou7",
	name = "��¥�߲�",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/gulou6",
	},
	objs = {
          ["���ű���"] = "qingwen biqiu",
           },
}
Room {
	id = "shaolin/gygu",
	name = "��Ԫ��",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/xclang",
		["northwest"] = "shaolin/gygu",
	},
	room_relative="ʯ�ȣ���Ԫ�ȹ�Ԫ��",
}
Room {
	id = "shaolin/hguangz1",
	name = "���㳡",
	outdoor = "��ɽ����",
	ways = {
		["southwest"] = "shaolin/huaishu5",
		["north"] = "shaolin/hguangz4",
		["east"] = "shaolin/hguangz2",
	},
	room_relative="���㳡�����㳡---���㳡�L�����ֺ��㳡",
}
Room {
	id = "shaolin/hguangz2",
	name = "���㳡",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/dabeidia",
		["east"] = "shaolin/hguangz3",
		["west"] = "shaolin/hguangz1",
	},
	room_relative="���㳡---���㳡---���㳡���󱯵���㳡",
	objs = {
          ["������ʦ"] = "daojue chanshi",
           },
}
Room {
	id = "shaolin/hguangz3",
	name = "���㳡",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/songshu1",
		["north"] = "shaolin/hguangz5",
		["west"] = "shaolin/hguangz2",
	},
	room_relative="���㳡�����㳡---���㳡�K�����ֺ��㳡",
}
Room {
	id = "shaolin/hguangz4",
	name = "���㳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/hguangz1",
		["east"] = "shaolin/houdian",
	},
	room_relative="���㳡---�������㳡���㳡",
}
Room {
	id = "shaolin/hguangz5",
	name = "���㳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/hguangz3",
		["west"] = "shaolin/houdian",
	},
	room_relative="���---���㳡�����㳡���㳡",
}
Room {
	id = "shaolin/houdian",
	name = "���",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/taijie",
		["east"] = "shaolin/hguangz5",
		["west"] = "shaolin/hguangz4",
	},
	objs = {
          ["�ۿ�����"] = "huikong zunzhe",
           },
	room_relative="̨�ף����㳡-----���-----���㳡���",
}
Room {
	id = "shaolin/houshan",
	name = "СԺ",
	outdoor = "��ɽ����",
	ways = {
		["northwest"] = "shaolin/zhushe",
		["north"] = "shaolin/xiaowu",
		["east"] = "shaolin/xiaojing2",
	},
	room_relative="����С���ݨI��СԺ-----�﹡��СԺ",
}
Room {
	id = "shaolin/houshand",
	name = "ɽ��",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/yading",
	},
}
Room {
	id = "shaolin/houyuan",
	name = "С��",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/liwu",
		["north"] = "shaolin/xiaojin1",
	},
	objs = {
          ["Ľ�ݲ�"] = "murong bo",
           },
	
}
Room {
	id = "shaolin/huaishu1",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/huaishu2",
		["west"] = "shaolin/putiyuan",
	},
	room_relative="����Ժ----������----�����ֻ�����",
}
Room {
	id = "shaolin/huaishu2",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/celang1",
		["north"] = "shaolin/huaishu4",
		["west"] = "shaolin/huaishu1",
	},
	room_relative="�����֣�������----�����֨K���Ȼ�����",
}
Room {
	id = "shaolin/huaishu4",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huaishu2",
		["east"] = "shaolin/stoneroad1",
		["north"] = "shaolin/huaishu5",
		["west"] = "shaolin/slyuan",
	},
	room_relative="�����֣�����Ժ----������----ʯ��·�������ֻ�����",
}
Room {
	id = "shaolin/huaishu5",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huaishu4",
		["northeast"] = "shaolin/hguangz1",
		["west"] = "shaolin/lshuyuan",
	},
	room_relative="���㳡�J����Ժ----�����֣������ֻ�����",
}
Room {
	id = "shaolin/huilang1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huilang1",
		["north"] = "shaolin/huilang2",
		["east"] = "shaolin/fatang",
		["west"] = "shaolin/huilang1",
	},
	room_relative="���ȣ�����----���ã����Ȼ���",
}
Room {
	id = "shaolin/huilang2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huilang1",
		["east"] = "shaolin/huilang2",
		["north"] = "shaolin/huilang2",
		["west"] = "shaolin/huilang3",
	},
	room_relative="���ȣ�����----���ȣ����Ȼ���",
}
Room {
	id = "shaolin/huilang3",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huilang3",
		["north"] = "shaolin/huilang3",
		["east"] = "shaolin/huilang2",
		["west"] = "shaolin/huilang4",
	},
	room_relative="���ȣ�����----���ȣ����Ȼ���",
}
Room {
	id = "shaolin/huilang4",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/huilang4",
		["east"] = "shaolin/huilang3",
		["#dmy1"] = "shaolin/dmyuan",
		["west"] = "shaolin/huilang4",
	
		},
	room_relative="���ȣ�����----��ĦԺ�����Ȼ���",
}
Room {
	id = "shaolin/huizhizuo",
	name = "����ʥ��",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fota2",
	},
	room_relative="ʥɮ��--����ʥ��",
}
Room {
	id = "shaolin/jianyu",
	name = "����",
}
Room {
	id = "shaolin/jianyu1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/jianyu",
	},
}
Room {
	id = "shaolin/jieluyua",
	name = "����Ժ",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["west"] = "shaolin/songshu4",
	},
}
Room {
	id = "shaolin/jietan1",
	name = "��̳",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/sblu-3",
		["north"] = "shaolin/jietan3",
		["east"] = "shaolin/jietan2",
	},
	room_relative="��̳����̳-----��̳�Kʯ��·��̳",
}
Room {
	id = "shaolin/jietan2",
	name = "��̳",
	outdoor = "��ɽ����",
	ways = {
		["southwest"] = "shaolin/sblu-3",
		["north"] = "shaolin/jietan4",
		["west"] = "shaolin/jietan1",
	},
	room_relative="��̳����̳-----��̳�Lʯ��·��̳",
}
Room {
	id = "shaolin/jietan3",
	name = "��̳",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/jietan1",
		["east"] = "shaolin/jietan4",
		["northeast"] = "shaolin/fatang",
	},
	room_relative="���èJ��̳-----��̳����̳��̳",
}
Room {
	id = "shaolin/jietan4",
	name = "��̳",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/jietan2",
		["northwest"] = "shaolin/fatang",
		["west"] = "shaolin/jietan3",
	},
	room_relative="���èI��̳-----��̳����̳��̳",
}
Room {
	id = "shaolin/jiulou1",
	name = "ӭ��¥",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/nanyang",
		["up"] = "shaolin/jiulou2",
	},
	room_relative="�����ǣ�ӭ��¥��¥ӭ��¥",
}
Room {
	id = "shaolin/jiulou2",
	name = "ӭ��¥��¥",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/jiulou1",
	},
	room_relative="ӭ��¥--ӭ��¥��¥",
}
Room {
	id = "shaolin/jnlwang",
	name = "����������",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/pingtai",
	},
	objs = {
          ["ľ���"] = "muyu chui",
          ["��Ʒ��ʦ"] = "daopin chanshi",
           },
	room_relative="ƽ̨--�������������������",
}
Room {
	id = "shaolin/jxzhuang",
	name = "����ׯ",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/yidao2",
	},	
}
Room {
	id = "shaolin/kchang",
	name = "�ճ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/fatang",
		["north"] = "shaolin/qfdian",
		["east"] = "shaolin/bydian",
		["west"] = "shaolin/dzdian",
	},
	room_relative="ǧ�����زص�-----�ճ�-----���µ�����ÿճ�",
}
Room {
	id = "shaolin/kedian1",
	name = "������ջ",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/nanyang",
		["up"] = "shaolin/kedian2",
	},
	room_relative="�����ǣ��͵��¥������ջ",
}
Room {
	id = "shaolin/kedian2",
	name = "�͵��¥",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/kedian1",
	},
}
Room {
	id = "shaolin/kuhuiping",
	name = "���ƺ",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/lhtang",
	name = "�޺���",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/stoneroad4",
		["west"] = "shaolin/lwc",
	},
	objs = {
          ["�����ʦ"] = "xuanku dashi",
    room_relative="���䳡----�޺���----ʯ��·�޺���",
           },
}
Room {
	id = "shaolin/liuzu",
	name = "�����",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/pingtai",
	},
	objs = {
          ["ľ���"] = "muyu chui",
          ["������ʦ"] = "daocheng chanshi",
           },
	room_relative="�����----ƽ̨�����",
}
Room {
	id = "shaolin/liwu",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/houyuan",
	},
	objs = {
          ["������ɮ"] = "wuming laoseng",
           },
	room_relative="С��--����",
}
Room {
	id = "shaolin/lshuyuan",
	name = "����Ժ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/fangjuku",
		["north"] = "shaolin/wuqiku",
		["east"] = "shaolin/huaishu5",
	},
	room_relative="�����������Ժ----�����֣����߿�����Ժ",
}
Room {
	id = "shaolin/luohan1",
	name = "�޺���һ��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/luohan2",
	},
	objs = {
          ["�ι�"] = "chengguan luohan",
           },
	room_relative="�޺��ö������޺���һ���޺���һ��",
}
Room {
	id = "shaolin/luohan2",
	name = "�޺��ö���",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan1",
		["north"] = "shaolin/luohan3",
	},
	objs = {
          ["��֪"] = "chengzhi luohan",
           },
	room_relative="�޺����������޺��ö������޺���һ���޺��ö���",
}
Room {
	id = "shaolin/luohan3",
	name = "�޺�������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan2",
		["north"] = "shaolin/luohan4",
	},
	objs = {
          ["����"] = "chengming luohan",
   room_relative="�޺����Ĳ����޺����������޺��ö����޺�������",
           },
}
Room {
	id = "shaolin/luohan4",
	name = "�޺����Ĳ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan3",
		["north"] = "shaolin/luohan5",
	},
	objs = {
          ["�ξ�"] = "chengjing luohan",
           },
	room_relative="�޺����岿���޺����Ĳ����޺��������޺����Ĳ�",
}
Room {
	id = "shaolin/luohan5",
	name = "�޺����岿",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan4",
		["east"] = "shaolin/lwc6",
		["north"] = "shaolin/luohan6",
		["west"] = "shaolin/yanwutang",
	},
	objs = {
          ["�μ�"] = "chengjian luohan",
	room_relative="�޺���������������--�޺����岿--���䳡���޺����Ĳ��޺����岿",
           },
}
Room {
	id = "shaolin/luohan6",
	name = "�޺�������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan5",
		["north"] = "shaolin/luohan7",
	},
	objs = {
          ["����"] = "chengxing luohan",
           },
	room_relative="�޺����߲����޺����������޺����岿�޺�������",
}
Room {
	id = "shaolin/luohan7",
	name = "�޺����߲�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan6",
		["north"] = "shaolin/luohan8",
	},
	objs = {
          ["�μ�"] = "chengji luohan",
	room_relative="�޺��ð˲����޺����߲����޺��������޺����߲�",
           },
}
Room {
	id = "shaolin/luohan8",
	name = "�޺��ð˲�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan7",
		["north"] = "shaolin/luohan9",
	},
	objs = {
          ["����"] = "chengmie luohan",
           },
	room_relative="�޺��þŲ����޺��ð˲����޺����߲��޺��ð˲�",
}
Room {
	id = "shaolin/luohan9",
	name = "�޺��þŲ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/luohan8",
	},
	objs = {
          ["�κ�"] = "chenghe luohan",
           },
	room_relative="�޺��þŲ����޺��ð˲��޺��þŲ�",
}
Room {
	id = "shaolin/lwc",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc9",
		["north"] = "shaolin/lwc2",
		["east"] = "shaolin/lhtang",
		["west"] = "shaolin/lwc5",
	},
	room_relative="���䳡�������䳡----���䳡----�޺��ã����䳡���䳡",
}
Room {
	id = "shaolin/lwc11",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc19",
		["north"] = "shaolin/lwc12",
		["east"] = "shaolin/banruo5",
		["west"] = "shaolin/lwc15",
	},
	room_relative="���䳡�������䳡----���䳡----�������岿�����䳡���䳡",
}
Room {
	id = "shaolin/lwc12",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc13",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
	room_relative="���䳡----���䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc13",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc15",
		["east"] = "shaolin/lwc12",
		["west"] = "shaolin/lwc14",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
	room_relative="���䳡----���䳡----���䳡�������䳡���䳡",
}
Room {
	id = "shaolin/lwc14",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc16",
		["east"] = "shaolin/lwc13",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
   room_relative="���䳡----���䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc15",
	name = "�����䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc18",
		["north"] = "shaolin/lwc13",
		["east"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc16",
	},
	objs = {
          ["����"] = "jin ren",
           },
	room_relative="���䳡�����䳡---�����䳡---���䳡�����䳡�����䳡",
}
Room {
	id = "shaolin/lwc16",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc17",
		["east"] = "shaolin/lwc15",
		["north"] = "shaolin/lwc14",
		["west"] = "shaolin/brtang",
	},
	room_relative="���䳡��������----���䳡----�����䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc17",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/lwc18",
		["north"] = "shaolin/lwc16",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
	room_relative="���䳡�����䳡----���䳡���䳡",
}
Room {
	id = "shaolin/lwc18",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/lwc19",
		["north"] = "shaolin/lwc15",
		["west"] = "shaolin/lwc17",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
	room_relative="�����䳡�����䳡----���䳡----���䳡���䳡",
}
Room {
	id = "shaolin/lwc19",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/lwc11",
		["west"] = "shaolin/lwc18",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
	room_relative="���䳡�����䳡----���䳡���䳡",
}
Room {
	id = "shaolin/lwc2",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc",
		["west"] = "shaolin/lwc3",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
	room_relative="���䳡----���䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc3",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc5",
		["east"] = "shaolin/lwc2",
		["west"] = "shaolin/lwc4",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
           },
	room_relative="���䳡----���䳡----���䳡�������䳡���䳡",
}
Room {
	id = "shaolin/lwc4",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc6",
		["east"] = "shaolin/lwc3",
	},
	objs = {
          ["ͭ��"] = "tong ren",
           },
	room_relative="���䳡----���䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc5",
	name = "�����䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc8",
		["north"] = "shaolin/lwc3",
		["east"] = "shaolin/lwc",
		["west"] = "shaolin/lwc6",
	},
	objs = {
          ["����"] = "jin ren",
	room_relative="���䳡�����䳡---�����䳡---���䳡�����䳡�����䳡",
           },
}
Room {
	id = "shaolin/lwc6",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lwc7",
		["east"] = "shaolin/lwc5",
		["north"] = "shaolin/lwc4",
		["west"] = "shaolin/luohan5",
	},
	room_relative="���䳡���޺����岿----���䳡----�����䳡�����䳡���䳡",
}
Room {
	id = "shaolin/lwc7",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/lwc8",
		["north"] = "shaolin/lwc6",
	},
	objs = {
          ["ľ��"] = "mu ren",
           },
	room_relative="���䳡�����䳡----���䳡���䳡",
}
Room {
	id = "shaolin/lwc8",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/lwc9",
		["north"] = "shaolin/lwc5",
		["west"] = "shaolin/lwc7",
	},
	objs = {
          ["÷��׮"] = "meihua zhuang",
	room_relative="�����䳡�����䳡----���䳡----���䳡���䳡",
           },
}
Room {
	id = "shaolin/lwc9",
	name = "���䳡",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/lwc",
		["west"] = "shaolin/lwc8",
	},
	objs = {
          ["ͭ��"] = "tong ren",
	room_relative="���䳡�����䳡----���䳡���䳡",
           },
}
Room {
	id = "shaolin/lxting",
	name = "��ѩͤ",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/sblu-2",
		["southdown"] = "shaolin/taijie",
	},
	objs = {
          ["�۹�����"] = "huiguang zunzhe",
           },
	room_relative="ʯ��·����ѩͤ��̨����ѩͤ",
}
Room {
	id = "shaolin/murenxiang",
	name = "ľ����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/murenxiang",
	},
}
Room {
	id = "shaolin/nanyang",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/yidao2",
		["north"] = "shaolin/yidao3",
		["east"] = "shaolin/kedian1",
		["west"] = "shaolin/jiulou1",
	},
	
}
Room {
	id = "shaolin/pingtai",
	name = "ƽ̨",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/jnlwang",
		["north"] = "shaolin/daxiong",
		["southdown"] = "shaolin/dxshijie",
		["west"] = "shaolin/liuzu",
	},
	objs = {
          ["���ֵ������԰�"] = "board",
          ["��������"] = "huixiu zunzhe",
           },
	room_relative="���۱���������-----ƽ̨-----�����������̨��ƽ̨",
}
Room {
	id = "shaolin/putiyuan",
	name = "����Ժ",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/huaishu1",
	},
	objs = {
          ["���ɴ�ʦ"] = "xuandu dashi",
           },
	room_relative="����Ժ----����������Ժ",
}
Room {
	id = "shaolin/qdian",
	name = "ǰ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/gchang-1",
		["north"] = "shaolin/twdian",
	},
	objs = {
          ["���Ʊ���"] = "qingshan biqiu",
           },
	room_relative="�������ǰ����㳡ǰ��",
}
Room {
	id = "shaolin/qfdian",
	name = "ǧ���",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/kchang",
		["north"] = "shaolin/shanlu1",
	},
	objs = {
          ["��۱���"] = "qingguan biqiu",
           },
	room_relative="ɽ·��ǧ�����ճ�ǧ���",
}
Room {
	id = "shaolin/qyping",
	name = "����ƺ",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/fumoquan",
		["sd;w;e;n;e;s;n;e;w;s"] = "shaolin/shanlu8",
	},
	nolooks = {
		["southdown"] = true,
		["sd;w;e;n;e;s;n;e;w;s"] = true,
	},
}
Room {
	id = "shaolin/rukou",
	name = "���ж����",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/andao1",
	},
}
Room {
	id = "shaolin/ruzhou",
	name = "���ݳ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "nanyang/yidao3",
		["west"] = "shaolin/shijie1",
	},
	room_relative="ʯ��----���ݳǣ���������ݳ�",
}
Room {
	id = "shaolin/sblu-1",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/celang-4",
		["southwest"] = "shaolin/celang-2",
		["south"] = "shaolin/twdian",
		["north"] = "shaolin/xianglu",
	},
	room_relative="��¯��ʯ��·�L���K���������������ʯ��·",
	objs = {
          ["��������"] = "huiming zunzhe",
           },
}
Room {
	id = "shaolin/sblu-2",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lxting",
		["east"] = "shaolin/xiaolu1",
		["north"] = "shaolin/sblu-3",
		["west"] = "shaolin/xiaolu5",
	},
	room_relative="ʯ��·������С·----ʯ��·----����С·����ѩͤʯ��·",
}
Room {
	id = "shaolin/sblu-3",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/sblu-2",
		["northwest"] = "shaolin/jietan1",
		["northeast"] = "shaolin/jietan2",
	},
	room_relative="��̳��̳�I�Jʯ��·��ʯ��·ʯ��·",
}
Room {
	id = "shaolin/sengshe1",
	name = "ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/sengshe3",
		["north"] = "shaolin/sengshe2",
		["west"] = "shaolin/celang2",
	},
	objs = {
          ["�ۺ�����"] = "huihe zunzhe",
           },
 room_relative="ɮ�������-----ɮ���ɮ��ɮ��",
}
Room {
	id = "shaolin/sengshe2",
	name = "ɮ��",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["#slss1"] = "shaolin/sengshe1",
	},
	
}
Room {
	id = "shaolin/sengshe3",
	name = "ɮ��",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["#slss2"] = "shaolin/sengshe1",
	},
	
}
Room {
	id = "shaolin/sengshe4",
	name = "ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/sengshe6",
		["north"] = "shaolin/sengshe5",
		["east"] = "shaolin/celang1",
	},
	objs = {
          ["��������"] = "huixu zunzhe",
           },
	 room_relative="ɮ���ɮ��-----���ȣ�ɮ��ɮ��",
}
Room {
	id = "shaolin/sengshe5",
	name = "ɮ��",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["#slss3"] = "shaolin/sengshe4",
	},
	
}
Room {
	id = "shaolin/sengshe6",
	name = "ɮ��",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["#slss4"] = "shaolin/sengshe4",
	},
	
}
Room {
	id = "shaolin/shanlu1",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/qfdian",
		["north"] = "shaolin/shanlu2",
	},
	room_relative="ɽ·��ɽ·��ǧ���ɽ·",
}
Room {
	id = "shaolin/shanlu2",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shanlu3",
		["south"] = "shaolin/shanlu1",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "shaolin/shanlu3",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/shanlu4",
		["southdown"] = "shaolin/shanlu2",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "shaolin/shanlu4",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shanlu3",
		["north"] = "shaolin/czan",
	},
	room_relative="�����֣�ɽ·��ɽ·ɽ·",
}
Room {
	id = "shaolin/shanlu5",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shanlu6",
		["south"] = "shaolin/czan",
	},
	room_relative="ɽ·��ɽ·��������ɽ·",
}
Room {
	id = "shaolin/shanlu6",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shanlu7",
		["northwest"] = "shaolin/bamboo1",
		["southdown"] = "shaolin/shanlu5",
	--	["nw;sw;se;n;s;w;e;w;e;e;s;w;n;nw;n"] = "shaolin/damodong",
	},
	room_relative="����ɽ·�I��ɽ·��ɽ·ɽ·",
}
Room {
	id = "shaolin/shanlu7",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["northeast"] = "shaolin/shanlu8",
		["southdown"] = "shaolin/shanlu6",
	},
	room_relative="ɽ·�Jɽ·��ɽ·ɽ·",
}
Room {
	id = "shaolin/shanlu8",
	name = "ɽ·",
	outdoor = "��ɽ����",
	ways = {
		["southwest"] = "shaolin/shanlu7",
		["e;w;e;s;e;n;n;e;w;s"] = "shaolin/qyping",
	},
	nolooks = {
		["east"] = true,
		["e;w;e;s;e;n;n;e;w;s"] = true,
	},
}
Room {
	id = "shaolin/shifang",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shijie11",
		["north"] = "shaolin/guangchang",
	},
	room_relative="�㳡��ʯ����ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie1",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shijie2",
		["east"] = "shaolin/ruzhou",
		["west"] = "group/entry/slxiaoj1",
	},
	room_relative="ʯ�ס�ɽ��-----ʯ��-----���ݳ�ʯ��",
}
Room {
	id = "shaolin/shijie10",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shijie11",
		["eastdown"] = "shaolin/shijie9",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie11",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/shifang",
		["southdown"] = "shaolin/shijie10",
	},
	room_relative="ʯ����ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie2",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["westup"] = "shaolin/shijie3",
		["southdown"] = "shaolin/shijie1",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie3",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shijie4",
		["eastdown"] = "shaolin/shijie2",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie4",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shijie5",
		["southdown"] = "shaolin/shijie3",
	},
	objs = {
          ["������"] = "fang tianlao",
           },
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie5",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/shijie6",
		["southdown"] = "shaolin/shijie4",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie6",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["westup"] = "shaolin/shijie7",
		["southdown"] = "shaolin/shijie5",
		["up"] = "songshan/shanlu1",
	},
	objs = {
          ["�����"] = "pan tiangeng",
           },
	room_relative="ɽ·��ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie7",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["eastdown"] = "shaolin/shijie6",
		["westup"] = "shaolin/shijie8",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie8",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/ting",
		["eastdown"] = "shaolin/shijie7",
	},
	room_relative="ӭ��ͤ��ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "shaolin/shijie9",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["eastup"] = "shaolin/fxjing",
		["westup"] = "shaolin/shijie10",
		["southdown"] = "shaolin/ting",
	},
	room_relative="ʯ�ס�ʯ�ס����ľ���ӭ��ͤʯ��",
}
Room {
	id = "shaolin/shiting1",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/shiting2",
	},
	room_relative="ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting2",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting1",
		["north"] = "shaolin/shiting3",
	},
	room_relative="ʯͤ��ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting3",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting2",
		["north"] = "shaolin/shiting4",
	},
	room_relative="ʯͤ��ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting4",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting3",
		["north"] = "shaolin/shiting5",
	},
	room_relative="ʯͤ��ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting5",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting4",
		["north"] = "shaolin/shiting6",
	},
	room_relative="ʯͤ��ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting6",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting5",
		["north"] = "shaolin/shiting7",
	},
	room_relative="ʯͤ��ʯͤʯͤ",
}
Room {
	id = "shaolin/shiting7",
	name = "ʯͤ",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/shiting6",
	},
	room_relative="ʯͤ--ʯͤ",
}
Room {
	id = "shaolin/slyuan",
	name = "����Ժ",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["east"] = "shaolin/huaishu4",
		["open door;w;ne;n;nw;sw;w;ne;w;s;nw;sw;n"] = "shaolin/fotaout",
		["west"] = "shaolin/talin1",
	},   
	precmds = {
		["west"] = "open door",
	},
        lengths = {
		["open door;w;ne;n;nw;sw;w;ne;w;s;nw;sw;n"] = 13,
	},
}
Room {
	id = "shaolin/talin1",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["east"] = "shaolin/slyuan",
		["northeast"] = "shaolin/talin2",
	},
	precmds = {
	    ["east"] = "open door",
	},
}
Room {
	id = "shaolin/talin2",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["north"] = "shaolin/talin3",
		["southeast"] = "shaolin/talin1",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin3",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["south"] = "shaolin/talin2",
		["northwest"] = "shaolin/talin4",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin4",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["southeast"] = "shaolin/talin3",
		["southwest"] = "shaolin/talin5",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin5",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["northeast"] = "shaolin/talin4",
		["west"] = "shaolin/talin6",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin6",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["northeast"] = "shaolin/talin7",
		["east"] = "shaolin/talin5",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin7",
	name = "����",
	ways = {
	    ["west"] = "shaolin/talin8",
		["southwest"] = "shaolin/talin6",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin8",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["south"] = "shaolin/talin9",
		["east"] = "shaolin/talin7",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin9",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["northwest"] = "shaolin/talin10",
		["north"] = "shaolin/talin8",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin10",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["southeast"] = "shaolin/talin9",
		["southwest"] = "shaolin/talin11",
	},
	room_relative="���֣���������",
}
Room {
	id = "shaolin/talin11",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
	    ["northeast"] = "shaolin/talin10",
		["north"] = "shaolin/fotaout",
	},
}
Room {
	id = "shaolin/smdian",
	name = "ɽ�ŵ�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/guangchang",
		["north"] = "shaolin/gchang-1",
	},
	nolooks = {
		["south"] = true,
	},
	precmds = {
		["south"] = "open gate",
	},
	
}
Room {
	id = "shaolin/songshu1",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/songshu2",
		["northwest"] = "shaolin/hguangz3",
		["east"] = "shaolin/yaowang",
	},
	room_relative="���㳡�I������----ҩ��Ժ��������������",
}
Room {
	id = "shaolin/songshu2",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/songshu3",
		["north"] = "shaolin/songshu1",
		["west"] = "shaolin/stoneroad1",
	},
	room_relative="�����֣�ʯ��·----�����֣�������������",
}
Room {
	id = "shaolin/songshu3",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["southwest"] = "shaolin/celang2",
		["east"] = "shaolin/songshu4",
		["north"] = "shaolin/songshu2",
	},
	room_relative="�����֣�������----�����֨L����������",
}
Room {
	id = "shaolin/songshu4",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/jieluyua",
		["west"] = "shaolin/songshu3",
	},
	lengths = {
		["east"] = "if score.party and score.party=='��ɽ����' and hp.shen>0 and skills['force'] and skills['force'].lvl<220 then return 1 else return false end",
	},
	room_relative="������----������----����Ժ������",
}
Room {
	id = "shaolin/stoneroad1",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/daxiong",
		["east"] = "shaolin/songshu2",
		["north"] = "shaolin/dabeidia",
		["west"] = "shaolin/huaishu4",
	},
	room_relative="�󱯵��������----ʯ��·----�����֣����۱���ʯ��·",
	objs = {
          ["��������"] = "huiru zunzhe",
           },
}
Room {
	id = "shaolin/stoneroad2",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xianglu",
		["east"] = "shaolin/stoneroad3",
		["north"] = "shaolin/dxshijie",
		["west"] = "shaolin/stoneroad4",
	},
	room_relative="̨�ף�ʯ��·----ʯ��·----ʯ��·����¯ʯ��·",
	objs = {
          ["��ɫ����"] = "huise zunzhe",
           },
}
Room {
	id = "shaolin/stoneroad3",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/celang2",
		["east"] = "shaolin/brtang",
		["west"] = "shaolin/stoneroad2",
	},
	room_relative="���ȣ�ʯ��·----ʯ��·----������ʯ��·",
}
Room {
	id = "shaolin/stoneroad4",
	name = "ʯ��·",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/stoneroad2",
		["north"] = "shaolin/celang1",
		["west"] = "shaolin/lhtang",
	},
	room_relative="���ȣ��޺���----ʯ��·----ʯ��·ʯ��·",
}
Room {
	id = "shaolin/taijie",
	name = "̨��",
	outdoor = "��ɽ����",
	ways = {
		["northup"] = "shaolin/lxting",
		["south"] = "shaolin/houdian",
	},
	room_relative="��ѩͤ��̨�ף����̨��",
}

Room {
	id = "shaolin/tianming",
	name = "������̨",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fota2",
	},
}
Room {
	id = "shaolin/ting",
	name = "ӭ��ͤ",
	outdoor = "��ɽ����",
	ways = {
		["#weaponUnWalk;northup;#weaponWWalk"] = "shaolin/shijie9",
		["northup"] = "shaolin/shijie9",
		["southdown"] = "shaolin/shijie8",
	},
	lengths = {
	    ["#weaponUnWalk;northup;#weaponWWalk"] = "if score.party~='��ɽ����' then return 1 else return false end",
		["northup"] = "if score.party=='��ɽ����' then return 1 else return false end",
	},
	objs = {
          ["����"] = "xu ming",
          ["������"] = "wei tianwang",
          ["��ͨ"] = "xu tong",
           },
}
Room {
	id = "shaolin/twdian",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/qdian",
		["north"] = "shaolin/sblu-1",
	},
	objs = {
          ["������ʦ"] = "daoguo chanshi",
           },
	room_relative="ʯ��·���������ǰ��������",
}
Room {
	id = "shaolin/woshi",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xiaowu",
	},
	room_relative="���ң�С��������",
}
Room {
	id = "shaolin/wstang1",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wstang2",
		["east"] = "shaolin/yanwutang",
	},
	objs = {
          ["Բ������"] = "yuanyin heshang",
           },
}
Room {
	id = "shaolin/wstang2",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wstang3",
		["north"] = "shaolin/wstang1",
	},
	objs = {
          ["Բ�ĺ���"] = "yuanxin heshang",
           },
}
Room {
	id = "shaolin/wstang3",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wstang4",
		["north"] = "shaolin/wstang2",
	},
	objs = {
          ["Բҵ����"] = "yuanye heshang",
           },
}
Room {
	id = "shaolin/wstang4",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wstang5",
		["north"] = "shaolin/wstang3",
	},
	objs = {
          ["Բ������"] = "yuanjue heshang",
           },
}
Room {
	id = "shaolin/wstang5",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wstang6",
		["north"] = "shaolin/wstang4",
	},
	objs = {
          ["Բ�ۺ���"] = "yuanhui heshang",
           },
}
Room {
	id = "shaolin/wstang6",
	name = "��ɮ��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/wstang5",
	},
	objs = {
          ["Բ�����"] = "yuanmie heshang",
           },
}
Room {
	id = "shaolin/wuqiku",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/lshuyuan",
	},
	objs = {
          ["������ʦ"] = "daochen chanshi",
           },
	room_relative="�����������Ժ������",
}
Room {
	id = "shaolin/wusetai",
	name = "��ɫ̨",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fota2",
	},
	room_relative="ʥɮ��--��ɫ̨",
}
Room {
	id = "shaolin/wuxiangpai",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/fota2",
	},
	room_relative="ʥɮ��--������",
}
Room {
	id = "shaolin/wuxing0",
	name = "���ж�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wuxing3",
		["east"] = "shaolin/wuxing4",
		["north"] = "shaolin/wuxing2",
		["west"] = "shaolin/wuxing1",
	},
}
Room {
	id = "shaolin/wuxing1",
	name = "���ж�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wuxing3",
		["north"] = "shaolin/wuxing2",
		["east"] = "shaolin/wuxing0",
		["west"] = "shaolin/wuxing4",
	},
}
Room {
	id = "shaolin/wuxing2",
	name = "���ж�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wuxing4",
		["north"] = "shaolin/wuxing3",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/wuxing3",
	name = "���ж�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wuxing2",
		["north"] = "shaolin/wuxing4",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/wuxing4",
	name = "���ж�",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/wuxing3",
		["north"] = "shaolin/wuxing2",
		["east"] = "shaolin/wuxing1",
		["west"] = "shaolin/wuxing0",
	},
}
Room {
	id = "shaolin/xclang",
	name = "ʯ��",
	outdoor = "��ɽ����",
	ways = {
		["northwest"] = "shaolin/gygu",
		["east"] = "shaolin/xctang",
	},
	room_relative="��Ԫ�ȣ�������ʯ��",
}
Room {
	id = "shaolin/xcping",
	name = "����ƺ",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/xctang",
		["west"] = "shaolin/fatang",
	},
	lengths = {
		["north"] = "if score.party and score.party=='��ɽ����' then return 1 else return false end",
	},
	objs = {
          ["��������"] = "huiyun zunzhe",
           },
}
Room {
	id = "shaolin/xctang",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xcping",
		["north"] = "shaolin/duanya",
		["west"] = "shaolin/xclang",
	},
	objs = {
          ["������ʦ"] = "fangsheng dashi",
           },
}
Room {
	id = "shaolin/xianglu",
	name = "��¯",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/sblu-1",
		["north"] = "shaolin/stoneroad2",
	},
	room_relative="ʯ��·����¯��ʯ��·��¯",
}
Room {
	id = "shaolin/xiaojin1",
	name = "С��",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/houyuan",
		["jump out"] = "shaolin/cjlou1",
	},
	nolooks = {
		["jump out"] = true,
	},
	
}
Room {
	id = "shaolin/xiaojing2",
	name = "�﹡��",
	outdoor = "��ɽ����",
	ways = {
		["southdown"] = "group/entry/slxiaoj1",
		["west"] = "shaolin/houshan",
	},
	room_relative="СԺ----�﹡�ߡ�ɽ���﹡��",
}
Room {
	id = "shaolin/xiaolu-1",
	name = "С·",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/xiaolu-2",
		["north"] = "shaolin/chufang2",
	},
	room_relative="�������С·�KС·С·",
}
Room {
	id = "shaolin/xiaolu-2",
	name = "С·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/xiaolu-3",
		["northwest"] = "shaolin/xiaolu-1",
	},
	room_relative="С·�IС·��С·С·",
}
Room {
	id = "shaolin/xiaolu-3",
	name = "С·",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/cyzi-1",
		["north"] = "shaolin/xiaolu-2",
	},
	room_relative="С·��С·����԰��С·",
}
Room {
	id = "shaolin/xiaolu1",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/xiaolu2",
		["west"] = "shaolin/sblu-2",
	},
	room_relative="ʯ��·---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu2",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["northeast"] = "shaolin/xiaolu3",
		["west"] = "shaolin/xiaolu1",
	},
	room_relative="����С·�J����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu3",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/xiaolu4",
		["southwest"] = "shaolin/xiaolu2",
	},
	room_relative="����С·�L�K����С·����С·����С·",
}
Room {
	id = "shaolin/xiaolu4",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["northwest"] = "shaolin/xiaolu3",
		["east"] = "shaolin/xiaoxi",
	},
	room_relative="����С·�I����С·---СϪ����С·",
}
Room {
	id = "shaolin/xiaolu5",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/sblu-2",
		["west"] = "shaolin/xiaolu6",
	},
	room_relative="����С·---����С·---ʯ��·����С·",
}
Room {
	id = "shaolin/xiaolu6",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/xiaolu5",
		["west"] = "shaolin/xiaolu7",
	},
	room_relative="����С·---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaolu7",
	name = "����С·",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/xiaolu6",
		["west"] = "shaolin/fzjs",
	},
	room_relative="���ɾ���---����С·---����С·����С·",
}
Room {
	id = "shaolin/xiaowu",
	name = "С����",
	outdoor = "��ɽ����",
	ways = {
		["south"] = "shaolin/houshan",
		["north"] = "shaolin/woshi",
	},
	room_relative="���ң�С���ݣ�СԺС����",
}
Room {
	id = "shaolin/xiaoxi",
	name = "СϪ",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/xiaolu4",
		["jump river"] = "shaolin/xiaoxi1",
	},
	nolooks = {
		["jump river"] = true,
	room_relative="����С·��",
	},
}
Room {
	id = "shaolin/xiaoxi1",
	name = "Ϫ�Կյ�",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/cjlou",
		["jump river"] = "shaolin/xiaoxi",
	},
	nolooks = {
		["jump river"] = true,
	},
}
Room {
	id = "shaolin/xjchu",
	name = "����",
	outdoor = "��ɽ����",
	no_fight = true,
	ways = {
		["south"] = "shaolin/zhaitang",
	},
	room_relative="���ң�ի������",
}
Room {
	id = "shaolin/xumidian",
	name = "���ֵ�",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/dabeidia",
	},
	objs = {
          ["ľ���"] = "muyu chui",
           },
		room_relative="���ֵ�----�󱯵����ֵ�",
}
Room {
	id = "shaolin/yading",
	name = "�¶�",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/houshand",
		["down"] = "shaolin/duanya",
	},
}
Room {
	id = "shaolin/yanwutang",
	name = "������",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/luohan5",
		["west"] = "shaolin/wstang1",
	},
	lengths = {
		["west"] = "if score.party and score.party=='��ɽ����' then return 1 else return false end",
	},
}
Room {
	id = "shaolin/yaowang",
	name = "ҩ��Ժ",
	outdoor = "��ɽ����",
	ways = {
		["west"] = "shaolin/songshu1",
	},
	objs = {
          ["������ʦ"] = "daoxiang chanshi",
           },
	room_relative="������----ҩ��Ժҩ��Ժ",
}
Room {
	id = "shaolin/zdyuan",
	name = "֤��Ժ",
	outdoor = "��ɽ����",
	ways = {
		["east"] = "shaolin/celang-2",
		["west"] = "shaolin/chanfang-1",
	},
	objs = {
          ["�Ż�����"] = "jiuhuan xizhang",
		  ["������ʦ"] = "xuansheng dashi",
           },
	room_relative="����----֤��Ժ----������֤��Ժ",
}
Room {
	id = "shaolin/zhaitang",
	name = "ի��",
	outdoor = "��ɽ����",
	ways = {
		["north"] = "shaolin/xjchu",
		["east"] = "shaolin/fanting1",
		["west"] = "shaolin/celang-4",
	},
	objs = {
          ["�۽�����"] = "huijie zunzhe",
           },
	room_relative="���ң�������-----ի��-----����ի��",
}
Room {
	id = "shaolin/zhlou1",
	name = "��¥һ��",
	outdoor = "��ɽ����",
	ways = {
		["out"] = "shaolin/zhonglou",
		["up"] = "shaolin/zhlou2",
	},
}
Room {
	id = "shaolin/zhlou2",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou1",
		["up"] = "shaolin/zhlou3",
	},
}
Room {
	id = "shaolin/zhlou3",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou2",
		["up"] = "shaolin/zhlou4",
	},
}
Room {
	id = "shaolin/zhlou4",
	name = "��¥�Ĳ�",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou3",
		["up"] = "shaolin/zhlou5",
	},
}
Room {
	id = "shaolin/zhlou5",
	name = "��¥���",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou4",
		["up"] = "shaolin/zhlou6",
	},
}
Room {
	id = "shaolin/zhlou6",
	name = "��¥����",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou5",
		["up"] = "shaolin/zhlou7",
	},
}
Room {
	id = "shaolin/zhlou7",
	name = "��¥�߲�",
	outdoor = "��ɽ����",
	ways = {
		["down"] = "shaolin/zhlou6",
	},
	objs = {
          ["��������"] = "qingxiao biqiu",
           },
}
Room {
	id = "shaolin/zhonglou",
	name = "��¥СԺ",
	outdoor = "��ɽ����",
	ways = {
		["enter"] = "shaolin/zhlou1",
		["west"] = "shaolin/celang-3",
	},
	room_relative="��¥һ��Ķ�����---��¥СԺ��¥СԺ",
}
Room {
	id = "shaolin/zhushe",
	name = "����",
	outdoor = "��ɽ����",
	ways = {
		["southeast"] = "shaolin/houshan",
	},
	room_relative="����KСԺ����",
}
Room {
	id = "sld/blm",
	name = "������������",
	outdoor = "������",
	ways = {
		["east"] = "sld/blmws",
		["west"] = "sld/blmlgf",
		["out"] = "sld/sanpo6",
	},
	objs = {
          ["��־��"] = "zhong zhiling",
          ["�����ŵ���"] = "white dizi",
           },
  room_relative="������--������������--���ҡ�ɽ�°�����������",
}
Room {
	id = "sld/blmlgf",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "sld/blm",
	},
	room_relative="������----������������������",
}
Room {
	id = "sld/blmws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "sld/blm",
	},
	room_relative="������������-----��������",
}
Room {
	id = "sld/cf",
	name = "����",
	outdoor = "������",
	ways = {
		["west"] = "sld/th",
	},
	room_relative="����--����",
}
Room {
	id = "sld/clm",
	name = "������������",
	outdoor = "������",
	ways = {
		["east"] = "sld/clmws",
		["west"] = "sld/clmlgf",
		["out"] = "sld/sanpo3",
	},
	objs = {
          ["�޸�����"] = "wugen daoren",
          ["�����ŵ���"] = "red dizi",
           },
   room_relative="������--������������--���ҡ�ɽ�³�����������",
}
Room {
	id = "sld/clmlgf",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "sld/clm",
	},
	room_relative="������----������������������",
}
Room {
	id = "sld/clmws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "sld/clm",
	},
	room_relative="������������-----��������",
}
Room {
	id = "sld/dt",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/slj",
		["north"] = "sld/th",
	},
	objs = {
          ["��ͷ��"] = "shou toutuo",
          ["�鰲ͨ"] = "hong antong",
          ["��̳����"] = "shenlong dizi",
          ["��ͷ��"] = "pang toutuo",
          ["����"] = "su quan",
           },
	room_relative="��������������ȴ���",
}
Room {
	id = "sld/dukou",
	name = "�ɿ�",
	outdoor = "������",
	ways = {
		["northwest"] = "sld/sandw",
		["north"] = "sld/trees1",
		["northeast"] = "sld/sande",
	},
	objs = {
          ["����"] = "chuan fu",
           },
	room_relative="ɳ̲����ɳ̲�I���J�ɿڶɿ�",
}
Room {
	id = "sld/haitan",
	name = "��̲",
	outdoor = "������",
	ways = {
		["southwest"] = "sld/xiaolu",
		["#toSld"] = "sld/dukou",
	},
	nolooks = {
		["#toSld"] = true,
	},
	lengths = {
		["#toSld"] = 100,
	},
	room_relative="�ɿڣ�С·��̲",
}
Room {
	id = "sld/hlm",
	name = "������������",
	outdoor = "������",
	ways = {
		["east"] = "sld/hlmws",
		["west"] = "sld/hlmlgf",
		["out"] = "sld/sanpo2",
	},
	objs = {
          ["�ŵ���"] = "zhang danyue",
          ["�����ŵ���"] = "black dizi",
           },
  room_relative="��������ɽ��-----���Һ�����������",
}
Room {
	id = "sld/hlmlgf",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "sld/hlm",
	},
	room_relative="������--������������",
}
Room {
	id = "sld/hlmws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "sld/hlm",
	},
	room_relative="������������--����",
}
Room {
	id = "sld/ht",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/th",
	},
	room_relative="�������������",
}
Room {
	id = "sld/hulm",
	name = "������������",
	outdoor = "������",
	ways = {
		["east"] = "sld/hulmws",
		["west"] = "sld/hulmlgf",
		["out"] = "sld/sanpo4",
	},
	objs = {
          ["���"] = "yin jin",
          ["�����ŵ���"] = "yellow dizi",
           },
	room_relative="������--������������--���ҡ�ɽ�»�����������",
}
Room {
	id = "sld/hulmlgf",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "sld/hulm",
	},
	room_relative="������----������������������",
}

Room {
	id = "sld/hulmws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "sld/hulm",
	},
	room_relative="������������-----��������",
}
Room {
	id = "sld/jitan",
	name = "��̳",
	outdoor = "������",
	ways = {
		["out"] = "sld/pt",
	},
}
Room {
	id = "sld/kongdi",
	name = "�ּ�յ�",
	outdoor = "������",
	ways = {
		["northup"] = "sld/sanroad1",
		["south"] = "sld/trees2",
		["enter"] = "sld/lgxroom",
		["north"] = "sld/treen2",
	},
	objs = {
          ["�����̵������԰�"] = "board",
	room_relative="���֣��ּ�յأ������ּ�յ�",
           },
}
Room {
	id = "sld/lgf",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "sld/road2",
	},
	objs = {
          ["˫��"] = "shuang gou",
           },
	room_relative="����--������",
}
Room {
	id = "sld/lgxroom",
	name = "½������",
	outdoor = "������",
	ways = {
		["east"] = "sld/lgxys",
		["north"] = "sld/lgxws",
		["out"] = "sld/kongdi",
		["#outSld"] = "huanghe/huanghe8",
	},
	objs = {
          ["½����"] = "lu gaoxuan",
           },
	lengths = {
		["#outSld"] = "if locl.area and locl.area=='������' and locl.room~='��̲' and locl.room~='�ۿ�' and locl.room~='С·' then return 10000 else return false end",
	},
}
Room {
	id = "sld/lgxws",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/lgxroom",
	},
	room_relative="½������--����",
}
Room {
	id = "sld/lgxys",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["west"] = "sld/lgxroom",
	},
	objs = {
          ["ҩ��"] = "yaogui",
           },
	room_relative="½������--ҩ��",
}
Room {
	id = "sld/pt",
	name = "ƽ̨",
	outdoor = "������",
	ways = {
		["enter"] = "sld/jitan",
		["east"] = "sld/zl2",
	},
	room_relative="��̳������ƽ̨",
}
Room {
	id = "sld/qlm",
	name = "������������",
	outdoor = "������",
	ways = {
		["east"] = "sld/qlmws",
		["west"] = "sld/qlmlgf",
		["out"] = "sld/sanpo5",
	},
	objs = {
          ["��ѩͤ"] = "xu xueting",
          ["�����ŵ���"] = "green dizi",
    },
	room_relative="������--������������--���ҡ�ɽ��������������",
}
Room {
	id = "sld/qlmlgf",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "sld/qlm",
	},
	room_relative="������----������������������",
}
Room {
	id = "sld/qlmws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "sld/qlm",
	},
	room_relative="������������-----��������",
}
Room {
	id = "sld/road1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/ws",
		["east"] = "sld/slj",
		["west"] = "sld/road2",
	},
	room_relative="����-----����-----���ȣ���������",
}
Room {
	id = "sld/road2",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "sld/road1",
		["north"] = "sld/lgf",
		["west"] = "sld/tz",
	},
	room_relative="������������-----����-----��������",
}
Room {
	id = "sld/sande",
	name = "ɳ̲",
	outdoor = "������",
	ways = {
		["southwest"] = "sld/dukou",
		["northwest"] = "sld/sandn",
		["west"] = "sld/treee1",
	},
	room_relative="�ɿڣ�����----ɳ̲ɳ̲",
}
Room {
	id = "sld/sandn",
	name = "ɳ̲",
	outdoor = "������",
	ways = {
		["southeast"] = "sld/sande",
		["southwest"] = "sld/sandw",
		["south"] = "sld/treen1",
	},
	room_relative="ɳ̲�L���Kɳ̲����ɳ̲ɳ̲",
}
Room {
	id = "sld/sandw",
	name = "ɳ̲",
	outdoor = "������",
	ways = {
		["southeast"] = "sld/dukou",
		["east"] = "sld/treew1",
		["northeast"] = "sld/sandn",
	},
	room_relative="�ɿڣ�����----ɳ̲ɳ̲",
}
Room {
	id = "sld/sanpo1",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["eastup"] = "sld/sanroad5",
		["north"] = "sld/sanroad6",
		["down"] = "sld/sanroad2",
	},
	room_relative="ɽ·��ɽ�¡�ɽ·��ɽ·ɽ��",
}
Room {
	id = "sld/sanpo2",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["westdown"] = "sld/sanroad4",
		["enter"] = "sld/hlm",
	},
	room_relative="��������������ɽ·��ɽ��ɽ��",
}
Room {
	id = "sld/sanpo3",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["southup"] = "sld/sanroad7",
		["enter"] = "sld/clm",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo4",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["enter"] = "sld/hulm",
		["southdown"] = "sld/sanroad9",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo5",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["southup"] = "sld/sanroad8",
		["enter"] = "sld/qlm",
	},
	room_relative="��������������ɽ�¡�ɽ·ɽ��",
}
Room {
	id = "sld/sanpo6",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["westdown"] = "sld/sanroad8",
		["enter"] = "sld/blm",
		["north"] = "sld/sanroada",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ��",
}
Room {
	id = "sld/sanroad1",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["southdown"] = "sld/kongdi",
		["up"] = "sld/sanroad2",
	},
	room_relative="ɽ·��ɽ·���ּ�յ�ɽ·",
}
Room {
	id = "sld/sanroad2",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["northup"] = "sld/sanroad3",
		["down"] = "sld/sanroad1",
		["up"] = "sld/sanpo1",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "sld/sanroad3",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["eastup"] = "sld/sanroad4",
		["southdown"] = "sld/sanroad2",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "sld/sanroad4",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["westdown"] = "sld/sanroad3",
		["eastup"] = "sld/sanpo2",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "sld/sanroad5",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["northup"] = "sld/sanroad9",
		["eastup"] = "sld/sanroad8",
		["westdown"] = "sld/sanpo1",
	},
	room_relative="ɽ·��ɽ�¡�ɽ·��ɽ·ɽ·�L",
}
Room {
	id = "sld/sanroad6",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["south"] = "sld/sanpo1",
		["northdown"] = "sld/sanroad7",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "sld/sanroad7",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["southup"] = "sld/sanroad6",
		["northdown"] = "sld/sanpo3",
	},
	room_relative="ɽ�¡�ɽ·��ɽ·ɽ·",
}
Room {
	id = "sld/sanroad8",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["westdown"] = "sld/sanroad5",
		["eastup"] = "sld/sanpo6",
		["northdown"] = "sld/sanpo5",
	},
	room_relative="ɽ�¡�ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "sld/sanroad9",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["northup"] = "sld/sanpo4",
		["eastup"] = "sld/sanpo7",
		["#sldroad"] = "sld/sanroad5",
	},
	room_relative="ɽ�¡�ɽ·��ɽ�¡�ɽ·ɽ·",
}
Room {
	id = "sld/sanroada",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["south"] = "sld/sanpo6",
		["up"] = "sld/sanroadb",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "sld/sanroadb",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["down"] = "sld/sanroada",
		["up"] = "sld/sfd",
	},
	room_relative="ɽ�嶥��ɽ·��ɽ·ɽ·",
}
Room {
	id = "sld/sfd",
	name = "ɽ�嶥",
	outdoor = "������",
	ways = {
		["enter"] = "sld/slj",
		["down"] = "sld/sanroadb",
	},
	room_relative="���ȡ�ɽ�嶥��ɽ·ɽ�嶥",
}
Room {
	id = "sld/sanpo7",
	name = "ɽ��",
	outdoor = "������",
	ways = {
		["westdown"] = "sld/sanroad9",
		["#Insldsk"] = "sld/sheku",
	},
	nolooks = {
		["#Insldsk"] = true,
	},
	lengths = {
		["#Insldsk"] = "if hp.exp>2000000 and inwdj==1 or skills['poison'] and skills['poison'].lvl>100 then return 20 else return false end",
	},
}
Room {
	id = "sld/sheku",
	name = "�߿�",
	outdoor = "������",
	ways = {
		["#Outsldsk"] = "sld/treen1",
	},
	nolooks = {
		["#Outsldsk"] = true,
	},
	objs = {
          ["�������"] = "shen long",
          ["����"] = "du she",
    },
}
Room {
	id = "sld/slj",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "sld/dt",
		["west"] = "sld/road1",
		["out"] = "sld/sfd",
	},
	room_relative="����������-----���ȡ�ɽ�嶥����",
}
Room {
	id = "sld/th",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/dt",
		["north"] = "sld/ht",
		["east"] = "sld/cf",
	},
	room_relative="����������-----��������������",
}
Room {
	id = "sld/treee1",
	name = "����",
	outdoor = "������",
	ways = {
		["southwest"] = "sld/trees2",
		["northwest"] = "sld/treen2",
		["east"] = "sld/sande",
	},
	room_relative="ɳ̲������----��������",
}
Room {
	id = "sld/treen1",
	name = "����",
	outdoor = "������",
	ways = {
		["southeast"] = "sld/treee1",
		["southwest"] = "sld/treew1",
		["south"] = "sld/treen2",
		["north"] = "sld/sandn",
	},
	room_relative="ɳ̲�����֨L���K����������������",
}
Room {
	id = "sld/treen2",
	name = "����",
	outdoor = "������",
	ways = {
		["southeast"] = "sld/treee1",
		["southwest"] = "sld/treew1",
		["south"] = "sld/kongdi",
		["north"] = "sld/treen1",
	},
	room_relative="���֣����֨L���K�����ּ�յ���������",
}
Room {
	id = "sld/trees1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/dukou",
		["northwest"] = "sld/treew1",
		["north"] = "sld/trees2",
		["northeast"] = "sld/treee1",
	},
	room_relative="�ɿڣ�����----���֣���������",
}
Room {
	id = "sld/trees2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "sld/trees1",
		["northwest"] = "sld/treew1",
		["north"] = "sld/kongdi",
		["northeast"] = "sld/treee1",
	},
	room_relative="�ּ�յأ�����-----���֨I����������",
}
Room {
	id = "sld/treew1",
	name = "����",
	outdoor = "������",
	ways = {
		["southeast"] = "sld/trees2",
		["northeast"] = "sld/treen2",
		["west"] = "sld/sandw",
	},
	room_relative="ɳ̲������-----��������",
}
Room {
	id = "sld/tz",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "sld/road2",
		["out"] = "sld/zl1",
	},
	room_relative="����-----���ȡ���������",
}
Room {
	id = "sld/ws",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["north"] = "sld/road1",
	},
	room_relative="����--����"
}
Room {
	id = "sld/xiaolu",
	name = "С·",
	outdoor = "������",
	ways = {
		["southwest"] = "tanggu/gangkou",
		["northeast"] = "sld/haitan",
	},
	room_relative="��̲�JС·�L�ۿ�С·",
}
Room {
	id = "sld/yaopu1",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/zl1",
		["north"] = "sld/yaopu2",
		["west"] = "sld/yaopu6",
	},
}
Room {
	id = "sld/yaopu2",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu1",
		["north"] = "sld/yaopu3",
		["west"] = "sld/yaopu5",
	},
}
Room {
	id = "sld/yaopu3",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu2",
		["west"] = "sld/yaopu4",
	},
}
Room {
	id = "sld/yaopu4",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu5",
		["east"] = "sld/yaopu3",
		["west"] = "sld/yaopu9",
	},
}
Room {
	id = "sld/yaopu5",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu6",
		["north"] = "sld/yaopu4",
		["east"] = "sld/yaopu2",
		["west"] = "sld/yaopu8",
	},
}
Room {
	id = "sld/yaopu6",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["north"] = "sld/yaopu5",
		["east"] = "sld/yaopu1",
		["west"] = "sld/yaopu7",
	},
}
Room {
	id = "sld/yaopu7",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["north"] = "sld/yaopu8",
		["east"] = "sld/yaopu6",
	},
}
Room {
	id = "sld/yaopu8",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu7",
		["north"] = "sld/yaopu9",
		["east"] = "sld/yaopu5",
	},
}
Room {
	id = "sld/yaopu9",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "sld/yaopu8",
		["east"] = "sld/yaopu4",
	},
}
Room {
	id = "sld/zl1",
	name = "����",
	outdoor = "������",
	ways = {
		["enter"] = "sld/tz",
		["west"] = "sld/zl2",
	},
}
Room {
	id = "sld/zl2",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "sld/zl1",
		["west"] = "sld/pt",
	},
}
Room {
	id = "songshan/cangshu-ge",
	name = "�����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/yushu-lou", 
	},
	room_relative="����������¥�����",
}
Room {
	id = "songshan/chanyuan",
	name = "������Ժ",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/damen",
		["north"] = "songshan/shidao1",
	},
	objs = {
          ["����"] = "ding mian",
	room_relative="ʯ����������Ժ�����������ž�����Ժ",
     },
}
Room {
	id = "songshan/ctmen",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "songshan/shanlu4",
		["northeast"] = "songshan/shanlu5",
	},
	objs = {
          ["½��"] = "lu bo",
    },
	room_relative="ɽ·�J�����ŨKɽ·������",
}
Room {
	id = "songshan/damen",
	name = "����������",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["south"] = "songshan/kuangdi",
		["north"] = "songshan/chanyuan",
	},
	objs = {
          ["ʷ�Ǵ�"] = "shi dengda",
          ["������"] = "han xiongwang",
     },
	 room_relative="������Ժ�����������ţ����ؾ���������",
}
Room {
	id = "songshan/dtlxia",
	name = "������Ͽ",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/xtlxia",
		["southdown"] = "songshan/qgping",
	},
	objs = {
          ["�ֺ�"] = "le hou",
	room_relative="С����Ͽ��������Ͽ�����ƺ������Ͽ",
     },
	
}
Room {
	id = "songshan/fengchantai",
	name = "����̨",
	outdoor = "��ɽ",
	ways = {
		["southdown"] = "songshan/peitian-fang",
		["guan ri"] = "songshan/guanrifeng",
	},
	nolooks = {
		["guan ri"] = true,
	},
	lengths = {
		["guan ri"] = "if score.party and score.party=='��ɽ' then return 1 else return false end",
	},
	objs = {
          ["����"] = "lv cai",
          ["����"] = "you shou",
          ["����"] = "shen luo",
          ["������"] = "zuo lengchan",
     },
	 room_relative="����̨���������򷻷���̨",
}
Room {
	id = "songshan/gsfxia",
	name = "��ʤ����",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "songshan/shanlu2",
		["westup"] = "songshan/guanshengfeng",
	},
	objs = {
          ["�°�"] = "chen an",
     },
	room_relative="��ʤ�����ʤ���¨Kɽ·��ʤ����",
}
Room {
	id = "songshan/guanrifeng",
	name = "���շ�",
	outdoor = "��ɽ",
	ways = {
		["west"] = "songshan/fengchantai",
	},
}
Room {
	id = "songshan/guanshengfeng",
	name = "��ʤ��",
	outdoor = "��ɽ",
	ways = {
		["eastdown"] = "songshan/gsfxia",
		["northdown"] = "songshan/shanlu3",
	},
	room_relative="ɽ·����ʤ�����ʤ���¹�ʤ��",
}
Room {
	id = "songshan/jiange",
	name = "��ԯ����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "songshan/yushu-lou",
	},
	objs = {
          ["��˳��"] = "qin shunchang",
     },
	 room_relative="����¥����ԯ������ԯ����",
}
Room {
	id = "songshan/junji-dian",
	name = "������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/shidao3",
		["south"] = "songshan/junji-fang",
		["east"] = "songshan/suishilu3",
		["west"] = "songshan/suishilu4",
	},
	objs = {
          ["����"] = "zhong zhen",
          ["����"] = "jiang xiang",
          ["������"] = "liu huahui",
	room_relative="ʯ������ʯ·----������----��ʯ·����߾�����������",
     },
}
Room {
	id = "songshan/junji-fang",
	name = "��߾�����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "songshan/junji-dian",
		["southdown"] = "songshan/shidao2",
	},
	room_relative="���������߾�������ʯ����߾�����",
}
Room {
	id = "songshan/kuangdi",
	name = "����",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/taishi-que",
		["north"] = "songshan/damen",
	},
	room_relative="���������ţ����أ�̫���ڿ���",
}
Room {
	id = "songshan/nan-room",
	name = "��Ϣ��",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["north"] = "songshan/qindian",
	},
	room_relative="�޵����Ϣ����Ϣ��",
}
Room {
	id = "songshan/nv-room",
	name = "��Ϣ��",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["south"] = "songshan/qindian",
	},
	room_relative="�޵�--��Ϣ��",
}
Room {
	id = "songshan/peitian-fang",
	name = "��������",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/fengchantai",
		["southdown"] = "songshan/shidao3",
	},
	room_relative="����̨���������򷻡�ʯ����������",
}
Room {
	id = "songshan/qgfeng",
	name = "��ڷ�",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/qgping",
		["southdown"] = "songshan/shanlu3",
	},
	objs = {
          ["����"] = "di xiu",
     },
	 room_relative="���ƺ����ڷ��ɽ·��ڷ�",
}
Room {
	id = "songshan/qgping",
	name = "���ƺ",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/dtlxia",
		["southdown"] = "songshan/qgfeng",
	},
	room_relative="������Ͽ�����ƺ����ڷ����ƺ",
}
Room {
	id = "songshan/qindian",
	name = "�޵�",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/nan-room",
		["east"] = "songshan/zmwshi",
		["north"] = "songshan/nv-room",
		["west"] = "songshan/suishilu3",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	objs = {
          ["�߿���"] = "gao kexin",
     },
	 room_relative="��Ϣ�ң���ʯ·-----�޵�-----�������ң���Ϣ���޵�",
}
Room {
	id = "songshan/shanfang",
	name = "�ŷ�",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["west"] = "songshan/suishilu1",
	},
	objs = {
          ["����"] = "chu zi",
     },
	 room_relative="��ʯ·-----�ŷ��ŷ�",
}
Room {
	id = "songshan/shanlu1",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["down"] = "shaolin/shijie6",
		["west"] = "songshan/shanlu2",
	},
	room_relative="ɽ·-----ɽ·��ʯ��ɽ·",
}
Room {
	id = "songshan/shanlu2",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["northwest"] = "songshan/gsfxia",
		["east"] = "songshan/shanlu1",
	},
	room_relative="��ʤ���¨Iɽ·-----ɽ·ɽ·",
}
Room {
	id = "songshan/shanlu3",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/qgfeng",
		["southup"] = "songshan/guanshengfeng",
	},
	room_relative="��ڷ��ɽ·����ʤ��ɽ·",
}
Room {
	id = "songshan/shanlu4",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["southeast"] = "songshan/xtlxia",
		["northwest"] = "songshan/ctmen",
	},
	objs = {
          ["���"] = "yu jin",
          ["����"] = "wang xiang",
	 
     },
	 room_relative="�����ŨIɽ·�KС����Ͽɽ·",	
}
Room {
	id = "songshan/shanlu5",
	name = "ɽ·",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/taishi-que",
		["southwest"] = "songshan/ctmen",
	},
	room_relative="̫���ڡ�ɽ·�L������ɽ·",
}
Room {
	id = "songshan/shidao1",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/chanyuan",
		["north"] = "songshan/yaocan-ting",
	},
	room_relative="ң��ͤ��ʯ����������Ժʯ��",
}
Room {
	id = "songshan/shidao2",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/junji-fang",
		["south"] = "songshan/tianzhong-ge",
	},
	room_relative="��߾�������ʯ�������и�ʯ��",
}
Room {
	id = "songshan/shidao3",
	name = "ʯ��",
	outdoor = "��ɽ",
	ways = {
		["northup"] = "songshan/peitian-fang",  
		["southdown"] = "songshan/junji-dian",
	},
	room_relative="�������򷻡�ʯ����������ʯ��",
}
Room {
	id = "songshan/shufang",
	name = "�����鷿",
	outdoor = "��ɽ",
	ways = {
		["east"] = "songshan/yushu-lou",
	},
	room_relative="�����鷿---����¥�����鷿",
}
Room {
	id = "songshan/suishilu1",
	name = "��ʯ·",
	outdoor = "��ɽ",
	ways = {
		["east"] = "songshan/shanfang",
		["west"] = "songshan/tianzhong-ge",
	},
	room_relative="���и�----��ʯ·----�ŷ���ʯ·",
}
Room {
	id = "songshan/suishilu2",
	name = "��ʯ·",
	outdoor = "��ɽ",
	ways = {
		["east"] = "songshan/tianzhong-ge",
		["west"] = "songshan/yaofang",
	},
	room_relative="ҩ��----��ʯ·----���и���ʯ·",
}
Room {
	id = "songshan/suishilu3",
	name = "��ʯ·",
	outdoor = "��ɽ",
	ways = {
		["east"] = "songshan/qindian",  
		["west"] = "songshan/junji-dian",
	},
	room_relative="������----��ʯ·----�޵���ʯ·",
}
Room {
	id = "songshan/suishilu4",
	name = "��ʯ·",
	outdoor = "��ɽ",
	ways = {
		["east"] = "songshan/junji-dian",
		["west"] = "songshan/yushu-lou",
	},
	room_relative="����¥----��ʯ·----��������ʯ·",
}
Room {
	id = "songshan/taishi-que",
	name = "̫����",
	outdoor = "��ɽ",
	ways = {
		["north"] = "songshan/kuangdi",  
		["southdown"] = "songshan/shanlu5",
	},
	objs = {
          ["���ƽ"] = "wan daping",
     },
	 room_relative="���أ�̫���ڡ�ɽ·̫����",
}
Room {
	id = "songshan/tianzhong-ge",
	name = "���и�",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/yaocan-ting",
		["east"] = "songshan/suishilu1",
		["north"] = "songshan/shidao2",
		["west"] = "songshan/suishilu2",
	},
	objs = {
          ["��Ӣ��"] = "tang yinge",
	room_relative="ʯ������ʯ·----���и�----��ʯ·��ң��ͤ���и�",
     },
}
Room {
	id = "songshan/xtlxia",
	name = "С����Ͽ",
	outdoor = "��ɽ",
	ways = {
		["northwest"] = "songshan/shanlu4",  
		["southdown"] = "songshan/dtlxia",
	},
	room_relative="ɽ·�IС����Ͽ��������ϿС����Ͽ",
}
Room {
	id = "songshan/yaocan-ting",
	name = "ң��ͤ",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/shidao1",
		["north"] = "songshan/tianzhong-ge",
	},
	objs = {
          ["����"] = "bu chen",
	room_relative="���и��ң��ͤ��ʯ��ң��ͤ",
     },
}
Room {
	id = "songshan/yaofang",
	name = "ҩ��",
	outdoor = "��ɽ",
	no_fight = true,
	ways = {
		["east"] = "songshan/suishilu2",
	},
	objs = {
          ["ҩʦ"] = "yao shi",
     },
	 room_relative="ҩ��-----��ʯ·ҩ��",
}
Room {
	id = "songshan/yushu-lou",
	name = "����¥",
	outdoor = "��ɽ",
	ways = {
		["south"] = "songshan/jiange",
		["north"] = "songshan/cangshu-ge",
		["east"] = "songshan/suishilu4",
		["west"] = "songshan/shufang",
	},
	objs = {
          ["�˰˹�"] = "deng bagong",
	room_relative="�����������鷿----����¥----��ʯ·����ԯ��������¥",
     },
}
Room {
	id = "songshan/zmwshi",
	name = "��������",
	outdoor = "��ɽ",
	ways = {
		["west"] = "songshan/qindian",  
	},
	room_relative="�޵�---����������������",
}
Room {
	id = "suzhou/bailianchi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/erxianting",
	},
	room_relative="�����أ�����ͤ������",
}
Room {
	id = "suzhou/baiyunquan",
	name = "����Ȫ",
	outdoor = "���ݳ�",
	ways = {
		["westdown"] = "suzhou/tianpingshan",
	},
	room_relative="ɽ��-----��ƽɽ����Ȫ",
}
Room {
	id = "suzhou/baodaiqiao",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/nandajie1",
		["northwest"] = "suzhou/xidajie1",
		["north"] = "suzhou/canglangting",
		["northeast"] = "suzhou/dongdajie3",
	},
	room_relative="����ֲ���ͤ����֨I���J�����ţ��ϴ�ֱ�����",
}
Room {
	id = "suzhou/baoheji",
	name = "���ͼ�",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "suzhou/dongdajie3",
	},
	objs = {
          ["���ϼ�"] = "wang heji",
           },
room_relative="����֣����ͼǱ��ͼ�",
}
Room {
	id = "suzhou/beidajie1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/xiyuanzi",
		["south"] = "suzhou/canglangting",
		["east"] = "suzhou/kedian",
		["north"] = "suzhou/beidajie2",
		["west"] = "suzhou/majiu",
	},
	room_relative="����֣����----�����----�͵�L��Ϸ԰�Ӳ���ͤ�����",
}
Room {
	id = "suzhou/beidajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/beidajie1",
		["north"] = "suzhou/northgate",
		["east"] = "suzhou/chunzailou",
		["west"] = "suzhou/zijinan",
	},
	room_relative="���ţ��Ͻ���----�����----����¥������ֱ����",
}
Room {
	id = "suzhou/bingyin",
	name = "��Ӫ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/bingyindamen",
	},
	room_relative="��Ӫ����--��Ӫ",
}
Room {
	id = "suzhou/bingyindamen",
	name = "��Ӫ����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/bingyin",
		["north"] = "suzhou/xidajie1",
	},
	blocks = {
		["south"] = {
			{id = "guan bing", exp = 10000},
		},
        precmds = {
              ["south"] = "kill guan bing",
	},
	},
}
Room {
	id = "suzhou/bingying",
	name = "���ű�Ӫ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/northgate",
		["west"] = "suzhou/jail",
	},
	blocks = {
		["west"] = {
			{id = "zhao liangdong", exp = 450000},
              },
	precmds = {
              ["west"] = "kill zhao liangdong",
		},
	},
}
Room {
	id = "suzhou/bishuiting",
	name = "��ˮͤ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/huzhongdao",
	},
	room_relative="���е�--��ˮͤ",
}
Room {
	id = "suzhou/caixiangjing",
	name = "���㾶",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "suzhou/shuiwa",
		["northeast"] = "suzhou/shuiwa1",
	},
 room_relative="�����뻮����I�J���㾶���㾶",
}
Room {
	id = "suzhou/caizhu",
	name = "���ָ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/wjszhuang",
		["north"] = "suzhou/dayuan1",
	},
	objs = {
          ["��Ȯ"] = "e quan",
           },
	room_relative="���ָ�Ժ�����ָ��ţ���ɽׯ���ָ���",
}
Room {
	id = "suzhou/cangjingge",
	name = "�ؾ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/dxbdian",
	},
	room_relative="�ؾ�������۱���ؾ���",
}
Room {
	id = "suzhou/canglangting",
	name = "����ͤ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/dongdajie3",
		["southwest"] = "suzhou/xidajie1",
		["south"] = "suzhou/baodaiqiao",
		["north"] = "suzhou/beidajie1",
	},
	room_relative="����֣�����ͤ�L���K����ֱ����Ŷ���ֲ���ͤ",
}
Room {
	id = "suzhou/caoebei",
	name = "�ܶ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/nongshe",
		["north"] = "suzhou/jiangbian",
	},
	room_relative="���ߣ��ܶ�----ũ��ܶ�",
}
Room {
	id = "suzhou/chaguan",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/nandajie1",
	},
	room_relative="�ϴ�֣����",
}
Room {
	id = "suzhou/chitang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "suzhou/gumujiaohe",
	},
	room_relative="��ľ��ڭ�J��������",
}
Room {
	id = "suzhou/chunzailou",
	name = "����¥",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/beidajie2",
	},
	room_relative="�����----����¥����¥",
}
Room {
	id = "suzhou/datiepu",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/dongdajie2",
	},
	room_relative="����֣������̴�����",
}
Room {
	id = "suzhou/dayuan1",
	name = "���ָ�Ժ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/caizhu",
		["north"] = "suzhou/houyuan",
	},
	room_relative="��Ժ�����ָ�Ժ�����ָ��ź��ָ�Ժ",
}
Room {
	id = "suzhou/dongdajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/datiepu",
		["northwest"] = "suzhou/hutong2",
		["north"] = "suzhou/lichuntang",
		["east"] = "suzhou/eastgate",
		["west"] = "suzhou/dongdajie3",
	},
	room_relative="��ͬ�����èI�������----�����----���ţ������̶����",
}
Room {
	id = "suzhou/dongdajie3",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/baodaiqiao",
		["south"] = "suzhou/baoheji",
		["northwest"] = "suzhou/canglangting",  
		["north"] = "suzhou/hutong",
		["east"] = "suzhou/dongdajie2",
	},
	room_relative="����ͤ��ͬ�I�������----����֨L�������ű��ͼǶ����",
}
Room {
	id = "suzhou/dongting",
	name = "���Ŷ���",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/ymzhengting", 
	},
}
Room {
	id = "suzhou/dongxiang",
	name = "�뷿",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/houyuan",
		["west"] = "suzhou/huayuan",
	},
	precmds = {
		["west"] = "ask ling shuanghua about ����;#walkBusy",
	},
}
Room {
	id = "suzhou/dxbdian",
	name = "���۱���",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/cangjingge",
		["out"] = "suzhou/lingyansi",
	},
	room_relative="�ؾ�������۱���������´��۱���",
}
Room {
	id = "suzhou/eastgate",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/dongdajie2",
	},
	room_relative="�����-----���Ŷ���",
}
Room {
	id = "suzhou/erxianting",
	name = "����ͤ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/bailianchi",
		["west"] = "suzhou/qianrenshi",
	},
	room_relative="�����أ�ǧ��ʯ----����ͤ����ͤ",
}
Room {
	id = "suzhou/fengqiao",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/hanshidian",
		["north"] = "suzhou/tielingguan",
	},
	room_relative="����أ����ţ���ʰ�����",
}
Room {
	id = "suzhou/gumujiaohe",
	name = "��ľ��ڭ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/chitang",
		["east"] = "suzhou/hehuating",
	},
	room_relative="��ľ��ڭ---�ɻ����L������ľ��ڭ",
}
Room {
	id = "suzhou/hanhanquan",
	name = "����Ȫ",
	outdoor = "���ݳ�",
	ways = {
		["eastdown"] = "suzhou/wjszhuang",
	},
	objs = {
          ["��ʯͷ"] = "da shitou",
           },
	room_relative="����Ȫ����ɽׯ����Ȫ",
}
Room {
	id = "suzhou/hanshansi",
	name = "��ɽ����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/qsgdao5",
		["enter"] = "suzhou/zhengdian",
	},
	room_relative="��ɽ������ĺ�ɽ���ŨK������ɽ����",
}
Room {
	id = "suzhou/hanshidian",
	name = "��ʰ��",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/zhengdian",
		["out"] = "suzhou/fengqiao",
	},
	room_relative="��ɽ������----��ʰ��ŷ��ź�ʰ��",
}
Room {
	id = "suzhou/hehuating",
	name = "�ɻ���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/liuyuan",
		["west"] = "suzhou/gumujiaohe",  
	},
	room_relative="��ľ��ڭ----�ɻ���----��԰�ɻ���",
}
Room {
	id = "suzhou/houtang",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["out"] = "suzhou/shuchang",
	},
	room_relative="���á��鳡����",
}
Room {
	id = "suzhou/houyuan",
	name = "��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/dayuan1",  
		-- ["north"] = "suzhou/dongxiang",
	},
	objs = {
          ["����˼"] = "ling tuisi",
           },
	room_relative="��Ժ�����ָ�Ժ��Ժ",
}
Room {
	id = "suzhou/huayuan",
	name = "��԰",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/dongxiang",
	},
	room_relative="���ָ�Ժ����԰",
}
Room {
	id = "suzhou/hubiandadao",
	name = "���ߴ��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/qingshidadao2",
		["west"] = "thd/guiyun/road1",
	},
	room_relative="��ʯ���������С·--���ߴ��",
}
Room {
	id = "suzhou/huqiushan",
	name = "����ɽ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/toushanmen",
		["northeast"] = "suzhou/qsgdao6",
	},
	objs = {
	      ["С��֦"] = "xiao shuzhi",
          ["������"] = "da shugan",
           },
	room_relative="���ݱ����J����ɽ��ͷ��ɽ����ɽ",
}
Room {
	id = "suzhou/hutong",
	name = "��ͬ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/dongdajie3",
		["northeast"] = "suzhou/hutong1",
	},
	room_relative="��ͬ�J��ͬ������ֺ�ͬ",
}
Room {
	id = "suzhou/hutong1",
	name = "��ͬ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/hutong",
		["east"] = "suzhou/hutong2", 
	},
	room_relative="��ͬ-----��ͬ�L��ͬ��ͬ",
}
Room {
	id = "suzhou/hutong2",
	name = "��ͬ",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/dongdajie2",
		["west"] = "suzhou/hutong1",
	},
	room_relative="��ͬ-----��ͬ�K����ֺ�ͬ",
}
Room {
	id = "suzhou/huzhongdao",
	name = "���е�",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/bishuiting",
	},
	room_relative="��ˮͤ�����е�",
}
Room {
	id = "suzhou/jail",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/bingying",
	},
	objs = {
          ["����"] = "ding dian",
           },
}
Room {
	id = "suzhou/jiangbian",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/caoebei",
		["northeast"] = "group/entry/sztulu2",
	},
	room_relative="��·�J���ߣ��ܶ𱮽���",
}
Room {
	id = "suzhou/jubaozhai",
	name = "�۱�ի",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/nandajie1",
	},
	objs = {
          ["���ϰ�"] = "sun laoban",
           },
	room_relative="�۱�ի----�ϴ�־۱�ի",
}
Room {
	id = "suzhou/kedian",
	name = "�͵�",
	ways = {
		["#szkdout"] = "suzhou/beidajie1",
		["#szkedian"] = "suzhou/kedian2",
	},
	nolooks = {
		["#szkedian"] = true,
	},
	lengths = {
		["#szkedian"] = 3,
	},
	
}
Room {
	id = "suzhou/kedian2",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "suzhou/kedian3",
		["down"] = "suzhou/kedian",
	},
}
Room {
	id = "suzhou/kedian3",
	name = "�͵��¥",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["out"] = "suzhou/kedian2",
	},
}
Room {
	id = "suzhou/lichuntang",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/dongdajie2",
	},
	room_relative="�����ã������������",
}
Room {
	id = "suzhou/lingyanshan",
	name = "����ɽ",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "suzhou/yingxiaoting",
		["south"] = "suzhou/qingshidadao",
		["northwest"] = "suzhou/tianpingshan",
	},
	objs = {
          ["С��֦"] = "xiao shuzhi",
          ["��ʯͷ"] = "da shitou",
	room_relative="��ƽɽ�I����ɽ��ӭЦͤ����ʯ�������ɽ",
           },
}
Room {
	id = "suzhou/lingyansi",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["enter"] = "suzhou/dxbdian",
		["east"] = "suzhou/lingyanta",
		["northdown"] = "suzhou/shiyuan",
		["west"] = "suzhou/zhonglou",
	},
  room_relative="ʯ������¥СԺ----������----������������",
}
Room {
	id = "suzhou/lingyanta",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/lingyansi",
	},
	room_relative="������----������������",
}
Room {
	id = "suzhou/liuyuan",
	name = "��԰",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/nandajie2",
		["west"] = "suzhou/hehuating",  
	},
	room_relative="�ɻ���-----��԰-----�ϴ����԰",
}
Room {
	id = "suzhou/lixuetang",
	name = "��ѩ��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/wenmeige",
	},
	room_relative="��÷�����ѩ����ѩ��",
}
Room {
	id = "suzhou/majiu",
	name = "���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/xiyuanzi",
		["east"] = "suzhou/beidajie1",
	},
	room_relative="���-----����֣�Ϸ԰�����",
}
Room {
	id = "suzhou/mubei",
	name = "��Ĺ",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "suzhou/shiyuan",
	},
	room_relative="ʯ���J��Ĺ��Ĺ",
}
Room {
	id = "suzhou/muniangmu",
	name = "����Ĺ",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/shijianshi",
		["north"] = "suzhou/sunwuting",
	},
	room_relative="����ͤ������Ĺ�L�Խ�ʯ����Ĺ",
}
Room {
	id = "suzhou/nandajie1",
	name = "�ϴ��",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/shuyuan",
		["south"] = "suzhou/nandajie2",
		["east"] = "suzhou/shizilin",
		["north"] = "suzhou/baodaiqiao",
		["northeast"] = "suzhou/chaguan",
		["west"] = "suzhou/jubaozhai",
	},
	room_relative="�����Ų�ݣ��J�۱�ի----�ϴ��----ʨ���֨L����Ժ�ϴ���ϴ��",
}
Room {
	id = "suzhou/nandajie2",
	name = "�ϴ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/southgate",
		["east"] = "suzhou/tingyuxuan",
		["north"] = "suzhou/nandajie1",
		["west"] = "suzhou/liuyuan",  
	},
	room_relative="�ϴ�֣���԰----�ϴ��----�������������ϴ��",
}
Room {
	id = "suzhou/neizhai",
	name = "������լ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/ymzhengting",
	},
}
Room {
	id = "suzhou/nongshe",
	name = "ũ��",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/caoebei",
	},
	objs = {
          ["����"] = "a xiang",
           },
	room_relative="�ܶ�-----ũ��ũ��",
}
Room {
	id = "suzhou/northgate",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/beidajie2",
		["north"] = "suzhou/qsgdao6",
		["west"] = "suzhou/bingying",
	},
	room_relative="���ݱ��������ű�Ӫ-----���ţ�����ֱ���",
}
Room {
	id = "suzhou/qianrenshi",
	name = "ǧ��ʯ",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "suzhou/zhishuangge",
		["north"] = "suzhou/shijianshi",
		["east"] = "suzhou/erxianting",  
	},
	room_relative="��ˬ���Խ�ʯ�I��ǧ��ʯ----����ͤǧ��ʯ",
}
Room {
	id = "suzhou/qingshidadao",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/qingshidadao1",
		["north"] = "suzhou/lingyanshan",
		["east"] = "mr/hubian",
	},
	room_relative="����ɽ����ʯ���---���ߣ���ʯ�����ʯ���",
}
Room {
	id = "suzhou/qingshidadao1",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/qingshidadao2",
		["north"] = "suzhou/qingshidadao",
	},
	room_relative="��ʯ�������ʯ�������ʯ�����ʯ���",
}
Room {
	id = "suzhou/qingshidadao2",
	name = "��ʯ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/hubiandadao",
		["north"] = "suzhou/qingshidadao1",
	},
	room_relative="��ʯ�������ʯ��������ߴ����ʯ���",
}
Room {
	id = "suzhou/qsgdao",
	name = "��ʯ�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/tianpingshan",
		["north"] = "suzhou/qsgdao1",
	},
	room_relative="��ʯ�ٵ�����ʯ�ٵ��L��ƽɽ��ʯ�ٵ�",
}
Room {
	id = "suzhou/qsgdao1",
	name = "��ʯ�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/qsgdao2",
		["south"] = "suzhou/qsgdao",
	},
	room_relative="��ʯ�ٵ��L����ʯ�ٵ���ʯ�ٵ���ʯ�ٵ�",
}
Room {
	id = "suzhou/qsgdao2",
	name = "��ʯ�ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "jiaxing/road2",
		["southwest"] = "hz/shanlu1",
		["north"] = "suzhou/southgate",
		["northeast"] = "suzhou/qsgdao1",
	},
	room_relative="������ʯ�ٵ����J��ʯ�ٵ��L�Kɽ·��ʯ�ٵ���ʯ�ٵ�",
	objs = {
          ["Ұ��"] = "ye tu",
           },
}
Room {
	id = "suzhou/qsgdao3",
	name = "���Źٵ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/qsgdao4",
		["west"] = "suzhou/qsgdao5",  
	},
	room_relative="������---���Źٵ�---������ٵ����Źٵ�",
}
Room {
	id = "suzhou/qsgdao4",
	name = "������ٵ�",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/westgate",
		["west"] = "suzhou/qsgdao3",
	},
	room_relative="���Źٵ�--������ٵ�--����������ٵ�",
}
Room {
	id = "suzhou/qsgdao5",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/tulu1",
		["northwest"] = "suzhou/hanshansi",
		["east"] = "suzhou/qsgdao3",
	},
	room_relative="��ɽ���ŨI������----���Źٵ�����·������",
}
Room {
	id = "suzhou/qsgdao6",
	name = "���ݱ���",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/huqiushan",
		["south"] = "suzhou/northgate",  
		["northwest"] = "city/sroad1",
		["west"] = "gb/tianjing",
	},
	room_relative="���Ϲٵ��I�ﾶ---���ݱ����L������ɽ�������ݱ���",
}
Room {
	id = "suzhou/shihu",
	name = "ʯ��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/tianpingshan",
		["west"] = "suzhou/xingchunqiao",
	},
	room_relative="�д���-----ʯ������ƽɽʯ��",
}
Room {
	id = "suzhou/shijianshi",
	name = "�Խ�ʯ",
	outdoor = "���ݳ�",
	ways = {
		["westdown"] = "suzhou/wjszhuang",
		["south"] = "suzhou/qianrenshi",  
		["north"] = "suzhou/zhenshi",
		["northeast"] = "suzhou/muniangmu",
	},
	room_relative="��ʯ����Ĺ���J��ɽׯ���Խ�ʯ��ǧ��ʯ�Խ�ʯ",
}
Room {
	id = "suzhou/shiyuan",
	name = "ʯ��",
	outdoor = "���ݳ�",
	ways = {
		["southup"] = "suzhou/lingyansi",
		["eastdown"] = "suzhou/shuiwa",
		["westdown"] = "suzhou/shuiwa1",
		["southwest"] = "suzhou/mubei",
		["northdown"] = "suzhou/yingxiaoting",
	},
  room_relative="ӭЦͤ���������ʯ����������L����Ĺ������ʯ��",
}
Room {
	id = "suzhou/shizilin",
	name = "ʨ����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/yanyutang",
		["northeast"] = "suzhou/zhibaixuan",
		["west"] = "suzhou/nandajie1",   
	},
	room_relative="Ҿ��ָ�����J�ϴ��----ʨ����----������ʨ����",
}
Room {
	id = "suzhou/shuchang",
	name = "�鳡",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/xidajie2",
		["enter"] = "suzhou/houtang",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
}
Room {
	id = "suzhou/shuiwa",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/caixiangjing",
		["westup"] = "suzhou/shiyuan",  
	},
	room_relative="ʯ����������K���㾶������",
}
Room {
	id = "suzhou/shuiwa1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "suzhou/shiyuan",   
		["southwest"] = "suzhou/caixiangjing",
	},
	room_relative="�������ʯ���L���㾶������",
}
Room {
	id = "suzhou/shuyuan",
	name = "��Ժ",
	outdoor = "���ݳ�",
	ways = {
		["northeast"] = "suzhou/nandajie1",  
	},
	room_relative="�ϴ�֣���Ժ",
}
Room {
	id = "suzhou/southgate",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/qsgdao2",
		["north"] = "suzhou/nandajie2",
	},
	room_relative="�ϴ�֣����ţ���ʯ�ٵ�����",
}
Room {
	id = "suzhou/sunwuting",
	name = "����ͤ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/muniangmu",
	},
	room_relative="����ͤ������Ĺ����ͤ",
}
Room {
	id = "suzhou/tianpingshan",
	name = "��ƽɽ",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "suzhou/baiyunquan",
		["southeast"] = "suzhou/lingyanshan",
		["north"] = "suzhou/shihu",
		["northeast"] = "suzhou/qsgdao",
	},
	room_relative="ʯ����ʯ�ٵ����J��ƽɽ������Ȫ�K����ɽ��ƽɽ",
}
Room {
	id = "suzhou/tielingguan",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/fengqiao",
		["north"] = "suzhou/nanlin",
	},
	room_relative="����أ����������",
}
Room {
	id = "suzhou/nanlin",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/tielingguan",  
	},
	room_relative="����--�����",
}

Room {
	id = "suzhou/tingyuxuan",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["west"] = "suzhou/nandajie2",
	},
	room_relative="�ϴ��--������",
}
Room {
	id = "suzhou/toushanmen",
	name = "ͷ��ɽ",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/huqiushan",
		["west"] = "suzhou/wjszhuang",
	},
	room_relative="����ɽ����ɽׯ----ͷ��ɽͷ��ɽ",
}
Room {
	id = "suzhou/tulu1",
	name = "��·",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "group/entry/sztulu2",
		["north"] = "suzhou/qsgdao5",   
	},
	room_relative="���������·�L��·��·",
}
Room {
	id = "suzhou/wenmeige",
	name = "��÷��",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/lixuetang",
		["west"] = "suzhou/zhenquting",
	},
	room_relative="��Ȥͤ----��÷�����ѩ����÷��",
}
Room {
	id = "suzhou/westgate",
	name = "����",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/xidajie2",
		["west"] = "suzhou/qsgdao4",
	},
	room_relative="������ٵ�-----����-----���������",
}
Room {
	id = "suzhou/wjszhuang",
	name = "��ɽׯ",
	outdoor = "���ݳ�",
	ways = {
		["eastup"] = "suzhou/shijianshi",  
		["westup"] = "suzhou/hanhanquan",
		["east"] = "suzhou/toushanmen",  
		["north"] = "suzhou/caizhu",
	},
	room_relative="���ָ��ţ�����Ȫ����ɽׯ---ͷ��ɽ��ɽׯ",
}
Room {
	id = "suzhou/xidajie1",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/baodaiqiao",
		["south"] = "suzhou/bingyindamen",
		["north"] = "suzhou/yamen",
		["northeast"] = "suzhou/canglangting",  
		["west"] = "suzhou/xidajie2",
	},
	room_relative="���Ŵ��Ų���ͤ���J�����----����֣��K��Ӫ���ű����������",
}
Room {
	id = "suzhou/xidajie2",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/xuanmiaoguan",
		["east"] = "suzhou/xidajie1",
		["north"] = "suzhou/shuchang", 
		["west"] = "suzhou/westgate",  
	},
	room_relative="�鳡������----�����----����֣�����������",
}
Room {
	id = "suzhou/xingchunqiao",
	name = "�д���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/shihu",
	},
	room_relative="�д���----ʯ���д���",
}
Room {
	id = "suzhou/xiting",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/ymzhengting",
	},
	room_relative="������������������",
}
Room {
	id = "suzhou/xiyuanzi",
	name = "Ϸ԰��",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/majiu",  
		["northeast"] = "suzhou/beidajie1",
	},
	room_relative="��Ǳ���֣��JϷ԰��Ϸ԰��",
}
Room {
	id = "suzhou/xuanmiaoguan",
	name = "�����",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "suzhou/xidajie2",
	},
	room_relative="����֣�����������",
}
Room {
	id = "suzhou/yamen",
	name = "���Ŵ���",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/xidajie1",
		["north"] = "suzhou/ymzhengting",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 7500},
		},
         	precmds = {
              ["north"] = "kill ya yi",
	},
	},
}
Room {
	id = "suzhou/yanyutang",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/zhenquting",
		["west"] = "suzhou/shizilin",  
	},
	room_relative="ʨ����----�����èK��Ȥͤ������",
}
Room {
	id = "suzhou/yingxiaoting",
	name = "ӭЦͤ",
	outdoor = "���ݳ�",
	ways = {
		["southup"] = "suzhou/shiyuan",
		["westdown"] = "suzhou/lingyanshan",
	},
	room_relative="����ɽ��ӭЦͤ��ʯ��ӭЦͤ",
}
Room {
	id = "suzhou/ymzhengting",
	name = "��������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/yamen",  
		["north"] = "suzhou/neizhai",
		["east"] = "suzhou/dongting",
		["west"] = "suzhou/xiting",
	},
	objs = {
          ["��֪��"] = "zhao zhiren",
          ["ʦү"] = "shi ye",
           },
	room_relative="���Ŵ��ţ�������լ--���Ŷ�������������--��������",
}
Room {
	id = "suzhou/zhengdian",
	name = "��ɽ������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/hanshidian",  
		["out"] = "suzhou/hanshansi",
	},
	room_relative="��ɽ������--��ʰ��ź�ɽ���ź�ɽ������",
}
Room {
	id = "suzhou/zhenquting",
	name = "��Ȥͤ",
	outdoor = "���ݳ�",
	ways = {
		["northwest"] = "suzhou/yanyutang",  
		["east"] = "suzhou/wenmeige",  
	},
	room_relative="�����èI��Ȥͤ----��÷����Ȥͤ",
}
Room {
	id = "suzhou/zhenshi",
	name = "��ʯ",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "suzhou/shijianshi",  
	},
	room_relative="��ʯ���Խ�ʯ��ʯ",
}
Room {
	id = "suzhou/zhibaixuan",
	name = "Ҿ��ָ����",
	outdoor = "���ݳ�",
	ways = {
		["southwest"] = "suzhou/shizilin",  
	},
	room_relative="Ҿ��ָ������ʨ����",
}
Room {
	id = "suzhou/zhishuangge",
	name = "��ˬ��",
	outdoor = "���ݳ�",
	ways = {
		["southeast"] = "suzhou/qianrenshi",  
	},
	room_relative="��ˬ��Kǧ��ʯ��ˬ��",
}
Room {
	id = "suzhou/zhonglou",
	name = "��¥СԺ",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/lingyansi",
	},
	room_relative="��¥СԺ---��������¥СԺ",
}
Room {
	id = "suzhou/zijinan",
	name = "�Ͻ���",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "suzhou/beidajie2",
	},
	objs = {
          ["������"] = "cishan xiang",
           },
	room_relative="�Ͻ���----������Ͻ���",
}
Room {
	id = "taishan/baihe",
	name = "�׺�Ȫ",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/yitian",
		["southdown"] = "taishan/daizong",
	},
	room_relative="һ���š��׺�Ȫ����ڷ��׺�Ȫ",
}
Room {
	id = "taishan/baozang",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["westup"] = "taishan/weipin",
	},
	room_relative="Χ��ɽ��������",
}
Room {
	id = "taishan/beitian",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["southdown"] = "taishan/zhangren",
		["up"] = "taishan/jiyizhijian",
	},
	room_relative="����֮��������š����˷山����",
}
Room {
        id = "taishan/jiyizhijian",
        name = "����֮��",
		outdoor = "̩ɽ",
        no_fight = true,
        ways = {
                ["down"] = "taishan/beitian",
				["worship lao ren"] = "taishan/jiyizhijian",
        },
		room_relative="����֮��������ż���֮��",
}
Room {
	id = "taishan/bixia",
	name = "��ϼ��",
	outdoor = "̩ɽ",
	ways = {
		["eastdown"] = "taishan/baozang",
		["west"] = "taishan/weipin",
	},
	room_relative="Χ��ɽ��������--��ϼ��",
}
Room {
	id = "taishan/daizong",
	name = "��ڷ�",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/baihe",
		["south"] = "group/entry/tsyidao3",
		["east"] = "taishan/haitan",
		["west"] = "huanghe/huanghe5",
	},
  room_relative="�׺�Ȫ���ƺӰ���----��ڷ�----��̲���������ڷ�",
}
Room {
	id = "taishan/dongtian",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["west"] = "taishan/tanhai",
	},
	room_relative="̽��ʯ----�����Ŷ�����",
}
Room {
	id = "taishan/doumo",
	name = "��ĸ��",
	outdoor = "̩ɽ",
	ways = {
		["eastup"] = "taishan/shijin",
		["southdown"] = "taishan/yitian",
	},
	room_relative="��ĸ����ʯ������һ���Ŷ�ĸ��",
}
Room {
	id = "taishan/ertian",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/wudafu",
		["southdown"] = "taishan/huima",
	},
	objs = {
          ["��ص���"] = "tianbai daoren",
          ["���ɵ���"] = "tiansong daoren",
     },
	 room_relative="�����ɡ������š������������",
}
Room {
	id = "taishan/fengchan",
	name = "����̨",
	outdoor = "̩ɽ",
	ways = {
		["down"] = "taishan/yuhuang",
	},
	room_relative="����̨����ʶ�����̨",
}
Room {
	id = "taishan/haitan",
	name = "��̲",
	outdoor = "̩ɽ",
	ways = {
		["west"] = "taishan/daizong",
	},
	room_relative="��ڷ�-----��̲��̲",
}
Room {
	id = "taishan/hsroad2",
	name = "��ʯ���",
	outdoor = "̩ɽ",
	ways = {
		["east"] = "taishan/yidao2",
		["west"] = "huanghe/tiandi4",
	},
	room_relative="���---��ʯ���---�������ʯ���",
}
Room {
	id = "taishan/huima",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/ertian",
		["southdown"] = "taishan/shijin",
	},
	room_relative="�����š��������ʯ����������",
}
Room {
	id = "taishan/lianhua",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/shixin",
		["westup"] = "taishan/tianjie",
	},
	room_relative="����ʯ����֣�������",
}
Room {
	id = "taishan/longmen",
	name = "����",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/shengxian",
		["southdown"] = "taishan/wudafu",
	},
	objs = {
          ["�ٰٳ�"] = "chi baicheng",
     },
	 room_relative="���ɷ������š�����������",
}
Room {
	id = "taishan/nantian",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/yuhuang",
		["southdown"] = "taishan/shengxian",
	},
	objs = {
          ["�ױ��ӳ�"] = "qinbing duizhang",
     },
	 room_relative="��ʶ��������š����ɷ�������",
}
Room {
	id = "taishan/riguan",
	name = "�չ۷�",
	outdoor = "̩ɽ",
	ways = {
		["eastup"] = "taishan/tanhai",
		["westup"] = "taishan/yuhuang",
	},
	room_relative="��ʶ����չ۷��̽��ʯ�չ۷�",
}
Room {
	id = "taishan/shengxian",
	name = "���ɷ�",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/nantian",
		["southdown"] = "taishan/longmen",
	},
	objs = {
          ["������"] = "yuji zi",
          ["��������"] = "jianchu daoren",
	room_relative="�����š����ɷ����������ɷ�",
     },
}
Room {
	id = "taishan/shijin",
	name = "ʯ����",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/huima",  
		["westdown"] = "taishan/doumo",
	},
	room_relative="���������ĸ����ʯ����ʯ����",
}
Room {
	id = "taishan/shixin",
	name = "����ʯ",
	outdoor = "̩ɽ",
	ways = {
		["southdown"] = "taishan/lianhua",
	},
	room_relative="�����������ʯ",
}
Room {
	id = "taishan/shulin1",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["southeast"] = "taishan/yidao2",
		["north"] = "taishan/sjzhuang",
	},
	objs = {
          ["��Сɽ"] = "shan xiaoshan",
          ["����ɽ"] = "shan shushan",
          ["����ɽ"] = "shan boshan",
          ["����ɽ"] = "shan zhongshan",
          ["����ɽ"] = "shan jishan",
     },
	 room_relative="����ׯ�������֨K�����������",
}
Room {
	id = "taishan/sjzhuang",
	name = "����ׯ",
	outdoor = "̩ɽ",
	ways = {
		["south"] = "taishan/shulin1",
	},
	objs = {
          ["����"] = "shan zheng",
     },
	 room_relative="����ׯ�������ֵ���ׯ",
}
Room {
	id = "taishan/tanhai",
	name = "̽��ʯ",
	outdoor = "̩ɽ",
	ways = {
		["westdown"] = "taishan/riguan",
		["east"] = "taishan/dongtian",
	},
	objs = {
          ["������"] = "yuyin zi",
     },
	 room_relative="�չ۷��̽��ʯ----������̽��ʯ",
}
Room {
	id = "taishan/tianjie",
	name = "���",
	outdoor = "̩ɽ",
	ways = {
		["eastdown"] = "taishan/lianhua",
		["eastup"] = "taishan/weipin",
		["westdown"] = "taishan/nantian",
	},
	room_relative="�������Χ��ɽ--�����ţ����",
}
Room {
	id = "taishan/weipin",
	name = "Χ��ɽ",
	outdoor = "̩ɽ",
	ways = {
		["westdown"] = "taishan/tianjie",  
		["east"] = "taishan/bixia",
	},
	room_relative="��֣���ϼ��--Χ��ɽ",
}
Room {
	id = "taishan/wudafu",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/longmen",
		["southdown"] = "taishan/ertian",
	},
  room_relative="���š������ɡ�������������",
}
Room {
	id = "taishan/xitian",
	name = "������",
	outdoor = "̩ɽ",
	ways = {
		["southdown"] = "taishan/yueguan",
	},
	room_relative="�¹۷��������",
}
Room {
	id = "taishan/yidao2",
	name = "�����",
	outdoor = "̩ɽ",
	ways = {
		["northwest"] = "taishan/shulin1",
		["east"] = "group/entry/tsyidao3",
		["west"] = "taishan/hsroad2",
	},
	room_relative="�����֨I��ʯ���----�����----����������",
}
Room {
	id = "taishan/yitian",
	name = "һ����",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/doumo",
		["southdown"] = "taishan/baihe",
	},
	room_relative="��ĸ����һ���š��׺�Ȫһ����",
}
Room {
	id = "taishan/yueguan",
	name = "�¹۷�",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/xitian",
		["east"] = "taishan/nantian",
	},
	room_relative="�����ţ�������--�¹۷�",
}
Room {
	id = "taishan/yuhuang",
	name = "��ʶ�",
	outdoor = "̩ɽ",
	ways = {
		["eastdown"] = "taishan/riguan",
		["southdown"] = "taishan/nantian",
		["west"] = "taishan/zhangren",
		["up"] = "taishan/fengchan",
	},
	objs = {
          ["���ŵ���"] = "tianmen daoren",
	room_relative="����̨�����˷�----��ʶ����չ۷����������ʶ�",
      },
}
Room {
	id = "taishan/zhangren",
	name = "���˷�",
	outdoor = "̩ɽ",
	ways = {
		["northup"] = "taishan/beitian",
		["east"] = "taishan/yuhuang", 
	},
	objs = {
          ["������"] = "yuqing zi",
     },
	 room_relative="�����š����˷�----��ʶ����˷�",
}
Room {
	id = "tanggu/beimen",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stbeijie2",
	},
	room_relative="�����ţ����ֱ�����",
}
Room {
	id = "tanggu/center",
	name = "���Ĺ㳡",
	outdoor = "������",
	ways = {
		["southeast"] = "tanggu/kongchangdi",
		["south"] = "tanggu/stnanjie2",
		["east"] = "tanggu/stdongjie1",
		["north"] = "tanggu/stbeijie1",
		["west"] = "tanggu/stxijie1",
	},
	room_relative="���֣�����---���Ĺ㳡---���֣��Kʯͷ�Ͻֹ㳡�յ����Ĺ㳡",
}
Room {
	id = "tanggu/dangpu",
	name = "�򸣵䵱",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "tanggu/stbeijie1",
	},
	objs = {
          ["���ϰ�"] = "yin laoban",
           },
	room_relative="����---�򸣵䵱�򸣵䵱",
}
Room {
	id = "tanggu/dizangmiao",
	name = "�ز���",
	outdoor = "������",
	ways = {
		["west"] = "tanggu/stbeijie2",
	},
	room_relative="����----�ز���ز���",
}
Room {
	id = "tanggu/gangkou",
	name = "�ۿ�",
	outdoor = "������",
	ways = {
		["northeast"] = "sld/xiaolu",
		["west"] = "tanggu/stdongjie1",
	},
	objs = {
          ["ʩ��"] = "shi lang",
           },
	room_relative="С·�J����-----�ۿڸۿ�",
}
Room {
	id = "tanggu/jiuguan",
	name = "С�ƹ�",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stxijie2",
	},
	room_relative="С�ƹݣ�����С�ƹ�",
}
Room {
	id = "tanggu/kedian",
	name = "ϲ����ջ",
	no_fight = true,
	ways = {
		["#xfkzoutgosleep"] = "tanggu/stxijie1",
		["#xfkz"] = "tanggu/kedian2",
	},
	lengths = {
		["#xfkz"] = 5,
	},
	room_relative="���֣�ϲ����ջϲ����ջ"
}
Room {
	id = "tanggu/kedian2",
	name = "�͵��¥",
	outdoor = "������",
	ways = {
		["enter"] = "tanggu/sleeproom",
		["down"] = "tanggu/kedian",
	},
}
Room {
	id = "tanggu/kongchangdi",
	name = "�㳡�յ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["#tggc"] = "tanggu/center",
	},
	objs = {
          ["�����"] = "mu nianci",
           },
	room_relative="�㳡�յ�--���Ĺ㳡",
}
Room {
	id = "tanggu/mingju",
	name = "��ͨ�˼�",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/stnanjie1",
	},
	room_relative="��ͨ�˼�---ʯͷ�Ͻ���ͨ�˼�",
}
Room {
	id = "tanggu/mingju1",
	name = "��ͨ�˼�",
	outdoor = "������",
	ways = {
		["west"] = "tanggu/stnanjie1",
	},
	room_relative="ʯͷ�Ͻ�---��ͨ�˼���ͨ�˼�",
}
Room {
	id = "tanggu/muqidian",
	name = "ľ����",
	outdoor = "������",
	ways = {
		["north"] = "tanggu/stxijie2",
	},
	room_relative="���֣�ľ����ľ����",
}
Room {
	id = "tanggu/nanmen",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["north"] = "tanggu/stnanjie1",
	},
	room_relative="ʯͷ�Ͻ֣��ϳ����ϳ���",
}
Room {
	id = "tanggu/qianyunge",
	name = "���Ƹ�",
	outdoor = "������",
	ways = {
		["north"] = "tanggu/stdongjie1",
	},
	room_relative="���֣����Ƹ����Ƹ�",
}
Room {
	id = "tanggu/qianzhuang",
	name = "Ǯׯ",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/stnanjie2",
	},
	objs = {
          ["�츻"] = "zhu fu",
           },
	room_relative="Ǯׯ-----ʯͷ�Ͻ�Ǯׯ",
}
Room {
	id = "tanggu/sleeproom",
	name = "�͵��¥",
	outdoor = "������",
	no_fight = true,
	ways = {
		["out"] = "tanggu/kedian2",
	},
}
Room {
	id = "tanggu/stbeijie1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/center",
		["north"] = "tanggu/stbeijie2",
		["east"] = "tanggu/dangpu",
		["west"] = "tanggu/wuqipu",
	},
	room_relative="���֣�������-----����-----�򸣵䵱�����Ĺ㳡����",
}
Room {
	id = "tanggu/stbeijie2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stbeijie1", 
		["east"] = "tanggu/dizangmiao",
		["north"] = "tanggu/beimen",
		["west"] = "tanggu/xianjialou",
	},
	room_relative="�����ţ��ɼ�¥-----����-----�ز�������ֱ���",
}
Room {
	id = "tanggu/stdongjie1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/qianyunge",
		["north"] = "tanggu/zhahuopu",
		["east"] = "tanggu/gangkou",
		["west"] = "tanggu/center",
	},
	room_relative="�ӻ��̣����Ĺ㳡-----����-----�ۿڣ����Ƹ󶫽�",
}
Room {
	id = "tanggu/stnanjie1",
	name = "ʯͷ�Ͻ�",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/nanmen",
		["north"] = "tanggu/stnanjie2",
		["east"] = "tanggu/mingju1",
		["west"] = "tanggu/mingju",
	},
	room_relative="ʯͷ�Ͻ֣���ͨ�˼�---ʯͷ�Ͻ�---��ͨ�˼ң��ϳ���ʯͷ�Ͻ�",
}
Room {
	id = "tanggu/stnanjie2",
	name = "ʯͷ�Ͻ�",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stnanjie1",  
		["east"] = "tanggu/zhubaohang",
		["north"] = "tanggu/center",
		["west"] = "tanggu/qianzhuang",
	},
	room_relative="���Ĺ㳡��Ǯׯ---ʯͷ�Ͻ�---�����鱦�У�ʯͷ�Ͻ�ʯͷ�Ͻ�",
}
Room {
	id = "tanggu/stxijie1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/kedian",
		["north"] = "tanggu/yaofang",
		["east"] = "tanggu/center",
		["west"] = "tanggu/stxijie2",
	},
	room_relative="��ҩ��������-----����-----���Ĺ㳡��ϲ����ջ����",
}
Room {
	id = "tanggu/stxijie2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/muqidian",
		["east"] = "tanggu/stxijie1",  
		["north"] = "tanggu/jiuguan",
		["west"] = "tanggu/ximen",
	},
	room_relative="С�ƹݣ�������-----����-----���֣�ľ��������",
}
Room {
	id = "tanggu/wroad1",
	name = "�����",
	outdoor = "������",
	ways = {
		["southwest"] = "tanggu/wroad2",
		["east"] = "tanggu/ximen",
	},
	room_relative="�����----�����ŨL����������",
}
Room {
	id = "tanggu/wroad2",
	name = "�����",
	outdoor = "������",
	ways = {
		["northeast"] = "tanggu/wroad1",
		["west"] = "tanggu/wroad3",
	},
	room_relative="������J�����----����������",
}
Room {
	id = "tanggu/wroad3",
	name = "�����",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/wroad2",
		["west"] = "tanggu/wroad4",
	},
	room_relative="�����----�����----����������",
}
Room {
	id = "tanggu/wroad4",
	name = "�����",
	outdoor = "������",
	ways = {
		["southwest"] = "cangzhou/eroad4",
		["east"] = "tanggu/wroad3",
	},
	room_relative="�����----������L����������",
}
Room {
	id = "tanggu/wuqipu",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/stbeijie1", 
	},
	room_relative="������----����������",
}
Room {
	id = "tanggu/xianjialou",
	name = "�ɼ�¥",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/stbeijie2",  
	},
	room_relative="�ɼ�¥----�����ɼ�¥",
}
Room {
	id = "tanggu/ximen",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "tanggu/stxijie2", 
		["west"] = "tanggu/wroad1",
	},
	room_relative="�����----������----����������",
}
Room {
	id = "tanggu/yaofang",
	name = "��ҩ��",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stxijie1",  
	},
	room_relative="��ҩ�������ִ�ҩ��",
}
Room {
	id = "tanggu/zhahuopu",
	name = "�ӻ���",
	outdoor = "������",
	ways = {
		["south"] = "tanggu/stdongjie1",  
	},
	room_relative="�ӻ��̣������ӻ���",
}
Room {
	id = "tanggu/zhubaohang",
	name = "�����鱦��",
	outdoor = "������",
	ways = {
		["west"] = "tanggu/stnanjie2",  
	},
	objs = {
          ["����ү"] = "long sanye",
           },
	room_relative="ʯͷ�Ͻ�--�����鱦�н����鱦��",
}

Room {
	id = "thd/bookroom",
	name = "�鷿",
	outdoor = "������",
	ways = {
		["west"] = "thd/shilu",
	},
}
Room {
	id = "thd/caodi",
	name = "�ݵ�",
	outdoor = "�һ���",
	ways = {
		["eastup"] = "thd/shanjiao",
		["west"] = "thd/shijian-ting",
		["n"] = "thd/jicui",
		["s"] = "thd/shangang",
	},
	lengths = {
		["n"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/cave",
	name = "�Ҷ�",
	outdoor = "�һ���",
	ways = {
		["out"] = "thd/dongkou",
	},
	objs = {
          ["�ܲ�ͨ"] = "zhou botong",
           },
}
Room {
	id = "thd/chafang1",
	name = "�跿",
	outdoor = "�һ���",
	no_fight = true,
	ways = {
		["east"] = "thd/fanting1",
	},
}
Room {
	id = "thd/chufang",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/fanting",
		["east"] = "thd/neishi2",
	},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/chufang1",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/fanting1",
	},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/dongkou",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["enter"] = "thd/cave",
		["west"] = "thd/shangang",
	},
	lengths = {
		["west"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>150 then return 10 else return false end",
	},
}
Room {
	id = "thd/entrance",
	name = "���",
	outdoor = "�һ���",
	ways = {
	--	["down"] = "thd/taiji",
		["west"] = "thd/hill2",
	},
}
Room {
	id = "thd/fanting",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["stand;east"] = "thd/neishi1",
		["north"] = "thd/chufang",
			},
}
Room {
	id = "thd/fanting1",
	name = "����",
	outdoor = "�һ���",
	no_fight = true,
	ways = {
		["east"] = "thd/lianwuchang",
		["north"] = "thd/chufang1",
		["west"] = "thd/chafang1",
	},
}
Room {
	id = "thd/guiyun/caodi1",
	name = "�ݵ�",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/road4",
		["north"] = "thd/guiyun/shulin1",
		["east"] = "thd/guiyun/caodi3",
		["west"] = "thd/guiyun/caodi2",
	},
}
Room {
	id = "thd/guiyun/caodi2",
	name = "�ݵ�",
	outdoor = "����ׯ",
	ways = {
		["north"] = "thd/guiyun/shulin2",
		["east"] = "thd/guiyun/caodi1",
	},
}
Room {
	id = "thd/guiyun/caodi3",
	name = "�ݵ�",
	outdoor = "����ׯ",
	ways = {
		["north"] = "thd/guiyun/shulin3",
		["west"] = "thd/guiyun/caodi1",
	},
}
Room {
	id = "thd/guiyun/chafang",
	name = "�跿",
	outdoor = "����ׯ",
	no_fight = true,
	ways = {
		["stand;east"] = "thd/guiyun/fanting",
	},
}
Room {
	id = "thd/guiyun/chufang",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["west"] = "thd/guiyun/fanting",
				},
	objs = {
          ["����"] = "rou",
          ["�׷�"] = "mi fan",
           },
}
Room {
	id = "thd/guiyun/fanting",
	name = "����",
	outdoor = "����ׯ",
	no_fight = true,
	ways = {
		["stand;north"] = "thd/guiyun/lianwuchang",
		["stand;east"] = "thd/guiyun/chufang",
		["stand;west"] = "thd/guiyun/chafang",
	},
}
Room {
	id = "thd/guiyun/houting",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["north"] = "thd/guiyun/zoulang3",
		["east"] = "thd/guiyun/shufang",
		["west"] = "thd/guiyun/wofang",
	},
}
--[[
Room {
	id = "thd/guiyun/jiugongn",
	name = "�Ź��һ���",
	ways = {
		["#outJgSq"] = "thd/guiyun/shiqiao",
		["#outJgZq"] = "thd/guiyun/road4",
	},
	nolooks = {
		["#outJgSq"] = true,
		["#outJgZq"] = true,
		["south"] = true,
		["east"] = true,
		["north"] = true,
		["west"] = true,
	},
	lengths = {
		["#outJgSq"] = 100,
		["#outJgZq"] = 100,
	},
	find = {
		path = {"w;w;n;n","e","e","s","w","w","s","e","e"},
	},
}
--]]
Room {
	id = "thd/guiyun/jiuguan",
	name = "С�ƹ�",
	outdoor = "����ׯ",
	ways = {
		["north"] = "thd/guiyun/road2",
	},
	precmds = {
		["north"] = "stand",
	},
	nolooks = {
		["north"] = true,
	},
}
Room {
	id = "thd/guiyun/kefang",
	name = "�ͷ�",
	outdoor = "����ׯ",
	no_fight = true,
	ways = {
		["south"] = "thd/guiyun/zoulang2",
	},
}
Room {
	id = "thd/guiyun/lianwuchang",
	name = "���䳡",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/fanting",
		["north"] = "thd/guiyun/zoulang6",
		["east"] = "thd/guiyun/xiuxishi-f",
		["west"] = "thd/guiyun/xiuxishi-m",
	},
	lengths = {
		["east"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["west"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "thd/guiyun/qianting",
	name = "ǰ��",
	outdoor = "����ׯ",
	ways = {
		["east"] = "thd/guiyun/shiqiao",
		["west"] = "thd/guiyun/zhongting",
	},
	objs = {
          ["����ׯ�ÿ����԰�"] = "board",
          ["½��Ӣ"] = "lu guanying",
           },
}
Room {
	id = "thd/guiyun/rivere",
	name = "С�Ӷ���",
	outdoor = "����ׯ",
	ways = {
		["east"] = "thd/guiyun/road1",
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = "thd/guiyun/riverw",
	},
	nolooks = {
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = true,
	},
	lengths = {
		["e;w;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = 10,
	},
}
Room {
	id = "thd/guiyun/riverw",
	name = "С������",
	outdoor = "����ׯ",
	ways = {
		["west"] = "thd/guiyun/road2",
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = "thd/guiyun/rivere",
	},
	nolooks = {
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = true,
	},
	lengths = {
		["w;e;ask lao zhe about ��ǧ��;jump river;#walkBusy"] = 10,
	},
}
Room {
	id = "thd/guiyun/road1",
	name = "����С·",
	outdoor = "����ׯ",
	ways = {
		["east"] = "suzhou/hubiandadao",
		["west"] = "thd/guiyun/rivere",
	},
}
Room {
	id = "thd/guiyun/road2",
	name = "����С·",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/jiuguan",
		["north"] = "thd/guiyun/road3",
		["east"] = "thd/guiyun/riverw",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["south"] = "if MidNight[locl.time] then return 1 else return false end",
	},
}
Room {
	id = "thd/guiyun/road3",
	name = "����С·",
	outdoor = "����ׯ",
	ways = {
		["s;s;s;s;s;e;n;e"] = "thd/guiyun/riverw",
		["n;n;n;n;n;n;n"] = "thd/guiyun/shulin1",
	},
	nolooks = {
		["s;s;s;s;s;e;n;e"] = true,
		["n;n;n;n;n;n;n"] = true,
		["south"] = true,
		["north"] = true,
	},
}
Room {
	id = "thd/guiyun/road4",
	name = "����ׯǰ",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/road3",
		["north"] = "thd/guiyun/caodi1",
		["west"] = "thd/guiyun/shiqiao",
	},
	lengths = {
		["west"] = "if job.name=='tdh' then return false else return 1 end",
	},
}
Room {
	id = "thd/guiyun/shiqiao",
	name = "��ʯ��",
	outdoor = "����ׯ",
	ways = {
		["east"] = "thd/guiyun/road4",
		["west"] = "thd/guiyun/qianting",
	},
}
Room {
	id = "thd/guiyun/shufang",
	name = "�鷿",
	outdoor = "����ׯ",
	ways = {
		["west"] = "thd/guiyun/houting",
	},
	objs = {
          ["½�˷�"] = "lu chengfeng",
          ["���＼���š�"] = "flute's book",
           },
}
Room {
	id = "thd/guiyun/shulin1",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/caodi1",
		["east"] = "thd/guiyun/shulin3",
		["west"] = "thd/guiyun/shulin2",
	},
}
Room {
	id = "thd/guiyun/shulin2",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/caodi2",
		["east"] = "thd/guiyun/shulin1",
	},
	objs = {
          ["�۷�"] = "bee",
           },
}
Room {
	id = "thd/guiyun/shulin3",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/caodi3",
		["north"] = "thd/guiyun/shulin4",
		["west"] = "thd/guiyun/shulin1",
	},
	objs = {
          ["��֦"] = "shuzhi",
           },
}
Room {
	id = "thd/guiyun/shulin4",
	name = "�����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/shulin3",
		["northwest"] = "thd/guiyun/shulin5",
		["east"] = "thd/guiyun/shulin6",
	},
}
Room {
	id = "thd/guiyun/shulin5",
	name = "�����",
	outdoor = "����ׯ",
	ways = {
		["southeast"] = "thd/guiyun/shulin4",
		["north"] = "thd/guiyun/shulin7",
	},
}
Room {
	id = "thd/guiyun/shulin6",
	name = "�����",
	outdoor = "����ׯ",
	ways = {
		["west"] = "thd/guiyun/shulin4",
	},
}
Room {
	id = "thd/guiyun/shulin7",
	name = "�����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/shulin5",
	},
	objs = {
          ["����"] = "snake",
           },
}
Room {
	id = "thd/guiyun/shushang",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["down"] = "thd/guiyun/shulin5",
	},
}
Room {
	id = "thd/guiyun/wofang",
	name = "�Է�",
	outdoor = "����ׯ",
	ways = {
		["east"] = "thd/guiyun/houting",
	},
}
Room {
	id = "thd/guiyun/wofang1",
	name = "�Է�",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/zoulang3",
	},
	objs = {
          ["������"] = "cheng yaojia",
           },
}
Room {
	id = "thd/guiyun/xiuxishi-f",
	name = "Ů��Ϣ��",
	outdoor = "����ׯ",
	no_fight = true,
	ways = {
		["west"] = "thd/guiyun/lianwuchang",
	},
}
Room {
	id = "thd/guiyun/xiuxishi-m",
	name = "����Ϣ��",
	outdoor = "����ׯ",
	no_fight = true,
	ways = {
		["east"] = "thd/guiyun/lianwuchang",
	},
}
Room {
	id = "thd/guiyun/zhongting",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/zoulang4",
		["north"] = "thd/guiyun/zoulang1",
		["east"] = "thd/guiyun/qianting",
	},
}
Room {
	id = "thd/guiyun/zoulang1",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/zhongting",
		["west"] = "thd/guiyun/zoulang2",
	},
	room_relative="����-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang2",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["east"] = "thd/guiyun/zoulang1",
		["north"] = "thd/guiyun/kefang",
		["west"] = "thd/guiyun/zoulang3",
	},
	room_relative="�ͷ�������-----����-----��������",
}
Room {
	id = "thd/guiyun/zoulang3",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/houting",
		["east"] = "thd/guiyun/zoulang2",
		["north"] = "thd/guiyun/wofang1",
	},
	room_relative="�Է�������-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang4",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["north"] = "thd/guiyun/zhongting",
		["west"] = "thd/guiyun/zoulang5",
	},
	room_relative="����������-----��������",
}
Room {
	id = "thd/guiyun/zoulang5",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/zoulang6",
		["east"] = "thd/guiyun/zoulang4",
	},
	room_relative="����-----���ȣ���������",
}
Room {
	id = "thd/guiyun/zoulang6",
	name = "����",
	outdoor = "����ׯ",
	ways = {
		["south"] = "thd/guiyun/lianwuchang",
		["north"] = "thd/guiyun/zoulang5",
	},
	
	blocks = {
		["south"] = {
			{id = "zhuang ding", exp = 5000, party = "�һ���"},
		},
	},
}
Room {
	id = "thd/haibin",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["west"] = "thd/niujia/jiangpan3",
		["#toThd"] = "thd/shore",
	},
	lengths = {
		["#toThd"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hall",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["east"] = "thd/shilu",
		["west"] = "thd/zoulang1",
	},
}
Room {
	id = "thd/hetang",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["north"] = "thd/shidi",
		["s"] = "thd/jicui",
	},
	lengths = {
		["s"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hill",
	name = "Сɽ",
	outdoor = "�һ���",
	ways = {
		["eastup"] = "thd/hill1",
		["nd"] = "thd/shangang",
	},
	nolooks = {
		["nd"] = true,
	},
	lengths = {
		["nd"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
}
Room {
	id = "thd/hill1",
	name = "ɽ��",
	outdoor = "�һ���",
	ways = {
		["northup"] = "thd/hill2",
		["westdown"] = "thd/hill",
	},
}
Room {
	id = "thd/hill2",
	name = "ɽ��",
	outdoor = "�һ���",
	ways = {
		["east"] = "thd/entrance",
		["southdown"] = "thd/hill1",
	},
}
Room {
	id = "thd/huo",
	name = "��",
	outdoor = "�һ���",
	ways = {
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/jicui",
	name = "����ͤ",
	outdoor = "�һ���",
	ways = {
		["enter"] = "thd/room",
		["east"] = "thd/kefang",
		["ask huang yaoshi about �뵺;#walkBusy"] = "thd/haibin",
		["n"] = "thd/hetang",
		["s"] = "thd/caodi",
	},
	lengths = {
		["ask huang yaoshi about �뵺;#walBusy"] = 10,
		["n"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
		["s"] = "if score.party and score.party=='�һ���' then return 10 else return false end",
	},
	objs = {
          ["��ҩʦ"] = "huang yaoshi",
           },
}
Room {
	id = "thd/jin",
	name = "��",
	outdoor = "�һ���",
	ways = {
		["huo"] = "thd/huo",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/jingshe",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/shilu",
	},
	objs = {
          ["������"] = "array box",
           },
}
Room {
	id = "thd/kefang",
	name = "�ͷ�",
	outdoor = "�һ���",
	ways = {
		["west"] = "thd/jicui",
	},
}
Room {
	id = "thd/kefang1",
	name = "�ͷ�",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/shijian-ting",
	},
}
Room {
	id = "thd/liandanfang",
	name = "������",
	outdoor = "�һ���",
	ways = {
		["out"] = "thd/jingshe",
	},
}
Room {
	id = "thd/liangyi",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["southwest"] = "thd/yang",
		["down"] = "thd/sixiang",
		["northeast"] = "thd/yin",
	},
}
Room {
	id = "thd/lianwuchang",
	name = "���䳡",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/xiuxishi-f",
		["east"] = "thd/zoulang3",
		["north"] = "thd/xiuxishi-m",
		["west"] = "thd/fanting1",
	},
	lengths={
	    ["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	objs = {
          ["������"] = "ziyu xiao",
           },
}
Room {
	id = "thd/mu",
	name = "ľ",
	outdoor = "�һ���",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["shui"] = "thd/shui",
	},
}
Room {
	id = "thd/mudao1",
	name = "Ĺ��",
	outdoor = "�һ���",
	ways = {
		["down"] = "thd/mudao2",
		["out"] = "thd/tomb",
	},
}
Room {
	id = "thd/mudao2",
	name = "Ĺ��",
	outdoor = "�һ���",
	ways = {
		["northup"] = "thd/mudao2",
		["southup"] = "thd/mudao2",
		["northwest"] = "thd/mudao2",
		["north"] = "thd/mudao2",
		["northeast"] = "thd/mudao2",
		["up"] = "thd/mudao1",
		["southeast"] = "thd/mudao2",
		["southwest"] = "thd/mudao2",
		["south"] = "thd/mudao2",
		["east"] = "thd/mudao2",
		["northdown"] = "thd/mudao2",
		["southdown"] = "thd/mudao2",
		["west"] = "thd/mudao2",
	},
}
Room {
	id = "thd/mudao3",
	name = "Ĺ��",
	outdoor = "�һ���",
	ways = {
		["northup"] = "thd/mudao3",
		["southup"] = "thd/mudao3",
		["northwest"] = "thd/mudao3",
		["north"] = "thd/mudao3",
		["northeast"] = "thd/mudao3",
		["up"] = "thd/mudao1",
		["southeast"] = "thd/mudao3",
		["southwest"] = "thd/mudao3",
		["south"] = "thd/mudao3",
		["east"] = "thd/mudao3",
		["northdown"] = "thd/mudao3",
		["southdown"] = "thd/mudao3",
		["west"] = "thd/mudao3",
	},
}
Room {
	id = "thd/mudao4",
	name = "Ĺ��",
	outdoor = "�һ���",
	ways = {
		["down"] = "thd/mushi",
	},
}
Room {
	id = "thd/mushi",
	name = "Ĺ������",
	outdoor = "�һ���",
	ways = {
		["up"] = "thd/mudao4",
	},
}
Room {
	id = "thd/neishi1",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/zoulang2",
		["east"] = "thd/woshi1",
		["north"] = "thd/neishi2",
		["west"] = "thd/fanting",
	},
	objs = {
          ["����"] = "huang rong",
           },
}
Room {
	id = "thd/neishi2",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/neishi1",
		["east"] = "thd/woshi2",
		["west"] = "thd/chufang",
	},
}
Room {
	id = "thd/niujia/bay",
	name = "С���",
	outdoor = "ţ�Ҵ�",
	ways = {
		["west"] = "thd/niujia/hbroad",
	},
	objs = {
          ["���ϴ�"] = "lao da",
           },
	room_relative="��·----С���С���",
}
Room {
	id = "thd/niujia/guojia",
	name = "��",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/njroad2",
	},
	room_relative="����С·����",
}
Room {
	id = "thd/niujia/hbroad",
	name = "��·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["southwest"] = "thd/niujia/njeast",
		["north"] = "thd/niujia/kezhan",
		["east"] = "thd/niujia/bay",
	},
 room_relative="������ջ����·-----С��ۨL�����·",
}
Room {
	id = "thd/niujia/jiangpan1",
	name = "����",
	outdoor = "ţ�Ҵ�",
	ways = {
		["southeast"] = "thd/niujia/jiangpan2",
		["north"] = "thd/niujia/njroad5",
	},
	room_relative="����С·�����ϨK���Ͻ���",
}
Room {
	id = "thd/niujia/jiangpan2",
	name = "����",
	outdoor = "ţ�Ҵ�",
	ways = {
		["northwest"] = "thd/niujia/jiangpan1",
		["east"] = "thd/niujia/jiangpan3",
	},
	room_relative="���ϨI����-----���Ͻ���",
}
Room {
	id = "thd/niujia/jiangpan3",
	name = "����",
	outdoor = "ţ�Ҵ�",
	ways = {
		["west"] = "thd/niujia/jiangpan2",
		["east"] = "thd/haibin",
	},
	room_relative="����-----����-----��������",
}
Room {
	id = "thd/niujia/kezhan",
	name = "������ջ",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/hbroad",
	},
}
Room {
	id = "thd/niujia/kezhan2",
	name = "��¥",
	outdoor = "ţ�Ҵ�",
	no_fight = true,
	ways = {
		["down"] = "thd/niujia/kezhan",
		["east"] = "thd/niujia/kezhan3",
	},
}
Room {
	id = "thd/niujia/kezhan3",
	name = "���᷿",
	outdoor = "ţ�Ҵ�",
	no_fight = true,
	ways = {
		
		["west"] = "thd/niujia/kezhan2",
	},
}
Room {
	id = "thd/niujia/mishi",
	name = "����",
	outdoor = "ţ�Ҵ�",
	ways = {
		["out"] = "thd/niujia/xiaodian",
	},
}
Room {
	id = "thd/niujia/njeast",
	name = "���",
	outdoor = "ţ�Ҵ�",
	ways = {
		["northeast"] = "thd/niujia/hbroad",
		["west"] = "thd/niujia/njroad3",
	},
	room_relative="��·�J����С·-----��ڴ��",
}
Room {
	id = "thd/niujia/njroad1",
	name = "����С·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/xiaodian",
		["east"] = "thd/niujia/njroad2",
		["west"] = "thd/niujia/njwest",
	},
	room_relative="���---����С·---����С·��С�Ƶ����С·",
}
Room {
	id = "thd/niujia/njroad2",
	name = "����С·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["east"] = "thd/niujia/njroad3",
		["north"] = "thd/niujia/guojia",
		["west"] = "thd/niujia/njroad1",
	},
	room_relative="�񷿣�����С·---����С·---����С·����С·",
	objs = {
          ["�𴦻�"] = "qiu chuji",
           },
}
Room {
	id = "thd/niujia/njroad3",
	name = "����С·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/njroad4",
		["north"] = "thd/niujia/qianyuan",
		["east"] = "thd/niujia/njeast",
		["west"] = "thd/niujia/njroad2",
	},
	room_relative="�񷿣�����С·---����С·---��ڣ�����С·����С·",
}
Room {
	id = "thd/niujia/qianyuan",
	name = "��",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/njroad3",
	},
	room_relative="����С·����",
}

Room {
	id = "thd/niujia/njroad4",
	name = "����С·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/njroad5",
		["north"] = "thd/niujia/njroad3",
	},
	room_relative="����С·������С·������С·����С·",
}
Room {
	id = "thd/niujia/njroad5",
	name = "����С·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "thd/niujia/jiangpan1",
		["north"] = "thd/niujia/njroad4",
	},
	room_relative="����С·������С·�����ϴ���С·",
}
Room {
	id = "thd/niujia/njwest",
	name = "���",
	outdoor = "ţ�Ҵ�",
	ways = {
		["northwest"] = "thd/niujia/road2",
		["east"] = "thd/niujia/njroad1",
	},
   room_relative="��·�I���-----����С·���",
}
Room {
	id = "thd/niujia/road",
	name = "��·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["south"] = "group/entry/thdroad1",
		["northwest"] = "hz/qsddao3",
	},
	room_relative="��ʯ����I��·����·��·",
}
Room {
	id = "thd/niujia/road2",
	name = "��·",
	outdoor = "ţ�Ҵ�",
	ways = {
		["southeast"] = "thd/niujia/njwest",
		["northwest"] = "group/entry/thdroad1",
	},
	room_relative="��·�I��·�K�����·",
}
Room {
	id = "thd/niujia/xiaodian",
	name = "С�Ƶ�",
	outdoor = "ţ�Ҵ�",
	ways = {
		["north"] = "thd/niujia/njroad1",
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right"] = "thd/niujia/mishi",
	},
	lengths = {
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right)"] = 11,
	},
	nolooks = {
		["move wan;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan zuo;zhuan tiewan right;zhuan tiewan right;zhuan tiewan right"] = true,
	},
	objs = {
          ["ɵ��"] = "sha gu",
           },
}

Room {
	id = "thd/room",
	name = "�﷿",
	outdoor = "�һ���",
	ways = {
		["out"] = "thd/jicui",
	},
}
Room {
	id = "thd/shangang",
	name = "ɽ��",
	outdoor = "�һ���",
	ways = {
		["north"] = "thd/caodi",
		["east"] = "thd/dongkou",
		["west;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south"] = "thd/dongkou",
	},
	lengths = {
		["east"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>199 then return 10 else return false end",
		["west;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south;south"] = "if skills['qimen-bagua'] and skills['qimen-bagua'].lvl>150 then return 30 else return false end",
	},
}
Room {
	id = "thd/shanjiao",
	name = "�Խ���ɽ��",
	outdoor = "�һ���",
	ways = {
		["westdown"] = "thd/caodi",
		["up"] = "thd/shanlu1",
	},
}
Room {
	id = "thd/shanlu1",
	name = "ɽ·",
	outdoor = "�һ���",
	ways = {
		["northup"] = "thd/shanlu2",
		["down"] = "thd/shanjiao",
	},
}
Room {
	id = "thd/shanlu2",
	name = "ɽ·",
	outdoor = "�һ���",
	ways = {
		["eastup"] = "thd/shanyao",
		["southdown"] = "thd/shanlu1",
	},
}
Room {
	id = "thd/shanya",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["westdown"] = "thd/shanyao",
	},
}
Room {
	id = "thd/shanyao",
	name = "��ɽ��",
	outdoor = "�һ���",
	ways = {
		["eastup"] = "thd/shanya",
		["westdown"] = "thd/shanlu2",
	},
}
Room {
	id = "thd/shaoyang",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["east"] = "thd/sixiang",
		["down"] = "thd/jin",
	},
}
Room {
	id = "thd/shaoyin",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["down"] = "thd/mu",
		["west"] = "thd/sixiang",
	},
}
Room {
	id = "thd/shidi",
	name = "Сʯ��",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/hetang",
		["north"] = "thd/shilu",
	},
}
Room {
	id = "thd/shijian-ting",
	name = "�Խ�ͤ",
	outdoor = "�һ���",
	ways = {
		["north"] = "thd/kefang1",
		["east"] = "thd/caodi",
	},
}
Room {
	id = "thd/shilu",
	name = "ʯ·",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/shidi",
		["north"] = "thd/jingshe",
		["east"] = "thd/bookroom",
		["west"] = "thd/hall",
	},
}
Room {
	id = "thd/shore",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["northup"] = "thd/hill",
	},
}
Room {
	id = "thd/shui",
	name = "ˮ",
	outdoor = "�һ���",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["tu"] = "thd/tu",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/sixiang",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/taiyang",
		["down"] = "thd/tu",
		["north"] = "thd/taiyin",
		["east"] = "thd/shaoyin",
		["west"] = "thd/shaoyang",
	},
}
Room {
	id = "thd/taiji",
	name = "̫��",
	outdoor = "�һ���",
	ways = {
		["down"] = "thd/liangyi",
	},
}
Room {
	id = "thd/taiyang",
	name = "̫��",
	outdoor = "�һ���",
	ways = {
		["north"] = "thd/sixiang",
		["down"] = "thd/huo",
	},
}
Room {
	id = "thd/taiyin",
	name = "̫��",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/sixiang",
		["down"] = "thd/shui",
	},
}
Room {
	id = "thd/taohua1",
	name = "�һ���",
}

Room {
	id = "thd/tomb",
	name = "ʯ��",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/taohua1",
		["east"] = "thd/taohua1",
		["north"] = "thd/taohua1",
		["west"] = "thd/taohua1",
	},
}
Room {
	id = "thd/tu",
	name = "��",
	outdoor = "�һ���",
	ways = {
		["huo"] = "thd/huo",
		["jin"] = "thd/jin",
		["shui"] = "thd/shui",
		["mu"] = "thd/mu",
	},
}
Room {
	id = "thd/woshi1",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["west"] = "thd/neishi1",
	},
}
Room {
	id = "thd/woshi2",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["west"] = "thd/neishi2",
	},
}
Room {
	id = "thd/xiaoyuan",
	name = "СԺ",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/taohua1",
		["north"] = "thd/jicui",
	},
}
Room {
	id = "thd/xiuxishi-f",
	name = "Ů��Ϣ��",
	outdoor = "�һ���",
	no_fight = true,
	ways = {
		["north"] = "thd/lianwuchang",
	},
}
Room {
	id = "thd/xiuxishi-m",
	name = "����Ϣ��",
	outdoor = "�һ���",
	no_fight = true,
	ways = {
		["south"] = "thd/lianwuchang",
	},
}
Room {
	id = "thd/yang",
	name = "��",
	outdoor = "�һ���",
	ways = {
		["northeast"] = "thd/liangyi",
	},
}
Room {
	id = "thd/yin",
	name = "��",
	outdoor = "�һ���",
	ways = {
		["southwest"] = "thd/liangyi",
	},
}
Room {
	id = "thd/zoulang1",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["north"] = "thd/zoulang2",
		["east"] = "thd/hall",
		["west"] = "thd/zoulang3",
	},
}
Room {
	id = "thd/zoulang2",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["south"] = "thd/zoulang1",
		["north"] = "thd/neishi1",
	},
}
Room {
	id = "thd/zoulang3",
	name = "����",
	outdoor = "�һ���",
	ways = {
		["east"] = "thd/zoulang1",
		["west"] = "thd/lianwuchang",
	},
}
Room {
	id = "tianshan/banshan",
	name = "��ɽ",
	outdoor = "��ɽ",
	ways = {
		["southdown"] = "tianshan/shanlu4",
		["west"] = "tianshan/duanhunya",
	},
	objs = {
          ["������"] = "chen zhengde",
          ["����÷"] = "guan mingmei",
     },
}
Room {
	id = "tianshan/bctang",
	name = "�ٲ���",
	ways = {
		["south"] = "tianshan/zoulang3",
	},
}
Room {
	id = "tianshan/bqshi",
	name = "������",
	ways = {
		["north"] = "tianshan/zoulang2",
	},
}
Room {
	id = "tianshan/bzhanjian",
	name = "���ɽ�",
	ways = {
		["drop tielian;south"] = "tianshan/shizhuyan",
		["#toXcm"] = "tianshan/xcmen",
	},
	nolooks = {
		["#toXcm"] = true,
	},
	lengths = {
		["#toXcm"] = 10,
	},
}
Room {
	id = "tianshan/chtbu",
	name = "���첿",
	ways = {
		["eastdown"] = "tianshan/dadao9",
	},
}
Room {
	id = "tianshan/chufang",
	name = "����",
	ways = {
		["east"] = "tianshan/qiandian",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["�׷�"] = "mi fan",
     },
}
Room {
	id = "tianshan/ctbu",
	name = "���첿",
	ways = {
		["northdown"] = "tianshan/dadao3",
		["southdown"] = "tianshan/dadao2",
	},
}
Room {
	id = "tianshan/dadao1",
	name = "��ʯ���",
	ways = {
		["southup"] = "tianshan/pmfeng",
		["north"] = "tianshan/dadao2",
	},
	room_relative="��ʯ�������ʯ�������翷���ʯ���",
}
Room {
	id = "tianshan/dadao10",
	name = "��ʯ���",
	ways = {
		["southwest"] = "tianshan/zhtbu",
		["north"] = "tianshan/dadao9",
		["east"] = "tianshan/dadao3",
	},
	room_relative="��ʯ�������ʯ���---��ʯ����L���첿��ʯ���",
}
Room {
	id = "tianshan/dadao2",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/ctbu",
		["south"] = "tianshan/dadao1",
	},
	room_relative="���첿����ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao3",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/jtbu",
		["southup"] = "tianshan/ctbu",
		["east"] = "tianshan/dadao4",
		["west"] = "tianshan/dadao10",
	},
	room_relative="���첿����ʯ���---��ʯ���---��ʯ��������첿��ʯ���",
}
Room {
	id = "tianshan/dadao4",
	name = "��ʯ���",
	ways = {
		["southeast"] = "tianshan/ytbu",
		["north"] = "tianshan/dadao5",
		["west"] = "tianshan/dadao3",
	},
	room_relative="��ʯ�������ʯ���---��ʯ����K���첿��ʯ���",
}
Room {
	id = "tianshan/dadao5",
	name = "��ʯ���",
	ways = {
		["eastup"] = "tianshan/htbu",
		["westup"] = "tianshan/jtbu",
		["south"] = "tianshan/dadao4",
		["north"] = "tianshan/dadao6",
	},
	room_relative="��ʯ��������첿����ʯ�������첿����ʯ�����ʯ���",
	objs = {
          ["�¹�"] = "chen gu",
     },
}
Room {
	id = "tianshan/dadao6",
	name = "��ʯ���",
	ways = {
		["south"] = "tianshan/dadao5",
		["northeast"] = "tianshan/rtbu",
		["west"] = "tianshan/dadao7",
	},
	room_relative="��첿�J��ʯ���---��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao7",
	name = "��ʯ���",
	ways = {
		["northup"] = "tianshan/xtbu",
		["southup"] = "tianshan/jtbu",
		["east"] = "tianshan/dadao6",
		["west"] = "tianshan/dadao8",
	},
	room_relative="���첿����ʯ���---��ʯ���---��ʯ��������첿��ʯ���",
}
Room {
	id = "tianshan/dadao8",
	name = "��ʯ���",
	ways = {
		["south"] = "tianshan/dadao9",
		["northwest"] = "tianshan/youtbu",
		["east"] = "tianshan/dadao7",
	},
	room_relative="���첿�I��ʯ���---��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadao9",
	name = "��ʯ���",
	ways = {
		["eastup"] = "tianshan/jtbu",
		["westup"] = "tianshan/chtbu",
		["south"] = "tianshan/dadao10",
		["north"] = "tianshan/dadao8",
	},
	room_relative="��ʯ��������첿����ʯ��������첿����ʯ�����ʯ���",
}
Room {
	id = "tianshan/dadian",
	name = "���",
	ways = {
		["south"] = "tianshan/zoulang1",
		["north"] = "tianshan/zoulang6",
		["east"] = "tianshan/zoulang2",
		["west"] = "tianshan/zoulang4",
	},
	objs = {
          ["����"] = "xu zhu",
     },
}
Room {
	id = "tianshan/dsqiao",
	name = "��ˮ��",
	ways = {
		["south"] = "tianshan/gyting",
		["east"] = "tianshan/jiashan",
		["west"] = "tianshan/huayuan",
	},
}
Room {
	id = "tianshan/duanhunya",
	name = "�ϻ���",
	ways = {
		["northup"] = "tianshan/shizhuyan",
		["westdown"] = "tianshan/shanjian",
		["east"] = "tianshan/banshan",
	},
	objs = {
          ["÷��¹"] = "meihua lu",
     },
}
Room {
	id = "tianshan/fjshi",
	name = "������",
	ways = {
		["south"] = "tianshan/zoulang2",
	},
}
Room {
	id = "tianshan/fqzong",
	name = "����ڣ",
	ways = {
		["south"] = "tianshan/zoulang5",
	},
}
Room {
	id = "tianshan/gyting",
	name = "����ͤ",
	ways = {
		["south"] = "tianshan/houyuan",
		["north"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/houyuan",
	name = "��԰",
	ways = {
		["south"] = "tianshan/zoulang6",
		["north"] = "tianshan/gyting",
	},
}
Room {
	id = "tianshan/htbu",
	name = "��첿",
	ways = {
		["westdown"] = "tianshan/dadao5",
	},
	objs = {
          ["������"] = "yu popo",
     },
}
Room {
	id = "tianshan/huayuan",
	name = "��԰",
	ways = {
		["east"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/jiashan",
	name = "��ɽ",
	ways = {
		["west"] = "tianshan/dsqiao",
	},
}
Room {
	id = "tianshan/jtbu",
	name = "���첿",
	ways = {
		["eastdown"] = "tianshan/dadao5",
		["westdown"] = "tianshan/dadao9",
		["enter"] = "tianshan/ljgong",
		["northdown"] = "tianshan/dadao7",
		["southdown"] = "tianshan/dadao3",
	},
	objs = {
          ["����˪"] = "cheng qingshuang",
     },
}
Room {
	id = "tianshan/kefang",
	name = "�ͷ�",
	no_fight = true,
	ways = {
		["south"] = "tianshan/zoulang4",
	},
}
Room {
	id = "tianshan/kongchang",
	name = "�ճ�",
	ways = {
		["east"] = "xingxiu/tianshan",
		["west"] = "tianshan/shanlu1",
	},
}
Room {
	id = "tianshan/lgfang",
	name = "������",
	ways = {
		["north"] = "tianshan/zoulang3",
	},
}
Room {
	id = "tianshan/ljgong",
	name = "���չ�",
	ways = {
		["north"] = "tianshan/qiandian",
		["out"] = "tianshan/jtbu",
	},
}
Room {
	id = "tianshan/longtan",
	name = "��̶",
	no_fight = true,
	ways = {
		["up"] = "tianshan/duanhunya",
	},
}
Room {
	id = "tianshan/lxzai",
	name = "����ի",
	ways = {
		["north"] = "tianshan/zoulang4",
	},
}
Room {
	id = "tianshan/pmfeng",
	name = "��翷�",
	ways = {
		["northdown"] = "tianshan/dadao1",
		["southdown"] = "tianshan/shanjin6",
	},
}
Room {
	id = "tianshan/qiandian",
	name = "ǰ��",
	ways = {
		["south"] = "tianshan/ljgong",
		["north"] = "tianshan/zoulang1",
		["west"] = "tianshan/chufang",
	},
}
Room {
	id = "tianshan/qinshi",
	name = "����",
	ways = {
		["north"] = "tianshan/zoulang5",
	},
}
Room {
	id = "tianshan/rtbu",
	name = "��첿",
	ways = {
		["southwest"] = "tianshan/dadao6",
	},
}
Room {
	id = "tianshan/shandao1",
	name = "ɽ��",
	ways = {
		["south"] = "tianshan/shandao1",
		["east"] = "tianshan/shandao1",
		["north"] = "tianshan/shandao1",
		["west"] = "tianshan/shandao1",
		--["#outTssd"] = "tianshan/shanjin2"
	},
	--nolooks = {
	--	["#outTssd"] = true,
	--},
	--lengths = {
	--	["#outTssd"] = 10,
	--},
}
Room {
	id = "tianshan/shanjian",
	name = "ɽ��",
	ways = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = "tianshan/longtan",
	},
	nolooks = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = true,
		["east"] = true,
		["eastdown"] = true,
		["eastup"] = true,
		["north"] = true,
		["northdown"] = true,
		["northeast"] = true,
		["northup"] = true,
		["northwest"] = true,
		["south"] = true,
		["southdown"] = true,
		["southeast"] = true,
		["southup"] = true,
		["southwest"] = true,
		["west"] = true,
		["westdown"] = true,
		["westup"] = true,
	},
	lengths = {
		["east;eastdown;eastup;north;northdown;northeast;northup;northwest;south;southdown;southeast;southup;southwest;west;westdown;westup"] = 16,
	},
}
Room {
	id = "tianshan/shanjin1",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/shanjin2",
		["southdown"] = "tianshan/xcmen",
	},
	room_relative="ɽ����ɽ�����ɳ���ɽ��",
}
Room {
	id = "tianshan/shanjin2",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin3",
		["southdown"] = "tianshan/shanjin1",
	},
}
Room {
	id = "tianshan/shanjin3",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin4",
		["west"] = "tianshan/shanjin2",
	},
}
Room {
	id = "tianshan/shanjin4",
	name = "ɽ��",
	ways = {
		["east"] = "tianshan/shanjin5",
		["west"] = "tianshan/shanjin3",
	},
}
Room {
	id = "tianshan/shanjin5",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/shanjin6",
		["west"] = "tianshan/shanjin4",
	},
}
Room {
	id = "tianshan/shanjin6",
	name = "ɽ��",
	ways = {
		["northup"] = "tianshan/pmfeng",
		["southdown"] = "tianshan/shanjin5",
	},
	objs = {
          ["����"] = "ling yang",
     },
}
Room {
	id = "tianshan/shanlu1",
	name = "��ɽɽ·",
	ways = {
		["northup"] = "tianshan/shanlu2",
		["east"] = "tianshan/kongchang",
	},
}
Room {
	id = "tianshan/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/shanlu3",
		["southdown"] = "tianshan/shanlu1",
	},
}
Room {
	id = "tianshan/shanlu3",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/shanlu4",
		["southdown"] = "tianshan/shanlu2",
	},
	objs = {
          ["��"] = "zhu ji",
     },
}
Room {
	id = "tianshan/shanlu4",
	name = "ɽ·",
	ways = {
		["northup"] = "tianshan/banshan",
		["southdown"] = "tianshan/shanlu3",
	},
}
Room {
	id = "tianshan/shanyao",
	name = "ɽ��",
	ways = {
		["south"] = "tianshan/shanyao",
		["east"] = "tianshan/shanyao",
		["north"] = "tianshan/shanyao",
		["west"] = "tianshan/shanyao",
	},
}
Room {
	id = "tianshan/shiku",
	name = "ʯ��",
	ways = {
		["south"] = "tianshan/shiku",
		["east"] = "tianshan/shiku",
		["north"] = "tianshan/shiku",
		["west"] = "tianshan/shiku",
	},
}
Room {
	id = "tianshan/shizhuyan",
	name = "ʧ����",
	ways = {
		["north"] = "tianshan/bzhanjian",
		["southdown"] = "tianshan/duanhunya",
	},
}
Room {
	id = "tianshan/xcmen",
	name = "�ɳ���",
	ways = {
		["northup"] = "tianshan/shanjin1",
		["jump duimian;#walkBusy"] = "tianshan/bzhanjian",
	},
	nolooks = {
		["jump duimian;#walkBusy"] = true,
	},
	lengths = {
		["jump duimian;#walkBusy"] = 10,
	},
}
Room {
	id = "tianshan/xtbu",
	name = "���첿",
	ways = {
		["southdown"] = "tianshan/dadao7",
	},
}
Room {
	id = "tianshan/youtbu",
	name = "���첿",
	ways = {
		["southeast"] = "tianshan/dadao8",
	},
}
Room {
	id = "tianshan/ytbu",
	name = "���첿",
	ways = {
		["northwest"] = "tianshan/dadao4",
	},
}
Room {
	id = "tianshan/zhtbu",
	name = "���첿",
	ways = {
		["northeast"] = "tianshan/dadao10",
	},
	objs = {
          ["ʯɩ"] = "shi sao",
     },
}
Room {
	id = "tianshan/zoulang1",
	name = "����",
	ways = {
		["south"] = "tianshan/qiandian",
		["north"] = "tianshan/dadian",
	},
}
Room {
	id = "tianshan/zoulang2",
	name = "����",
	ways = {
		["south"] = "tianshan/bqshi",
		["east"] = "tianshan/zoulang3",
		["north"] = "tianshan/fjshi",
		["west"] = "tianshan/dadian",
	},
	objs = {
          ["��"] = "zhu jian",
     },
}
Room {
	id = "tianshan/zoulang3",
	name = "����",
	ways = {
		["south"] = "tianshan/lgfang",
		["north"] = "tianshan/bctang",
		["west"] = "tianshan/zoulang2",
	},
	objs = {
          ["�ս�"] = "ju jian",
     },
}
Room {
	id = "tianshan/zoulang4",
	name = "����",
	ways = {
		["south"] = "tianshan/lxzai",
		["north"] = "tianshan/kefang",
		["east"] = "tianshan/dadian",
		["west"] = "tianshan/zoulang5",
	},
	objs = {
          ["����"] = "lan jian",
     },
}
Room {
	id = "tianshan/zoulang5",
	name = "����",
	ways = {
		["south"] = "tianshan/qinshi",
		["east"] = "tianshan/zoulang4",
		["north"] = "tianshan/fqzong",
	},
	objs = {
          ["÷��"] = "mei jian",
     },
}
Room {
	id = "tianshan/zoulang6",
	name = "����",
	ways = {
		["south"] = "tianshan/dadian",
		["north"] = "tianshan/houyuan",
	},
}
Room {
	id = "tiezhang/bqshi",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/zoulang-1",
	},
	objs = {
          ["������"] = "bingqi jia",
     },
	 room_relative="�����ң����ȱ�����",
}
Room {
	id = "tiezhang/chufang",
	name = "����",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["south"] = "tiezhang/zoulang-3",
	},
	room_relative="���������ȳ���",
}
Room {
	id = "tiezhang/dashishi",
	name = "��ʯ��",
	outdoor = "����ɽ",
	ways = {
		["out"] = "tiezhang/taijie-2",
	},
	room_relative="ʯ�ף���ʯ��",
}
Room {
	id = "tiezhang/dezj",
	name = "�ڶ�ָ��",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-8",
		["south"] = "tiezhang/sslin-5",
		["enter"] = "tiezhang/dong-1",
	},
	objs = {
          ["������"] = "ling zhentian",
          ["������"] = "huang lingtian",
     },
	 room_relative="ɽ·���ڶ�ָ�ڣ������ֵڶ�ָ��",
}
Room {
	id = "tiezhang/dong-1",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "tiezhang/dong-2",
		["out"] = "tiezhang/dezj",
	},
	room_relative="ɽ����ɽ��--�ڶ�ָ��",
}
Room {
	id = "tiezhang/dong-2",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "tiezhang/dong-3",
		["out"] = "tiezhang/dong-1",
	},
}
Room {
	id = "tiezhang/dong-3",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "tiezhang/trdx",
		["out"] = "tiezhang/dong-2",
	},
}
Room {
	id = "tiezhang/gjfang",
	name = "���߷�",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["west"] = "tiezhang/zoulang-4",
	},
	room_relative="����----���߷����߷�",
}
Room {
	id = "tiezhang/guajia",
	name = "�ϼ�",
	outdoor = "����ɽ",
	ways = {
		["southeast"] = "tiezhang/shuijing",
		["west"] = "tiezhang/guangchang",
	},
	objs = {
          ["��ǧ��"] = "qiu qianzhang",
	room_relative="�㳡-----�ϼܨK����Ȫ�ϼ�",
     },
}
Room {
	id = "tiezhang/guangchang",
	name = "�㳡",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/wztang",
		["south"] = "tiezhang/shanlu-2",
		["east"] = "tiezhang/guajia",
		["west"] = "tiezhang/lgfang",
	},
	precmds = {
		["northup"] = "halt",
		["south"] = "halt",
		["east"] = "halt",
		["west"] = "halt",
	},
	postcmds = {
		["northup"] = "halt",
	},
	objs = {
          ["���ư�������԰�"] = "board",
          ["�ź���"] = "zhang haotian",
	
     },
}
Room {
	id = "tiezhang/hclu",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/hclu-2",
		["southeast"] = "tiezhang/pingtai",
	},
	room_relative="�Ĳ�·���Ĳ�·�Kɽ��ƽ̨�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-2",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "tiezhang/hclu-3",
		["southdown"] = "tiezhang/hclu",
	},
	room_relative="�Ĳ�·�I�Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-3",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/hclu-4",
		["southeast"] = "tiezhang/hclu-2",
	},
	room_relative="�Ĳ�·���Ĳ�·�K�Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-4",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/hclu-5",
		["southdown"] = "tiezhang/hclu-3",
	},
	room_relative="�Ĳ�·���Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-5",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "tiezhang/hclu-6",
		["southdown"] = "tiezhang/hclu-4",
	},
	room_relative="�Ĳ�·�I�Ĳ�·���Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hclu-6",
	name = "�Ĳ�·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/wmfeng",
		["southeast"] = "tiezhang/hclu-5",
	},
	room_relative="��������Ĳ�·�K�Ĳ�·�Ĳ�·",
}
Room {
	id = "tiezhang/hhyang-2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["west"] = "tiezhang/hhyuan-1",
	},
	room_relative="��԰-----���Ի���",
}
Room {
	id = "tiezhang/hhyuan-1",
	name = "��԰",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/hxfang",
		["north"] = "tiezhang/shanlu-3",
		["east"] = "tiezhang/hhyang-2",
		["west"] = "tiezhang/hhyuan-3",
	},
	room_relative="ɽ·����ɽ----��԰----���ԣ����᷿��԰",
}
Room {
	id = "tiezhang/hhyuan-3",
	name = "��ɽ",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/hhyuan-1",
	},
	room_relative="��ɽ-----��԰��ɽ",
}
Room {
	id = "tiezhang/hxfang",
	name = "���᷿",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/wztang",
		["north"] = "tiezhang/hhyuan-1",
	},
	objs = {
          ["��ǧ��"] = "qiu qianren",
     },
	 room_relative="��԰�����᷿����ָ�ú��᷿",
}
Room {
	id = "tiezhang/juebi-1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "tiezhang/shangu-2",
	},
	room_relative="���ڨLɽ�Ⱦ���",
}
Room {
	id = "tiezhang/kedian",
	name = "�͵�",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/lx",
		["#tzkz"] = "tiezhang/kedian2",
	},
	lengths = {
		["#tzkz"] = 5,
    },
	nolooks = {
		["up"] = true,
	},
	room_relative="�͵��¥���͵�-----��Ϫ�͵�",
}
Room {
	id = "tiezhang/kedian2",
	name = "�͵��¥",
	outdoor = "����ɽ",
	ways = {
		["enter"] = "tiezhang/kedian3",
		["down"] = "tiezhang/kedian",
	},
}
Room {
	id = "tiezhang/kedian3",
	name = "�͵��¥",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["out"] = "tiezhang/kedian2",
	},
}
Room {
	id = "tiezhang/lgfang",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/guangchang",
	},
	room_relative="������----�㳡������",
}
Room {
	id = "tiezhang/lx",
	name = "��Ϫ",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "tiezhang/road-1",
		["north"] = "xiangyang/hunanroad2",
		["west"] = "tiezhang/kedian",
	},
	room_relative="��Ϫ�����͵�-----��Ϫ�L����·��Ϫ",
}
Room {
	id = "tiezhang/mishi",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["out"] = "tiezhang/hhyuan-3",
	},
}
Room {
	id = "tiezhang/mzfeng",
	name = "Ĵָ��",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "tiezhang/sslu-3",
	},
	room_relative="Ĵָ�����ʯ·Ĵָ��",
}
Room {
	id = "tiezhang/pingtai",
	name = "ɽ��ƽ̨",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-6",
		["eastup"] = "tiezhang/sslu-1",
		["westup"] = "tiezhang/shanlu-5",
		["northwest"] = "tiezhang/hclu",
		["northeast"] = "tiezhang/shangu-1",
		["southdown"] = "tiezhang/shanlu-4",
	},
	room_relative="�Ĳ�·ɽ·ɽ�ȨI���Jʯ��·��ɽ��ƽ̨����ʯ·��ɽ·ɽ��ƽ̨",
}
Room {
	id = "tiezhang/pubu",
	name = "�ٲ�",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/xzfeng",
		["eastdown"] = "tiezhang/sblu-1",
	},
	room_relative="Сָ����ٲ���ʯ��·�ٲ�",
}
Room {
	id = "tiezhang/road-1",
	name = "����·",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "tiezhang/road-2",
		["northeast"] = "tiezhang/lx",
	},
	room_relative="��Ϫ�J����·�L����·����·",
}
Room {
	id = "tiezhang/road-2",
	name = "����·",
	outdoor = "����ɽ",
	ways = {
		["northeast"] = "tiezhang/road-1",
		["west"] = "tiezhang/road-3",
	},
	room_relative="����·�J����·----����·����·",
}
Room {
	id = "tiezhang/road-3",
	name = "����·",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "tiezhang/shanjiao",
		["east"] = "tiezhang/road-2",
	},
	room_relative="ɽ���¨I����·----����·����·",
}
Room {
	id = "tiezhang/sblu-1",
	name = "ʯ��·",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "tiezhang/shanlu-5",
		["westup"] = "tiezhang/pubu",
	},
	room_relative="�ٲ���ʯ��·��ʯ��·ʯ��·",
}
Room {
	id = "tiezhang/shangu-1",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "tiezhang/pingtai",
		["northeast"] = "tiezhang/shangu-2",
	},
	room_relative="ɽ�ȨJɽ�ȨLɽ��ƽ̨ɽ��",
}
Room {
	id = "tiezhang/shangu-2",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["southwest"] = "tiezhang/shangu-1",
		["northeast"] = "tiezhang/juebi-1",
	},
	room_relative="���ڨJɽ�ȨLɽ��ɽ��",
}
Room {
	id = "tiezhang/shanjiao",
	name = "ɽ����",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanmen",
		["southeast"] = "tiezhang/road-3",
	},
	room_relative="ɽ�š�ɽ���¨K����·ɽ����",
}
Room {
	id = "tiezhang/shanlu-1",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["north"] = "tiezhang/shanlu-2",
		["southdown"] = "tiezhang/shanmen",
	},
	room_relative="ɽ·��ɽ·��ɽ��ɽ·",
}
Room {
	id = "tiezhang/shanlu-2",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/shanlu-1",
		["north"] = "tiezhang/guangchang",
	},
        precmds = {
		["north"] = "#walkBusy",
	},
	room_relative="�㳡��ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-3",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-4",
		["south"] = "tiezhang/hhyuan-1",
	},
	room_relative="ɽ·��ɽ·����԰ɽ·",
}
Room {
	id = "tiezhang/shanlu-4",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/pingtai",
		["southdown"] = "tiezhang/shanlu-3",
	},
	room_relative="ɽ��ƽ̨��ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-5",
	name = "ʯ��·",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "tiezhang/pingtai",
		["westup"] = "tiezhang/sblu-1",
	},
	room_relative="ʯ��·��ʯ��·��ɽ��ƽ̨ʯ��·",
}
Room {
	id = "tiezhang/shanlu-6",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-7",
		["southdown"] = "tiezhang/pingtai",
	},
	room_relative="ɽ·��ɽ·��ɽ��ƽ̨ɽ·",
}
Room {
	id = "tiezhang/shanlu-7",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["north"] = "tiezhang/sslin-1",
		["southdown"] = "tiezhang/shanlu-6",
	},
	room_relative="�����֣�ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanlu-8",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-9",
		["southdown"] = "tiezhang/dezj",
	},
	room_relative="ɽ·��ɽ·���ڶ�ָ��ɽ·",
}
Room {
	id = "tiezhang/shanlu-9",
	name = "ɽ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/zzfeng",
		["southdown"] = "tiezhang/shanlu-8",
	},
	room_relative="��ָ���ɽ·��ɽ·ɽ·",
}
Room {
	id = "tiezhang/shanmen",
	name = "ɽ��",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/shanlu-1",
		["east"] = "tiezhang/zhaigou3",
		["southdown"] = "tiezhang/shanjiao",
		["west"] = "tiezhang/zhaigou1",
	},
	blocks = {
		["northup"] = {
			{id = "heiyi bangzhong", exp = 60000, party = "����ɽ"},
		},
	
	},
}
Room {
	id = "tiezhang/shijie-1",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["eastdown"] = "tiezhang/shijie-2",
		["out"] = "tiezhang/wmfeng",
	},
	room_relative="ʯ�ס�ʯ�ס�������ʯ��",
}
Room {
	id = "tiezhang/shijie-2",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["westup"] = "tiezhang/shijie-1",
		["northdown"] = "tiezhang/shijie-3",
	},
	room_relative="ʯ�ס�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "tiezhang/shijie-3",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["southup"] = "tiezhang/shijie-2",
		["westdown"] = "tiezhang/shishi",
	},
	room_relative="ʯ�ҡ�ʯ�ס�ʯ��ʯ��",
}
Room {
	id = "tiezhang/shishi",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "tiezhang/shijie-3",
	},
	objs = {
	    ["�Ϲٽ���"] = "shangguan jiannan",
	},
}
Room {
	id = "tiezhang/shufang",
	name = "�鷿",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/zoulang-2",
	},
}
Room {
	id = "tiezhang/shuijing",
	name = "����Ȫ",
	outdoor = "����ɽ",
	ways = {
		["northwest"] = "tiezhang/guajia",
	},
	room_relative="�ϼܨI����Ȫ����Ȫ",
}
Room {
	id = "tiezhang/sslin-1",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/shanlu-7",
		["east"] = "tiezhang/sslin-2",
	},
	room_relative="�����֣�������----������----�����֣�ɽ·������",
}
Room {
	id = "tiezhang/sslin-2",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["north"] = "tiezhang/sslin-3",
		["west"] = "tiezhang/sslin-1",
	},
}
Room {
	id = "tiezhang/sslin-3",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/sslin-2",
		["west"] = "tiezhang/sslin-4",
	},
	objs = {
          ["��Ƥ"] = "hu pi",
		  ["�ϻ�"] = "lao hu",
     },
}
Room {
	id = "tiezhang/sslin-4",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["north"] = "tiezhang/sslin-5",
		["east"] = "tiezhang/sslin-3",
	},
}
Room {
	id = "tiezhang/sslin-5",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/sslin-4",
		["north"] = "tiezhang/dezj",
	},
}
Room {
	id = "tiezhang/sslu-1",
	name = "��ʯ·",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "tiezhang/sslu-2",
		["westdown"] = "tiezhang/pingtai",
	},
	room_relative="ɽ��ƽ̨����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/sslu-2",
	name = "��ʯ·",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "tiezhang/sslu-3",
		["westdown"] = "tiezhang/sslu-1",
	},
	room_relative="��ʯ·����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/sslu-3",
	name = "��ʯ·",
	outdoor = "����ɽ",
	ways = {
		["northup"] = "tiezhang/mzfeng",
		["westdown"] = "tiezhang/sslu-2",
	},
	room_relative="Ĵָ�����ʯ·����ʯ·��ʯ·",
}
Room {
	id = "tiezhang/taijie-1",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["westdown"] = "tiezhang/taijie-2",
		["out"] = "tiezhang/trdx",
	},
}
Room {
	id = "tiezhang/taijie-2",
	name = "ʯ��",
	outdoor = "����ɽ",
	ways = {
		["eastup"] = "tiezhang/taijie-1",
	},
}
Room {
	id = "tiezhang/trdx",
	name = "��Ȼ��Ѩ",
	outdoor = "����ɽ",
	ways = {
		["out"] = "tiezhang/dong-3",
	},
}
Room {
	id = "tiezhang/wmfeng",
	name = "������",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "tiezhang/hclu-6",
		["#PoutShangguan"] = "tiezhang/shijie-1",
	},
	nolooks = {
		["#PoutShangguan"] = true,
	},
	lengths = {
		["#PoutShangguan"] = 10,
	},
}
Room {
	id = "tiezhang/wztang",
	name = "��ָ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/zoulang-1",
		["north"] = "tiezhang/hxfang",
		["southdown"] = "tiezhang/guangchang",
		["west"] = "tiezhang/zoulang-2",
	},
	precmds = {
		["east"] = "halt",
		["north"] = "halt",
		["southdown"] = "halt",
		["west"] = "halt",
	},
	postcmds = {
		["southdown"] = "halt",
	},
	objs = {
          ["��Х��"] = "hong xiaotian",
     },
}
Room {
	id = "tiezhang/xxsnan",
	name = "����Ϣ��",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["south"] = "tiezhang/zoulang-4",
	},
}
Room {
	id = "tiezhang/xxsnv",
	name = "Ů��Ϣ��",
	outdoor = "����ɽ",
	no_fight = true,
	ways = {
		["north"] = "tiezhang/zoulang-4",
	},
}
Room {
	id = "tiezhang/xzfeng",
	name = "Сָ��",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "tiezhang/pubu",
	},
	room_relative="Сָ����ٲ�Сָ��",
}
Room {
	id = "tiezhang/zhaigou1",
	name = "կ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/shanmen",
		["west"] = "tiezhang/zhaigou2",
	},
	room_relative="կ��-----կ��-----ɽ��կ��",
}
Room {
	id = "tiezhang/zhaigou2",
	name = "կ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/zhaigou1",
	},
	room_relative="կ��-----կ��կ��",
}
Room {
	id = "tiezhang/zhaigou3",
	name = "կ��",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/zhaigou4",
		["west"] = "tiezhang/shanmen",
	},
	room_relative="կ��-----կ��-----ɽ��կ��",
}
Room {
	id = "tiezhang/zhaigou4",
	name = "կ��",
	outdoor = "����ɽ",
	ways = {
		["west"] = "tiezhang/zhaigou3",
	},
	room_relative="կ��-----կ��կ��",
}
Room {
	id = "tiezhang/zoulang-1",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/zoulang-4",
		["north"] = "tiezhang/bqshi",
		["west"] = "tiezhang/wztang",
	},
	room_relative="�����ң���ָ��-----����-----��������",
}
Room {
	id = "tiezhang/zoulang-2",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/wztang",
		["north"] = "tiezhang/shufang",
		["west"] = "tiezhang/zoulang-3",
	},
	room_relative="�鷿������-----����-----��ָ������",
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "tiezhang/zoulang-3",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["east"] = "tiezhang/zoulang-2",
		["north"] = "tiezhang/chufang",
	},
	room_relative="����������-----��������",
}
Room {
	id = "tiezhang/zoulang-4",
	name = "����",
	outdoor = "����ɽ",
	ways = {
		["south"] = "tiezhang/xxsnv",
		["north"] = "tiezhang/xxsnan",
		["east"] = "tiezhang/gjfang",
		["west"] = "tiezhang/zoulang-1",
	},
	room_relative="����Ϣ�ң�����-----����-----���߷���Ů��Ϣ������",
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "tiezhang/zzfeng",
	name = "��ָ��",
	outdoor = "����ɽ",
	ways = {
		["southdown"] = "tiezhang/shanlu-9",
	},
	room_relative="��ָ���ɽ·��ָ��",
}
Room {
	id = "tls/3wg",
	name = "���޹�",
	outdoor = "������",
	ways = {
		["northup"] = "tls/shiyuan",
		["westup"] = "tls/longxiang1",
		["east"] = "tls/men4",
	},
}
Room {
	id = "tls/banruo",
	name = "����̨",
	outdoor = "������",
	ways = {
		["westdown"] = "tls/yaotai",
		["northwest"] = "tls/road2",
		["east"] = "tls/banruo1",
	},
	objs = {
          ["������ʦ"] = "liaoxiu chanshi",
     },
}
Room {
	id = "tls/banruo1",
	name = "����̨",
	outdoor = "������",
	ways = {
		["west"] = "tls/banruo",
	},
}
Room {
	id = "tls/baodian",
	name = "���۱���",
	outdoor = "������",
	ways = {
		["east"] = "tls/yaoshidian",
		["north"] = "tls/gfd",
		["southdown"] = "tls/road1",
		["west"] = "tls/dizangdian",
	},
	objs = {
          ["�����ʦ"] = "benyin dashi",
    },
	
}
Room {
	id = "tls/bingqi",
	name = "������",
	outdoor = "������",
	ways = {
		["west"] = "tls/cby",
	},
}
Room {
	id = "tls/bzq",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "tls/bzqs",
		["north"] = "tls/bzqn",
	},
}
Room {
	id = "tls/bzqn",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "tls/bzq",
		["east"] = "tls/wxj",
		["north"] = "tls/fqg",
	},
}
Room {
	id = "tls/bzqs",
	name = "�����ű�",
	outdoor = "������",
	ways = {
		["south"] = "tls/road5",
		["north"] = "tls/bzq",
	},
	objs = {
          ["�˿���ʦ"] = "liaokuan chanshi",
     },
}
Room {
	id = "tls/cby",
	name = "�ȱ�Ժ",
	outdoor = "������",
	ways = {
		["north"] = "tls/wuping",
		["east"] = "tls/bingqi",
		["west"] = "tls/road4",
	},
}
Room {
	id = "tls/chufang",
	name = "������ի��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "tls/zt1",
	},
	objs = {
          ["�׷�"] = "rice",
          ["����"] = "da wan",
     },
}
Room {
	id = "tls/dc1",
	name = "���ʮ�ŷ�",
	outdoor = "������",
	ways = {
		["north"] = "tls/ylf1",
		["southdown"] = "tls/dc2",
	},
}
Room {
	id = "tls/dc2",
	name = "���ʮ�ŷ�",
	outdoor = "������",
	ways = {
		["northup"] = "tls/dc1",
		["eastdown"] = "tls/dc3",
	},
}
Room {
	id = "tls/dc3",
	name = "���ʮ�ŷ�",
	outdoor = "������",
	ways = {
		["westup"] = "tls/dc2",
		["southdown"] = "tls/diancang",
	},
}
Room {
	id = "tls/diancang",
	name = "���ɽ",
	outdoor = "������",
	ways = {
		["northup"] = "tls/dc3",
		["eastdown"] = "dali/ximen",
		["eastup"] = "tls/dc3",
		["westup"] = "tls/dc3",
		["southwest"] = "dali/daliwest/nj",
	},
}
Room {
	id = "tls/dizangdian",
	name = "�زص�",
	outdoor = "������",
	ways = {
		["south"] = "tls/zhonglou",
		["northwest"] = "tls/yz5",
		["east"] = "tls/baodian",
	},
}
Room {
	id = "tls/dmg",
	name = "��ĸ��",
	outdoor = "������",
	ways = {
		["north"] = "tls/road6",
		["east"] = "tls/road4",
	},
}
Room {
	id = "tls/fqg",
	name = "��Ȫ��",
	outdoor = "������",
	ways = {
		["northup"] = "tls/wxt",
		["south"] = "tls/bzqn",
	},
}
Room {
	id = "tls/gate",
	name = "��ʥ��",
	outdoor = "������",
	ways = {
		["south"] = "tls/shanlu",
		["enter"] = "tls/road",
	},
}
Room {
	id = "tls/gfd",
	name = "��𱦵�",
	outdoor = "������",
	ways = {
		["south"] = "tls/baodian",
		["east"] = "tls/men1",
		["northdown"] = "tls/yz6",
		["west"] = "tls/men2",
	},
	--blocks = {
	--	["northdown"] = {
	--		{id = "benyin dashi", exp = 1350000},
	--	},
	--},
	
}
Room {
	id = "tls/gmd",
	name = "�������",
	outdoor = "������",
	ways = {
		["south"] = "tls/sjt",
		["east"] = "tls/yz3",
	},
}
Room {
	id = "tls/goudi",
	name = "�����ŵ�",
	outdoor = "������",
	ways = {
		["eastup"] = "tls/road5",
	},
}
Room {
	id = "tls/guanchong",
	name = "�س�",
}
Room {
	id = "tls/gulou",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "tls/zt",
		["north"] = "tls/yaoshidian",
		["west"] = "tls/road1",
	},
}
Room {
	id = "tls/lang",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "tls/songlin",
		["west"] = "tls/road3",
	},
}
Room {
	id = "tls/lang2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tls/songlin2",
		["enter"] = "tls/monitang",
		["north"] = "tls/songlin1",
		["west"] = "tls/songlin",
	},
	lengths = {
	    ["south"] = 10,
		["north"] = 10,
	},
}
Room {
	id = "tls/longxiang1",
	name = "����̨",
	outdoor = "������",
	ways = {
		["northup"] = "tls/longxiang2",
		["eastdown"] = "tls/3wg",
		["southdown"] = "tls/longxiang3",
		["west"] = "tls/longxiang4",
	},
}
Room {
	id = "tls/longxiang2",
	name = "�����䳡-����̨",
	outdoor = "������",
	ways = {
		["southdown"] = "tls/longxiang1",
	},
}
Room {
	id = "tls/longxiang3",
	name = "�����䳡-����̨",
	outdoor = "������",
	ways = {
		["northup"] = "tls/longxiang1",
	},
}
Room {
	id = "tls/longxiang4",
	name = "�����䳡-����̨",
	outdoor = "������",
	ways = {
		["east"] = "tls/longxiang1",
		["west"] = "tls/shanlu-1",
	},
	objs = {
          ["������ʦ"] = "liaoxing chanshi",
     },
}
Room {
        id = "tls/lsy",
        name = "����Ժ",
		outdoor = "������",
        ways = {
                ["out"] = "tls/songlin-1",
                ["ask kurong zhanglao about ���ƶ�"] = "tls/pyd", --modman����tlsdiziȥ���ƶ�
        },
        nolooks = {
                ["ask kurong zhanglao about ���ƶ�"] = true,
        },
        objs = {
          ["���ٳ���"] = "kurong zhanglao",
        },
        lengths = {
                ["ask kurong zhanglao about ���ƶ�"] = "if score.party and score.party=='������' and hp.neili_max>4500 then return 1 else return false end",
        },
}
Room {
	id = "tls/men1",
	name = "�����",
	outdoor = "������",
	ways = {
		["east"] = "tls/yz4",
		["north"] = "tls/wujingge",
		["west"] = "tls/gfd",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
}
Room {
	id = "tls/men2",
	name = "�����",
	outdoor = "������",
	ways = {
		["north"] = "tls/wuwoge",
		["east"] = "tls/gfd",
		["west"] = "tls/yz5",
	},
	lengths = {
		["north"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
}
Room {
	id = "tls/men3",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "tls/yaotai",
		["west"] = "tls/yz4",
	},
	nolooks = {
		["south"] = true,
		["east"] = true,
	},
	precmds = {
		["east"] = "open door",
	},
}
Room {
	id = "tls/men4",
	name = "������",
	outdoor = "������",
	ways = {
		-- ["south"] = "tls/xiuxishi2",
		["east"] = "tls/yz5",
		["west"] = "tls/3wg",
	},
	nolooks = {
		["south"] = true,
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
}
Room {
	id = "tls/monitang",
	name = "Ĳ����",
	outdoor = "������",
	ways = {
		["out"] = "tls/lang2",
	},
	objs = {
          ["���δ�ʦ"] = "bencan dashi",
          ["�����ʦ"] = "benxiang dashi",
          ["���۴�ʦ"] = "benguan dashi",
     },
}
Room {
	id = "tls/pyd",
	name = "���ƶ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["northup"] = "tls/shaoshang",
		["southeast"] = "tls/shaochong",
		["southwest"] = "tls/shaoze",
		["northwest"] = "tls/guanchong",
		["north"] = "tls/shangyang",
		["northeast"] = "tls/zhongchong",
		["out"] = "tls/lsy",
	},
}
Room {
	id = "tls/pyd/guanchong",
	name = "�س�",
	outdoor = "������",
	ways = {
		["southeast"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/pyd",
	name = "���ƶ�",
	outdoor = "������",
	ways = {
		["northup"] = "tls/pyd/shaoshang",
		["southeast"] = "tls/pyd/shaochong",
		["southwest"] = "tls/pyd/shaoze",
		["northwest"] = "tls/pyd/guanchong",
		["north"] = "tls/pyd/shangyang",
		["northeast"] = "tls/pyd/zhongchong",
	},
}
Room {
	id = "tls/pyd/shangyang",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/shaochong",
	name = "�ٳ�",
	outdoor = "������",
	ways = {
		["northwest"] = "tls/pyd/shaochong",
	},
}
Room {
	id = "tls/pyd/shaoshang",
	name = "����",
	outdoor = "������",
	ways = {
		["southdown"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/pyd/shaoze",
	name = "����",
	outdoor = "������",
	ways = {
		["northeast"] = "tls/pyd/shaoze",
	},
}
Room {
	id = "tls/pyd/zhongchong",
	name = "�г�",
	outdoor = "������",
	ways = {
		["southwest"] = "tls/pyd/pyd",
	},
}
Room {
	id = "tls/qxg",
	name = "���ĸ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "tls/shiyuan",
	},
}
Room {
	id = "tls/road",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["northup"] = "tls/twd",
		["east"] = "tls/yz2",
		["west"] = "tls/yz1",
		["out"] = "tls/gate",
	},
	objs = {
          ["�������±�"] = "board",
		  ["�˻���ʦ"] = "liaohuo chanshi",
     },
}
Room {
	id = "tls/road1",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["northup"] = "tls/baodian",
		["southup"] = "tls/twd",
		["east"] = "tls/gulou",
		["west"] = "tls/zhonglou",
	},
	objs = {
          ["�������"] = "xinqing biqiu",
     },
}
Room {
	id = "tls/road2",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["southeast"] = "tls/banruo",
		["north"] = "tls/wwj",
		["southdown"] = "tls/yaotai",
	},
}
Room {
	id = "tls/road3",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["east"] = "tls/lang",
		["west"] = "tls/wwj",
	},
}
Room {
	id = "tls/road4",
	name = "��ʯ·",
	outdoor = "������",
	ways = {
		["north"] = "tls/sroom",
		["east"] = "tls/cby",
		["southdown"] = "tls/yz3",
		["west"] = "tls/dmg",
	},
}
Room {
	id = "tls/road5",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["south"] = "tls/shiyuan",
		["north"] = "tls/bzqs",
	},
}
Room {
	id = "tls/road6",
	name = "��ʯ��",
	outdoor = "������",
	ways = {
		["southdown"] = "tls/dmg",
	},
}
Room {
	id = "tls/road7",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["south"] = "tls/yuhua1",
		["north"] = "tls/songlin-1",
	},
}
Room {
	id = "tls/shangyang",
	name = "����",
}
Room {
	id = "tls/shanlu",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["south"] = "tls/ylf2",
		["north"] = "tls/gate",
	},
	objs = {
          ["����"] = "nan dizi",
          ["�θ�"] = "nan dizi",
     },
}
Room {
	id = "tls/shanlu-1",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["east"] = "tls/longxiang4",
		["west"] = "tls/shanlu-2",
	},
}
Room {
	id = "tls/shanlu-2",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["east"] = "tls/shanlu-1",
		["west"] = "tls/shanlu-3",
	},
}
Room {
	id = "tls/shanlu-3",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["east"] = "tls/shanlu-2",
		["west"] = "tls/shanlu-4",
	},
}
Room {
	id = "tls/shanlu-4",
	name = "ʯ��·",
	outdoor = "������",
	ways = {
		["east"] = "tls/shanlu-3",
		["west"] = "tls/talin",
	},
}
Room {
	id = "tls/shaochong",
	name = "�ٳ�",
}
Room {
	id = "tls/shaoshang",
	name = "����",
}
Room {
	id = "tls/shaoze",
	name = "����",
}
Room {
	id = "tls/shiyuan",
	name = "���ʴ�ʿԺ",
	outdoor = "������",
	ways = {
		["north"] = "tls/road5",
		["southdown"] = "tls/3wg",
		["west"] = "tls/qxg",
	},
}
Room {
	id = "tls/sjt",
	name = "�о���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "tls/yz6",
		["north"] = "tls/gmd",
	},
}
Room {
	id = "tls/songlin",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "tls/songlin2",
		["south"] = "tls/songlin1",
		["west"] = "tls/lang",
		["east"] = "tls/lang2",
	},
	lengths = {
		["north"] = 10,
	},
}
Room {
	id = "tls/songlin1",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "tls/songlin2",
	},
}
Room {
	id = "tls/songlin2",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "tls/songlin1",
		["west"] = "tls/songlin-3",
	},
}
Room {
	id = "tls/songlin-1",
	name = "������",
	outdoor = "������",
	ways = {
	    ["east"]  =  "tls/songlin-2",
		["north"] =  "tls/songlin-4",
		["west"]  =  "tls/songlin-3",
	},
	lengths = {
	    ["north"] = 3,
	},
}
Room {
	id = "tls/songlin-2",
	name = "������",
	outdoor = "������",
	ways = {
	    ["east"]  =  "tls/songlin-4",
		["west"]  =  "tls/songlin-3",
	},
}
Room {
	id = "tls/songlin-3",
	name = "������",
	outdoor = "������",
	ways = {
	    ["south"] = "tls/songlin-1",
	    ["east"] =  "tls/songlin-2",
		["west"] =  "tls/songlin-4",
	},
	lengths = {
	    ["east"] = 3,
		["west"] = 3,
	},
}
Room {
	id = "tls/songlin-4",
	name = "������",
	outdoor = "������",
	ways = {
	    ["south"] = "tls/songlin-3",
		["west"] =  "tls/songlin-1",
		["#outTlsSsl"] = "tls/yuhua1",
	},
	lengths = {
		["#outTlsSsl"] = 20,
	},
}
--Room {
--	id = "tls/songlin-n",
--	name = "������",
--	ways = {
--		["e;e;w;w;s;s;n;n;e;e;w;w;s;s;n;n;#outTlsSsl"] = "tls/yuhua1",
--	},
--	lengths = {
--		["e;e;w;w;s;s;n;n;e;e;w;w;s;s;n;n;#outTlsSsl"] = 2,
--	},
--}
Room {
	id = "tls/sroom",
	name = "��Ϣ��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["east"] = "tls/sroom2",
		["west"] = "tls/sroom1",
	},
}
Room {
	id = "tls/sroom1",
	name = "��Ϣ��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["east"] = "tls/sroom",
	},
}
Room {
	id = "tls/sroom2",
	name = "��Ϣ��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/road4",
		["west"] = "tls/sroom",
	},
}
Room {
	id = "tls/ta1",
	name = "ǧѰ����",
	outdoor = "������",
	ways = {
		["south"] = "tls/yz6",
		["north"] = "tls/yz3",
	},
}
Room {
	id = "tls/ta2",
	name = "���౦��",
	outdoor = "������",
	ways = {
		["south"] = "tls/yz4",
	},
}
Room {
	id = "tls/ta3",
	name = "��ס����",
	outdoor = "������",
	ways = {
		["south"] = "tls/yz5",
	},
}
Room {
	id = "tls/talin",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "tls/shanlu-4",
	},
}
Room {
	id = "tls/twd",
	name = "������",
	outdoor = "������",
	ways = {
		["northdown"] = "tls/road1",
		["southdown"] = "tls/road",
	},
}
Room {
	id = "tls/wfd",
	name = "���",
	outdoor = "������",
	ways = {
		["enter"] = "tls/wfd2",
		["up"] = "tls/wxt",
	},
}
Room {
	id = "tls/wfd2",
	name = "���",
	outdoor = "������",
	ways = {
		["north"] = "tls/wfd3",
		["out"] = "tls/wfd",
	},
}
Room {
	id = "tls/wfd3",
	name = "����ڶ�",
	outdoor = "������",
	ways = {
		["south"] = "tls/wfd2",
	},
}
Room {
	id = "tls/wujingge",
	name = "�޾���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/men1",
	},
}
Room {
	id = "tls/wuping",
	name = "��Ʒ��",
	outdoor = "������",
	ways = {
		["south"] = "tls/cby",
	},
}
Room {
	id = "tls/wuwoge",
	name = "���Ҹ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/men2",
	},
}
Room {
	id = "tls/wwj",
	name = "���޾�",
	outdoor = "������",
	ways = {
		["south"] = "tls/road2",
		["north"] = "tls/yuhua",
		["east"] = "tls/road3",
	},
}
Room {
	id = "tls/wxj",
	name = "���ľ�",
	outdoor = "������",
	ways = {
		["west"] = "tls/bzqn",
	},
}
Room {
	id = "tls/wxt",
	name = "��ѩͤ",
	outdoor = "������",
	ways = {
		["down"] = "tls/wfd",
		["southdown"] = "tls/fqg",
	},
}
Room {
	id = "tls/xdt",
	name = "С����",
	outdoor = "������",
	ways = {
		["west"] = "tls/songlin-2",
	},
}
Room {
	id = "tls/xiuxishi1",
	name = "��Ϣ��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["north"] = "tls/men3",
	},
}
Room {
	id = "tls/xiuxishi2",
	name = "��Ϣ��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["north"] = "tls/men4",
	},
}
Room {
	id = "tls/xmd",
	name = "���ֵ�",
	outdoor = "������",
	ways = {
		["south"] = "tls/ytd",
		["west"] = "tls/yz3",
	},
}
Room {
	id = "tls/yaofang",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["north"] = "tls/yaotai",
	},
	objs = {
          ["������ʦ"] = "liaoming chanshi",
     },
}
Room {
	id = "tls/yaoshidian",
	name = "ҩʦ��",
	outdoor = "������",
	ways = {
		["south"] = "tls/gulou",
		["northeast"] = "tls/yz4",
		["west"] = "tls/baodian",
	},
}
Room {
	id = "tls/yaotai",
	name = "�嶼��̨",
	outdoor = "������",
	ways = {
		["northup"] = "tls/road2",
		["eastup"] = "tls/banruo",
		["south"] = "tls/yaofang",
		["west"] = "tls/men3",
	},
	nolooks = {
		["west"] = true,
	},
	precmds = {
		["west"] = "open door",
	},
	objs = {
          ["������ʦ"] = "liaoqing chanshi",
     },
}
Room {
	id = "tls/ylf",
	name = "Ӧ�ַ�",
	outdoor = "������",
	ways = {
		["northdown"] = "tls/ylf2",
		["southdown"] = "tls/ylf1",
	},
}
Room {
	id = "tls/ylf1",
	name = "Ӧ�ַ���",
	outdoor = "������",
	ways = {
		["northup"] = "tls/ylf",
		["south"] = "tls/dc1",
	},
}
Room {
	id = "tls/ylf2",
	name = "Ӧ�ַ山",
	outdoor = "������",
	ways = {
		["southup"] = "tls/ylf",
		["north"] = "tls/shanlu",
	},
	objs = {
          ["��¹"] = "huang lu",
          ["Ұ��"] = "ye zhu",
     },
}
Room {
	id = "tls/ytd",
	name = "Բͨ��",
	outdoor = "������",
	ways = {
		["north"] = "tls/xmd",
		["west"] = "tls/yz6",
	},
}
Room {
	id = "tls/yuhua",
	name = "�껨Ժ",
	outdoor = "������",
	ways = {
		["south"] = "tls/wwj",
		["enter"] = "tls/yuhua1",
		["east"] = "tls/songlin2",
	},
	lengths = {
	    ["east"] = 15,
	},
}
Room {
	id = "tls/yuhua1",
	name = "�껨��",
	outdoor = "������",
	ways = {
		["north"] = "tls/road7",
		["out"] = "tls/yuhua",
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = "tls/lsy",
	--	["#toXdt"] = "tls/xdt",
	},
	nolooks = {
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = true,
	--	["#toXdt"] = true,
	},
	lengths = {
		["n;n;n;n;n;n;n;n;w;w;w;w;w"] = 13,
	--	["#toXdt"] = "if 1<0 then return false else return 50 end",
	},
	objs = {
          ["��˼��ʦ"] = "liaosi chanshi",
     },
}
Room {
	id = "tls/yz1",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["north"] = "tls/zt1",
		["east"] = "tls/road",
	},
}
Room {
	id = "tls/yz2",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["north"] = "tls/zt",
		["west"] = "tls/road",
	},
}
Room {
	id = "tls/yz3",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["northup"] = "tls/road4",
		["south"] = "tls/ta1",
		["east"] = "tls/xmd",
		["west"] = "tls/gmd",
	},
}
Room {
	id = "tls/yz4",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["southwest"] = "tls/yaoshidian",
		["north"] = "tls/ta2",
		["east"] = "tls/men3",
		["west"] = "tls/men1",
	},
}
Room {
	id = "tls/yz5",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["southeast"] = "tls/dizangdian",
		["north"] = "tls/ta3",
		["east"] = "tls/men2",
		["west"] = "tls/men4",
	},
}
Room {
	id = "tls/yz6",
	name = "����Ժ",
	outdoor = "������",
	ways = {
		["southup"] = "tls/gfd",
		["east"] = "tls/ytd",
		["north"] = "tls/ta1",
		["west"] = "tls/sjt",
	},
}
Room {
	id = "tls/zhongchong",
	name = "�г�",
}
Room {
	id = "tls/zhonglou",
	name = "��¥",
	outdoor = "������",
	ways = {
		["south"] = "tls/zt1",
		["east"] = "tls/road1",
		["north"] = "tls/dizangdian",
	},
}
Room {
	id = "tls/zt",
	name = "������ի��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/yz2",
		["north"] = "tls/gulou",
	},
	objs = {
          ["����"] = "da wan",
     },
}
Room {
	id = "tls/zt1",
	name = "������ի��",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "tls/yz1",
		["north"] = "tls/zhonglou",
		["west"] = "tls/chufang",
	},
	objs = {
          ["���"] = "qing cai",
          ["����"] = "da wan",
          ["�׷�"] = "rice",
     },
}
Room {
	id = "village/caidi",
	name = "�˵�",
	ways = {
		["#hscaidi"] = "village/zhongxin",
	},
	nolooks = {
		["#hscaidi"] = true,
		["south"] = true,
		["north"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["#hscaidi"] = 3,
	},
}
Room {
	id = "village/eexit",
	name = "�����",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "huashan/path1",
		["west"] = "village/shilu6",
	},
  room_relative="��ʯ·----�����----ɽ���¶����",
}
Room {
	id = "village/shilu6",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/minfang2",
		["east"] = "village/eexit",
		["west"] = "village/shilu4",
	},
	room_relative="��ʯ·----��ʯ·----����ڣ�����ʯ·",
}
Room {
	id = "village/shilu4",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "village/zahuopu",
		["east"] = "village/shilu6",
		["west"] = "village/zhongxin",
	},
	room_relative="�ӻ��̣�������----��ʯ·----��ʯ·��ʯ·",
}
Room {
	id = "village/zhongxin",
	name = "������",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/shilu2",
		["east"] = "village/shilu4",
		["west"] = "village/shilu3",
		["northwest"] = "village/caidi",
		["northeast"] = "village/caidi",
	},
	postcmds = {
		["northwest"] = "#walkBusy",
		["northeast"] = "#walkBusy",
	},
	lengths = {
		["northwest"] = 3,
		["northeast"] = 3,
	},
	room_relative="��ʯ·----������----��ʯ·����ʯ·������",
}
Room {
	id = "village/shilu3",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "village/zhongxin",
		["north"] = "village/jiusi",
		["west"] = "village/shilu5",
	},
	room_relative="��������ʯ·----��ʯ·----��������ʯ·",
}
Room {
	id = "village/shilu5",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/miaoyu",
		["northwest"] = "group/entry/caeroad3",
		["east"] = "village/shilu3",
	},
	room_relative="��·�I��ʯ·----��ʯ·����̳����ʯ·",
}
Room {
	id = "village/shilu2",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/shilu1",
		["north"] = "village/zhongxin",
		["east"] = "village/tiejiangpu",
	},
	room_relative="�����ģ���ʯ·----�����̣���ʯ·��ʯ·",
}
Room {
	id = "village/shilu1",
	name = "��ʯ·",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/sexit",
		["north"] = "village/shilu2",
		["west"] = "village/minfang1",
	},
	room_relative="��ʯ·����----��ʯ·���ϴ����ʯ·",
}
Room {
	id = "village/hsroad3",
	name = "����·",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "xiangyang/shanxiroad2",
		["north"] = "village/sexit",
	},
	room_relative="�ϴ�ڣ�����·����·����·",
}
Room {
	id = "village/jiusi",
	name = "����",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/shilu3",
	},
	room_relative="��������ʯ·����",
}
Room {
	id = "village/miaoyu",
	name = "��̳��",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "village/shilu5",
	},
	room_relative="��ʯ·����̳����̳��",
}
Room {
	id = "village/minfang1",
	name = "��",
	outdoor = "��ɽ��",
	ways = {
		["east"] = "village/shilu1",
	},
	room_relative="��-----��ʯ·��",
}
Room {
	id = "village/minfang2",
	name = "��",
	outdoor = "��ɽ��",
	ways = {
		["north"] = "village/shilu6",
	},
	room_relative="��ʯ·������",
}
Room {
	id = "village/sexit",
	name = "�ϴ��",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/hsroad3",
		["north"] = "village/shilu1",
	},
	room_relative="��ʯ·���ϴ�ڣ�����·�ϴ��",
}

Room {
	id = "village/tiejiangpu",
	name = "������",
	outdoor = "��ɽ��",
	ways = {
		["west"] = "village/shilu2",
	},
	room_relative="��ʯ·----������������",
}
Room {
	id = "village/zahuopu",
	name = "�ӻ���",
	outdoor = "��ɽ��",
	ways = {
		["south"] = "village/shilu4",
	},
	room_relative="�ӻ��̣���ʯ·�ӻ���",
}


Room {
	id = "wizard/guest_room",
	name = "�����",
	ways = {
		["southeast"] = "city/chmiao",
		-- ["up"] = "wizard/wizard_room",
	},
	nolooks = {
		["up"] = true,
	},
}
Room {
	id = "wizard/lt",
	name = "�����",
	ways = {
		["south"] = "wizard/ltc",
		["north"] = "wizard/ltd",
		["east"] = "wizard/lta",
		["west"] = "wizard/ltb",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt1",
	name = "������",
	ways = {
		["south"] = "wizard/lt1c",
		["north"] = "wizard/lt1d",
		["east"] = "wizard/lt1a",
		["west"] = "wizard/lt1b",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt1a",
	name = "�����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1b",
	name = "�����Ŷ���̨",
	ways = {
		["east"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1c",
	name = "�����Ŷ���̨",
	ways = {
		["north"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt1d",
	name = "�����Ŷ���̨",
	ways = {
		["south"] = "wizard/lt1",
	},
}
Room {
	id = "wizard/lt2",
	name = "������",
	ways = {
		["south"] = "wizard/lt2c",
		["north"] = "wizard/lt2d",
		["east"] = "wizard/lt2a",
		["west"] = "wizard/lt2b",
		["out"] = "xiangyang/guangc",
	},
}
Room {
	id = "wizard/lt2a",
	name = "�����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2b",
	name = "�����Ŷ���̨",
	ways = {
		["east"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2c",
	name = "�����Ŷ���̨",
	ways = {
		["north"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lt2d",
	name = "�����Ŷ���̨",
	ways = {
		["south"] = "wizard/lt2",
	},
}
Room {
	id = "wizard/lta",
	name = "����Ŷ���̨",
	ways = {
		["west"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltb",
	name = "���������̨",
	ways = {
		["east"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltc",
	name = "������Ͽ�̨",
	ways = {
		["north"] = "wizard/lt",
	},
}
Room {
	id = "wizard/ltd",
	name = "����ű���̨",
	ways = {
		["south"] = "wizard/lt",
	},
}
Room {
	id = "wizard/wizard_meet",
	name = "��ʦ������",
	ways = {
		["down"] = "wizard/guest_room",
		["west"] = "wizard/wizard_room",
	},
}
Room {
	id = "wizard/wizard_room",
	name = "��ʦ��Ϣ��",
	ways = {
		["down"] = "wizard/guest_room",
		["up"] = "wizard/zoulang",
	},
}
Room {
	id = "wizard/zoulang",
	name = "����",
}
Room {
	id = "wudang/caihong",
	name = "���ʺ�",
	outdoor = "�䵱ɽ",
	ways = {
		["northup"] = "wudang/wangbei",
		["southup"] = "wudang/shibapan",
	},
	room_relative="�����¡����ʺ��ʮ�������ʺ�",
}
Room {
	id = "wudang/chating",
	name = "��ͤ",
	outdoor = "�䵱ɽ",
	ways = {
		["northwest"] = "wudang/wdroad8",
	},
	objs = {
          ["�һ�����"] = "tao hua",
           },
   room_relative="ɽ���¨I��ͤ��ͤ",
}
Room {
	id = "wudang/chufang",
	name = "����",
	outdoor = "�䵱ɽ",
	no_fight = true,
	ways = {
		["west"] = "wudang/donglang2",
	},
	objs = {
          ["�����"] = "dawan cha",
          ["���"] = "xiang cha",
           },
	room_relative="��������--����",
}
Room {
	id = "wudang/donglang1",
	name = "��������",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/xiuxishi2",
		["east"] = "wudang/xiaolu1",
		["west"] = "wudang/jingge",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='Ů' then return 1 else return false end",
	},
	room_relative="�ؾ���---��������---С����Ů��Ϣ����������",
}
Room {
	id = "wudang/donglang2",
	name = "��������",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/xiuxishi1",
		["east"] = "wudang/chufang",
		["west"] = "wudang/xiaolu1",
	},
	lengths = {
		["south"] = "if score.gender and score.gender=='��' then return 1 else return false end",
	},
	room_relative="С��---��������---����������Ϣ�Ҷ�������",
}
Room {
	id = "wudang/feisheng",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["northeast"] = "wudang/zhenqing",
	},
	room_relative="�������칬�J�����·�����",
}
Room {
	id = "wudang/fuzhen",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["westup"] = "wudang/shijie2",
		["northdown"] = "wudang/shibapan",
		["west"] = "wudang/laojun",
	},
	objs = {
          ["�������"] = "guxu daozhang",
		  ["��ͯ"] = "dao tong",
           },
	room_relative="ʮ���̡��Ͼ���----����۸����",
}
Room {
	id = "wudang/gchang",
	name = "�䵱�㳡",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/zhenqing",
		["north"] = "wudang/nanyan",
},
	objs = {
        ["��ͯ"] = "dao tong",
	},
	room_relative="��ʥ���ҹ����䵱�㳡���������칬�䵱�㳡",
}
Room {
	id = "wudang/gsdao1",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/yuanhe",
		["northdown"] = "wudang/shijie1",
	},
	room_relative="ʯ�ס��������Ԫ�͹۹����",
}
Room {
	id = "wudang/gsdao2",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/yuzhen",
		["northdown"] = "wudang/yuanhe",
	},
	room_relative="Ԫ�͹ۡ�����������湬�����",
}
Room {
	id = "wudang/gsdao3",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["southwest"] = "wudang/leishen",
		["east"] = "wudang/zhanqi",
	},
	room_relative="�����----չ���L���񶴹����",
}
Room {
	id = "wudang/gsdao4",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/shijie4",
		["northdown"] = "wudang/zhenqing",
	},
	room_relative="�������칬���������ʯ�׹����",
}
Room {
	id = "wudang/gsdao5",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/langmei",
		["northdown"] = "wudang/shijie4",
	},
	room_relative="ʯ�ס����������÷�������",
}
Room {
	id = "wudang/gsdao6",
	name = "�����",
	outdoor = "�䵱ɽ",
	ways = {
		["westdown"] = "wudang/qtguan",
		["eastup"] = "wudang/hldong",
	},
	room_relative="��̨�ۡ�������������������",
}
Room {
	id = "wudang/hldong",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/taihe",
		["westdown"] = "wudang/gsdao6",
	},
	room_relative="�������������������̫�͹�������",
}
Room {
	id = "wudang/houshan/hsxl1",
	name = "С·",
	outdoor = "�䵱��ɽ",
	ways = {
		["northdown"] = "wudang/houshan/hsxl2",
		["pa up"] = "wudang/houshan/taoyuan1",
	},
	nolooks = {
		["pa up"] = true,
	},
	room_relative="ɽ·��С·С·",
}
Room {
	id = "wudang/houshan/hsxl2",
	name = "ɽ·",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/hsxl1",
		["northdown"] = "wudang/houshan/hsxl3",
	},
	room_relative="ɽ·��ɽ·��С·ɽ·",
}
Room {
	id = "wudang/houshan/hsxl3",
	name = "ɽ·",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/hsxl2",
		["northdown"] = "wudang/houshan/hsxl4",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "wudang/houshan/hsxl4",
	name = "ɽ·",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/hsxl3",
		["northdown"] = "wudang/houshan/hsxl5",
	},
	room_relative="С·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "wudang/houshan/hsxl5",
	name = "С·",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/hsxl4",
		["northwest"] = "wudang/shanlu2",
	},
	room_relative="ɽ·�IС·��ɽ·С·",
}
Room {
	id = "wudang/houshan/maowu",
	name = "é��",
	outdoor = "�䵱��ɽ",
	ways = {
		["north"] = "wudang/houshan/taoyuan3",
	},
	objs = {
          ["��������"] = "lao weng",  
  
	},
	room_relative="ɽ��é��",
}
Room {
	id = "wudang/houshan/taoyuan1",
	name = "�嶥",
	outdoor = "�䵱��ɽ",
	ways = {
		["east"] = "wudang/houshan/taoyuan3",
		["down"] = "wudang/houshan/hsxl1",
		["west"] = "wudang/houshan/taoyuan2",
	},
	room_relative="ɽ����С·----ɽ���嶥",
}
Room {
	id = "wudang/houshan/taoyuan3",
	name = "ɽ��",
	outdoor = "�䵱��ɽ",
	ways = {
		["west"] = "wudang/houshan/taoyuan1",
		["#Wdmw"] = "wudang/houshan/maowu",
	},
	nolooks = {
		["#Wdmw"] = true,
	},
	lengths = {
		["#Wdmw"] = 100,
	},
}
-----------------by fqyy 20170508 �䵱��ɽ���ִ���--------------
Room {
	id = "wudang/houshan/taoyuan2",
	name = "ɽ��",
	outdoor = "�䵱��ɽ",
	ways = {
		["east"] = "wudang/houshan/taoyuan1",
		["#inWdcl"] = "wudang/houshan/gudi",
	},
	nolooks = {
		["#inWdcl"] = true,
	},
	lengths = {
		["#inWdcl"] = "if skills['hand'] and skills['hand'].lvl>80 and skills['dodge'] and skills['dodge'].lvl>100 and skills['force'] and skills['force'].lvl>100 then return 100 else return false end",
	},
}
Room {
	id = "wudang/houshan/gudi",
	name = "�ȵ�",
	outdoor = "�䵱��ɽ",
	ways = {
		["southeast"] = "wudang/houshan/clbinyuan1",
	},
}
Room {
	id = "wudang/houshan/clbinyuan1",
	name = "���ֱ�Ե",
	outdoor = "�䵱��ɽ",
	ways = {
		["northwest"] = "wudang/houshan/gudi",
		["zuan conglin"] = "wudang/houshan/conglinlh",
	},
	nolooks = {
		["zuan conglin"] = true,
	},
	room_relative="�ȵרI���ֱ�Ե���ֱ�Ե",
}
Room {
	id = "wudang/houshan/conglinlh",
	name = "�һ����",
	outdoor = "�䵱��ɽ",
	ways = {
		["#outWdcllh"] = "wudang/houshan/conglinly",
	},
	nolooks = {
		["#outWdcllh"] = true,
	},
}
Room {
	id = "wudang/houshan/conglinly",
	name = "��Ҷ����",
	outdoor = "�䵱��ɽ",
	ways = {
		["#outWdclly"] = "wudang/houshan/conglinjx",
	},
	nolooks = {
		["#outWdclly"] = true,
	},
	--blocks = {
	--	["#outWdclly"] = {
	--		{id = "du she", exp = 10000},
	--		{id = "ju mang", exp = 10000},
	--		{id = "Ye zhu", exp = 10000},			
	--	},
	--},
}
Room {
	id = "wudang/houshan/conglinjx",
	name = "��ѩ����",
	outdoor = "�䵱��ɽ",
	ways = {
		["#outWdcljx"] = "wudang/houshan/conglinky",
	},
	nolooks = {
		["#outWdcljx"] = true,
	},
	--blocks = {
	--	["#outWdcljx"] = {
	--		{id = "bai xiong", exp = 10000},
	--		{id = "bao zi", exp = 10000},
	--		{id = "lao hu", exp = 10000},
	--	},
	--},
}
Room {
	id = "wudang/houshan/conglinky",
	name = "��Ҷ����",
	outdoor = "�䵱��ɽ",
	ways = {
		["#outWdclky"] = "wudang/houshan/clbianyuan2",
	},
	nolooks = {
		["#outWdclky"] = true,
	},
}
Room {
	id = "wudang/houshan/clbianyuan2",
	name = "���ֱ�Ե",
	outdoor = "�䵱��ɽ",
	ways = {
		["#wdclToHsda"] = "xiangyang/hanshui2",
	},
	nolooks = {
		["#wdclToHsda"] = true,
	},
	room_relative="��Ҷ������Ҷ������Ҷ���֨I���J���ֱ�Ե����Ҷ���ִ��ֱ�Ե",
}
-----------------------------------------------------------------
Room {
	id = "wudang/houyuan",
	name = "��ɽСԺ",
	outdoor = "�䵱ɽ",
	ways = {
		["north"] = "wudang/yuanmen",
	},
	nolooks = {
		["north"] = true,
	},
	precmds = {
		["north"] = "open door",
	},
	objs = {
          ["������"] = "zhang sanfeng",
           },
}
Room {
	id = "wudang/jindian",
	name = "���",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/taihe",
	},
	room_relative="���-----����̫�͹����",
}
Room {
	id = "wudang/jingge",
	name = "�ؾ���",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/donglang1",
	},
	objs = {
          ["���¾�����һ�¡�"] = "jing",
           },
	room_relative="��������--�ؾ���",
}
Room {
	id = "wudang/langmei",
	name = "��÷��",
	outdoor = "�䵱ɽ",
	ways = {
		["westup"] = "wudang/qtguan",
		["northwest"] = "wudang/yxyan",
		["east"] = "wudang/shanlu2",
		["northdown"] = "wudang/gsdao5",
	},
	room_relative="�����ҹ�����I����̨�ۡ���÷��----ɽ·��÷��",
}
Room {
	id = "wudang/laojun",
	name = "�Ͼ���",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/fuzhen",
	},
	room_relative="�Ͼ���----������Ͼ���",
}
Room {
	id = "wudang/ldfang",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["west"] = "wudang/zoulang2",
	},
	objs = {
          ["�����"] = "yu daiyan",
           },
	room_relative="��������----������������",
}
Room {
	id = "wudang/leishen",
	name = "����",
	outdoor = "�䵱ɽ",
	ways = {
		["northeast"] = "wudang/gsdao3",
	},
	room_relative="������J��������",
}
Room {
	id = "wudang/lgfang",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/zoulang1",
	},
	objs = {
          ["ܽ�ؽ���"] = "furong jinzhen",
           },
	room_relative="������������������",	   
}
Room {
	id = "wudang/lwhole",
	name = "ʯ���Ҷ�",
	outdoor = "�䵱ɽ",
	no_fight = true,
	ways = {
		["out"] = "wudang/wanniansong",
	},
}
Room {
	id = "wudang/mozhen",
	name = "ĥ�뾮",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/wangbei",
		["eastup"] = "wudang/yuxuyan",
		["northdown"] = "wudang/yuxu",
	},
	room_relative="���鹬��ĥ�뾮�������ҡ�������ĥ�뾮",
}
Room {
	id = "wudang/nanyan",
	name = "��ʥ���ҹ�",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/gchang",
		["northdown"] = "wudang/zixia",
	},
	objs = {
          ["������"] = "chen yunqing",
		  ["��ͯ"] = "dao tong",
           },
	room_relative="����������ʥ���ҹ����䵱�㳡��ʥ���ҹ�",
}
Room {
	id = "wudang/qtguan",
	name = "��̨��",
	outdoor = "�䵱ɽ",
	ways = {
		["eastdown"] = "wudang/langmei",
		["eastup"] = "wudang/gsdao6",
	},
	room_relative="��̨�ۡ���÷����̨��",
}
Room {
	id = "wudang/sanqing",
	name = "�����",
	outdoor = "�䵱ɽ",
	no_fight = true,
	ways = {
		["south"] = "wudang/xiaolu1",
		["north"] = "wudang/zoulang1",
		["out"] = "wudang/zhenqing",
	},
	objs = {
          ["��Զ��"] = "song yuanqiao",
          ["̫������ͼ"] = "board",
           },
	room_relative="���ȣ�������С�������",
}
Room {
	id = "wudang/shanlu1",
	name = "ɽ·",
	outdoor = "�䵱ɽ",
	ways = {
		["westup"] = "wudang/yuxu",
		["northdown"] = "wudang/wdbolin",
	},
	room_relative="�䵱���֡����鹬��ɽ·ɽ·",
}
Room {
	id = "wudang/shanlu2",
	name = "ɽ·",
	outdoor = "�䵱ɽ",
	ways = {
		["southeast"] = "wudang/houshan/hsxl5",
		["west"] = "wudang/langmei",
		["give caiyao yao chu"] = "wudang/houshan/gudao1",
	},
	objs = {
          ["��ҩ����"] = "caiyao daozhang",
    },
	room_relative="��÷��-----ɽ·�KС·ɽ·",
	nolooks = {
		["give caiyao yao chu"] = true,
	},
	lengths = {
		["give caiyao yao chu"] = "if Bag['ҩ��'] then return 15 else return false end",
	},
}
----------fqyy ����--------------
Room {
	id = "wudang/houshan/gudao1",
	name = "�ŵ�",
	outdoor = "�䵱��ɽ",
	ways = {
		["eastup"] = "wudang/houshan/gudao2",
		["#OutWdhs"] = "wudang/shanlu2",
	},
	objs = {
          ["����"] = "du she",
    },
	room_relative="ɽ·���ŵ����ŵ��ŵ�",
	lengths = {
		["#OutWdhs"] = 15,
	},
	
}
Room {
	id = "wudang/houshan/gudao2",
	name = "�ŵ�",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/husunchou",
		["northdown"] = "wudang/houshan/gudao3",
		["westdown"] = "wudang/houshan/gudao1",
	},
	objs = {
          ["�ϻ�"] = "lao hu",
    },
	room_relative="�ŵ����ŵ����ŵ��������ŵ�",
}
Room {
	id = "wudang/houshan/gudao3",
	name = "�ŵ�",
	outdoor = "�䵱��ɽ",
	ways = {
		["southup"] = "wudang/houshan/gudao2",
	},
	objs = {
          ["Ұ��"] = "ye tu",
    },
	room_relative="�ŵ����ŵ��ŵ�",
}
Room {
	id = "wudang/houshan/husunchou",
	name = "�����",
	outdoor = "�䵱��ɽ",
	ways = {
		["northdown"] = "wudang/houshan/gudao2",
	},
	objs = {
          ["����"] = "hou zi",
    },
}
----------------------------------
Room {
	id = "wudang/shanlu3",
	name = "��ľ��",
	outdoor = "�䵱ɽ",
	ways = {
		["west"] = "wudang/shanlu2",
	},
}
Room {
	id = "wudang/shibapan",
	name = "ʮ����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/fuzhen",
		["northdown"] = "wudang/caihong",
	},
	room_relative="���ʺ��ʮ���̡������ʮ����",
}
Room {
	id = "wudang/shijie1",
	name = "ʯ��",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/gsdao1",
		["northdown"] = "wudang/xuanyue",
	},
	room_relative="�����š�ʯ�ס������ʯ��",
}
Room {
	id = "wudang/shijie2",
	name = "ʯ��",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/zhanqi",
		["eastdown"] = "wudang/fuzhen",
	},
	objs = {
          ["�����"] = "jinxiang ke",
	},
	room_relative="ʯ�ס�����ۡ�չ���ʯ��",
}
Room {
	id = "wudang/shijie3",
	name = "ʯ��",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/zxgdamen",
		["northdown"] = "wudang/zhanqi",
	},
	room_relative="չ����ʯ�ס�����������ʯ��",
}
Room {
	id = "wudang/shijie4",
	name = "ʯ��",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/gsdao5",
		["northdown"] = "wudang/gsdao4",
	},
	room_relative="�������ʯ�ס������ʯ��",
}
Room {
	id = "wudang/taihe",
	name = "����̫�͹�",
	outdoor = "�䵱ɽ",
	ways = {
		["northdown"] = "wudang/hldong",
		["west"] = "wudang/jindian",
	},
	room_relative="�����������--����̫�͹�����̫�͹�",
}
Room {
	id = "wudang/wangbei",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["northdown"] = "wudang/mozhen",
		["southdown"] = "wudang/caihong",
	},
	room_relative="ĥ�뾮�������¡����ʺ�������",
}
Room {
	id = "wudang/wanniansong",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["enter"] = "wudang/lwhole",
	},
	room_relative="ʯ���Ҷ�--������",
}
Room {
	id = "wudang/wdbolin",
	name = "�䵱����",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/shanlu1",
		["eastdown"] = "wudang/yuzhen",
	},
	room_relative="�䵱���֡����湬��ɽ·�䵱����",
}

Room {
	id = "wudang/wdroad6",
	name = "����·",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "xiangyang/hanshui2",
		["west"] = "group/entry/wdroad7",
	},
	objs = {
		["Ȫ����"] = "quan jiannan",
		["���������"] = "qinglong dizi",
		 },
   room_relative="����·----����·----��ˮ��������·",
}
Room {
	id = "wudang/wdroad8",
	name = "ɽ����",
	outdoor = "�䵱ɽ",
	ways = {   
		["southeast"] = "wudang/chating",
		["east"] = "group/entry/wdroad7",
		["west"] = "wudang/xuanyue",
	}, 
	room_relative="������----ɽ����----����·�K��ͤɽ����",
}
Room {
	id = "wudang/wulong",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["eastdown"] = "wudang/yxyan",
	},
	room_relative="��������������������",
}
Room {
	id = "wudang/xiaolu1",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/xiaolu2",
		["north"] = "wudang/sanqing",
		["east"] = "wudang/donglang2",
		["west"] = "wudang/donglang1",
	},
	objs = {
	    ["������"] = "yu lianzhou",
	},
	room_relative="��������������-----С��-----�������ȣ�С��С��",
}
Room {
	id = "wudang/xiaolu2",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/yuanmen",
		["north"] = "wudang/xiaolu1",
		--["#wdYm"] = "wudang/yuanmen",
		["s"] = "wudang/xiaolu3",
	},
	lengths = {
		["south"] = "if score.master and hp.shen>=0 and score.master=='������' then return 3 else return false end",
		--["#wdYm"] = "if score.master and score.master=='������' then return false else return 5 end",
		["s"] = "if score.master and score.master=='������' then return false else return 1 end",
	},
}
Room {
	id = "wudang/xiaolu3",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/xiaolu4",
		["west"] = "wudang/xiaolu5",
		["north"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu4",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu5",
		["south"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu5",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu4",
		["south"] = "wudang/xiaolu6",
	},
}
Room {
	id = "wudang/xiaolu6",
	name = "С��",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/xiaolu3",
		["west"] = "wudang/xiaolu4",
		["south"] = "wudang/xiaolu5",
		["north;north;north;north;north;north;north;north;north;north"] = "wudang/lgfang",
		["#wdYm"] = "wudang/yuanmen",
	},
	lengths = {
	    ["north;north;north;north;north;north;north;north;north;north"] = 10,
		["#wdYm"] = 5,
	},
}

Room {
	id = "wudang/xiuxishi1",
	name = "����Ϣ��",
	no_fight = true,
	ways = {
		["north"] = "wudang/donglang2",
	},
	room_relative="��������--����Ϣ��",
}
Room {
	id = "wudang/xiuxishi2",
	name = "Ů��Ϣ��",
	outdoor = "�䵱ɽ",
	no_fight = true,
	ways = {
		["north"] = "wudang/donglang1",
	},
	room_relative="��������--Ů��Ϣ��",
}
Room {
	id = "wudang/xuanyue",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/shijie1",
		["east"] = "wudang/wdroad8",
	},
	room_relative="������----ɽ���¡�ʯ��������",
}
Room {
	id = "wudang/yaofang",
	name = "ҩ��",
	outdoor = "�䵱ɽ",
	no_fight = true,
	ways = {
		["east"] = "wudang/zoulang3",
	},
	objs = {
          ["��¯"] = "dan lu",
           },
	room_relative="ҩ��-----��������ҩ��",	   
}
Room {
	id = "wudang/yuanhe",
	name = "Ԫ�͹�",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/gsdao2",
		["east"] = "wudang/yuanhe1",
		["northdown"] = "wudang/gsdao1",
	
  },
  room_relative="�������Ԫ�͹�----Ԫ�͹۴��������Ԫ�͹�",
}
Room {
	id = "wudang/yuanhe1",
	name = "Ԫ�͹۴��",
	outdoor = "�䵱ɽ",
	ways = {
		["west"] = "wudang/yuanhe",
	},
	room_relative="Ԫ�͹�--Ԫ�͹۴��Ԫ�͹۴��",
}
Room {
	id = "wudang/yuanmen",
	name = "Ժ��",
	outdoor = "�䵱ɽ",
	ways = {
		["ask yin liting about ����ܽ;open door;south"] = "wudang/houyuan",
		["north;north;north;north;north;north;north;north;north;north"] = "wudang/lgfang",
		["north"] = "wudang/xiaolu2",
	},
	nolooks = {
		["south"] = true,
	},
	lengths = {
		["ask yin liting about ����ܽ;open door;south"] = 3 ,
		["north;north;north;north;north;north;north;north;north;north"] = "if score.master and score.master=='������' then return false else return 10 end",
		["north"] = "if score.master and score.master=='������' then return 3 else return false end",
	},
	objs = {
          ["����ͤ"] = "yin liting",
           },
}
Room {
	id = "wudang/yuxu",
	name = "���鹬",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/mozhen",
		["eastdown"] = "wudang/shanlu1",
	},
	room_relative="���鹬��ɽ·��ĥ�뾮���鹬",
}
Room {
	id = "wudang/yuxuyan",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["westdown"] = "wudang/mozhen",
	},
	room_relative="ĥ�뾮��������������",
}
Room {
	id = "wudang/yuzhen",
	name = "���湬",
	outdoor = "�䵱ɽ",
	ways = {
		["westup"] = "wudang/wdbolin",
		["northdown"] = "wudang/gsdao2",
	},
	objs = {
          ["֪�͵���"] = "zhike daozhang",
          ["������"] = "gongde xiang",
           },
  room_relative="��������䵱���֡����湬���湬",
}
Room {
	id = "wudang/yxyan",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["southeast"] = "wudang/langmei",
		["westup"] = "wudang/wulong",
	},
	room_relative="�������������ҨK��÷��������",
}
Room {
	id = "wudang/zhanqi",
	name = "չ���",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/shijie3",
		["northdown"] = "wudang/shijie2",
		["west"] = "wudang/gsdao3",
	},
	room_relative="ʯ�ס������----չ����ʯ��չ���",
}
Room {
	id = "wudang/zhenqing",
	name = "�������칬",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/gsdao4",
		["southwest"] = "wudang/feisheng",
		["enter"] = "wudang/sanqing",
		["north"] = "wudang/gchang",
	
          },
		precmds = {
              ["enter"] = "#walkBusy",
        },
	objs = {
          ["Ī����"] = "mo shenggu",
		  ["��ͯ"] = "dao tong",
           },
	room_relative="�䵱�㳡���������칬�L�������¹�����������칬",
}
Room {
	id = "wudang/zixia",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["southup"] = "wudang/nanyan",
		["out"] = "wudang/zxgdamen",
	},
	objs = {
          ["������"] = "wan qingli",
		  ["��ͯ"] = "dao tong",
           },
	room_relative="����������ʥ���ҹ�������",
}
Room {
	id = "wudang/zoulang1",
	name = "����",
	outdoor = "�䵱ɽ",
	ways = {
		["south"] = "wudang/sanqing",
		["east"] = "wudang/zoulang2",
		["north"] = "wudang/lgfang",
		["west"] = "wudang/zoulang3",
	},
	room_relative="����������������-----����-----�������ȣ����������",
}
Room {
	id = "wudang/zoulang2",
	name = "��������",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/ldfang",
		["west"] = "wudang/zoulang1",
	},
	room_relative="����---��������---��������������",
}
Room {
	id = "wudang/zoulang3",
	name = "��������",
	outdoor = "�䵱ɽ",
	ways = {
		["east"] = "wudang/zoulang1",
		["west"] = "wudang/yaofang",
	},
	room_relative="ҩ��---��������---������������",
}
Room {
	id = "wudang/zxgdamen",
	name = "����������",
	outdoor = "�䵱ɽ",
	ways = {
		["enter"] = "wudang/zixia",
		["northdown"] = "wudang/shijie3",
	},
	objs = {
          ["���ɵ���"] = "fengsong daozhang",
		  ["��ͯ"] = "dao tong",
		            },
	room_relative="ʯ�ס���������������������",
}
Room {
	id = "wuguan/bingqiku",
	name = "������",
	outdoor = "�䵱ɽ",
	ways = {
		["north"] = "wuguan/wuchang3",
	},
	room_relative="��������ʯ������������",
}
Room {
	id = "wuguan/caidi",
	name = "�˵�",
	ways = {
		["south"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/caiyuan",
	name = "��԰",
	ways = {
		["west"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/chaifang",
	name = "��",
	ways = {
		["east"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/chufang",
	name = "����",
	ways = {
		["east"] = "wuguan/zoulang1",
	},
}
Room {
	id = "wuguan/citang",
	name = "������",
	ways = {
		["southwest"] = "wuguan/houhuayuan",
	},
}
Room {
	id = "wuguan/dating",
	name = "��ݴ���",
	ways = {
		["eastdown"] = "wuguan/zoulang5",
		["westdown"] = "wuguan/zoulang2",
		["southeast"] = "wuguan/wupinfang",
		["enter"] = "wuguan/zoulang4",
		["southdown"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/dayuan",
	name = "���ǰԺ",
	ways = {
		["northup"] = "wuguan/dating",
		["south"] = "wuguan/qianting",
		["east"] = "wuguan/shilu4",
		["west"] = "wuguan/shilu3",
	},
}
Room {
	id = "wuguan/houhuayuan",
	name = "��԰",
	ways = {
		["south"] = "wuguan/xiaojing1",
		["northeast"] = "wuguan/citang",
	},
}
Room {
	id = "wuguan/houyuan",
	name = "��Ժ",
	ways = {
		["south"] = "wuguan/shilu1",
		["east"] = "wuguan/caiyuan",
		["north"] = "wuguan/caidi",
		["west"] = "wuguan/chaifang",
	},
}
Room {
	id = "wuguan/huilang",
	name = "����",
	ways = {
		["east"] = "wuguan/xiaojing2",
		["west"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/jiashan",
	name = "��ɽ",
	ways = {
		["south"] = "wuguan/zhulin1",
		["north"] = "wuguan/wxting",
	},
}
Room {
	id = "wuguan/jiashan1",
	name = "��ɽ",
}
Room {
	id = "wuguan/liangong",
	name = "������",
	ways = {
		["north"] = "wuguan/shilu4",
	},
}
Room {
	id = "wuguan/mafang",
	name = "���",
	ways = {
		["north"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/menlang",
	name = "����",
	ways = {
		["north"] = "wuguan/qianting",
		["west"] = "wuguan/yiguan",
		["out"] = "xiangyang/damen",
	},
	--precmds = {
	--	["out"] = "ask sun jun about ���;#walkBusy";
	--},
}
Room {
	id = "wuguan/mishi",
	name = "����",
	ways = {
		["out"] = "wuguan/jiashan1",
	},
}
Room {
	id = "wuguan/mufang",
	name = "ľ��",
	ways = {
		["east"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/pianting1",
	name = "ƫ��",
	ways = {
		["south"] = "wuguan/zoulang5",
	},
}
Room {
	id = "wuguan/qianting",
	name = "���ǰ��",
	ways = {
		["south"] = "wuguan/menlang",
		["north"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/shilu1",
	name = "��ʯ·",
	ways = {
		["south"] = "wuguan/zoulang1",
		["north"] = "wuguan/houyuan",
	},
}
Room {
	id = "wuguan/shilu2",
	name = "С·",
	ways = {
		["south"] = "wuguan/mafang",
		["north"] = "wuguan/wuchang2",
		["east"] = "wuguan/shuifang",
		["west"] = "wuguan/mufang",
	},
}
Room {
	id = "wuguan/shilu3",
	name = "Сʯ·",
	ways = {
		["east"] = "wuguan/dayuan",
		["west"] = "wuguan/wuchang2",
	},
}
Room {
	id = "wuguan/shilu4",
	name = "��ʯ·",
	ways = {
		["south"] = "wuguan/liangong",
		["east"] = "wuguan/wuchang3",
		["west"] = "wuguan/dayuan",
	},
}
Room {
	id = "wuguan/shufang",
	name = "�鷿",
	ways = {
		["south"] = "wuguan/zoulang6",
	},
}
Room {
	id = "wuguan/shuifang",
	name = "ˮ��",
	ways = {
		["west"] = "wuguan/shilu2",
	},
}
Room {
	id = "wuguan/woshi",
	name = "��ů��",
	ways = {
		["south"] = "wuguan/zoulang3",
	},
}
Room {
	id = "wuguan/wuchang1",
	name = "���䳡",
	ways = {
		["east"] = "wuguan/wuchang2",
	},
}
Room {
	id = "wuguan/wuchang2",
	name = "�����䳡",
	ways = {
		["south"] = "wuguan/shilu2",
		["north"] = "wuguan/zoulang1",
		["east"] = "wuguan/shilu3",
		["west"] = "wuguan/wuchang1",
	},
}
Room {
	id = "wuguan/wuchang3",
	name = "�����䳡",
	ways = {
		["south"] = "wuguan/bingqiku",
		["east"] = "wuguan/wuchang4",
		["west"] = "wuguan/shilu4",
	},
}
Room {
	id = "wuguan/wuchang4",
	name = "���䳡",
	ways = {
		["west"] = "wuguan/wuchang3",
	},
}
Room {
	id = "wuguan/wupinfang",
	name = "��Ʒ��",
	ways = {
		["northwest"] = "wuguan/dating",
	},
}
Room {
	id = "wuguan/wxting",
	name = "��ϼͤ",
	ways = {
		["south"] = "wuguan/jiashan",
		["west"] = "wuguan/xiaojing2",
	},
}
Room {
	id = "wuguan/xiangfang1",
	name = "���᷿",
	ways = {
		["east"] = "wuguan/xiangfang2",
		["west"] = "wuguan/zoulang3",
	},
}
Room {
	id = "wuguan/xiangfang2",
	name = "˯��",
	ways = {
		["west"] = "wuguan/xiangfang1",
	},
}
Room {
	id = "wuguan/xiaojing1",
	name = "С��",
	ways = {
		["south"] = "wuguan/xiaojing2",
		["north"] = "wuguan/houhuayuan",
	},
}
Room {
	id = "wuguan/xiaojing2",
	name = "ʯ��",
	ways = {
		["north"] = "wuguan/xiaojing1",
		["east"] = "wuguan/wxting",
		["west"] = "wuguan/huilang",
	},
}
Room {
	id = "wuguan/xxshi1",
	name = "����Ϣ��",
	ways = {
		["south"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/xxshi2",
	name = "Ů��Ϣ��",
	ways = {
		["north"] = "wuguan/zoulang7",
	},
}
Room {
	id = "wuguan/yiguan",
	name = "���",
	ways = {
		["east"] = "wuguan/menlang",
	},
}
Room {
	id = "wuguan/zhangfang",
	name = "�ʷ�",
	ways = {
		["north"] = "wuguan/zoulang6",
	},
}
Room {
	id = "wuguan/zhulin1",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin1",
		["east"] = "wuguan/zhulin2",
		["north"] = "wuguan/zhulin1",
		["west"] = "wuguan/zhulin1",
	},
}
Room {
	id = "wuguan/zhulin2",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin2",
		["north"] = "wuguan/zhulin3",
		["east"] = "wuguan/zhulin2",
		["west"] = "wuguan/zhulin2",
	},
}
Room {
	id = "wuguan/zhulin3",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin3",
		["north"] = "wuguan/zhulin4",
		["east"] = "wuguan/zhulin3",
		["west"] = "wuguan/zhulin3",
	},
}
Room {
	id = "wuguan/zhulin4",
	name = "����",
	ways = {
		["south"] = "wuguan/zhulin4",
		["east"] = "wuguan/zhulin4",
		["north"] = "wuguan/zhulin4",
		["west"] = "wuguan/jiashan",
	},
}
Room {
	id = "wuguan/zoulang1",
	name = "����",
	ways = {
		["south"] = "wuguan/wuchang2",
		["east"] = "wuguan/zoulang2",
		["north"] = "wuguan/shilu1",
		["west"] = "wuguan/chufang",
	},
}
Room {
	id = "wuguan/zoulang2",
	name = "����",
	ways = {
		["eastup"] = "wuguan/dating",
		["west"] = "wuguan/zoulang1",
	},
}
Room {
	id = "wuguan/zoulang3",
	name = "����",
	ways = {
		["south"] = "wuguan/zoulang4",
		["east"] = "wuguan/xiangfang1",
		["north"] = "wuguan/woshi",
	},
}
Room {
	id = "wuguan/zoulang4",
	name = "����",
	ways = {
		["north"] = "wuguan/zoulang3",
		["out"] = "wuguan/dating",
	},
}
Room {
	id = "wuguan/zoulang5",
	name = "����",
	ways = {
		["westup"] = "wuguan/dating",
		["east"] = "wuguan/zoulang6",
		["north"] = "wuguan/pianting1",
	},
}
Room {
	id = "wuguan/zoulang6",
	name = "����",
	ways = {
		["south"] = "wuguan/zhangfang",
		["east"] = "wuguan/zoulang7",
		["north"] = "wuguan/shufang",
		["west"] = "wuguan/zoulang5",
	},
}
Room {
	id = "wuguan/zoulang7",
	name = "����",
	ways = {
		["south"] = "wuguan/xxshi2",
		["north"] = "wuguan/xxshi1",
		["east"] = "wuguan/huilang",
		["west"] = "wuguan/zoulang6",
	},
}

Room {
	id = "xiakedao/chashi",
	name = "����",
	ways = {
		["east"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/dating",
	name = "����",
	ways = {
		["east"] = "xiakedao/shufang",
		["north"] = "xiakedao/shidong5",
		["west"] = "xiakedao/wuqiku",
	},
}
Room {
	id = "xiakedao/dongmen",
	name = "����",
	ways = {
		["enter"] = "xiakedao/yingbin",
		["west"] = "xiakedao/shidong1",
	},
}
Room {
	id = "xiakedao/haigang",
	name = "���",
	ways = {
		["east"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/haitan",
	name = "��̲",
	ways = {
		["south"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin1",
	name = "����",
	ways = {
		["south"] = "xiakedao/lin2",
		["east"] = "xiakedao/lin1",
		["north"] = "xiakedao/haitan",
		["west"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin2",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin2",
		["south"] = "xiakedao/lin2",
		["east"] = "xiakedao/lin3",
		["north"] = "xiakedao/lin2",
		["northeast"] = "xiakedao/lin2",
		["west"] = "xiakedao/lin1",
	},
}
Room {
	id = "xiakedao/lin3",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin4",
		["south"] = "xiakedao/lin3",
		["east"] = "xiakedao/lin3",
		["north"] = "xiakedao/lin3",
		["northeast"] = "xiakedao/lin3",
		["west"] = "xiakedao/lin2",
	},
}
Room {
	id = "xiakedao/lin4",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin4",
		["south"] = "xiakedao/lin4",
		["northwest"] = "xiakedao/lin3",
		["east"] = "xiakedao/lin4",
		["north"] = "xiakedao/lin4",
		["west"] = "xiakedao/lin5",
	},
}
Room {
	id = "xiakedao/lin5",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin5",
		["south"] = "xiakedao/lin5",
		["northwest"] = "xiakedao/lin6",
		["north"] = "xiakedao/lin5",
		["east"] = "xiakedao/lin4",
		["west"] = "xiakedao/lin5",
	},
}
Room {
	id = "xiakedao/lin6",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin5",
		["south"] = "xiakedao/lin6",
		["northwest"] = "xiakedao/lin6",
		["east"] = "xiakedao/lin7",
		["north"] = "xiakedao/lin6",
		["west"] = "xiakedao/lin6",
	},
}
Room {
	id = "xiakedao/lin7",
	name = "����",
	ways = {
		["southeast"] = "xiakedao/lin7",
		["south"] = "xiakedao/lin8",
		["northwest"] = "xiakedao/lin7",
		["north"] = "xiakedao/lin7",
		["east"] = "xiakedao/lin7",
		["west"] = "xiakedao/lin6",
	},
}
Room {
	id = "xiakedao/lin8",
	name = "����",
	ways = {
		["south"] = "xiakedao/shanmen",
		["north"] = "xiakedao/lin7",
	},
}
Room {
	id = "xiakedao/midao1",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao1",
		["east"] = "xiakedao/midao2",
		["north"] = "xiakedao/midao1",
		["west"] = "xiakedao/midao1",
	},
}
Room {
	id = "xiakedao/midao2",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao3",
		["north"] = "xiakedao/midao2",
		["east"] = "xiakedao/midao2",
		["west"] = "xiakedao/midao1",
	},
}
Room {
	id = "xiakedao/midao3",
	name = "����ͨ��",
	ways = {
		["south"] = "xiakedao/midao3",
		["east"] = "xiakedao/midao3",
		["north"] = "xiakedao/midao2",
		["west"] = "xiakedao/midao4",
	},
}
Room {
	id = "xiakedao/midao4",
	name = "�ܵ�",
	ways = {
		["east"] = "xiakedao/midao3",
	},
}
Room {
	id = "xiakedao/midao5",
	name = "����ͨ��",
	ways = {
		["east"] = "xiakedao/midao4",
		["out"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/midao6",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/midao7",
	},
}
Room {
	id = "xiakedao/midao7",
	name = "����ͨ��",
	ways = {
		["northup"] = "xiakedao/midao8",
		["east"] = "xiakedao/midao6",
		["out"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/midao8",
	name = "�ܵ�",
}
Room {
	id = "xiakedao/mtdating",
	name = "����",
	ways = {
		["down"] = "xiakedao/mtyadi",
		["east"] = "xiakedao/mtxiaowu",
	},
}
Room {
	id = "xiakedao/mtroad",
	name = "ɽ·",
	ways = {
		["south"] = "xiakedao/mtyadi",
		["east"] = "xiakedao/mtroad1",
	},
}
Room {
	id = "xiakedao/mtroad1",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad2",
		["north"] = "xiakedao/mtroad1",
		["west"] = "xiakedao/mtroad",
	},
}
Room {
	id = "xiakedao/mtroad2",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad2",
		["north"] = "xiakedao/mtroad3",
		["east"] = "xiakedao/mtroad1",
		["west"] = "xiakedao/mtroad2",
	},
}
Room {
	id = "xiakedao/mtroad3",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad3",
		["east"] = "xiakedao/mtroad2",
		["west"] = "xiakedao/mtroad3",
	},
}
Room {
	id = "xiakedao/mtroad4",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad6",
		["east"] = "xiakedao/mtroad3",
		["west"] = "xiakedao/mtroad5",
	},
}
Room {
	id = "xiakedao/mtroad5",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad5",
		["north"] = "xiakedao/mtroad5",
		["east"] = "xiakedao/mtroad4",
		["west"] = "xiakedao/mtroad5",
	},
}
Room {
	id = "xiakedao/mtroad6",
	name = "����",
	ways = {
		["south"] = "xiakedao/mtroad4",
		["north"] = "xiakedao/mtroad4",
		["east"] = "xiakedao/mtroad4",
		["west"] = "xiakedao/mtroad4",
	},
}
Room {
	id = "xiakedao/mtxiaowu",
	name = "ľ��",
	ways = {
		["west"] = "xiakedao/mtdating",
	},
}
Room {
	id = "xiakedao/mtyadi",
	name = "�µ�",
	ways = {
		["north"] = "xiakedao/mtroad",
	},
}
Room {
	id = "xiakedao/neiting",
	name = "����",
	ways = {
		["enter"] = "xiakedao/shihole1",
		["north"] = "xiakedao/xiuxis2",
		["east"] = "xiakedao/shibi",
		["west"] = "xiakedao/chashi",
	},
}
Room {
	id = "xiakedao/pubu",
	name = "�ٲ�",
	ways = {
		["northdown"] = "xiakedao/road4",
	},
}
Room {
	id = "xiakedao/road1",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road2",
		["northdown"] = "xiakedao/shanmen",
	},
}
Room {
	id = "xiakedao/road2",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road3",
		["northdown"] = "xiakedao/road1",
	},
}
Room {
	id = "xiakedao/road3",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road4",
		["northdown"] = "xiakedao/road2",
	},
}
Room {
	id = "xiakedao/road4",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/pubu",
		["northdown"] = "xiakedao/road3",
	},
}
Room {
	id = "xiakedao/road5",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road6",
		["north"] = "xiakedao/shidong8",
	},
}
Room {
	id = "xiakedao/road6",
	name = "ɽ·",
	ways = {
		["southup"] = "xiakedao/road7",
		["northdown"] = "xiakedao/road5",
	},
}
Room {
	id = "xiakedao/road7",
	name = "�б�ʯ",
	ways = {
		["southup"] = "xiakedao/road8",
		["northdown"] = "xiakedao/road6",
	},
}
Room {
	id = "xiakedao/road8",
	name = "һ����",
	ways = {
		["southup"] = "xiakedao/wangyun",
		["northdown"] = "xiakedao/road7",
	},
}
Room {
	id = "xiakedao/shanmen",
	name = "ɽ��",
	ways = {
		["southup"] = "xiakedao/road1",
		["north"] = "xiakedao/lin8",
	},
}
Room {
	id = "xiakedao/shibi",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/xiaowu",
		["east"] = "xiakedao/wuchang",
		["west"] = "xiakedao/neiting",
		["out"] = "xiakedao/shimen",
	},
}
Room {
	id = "xiakedao/shidong1",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong6",
		["north"] = "xiakedao/yongdao2",
		["east"] = "xiakedao/dongmen",
	},
}
Room {
	id = "xiakedao/shidong10",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shidong9",
		["out"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/shidong2",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong2",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong3",
		["west"] = "xiakedao/shidong2",
	},
}
Room {
	id = "xiakedao/shidong3",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong4",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong3",
		["west"] = "xiakedao/shidong3",
	},
}
Room {
	id = "xiakedao/shidong4",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong4",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong4",
		["west"] = "xiakedao/shidong5",
	},
}
Room {
	id = "xiakedao/shidong5",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/dating",
		["north"] = "xiakedao/yingbin",
		["east"] = "xiakedao/shidong5",
		["west"] = "xiakedao/shidong5",
	},
}
Room {
	id = "xiakedao/shidong6",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shidong7",
		["north"] = "xiakedao/shidong1",
	},
}
Room {
	id = "xiakedao/shidong7",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shidong6",
		["west"] = "xiakedao/shidong8",
	},
}
Room {
	id = "xiakedao/shidong8",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shidong7",
	},
}
Room {
	id = "xiakedao/shidong9",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/yadi",
		["west"] = "xiakedao/shidong10",
	},
}
Room {
	id = "xiakedao/shihole1",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom02",
		["enter"] = "xiakedao/shihole2",
		["east"] = "xiakedao/shiroom03",
		["north"] = "xiakedao/shiroom01",
		["west"] = "xiakedao/shiroom04",
		["out"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/shihole2",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom06",
		["enter"] = "xiakedao/shihole3",
		["east"] = "xiakedao/shiroom07",
		["north"] = "xiakedao/shiroom05",
		["west"] = "xiakedao/shiroom08",
		["out"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shihole3",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom10",
		["enter"] = "xiakedao/shihole4",
		["east"] = "xiakedao/shiroom11",
		["north"] = "xiakedao/shiroom09",
		["west"] = "xiakedao/shiroom12",
		["out"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shihole4",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom14",
		["enter"] = "xiakedao/shihole5",
		["east"] = "xiakedao/shiroom15",
		["north"] = "xiakedao/shiroom13",
		["west"] = "xiakedao/shiroom16",
		["out"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shihole5",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom18",
		["enter"] = "xiakedao/shihole6",
		["east"] = "xiakedao/shiroom19",
		["north"] = "xiakedao/shiroom17",
		["west"] = "xiakedao/shiroom20",
		["out"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shihole6",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shiroom22",
		["east"] = "xiakedao/shiroom23",
		["north"] = "xiakedao/shiroom21",
		["west"] = "xiakedao/shiroom24",
		["out"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shimen",
	name = "ʯ��",
	ways = {
		["enter"] = "xiakedao/shibi",
		["north"] = "xiakedao/yongdao3",
	},
}
Room {
	id = "xiakedao/shiroom01",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom02",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom03",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole1",
	},
}
Room {
	id = "xiakedao/shiroom04",
	name = "ʯ��",
}
Room {
	id = "xiakedao/shiroom05",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom06",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom07",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom08",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole2",
	},
}
Room {
	id = "xiakedao/shiroom09",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom10",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom11",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom12",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole3",
	},
}
Room {
	id = "xiakedao/shiroom13",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom14",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom15",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom16",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole4",
	},
}
Room {
	id = "xiakedao/shiroom17",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom18",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom19",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom20",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole5",
	},
}
Room {
	id = "xiakedao/shiroom21",
	name = "ʯ��",
	ways = {
		["south"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom22",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom23",
	name = "ʯ��",
	ways = {
		["west"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shiroom24",
	name = "ʯ��",
	ways = {
		["east"] = "xiakedao/shihole6",
	},
}
Room {
	id = "xiakedao/shufang",
	name = "�鷿",
}
Room {
	id = "xiakedao/wangyun",
	name = "����̨",
	ways = {
		["northdown"] = "xiakedao/road8",
	},
}
Room {
	id = "xiakedao/wuchang",
	name = "�䳡",
	ways = {
		["west"] = "xiakedao/shibi",
	},
}
Room {
	id = "xiakedao/wuqiku",
	name = "������",
	ways = {
		["east"] = "xiakedao/dating",
	},
}
Room {
	id = "xiakedao/xiaodian",
	name = "С�Ե�",
	ways = {
		["west"] = "xiakedao/yingbin",
	},
}
Room {
	id = "xiakedao/xiaowu",
	name = "ʯ��",
	ways = {
		["north"] = "xiakedao/shibi",
	},
}
Room {
	id = "xiakedao/xiuxis",
	name = "��Ϣ��",
	ways = {
		["east"] = "xiakedao/yingbin",
	},
}
Room {
	id = "xiakedao/xiuxis2",
	name = "��Ϣ��",
	ways = {
		["south"] = "xiakedao/neiting",
	},
}
Room {
	id = "xiakedao/xkroad1",
	name = "����ɽ��",
	ways = {
		["south"] = "xiakedao/xkroad2",
	},
}
Room {
	id = "xiakedao/xkroad2",
	name = "��ɽ",
	ways = {
		["south"] = "xiakedao/xkroad3",
		["north"] = "xiakedao/xkroad1",
	},
}
Room {
	id = "xiakedao/xkroad3",
	name = "ƽԭС·",
	ways = {
		["south"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/xkroad4",
	name = "�Ϻ����",
	ways = {
		["east"] = "xiakedao/xkroad5",
		["north"] = "xiakedao/xkroad3",
		["west"] = "xiakedao/haigang",
	},
}
Room {
	id = "xiakedao/xkroad5",
	name = "���ɹ����",
	ways = {
		["north"] = "xiakedao/xkroad6",
		["west"] = "xiakedao/xkroad4",
	},
}
Room {
	id = "xiakedao/xkroad6",
	name = "���С��",
	ways = {
		["south"] = "xiakedao/xkroad5",
	},
}
Room {
	id = "xiakedao/yadi",
	name = "�µ�",
}
Room {
	id = "xiakedao/yingbin",
	name = "ӭ����",
		ways = {
		["south"] = "xiakedao/shidong2",
		["east"] = "xiakedao/xiaodian",
		["west"] = "xiakedao/xiuxis",
		["out"] = "xiakedao/dongmen",
	},
}
Room {
	id = "xiakedao/yongdao1",
	name = "��",
		ways = {
		["south"] = "xiakedao/yongdao2",
		["out"] = "xiakedao/pubu",
	},
}
Room {
	id = "xiakedao/yongdao2",
	name = "��",
		ways = {
		["south"] = "xiakedao/shidong1",
		["north"] = "xiakedao/yongdao1",
	},
}
Room {
	id = "xiakedao/yongdao3",
	name = "��",
	
	ways = {
		["south"] = "xiakedao/shimen",
		["north"] = "xiakedao/dating",
	},
}
Room {
	id = "xiangyang/baihumen",
	name = "�׻���",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/bhmnj",
		["west"] = "xiangyang/outwroad1",
	},
	room_relative="������----�׻���----�׻����ڽְ׻���",
}
Room {
	id = "xiangyang/bank",
	name = "����ի",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/njie3",
	},
	objs = {
          ["Ǯ����"] = "qian shanren",
           },
	room_relative="����ի----�Ͻֱ���ի",
}
Room {
	id = "xiangyang/baozipu",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/xcx4",
	},
	objs = {
		["������"] = "baozi wang",
	},
	room_relative="������----�����������",
}
Room {
	id = "xiangyang/bcx1",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/bjie1",
		["west"] = "xiangyang/bcx2",
	},
	room_relative="������----������----���ֱ�����",
}
Room {
	id = "xiangyang/bcx2",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/guangc",
		["north"] = "xiangyang/zrdian",
		["east"] = "xiangyang/bcx1",
		["west"] = "xiangyang/bcx3",
	},
	objs = {
		["�����"] = "wu dunru",
	},
	room_relative="������������----������----���������̨ǰ�㳡������",
}
Room {
	id = "xiangyang/bcx3",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bcx4",
		["north"] = "xiangyang/jianghukz",
		["east"] = "xiangyang/bcx2",
		["west"] = "xiangyang/xyudian",
	},
	room_relative="������ջ�������----������----������������ﱱ����",
}
Room {
	id = "xiangyang/bcx4",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bhmnj",
		["north"] = "xiangyang/bcx3",
		["west"] = "xiangyang/xiaocd",
	},
  room_relative="�������С�Ե�----��������׻����ڽֱ�����",
}
Room {
	id = "xiangyang/bhmnj",
	name = "�׻����ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xcx1",
		["east"] = "xiangyang/xjie",
		["north"] = "xiangyang/bcx4",
		["west"] = "xiangyang/baihumen",
	
	},
	room_relative="��������׻���--�׻����ڽ�--���֣�������׻����ڽ�",
	
}
Room {
	id = "xiangyang/bingying",
	name = "��Ӫ",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/ncx3",
	},
	room_relative="��Ӫ���ϳ����Ӫ",
}
Room {
	id = "xiangyang/bjie1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bjie2",
		["north"] = "xiangyang/nroad1",
		["east"] = "xiangyang/duchang",
		["west"] = "xiangyang/bcx1",
	},
	room_relative="�������ڽ֣�������-----����-----���ķ������ֱ���",
}
Room {
	id = "xiangyang/bjie2",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bjie3",
		["east"] = "xiangyang/chalou",
		["north"] = "xiangyang/bjie1",
	},
	room_relative="���֣�����-----����¥�����ֱ���",
	objs = {
        ["Ү����"] = "yelv qi",
    },
}
Room {
	id = "xiangyang/bjie3",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/dpailou",
		["north"] = "xiangyang/bjie2",
		["west"] = "xiangyang/cross1",
	},
	room_relative="���֣������ֽ�-----���֣�����¥����",
}
Room {
	id = "xiangyang/caiyongmanor",
	name = "����ׯ",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/caiyongtomb",
		["east"] = "changan/southroad3",
	},
	room_relative="����Ĺ������ׯ----�ٵ�����ׯ",
}
Room {
	id = "xiangyang/caiyongtomb",
	name = "����Ĺ",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/caiyongmanor",
	},
	room_relative="����Ĺ������ׯ����Ĺ",
}
Room {
	id = "xiangyang/chalou",
	name = "����¥",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/bjie2",
		["up"] = "xiangyang/chalou2",
	},
	room_relative="��¥��¥������----����¥����¥",
}
Room {
	id = "xiangyang/chalou2",
	name = "��¥��¥",
	outdoor = "������",
	ways = {
		["down"] = "xiangyang/chalou",
	},
	room_relative="��¥��¥������¥��¥��¥",
}
Room {
	id = "xiangyang/chayedian",
	name = "��Ҷ��",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/xcx1",
	},
	room_relative="��Ҷ��----�������Ҷ��",
}
Room {
	id = "xiangyang/chemahang",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/ncx2",
	},
	room_relative="�����У��ϳ��ﳵ����",
}
Room {
	id = "xiangyang/chengyipu",
	name = "������",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/dcx3",
	},
	objs = {
        ["������"] = "yu sanniang",
    },
	room_relative="������----�����̳�����",
}
Room {
	id = "xiangyang/chucshi",
	name = "������",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/yamen",
	},
	room_relative="����--������",
}
Room {
	id = "xiangyang/conglin1",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["eastdown"] = "xiangyang/outsroad3",
		["westup"] = "xiangyang/conglin2",
	},
	room_relative="ɽ·��ɽ·�������·ɽ·",
}
Room {
	id = "xiangyang/conglin2",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["eastdown"] = "xiangyang/conglin1",
		["westup"] = "xiangyang/conglin3",
	},
	precmds = {
	    ["eastdown"] = "halt",
		["westup"] = "halt",
	},
	lengths = {
	    ["westup"] = "if hp.exp>500000 then return 1 else return false end",
	},
	room_relative="ɽ·��ɽ·��ɽ·ɽ·",
}
Room {
	id = "xiangyang/conglin3",
	name = "ɽ·",
	outdoor = "������",
	ways = {
		["eastdown"] = "xiangyang/conglin2",
		["westup"] = "xiangyang/conglin4",
	},
	objs = {
        ["����"] = "guai mang",
    },
	room_relative="ɽ��յء�ɽ·��ɽ·ɽ·",
}
Room {
	id = "xiangyang/conglin4",
	name = "ɽ��յ�",
	outdoor = "������",
	ways = {
		["eastdown"] = "xiangyang/conglin3",
		["northwest"] = "gumu/xuantie/xiaolu4",
	},
	objs = {
        ["ʷ���"] = "shi shugang",
        ["ʷ��ǿ"] = "shi jiqiang",
        ["ʷ����"] = "shi bowei",
        ["ʷ����"] = "shi zhongmeng",
        ["ʷ�Ͻ�"] = "shi mengjie",
    },
	room_relative="ɽ·�Iɽ��յء�ɽ·ɽ��յ�",
}
Room {
	id = "xiangyang/cross1",
	name = "�����ֽ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xpailou",
		["east"] = "xiangyang/bjie3",
		["west"] = "xiangyang/xjie",
	},room_relative="����---�����ֽ�---���֣�����¥�����ֽ�",
	
}
Room {
	id = "xiangyang/cross2",
	name = "�϶��ֽ�",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/dpailou",
		["east"] = "xiangyang/djie1",
		["west"] = "xiangyang/njie1",
	},
	room_relative="����¥���Ͻ�---�϶��ֽ�---�����϶��ֽ�",
}
Room {
	id = "xiangyang/damen",
	name = "��ݴ���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/eroad1",
		["enter"] = "wuguan/menlang",
	},
	lengths = {
		["enter"] = "if hp.exp < 3000 then return 1 else return false end",
	},
	objs = {
        ["�������"] = "men wei",
    },
}
Room {
	id = "xiangyang/dangpu",
	name = "����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/djie1",
	},
	objs = {
        ["���ϰ�"] = "cui laoban",
    },
	room_relative="���̣����ֵ���",
}
Room {
	id = "xiangyang/datiepu",
	name = "������",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/ncx5",
	},
	room_relative="�ϳ���----�����̴�����",
}
Room {
	id = "xiangyang/dcx1",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/dcx2",
		["east"] = "xiangyang/feizhai",
		["west"] = "xiangyang/nroad1",
	},
	room_relative="�������ڽ�----������----��լ�������ﶫ����",
}
Room {
	id = "xiangyang/dcx2",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/dcx3",
		["east"] = "xiangyang/zahuopu",
		["north"] = "xiangyang/dcx1",
	},
	room_relative="�������������----�ӻ��̣������ﶫ����",
	objs = {
        ["��Ĭ��"] = "feng mofeng",
    },
}
Room {
	id = "xiangyang/dcx3",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/dcx4",
		["north"] = "xiangyang/dcx2",
		["east"] = "xiangyang/chengyipu",
	},
	room_relative="�������������----�����̣������ﶫ����",
	objs = {
        ["��ܽ"] = "guo fu",
    },
}
Room {
	id = "xiangyang/dcx4",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/dcx5",
		["east"] = "xiangyang/xiyuan",
		["north"] = "xiangyang/dcx3",
	},
	room_relative="�������������----ϷԺ�������ﶫ����",
}
Room {
	id = "xiangyang/dcx5",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/djie2",
		["north"] = "xiangyang/dcx4",
},
	

	room_relative="�����������������ֶ�����",
}
Room {
	id = "xiangyang/djie1",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/djie2",
		["north"] = "xiangyang/dangpu",
		["west"] = "xiangyang/cross2",
	},
	room_relative="���̣��϶��ֽ�-----����-----���ֶ���",
}
Room {
	id = "xiangyang/djie2",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/eroad1",
		["north"] = "xiangyang/dcx5",
		["west"] = "xiangyang/djie1",
	},
	precmds = {
   ["west"] = "#walkBusy",
   },
	
}
Room {
	id = "xiangyang/doufufang",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/xcx2",
	},
	room_relative="������----�����ﶹ����",
}
Room {
	id = "xiangyang/dpailou",
	name = "����¥",
	outdoor = "����",
	ways = {
		["south"] = "xiangyang/cross2",
		["north"] = "xiangyang/bjie3",
	},
	room_relative="���֣�����¥���϶��ֶֽ���¥",
}
Room {
	id = "xiangyang/duchang",
	name = "���ķ�",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "xiangyang/bjie1",
	},
	room_relative="����---���ķ����ķ�",
}
Room {
	id = "xiangyang/eroad1",
	name = "�������ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/ncx5",
		["east"] = "xiangyang/qinglongmen",
		["north"] = "xiangyang/damen",
		["west"] = "xiangyang/djie2",
	},
	room_relative="��ݴ��ţ�����--�������ڽ�--�����ţ��ϳ����������ڽ�",
}
Room {
	id = "xiangyang/feizhai",
	name = "��լ",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/dcx1",
	},
	objs = {
        ["��С��"] = "xu xiaowu",
        ["���"] = "xiang zhanglao",
    },
	room_relative="������-----��լ��լ",
}
Room {
	id = "xiangyang/guangc",
	name = "��̨ǰ�㳡",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/bcx2",
		-- ["longhu"] = "wizard/lt2",
		-- ["fengyun"] = "wizard/lt1",
		-- ["tiandi"] = "wizard/lt",
	},
	nolooks = {
		["longhu"] = true,
		["fengyun"] = true,
		["tiandi"] = true,
	},
	room_relative="���������̨ǰ�㳡��̨ǰ�㳡",
}
Room {
	id = "xiangyang/hanshui1",
	name = "��ˮ����",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/outnroad3",
		["dujiang"] = "xiangyang/hanshui2",
	},
	nolooks = {
		["dujiang"] = true,
	},
	room_relative="��·����ˮ������ˮ����",
}
Room {
	id = "xiangyang/hanshui2",
	name = "��ˮ����",
	outdoor = "������",
	ways = {
		["west"] = "wudang/wdroad6",
		["dujiang"] = "xiangyang/hanshui1",
	},
	nolooks = {
		["dujiang"] = true,
	},
	room_relative="����·����ˮ������ˮ����",
}
Room {
	id = "xiangyang/henanroad1",
	name = "��·",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/outnroad3",
		["northeast"] = "xiangyang/henanroad2",
	},
	room_relative="��·�J��·�L��·��·",
}
Room {
	id = "xiangyang/henanroad2",
	name = "��·",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/henanroad1",
		["north"] = "nanyang/yidao",
	},
	room_relative="�������·�L��·��·",
}
Room {
	id = "xiangyang/hunanroad1",
	name = "�������",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/hunanroad2",
		["north"] = "xiangyang/outsroad3",
	},
 room_relative="�����·���������L��Ϫ���������",
}
Room {
	id = "xiangyang/hunanroad2",
	name = "��Ϫ��",
	outdoor = "������",
	ways = {
		["southwest"] = "group/entry/mjshan2",
		["south"] = "tiezhang/lx",
		["northeast"] = "xiangyang/hunanroad1",
	},
	objs = {
        ["���Ŵ��"] = "dujiao dadao",
	room_relative="�������J��Ϫ���L��ɽ·��Ϫ��Ϫ��",
    },
}
Room {
	id = "xiangyang/jianghukz",
	name = "������ջ",
	outdoor = "������",
	no_fight = true,
	ways = {
		["south"] = "xiangyang/bcx3",
		-- ["up"] = "xiangyang/kezhan2",
	},
	nolooks = {
		["up"] = true,
	},
	room_relative="��ջ��¥��������ջ�������ｭ����ջ",
}
Room {
	id = "xiangyang/junying",
	name = "�ɹž�Ӫ",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/outnroad2",
		["enter"] = "xiangyang/yingzhang",
	},
	room_relative="Ӫ���С��ɹž�Ӫ�L��ʯ����ɹž�Ӫ",
}
Room {
	id = "xiangyang/kezhan2",
	name = "��ջ��¥",
	outdoor = "������",
	no_fight = true,
	ways = {
		["down"] = "xiangyang/jianghukz",
	},
}
Room {
	id = "xiangyang/lantian",
	name = "����",
	outdoor = "������",
	ways = {
		["southeast"] = "xiangyang/shanxiroad2",
		["north"] = "changan/southroad3",
	},
	room_relative="�ٵ�������K��·����",
}
Room {
	id = "xiangyang/lipindian",
	name = "��Ʒ��",
	outdoor = "������",
	ways = {
		["out"] = "xiangyang/cross2",
	},
	room_relative="�϶��ֽ�--��Ʒ��",
}
Room {
	id = "xiangyang/lzz/chelang1",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/yaofang",
		["east"] = "xiangyang/lzz/tjing",
		["west"] = "xiangyang/lzz/chelang2",
	},
	room_relative="����-----����-----�쾮��ҩ������",
}
Room {
	id = "xiangyang/lzz/chelang2",
	name = "����",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/lzz/houyuan",
		["east"] = "xiangyang/lzz/chelang1",
	},
	room_relative="��Ժ������-----���Ȳ���",
}
Room {
	id = "xiangyang/lzz/houyuan",
	name = "��Ժ",
    outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/chelang2",
		["north"] = "xiangyang/lzz/huayuan",
	},
	room_relative="��԰����Ժ�����Ⱥ�Ժ",
}
Room {
	id = "xiangyang/lzz/huayuan",
	name = "��԰",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/houyuan",
	},
	room_relative="��԰����Ժ��԰",
}
Room {
	id = "xiangyang/lzz/jiuguan",
	name = "�ļ�С�Ե�",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/lzz/liuzz",
	},
	room_relative="�ļ�С�Ե�--�������ļ�С�Ե�",
}
Room {
	id = "xiangyang/lzz/liuzz",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/xiaolu",
		["north"] = "xiangyang/lzz/xiaohe",
		["west"] = "xiangyang/lzz/jiuguan",
	},
  room_relative="С�ӣ��ļ�С�Ե�----�������С·������",
}
Room {
	id = "xiangyang/lzz/qiant",
	name = "ǰ��",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/xue_men",
		["north"] = "xiangyang/lzz/tjing",
	},
	room_relative="�쾮��ǰ����Ѧ������ǰ��",
}
Room {
	id = "xiangyang/lzz/tjing",
	name = "�쾮",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/qiant",
		["north"] = "xiangyang/lzz/zhengt",
		["west"] = "xiangyang/lzz/chelang1",
	},
	room_relative="����������-----�쾮��ǰ���쾮",
}
Room {
	id = "xiangyang/lzz/xiaohe",
	name = "С��",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/liuzz",
		["north"] = "xiangyang/lzz/xue_men",
	},
	room_relative="Ѧ�����ţ�С�ӣ�������С��",
}
Room {
	id = "xiangyang/lzz/xiaolu",
	name = "С·",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xiaolu1",
		["north"] = "xiangyang/lzz/liuzz",
	},
	room_relative="�������С·��С·С·",
}
Room {
	id = "xiangyang/lzz/xue_men",
	name = "Ѧ������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/xiaohe",
		["north"] = "xiangyang/lzz/qiant",
	},
 room_relative="ǰ����Ѧ�����ţ�С��Ѧ������",
}
Room {
	id = "xiangyang/lzz/yaofang",
	name = "ҩ��",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/lzz/chelang1",
	},
	room_relative="���ȣ�ҩ��ҩ��",
}
Room {
	id = "xiangyang/lzz/zhengt",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/lzz/tjing",
	},
	room_relative="�������쾮����",
}
Room {
	id = "xiangyang/mujiangpu",
	name = "ľ����",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/ncx4",
	},
	objs = {
		["ľ��"] = "mu jiang",
	},
	room_relative="�ϳ���----ľ����ľ����",
}
Room {
	id = "xiangyang/ncx1",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/shuoshug",
		["east"] = "xiangyang/ncx2",
		["west"] = "xiangyang/njie3",
	},
	room_relative="˵��ݣ��Ͻ�----�ϳ���----�ϳ����ϳ���",
}
Room {
	id = "xiangyang/ncx2",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/ncx3",
		["north"] = "xiangyang/chemahang",
		["west"] = "xiangyang/ncx1",
	},
	room_relative="�����У��ϳ���----�ϳ���----�ϳ����ϳ���",
    objs =  {
		["����"] = "guo jing",
    },
}
Room {
	id = "xiangyang/ncx3",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/wen/damen",
		["east"] = "xiangyang/ncx4",
		["north"] = "xiangyang/bingying",
		["west"] = "xiangyang/ncx2",
	},
	room_relative="��Ӫ���ϳ���----�ϳ���----�ϳ�����¸������ϳ���",
}
Room {
	id = "xiangyang/ncx4",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/ncx5",
		["east"] = "xiangyang/mujiangpu",
		["west"] = "xiangyang/ncx3",
	},
	room_relative="�ϳ�����ϳ���----�ϳ���----ľ�����ϳ���",
}
Room {
	id = "xiangyang/ncx5",
	name = "�ϳ���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/ncx4",
		["north"] = "xiangyang/eroad1",
		["east"] = "xiangyang/datiepu",
	},
	room_relative="�������ڽ֣��ϳ���----�����̣��ϳ����ϳ���",
}
Room {
	id = "xiangyang/njie1",
	name = "�Ͻ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/njie2",
		["north"] = "xiangyang/xpailou",
		["east"] = "xiangyang/cross2",
		["west"] = "xiangyang/yamen",
	},
	room_relative="����¥������-----�Ͻ�-----�϶��ֽ֣��Ͻ��Ͻ�",
}
Room {
	id = "xiangyang/njie2",
	name = "�Ͻ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/njie3",
		["north"] = "xiangyang/njie1",
	},
	room_relative="�Ͻ֣��Ͻ֣��Ͻ��Ͻ�",
	objs = {
        ["����Ƽ"] = "wanyan ping",
    },
}
Room {
	id = "xiangyang/njie3",
	name = "�Ͻ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/zqmnj",
		["north"] = "xiangyang/njie2",
		["east"] = "xiangyang/ncx1",
		["west"] = "xiangyang/bank",
	},
	room_relative="�Ͻ֣�����ի-----�Ͻ�-----�ϳ������ȸ���ڽ��Ͻ�",
}
Room {
	id = "xiangyang/nroad1",
	name = "�������ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bjie1",
		["north"] = "xiangyang/xuanwumen",
		["east"] = "xiangyang/dcx1",
	},
	room_relative="�����ţ��������ڽ�--������������������ڽ�",
}
Room {
	id = "xiangyang/outeroad1",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "city/wroad3",
		["west"] = "xiangyang/qinglongmen",
	},
	room_relative="������----������----��·������",
}
Room {
	id = "xiangyang/outnroad1",
	name = "��ʯ���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xuanwumen",
		["north"] = "xiangyang/outnroad2",
	},
	room_relative="��ʯ�������ʯ�������������ʯ���",
}
Room {
	id = "xiangyang/outnroad2",
	name = "��ʯ���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/outnroad1",
		["north"] = "xiangyang/outnroad3",
		["northeast"] = "xiangyang/junying",
	},
	room_relative="��·�ɹž�Ӫ���J��ʯ�������ʯ�����ʯ���",
}
Room {
	id = "xiangyang/outnroad3",
	name = "��·",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/outnroad2",
		["northwest"] = "xiangyang/shanxiroad1",
		["northeast"] = "xiangyang/henanroad1",
		["west"] = "xiangyang/hanshui1",
	},
	room_relative="��·��·�I�J��ˮ����-----��·����ʯ�����·",
}
Room {
	id = "xiangyang/outsroad1",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/outsroad2",
		["north"] = "xiangyang/zhuquemen",
	},
	room_relative="��ȸ�ţ����������ʯ���������",
}
Room {
	id = "xiangyang/outsroad2",
	name = "��ʯ���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/outsroad3",
		["north"] = "xiangyang/outsroad1",
	},
	room_relative="���������ʯ����������·��ʯ���",
}
Room {
	id = "xiangyang/outsroad3",
	name = "�����·",
	outdoor = "������",
	ways = {
		["westup"] = "xiangyang/conglin1",
		["south"] = "xiangyang/hunanroad1",
		["north"] = "xiangyang/outsroad2",
	},
	room_relative="��ʯ�����ɽ·�������·��������������·",
}
Room {
	id = "xiangyang/outwroad1",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/shanlu1",
		["east"] = "xiangyang/baihumen",
		["north"] = "gumu/jqg/shanlu3",
		["west"] = "xiangyang/tanxi",
	},
	room_relative="ɽ��С·��̴Ϫ----������----�׻��ţ�ɽ��С·������",
}
Room {
	id = "xiangyang/qinglongmen",
	name = "������",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/outeroad1",
		["west"] = "xiangyang/eroad1",
	},
	room_relative="�������ڽ�----������----������������",
}
Room {
	id = "xiangyang/shanlu1",
	name = "ɽ��С·",
	outdoor = "������",
	ways = {
		["southup"] = "xiangyang/shanlu2",
		["north"] = "xiangyang/outwroad1",
	},
	room_relative="�������ɽ��С·��ɽ��С·ɽ��С·",
}
Room {
	id = "xiangyang/shanlu2",
	name = "ɽ��С·",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/shanlu3",
		["northdown"] = "xiangyang/shanlu1",
	},
	room_relative="ɽ��С·��ɽ��С·�Lɽ��С·ɽ��С·",
}
Room {
	id = "xiangyang/shanlu3",
	name = "ɽ��С·",
	outdoor = "������",
	ways = {
		["northeast"] = "xiangyang/shanlu2",
	},
	room_relative="ɽ��С·�Jɽ��С·ɽ��С·",
	objs = {
        ["ƽ����"] = "ping popo",
        ["������"] = "rui popo",
        ["������"] = "ding popo",
    },
}
Room {
	id = "xiangyang/shanxiroad1",
	name = "��·",
	outdoor = "������",
	ways = {
		["southeast"] = "xiangyang/outnroad3",
		["northwest"] = "xiangyang/shanxiroad2",
		["west"] = "gumu/fchuan",
	},
	room_relative="��·�I����-----��·�K��·��·",
}
Room {
	id = "xiangyang/shanxiroad2",
	name = "��·",
	outdoor = "������",
	ways = {
		["southeast"] = "xiangyang/shanxiroad1",
		["northwest"] = "xiangyang/lantian",
		["north"] = "village/hsroad3",
	},
	room_relative="�������·�I����·�K��·��·",
	objs = {
		["���д���"] = "duxing daxia",
	},
}
Room {
	id = "xiangyang/shaobingpu",
	name = "�ձ���",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/xcx3",
	},
	objs = {
		["�ձ���"] = "shaobing liu",
	},
	room_relative="�ձ���----�������ձ���",
}
Room {
	id = "xiangyang/shuoshug",
	name = "˵���",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/ncx1",
	},
	room_relative="˵��ݣ��ϳ���˵���",
}
Room {
	id = "xiangyang/sishu",
	name = "˽��",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/xcx5",
	},
	room_relative="�������˽��˽��",
}
Room {
	id = "xiangyang/tanxi",
	name = "̴Ϫ",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/xiaolu1",
		["east"] = "xiangyang/outwroad1",
	},
	room_relative="̴Ϫ-----������LС·̴Ϫ",
}
Room {
	id = "xiangyang/wen/damen",
	name = "�¸�����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/wen/shidetang",
		["north"] = "xiangyang/ncx3",
	},
	room_relative="�ϳ�����¸����ţ��������¸�����",
}
Room {
	id = "xiangyang/wen/guifang",
	name = "����",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["����"] = "wen yi",
	},
	room_relative="�쾮----��������",
}
Room {
	id = "xiangyang/wen/houhuayuan",
	name = "��԰",
	outdoor = "������",
	ways = {
		["north"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["�·���"] = "wen fangyi",
	},
	room_relative="�쾮����԰��԰",
}
Room {
	id = "xiangyang/wen/lianwu",
	name = "���䳡",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/wen/tianjing",
	},
	objs = {
		["�·���"] = "wen fangda",
	},
	room_relative="���䳡----�쾮���䳡",
}
Room {
	id = "xiangyang/wen/shidetang",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/wen/tianjing",
		["east"] = "xiangyang/wen/wofang2",
		["north"] = "xiangyang/wen/damen",
		["west"] = "xiangyang/wen/wofang1",
	},
	objs = {
		["������"] = "wen nanyang",
	room_relative="�¸����ţ��Է�----������----�Է����쾮������",
	},
}
Room {
	id = "xiangyang/wen/tianjing",
	name = "�쾮",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/wen/houhuayuan",
		["north"] = "xiangyang/wen/shidetang",
		["east"] = "xiangyang/wen/guifang",
		["west"] = "xiangyang/wen/lianwu",
	},
	objs = {
		["�·�ʩ"] = "wen fangshi",
	room_relative="�����ã����䳡-----�쾮-----�������԰�쾮",
	},
}
Room {
	id = "xiangyang/wen/wofang1",
	name = "�Է�",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/wen/shidetang",
	},
	objs = {
		["�·�ɽ"] = "wen fangshan",
	},
	room_relative="�Է�-----�������Է�",
}
Room {
	id = "xiangyang/wen/wofang2",
	name = "�Է�",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/wen/shidetang",
	},
	objs = {
		["�·���"] = "wen fangwu",
	},
	room_relative="������-----�Է��Է�",
}
Room {
	id = "xiangyang/xcx1",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xcx2",
		["north"] = "xiangyang/bhmnj",
		["west"] = "xiangyang/chayedian",
	},
	room_relative="�׻����ڽ֣���Ҷ��----�������������������",
}
Room {
	id = "xiangyang/xcx2",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xcx3",
		["north"] = "xiangyang/xcx1",
		["west"] = "xiangyang/doufufang",
	},
	room_relative="�������������----�������������������",
}
Room {
	id = "xiangyang/xcx3",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xcx4",
		["north"] = "xiangyang/xcx2",
		["west"] = "xiangyang/shaobingpu",
	},
	room_relative="��������ձ���----�������������������",
}
Room {
	id = "xiangyang/xcx4",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/xcx5",
		["north"] = "xiangyang/xcx3",
		["west"] = "xiangyang/baozipu",
	},
	room_relative="�������������----�������������������",
}
Room {
	id = "xiangyang/xcx5",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/sishu",
		["east"] = "xiangyang/zqmnj",
		["north"] = "xiangyang/xcx4",
		["west"] = "xiangyang/yaopu",
	},
	room_relative="�������ҩ����----������----��ȸ���ڽ֣�˽��������",
}
Room {
	id = "xiangyang/xiaocd",
	name = "С�Ե�",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/bcx4",
	},
	room_relative="С�Ե�----������С�Ե�",
}
Room {
	id = "xiangyang/xiaolu1",
	name = "С·",
	outdoor = "������",
	ways = {
		["southwest"] = "xiangyang/xiaolu2",
		["north"] = "xiangyang/lzz/xiaolu",
		["northeast"] = "xiangyang/tanxi",
	},
	room_relative="С·̴Ϫ���JС·�LС·С·",
}
Room {
	id = "xiangyang/xiaolu2",
	name = "С·",
	outdoor = "������",
	ways = {
		["northeast"] = "xiangyang/xiaolu1",
		["west"] = "group/entry/cderoad4",
	},
	room_relative="С·�J���-----С·С·",
}
Room {
	id = "xiangyang/xiyuan",
	name = "ϷԺ",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/dcx4",
	},
	room_relative="������-----ϷԺϷԺ",
}
Room {
	id = "xiangyang/xjie",
	name = "����",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/cross1",
		["west"] = "xiangyang/bhmnj",
	},
	room_relative="�����ֽ�-----�׻����ڽ�����",
}
Room {
	id = "xiangyang/xpailou",
	name = "����¥",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/njie1",
		["north"] = "xiangyang/cross1",
	},
	room_relative="�����ֽ֣�����¥���Ͻ�����¥",
}
Room {
	id = "xiangyang/xuanwumen",
	name = "������",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/nroad1",
		["north"] = "xiangyang/outnroad1",
	},
	room_relative="��ʯ����������ţ��������ڽ�������",
}
Room {
	id = "xiangyang/xyudian",
	name = "�����",
	outdoor = "������",
	ways = {
		["east"] = "xiangyang/bcx3",
	},
	objs = {
		["���ɩ"] = "li ersao",
	},
	room_relative="�����----�����������",
}
Room {
	id = "xiangyang/yamen",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/chucshi",
		["north"] = "xiangyang/ymzhengting",
		["east"] = "xiangyang/njie1",
	},
	blocks = {
		["north"] = {
			{id = "ya yi", exp = 7500},
		},
		["south"] = {
			{id = "ya yi", exp = 7500},
		},
          precmds = {
              ["north"] = "kill ya yi",
			   ["south"] = "kill ya yi",
	},
	},
}
Room {
	id = "xiangyang/yaopu",
	name = "ҩ����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "xiangyang/xcx5",
	},
	objs = {
		["ƽһָ"] = "ping yizhi",
	},
	room_relative="ҩ����----������ҩ����",
}
Room {
	id = "xiangyang/yingzhang",
	name = "Ӫ����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["out"] = "xiangyang/junying",
	},
	objs = {
		["�ɸ�"] = "meng ge",
	},
	room_relative="Ӫ���С��ɹž�ӪӪ����",
}
Room {
	id = "xiangyang/ymzhengting",
	name = "����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/yamen",
	},
	room_relative="����--����",
}
Room {
	id = "xiangyang/zahuopu",
	name = "�ӻ���",
	outdoor = "������",
	ways = {
		["west"] = "xiangyang/dcx2",
		["up"] = "xiangyang/qnbank",
	},
	objs = {
		["ţ�ϰ�"] = "niu laoban",
	},
	room_relative="������----�ӻ����ӻ���",
}
Room {
	id = "xiangyang/qnbank",
	name = "Ǳ������",
	outdoor = "������",
	ways = {
		["down"] = "xiangyang/zahuopu",
	},
	room_relative="�ӻ���--Ǳ������",
}

Room {
	id = "xiangyang/zhuquemen",
	name = "��ȸ��",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/outsroad1",
		["north"] = "xiangyang/zqmnj",
	},
	room_relative="��ȸ���ڽ֣���ȸ�ţ���������ȸ��",
}
Room {
	id = "xiangyang/zqmnj",
	name = "��ȸ���ڽ�",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/zhuquemen",
		["north"] = "xiangyang/njie3",
		["west"] = "xiangyang/xcx5",
	},
 room_relative="�Ͻ֣�������--��ȸ���ڽ֣���ȸ����ȸ���ڽ�",
}
Room {
	id = "xiangyang/zrdian",
	name = "�����",
	outdoor = "������",
	ways = {
		["south"] = "xiangyang/bcx2",
	},
	objs = {
        ["������"] = "zhurou rong",
    },
	room_relative="�����������������",
}
Room {
	id = "xingxiu/bank",
	name = "��ի",
	outdoor = "���޺�",
	ways = {
		["east"] = "xingxiu/silk8",
	},
	objs = {
          ["���ƹ�"] = "ma zhanggui",
           },
   room_relative="��ի----�¹Ȼ��ٹ����ի",
}
Room {
	id = "xingxiu/baozang/bingqiku",
	name = "������",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/midong3",
		["east"] = "xingxiu/baozang/tiantan",
		["north"] = "xingxiu/baozang/midong3",
		["west"] = "xingxiu/baozang/midong3",
	},
	room_relative="�ܶ�������-----�ܶ����ܶ�������",
}
Room {
	id = "xingxiu/baozang/jinku",
	name = "���",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/tiantan",
		["east"] = "xingxiu/baozang/midong2",
		["west"] = "xingxiu/baozang/midong2",
	},
	
}
Room {
	id = "xingxiu/baozang/midong1",
	name = "�ܶ�",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/midong1",
		["north"] = "xingxiu/baozang/midong1",
		["east"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/midong1",
	},
}
Room {
	id = "xingxiu/baozang/midong2",
	name = "�ܶ�",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["east"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/midong2",
		["west"] = "xingxiu/baozang/midong2",
	},
}
Room {
	id = "xingxiu/baozang/midong3",
	name = "�ܶ�",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/midong3",
		["north"] = "xingxiu/baozang/midong3",
		["east"] = "xingxiu/baozang/midong3",
		["west"] = "xingxiu/baozang/midong3",
	},
}
Room {
	id = "xingxiu/baozang/midong4",
	name = "�ܶ�",
	ways = {
		["south"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong4",
		["north"] = "xingxiu/baozang/midong4",
		["west"] = "xingxiu/baozang/midong4",
	},
}
Room {
	id = "xingxiu/baozang/mishi",
	name = "����",
	ways = {
		["out"] = "xingxiu/baozang/shuku",
	},
}
Room {
	id = "xingxiu/baozang/shuku",
	name = "�鷿",
	ways = {
		["south"] = "xingxiu/baozang/midong1",
		["east"] = "xingxiu/baozang/midong1",
		["north"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/tiantan",
	},
}
Room {
	id = "xingxiu/baozang/tiantan",
	name = "����",
	ways = {
		["south"] = "xingxiu/baozang/midong2",
		["north"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong1",
		["west"] = "xingxiu/baozang/midong3",
	},
}
Room {
	id = "xingxiu/baozang/yaoku",
	name = "ҩ��",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/baozang/tiantan",
		["north"] = "xingxiu/baozang/midong4",
		["east"] = "xingxiu/baozang/midong4",
		["west"] = "xingxiu/baozang/midong4",
	},
}
Room {
	id = "xingxiu/cangku",
	name = "��Ȼʯ��",
	outdoor = "���޺�",
	ways = {
		["out"] = "xingxiu/xx2",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["�����޶������ϲ᡽��"] = "du jing",
          ["�ɺ�ҩ"] = "menghan yao",
           },
}
Room {
	id = "xingxiu/cave",
	name = "ɽ��",
	outdoor = "���޺�",
	ways = {
		["out"] = "xingxiu/shanshi",
		["zuan"] = "xingxiu/cave2",
	},
	objs = {
          ["����"] = "ju mang",
          ["����"] = "du she",
           },
	precmds = {
		["zuan"] = "use fire;#walkBusy",
	},
	lengths = {
		["zuan"] = "if Bag['����'] then return 10 else return false end",
	},
	
}
Room {
	id = "xingxiu/cave2",
	name = "ɽ��",
	outdoor = "���޺�",
	ways = {
		["zuan out"] = "xingxiu/cave",
	},
	objs = {
          ["ƮȻ��"] = "piaoran zi",
	},
	precmds = {
		["zuan out"] = "use fire;#walkBusy",
	},
	lengths = {
		["zuan out"] = "if Bag['����'] then return 10 else return false end",
	},
	
}
Room {
	id = "xingxiu/chufang",
	name = "����",
	outdoor = "���޺�",
	no_fight = true,
	ways = {
		["east"] = "xingxiu/xx3",
	},
	objs = {
          ["���«"] = "qing hulu",
          ["С����"] = "xiao chuzi",
           },
}
Room {
	id = "xingxiu/daliao/liangcang",
	name = "���",
	ways = {
		["south"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/daliao/shanlu1",
	name = "ɽ·",
	ways = {
		["south"] = "xingxiu/daliao/shulin",
		["northwest"] = "xingxiu/daliao/shanlu2",
	},
	room_relative="���֣�ɽ·ɽ·",
}
Room {
	id = "xingxiu/daliao/shanlu2",
	name = "ɽ·",
	ways = {
		["northup"] = "xingxiu/daliao/shanlu3",
		["southeast"] = "xingxiu/daliao/shanlu1",
	},
	room_relative="ɽ·��ɽ·ɽ·",
}
Room {
	id = "xingxiu/daliao/shanlu3",
	name = "ɽ·",
	ways = {
		["north"] = "xingxiu/daliao/yingmen",
		["southdown"] = "xingxiu/daliao/shanlu2",
	},
	room_relative="Ӫ�ţ�ɽ·ɽ·",
}
Room {
	id = "xingxiu/daliao/shulin",
	name = "����",
	ways = {
		["south"] = "xingxiu/daliao/shulin",
		["east"] = "xingxiu/daliao/shulin",
		["north"] = "xingxiu/daliao/shulin",
		["west"] = "xingxiu/daliao/shulin",
	},
}
Room {
	id = "xingxiu/daliao/yingmen",
	name = "Ӫ��",
	ways = {
		["south"] = "xingxiu/daliao/shanlu3",
		["north"] = "xingxiu/daliao/zhongying",
	},
	room_relative="��Ժ��Ӫ��ɽ·Ӫ��",
}
Room {
	id = "xingxiu/daliao/youtang",
	name = "��Ӫ",
	ways = {
		["west"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/daliao/zhongying",
	name = "��Ժ��Ӫ",
	ways = {
		["south"] = "xingxiu/daliao/yingmen",
		["east"] = "xingxiu/daliao/youtang",
		["north"] = "xingxiu/daliao/liangcang",
		["west"] = "xingxiu/daliao/zuotang",
	},
}
Room {
	id = "xingxiu/daliao/zuotang",
	name = "��Ӫ",
	ways = {
		["east"] = "xingxiu/daliao/zhongying",
	},
}
Room {
	id = "xingxiu/fangpan",
	name = "���̳�",
	outdoor = "���޺�",
	ways = {
		["east"] = "xingxiu/road4",
		["west"] = "xingxiu/road5",
	},
	room_relative="���ﳤ��---���̳�---���ﳤ�Ǵ��̳�",
}
Room {
	id = "xingxiu/jushi",
	name = "��ʯ",
	outdoor = "���޺�",
	ways = {
		["down"] = "xingxiu/xx4",
	},
	room_relative="С·--��ʯ",
}
Room {
	id = "xingxiu/jyg",
	name = "���Ź�",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/jyg_1",
		["north"] = "xingxiu/xiaowu",
		["east"] = "xingxiu/jyge",
		["west"] = "xingxiu/jygw",
	},
	objs = {
          ["�����"] = "hou junji",
           },
	room_relative="���ի�ֵ������С��-----�����ض����ţ����������������Ź�",
}
Room {
	id = "xingxiu/jyg_1",
	name = "���ի�ֵ�",
	outdoor = "���޺�",
	no_fight = true,
	ways = {
		["north"] = "xingxiu/jyg",
	},
	objs = {
          ["����"] = "huang zhen",
           },
	room_relative="���Źأ����ի�ֵ����ի�ֵ�",
}
Room {
	id = "xingxiu/jyge",
	name = "�����ض�����",
	outdoor = "���޺�",
	ways = {
		["eastup"] = "xingxiu/road5",
		["west"] = "xingxiu/jyg",
	},
	precmds = {
		["eastup"] = "#wipe guan bing",
		["west"] = "#wipe guan bing",
	},
	
}
Room {
	id = "xingxiu/jygw",
	name = "������������",
	outdoor = "���޺�",
	ways = {
		["east"] = "xingxiu/jyg",
		["west"] = "xingxiu/silk",
	},
	precmds = {
		["east"] = "#wipe guan bing",
		["west"] = "#wipe guan bing",
	},
	
}
Room {
	id = "xingxiu/mogaoku",
	name = "Ī�߿�",
	outdoor = "���޺�",
	ways = {
		["out"] = "xingxiu/silk3c",
	},
	objs = {
          ["�����۶��ľ�"] = "shu",
          ["������"] = "shu",
          ["������"] = "shu",
           },
	room_relative="����Ȫ--Ī�߿�",
}
Room {
	id = "xingxiu/nanjiang",
    name = "�Ͻ�ɳĮ",
	ways = {
		["northeast"] = "xingxiu/wenquan",
		["north"] = "xingxiu/silk8",
	},
	nolooks = {
		["nw;sw;se;ne"] = true,
        },
	precmds = {
              ["north"] = "#njsm_check",
	},
}
Room {
	id = "xingxiu/road4",
	name = "���ﳤ��",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "lanzhou/wuwei",
		["west"] = "xingxiu/fangpan",
	},
	room_relative="���̳�---���ﳤ�ǨK�������ﳤ��",
}
Room {
	id = "xingxiu/road5",
	name = "���ﳤ��",
	outdoor = "���޺�",
	ways = {
		["westdown"] = "xingxiu/jyge",
		["east"] = "xingxiu/fangpan",
	},
	room_relative="�����ض����š����ﳤ��---���̳����ﳤ��",
}
Room {
	id = "xingxiu/rukou",
	name = "������",
	outdoor = "���޺�",
	ways = {
		["southwest"] = "xingxiu/xx1",
	},
	objs = {
          ["����"] = "kan shou",
           },
	room_relative="�����ڨLɽǰ�ĵس�����",
}
Room {
	id = "xingxiu/ryd",
	name = "���¶�",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/ryd1",
		["north"] = "xingxiu/yaolu",
	},
	lengths = {
		["north"] = "if score.party and score.party=='���޺�' then return 1 else return false end",
	},
	objs = {
          ["������"] = "ding chunqiu",
          ["ժ����"] = "zhaixing zi",
           },
  room_relative="ҩ®�����¶������¶������¶�",
}
Room {
	id = "xingxiu/ryd1",
	name = "���¶���",
	outdoor = "���޺�",
	ways = {
		["east"] = "xingxiu/xxh3",
		["north"] = "xingxiu/ryd",
		["southdown"] = "xingxiu/xx1",
		["west"] = "xingxiu/xxh4",
	},
	--lengths = {
	--	["north"] = "if 1<0 then return false else return 1 end",
	--},
	objs = {
          ["�����̵���"] = "board",
          ["��Ȼ��"] = "anran zi",
           },
   room_relative="���¶������޺�---���¶���---���޺���ɽǰ�ĵ����¶���",
}
Room {
	id = "xingxiu/shamo",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["w;w;w;w;w;w;w;w;w;w"] = "hj/caoyuan",
		["e;e;e;e;e;e;e;e;e;e"] = "xingxiu/silk9",
		["north"] = "xingxiu/shamo1",
	},
	nolooks = {
		["w;w;w;w;w;w;w;w;w;w"] = true,
		["e;e;e;e;e;e;e;e;e;e"] = true,
		["north"] = true,
		["south"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["w;w;w;w;w;w;w;w;w;w"] = 10,
		["e;e;e;e;e;e;e;e;e;e"] = 10,
	},
}
Room {
	id = "xingxiu/shamo1",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo2",
	},
}
Room {
	id = "xingxiu/shamo2",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo3",
	},
}
Room {
	id = "xingxiu/shamo3",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo4",
	},
}
Room {
	id = "xingxiu/shamo4",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo5",
	},
}
Room {
	id = "xingxiu/shamo5",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo6",
	},
}
Room {
	id = "xingxiu/shamo6",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo7",
	},
}
Room {
	id = "xingxiu/shamo7",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo8",
	},
}
Room {
	id = "xingxiu/shamo8",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo9",
	},
}
Room {
	id = "xingxiu/shamo9",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo10",
	},
}
Room {
	id = "xingxiu/shamo10",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo11",
	},
}
Room {
	id = "xingxiu/shamo11",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo12",
	},
}
Room {
	id = "xingxiu/shamo12",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/shamo13",
	},
}
Room {
	id = "xingxiu/shamo13",
	name = "��ɳĮ",
	outdoor = "���޺�",
	ways = {
		["w;w;w;w;w;w;w;w;w;w;w"] = "hj/caoyuan",
		["e;e;e;e;e;e;e;e;e;e;e"] = "xingxiu/silk9",
	},
}
--]]
Room {
	id = "xingxiu/shanjiao",
	name = "��ɽ����",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk9",
		["southwest"] = "hj/senlinn",
		["east"] = "yili/yilih",
		["north"] = "xingxiu/xxh",
	},
	blocks = {
		["southeast"] = {
			{id = "xingxiu dizi", exp = 2000, party = "���޺�"},
		},
		["southwest"] = {
			{id = "xingxiu dizi", exp = 2000, party = "���޺�"},
		},
		["east"] = {
			{id = "xingxiu dizi", exp = 2000, party = "���޺�"},
		},
		["north"] = {
			{id = "xingxiu dizi", exp = 2000, party = "���޺�"},
		},
	},
	
}
Room {
	id = "xingxiu/shanshi",
	name = "ɽʯ",
	outdoor = "���޺�",
	ways = {
		["eastdown"] = "xingxiu/xx6",
		["#xingxiushandong"] = "xingxiu/cave",
	},
	nolooks = {
		["#xingxiushandong"] = true,
	},
	objs = {
          ["ʨ����"] = "shihou zi",
    },
	room_relative="ɽʯ�����߻�·ɽʯ",
}
Room {
	id = "xingxiu/silk",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["southwest"] = "xingxiu/silk1b",
		["northwest"] = "xingxiu/silk1",
		["east"] = "xingxiu/jygw",
	},
	room_relative="���ɽ�I˿��֮·---�����������ŨL������˿��֮·",
}
Room {
	id = "xingxiu/silk1",
	name = "���ɽ",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk",
		["southwest"] = "xingxiu/silk1a",
		["north"] = "xingxiu/silk2",
	},
	room_relative="˿��֮·�����ɽ�L�Kˮ����˿��֮·���ɽ",
}
Room {
	id = "xingxiu/silk10",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/silk8",
		["north"] = "yili/yilih",
	},
	room_relative="��Զ��˿��֮·���¹Ȼ��ٹ��˿��֮·",
}
Room {
	id = "xingxiu/silk1a",
	name = "ˮ����",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk1b",
		["northeast"] = "xingxiu/silk1",
	},
	room_relative="���ɽ�Jˮ�����K������ˮ����",
}
Room {
	id = "xingxiu/silk1b",
	name = "������",
	outdoor = "���޺�",
	ways = {
		["northwest"] = "xingxiu/silk1a",
		["northeast"] = "xingxiu/silk",
	},
	room_relative="ˮ����˿��֮·�I�J������������",
}
Room {
	id = "xingxiu/silk2",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["westup"] = "xingxiu/silk3",
		["south"] = "xingxiu/silk1",
	},
	room_relative="��Ħ�¡�˿��֮·�����ɽ˿��֮·",
}
Room {
	id = "xingxiu/silk3",
	name = "��Ħ��",
	outdoor = "���޺�",
	ways = {
		["eastdown"] = "xingxiu/silk2",
		["westdown"] = "xingxiu/silk4",
		["north"] = "xingxiu/silk3a",
	},
	room_relative="��ɳɽ��˿��֮·����Ħ�¡�˿��֮·��Ħ��",
}
Room {
	id = "xingxiu/silk3a",
	name = "��ɳɽ",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/silk3",
		["west"] = "xingxiu/silk3b",
	},
	room_relative="����----��ɳɽ����Ħ����ɳɽ",
}
Room {
	id = "xingxiu/silk3b",
	name = "����",
	outdoor = "���޺�",
	ways = {
		["northwest"] = "xingxiu/silk3c",
		["east"] = "xingxiu/silk3a",
	},
	room_relative="����Ȫ�I����----��ɳɽ����",
}
Room {
	id = "xingxiu/silk3c",
	name = "����Ȫ",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk3b",
		["west"] = "xingxiu/silk7a",
		["enter hole"] = "xingxiu/mogaoku",
	},
	nolooks = {
		["enter hole"] = true,
	},
	room_relative="��ͷ���----����Ȫ�K��������Ȫ",
}
Room {
	id = "xingxiu/silk4",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["eastup"] = "xingxiu/silk3",
		["northwest"] = "xingxiu/silk5a",
		["west"] = "xingxiu/silk5",
	},
	room_relative="��֬ɽ�Iʯ��---˿��֮·����Ħ��˿��֮·",
}
Room {
	id = "xingxiu/silk5",
	name = "ʯ��",
	outdoor = "���޺�",
	ways = {
		["northup"] = "xingxiu/silk5a",
		["south"] = "xingxiu/silk5b",
		["northwest"] = "xingxiu/silk6",
		["east"] = "xingxiu/silk4",
	},
	room_relative="˿��֮·��֬ɽ�I��ʯ��-----˿��֮·����¡ɽʯ��",
}
Room {
	id = "xingxiu/silk5a",
	name = "��֬ɽ",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk4",
		["northwest"] = "xingxiu/silk7a",
		["southdown"] = "xingxiu/silk5",
	},
	room_relative="��ͷ���I��֬ɽ���Kʯ��˿��֮·��֬ɽ",
}
Room {
	id = "xingxiu/silk5b",
	name = "��¡ɽ",
	outdoor = "���޺�",
	ways = {
		["north"] = "xingxiu/silk5",
	},
	room_relative="ʯ�ţ���¡ɽ��¡ɽ",
}
Room {
	id = "xingxiu/silk6",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk5",
		["southwest"] = "group/entry/mjshamo1",
		["northwest"] = "xingxiu/silk7",
	},
	room_relative="ɳ�ިI˿��֮·�L�K��ɳĮʯ��˿��֮·",
}
Room {
	id = "xingxiu/silk7",
	name = "ɳ��",
	outdoor = "���޺�",
	ways = {
		["northup"] = "xingxiu/silk7a",
		["southeast"] = "xingxiu/silk6",
		["west"] = "xingxiu/silk8",
	},
	room_relative="��ͷ�����¹Ȼ��ٹ��-----ɳ�ިK˿��֮·ɳ��",
}
Room {
	id = "xingxiu/silk7a",
	name = "��ͷ���",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk5a",
		["east"] = "xingxiu/silk3c",
		["southdown"] = "xingxiu/silk7",
	},
	room_relative="��ͷ���---����Ȫ���Kɳ����֬ɽ��ͷ���",
}
Room {
	id = "xingxiu/silk8",
	name = "�¹Ȼ��ٹ��",
	outdoor = "���޺�",
	ways = {
                ["#eaeac"] = "xingxiu/silk9",
                ["#eaead"] = "xingxiu/silk10",
                ["#eaeab"] = "xingxiu/bank",
                ["#eaea"] = "xingxiu/silk7",
                --["east"] = "xingxiu/silk7",
        },
        --lengths = {
                --["#eaea"] = 10,
        --},
        nolooks = {
                ["south"] = true,
        },
		----room_relative="˿��֮·˿��֮·�I����ի--�¹Ȼ��ٹ��--ɳ�ޣ��¹Ȼ��ٹ��",
}
Room {
	id = "xingxiu/silk9",
	name = "˿��֮·",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/silk8",
		["northwest"] = "xingxiu/shanjiao",
		["west"] = "xingxiu/shamo",
	},
	room_relative="��ɽ���¨I��ɳĮ---˿��֮·�K�¹Ȼ��ٹ��˿��֮·",
}
Room {
	id = "xingxiu/tianshan",
	name = "��ɽɽ·",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "hj/senlinn",
		["west"] = "tianshan/kongchang",
	},
	room_relative="��Ҷ�֣��ճ���ɽɽ·",
}
Room {
	id = "xingxiu/wenquan",
	name = "��ˮ��Ȫ",
	outdoor = "���޺�",
	ways = {
		["northeast"] = "xingxiu/silk8",
	},
	room_relative="�¹Ȼ��ٹ����ˮ��Ȫ",
}
Room {
	id = "xingxiu/xiaowu",
	name = "����С��",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/jyg",
	},
	objs = {
          ["�����"] = "ma guangzuo",
           },
  room_relative="����С�ݣ����Ź�����С��",
}
Room {
	id = "xingxiu/xiaoyao",
	name = "��ң��",
	outdoor = "���޺�",
	no_fight = true,
	ways = {
		["out"] = "xingxiu/xx3",
	},
	room_relative="ʯ��--��ң��",
}
Room {
	id = "xingxiu/xx1",
	name = "ɽǰ�ĵ�",
	outdoor = "���޺�",
	ways = {
		["northup"] = "xingxiu/ryd1",
		["south"] = "xingxiu/xxh2",
		["northwest"] = "xingxiu/xx2",
		["northeast"] = "xingxiu/rukou",
	},
	objs = {
          ["������"] = "feitian zi",
           },
	room_relative="���޺����¶��ڳ����ڨI���Jɽǰ�ĵأ����޺�ɽǰ�ĵ�",
}
Room {
	id = "xingxiu/xx2",
	name = "���޺�",
	outdoor = "���޺�",
	ways = {
		["southeast"] = "xingxiu/xx1",
		["enter"] = "xingxiu/cangku",
		["west"] = "xingxiu/xx3",
	},
	blocks = {
		["enter"] = {
			{id = "chuchen zi", exp = 200000},
		},
         precmds = {
              ["enter"] = "kill chuchen zi",
	},
	},
	objs = {
          ["������"] = "chuchen zi",
           },
  
}
Room {
	id = "xingxiu/xx3",
	name = "ʯ��",
	outdoor = "���޺�",
	ways = {
		["enter"] = "xingxiu/xiaoyao",
		["east"] = "xingxiu/xx2",
		["west"] = "xingxiu/chufang",
	},
	blocks = {
		["enter"] = {
			{id = "caihua zi", exp = 25000, party = "���޺�"},
         	},
	precmds = {
              ["enter"] = "kill caihua zi",
		},
	},
	
}
Room {
	id = "xingxiu/xx4",
	name = "С·",
	outdoor = "���޺�",
	ways = {
		["northup"] = "xingxiu/xx5",
		["south"] = "xingxiu/xxh2",
		["west"] = "xingxiu/xxh1",
	},
	objs = {
          ["������"] = "tianlang zi",
           },
	room_relative="ɽ�ڡ����޺�-----С·�����޺�С·",
}
Room {
	id = "xingxiu/xx5",
	name = "ɽ��",
	outdoor = "���޺�",
	ways = {
		["southdown"] = "xingxiu/xx4",
	},
	room_relative="ɽ�ڡ�С·ɽ��",
}
Room {
	id = "xingxiu/xx6",
	name = "���߻�·",
	outdoor = "���޺�",
	ways = {
		["westup"] = "xingxiu/shanshi",
		["south"] = "xingxiu/xxh4",
		["north"] = "xingxiu/xxh3",
		["east"] = "xingxiu/xxh2",
	},
	room_relative="���޺���ɽʯ�����߻�·---���޺������޺����߻�·",
}
Room {
	id = "xingxiu/xxh",
	name = "���޺�",
	outdoor = "���޺�",
	ways = {
		--["southeast"] = "yili/yilih",
		["south"] = "xingxiu/shanjiao",
		["north"] = "xingxiu/xxh1",
	},
	objs = {
          ["����"] = "azi",
           },
	room_relative="���޺������޺����K��ɽ���»�Զ���޺�",
}
--[[
Room {
	id = "xingxiu/xxhn",
	name = "���޺�",
	ways = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = "xingxiu/shanjiao",
		["n;n;n;n;n;n;n;n;n;n;n"] = "xingxiu/xx1",
		["e;e;e;e;e;e"] = "xingxiu/xx4",
		["w;w;w;w;w"] = "xingxiu/xx6",
	},
	nolooks = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = true,
		["n;n;n;n;n;n;n;n;n;n;n"] = true,
		["e;e;e;e;e;e"] = true,
		["w;w;w;w;w"] = true,
		["north"] = true,
		["south"] = true,
		["east"] = true,
		["west"] = true,
	},
	lengths = {
		["s;s;s;s;s;s;s;s;s;s;s;s"] = 12,
		["n;n;n;n;n;n;n;n;n;n;n"] = 11,
		["e;e;e;e;e;e"] = 6,
		["w;w;w;w;w"] = 5,
	},
	find = {
		path = {"e","n","w"},
	},
}
--]]
Room {
  id = "xingxiu/xxh1",
  name = "���޺�",
  outdoor = "���޺�",
  ways = {
    ["east"]  = "xingxiu/xxh2",
  },
}
Room {
  id = "xingxiu/xxh2",
  name = "���޺�",
  outdoor = "���޺�",
  ways = {
    ["north"] = "xingxiu/xxh3",
  }, 
}
Room {
  id = "xingxiu/xxh3",
  name = "���޺�",
  outdoor = "���޺�",
  ways = {
    ["west"]  = "xingxiu/xxh4",
  },
}
Room {
  id = "xingxiu/xxh4",
  name = "���޺�",
  outdoor = "���޺�",
  ways = {
    ["s;s;s;s;s;s;s"] = "xingxiu/xxh",
    ["n;n;n;n;n;n"] = "xingxiu/xx1",
    ["e;e;e"] = "xingxiu/xx4",
    ["w;w;w"] = "xingxiu/xx6",
  },
  nolooks = {
    ["s;s;s;s;s;s;s"] = true,
    ["n;n;n;n;n;n"] = true,
    ["e;e;e"] = true,
    ["w;w;w"] = true,
  },
}
Room {
	id = "xingxiu/yaolu",
	name = "ҩ®",
	outdoor = "���޺�",
	ways = {
		["south"] = "xingxiu/ryd",
	},
	room_relative="���¶�--ҩ®",
}
Room {
	id = "yili/house",
	name = "������Ժ",
	outdoor = "�����",
	ways = {
		["west"] = "yili/yili2",
	},
	room_relative="������---������Ժ������Ժ",
}
Room {
	id = "yili/kezhan",
	name = "��ջ",
	outdoor = "�����",
	ways = {
		["southeast"] = "yili/yili2",
		["up"] = "yili/kezhan2",
	},
	objs = {
          ["����ľ��"] = "alamuhan",
           },
precmds = {
		["up"] = "give xiao 5 silver",
	},
	room_relative="��ջ��¥����ջ�K�����Ŀ�ջ",
}
Room {
	id = "yili/kezhan2",
	name = "��ջ��¥",
	outdoor = "�����",
	ways = {
		["down"] = "yili/kezhan",
	},
}
Room {
	id = "yili/store",
	name = "����",
	outdoor = "�����",
	ways = {
		["east"] = "yili/yili2",
	},
	objs = {
          ["������"] = "maimaiti",
           },
	room_relative="����-----����������",
}
Room {
	id = "yili/store1",
	name = "����",
	outdoor = "�����",
	ways = {
		["south"] = "yili/yili2",
	},
	objs = { 
          ["Ѧ��"] = "xue zhu",
           },
	room_relative="���̣�����������",
}
Room {
	id = "yili/yilih",
	name = "��Զ",
	outdoor = "�����",
	ways = {
		["south"] = "xingxiu/silk10",
		["northwest"] = "xingxiu/xxh",
		["north"] = "yili/yilihe",
		["west"] = "xingxiu/shanjiao",
	},
	room_relative="���޺�����ӨI����ɽ����-----��Զ��˿��֮·��Զ",
}
Room {
	id = "yili/yili1",
	name = "�ϳ���",
	outdoor = "�����",
	ways = {
		["#yilicheckwds"] = "yili/yilihe",
		["#yilicheckwd"] = "yili/yili2",
	},
	nolooks = {
		--["north"] = true,
		["#yilicheckwd"] = true,
	},
	lengths = {
		--["north"] = "if MidNight[locl.time] then return false else return 1 end",
		["#yilicheckwd"] = "if MidNight[locl.time] and job.area~='�����' and job.area~='�ϳ���' then return false else return 1 end",
	},
         room_relative="�����ģ��ϳ��ţ�������ϳ���",
}
Room {
	id = "yili/yili2",
	name = "������",
	outdoor = "�����",
	ways = {
		["south"] = "yili/yili1",
		["northwest"] = "yili/kezhan",
		["north"] = "yili/store1",
		["east"] = "yili/house",
		["west"] = "yili/store",
	},
	room_relative="��ջ���̨I������----������----������Ժ���ϳ��ų�����",
}
Room {
	id = "yili/yilihe",
	name = "�����",
	outdoor = "�����",
	ways = {
		["south"] = "yili/yilih",
		["north"] = "yili/yili1",
	},
	room_relative="�ϳ��ţ�����ӣ���Զ�����",
}
Room {
	id = "xueshan/anshi",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/fatang2",
	},
}
Room {
	id = "xueshan/binglinfeng",
	name = "���ַ�",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/shanpo",
	},
}
Room {
	id = "xueshan/boluomiyuan",
	name = "������Ժ",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/huilang8",
	},
	room_relative="������---������Ժ������Ժ",
}
Room {
	id = "xueshan/caishichang",
	name = "��ʯ��",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/cunluo1",
		["west"] = "xueshan/tianyunmc",
	},
	objs = {
          ["ɫ��"] = "se leng",
           },
	room_relative="������----��ʯ�����������ʯ��",
}
Room {
	id = "xueshan/caoyuan/caohai1",
	name = "�ݺ�",
	outdoor = "���ԭ",
	ways = {
		["south"] = "hj/caoyuan2",
		["west"] = "xueshan/caoyuan/caohain",
	},
	nolooks = {
		["north"] = true,
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohain",
	name = "�ݺ�",
	outdoor = "���ԭ",
	ways = {
		["east"] = "xueshan/caoyuan/caohain",
		["west"] = "xueshan/caoyuan/zhaozen",
		["e;n"] = "xueshan/caoyuan/caohai4",
	},
	nolooks = {
		["e;n"] = true,
		["north"] = true,
		["south"] = true,
	},
	find = {
		path = {"e", "n;n;w;e;s;w"},
	},
}
Room {
	id = "xueshan/caoyuan/caohai4",
	name = "�ݺ�",
	outdoor = "���ԭ",
	ways = {
		["north"] = "xueshan/caoyuan/caohai5",
		["south"] = "xueshan/caoyuan/zhaozen",
		["west"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohai5",
	name = "�ݺ�",
	outdoor = "���ԭ",
	ways = {
		["west"] = "xueshan/caoyuan/caohai6",
		["south"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["north"] = true,
		["east"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/caohai6",
	name = "�ݺ�",
	outdoor = "���ԭ",
	ways = {
		["east"] = "xueshan/caoyuan/yingmen",
		["west"] = "xueshan/caoyuan/zhaozen",
	},
	nolooks = {
		["north"] = true,
		["south"] = true,
	},
}
Room {
	id = "xueshan/caoyuan/dazhang",
	name = "ţƤ����",
	outdoor = "���ԭ",
	ways = {
		["south"] = "xueshan/caoyuan/shenfeng",
	},
	objs = {
          ["������"] = "hu bilie",
          ["�����"] = "daer ba",
          ["���ַ���"] = "jinlun fawang",
          ["��Ħ��"] = "nimo xing",
           },
	room_relative="ţƤ���ʣ����ӪţƤ����",
}
Room {
	id = "xueshan/caoyuan/jifeng",
	name = "����Ӫ",
	outdoor = "���ԭ",
	ways = {
		["south"] = "xueshan/caoyuan/yingmen",
		["north"] = "xueshan/caoyuan/shenfeng",
	},
	objs = {
          ["�ܱ�"] = "zhe bie",
           },
  room_relative="���Ӫ������Ӫ��Ӫ�ż���Ӫ",
}
Room {
	id = "xueshan/caoyuan/shenfeng",
	name = "���Ӫ",
	outdoor = "���ԭ",
	ways = {
		["south"] = "xueshan/caoyuan/jifeng",
		["north"] = "xueshan/caoyuan/dazhang",
	},
	objs = {
          ["������"] = "zhe lemi",
           },
	room_relative="ţƤ���ʣ����Ӫ������Ӫ���Ӫ",
}
Room {
	id = "xueshan/caoyuan/yingmen",
	name = "Ӫ��",
	outdoor = "���ԭ",
	ways = {
		["south"] = "xueshan/caoyuan/caohai1",
		["north"] = "xueshan/caoyuan/jifeng",
	},
	 room_relative="����Ӫ��Ӫ�ţ��ݺ�Ӫ��",
}
Room {
	id = "xueshan/caoyuan/zhaozen",
	name = "����",
	outdoor = "���ԭ",
	ways = {
		["w;n"] = "xueshan/caoyuan/caohai5",
	},
	nolooks = {
		["w;n"] = true,
		["east"] = true,
		["west"] = true,
		["south"] = true,
		["north"] = true,
	},
	find = {
		path = {"w", "s"}, count = 10,
	},
}
Room {
	id = "xueshan/chiyangmen",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["enter"] = "xueshan/qingxinshe",
		["west"] = "xueshan/rimulundian",
	},
	room_relative="���������ľ�׵�----�����ų�����",
}
Room {
	id = "xueshan/chufang",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/zhaitang",
	},
	room_relative="������ի�ó���",
}
Room {
	id = "xueshan/cunluo1",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["westup"] = "xueshan/caishichang",
		["north"] = "xueshan/cunluo2",
		["west"] = "xueshan/muchang3",
		["east"] = "xueshan/muchang7",
	},
	room_relative="������������---������---����������",
}
Room {
	id = "xueshan/cunluo2",
	name = "�������",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/cunluo1",
		["north"] = "xueshan/muchang4",
		["west"] = "xueshan/muchang2",
		["east"] = "xueshan/muchang6",
	},
	room_relative="������������-----�����������������",
}
Room {
	id = "xueshan/dachedian",
	name = "�вƴ󳵵�",
	outdoor = "��ѩɽ",
	ways = {
		["enter"] = "xueshan/zhengfang",
		["#xsdachedian"] = "xueshan/jiedao1",
	},
	nolooks = {
		["enter"] = true,
	},
	objs = {
          ["���в�"] = "li zhaocai",
           },
	precmds = {
		["enter"] = "give li 5 silver",
	},
	--Bag[l_name].cnt
	lengths = {
		["enter"] = "if Bag['����'] and Bag['����'].cnt>5 and job.name=='wudang' and flag.times==2 then return 1 else return false end ",
	},
	room_relative="�����Ľֵ�--�вƴ󳵵��вƴ󳵵�",
}
Room {
	id = "xueshan/dadian",
	name = "�����",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/huilang4",
		["westdown"] = "xueshan/huilang3",
		["north"] = "xueshan/queridian",
		["southdown"] = "xueshan/guangchang",
	},
	objs = {
          ["��������"] = "lingzhi shangren",
	room_relative="ȴ�յ�������ȡ������������ȡ���ǰ�㳡�����",
           },
}
Room {
	id = "xueshan/daritang",
	name = "���շ���",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/luoweitang",
	},
	objs = {
          ["�ܲ���͵�"] = "huo fo",
           },
	room_relative="��΢��---���շ��ô��շ���",
}
Room {
	id = "xueshan/fanyinge",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["northwest"] = "xueshan/fotang",
		["east"] = "xueshan/jingtang",
		["north"] = "xueshan/fatang",
		["southdown"] = "xueshan/hufazhacang",
		["west"] = "xueshan/jingangyuan",
	},
	nolooks = {
		["northwest"] = true,
	},
	precmds = {
		["northwest"] = "open door",
	},
	blocks = {
		["northwest"] = {
			{id = "hufa lama", exp = 600000, party = "��ѩɽ"},
		},
       precmds = {
              ["northwest"] = "kill hufa lama",
	},
	},
	
}
Room {
	id = "xueshan/fatang",
	name = "���ȷ���",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/fanyinge",
		["up"] = "xueshan/fatang2",
	},
	blocks = {
		["up"] = {
			{id = "zayi lama", exp = 30000, party = "��ѩɽ"},
             },
	precmds = {
              ["up"] = "kill zayi lama",
		},
	},
	
}
Room {
	id = "xueshan/fatang2",
	name = "���ö�¥",
	outdoor = "��ѩɽ",
	ways = {
		["down"] = "xueshan/fatang",
	},
	objs = {
          ["�Ħ��"] = "jiumo zhi",
           },
	room_relative="���ȷ���--���ö�¥",
}
Room {
	id = "xueshan/fengjiantai",
	name = "���̨",
	outdoor = "��ѩɽ",
	ways = {
		["northup"] = "xueshan/xuelingquan",
		["eastdown"] = "xueshan/shanlu4",
		["west"] = "xueshan/luofenggang",
	},
	room_relative="ѩ��Ȫ������----���̨�����Ŀڷ��̨",
}
Room {
	id = "xueshan/fotang",
	name = "��®����",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/fanyinge",
		["west"] = "xueshan/lingtalin",
	},
	room_relative="������---��®���èK������®����",
}
Room {
	id = "xueshan/fozhaomen",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/zanpugc",
		["west"] = "xueshan/xiaolu3",
	},
	room_relative="����С·----������----���չ㳡������",
}
Room {
	id = "xueshan/guangchang",
	name = "��ǰ�㳡",
	outdoor = "��ѩɽ",
	ways = {
		["northup"] = "xueshan/dadian",
		["west"] = "xueshan/huilang1",
		["east"] = "xueshan/huilang2",
		["southdown"] = "xueshan/shanmen",
	},
	nolooks = {
		["southdown"] = true,
	},
	precmds = {
		["southdown"] = "pull gate",
	},
	objs = {
          ["���ֲ���"] = "heilin bofu",
          ["�����±羭��"] = "board",
	room_relative="������������---��ǰ�㳡---�����ȡ�������ɽ�ŵ�ǰ�㳡",
           },
}
Room {
	id = "xueshan/gulou",
	name = "��¥",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/huilang2",
	},
	room_relative="������-----��¥��¥",
}
Room {
	id = "xueshan/houzidong",
	name = "���Ӷ�",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/jiaopan",
		["westup"] = "xueshan/shanlu7",
	},
	room_relative="ѩ���ŵ������Ӷ��K���̺��Ӷ�",
}
Room {
	id = "xueshan/huanggong",
	name = "�ʹ�",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/zanpugc",
	},
	room_relative="���չ㳡-----�ʹ��ʹ�",
}
Room {
	id = "xueshan/hubian",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/xiaolu3",
	},
	room_relative="���ߣ�����С·����",
}
Room {
	id = "xueshan/hufazhacang",
	name = "��������",
	outdoor = "��ѩɽ",
	ways = {
		["northup"] = "xueshan/fanyinge",
		["south"] = "xueshan/rimulundian",
		["east"] = "xueshan/jingjinzhacang",
		["west"] = "xueshan/kuxiuzhacang",
	},
	room_relative="���������������---��������---�������֣���ľ�׵������",
}
Room {
	id = "xueshan/huilang1",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/huilang3",
		["east"] = "xueshan/guangchang",
		["west"] = "xueshan/zhonglou",
	},
	room_relative="�����ȣ���¥----������----��ǰ�㳡������",
}
Room {
	id = "xueshan/huilang2",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/huilang4",
		["east"] = "xueshan/gulou",
		["west"] = "xueshan/guangchang",
	},
	room_relative="�����ȣ���ǰ�㳡----������----��¥������",
}
Room {
	id = "xueshan/huilang3",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["eastup"] = "xueshan/dadian",
		["south"] = "xueshan/huilang1",
		["north"] = "xueshan/huilang5",
		["west"] = "xueshan/jieyuantang",
	},
	room_relative="�����ȣ���Ե��----�����ȡ�������������������",
}
Room {
	id = "xueshan/huilang4",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["westup"] = "xueshan/dadian",
		["south"] = "xueshan/huilang2",
		["east"] = "xueshan/luoweitang",
		["north"] = "xueshan/huilang6",
	},
	room_relative="�����ȣ�������������----��΢�ã�������������",
}
Room {
	id = "xueshan/huilang5",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["eastup"] = "xueshan/queridian",
		["south"] = "xueshan/huilang3",
		["north"] = "xueshan/huilang7",
		["west"] = "xueshan/jishantang",
	},
	room_relative="�����ȣ�������----�����ȡ�ȴ�յ��������������",
}
Room {
	id = "xueshan/huilang6",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["westup"] = "xueshan/queridian",
		["south"] = "xueshan/huilang4",
		["east"] = "xueshan/yimogong",
		["north"] = "xueshan/huilang8",
	},
	room_relative="�����ȣ�ȴ�յ��������----��Ħ����������������",
}
Room {
	id = "xueshan/huilang7",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["eastup"] = "xueshan/zhudubadian",
		["south"] = "xueshan/huilang5",
		["west"] = "xueshan/yushengdian",
	},
	objs = {
          ["������"] = "hu bayin",
	room_relative="��ʥ��----�����ȡ��鶼�͵��������������",
           },
}
Room {
	id = "xueshan/huilang8",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["westup"] = "xueshan/zhudubadian",
		["south"] = "xueshan/huilang6",
		["east"] = "xueshan/boluomiyuan",
	},
 room_relative="�鶼�͵��������----������Ժ��������������",
}
Room {
	id = "xueshan/jiaopan",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["northwest"] = "xueshan/houzidong",
	},
	room_relative="���Ӷ��I���̽���",
}
Room {
	id = "xueshan/jiedao1",
	name = "�ֵ�",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/mingxiamen",
		["north"] = "xueshan/jiedao2",
		["east"] = "xueshan/dachedian",
		["west"] = "xueshan/menghuying",
	},
	room_relative="�ֵ����ͻ�Ӫ-----�ֵ�-----�вƴ󳵵����ϼ�Žֵ�",
}
Room {
	id = "xueshan/jiedao2",
	name = "�ֵ�",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jiedao1",
		["north"] = "xueshan/zanpugc",
		["east"] = "xueshan/yixianglou",
		["west"] = "xueshan/zuofang",
	},
	room_relative="���չ㳡����ެ֯������-----�ֵ�-----����¥���ֵ��ֵ�",
}
Room {
	id = "xueshan/jiedao3",
	name = "�ֵ�",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/zanpugc",
		["east"] = "xueshan/wangdali",
		["north"] = "xueshan/jushuimen",
		["west"] = "xueshan/laifu",
	},
	room_relative="��ˮ�ţ������ӻ�-----�ֵ�-----�������ǣ����չ㳡�ֵ�",
}
Room {
	id = "xueshan/jieyuantang",
	name = "��Ե��",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/huilang3",
	},
	room_relative="��Ե��----�����Ƚ�Ե��",
}
Room {
	id = "xueshan/jifengying",
	name = "����Ӫ",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/yingmen",
		["north"] = "xueshan/shenfengying",
	},
	room_relative="Ӫ�ţ����Ӫ����Ӫ",
}
Room {
	id = "xueshan/jingangyuan",
	name = "���Ժ",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/kuxiuzhacang",
		["east"] = "xueshan/fanyinge",
	},
	room_relative="���Ժ----��������������ֽ��Ժ",
}
Room {
	id = "xueshan/jingjinzhacang",
	name = "��������",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/jingtang",
		["west"] = "xueshan/hufazhacang",
	},
	objs = {
          ["����"] = "shan yong",
           },
	room_relative="���ã���������---�������־�������",
}
Room {
	id = "xueshan/jingtang",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jingjinzhacang",
		["west"] = "xueshan/fanyinge",
	},
	room_relative="������----���ã��������ִ���",
}
Room {
	id = "xueshan/jishantang",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/huilang5",
	},
	room_relative="������----�����Ȼ�����",
}
Room {
	id = "xueshan/jlshan",
	name = "����ɽ",
	outdoor = "��ѩɽ",
	ways = {
		["southdown"] = "xueshan/tianxi",
	},
	room_relative="��Ϫ--����ɽ",
}
Room {
	id = "xueshan/juechenyuan",
	name = "����Ժ",
	outdoor = "��ѩɽ",
	no_fight = true,
	ways = {
		["out"] = "xueshan/yueliangmen",
	},
	room_relative="����Ժ�������ž���Ժ",
}
Room {
	id = "xueshan/jueding",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["down"] = "xueshan/shanpo",
	},
	room_relative="����̨--����",
}
Room {
	id = "xueshan/jushuimen",
	name = "��ˮ��",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jiedao3",
		["north"] = "xueshan/tianyunmc",
	},
	room_relative="����������ˮ�ţ��ֵ���ˮ��",
}
Room {
	id = "xueshan/kuxiuzhacang",
	name = "��������",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/jingangyuan",
		["east"] = "xueshan/hufazhacang",
	},
	objs = {
          ["ʤ��"] = "sheng di",
           },
	room_relative="���Ժ����������---�������ֿ�������",
}
Room {
	id = "xueshan/laifu",
	name = "�����ӻ�",
	outdoor = "��ѩɽ",
	no_fight = true,
	ways = {
		["east"] = "xueshan/jiedao3",
	},
	objs = {
          ["������"] = "jiang laifu",
           },
	room_relative="�����ӻ�---�ֵ������ӻ�",
}
Room {
	id = "xueshan/lingtalin",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/fotang",
		["enter"] = "xueshan/baota1",
		-- ["westup"] = "xueshan/xuelu1",
	},
	nolooks = {
		["westup"] = true,
	},
	room_relative="�����������Ļ�ѩС·��������----��®����������",
}
Room {
	id = "xueshan/baota1",
	name = "����������",
	outdoor = "��ѩɽ",
	ways = {
		["out"] = "xueshan/lingtalin",
	},
	room_relative="����������������������������",
}
Room {
	id = "xueshan/luofenggang",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/fengjiantai",
		["tiao down"] = "xueshan/xuegu",
	},
	nolooks = {
		["tiao down"] = true,
	},
	room_relative="����----���̨����",
}
Room {
	id = "xueshan/luoweitang",
	name = "��΢��",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/daritang",
		["west"] = "xueshan/huilang4",
	},
	objs = {
          ["������"] = "zheluo xing",
           },
	room_relative="������----��΢��----���շ�����΢��",
}
Room {
	id = "xueshan/menghuying",
	name = "�ͻ�Ӫ",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/jiedao1",
	},
	room_relative="�ͻ�Ӫ----�ֵ��ͻ�Ӫ",
}
Room {
	id = "xueshan/mingxiamen",
	name = "��ϼ��",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/tulu3",
		["north"] = "xueshan/jiedao1",
	},
	room_relative="�ֵ�����ϼ��----�ر���·��ϼ��",
}
Room {
	id = "xueshan/muchang1",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang2",
		["east"] = "xueshan/muchang4",
		["north"] = "xueshan/muchang1",
		["west"] = "xueshan/muchang1",
	},
	objs = {
          ["����"] = "zang ao",
           },
	room_relative="����������----��������������",
}
Room {
	id = "xueshan/muchang2",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang3",
		["north"] = "xueshan/muchang1",
		["west"] = "xueshan/muchang2",
		["east"] = "xueshan/cunluo2",
	},
	room_relative="����������----����������������",
}
Room {
	id = "xueshan/muchang3",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang3",
		["north"] = "xueshan/muchang2",
		["west"] = "xueshan/muchang3",
		["east"] = "xueshan/cunluo1",
	},
	room_relative="����������----����������������",
}
Room {
	id = "xueshan/muchang4",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/cunluo2",
		["north"] = "xueshan/muchang4",
		["west"] = "xueshan/muchang1",
		["east"] = "xueshan/muchang5",
	},
	objs = {
          ["��ţ"] = "mao niu",
           },
	room_relative="����������----����������������",
}
Room {
	id = "xueshan/muchang5",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang6",
		["north"] = "xueshan/muchang5",
		["west"] = "xueshan/muchang1",
		["east"] = "xueshan/muchang5",
	},
	room_relative="����������----��������������",
}
Room {
	id = "xueshan/muchang6",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang7",
		["north"] = "xueshan/muchang5",
		["west"] = "xueshan/cunluo2",
		["east"] = "xueshan/muchang6",
	},
	room_relative="����������----����������������",
}
Room {
	id = "xueshan/muchang7",
	name = "����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/muchang7",
		["east"] = "xueshan/muchang7",
		["north"] = "xueshan/muchang6",
		["west"] = "xueshan/cunluo1",
	},
	room_relative="����������----����������������",
}
Room {
	id = "xueshan/niupidazhang",
	name = "ţƤ����",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/shenfengying",
	},
	room_relative="���Ӫ--ţƤ����",
}
Room {
	id = "xueshan/qingxinshe",
	name = "������",
	outdoor = "��ѩɽ",
	no_fight = true,
	ways = {
		["out"] = "xueshan/chiyangmen",
	},
	room_relative="������ų�����������",
}
Room {
	id = "xueshan/queridian",
	name = "ȴ�յ�",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/huilang6",
		["westdown"] = "xueshan/huilang5",
		["south"] = "xueshan/dadian",
		["north"] = "xueshan/zhudubadian",
	},
	objs = {
          ["Ħڭ��˼"] = "mohe basi",
           },
	room_relative="�鶼�͵�������ȡ�ȴ�յ�������ȣ������ȴ�յ�",
}
Room {
	id = "xueshan/rimulundian",
	name = "��ľ�׵�",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/zhaitang",
		["north"] = "xueshan/hufazhacang",
		["east"] = "xueshan/chiyangmen",
		["west"] = "xueshan/yueliangmen",
		["out"] = "xueshan/xiekemen",
	},
	blocks = {
		["southeast"] = {
			{id = "hufa lama", exp = 100000, party = "��ѩɽ"},
		},
		["east"] = {
                        {id = "hufa lama", exp = 100000, party = "��ѩɽ"},
                },
                ["west"] = {
                        {id = "hufa lama", exp = 100000, party = "��ѩɽ"},
                },
        	precmds = {
              ["southeast"] = "kill hufa lama",
			  ["east"] = "kill hufa lama",
			  ["west"] = "kill hufa lama",
	},
	},
	
}
Room {
	id = "xueshan/shanlu1",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["northwest"] = "xueshan/shanlu2",
		["east"] = "xueshan/tianhu",
	},
	room_relative="ǧ����I������----���������",
}
Room {
	id = "xueshan/shanlu2",
	name = "ǧ����",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/shanlu1",
		["westup"] = "xueshan/shanlu3",
	
   },
	room_relative="ǧ�����ǧ����K������ǧ����",
}
Room {
	id = "xueshan/shanlu3",
	name = "ǧ����",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/shanlu2",
		["westdown"] = "xueshan/shanlu4",
     },
   precmds = {
		["westdown"] = "#walkBusy",
   },
	room_relative="���Ŀڡ�ǧ�����ǧ����ǧ����",
}
Room {
	id = "xueshan/shanlu4",
	name = "���Ŀ�",
	outdoor = "��ѩɽ",
	ways = {
		["eastup"] = "xueshan/shanlu3",
		["westup"] = "xueshan/fengjiantai",
	},
	precmds = {
		["eastup"] = "#walkBusy",
		["westup"] = "#walkBusy",
	},
	objs = {
          ["����"] = "bao xiang",
           },
	room_relative="���̨�����Ŀڡ�ǧ�������Ŀ�",
}
Room {
	id = "xueshan/shanlu5",
	name = "ѩ���ŵ�",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/shanlu6",
		["southwest"] = "xueshan/xuelingquan",
	},
	objs = {
          ["ѩ��Ƥ"] = "bao pi",
		  ["ѩ��"] = "xue bao",
           },
	room_relative="ѩ���ŵ��L�Kѩ��Ȫѩ���ŵ�ѩ���ŵ�",
}
Room {
	id = "xueshan/shanlu6",
	name = "ѩ���ŵ�",
	outdoor = "��ѩɽ",
	ways = {
		["eastup"] = "xueshan/shanlu7",
		["northwest"] = "xueshan/shanlu5",
	},
	room_relative="ѩ���ŵ��Iѩ���ŵ���ѩ���ŵ�ѩ���ŵ�",
}
Room {
	id = "xueshan/shanlu7",
	name = "ѩ���ŵ�",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/houzidong",
		["westdown"] = "xueshan/shanlu6",
		["northwest"] = "xueshan/shanmen",
	},
	room_relative="������ɽ�ŨIѩ���ŵ���ѩ���ŵ������Ӷ�ѩ���ŵ�",
}
Room {
	id = "xueshan/shanmen",
	name = "������ɽ��",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "xueshan/shanlu7",
		["northup"] = "xueshan/guangchang",
	},
	nolooks = {
		["northup"] = true,
	},
	precmds = {
		["northup"] = "knock gate;#walkBusy",
	},
	room_relative="��ǰ�㳡��������ɽ�ŨKѩ���ŵ�������ɽ��",
}
Room {
	id = "xueshan/shanpo",
	name = "����̨",
	outdoor = "��ѩɽ",
	ways = {
		["southdown"] = "xueshan/xuelu3",
		["east"] = "xueshan/binglinfeng",
	},
	room_relative="��ѩС·�����ַ�����̨",
}
Room {
	id = "xueshan/shenfengying",
	name = "���Ӫ",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jifengying",
		["north"] = "xueshan/niupidazhang",
	},
	room_relative="����Ӫ��ţƤ�������Ӫ",
}
Room {
	id = "xueshan/tianhu",
	name = "���",
	outdoor = "��ѩɽ",
	ways = {
		["southwest"] = "xueshan/xiaolu1",
		["south"] = "xueshan/xiaodian",
		["north"] = "xueshan/tianxi",
		["west"] = "xueshan/shanlu1",
	},
	objs = {
          ["֧��Ѽ"] = "zhima ya",
          ["��ͷ��"] = "bantou yan",
           },
	room_relative="��Ϫ��������-----����L������С·����С�����",
}
Room {
	id = "xueshan/tianxi",
	name = "��Ϫ",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/tianhu",
	},
	room_relative="��Ϫ�������Ϫ",
}
Room {
	id = "xueshan/tianyunmc",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jushuimen",
		["east"] = "xueshan/caishichang",
	},
	room_relative="������---��ʯ������ˮ��������",
}
Room {
	id = "xueshan/tulu1",
	name = "������·",
	outdoor = "��ѩɽ",
	ways = {
		["southwest"] = "group/entry/xstulu2",
		["east"] = "chengdu/wroad2",
	},
	room_relative="������·---����L�ر���·������·",
}
Room {
	id = "xueshan/tulu3",
	name = "�ر���·",
	outdoor = "��ѩɽ",
	ways = {
		["northeast"] = "group/entry/xstulu2",
		["west"] = "xueshan/mingxiamen",
	},
	room_relative="�ر���·�J��ϼ��---�ر���·�ر���·",
}
Room {
	id = "xueshan/wangdali",
	name = "��������",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/jiedao3",
	},
	objs = {
          ["������"] = "wang sanli",
           },
	room_relative="�ֵ�---����������������",
}
Room {
	id = "xueshan/xiaodian",
	name = "����С��",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/tianhu",
	},
	objs = {
          ["���"] = "da chou",
          ["����"] = "san chou",
          ["����"] = "er chou",
          ["�ĳ�"] = "si chou",
          ["���"] = "wu chou",
           },
	room_relative="���������С�����С��",
}
Room {
	id = "xueshan/xiaolu1",
	name = "����С·",
	outdoor = "��ѩɽ",
	ways = {
		["southeast"] = "group/entry/xsxiao2",
		["northeast"] = "xueshan/tianhu",
	},
	room_relative="����J����С·�K����С·����С·",
}
Room {
	id = "xueshan/xiaolu3",
	name = "����С·",
	outdoor = "��ѩɽ",
	ways = {
		["north"] = "xueshan/hubian",
		["east"] = "xueshan/fozhaomen",
		["west"] = "group/entry/xsxiao2",
	},
	room_relative="���ߣ�����С·---����С·---�����ź���С·",
}
Room {
	id = "xueshan/xiekemen",
	name = "л��ͤ",
	outdoor = "��ѩɽ",
	ways = {
		["southup"] = "xueshan/zhudubadian",
		["enter"] = "xueshan/rimulundian",
	},
	nolooks = {
		["enter"] = true,
	},
	precmds = {
		["enter"] = "open door",
	},
	blocks = {
		["enter"] = {
			{id = "hufa lama", exp = 100000, party = "��ѩɽ"},
		},
        precmds = {
              ["enter"] = "kill hufa lama",
	},
	},
	objs = {
          ["ɣ��"] = "sang jie",
           },
	
}
Room {
	id = "xueshan/xuegu",
	name = "ѩ��",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/shanlu2",
		["tiao down;#walkBusy"] = "xueshan/xuegu2",
	},
	lengths = {
		--["tiao down;#walkBusy"] = "if hp.shen>0 then return 10 else return false end",
		["tiao down;#walkBusy"] = 10 ,
	},
	objs = {
          ["Ѫ������"] = "xuedao laozu",
           },
	room_relative="ǧ�������ʯѩ��",
}
Room {
	id = "xueshan/xuegu2",
	name = "��ʯ",
	outdoor = "��ѩɽ",
	ways = {
		["ask di yun about �뿪;jump up;#walkBusy"] = "xueshan/xuegu",
		--["#xsMianbi;askk di yun about �뿪;jump up;#walkBusy"] = "xueshan/xuegu",
	},
	--lengths = {
	--	["askk di yun about �뿪;jump up;#walkBusy"] = "if hp.shen>0 then return 1 else return false end",
	--	["#xsMianbi;askk di yun about �뿪;jump up;#walkBusy"] = "if hp.shen<0 then return 1 else return false end",
	--},
	objs = {
          ["����"] = "di yun",
           },
}
Room {
	id = "xueshan/xuelingquan",
	name = "ѩ��Ȫ",
	outdoor = "��ѩɽ",
	ways = {
		["northeast"] = "xueshan/shanlu5",
		["southdown"] = "xueshan/fengjiantai",
		["tiao quanshui"] = "xueshan/quanshui",
	},
	room_relative="ѩ���ŵ��Jѩ��Ȫ�����̨ѩ��Ȫ",
}
Room {
	id = "xueshan/quanshui",
	name = "Ȫˮ��",
	outdoor = "��ѩɽ",
	ways = {
		["tiao out"] = "xueshan/xuelingquan",
	},
	room_relative="ѩ��Ȫ--Ȫˮ��",
}
Room {
	id = "xueshan/xuelu1",
	name = "��ѩС·",
	outdoor = "��ѩɽ",
	ways = {
		["northup"] = "xueshan/xuelu2",
		["eastdown"] = "xueshan/lingtalin",
	},
	room_relative="��ѩС·�������ֻ�ѩС·",
}
Room {
	id = "xueshan/xuelu2",
	name = "��ѩС·",
	outdoor = "��ѩɽ",
	ways = {
		["southdown"] = "xueshan/xuelu1",
		["westup"] = "xueshan/xuelu3",
	},
	room_relative="��ѩС·����ѩС·��ѩС·",
}
Room {
	id = "xueshan/xuelu3",
	name = "��ѩС·",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/xuelu2",
		["northup"] = "xueshan/shanpo",
	},
	room_relative="��ѩС·������̨��ѩС·",
}
Room {
	id = "xueshan/yimogong",
	name = "��Ħ��",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/huilang6",
	},
	objs = {
          ["������"] = "boluo xing",
           },
	room_relative="������----��Ħ����Ħ��",
}
Room {
	id = "xueshan/yingmen",
	name = "Ӫ��",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/caohai1",
		["north"] = "xueshan/jifengying",
	},
	
}
Room {
	id = "xueshan/yixianglou",
	name = "����¥",
	outdoor = "��ѩɽ",
	ways = {
		["west"] = "xueshan/jiedao2",
	},
	objs = {
          ["����"] = "hu gui",
           },
	room_relative="�ֵ�----����¥����¥",
}
Room {
	id = "xueshan/yueliangmen",
	name = "������",
	outdoor = "��ѩɽ",
	ways = {
		["enter"] = "xueshan/juechenyuan",
		["east"] = "xueshan/rimulundian",
	},
	room_relative="����Ժ��������----��ľ�׵�������",
}
Room {
	id = "xueshan/yushengdian",
	name = "��ʥ��",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/huilang7",
	},
	room_relative="��ʥ��----��������ʥ��",
}
Room {
	id = "xueshan/zanpugc",
	name = "���չ㳡",
	outdoor = "��ѩɽ",
	ways = {
		["south"] = "xueshan/jiedao2",
		["north"] = "xueshan/jiedao3",
		["east"] = "xueshan/huanggong",
		["west"] = "xueshan/fozhaomen",
	},
	room_relative="�ֵ���������---���չ㳡---�ʹ����ֵ����չ㳡",
}
Room {
	id = "xueshan/zhaitang",
	name = "ի��",
	outdoor = "��ѩɽ",
	ways = {
	    ["drop cha;northwest"] = "xueshan/rimulundian",
		["drop cha;north"] = "xueshan/chufang",
		["northwest"] = "xueshan/rimulundian",
		["north"] = "xueshan/chufang",
	},
	room_relative="��ľ�׵�����I��ի��ի��",
}
Room {
	id = "xueshan/zhengfang",
	name = "����",
	outdoor = "��ѩɽ",
	no_fight = true,
	ways = {
		["out"] = "xueshan/dachedian",
	},
	room_relative="�вƴ󳵵�--����",
}
Room {
	id = "xueshan/zhonglou",
	name = "��¥",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/huilang1",
	},
	room_relative="��¥-----��������¥",
}
Room {
	id = "xueshan/zhudubadian",
	name = "�鶼�͵�",
	outdoor = "��ѩɽ",
	ways = {
		["eastdown"] = "xueshan/huilang8",
		["westdown"] = "xueshan/huilang7",
		["south"] = "xueshan/queridian",
		["northdown"] = "xueshan/xiekemen",
	},
	objs = {
          ["���Զ�"] = "wenwo er",
	room_relative="л��ͤ�������ȡ��鶼�͵�������ȣ�ȴ�յ��鶼�͵�",
           },
}
Room {
	id = "xueshan/zuofang",
	name = "��ެ֯������",
	outdoor = "��ѩɽ",
	ways = {
		["east"] = "xueshan/jiedao2",
	},
	room_relative="��ެ֯������--�ֵ���ެ֯������",
}
Room {
	id = "zhiye/biaoju1",
	name = "�����ھ�",
	outdoor = "����",
	ways = {
		["south"] = "city/dongmen",
	},
	room_relative="��֪�����������ھ� ��֪������ �����ھ�",
}
Room {
	id = "zhiye/bingqipu1",
	name = "������",
	outdoor = "���ݳ�",
	no_fight = true,
	ways = {
		["north"] = "city/dongdajie0",
	},
	objs = {
          ["��¯"] = "huo lu",
          ["������"] = "han tiejiang",
           },
	room_relative="��֪����������� ��֪������ ������",
}
Room {
	id = "zhiye/caifengpu1",
	name = "�÷���",
	outdoor = "������",
	no_fight = true,
	ways = {
		["east"] = "changan/northjie2",
	},
	objs = {
          ["�÷���"] = "caifeng zhuo",
     },
	 room_relative="��֪������÷��� ��֪������ �÷���",
}
Room {
	id = "zhiye/caikuang-chang0",
	name = "�ɿ����",
	ways = {
		-- ["westup"] = "zhiye/caikuang-chang10",
		["northeast"] = "huanghe/shulin2",
	},
	nolooks = {
		["westup"] = true,
	},
}
Room {
	id = "zhiye/caikuang-chang1",
	name = "ɽ·",
	ways = {
		["south"] = "zhiye/caikuang-chang11",
		["north"] = "zhiye/caikuang-chang11",
		["east"] = "zhiye/caikuang-chang11",
		["southdown"] = "zhiye/caikuang-chang10",
		["west"] = "zhiye/caikuang-chang11",
	},
}
Room {
	id = "zhiye/caikuang-chang10",
	name = "�ɿ�",
	ways = {
		["northup"] = "zhiye/caikuang-chang1",
		["southup"] = "zhiye/caikuang-chang2",
		["eastdown"] = "zhiye/caikuang-chang0",
		["westup"] = "zhiye/caikuang-chang3",
	},
}
Room {
	id = "zhiye/caikuang-chang11",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang1",
	},
}
Room {
	id = "zhiye/caikuang-chang12",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang2",
	},
}
Room {
	id = "zhiye/caikuang-chang13",
	name = "�ɿ�",
	ways = {
		["out"] = "zhiye/caikuang-chang3",
	},
}
Room {
	id = "zhiye/caikuang-chang2",
	name = "ɽ·",
	ways = {
		["south"] = "zhiye/caikuang-chang12",
		["north"] = "zhiye/caikuang-chang12",
		["east"] = "zhiye/caikuang-chang12",
		["northdown"] = "zhiye/caikuang-chang10",
		["west"] = "zhiye/caikuang-chang12",
	},
}
Room {
	id = "zhiye/caikuang-chang3",
	name = "ɽ·",
	ways = {
		["eastdown"] = "zhiye/caikuang-chang10",
		["south"] = "zhiye/caikuang-chang13",
		["east"] = "zhiye/caikuang-chang13",
		["north"] = "zhiye/caikuang-chang13",
		["west"] = "zhiye/caikuang-chang13",
	},
}
Room {
	id = "zhiye/datiepu1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["south"] = "city/dongdajie0",
	},
	room_relative="��֪����������� ��֪������ ������",
}
Room {
	id = "zhiye/gaoshan0",
	name = "��ɽ����",
	outdoor = "�ɶ�����",
	ways = {
		["west"] = "chengdu/road1",
	},
	nolooks = {
		["northup"] = true,
		["southup"] = true,
		["eastup"] = true,
	},
}
Room {
	id = "zhiye/gaoshan1",
	name = "ɽ��",
	ways = {
		["southdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/gaoshan2",
	name = "ɽ��",
	ways = {
		["northdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/gaoshan3",
	name = "ɽ��",
	ways = {
		["westdown"] = "zhiye/gaoshan0",
	},
}
Room {
	id = "zhiye/jiaoliushi1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["east"] = "zhiye/jimaidian1",
	},
	objs = {
          ["���齻����"] = "board",
           },
	room_relative="��֪����������� ��֪������ ������",
}
Room {
	id = "zhiye/jimaidian1",
	name = "������",
	outdoor = "���ݳ�",
	ways = {
		["north"] = "city/dongdajie1",
		["west"] = "zhiye/jiaoliushi1",
	},
	room_relative="��֪����������� ��֪������ ������",
}
Room {
	id = "zhiye/nongtian0",
	name = "ũ���",
	ways = {
		["southeast"] = "zhiye/nongtian2",
		["southwest"] = "zhiye/nongtian1",
		["north"] = "changan/northroad4",
		["northeast"] = "zhiye/nongtian3",
	},
}
Room {
	id = "zhiye/nongtian1",
	name = "�﹡",
	ways = {
		["south"] = "zhiye/nongtian11",
		["north"] = "zhiye/nongtian11",
		["east"] = "zhiye/nongtian11",
		["northeast"] = "zhiye/nongtian0",
		["west"] = "zhiye/nongtian11",
	},
}
Room {
	id = "zhiye/nongtian11",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian1",
	},
}
Room {
	id = "zhiye/nongtian12",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian2",
	},
}
Room {
	id = "zhiye/nongtian13",
	name = "ũ��",
	ways = {
		["out"] = "zhiye/nongtian3",
	},
}
Room {
	id = "zhiye/nongtian2",
	name = "�﹡",
	ways = {
		["south"] = "zhiye/nongtian12",
		["northwest"] = "zhiye/nongtian0",
		["north"] = "zhiye/nongtian12",
		["east"] = "zhiye/nongtian12",
		["west"] = "zhiye/nongtian12",
	},
}
Room {
	id = "zhiye/nongtian3",
	name = "�﹡",
	ways = {
		["southwest"] = "zhiye/nongtian0",
		["south"] = "zhiye/nongtian13",
		["north"] = "zhiye/nongtian13",
		["east"] = "zhiye/nongtian13",
		["west"] = "zhiye/nongtian13",
	},
}
Room {
	id = "zhiye/sanglin0",
	name = "ɣ����",
	ways = {
		["southeast"] = "zhiye/sanglin2",
		["southwest"] = "zhiye/sanglin3",
		["south"] = "changan/northroad4",
		["northwest"] = "zhiye/sanglin1",
	},
}
Room {
	id = "zhiye/sanglin1",
	name = "ɣ��С·",
	ways = {
		["southeast"] = "zhiye/sanglin0",
		["south"] = "zhiye/sanglin11",
		["north"] = "zhiye/sanglin11",
		["east"] = "zhiye/sanglin11",
		["west"] = "zhiye/sanglin11",
	},
}
Room {
	id = "zhiye/sanglin11",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin1",
	},
}
Room {
	id = "zhiye/sanglin12",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin2",
	},
}
Room {
	id = "zhiye/sanglin13",
	name = "ɣ��",
	ways = {
		["out"] = "zhiye/sanglin3",
	},
}
Room {
	id = "zhiye/sanglin2",
	name = "ɣ��С·",
	ways = {
		["south"] = "zhiye/sanglin12",
		["northwest"] = "zhiye/sanglin0",
		["east"] = "zhiye/sanglin12",
		["north"] = "zhiye/sanglin12",
		["west"] = "zhiye/sanglin12",
	},
}
Room {
	id = "zhiye/sanglin3",
	name = "ɣ��С·",
	ways = {
		["south"] = "zhiye/sanglin13",
		["north"] = "zhiye/sanglin13",
		["east"] = "zhiye/sanglin13",
		["northeast"] = "zhiye/sanglin0",
		["west"] = "zhiye/sanglin13",
	},
}
Room {
	id = "zhiye/yaochang1",
	name = "��ҩ����",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["west"] = "chengdu/beidajie2",
	},
	room_relative="��֪��������ҩ���� ��֪������ ��ҩ����",
}
Room {
	id = "zhiye/yaodian1",
	name = "ҩ��",
	outdoor = "�ɶ���",
	no_fight = true,
	ways = {
		["east"] = "chengdu/beidajie2",
	},
	room_relative="��֪������ҩ�� ��֪������ ҩ��",
}
Room {
	id = "zhiye/zhibufang1",
	name = "֯����",
	outdoor = "������",
	no_fight = true,
	ways = {
		["west"] = "changan/northjie2",
	},
	room_relative="��֪������֯���� ��֪������ ֯����",
}	
------------�����ʯ��-------------
Room {
id = "gumu/jqg/shiyao",
name = "ʯ��",
ways = {
["east"] = "gumu/jqg/cave3",
["#shikuout"] = "gumu/jqg/shanlu6",
},
}

Room {
id = "gumu/jqg/shiyao1",
name = "ʯ��",
ways = {
["pa down"] = "gumu/jqg/shiyao",
},
}
Room {
    id = "gumu/jqg/cave3",
    name = "��",
    ways =
    {
        ["west"] = "gumu/jqg/shiyao",
    },
}
Room {
id = "gumu/jqg/danfang",
name = "����",
ways = {
["south"] = "gumu/jqg/lang2",
["#shikuyin"] = "gumu/jqg/cave3",
},
nolooks = {
["#shikuyin"] = true,
},
lengths = {
["#shikuyin"] = 1000,
 },
}
Room {
id = "gumu/jqg/eyutan",
name = "����̶",
ways = {
["#shikuyin3"] = "gumu/jqg/eyutan2",
   },
   blocks = {
		["gumu/jqg/eyutan2"] = {
		    {id = "e yu", exp = 10000},
                      
			
			},
			},
}

Room {
id = "gumu/jqg/eyutan2",
name = "����",
ways = {
["zuan dong"] = "gumu/jqg/eyutan3",
},
lengths ={
		["#shikuyin3"] = 1000,
		},
}

Room {
id = "gumu/jqg/eyutan3",
name = "ɽ��",
ways = {
["pa down"] = "gumu/jqg/cave3",
},
}
