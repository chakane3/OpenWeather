//
//  WeatherData.swift
//  OpenWeather
//
//  Created by Chakane Shegog on 9/22/21.
//

import Foundation

struct Weather: Codable {
    let list: [weatherLocation]
}

struct weatherLocation: Codable {
    let name: String
    let main: locationBasicWeather
}

struct locationBasicWeather: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

extension Weather {
    static func getWeatherData() -> [weatherLocation] {
        var weather = [weatherLocation]()
        guard let fileUrl = Bundle.main.url(forResource: "weatherAPI", withExtension: "json") else {
            fatalError("bad filename")
        }
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let weatherD = try JSONDecoder().decode(Weather.self, from: data)
            weather = weatherD.list
        } catch {
            fatalError("ok: \(error)")
        }
        
        return weather
    }
}
