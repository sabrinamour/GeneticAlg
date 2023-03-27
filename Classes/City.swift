//
//  City.swift
//  testtttt
//
//  Created by Sabrina Moura on 23/03/23.
//

import SwiftUI

struct City: Equatable {
    var id = UUID()
    let x: Float
    let y: Float
    @ObservedObject var globalcontents = GlobalContents()

    func distance(otherCity: City) -> Float {
        
        var distancesDictionary = globalcontents.distancesDictionary
        
        if let distance = distancesDictionary["\(id)\(otherCity.id)"] {
            return distance
        }
        
        let xDistance = abs(x - otherCity.x)
        let yDistance = abs(y - otherCity.y)
        let distance = sqrt(pow(xDistance, 2) + pow(yDistance, 2))
        distancesDictionary["\(id)\(otherCity.id)"] = distance
        return distance
    }
    
    func position() -> CGPoint {
        return CGPoint(x: Double(x), y: Double(y))
    }
    
    static func == (lhs: City, rhs: City) -> Bool {
        return
            lhs.x == rhs.x &&
            lhs.y == rhs.y
    }
}
