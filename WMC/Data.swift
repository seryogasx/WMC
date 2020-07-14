//
//  Data.swift
//  WMC
//
//  Created by Сергей Петров on 09.07.2020.
//  Copyright © 2020 SergioPetrovx. All rights reserved.
//

//import Foundation
//import SwiftUI

//let weather_data: [WeatherData] = get_weather_data()

//func get_weather_data() -> [WeatherData] {
//    return [WeatherData(weather: .snowers, image: Image(systemName: "car.fill")), WeatherData(weather: .snowers, image: Image(systemName: "car.fill"))]
//}

import SwiftUI
enum WashCarWeather {
    case thunderstorms
    case snowers
    case heavy_showers
    case drizzle
    case mixed_rain
    case snow
    case scattered_snow
    case sleet
    case blowing_snow
    
}


//enum NotWashCarWeather {
//    case clear
//    case partly_cloudy
//    case hot
//    case dust
//    case haze
//    case smoke
//    case fog
//    case windy
//    case cloudy
//}


struct WeatherInfo: Decodable {
    let timezone: String
    let current: CurrentWeather
    let hourly: [HourlyWeatherInfo]
}

struct CurrentWeather: Decodable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Int
    let wind_deg: Int
    let weather: [Weather]
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct HourlyWeatherInfo: Decodable {
    let dt: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let clouds: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
}

struct Coord {
    let lat: Double
    let lon: Double
}
