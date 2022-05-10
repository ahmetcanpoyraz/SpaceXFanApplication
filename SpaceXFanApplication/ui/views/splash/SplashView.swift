//
//  ikinci.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 2.05.2022.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel = SplashViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isActive {
                LoginView()
            } else {
                Image("space-x-i-os-splash-screen-bg").resizable().edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    viewModel.isActive = true
                }
            }
        }
    }
    
}
