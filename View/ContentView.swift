//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Владимир Ширяев on 18.03.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if weather != nil {
                    WeatherView(weather: weather!)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print ("Error getting weather: \(error)")
                            }
                        }
                }
                
                
            } else {
                    if locationManager.isLoading {
                       LoadingView()
                    } else {
                        WelcomView().environmentObject(locationManager)
                    }
                }
            
  
        }
        .background(.blue)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
