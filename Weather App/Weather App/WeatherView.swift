//
//  WeatherView.swift
//  Weather App
//
//  Created by Prashant Pandey on 01/04/26.
//

struct WeatherView: View {
    @State private var store = WeatherStore()
    @State private var cityName = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Search Bar
                HStack {
                    TextField("Enter city name...", text: $cityName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Search") {
                        Task {
                            await store.fetchWeather(city: cityName)
                        }
                    }
                    .disabled(cityName.isEmpty)
                }
                .padding()
                
                // Loading State
                if store.isLoading {
                    ProgressView("Fetching weather...")
                }
                
                // Error State
                if let error = store.errorMessage {
                    VStack {
                        Text("⚠️ \(error)")
                            .foregroundColor(.red)
                        Button("Try Again") {
                            Task {
                                await store.fetchWeather(city: cityName)
                            }
                        }
                    }
                    .padding()
                }
                
                // Success State
                if let weather = store.weather {
                    WeatherCard(weather: weather)
                    
                    Button(action: {
                        Task {
                            await store.fetchWeather(city: cityName)
                        }
                    }) {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Weather App")
        }
    }
}
