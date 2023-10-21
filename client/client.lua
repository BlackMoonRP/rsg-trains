local RSGCore = exports['rsg-core']:GetCoreObject()

-------------------------------------------------------------------------------
-- spawn train function
-------------------------------------------------------------------------------
local function SpawnTrain(trainid, route, trainhash, startcoords)
    SetRandomTrains(false)
    local trainWagons = Citizen.InvokeNative(0x635423D55CA84FC8, trainhash)
    for wagonIndex = 0, trainWagons - 1 do
        local trainWagonModel = Citizen.InvokeNative(0x8DF5F6A19F99F0D5, trainhash, wagonIndex)
        while not HasModelLoaded(trainWagonModel) do
            Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
            Citizen.Wait(100)
        end
    end
    train = Citizen.InvokeNative(0xc239dbd9a57d2a71, trainhash, startcoords, 0, 0, 1, 0)
    SetTrainSpeed(train, 0.0)
    Citizen.InvokeNative(0x05254BA0B44ADC16, train, false)
    SetModelAsNoLongerNeeded(train)
    return train
end

-------------------------------------------------------------------------------
-- send info to spawn train / train track switches / train route
-------------------------------------------------------------------------------
Citizen.CreateThread(function()
    for k, v in ipairs(Config.TrainSetup) do
        SpawnTrain(v.trainid, v.route, v.trainhash, v.startcoords)
        Citizen.InvokeNative(0xBA8818212633500A, train, 0, 1)
        TriggerEvent('rsg-trains:client:trackswithches', train, v.route)
        TriggerEvent('rsg-trains:client:startroute', train, v.route, v.trainname)
    end
end)

-------------------------------------------------------------------------------
-- train track switching system
-------------------------------------------------------------------------------
RegisterNetEvent('rsg-trains:client:trackswithches', function(train, route)

    while true do
        Wait(0)
        -- valentine route
        if train ~= nil and route == 'trainRouteOne' then
            -- set track switching
            for i = 1, #Config.RouteOneTrainSwitches do
                local coords = GetEntityCoords(train)
                local traincoords = vector3(coords.x, coords.y, coords.z)
                local switchdist = #(Config.RouteOneTrainSwitches[i].coords - traincoords)
                if switchdist < 15 then
                    Citizen.InvokeNative(0xE6C5E2125EB210C1, Config.RouteOneTrainSwitches[i].trainTrack, Config.RouteOneTrainSwitches[i].junctionIndex, Config.RouteOneTrainSwitches[i].enabled)
                    Citizen.InvokeNative(0x3ABFA128F5BF5A70, Config.RouteOneTrainSwitches[i].trainTrack, Config.RouteOneTrainSwitches[i].junctionIndex, Config.RouteOneTrainSwitches[i].enabled)
                end
            end
        end
        if train ~= nil and route == 'trainRouteTwo' then
            -- set track switching
            for i = 1, #Config.RouteTwoTrainSwitches do
                local coords = GetEntityCoords(train)
                local traincoords = vector3(coords.x, coords.y, coords.z)
                local switchdist = #(Config.RouteTwoTrainSwitches[i].coords - traincoords)
                if switchdist < 15 then
                    Citizen.InvokeNative(0xE6C5E2125EB210C1, Config.RouteTwoTrainSwitches[i].trainTrack, Config.RouteTwoTrainSwitches[i].junctionIndex, Config.RouteTwoTrainSwitches[i].enabled)
                    Citizen.InvokeNative(0x3ABFA128F5BF5A70, Config.RouteTwoTrainSwitches[i].trainTrack, Config.RouteTwoTrainSwitches[i].junctionIndex, Config.RouteTwoTrainSwitches[i].enabled)
                end
            end
        end
    end

end)

-------------------------------------------------------------------------------
-- train route system
-------------------------------------------------------------------------------
RegisterNetEvent('rsg-trains:client:startroute', function(train, route, trainname)

    while true do
        Wait(0)
        if train ~= nil and route == 'trainRouteOne' then
            -- train route
            for i = 1, #Config.RouteOneTrainStops do
                local coords = GetEntityCoords(train)
                local traincoords = vector3(coords.x, coords.y, coords.z)
                local distance = #(Config.RouteOneTrainStops[i].coords - traincoords)
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0
                if distance < Config.RouteOneTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, cruisespeed)
                    Wait(200)
                    if distance < Config.RouteOneTrainStops[i].dst2 then
                        SetTrainCruiseSpeed(train, stopspeed)
                        Config.printdebug(trainname.. ' stopped at '..Config.RouteOneTrainStops[i].name)
                        Wait(Config.RouteOneTrainStops[i].waittime)
                        Config.printdebug(trainname.. ' is leaving '..Config.RouteOneTrainStops[i].name)
                        SetTrainCruiseSpeed(train, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.RouteOneTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, fullspeed)
                    Wait(25)
                end
            end
        end
        if train ~= nil and route == 'trainRouteTwo' then
            -- train route
            for i = 1, #Config.RouteTwoTrainStops do
                local coords = GetEntityCoords(train)
                local traincoords = vector3(coords.x, coords.y, coords.z)
                local distance = #(Config.RouteTwoTrainStops[i].coords - traincoords)
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0
                if distance < Config.RouteTwoTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, cruisespeed)
                    Wait(200)
                    if distance < Config.RouteTwoTrainStops[i].dst2 then
                        SetTrainCruiseSpeed(train, stopspeed)
                        Config.printdebug(trainname.. ' stopped at '..Config.RouteTwoTrainStops[i].name)
                        Wait(Config.RouteTwoTrainStops[i].waittime)
                        Config.printdebug(trainname.. ' is leaving '..Config.RouteTwoTrainStops[i].name)
                        SetTrainCruiseSpeed(train, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.RouteTwoTrainStops[i].dst then
                    SetTrainCruiseSpeed(train, fullspeed)
                    Wait(25)
                end
            end
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
-------------------------------------------------------------------------------
