 -- https://nodemcu.readthedocs.io/en/release/modules/mqtt/#mqtt-client

m = mqtt.Client("tdvt", 120)
print('mqtt pasileidineja') 

-- setup Last Will and Testament (optional)
-- Broker will publish a message with qos = 0, retain = 0, data = "offline"
-- to topic "/lwt" if client don't send keepalive packet
m:lwt("/lwt", "offline", 0, 0)

m:on("connect", function(client) print ("connected") end)
m:on("connfail", function(client, reason) print ("connection failed", reason) end)
m:on("offline", function(client) print ("offline") 
     --m:connect("broker.mqtt-dashboard.com", 1883, false, function(client) end)
     print('pakartotinai jungiuosi prie mqtt serverio')
end)

-- on publish message receive event
m:on("message", function(client, topic, data)
  print(topic .. ":" )
  if data ~= nil then
    print(data)
    b = data  --globalus kintamasis
    --ledState = 1 - ledState;
    gpio.write(ledPin, ledState)
    ledState = 1 - ledState 
  
  
  if topic == "redas" then     --pridedu lempu valdyma: https://github.com/mlopezr/nodemcu_mqtt_rgb/blob/master/mqtt_rgb.lua
    if data == "lubosOFF" then 
       gpio.write(lubos, 0)
    elseif data == "lubosON" then 
       gpio.write(lubos, 1)
    elseif data == "apaciaON" then 
       gpio.write(apacia, 1)
    elseif data == "apaciaOFF" then 
       gpio.write(apacia, 0)
    elseif data == "virsusON" then 
       gpio.write(virsus, 1)
    elseif data == "virsusOFF" then 
       gpio.write(virsus, 0)
       
    end
    end
  end
end)

-- on publish overflow receive event
m:on("overflow", function(client, topic, data)
  print(topic .. " partial overflowed message: " .. data )
end)

-- for TLS: m:connect("192.168.11.118", secure-port, 1)
m:connect("192.168.2.11", 1883, false, function(client)
-- m:connect("78.58.128.212", 1880, false, function(client)
--78.58.128.212:1880
  print("connected")
  -- Calling subscribe/publish only makes sense once the connection
  -- was successfully established. You can do that either here in the
  -- 'connect' callback or you need to otherwise make sure the
  -- connection was established (e.g. tracking connection status or in
  -- m:on("connect", function)).

  -- subscribe topic with qos = 0
  client:subscribe("timestamp", 0, function(client) print("subscribe success") end)
  client:subscribe("redas", 0, function(client) print("subscribe success") end)

  -- publish a message with data = hello, QoS = 0, retain = 0
  client:publish("redas1", "stalas prisijunge", 0, 0, function(client) print("sent") end)
end,
function(client, reason)
  print("failed reason: " .. reason)
end)

m:close();
-- you can call m:connect again
