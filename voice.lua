AddEventHandler("playerSpawned", function()
    Citizen.InvokeNative(0x08797a8c03868cb8, 6.0)
	print("kitemmurt")
	Citizen.InvokeNative(0xec8703e4536a9952)
	print("kitemmurt2")
	Citizen.InvokeNative(0x2A32FAA57B937173,6.0)
	print("kitemmurt3")
	Citizen.InvokeNative(0x58125b691f6827d5,6.0)
	print("kitemmurt4")
end)

local prox = 6.0 -- Sets the Default Voice Distance
local allowProximityChange = true -- Set to True to allow Changing Voice Distance | False to not allow Changing Voice Distance

Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
	if IsControlJustPressed(0, 0x3C3DD371) and allowProximityChange then
	print("hai premuto bravo")
		local vprox
		if prox <= 2.0 then
			prox = 6.0
			vprox = "normale"
		elseif prox == 6.0 then
			prox = 15.0
			vprox = "urla"
		elseif prox >= 15.0 then
			prox = 2.0
			vprox = "sussurra"
		end
		Citizen.InvokeNative(0x08797a8c03868cb8, prox)
		Citizen.InvokeNative(0xec8703e4536a9952)
		Citizen.InvokeNative(0x2A32FAA57B937173,prox)
		Citizen.InvokeNative(0x58125b691f6827d5,prox)
		print("ho cambiato la prossimita della voce a "..prox.." ossia "..vprox)
	end	
	 if IsControlPressed(0, 0x3C3DD371) then
		local playerPed = PlayerPedId()
		local posPlayer    = GetEntityCoords(playerPed)
		Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, posPlayer.x, posPlayer.y, posPlayer.z-1, 0, 0, 0, 0, 0, 0, prox * 2, prox * 2, 1.1, 230, 230, 0, 155, 0, 0, 2, 0, 0, 0, 0)
	 end	
	end
end)

-- IDK for sure about "what native does what", but it's working like that so.. who cares?