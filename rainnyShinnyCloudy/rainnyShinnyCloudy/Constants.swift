//
//  Constants.swift
//  rainnyShinnyCloudy
//
//  Created by k7user on 25/09/17.
//  Copyright © 2017 k7user. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "a993319f43ddf04f652e26c60497ab14"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"


let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=a993319f43ddf04f652e26c60497ab14"
