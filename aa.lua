function led() 
--    gpio.write(apacia, 0)
if gpio.read(apacia) == 1 then
        gpio.write(apacia, 0)
    else
        gpio.write(apacia, 1)
    end    
end 
led()
