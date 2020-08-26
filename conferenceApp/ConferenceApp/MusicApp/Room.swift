//
//  Room.swift
//  musicapp
//
//  Created by 채훈기 on 2020/08/24.
//  Copyright © 2020 채훈기. All rights reserved.
//

import Foundation

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var image: String
    internal init(name: String, capacity: Int, image: String) {
        self.name = name
        self.capacity = capacity
        self.image = image
    }
    
}

let testData = [
    Room(name: "회의실", capacity: 20, image: "confer1"),
    Room(name: "강의실", capacity: 30, image: "confer2"),
    Room(name: "강의실1", capacity: 5, image: "confer3"),
    Room(name: "강의실2", capacity: 6, image: "confer1"),
    Room(name: "강의실3", capacity: 2, image: "confer2"),
    Room(name: "강의실4", capacity: 10, image: "confer3"),
    Room(name: "강의실5", capacity: 14, image: "confer1"),

]
