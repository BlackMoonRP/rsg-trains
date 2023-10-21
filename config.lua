Config = {}

Config.printdebug = function(message)
    print(message)    
end

Config.TrainSetup = {

    -- trains
    {
        trainname = 'Orient Express',
        trainid = 'train1',
        trainhash = -577630801,
        startcoords = vector3(-504.0194, -432.0699, 82.54294),
        route = 'trainRouteOne',
    },
    {
        trainname = 'Flying Scotsman',
        trainid = 'train2',
        trainhash = -577630801,
        startcoords = vector3(2729.5883, -1459.727, 45.903129),
        route = 'trainRouteTwo',
    },

}

-- train route one switches
Config.RouteOneTrainSwitches = {

    { coords = vector3(-281.1323, -319.6579, 89.02458), trainTrack = -705539859,  junctionIndex = 2,  enabled = 1 },
    { coords = vector3(357.959, 596.374, 115.6759),     trainTrack = 1499637393,  junctionIndex = 4,  enabled = 0 },
    { coords = vector3(1481.54, 648.331, 92.30682),     trainTrack = 1499637393,  junctionIndex = 2,  enabled = 1 },
    { coords = vector3(2464.55, -1475.74, 46.15192),    trainTrack = -760570040,  junctionIndex = 5,  enabled = 1 },
    { coords = vector3(2654.026, -1477.149, 45.75834),  trainTrack = -1242669618, junctionIndex = 2,  enabled = 1 },
    { coords = vector3(2659.79, -435.7114, 43.38848),   trainTrack = -705539859,  junctionIndex = 13, enabled = 0 },
    
}

-- train route one (via valentine)
Config.RouteOneTrainStops = {

    { dst = 220.0, dst2 = 10.0, coords = vector3(-318.5835, -339.5699, 89.8374),   waittime = 15000, name = "Flatneck Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(-158.177, 635.38629, 113.52156),  waittime = 15000, name = "Valentine Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(511.73336, 654.95397, 115.67657), waittime = 15000, name = "Heartland Oil Fields" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(1529.366, 422.21853, 90.355613),  waittime = 15000, name = "Emerald Station" },
    { dst = 400.0, dst2 = 10.0, coords = vector3(2732.3334, -1445.62, 45.773746),  waittime = 15000, name = "Saint Denis Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(2895.6479, 645.07153, 57.12009),  waittime = 15000, name = "Van Horn Trading Post" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(2962.6826, 1293.7446, 43.906204), waittime = 15000, name = "Annesburg Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(572.00677, 1713.8681, 187.75619), waittime = 15000, name = "Bacchus Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(-1319.959, 388.2633, 95.492622),  waittime = 15000, name = "Wallace Station" },
    { dst = 300.0, dst2 = 10.0, coords = vector3(-1090.563, -588.4188, 81.372642), waittime = 15000, name = "Riggs Station" },

}

-- train route two switches
Config.RouteTwoTrainSwitches = {

    { coords = vector3(2659.79, -435.7114, 43.38848),   trainTrack = -705539859,  junctionIndex = 13, enabled = 0 },
    { coords = vector3(610.3571, 1661.904, 187.3867),   trainTrack = -705539859,  junctionIndex = 8,  enabled = 1 },
    { coords = vector3(556.65, 1725.99, 187.7966),      trainTrack = -705539859,  junctionIndex = 7,  enabled = 1 },
    { coords = vector3(-281.1323, -319.6579, 89.02458), trainTrack = -705539859,  junctionIndex = 2,  enabled = 0 },
    { coords = vector3(2588.54, -1482.19, 46.04693),    trainTrack = -705539859,  junctionIndex = 18, enabled = 1 },
    { coords = vector3(2654.026, -1477.149, 45.75834),  trainTrack = -1242669618, junctionIndex = 2,  enabled = 1 },
    
}

-- train route one (via valentine)
Config.RouteTwoTrainStops = {

    { dst = 220.0, dst2 = 10.0, coords = vector3(-318.5835, -339.5699, 89.8374),   waittime = 15000, name = "Flatneck Station" },
    { dst = 220.0, dst2 = 10.0, coords = vector3(1238.4562, -1322.457, 76.439476), waittime = 15000, name = "Rhodes Station" },
    { dst = 400.0, dst2 = 10.0, coords = vector3(2732.3334, -1445.62, 45.773746),  waittime = 15000, name = "Saint Denis Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(2895.6479, 645.07153, 57.12009),  waittime = 15000, name = "Van Horn Trading Post" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(2962.6826, 1293.7446, 43.906204), waittime = 15000, name = "Annesburg Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(572.00677, 1713.8681, 187.75619), waittime = 15000, name = "Bacchus Station" },
    { dst = 180.0, dst2 = 10.0, coords = vector3(-1319.959, 388.2633, 95.492622),  waittime = 15000, name = "Wallace Station" },
    { dst = 300.0, dst2 = 10.0, coords = vector3(-1090.563, -588.4188, 81.372642), waittime = 15000, name = "Riggs Station" },

}