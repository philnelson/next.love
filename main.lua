math.randomseed(os.time())
math.random()math.random()math.random()

nameTableOne = {
	"Drew",
	"Mike",
	"Noah",
	"Dan",
	"Steve",
	"Bean",
	"Egg",
	"Maki",
	"Beth",
	"Jake",
	"Jack",
	"Shawn",
	"Sean",
	"Shaun",
	"Pete",
	"Jen",
	"Jean",
	"John",
	"Joe"
}

nameTableTwo = {
	"bert",
	"than",
	"n",
	"anna",
	"son",
	"-san",
	"ther",
	"erie",
	"ella",
	"ie",
	"iffer"
}

feelers = {
	"Feelin' fine",
	"Down",
	"Alright, I guess",
	"Been better",
	"Great",
	"Happy",
	"Depressed",
	"Sassy",
	"Embarassed",
	"Not too bad",
	"Can't complain",
	"Ecstatic",
	"Sublime"
}

players = {}
foods = {}

time = love.timer.getTime( )

function chooseName()
	return nameTableOne[ math.random( #nameTableOne ) ] ..  nameTableTwo[ math.random( #nameTableTwo ) ]
end

players[1] = {x = 20, y = 20, name = chooseName(), age = 18, feelers = feelers[ math.random( #feelers ) ], health = 10}
players[2] = {x = 400, y = 400, name = chooseName(), age = 18, feelers = feelers[ math.random( #feelers ) ], health = 10}

map = {}

love.graphics.setMode( 800, 600 )

stime = love.timer.getTime( )
fstime = love.timer.getTime( )

function love.draw()
	
	-- Draw Grid
	local x = 1
	local y = 1
	love.graphics.setColor(255,255,255,90)
    while x < 80 do
		love.graphics.line(x*10,10,x*10,590)
		x = x + 1
    end
	while y < 60 do
		love.graphics.line(10,y*10,790,y*10)
		y = y + 1
	end
	
	-- Draw players
	love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", players[1].x, players[1].y, 20, 20 )
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill", players[2].x, players[2].y, 20, 20 )
	
	-- Draw info boses
	for key,value in pairs(players) do
		love.graphics.setColor(255,255,255, 200)
		love.graphics.polygon('fill', players[key].x+21, players[key].y+10, players[key].x+30, players[key].y+20, players[key].x+30, players[key].y)
		love.graphics.rectangle("fill", players[key].x+30, players[key].y, 160, 60 )
	
		love.graphics.setColor(0,0,0)
		love.graphics.print(players[key].name, players[key].x+32, players[key].y+2)
		love.graphics.print("Age: " .. players[key].age, players[key].x+32, players[key].y+22)
		love.graphics.print(players[key].feelers, players[key].x+32, players[key].y+42)	
	end
	
	etime = love.timer.getTime( )
	fetime = love.timer.getTime( )
	
	if(etime-stime > .5) then
		-- Move guys
		for key,value in pairs(players) do
			
			local guyMove = moveGuy(players[key])
			
			players[key].x = guyMove.x
			players[key].y = guyMove.y
			
			stime = love.timer.getTime( )
		end
	end
	
	-- time to spawn some food?
	if(fetime-fstime > 1) then
		-- Make food
		foods[#foods+1] = {kind = "apple", healthbuff = 1, ripeness = 0}
		
		fstime = love.timer.getTime( )
	end
	
	-- Draw food
	
end

function moveGuy(guy)
	local moveIt = math.random(1,100)
	local theMove = {x = guy.x, y = guy.y}
	
	print("moveIt for " .. guy.name .. " is " .. moveIt)
	
	if(moveIt > 0) then
		-- just stand there
	end
	
	if(moveIt > 20) then
		theMove.x = guy.x-1
	end
	
	if(moveIt > 30) then
		theMove.y = guy.y+1
	end
	
	if(moveIt > 40) then
		theMove.x = guy.x+1
	end
	
	if(moveIt > 50) then
		theMove.y = guy.y-1
	end
	
	print("theMove is " .. theMove.x .. "," .. theMove.y)
	
	return theMove
end
