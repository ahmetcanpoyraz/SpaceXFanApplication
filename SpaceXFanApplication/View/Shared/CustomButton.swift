//
//  CustomButton.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import SwiftUI

struct CustomButton: ViewModifier {
    var backgroundColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

extension View {
    func customButton(backgroundColor: Color, textColor: Color) -> some View {
        self.modifier(CustomButton(backgroundColor: backgroundColor, textColor: textColor))
    }
}

