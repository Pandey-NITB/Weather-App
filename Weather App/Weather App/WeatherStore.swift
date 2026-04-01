//
//  WeatherStore.swift
//  Weather App
//
//  Created by Prashant Pandey on 01/04/26.
//

// File: WeatherStore.swift
import Foundation
import Observation

@Observable
class WeatherStore {
    var weather: WeatherResponse?
    var isLoading = false
    var errorMessage: String?
    
    private let apiKey = "401313a241069d3d5e8475e8e720a409"
    
    func fetchWeather(city: String) async {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid city name"
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
        } catch {
            errorMessage = "City not found. Please try again."
            weather = nil
        }
        
        isLoading = false
    }
}
