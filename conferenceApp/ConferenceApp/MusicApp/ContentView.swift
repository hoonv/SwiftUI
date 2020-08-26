//
//  ContentView.swift
//  MusicApp
//
//  Created by 채훈기 on 2020/08/21.
//  Copyright © 2020 채훈기. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var rooms: [Room] = []
    var body: some View {
        NavigationView {
            List() {
                ForEach(rooms) { room in
                    listItem(room: room)
                }
            }
        
            .navigationBarTitle(Text("Rooms"), displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}

struct listItem: View {
    var room: Room
    
    var body: some View {
        NavigationLink(destination: DetailView(room: room)) {
            Image(room.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 75.0, height: 75.0, alignment: .leading)
            VStack(alignment: .leading){
                Text("\(room.name)")
                Text("\(room.capacity) peoples")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
