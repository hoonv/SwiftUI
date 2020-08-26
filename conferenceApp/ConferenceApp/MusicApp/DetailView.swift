//
//  DetailView.swift
//  musicapp
//
//  Created by 채훈기 on 2020/08/26.
//  Copyright © 2020 채훈기. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var room: Room
    @State var zoomed = true
    var body: some View {
        Image(room.image)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fit : .fill)
            .navigationBarTitle(Text(room.name), displayMode: .inline)
            .onTapGesture { withAnimation(.easeIn(duration: 0.5)) { self.zoomed.toggle()} }
            .transition(.move(edge: .leading))

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { DetailView(room: testData[0]) }
            NavigationView { DetailView(room: testData[1]) }

        }
    }
}
