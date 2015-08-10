-----------------------------------------------------------------------------------------
--
-- main.lua deneme 1
--
-----------------------------------------------------------------------------------------
local physical = require( "physics" )
physics.start()


----------------------------------------
----------------------------------------

----------------------------------------
----------------------------------------



-- muzik
media.playSound( "#206.mp3" )
local stopAfter10Seconds = function()
    media.stopSound()
end
timer.performWithDelay( 10000, stopAfter10Seconds )

--Start-scene--

--End-scene--
--Gokyuzu
local sky = display.newImage( "Sky-Blue-Sky.jpg" )
sky.x = -10; sky.y = 0; sky.width = 800; sky.height = 1200

--yanlar
local ust = display.newImage( "bascetball/wall-2.png" )
ust.x = 300; ust.y = -40; --ust.width = 15; ust.height = 1000
physical.addBody( ust, "static", { friction=05, bounce=0.3 } )

local kenar1 = display.newImage( "bascetball/wall-1.png" )
kenar1.x = 320; kenar1.y = 400; kenar1.width = 15; kenar1.height = 1000
physical.addBody( kenar1, "static", { friction=05, bounce=0.3 } )
local kenar2 = display.newImage( "bascetball/wall-1.png" )
kenar2.x = 0; kenar2.y = 400; kenar2.width = 15; kenar2.height = 1000
physical.addBody( kenar2, "static", { friction=05, bounce=0.3 } )
----

local logo1 = display.newImage( "bascetball/logo1.png" )
logo1.x = 160; logo1.y = 100; logo1.width = 200; logo1.height = 200
--physical.addBody( logo1, { density=3.0, friction=0.5, bounce=0.3 } )
--kale

--local kale = display.newImage( "4.png" )
--kale.x = 160; kale.y = 470; kale.width = 200; kale.height = 100

local pota2 = display.newImage ("bascetball/pota-full.png")
pota2.x = 255; pota2.y = 300 pota2.width = 125; pota2.height = 50; pota2.isHitTestMasked = true
pota2:setMask( nil )
--Zemin

local ground1 = display.newImage ("Grass_PNG_Clipart_Picture.png")
ground1.x = 160; ground1.y = 490; ground1.width = 400; ground1.height = 100
ground1:setMask( nil )
local ground = display.newImage ("Grass_PNG_Clipart_Picture2.png")
ground.x = 160; ground.y = 510; ground.width = 360; ground.height = 60 
ground:setMask( nil )
physical.addBody( ground, "static", { friction=05, bounce=0.3 } )

-- hide the status bar, shouldnt this just be on by default?
display.setStatusBar(display.HiddenStatusBar)


--Top
local ball = display.newImage ("bascetball/ball.png")
ball.x = 160; ball.y = 0; ball.rotation = 50; ball.width = 60; ball.height = 60; --ball.isHitTestMasked = false

physics.addBody(ball, {density=.11, friction=.3, bounce=.5, radius=20})

-- Top adım 2

local speedX = 0
local speedY = 0
local prevTime = 0
local prevX = 0
local prevY = 0

-- Top sürükleme
local function drag( event )
	local ball = event.target
	
	local phase = event.phase
	if "began" == phase then
		display.getCurrentStage():setFocus( ball )

		-- ilk pozisyon
		ball.x0 = event.x - ball.x
		ball.y0 = event.y - ball.y
		
		-- Make body type temporarily "kinematic" (to avoid gravitional forces)
		event.target.bodyType = "kinematic"
		
		-- Stop current motion, if any
		event.target:setLinearVelocity( 0, 0 )
		event.target.angularVelocity = 0

	else
		if "moved" == phase then
			ball.x = event.x - ball.x0
			ball.y = event.y - ball.y0
		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus( nil )
			event.target.bodyType = "dynamic"
			ball:setLinearVelocity(speedX, speedY)
		end
	end

	-- Stop further propagation of touch event!
	return true
end

function trackVelocity(event) 
	local timePassed = event.time - prevTime
	prevTime = prevTime + timePassed
	
	speedX = (ball.x - prevX)/(timePassed/100)
	speedY = (ball.y - prevY)/(timePassed/400)

	prevX = ball.x
	prevY = ball.y
end

Runtime:addEventListener("enterFrame", trackVelocity)
ball:addEventListener("touch", drag)

--End Step 3

--pota------------------------------------

local pota1 = display.newImage ("bascetball/pota-yarim.png")
pota1.x = 255; pota1.y = 300; pota1.width = 125; pota1.height = 50; pota1.isHitTestMasked = true 
pota1:setMask( nil )

local arka = display.newImage ("bascetball/arka.png")
arka.x = 301; arka.y = 305; arka.width = 30; arka.height = 39; arka.isHitTestMasked = true 
physical.addBody( arka, "static", { friction=05, bounce=0.3 } )
arka:setMask( nil )

--pota-static--

local dot = display.newImage( "bascetball/dot.png" )
dot.x = 199; dot.y = 285; dot.width = 3; dot.height = 3
physical.addBody( dot, "static", { friction=05, bounce=0.3 } )

local dot1 = display.newImage( "bascetball/dot.png" )
dot1.x = 197; dot1.y = 287; dot1.width = 3; dot1.height = 3
physical.addBody( dot1, "static", { friction=05, bounce=0.3 } )

local dot2 = display.newImage( "bascetball/dot.png" )
dot2.x = 195; dot2.y = 290; dot2.width = 3; dot2.height = 3
physical.addBody( dot2, "static", { friction=05, bounce=0.3 } )

local dot3 = display.newImage( "bascetball/dot.png" )
dot3.x = 193; dot3.y = 293; dot3.width = 3; dot3.height = 3
physical.addBody( dot3, "static", { friction=05, bounce=0.3 } )

--local dot4 = display.newImage( "bascetball/dot.png" )
--dot4.x = 178; dot4.y = 298; dot4.width = 3; dot4.height = 3
--physical.addBody( dot4, "static", { friction=05, bounce=0.3 } )

--local dot5 = display.newImage( "bascetball/dot.png" )
--dot5.x = 185; dot5.y = 301; dot5.width = 3; dot5.height = 3
--physical.addBody( dot5, "static", { friction=05, bounce=0.3 } )

--poto-static-end--

--physical.addBody( pota1, "static", { friction=05, bounce=0.3 } )

------------------------------------------
-- create a circle and put it in the center of the screen



--physical.addBody( ball, { density=3.0, friction=0.5, bounce=0.3, radius=45 } )






