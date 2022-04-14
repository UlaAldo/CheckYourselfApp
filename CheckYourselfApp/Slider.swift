//
//  Slider.swift
//  CheckYourselfApp
//
//  Created by Юлия Алдохина on 13/04/22.
//

import SwiftUI

struct Slider: UIViewRepresentable {
   
    @Binding var currentValue: Float
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()

        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action:  #selector(Coordinator.setNum),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        uiView.thumbTintColor = UIColor(red: 0.80, green: 0.25, blue: 0.70, alpha: (CGFloat(alpha) / 100))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
    
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
       @objc func setNum(_ sender: UISlider) {
            currentValue = sender.value
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(currentValue: .constant(50), alpha: 50)
    }
}
