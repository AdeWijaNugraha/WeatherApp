//
//  WeatherResponse.swift
//  SimpleWeatherApp
//
//  Created by Ade Wija Nugraha on 8/21/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherResponse: Mappable {
    
    var name: String!
    
    var temperature: Double!
    
    var weatherCondition: String! //cloud, rain
    
    var weatherIconCode: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.temperature <- map["main.temp"]
        self.weatherCondition <- map["weather.0.main"]
        self.weatherIconCode <- map["weather.0.icon"]
        
    }
}
