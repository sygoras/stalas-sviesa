--20250128
apacia = 1
virsus = 2
lubos  = 3
ledPin = 4
keturi = 5
trys   = 6
du     = 7
vienas = 8

gpio.mode(1,gpio.OUTPUT)
gpio.mode(2,gpio.OUTPUT)
gpio.mode(3,gpio.OUTPUT)
gpio.mode(4,gpio.OUTPUT)
gpio.mode(5,gpio.INT)
gpio.mode(6,gpio.INT)
gpio.mode(7,gpio.INT)
gpio.mode(8,gpio.INT)

gpio.write(4, 1)
ledState = 0  --inicializuoju LED pradine reiksme

gpio.write(lubos, 0)
gpio.write(virsus, 0)
gpio.write(apacia, 0)


dofile('wifi2.lua')
dofile('ide.lc')
dofile('mygtukai.lua')
dofile('lubosFunkcija.lua')
--dofile('mqtt.lua')  --prisijungineti po ip gavimo arba taimeriu 
