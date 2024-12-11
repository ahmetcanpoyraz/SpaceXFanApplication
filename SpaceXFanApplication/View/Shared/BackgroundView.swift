//
//  BackgroundView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI

struct BackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Arka plan resmini her zaman ekranın tamamını kapsayacak şekilde yerleştiriyoruz.
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // İçeriği arka planın üzerine koyuyoruz
            content
                .padding()  // İçeriğe padding ekleyerek, kenarlardan uzaklaştırıyoruz
        }
    }
}
