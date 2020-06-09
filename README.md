In order to get the post request all you need to provide is a location and date parameter. If you pass in a post request to http://localhost:3000/sunrises?location=Tokyo&date=2020-06-09 you will recieve the json data 
{
    "results": {
        "sunrise": "7:24:35 PM",
        "sunset": "9:56:06 AM",
        "solar_noon": "2:40:20 AM",
        "day_length": "14:31:31",
        "civil_twilight_begin": "6:54:45 PM",
        "civil_twilight_end": "10:25:56 AM",
        "nautical_twilight_begin": "6:17:43 PM",
        "nautical_twilight_end": "11:02:57 AM",
        "astronomical_twilight_begin": "5:36:45 PM",
        "astronomical_twilight_end": "11:43:56 AM"
    },
    "status": "OK"
}
