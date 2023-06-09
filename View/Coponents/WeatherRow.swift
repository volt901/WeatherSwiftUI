//
//  WeatherRow.swift
//  WeatherSwiftUI
//
//  Created by Владимир Ширяев on 21.03.2023.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image (systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(.secondary)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
        //.frame(width: 180, height: 100)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8")
    }
}
