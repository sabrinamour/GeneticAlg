//
//  GeneticAlgorithmView.swift
//  Nano Challenge X
//  DataStructure and Algorithms
//
//  Created by Sabrina Moura on 23/03/23.
//

import SwiftUI

struct MainView: View {
    @State private var numberOfCities = 0
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Choose a number of cities you would like to visit")
                    .font(.title2)
                
                TextField("", value: $numberOfCities, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(.blue)
                            .padding()
                
                NavigationLink(destination: ContentView(citiesCount: numberOfCities)) {
                    Text("Check your best route")
                }.disabled(numberOfCities == 0)
                    .buttonStyle(.bordered)
            
            }.padding(30)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
