Config = {}

Config.printdebug = function(message)
    print(message)    
end

Config.RouteOneTrainSetup = {
    {
        trainhash = -577630801,
        startcoords = vector3(-504.0194, -432.0699, 82.54294),
        route = 'trainRouteOne',
        stopspeed = 0.0,
        cruisespeed = 5.0,
        fullspeed = 15.0,
    }
}

Config.RouteOneStops = {
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(-318.5835, -339.5699, 89.8374),
        waittime = 60000,
        name = "Flatneck Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(1247.213, -1330.293, 76.521987),
        waittime = 60000,
        name = "Rhodes Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(2738.716, -1453.513, 45.76028),
        waittime = 60000,
        name = "Saint Denis Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(2896.3217, 647.25274, 56.962245),
        waittime = 60000,
        name = "Van Horn Tradin Post",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(2963.8698, 1296.3289, 43.899059),
        waittime = 60000,
        name = "Annesburg Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(562.0819, 1721.6052, 187.8173),
        waittime = 60000,
        name = "Bacchus Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(-1321.556, 386.25271, 95.521469),
        waittime = 30000,
        name = "Wallace Station",
    },
    {
        dst = 220.0,
        dst2 = 4.0,
        coords = vector3(-1092.552, -587.014, 81.46875),
        waittime = 30000,
        name = "Riggs Station",
    },

}

-- tram
Config.RouteOneTramSetup = {
    {
        trainhash = -1083616881,
        startcoords = vector3(2608.437, -1172.225, 53.058986),
        route = 'tramRouteOne',
        stopspeed = 0.0,
        cruisespeed = 2.0,
        fullspeed = 5.0,
    }
}

Config.RouteOneTramStops = {

    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2608.2241, -1172.34, 53.050209),
        waittime = 60000,
        name = "Tram Stop One",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2613.3664, -1277.339, 52.442852),
        waittime = 60000,
        name = "Tram Stop Two",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2663.3139, -1357.855, 48.61087),
        waittime = 60000,
        name = "Tram Stop Three",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2805.4702, -1313.753, 46.598209),
        waittime = 60000,
        name = "Tram Stop Four",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2798.3742, -1245.855, 47.549518),
        waittime = 60000,
        name = "Tram Stop Five",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2767.9091, -1167.166, 48.483333),
        waittime = 60000,
        name = "Tram Stop Six",
    },
    {
        dst = 10.0,
        dst2 = 2.0,
        coords = vector3(2700.8583, -1139.829, 50.486354),
        waittime = 60000,
        name = "Tram Stop Seven",
    },

}