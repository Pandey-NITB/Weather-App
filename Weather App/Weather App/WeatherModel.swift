//
//  WeatherModel.swift
//  Weather App
//
//  Created by Prashant Pandey on 01/04/26.
//

struct WeatherResponse: Codable {
    let name: String
    let main: MainWeather
    let weather: [WeatherCondition]
    let wind: Wind
}

struct MainWeather: Codable {
    let temp: Double
    let humidity: Int
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case humidity
        case feelsLike = "feels_like"
    }
}

struct WeatherCondition: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double
}
