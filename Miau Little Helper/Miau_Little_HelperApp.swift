//
//  Miau_Little_HelperApp.swift
//  Miau Little Helper
//
//  Created by vko on 20/03/23.
//

import SwiftUI

@main
struct Miau_Little_HelperApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            ContentView(viewModel: viewModel)
        }
    }
}
