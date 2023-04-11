//
//  WeatherViewModel.swift
//  Miau Little Helper
//
//  Created by vko on 11/04/23.
//

import Foundation

public class WeatherViewModel: ObservableObject {
    @Published var cityname: String = "city name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    
    public let weatherService: WeatherService

    public init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    public func  refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityname = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
            }
        }
    }
}
