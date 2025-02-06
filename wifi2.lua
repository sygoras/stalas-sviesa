local cfg={}
cfg.ssid="autoservisas1"
cfg.pwd="autoservisas"
wifi.setmode(wifi.STATION)
print("<WIFI> jungiasi Wifi: \""..cfg.ssid.."\".")
wifi.sta.config(cfg)
print(" IP\t\t\tMASK\t\t\tGATEWAY")
print(wifi.sta.getip())
tmr.create():alarm(8000, tmr.ALARM_SINGLE, function() print('\n', wifi.sta.getip()) 
    dofile('mqtt.lua')
    end)
