//
//  Weather+API.swift
//  Miau Little Helper
//
//  Created by vko on 10/04/23.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}
