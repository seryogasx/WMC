//
//  ContentView.swift
//  WMC
//
//  Created by Сергей Петров on 27.06.2020.
//  Copyright © 2020 SergioPetrovx. All rights reserved.
//

import SwiftUI
import Foundation
import CoreLocation



struct ContentView: View {
    
    let weather_info = get_data()
    let locationManager = CLLocationManager()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "car.fill")
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
            .shadow(radius: 20)
            Text("Hello")

            Spacer().frame(height: 50)

        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}


func getCoord() -> Coord {
    return Coord(lat: 55.4521, lon: 37.3704)
}


func get_data() -> WeatherInfo? {
    var weather_info: WeatherInfo?
    let coord = getCoord()
    weatherSource.coord = coord
    guard let url = weatherSource.weatherURL else {
        print("NO URL!")
        return weather_info
    }
    let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        
        guard error == nil else {
            print(error?.localizedDescription ?? "noDesc")
            return
        }
        
        guard let data = data else { return }
        guard let weather = try? JSONDecoder().decode(WeatherInfo.self, from: data) else {
            print("Nothing to decode!")
            return
        }
        print(weather)
        weather_info = weather
        
    }
    task.resume()
    return weather_info
}
