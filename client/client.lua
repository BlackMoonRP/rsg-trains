local RSGCore = exports['rsg-core']:GetCoreObject()

-------------------------------------------------------------------------------

local trainrouteone = false

local function StartTrainRoute(currentTrain)
    while true do
        Wait(0)
        for i = 1, #Config.RouteOneStops do
            local coords = GetEntityCoords(currentTrain)
            local traincoords = vector3(coords.x, coords.y, coords.z)
            local distance = #(Config.RouteOneStops[i].coords - traincoords)
            local stopspeed = 0.0
            local cruisespeed = 5.0
            local fullspeed = 15.0
            if distance < Config.RouteOneStops[i].dst then
                SetTrainCruiseSpeed(currentTrain, cruisespeed)
                Wait(200)
                if distance < Config.RouteOneStops[i].dst2 then
                    SetTrainCruiseSpeed(currentTrain, stopspeed)
                    Config.printdebug('Train Stopped At: '..Config.RouteOneStops[i].name)
                    Wait(Config.RouteOneStops[i].waittime)
                    Config.printdebug('Train Leaving From: '..Config.RouteOneStops[i].name)
                    SetTrainCruiseSpeed(currentTrain, cruisespeed)
                    Wait(10000)
                end
            elseif distance > Config.RouteOneStops[i].dst then
                SetTrainCruiseSpeed(currentTrain, fullspeed)
                Wait(25)
            end
        end
    end
end

-- spawn trainrouteone
Citizen.CreateThread(function()
    while true do
        Wait(1)
        if trainrouteone == false then
            for k, v in pairs(Config.RouteOneTrainSetup) do
                SetRandomTrains(false)
                --requestmodel--
                local trainWagons = Citizen.InvokeNative(0x635423D55CA84FC8, v.trainhash)
                for wagonIndex = 0, trainWagons - 1 do
                    local trainWagonModel = Citizen.InvokeNative(0x8DF5F6A19F99F0D5, v.trainhash, wagonIndex)
                    while not HasModelLoaded(trainWagonModel) do
                        Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
                        Citizen.Wait(100)
                    end
                end
                --spawn train--
                local train = Citizen.InvokeNative(0xc239dbd9a57d2a71, v.trainhash, v.startcoords, 0, 0, 1, 0)
                SetTrainSpeed(train, 0.0)
                Citizen.InvokeNative(0x05254BA0B44ADC16, train, false)
                SetModelAsNoLongerNeeded(train)
                StartTrainRoute(train)
                trainrouteone = true
            end
        end
        if trainrouteone == true then
            Wait(2500)
        end
    end
end)

-------------------------------------------------------------------------------

local tramrouteone = false

local function StartTramRoute(currentTram)
    while true do
        Wait(0)
        for i = 1, #Config.RouteOneTramStops do
            local coords = GetEntityCoords(currentTram)
            local tramcoords = vector3(coords.x, coords.y, coords.z)
            local tramdistance = #(Config.RouteOneTramStops[i].coords - tramcoords)
            local stopspeed = 0.0
            local cruisespeed = 2.0
            local fullspeed = 5.0
            if tramdistance < Config.RouteOneTramStops[i].dst then
                SetTrainCruiseSpeed(currentTram, cruisespeed)
                Wait(200)
                if tramdistance < Config.RouteOneTramStops[i].dst2 then
                    SetTrainCruiseSpeed(currentTram, stopspeed)
                    Config.printdebug('Tram Stopped At: '..Config.RouteOneTramStops[i].name)
                    Wait(Config.RouteOneTramStops[i].waittime)
                    Config.printdebug('Tram Leaving From: '..Config.RouteOneTramStops[i].name)
                    SetTrainCruiseSpeed(currentTram, cruisespeed)
                    Wait(10000)
                end
            elseif tramdistance > Config.RouteOneTramStops[i].dst then
                SetTrainCruiseSpeed(currentTram, fullspeed)
                Wait(25)
            end
        end
    end
end

-- spawn tramrouteone
Citizen.CreateThread(function()
    while true do
        Wait(1)
        if tramrouteone == false then
            for k, v in pairs(Config.RouteOneTramSetup) do
                SetRandomTrains(false)
                --requestmodel--
                local trainWagons = Citizen.InvokeNative(0x635423D55CA84FC8, v.trainhash)
                for wagonIndex = 0, trainWagons - 1 do
                    local trainWagonModel = Citizen.InvokeNative(0x8DF5F6A19F99F0D5, v.trainhash, wagonIndex)
                    while not HasModelLoaded(trainWagonModel) do
                        Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
                        Citizen.Wait(100)
                    end
                end
                --spawn tram --
                local tram = Citizen.InvokeNative(0xc239dbd9a57d2a71, v.trainhash, v.startcoords, 0, 0, 1, 0)
                SetTrainSpeed(tram, 0.0)
                Citizen.InvokeNative(0x05254BA0B44ADC16, tram, false)
                SetModelAsNoLongerNeeded(tram)
                StartTramRoute(tram)
                tramrouteone = true
            end
        end
        if tramrouteone == true then
            Wait(2500)
        end
    end
end)

-------------------------------------------------------------------------------
-- setup train blips
-------------------------------------------------------------------------------
function trainChecker(train)
    if IsThisModelATrain(GetEntityModel(train)) then
        local trainTrailerNumber = Citizen.InvokeNative(0x60B7D1DCC312697D, train)
        local isTrainIsReal = GetTrainCarriage(train,trainTrailerNumber-1)
        if isTrainIsReal ~= 0 then
            if not Citizen.InvokeNative(0x9FA00E2FC134A9D0, train) then
                local createdBlip = addBlipToTrain(-399496385, train, "Train")
                print("train blip created.", createdBlip)
            end
        end
    end
end

function addBlipToTrain(blipType,train,blipText)
    local blip = Citizen.InvokeNative(0x23f74c2fda6e7c61, blipType, train)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipText)
    return blip
end

function getTrains()
    local handle, firstVehicle = FindFirstVehicle()
    trainChecker(firstVehicle)
    local isExist, nextVeh = FindNextVehicle(handle)
    while isExist do
        trainChecker(nextVeh)
        isExist, nextVeh = FindNextVehicle(handle)
    end
    EndFindVehicle(handle)
end

Citizen.CreateThread(function()
    while true do
        getTrains()
        Wait(10000)
    end
end)
