//
//  WeatherApiEndpoints.swift
//  SimpleWeatherApp
//
//  Created by Ade Wija Nugraha on 8/21/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import Foundation
import Moya

enum WeatherApi {
    case getStaticWeatherData
}

extension WeatherApi: TargetType{
    var baseURL: URL{
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    var path: String{
        switch self {
        case .getStaticWeatherData:
            return "/weather"
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .getStaticWeatherData:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getStaticWeatherData:
            return [
                "q": "Malang,id",
                "units": "metric",
                "appid": "8920bfb9b0eb27c8343e85d9f9a6d41a"
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getStaticWeatherData:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    
    var task: Task{
        return .request
    }
}
