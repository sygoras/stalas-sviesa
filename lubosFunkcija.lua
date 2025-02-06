function lubosf() 
--    gpio.write(apacia, 0)
if gpio.read(lubos) == 1 then
        gpio.write(lubos, 0)
    else
        gpio.write(lubos, 1)
    end    
end 
--lubosf()
