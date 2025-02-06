--pin = 5
function onChange1 ()
    print('1 mygtukas')
    gpio.write(lubos, 1)
    m:publish("redas mygtukai", "pirmas", 0,0)
end
 function onChange2 ()
    print('2 mygtukas ijungtas')
    gpio.write(virsus, 1)
    m:publish("redas mygtukai", "antras", 0,0)
end
function onChange3 ()
    print('3 mygtukas ijungtas')
        gpio.write(apacia, 1)
        m:publish("redas mygtukai", "trecias", 0,0)
end
 function onChange4 ()
    print('4 mygtukas ijungtas')
    gpio.write(lubos, 0)
    gpio.write(virsus, 0)
    gpio.write(apacia, 0)
    m:publish("redas mygtukai", "ketvirtas", 0,0)
end

gpio.trig(vienas,'up', onChange1)
gpio.trig(du,'up', onChange2)
gpio.trig(trys,'up', onChange3)
gpio.trig(keturi,'up', onChange4)