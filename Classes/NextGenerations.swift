//
//  AllClasses.swift
//  testtttt
//
//  Created by Sabrina Moura on 23/03/23.
//

import SwiftUI

struct NextGenerations {
    let tournamentSize: Int
    let populationSize: Int
    let eliteSize: Int
    let citiesCount: Int
    
    let minPosition: Float
    var maxPosition: Float

    func selectParentTournament(_ population:[Chromosome]) -> Chromosome{
        var tournamentPopulation = [Chromosome]()
        for _ in 1...tournamentSize {
            tournamentPopulation.append(population[Int(arc4random_uniform(UInt32(population.count)))])
        }

        let sortedTournamentPopulation = tournamentPopulation.sorted { (ch1, ch2) -> Bool in
            return ch1.summaryDistance < ch2.summaryDistance
        }
        return sortedTournamentPopulation.first!
    }

    func getEliteToPreserve(_ population: [Chromosome]) -> [Chromosome] {
        let sortedPopulation = population.sorted { (ch1, ch2) -> Bool in
            return ch1.summaryDistance < ch2.summaryDistance
        }
        
        return sortedPopulation.dropLast(populationSize-eliteSize)
    }

    func createNextGeneration(population: [Chromosome]) -> [Chromosome] {
        var nextGeneration = [Chromosome]()
        
        nextGeneration.append(contentsOf: getEliteToPreserve(population))
        
        for _ in 1...populationSize-eliteSize {
            
            let chromosome1 = selectParentTournament(population)
            let chromosome2 = selectParentTournament(population)
            
            
            let gene1 = Int.random(in: 0...citiesCount-1)
            let gene2 = Int.random(in: 0...citiesCount-1)
            
            let crossoverStart = min(gene1, gene2)
            let crossoverEnd = max(gene1, gene2)
            
            var tempChromosome = [City]()
            for index in crossoverStart...crossoverEnd {
                tempChromosome.append(chromosome1.cities[index])
            }
            
            var newChromosome = [City]()
            for city in chromosome2.cities {
                if !tempChromosome.contains(city) {
                    newChromosome.append(city)
                }
            }
            
            newChromosome.insert(contentsOf: tempChromosome, at: crossoverStart)
            var offspring = Chromosome(initialCities: newChromosome, citiesCount: citiesCount)
            offspring.mutate()
            nextGeneration.append(offspring)
        }
        
        return nextGeneration
    }
    
    func createInitialPopulation() {
        var tempArray = [City]()
        for _ in 1...citiesCount {
            let x = Float.random(in: minPosition...maxPosition)
            let y = Float.random(in: minPosition...maxPosition)
            let city = City(x: x, y: y)
            print(city)
            tempArray.append(city)
        }
        let defaultOrder = tempArray

        var population = [Chromosome]()
        for _ in 1...populationSize {
            let chromosome = Chromosome(initialCities: defaultOrder.shuffled(), citiesCount: 10)
            population.append(chromosome)
        }
    }
}

