//
//  CustomTextField.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
                Image(systemName: "person")
                       .foregroundColor(.gray)
                   TextField(placeholder, text: $text)
                 
               }
        .padding()
               .background(Color.white)
               .cornerRadius(8)
               .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
           }
}




