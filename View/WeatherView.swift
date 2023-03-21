//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Владимир Ширяев on 19.03.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack {
                    HStack{
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size:40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble()+" °")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 30)
                    
                    AsyncImage(url: URL(string: "https://www.ndbmarshak.ru/content/news/2018/pogoda.png")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
           .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack() {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "˚"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "˚"))
                        
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(.blue)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previeWeather)
    }
}
