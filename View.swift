//
//  GeneticAlgorithmView.swift
//  Nano Challenge X
//  DataStructure and Algorithms
//
//  Created by Sabrina Moura on 23/03/23.
//

import Foundation
import UIKit

public class MapView: UIView  {
    let citiesCount: Int
    let fieldSize: Double
    let minPosition: Float
    
    init(citiesCount: Int, fieldSize: Double, minPosition: Float) {

        self.citiesCount = citiesCount
        self.fieldSize = fieldSize
        self.minPosition = minPosition
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        lazy var maxPosition = Float(fieldSize-10.0)
        
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
        for _ in 1...20 {
            let chromosome = Chromosome(initialCities: defaultOrder.shuffled(), citiesCount: 10)
            population.append(chromosome)
        }
        
        let currentBestChromosome = population.first
        
        guard let currentSolution = currentBestChromosome else {
            return
        }
        
        for city in currentSolution.cities {
            let dotPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: Double(city.x-5), y: Double(city.y-5)), size: CGSize.init(width: 10, height: 10)))
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = dotPath.cgPath
            shapeLayer.fillColor = UIColor.systemPink.cgColor
            layer.addSublayer(shapeLayer)
        }
        
        for (index, city) in currentSolution.cities.enumerated() {
            if index > 0 {
                let path = UIBezierPath()
                path.move(to: currentSolution.cities[index-1].position())
                path.addLine(to: city.position())
                
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = path.cgPath
                shapeLayer.strokeColor = UIColor.gray.cgColor
                shapeLayer.lineWidth = 1.0

                layer.addSublayer(shapeLayer)
            }
        }
        
        let path = UIBezierPath()
        path.move(to: currentSolution.cities.first!.position())
        path.addLine(to: currentSolution.cities.last!.position())
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0

        layer.addSublayer(shapeLayer)
    }
}
