 -- https://github.com/abobija/yt-tutorials/tree/master/esp32_lua_for_beginners#application-written-in-video
 -- Ok mirksi gamyklinis diodukas
local BLUE_LED = ledPin -- dabar cia raudonas
gpio.write(BLUE_LED, 0)  -- Turn off LED on startup
 local timer = tmr.create()  -- Create a timer
-- Register auto-repeating 1000 ms (1 sec) timer
timer:register(200, tmr.ALARM_AUTO, function()
    -- Invert the state of BLUE_LED pin
    if gpio.read(BLUE_LED) == 1 then
        gpio.write(BLUE_LED, 0)
    else
        gpio.write(BLUE_LED, 1)
    end
end)
-- Start timer 
timer:start()
