//
//  WeatherCard.swift
//  Weather App
//
//  Created by Prashant Pandey on 01/04/26.
//
import SwiftUI

// File: WeatherCard.swift
struct WeatherCard: View {
    let weather: WeatherResponse
    
    var body: some View {
        VStack(spacing: 16) {
            Text(weather.name)
                .font(.largeTitle)
                .bold()
            
            Text("\(Int(weather.main.temp))°C")
                .font(.system(size: 60, weight: .thin))
            
            if let condition = weather.weather.first {
                Text(condition.description.capitalized)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            
            HStack(spacing: 30) {
                VStack {
                    Text("Humidity")
                        .font(.caption)
                    Text("\(weather.main.humidity)%")
                        .bold()
                }
                
                VStack {
                    Text("Wind")
                        .font(.caption)
                    Text("\(Int(weather.wind.speed)) m/s")
                        .bold()
                }
                
                VStack {
                    Text("Feels like")
                        .font(.caption)
                    Text("\(Int(weather.main.feelsLike))°C")
                        .bold()
                }
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(16)
        .padding()
    }
}
