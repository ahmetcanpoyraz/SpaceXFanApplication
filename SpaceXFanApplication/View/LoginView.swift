//
//  LoginView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject private var viewModel = LoginViewModel()


    
    var body: some View {
        NavigationStack {
            BackgroundView{
                VStack {
                    Text("Please login to see rocket details!").font(.title2).fontWeight(.bold)
                    Spacer().frame(height: 60)
                    VStack(alignment: .leading){
                        Text("Username").font(.title3)
                        CustomTextField(placeholder: "E-mail", systemName: "person",isPassword: false, text: $email)
                        Spacer().frame(height: 10)
                        Text("Password").font(.title3)
                        CustomTextField(placeholder: "Password", systemName: "lock",isPassword: true, text: $password)
                        
                    }.padding(20)
                    
                    Text("Forgot Password?").font(.system(size: 14))
                        .frame(maxWidth: .infinity,  alignment: .trailing).padding(.horizontal)
                    Spacer().frame(height: 40)
                    
                    if viewModel.isLoading {
                                 ProgressView("Logging in...")
                                     .padding()
                             } else {
                                 Button(action: {
                                     print("Custom Button tapped!")
                                     viewModel.login(email: email, password: password)
                                    // self.isLoggedIn = true
                                 }) {
                                     Text("LOGIN")
                                         .frame(maxWidth: .infinity, minHeight: 20)
                                 }
                                 .customButton(backgroundColor: .blue, textColor: .white)
                                 .padding(.horizontal)
                             }
                    
                    if let errorMessage = viewModel.errorMessage {
                                   Text(errorMessage)
                                       .foregroundColor(.red)
                                       .padding()
                               }
                    
                    Button(action: {
                        viewModel.authenticateFaceId()
                    }) {
                        HStack{
                            Image(systemName: "faceid").padding(.vertical,20).padding(.leading,20)
                            Text("or use FaceID")
                                .fontWeight(.bold)  // Metnin kalınlığı
                                .foregroundColor(.blue)// Metnin rengi
                                .padding(.trailing, 20)
                                .background(Color.white)  // Butonun arka planı
                        }.background(Color.white)
                    }
                    .padding()  // Buton etrafına padding ekler
                    .navigationDestination(isPresented: $viewModel.isLoggedIn) {
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

