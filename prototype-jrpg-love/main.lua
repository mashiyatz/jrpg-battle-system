-- enums
State = { START = "0", SELECT = "1", STRIKE = "2", END = "3" }
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

function ChangeStateTo(state)
  if state == State.START then 
    love.graphics.print("hi")
	elseif state == State.SELECT then
  	countdown = 5;
  end
  currentState = state
end

function love.load()
  -- create objects
  basicStrong = Attack:new(nil, "basicStrong", ElementTypes.NULL, StyleTypes.STRONG, 10, 5, 0)
  basicQuick = Attack:new(nil, "basicQuick", ElementTypes.NULL, StyleTypes.QUICK, 6, 3, 0)
  basicBalanced = Attack:new(nil, "basicBalanced", ElementTypes.NULL, StyleTypes.BALANCED, 8, 4, 0)

  default_attack_list = {basicQuick, basicStrong, basicBalanced}

  p1 = Character:new(nil, 10, 10, 5, 4, 2, default_attack_list, {})
  p2 = Character:new(nil, 10, 10, 5, 4, 2, default_attack_list, {})

  countdown = 0;
  
  currentState = State.START
  love.keyboard.setKeyRepeat(false)
end

function love.update(dt)
	if currentState == State.START then
		if love.keyboard.isDown("down") then
			ChangeStateTo(State.SELECT)
		end
  elseif currentState == State.SELECT then
  	if countdown >= 0 then
  		countdown = countdown - dt
  		if love.keyboard.isDown("up") then 
  			ChangeStateTo(State.END)
  		end
  	else 
  		ChangeStateTo(State.STRIKE)
  	end
  end
end

function love.draw()
	love.graphics.print(countdown, 400, 300)
	love.graphics.print(currentState, 400, 350)
end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      love.event.quit()
   end
end