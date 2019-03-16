--MIT License

--Copyright (c) 2019 LisaFlocke

--Permission is hereby granted, free of charge, to any person obtaining a copy
--of this software and associated documentation files (the "Software"), to deal
--in the Software without restriction, including without limitation the rights
--to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--copies of the Software, and to permit persons to whom the Software is
--furnished to do so, subject to the following conditions:

--The above copyright notice and this permission notice shall be included in all
--copies or substantial portions of the Software.

--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--SOFTWARE.

local looped = 8
local looped2 = 16

local PlayingAnim = false

Citizen.CreateThread(function()
    local checkbox2 = false
    WarMenu.CreateMenu('list', "Kleidungs Menu")
    WarMenu.SetSubTitle('list', 'Kleidungs Menu')

    while true do

        local ped = PlayerPedId()
        local playerPed = GetPlayerPed(-1)
    if IsEntityDead(playerPed) then
    return
    else

        if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) and PlayingAnim then
            ClearPedTasks(ped)
            PlayingAnim = false
        end
            
        if not IsPedActiveInScenario(ped) and PlayingAnim then
            PlayingAnim = false
        end
            
        if checkbox then
            looped = 1
        else
            looped = 32
        end

        if checkbox2 then
            looped2 = 1
        else
            looped2 = 0
        end

        if WarMenu.IsMenuOpened('list') then

            if WarMenu.Button('Maske Absetzen') then
                SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 240, 0)
            end

            if WarMenu.Button('Hüte Absetzen') then
                ClearPedProp(GetPlayerPed(-1), 0, 0, 240, 0)
            end

            if WarMenu.Button('Brille Absetzen') then
                ClearPedProp(GetPlayerPed(-1), 1, 0, 240, 0)
            end

            if WarMenu.Button('Ohrring Absetzen') then
                ClearPedProp(GetPlayerPed(-1), 2, 0, 240, 0)
            end

            if WarMenu.Button('Oberteil Ausziehen') then
                if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then
                    SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 0)
                    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
                elseif GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
                    SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 0)
                    SetPedComponentVariation(GetPlayerPed(-1), 11, 18, 0, 0)
            end
        
    end

            if WarMenu.Button('Hose Ausziehen') then
                if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then
                SetPedComponentVariation(GetPlayerPed(-1), 4, 61, 0, 0)
            elseif GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
                SetPedComponentVariation(GetPlayerPed(-1), 4, 17, 0, 0)
            end
            end
            
            if WarMenu.Button('Schuhe Ausziehen') then
                if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then
                SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)
            elseif GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
                SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)
            end
        end

            if WarMenu.Button('Alles Anziehen') then
                TriggerServerEvent("clothes:spawn")
                TriggerServerEvent("clothes:loaded")
                TriggerEvent("vRP:playerSpawn",user_id,player,first_spawn)
                TriggerServerEvent("vRPcli:playerSpawned")
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 289) then --f6
            WarMenu.OpenMenu('list')
        end
        Citizen.Wait(0)
end
end
end)


