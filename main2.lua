-----------------------------------------------------------------------------------------
--
-- main.lua denneme
--
-----------------------------------------------------------------------------------------

-- Your code here

local arkaplan = display.newImage( "resimler/arka.jpg" )
arkaplan.x = 155; arkaplan.y = 75--; arkaplan.width = 800; arkaplan.height = 1200

--Button--

local widget = require( "widget" )
widget.x = 100; widget.y = 300;
-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

local button1 = widget.newButton

{
    width = 200,
    height = 40,
    defaultFile = "resimler/b1.png",
    overFile = "resimler/b2.png",
    label = "FT",
    onEvent = handleButtonEvent
}

--Button-End--
