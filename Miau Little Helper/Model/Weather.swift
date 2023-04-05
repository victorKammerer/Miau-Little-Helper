//
//  APIService.swift
//  Miau Little Helper
//
//  Created by vko on 30/03/23.
//

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
