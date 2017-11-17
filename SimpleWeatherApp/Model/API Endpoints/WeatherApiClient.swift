//
//  WeatherApiClient.swift
//  SimpleWeatherApp
//
//  Created by Ade Wija Nugraha on 8/21/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper

struct WeatherApiClient {
    private let provider = MoyaProvider<WeatherApi>()
    
    func getStaticWeatherData(_ completion: @escaping (WeatherResponse?) -> Void){
        provider.request(WeatherApi.getStaticWeatherData) { result in
            switch result {
            case.success(let response):
                do {
                    try completion(response.mapObject(WeatherResponse.self))
                } catch {
                    completion(nil)
                }
                break
            case .failure(_):
                completion(nil)
                break
            }
        }
    }
}
