//
//  ContentView.swift
//  temperature
//
//  Created by 채훈기 on 2020/08/27.
//  Copyright © 2020 채훈기. All rights reserved.
//

import SwiftUI

struct ScrollingHStackModifier: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    self.dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // Scroll to where user dragged
                    self.scrollOffset += event.translation.width
                    self.dragOffset = 0
                    
                    // Now calculate which item to snap to
                    let contentWidth: CGFloat = CGFloat(self.items) * self.itemWidth + CGFloat(self.items - 1) * self.itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = self.scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (self.itemWidth + self.itemSpacing)
                    
                    // Should we stay at current index or are we closer to the next item...
                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }
                    
                    // Protect from scrolling out of bounds
                    index = min(index, CGFloat(self.items) - 1)
                    index = max(index, 0)
                    
                    // Set final offset (snapping to item)
                    let newOffset = index * self.itemWidth + (index - 1) * self.itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - self.itemWidth) / 2.0) + self.itemSpacing
                    
                    // Animate snapping
                    withAnimation {
                        self.scrollOffset = newOffset
                    }
                    
                })
            )
    }
}

struct ContentView: View {
    var colors: [Color] = [.blue, .green, .orange, .red, .gray, .pink, .yellow]
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
//            ScrollView(.horizontal, showsIndicators: true) {
//                HStack(alignment: .center, spacing: 50) {
//                    ForEach(colors, id: \.self) { color in
//                        Rectangle()
//                            .foregroundColor(color)
//                            .frame(width: 200, height: 300, alignment: .leading)
//                    }
//                }
//            }
            HStack(alignment: .center, spacing: 30) {
                ForEach(0..<self.colors.count) { i in
                    self.colors[i]
                         .frame(width: 250, height: 400, alignment: .center)
                         .cornerRadius(10)
                    
                }
            }.modifier(ScrollingHStackModifier(items: self.colors.count, itemWidth: 250, itemSpacing: 30))
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
