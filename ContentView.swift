import SwiftUI

struct ContentView: UIViewRepresentable {
    typealias UIViewType = MapView
    
    var citiesCount: Int
    
    init(citiesCount: Int) {
        self.citiesCount = citiesCount
    }
    
    let populationSize = 20
    let eliteSize = 1
    let tournamentSize = 5
    let maxGenerationSize = 100
    let fieldSize = 400.0
    let minPosition = Float(10.0)
    lazy var maxPosition = Float(fieldSize-10.0)

    func makeUIView(context: Context) -> MapView {
        let view = MapView(citiesCount: citiesCount, fieldSize: fieldSize, minPosition: minPosition)
        return view
    }
    
    func updateUIView(_ uiView: MapView, context: Context) {
        
    }
}
