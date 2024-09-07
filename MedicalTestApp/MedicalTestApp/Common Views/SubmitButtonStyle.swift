//
//  SubmitButtonStyle.swift
//  MedicalTestApp
//
//  Created by Muhammad Bassiouny on 30/08/2024.
//

import SwiftUI

public struct SubmitButtonStyle: ButtonStyle {
    var isValid: Bool
    var color: Color
    
    public init(isValid: Bool, color: Color) {
        self.isValid = isValid
        self.color = color
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .foregroundColor(.white)
            .background(isValid ? color : Color.gray)
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
    }
}
