//
//  LoginView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject private var viewModel = LoginViewModel()
    @State private var isLoggedIn = false // Kullanıcı giriş yaptı mı?

    
    var body: some View {
        NavigationStack {
            BackgroundView{
                VStack {
                    Text("Please login to see rocket details!").font(.title2).fontWeight(.bold)
                    Spacer().frame(height: 60)
                    VStack(alignment: .leading){
                        Text("Username").font(.title3)
                        CustomTextField(placeholder: "Username", text: $username)
                        Spacer().frame(height: 10)
                        Text("Password").font(.title3)
                        CustomTextField(placeholder: "Password", text: $password)
                        
                    }.padding(20)
                    
                    Text("Forgot Password?").font(.system(size: 14))
                        .frame(maxWidth: .infinity,  alignment: .trailing).padding(.horizontal)
                    Spacer().frame(height: 40)
                    Button(action: {
                        print("Custom Button tapped!")
                        self.isLoggedIn = true
                    }) {
                        Text("LOGIN")
                            .frame(maxWidth: .infinity, minHeight: 20)
                    }
                    .customButton(backgroundColor: .blue, textColor: .white)
                    .padding(.horizontal)
                    Button(action: {
                        print("Text button tapped!")
                    }) {
                        Text("or use FaceID")
                            .fontWeight(.bold)  // Metnin kalınlığı
                            .foregroundColor(.blue)  // Metnin rengi
                            .padding()  // Metnin etrafına boşluk ekler
                            .background(Color.white)  // Butonun arka planı
                        
                    }
                    .padding()  // Buton etrafına padding ekler
                    .navigationDestination(isPresented: $isLoggedIn) {
                        HomeView().environment(\.colorScheme, .dark) // Kullanıcı giriş yaptıysa HomeView'e geçiş yapılacak
                    }
                }
            }
        }
    }
}


#Preview {
    LoginView()
}

