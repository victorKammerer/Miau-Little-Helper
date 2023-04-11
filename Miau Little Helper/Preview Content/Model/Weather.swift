//
//  Weather.swift
//  Miau Little Helper
//
//  Created by vko on 10/04/23.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let Rinaldo: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        Rinaldo
        
    }
}
