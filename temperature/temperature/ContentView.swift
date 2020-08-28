//
//  ContentView.swift
//  temperature
//
//  Created by 채훈기 on 2020/08/27.
//  Copyright © 2020 채훈기. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Title()
            CardTiles()
            HStack {
                VStack(alignment: .leading) {
                    Text("temperature")
                        .font(.system(size: 29, weight: .medium, design: .default))
                    Text("see the more tempee")
                        .font(.system(size: 18, weight: .light, design: .default))
                }
                Spacer()
            }.padding(.all, 20)

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Title: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Home")
                    .font(.system(size: 29, weight: .medium, design: .default))
                Text("see the more tempee")
                    .font(.system(size: 18, weight: .light, design: .default))
            }
            Spacer()
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)
            
        }.padding(.all, 20)
    }
}

struct CardTiles: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(.gray)
            }
            HStack {
                Rectangle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: 160, height: 160)
                    .foregroundColor(.gray)
                
            }
        }
    }
}
