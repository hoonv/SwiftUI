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
            ForEach(0..<2) { item in
                HStack {
                    ForEach(0..<2) { item in
                        Rectangle()
                            .frame(width: 160, height: 160)
                            .foregroundColor(.gray)
                    }

                }
            }
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
