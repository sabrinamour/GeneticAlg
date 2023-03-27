//
//  Chromossome.swift
//  testtttt
//
//  Created by Sabrina Moura on 23/03/23.
//

import SwiftUI

struct Chromosome {
    var cities: [City]
    var summaryDistance: Double
    var citiesCount: Int
    
    init(initialCities: [City], citiesCount: Int) {
        cities = initialCities
        self.citiesCount = citiesCount
        summaryDistance = 0
        summaryDistance = countSummaryDistance()
    }
    
    private func countSummaryDistance() -> Double {
        var distance = 0.0
        
        for (index, city) in cities.enumerated() {
            if index > 0 {
                distance += Double(city.distance(otherCity: cities[index-1]))
            }
            if index == cities.count-1 {
                distance += Double(city.distance(otherCity: cities[0]))
            }
        }
        return distance
    }
    
    mutating func mutate() {
        let citiesCount = 20
        let gene1 = Int.random(in: 0...citiesCount-1)
        let gene2 = Int.random(in: 0...citiesCount-1)
        
        cities.swapAt(gene1, gene2)
        summaryDistance = countSummaryDistance()
    }
}
