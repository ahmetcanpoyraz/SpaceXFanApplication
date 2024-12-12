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
    var systemName : String
    var isPassword : Bool
    @Binding var text: String

    var body: some View {
        HStack {
            if isPassword {
                SecureField (placeholder,text: $text).keyboardType(.default).textContentType(.password).foregroundColor(.black)
             } else {
                 TextField(placeholder, text: $text).foregroundColor(.black)
             }
            Image(systemName: systemName)
                   .foregroundColor(.gray)
               }
        .padding()
               .background(Color.white)
               .cornerRadius(8)
               .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
           }
}




