-- enums
ElementTypes = { NULL = "0", FIRE = "1", WATER = "2", EARTH = "3", METAL = "4", AIR = "5"}
StyleTypes = { NULL = "0", STRONG = "1", QUICK = "2", BALANCED = "3"};

-- meta classes
Attack = {
	Name = "Idle",
	Element = ElementTypes.NULL,
	Style = StyleTypes.NULL,
	BaseDmg = 0,
	HPCost = 0,
	MPCost = 0,
}

Character = {
	HP = 10,
	MP = 10,
	ATK = 5,
	DEF = 4,
	TURNS = 2,
	ATTACK_LIST = {},
	ATTACK_QUEUE = {}
}

-- class method new()
function Attack:new (o, name, element, style, base_dmg, hp_cost, mp_cost)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.Name = name
	self.Element = element
	self.Style = style
	self.BaseDmg = base_dmg
	self.HPCost = hp_cost
	self.MPCost = mp_cost
	return o
end

-- class method addMight()
function Attack:addMight() 
	self.Attack = self.Attack + 10
end

function Character:new (o, hp, mp, atk, def, turns, atkList, atkQueue)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.HP = hp
	self.MP = mp
	self.ATK = atk
	self.DEF = def
	self.TURNS = turns
	self.ATTACK_LIST = atkList
	self.ATTACK_QUEUE = atkQueue
	return o
end

-- create object
basicStrong = Attack:new(nil, "basicStrong", ElementTypes.NULL, StyleTypes.STRONG, 10, 5, 0)
basicQuick = Attack:new(nil, "basicQuick", ElementTypes.NULL, StyleTypes.QUICK, 6, 3, 0)
basicBalanced = Attack:new(nil, "basicBalanced", ElementTypes.NULL, StyleTypes.BALANCED, 8, 4, 0)

default_attack_list = {basicQuick, basicStrong, basicBalanced}

p1 = Character:new(nil, 10, 10, 5, 4, 2, default_attack_list, {})
p2 = Character:new(nil, 10, 10, 5, 4, 2, default_attack_list, {})