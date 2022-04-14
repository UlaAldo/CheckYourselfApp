//
//  ContentView.swift
//  CheckYourselfApp
//
//  Created by Юлия Алдохина on 13/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                Slider(currentValue: $currentValue, alpha: computeScore())
                Text("100")
            } .padding()
            Button("Проверь меня!", action: { showAlert.toggle() })
                .padding()
                .alert("Твой результат:", isPresented: $showAlert, actions: {}) { Text("\(computeScore())") }
            Button("Начать заново", action: { targetValue = Int.random(in: 0...100) })
                .padding()
        }
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
