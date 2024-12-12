//
//  LoginViewModel.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import FirebaseAuth
import LocalAuthentication


class LoginViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var errorMessage: String? = nil
    @Published var isLoading = false
    private let firebaseService: FirebaseService
    @Published private var isFaceIDUnlocked = false
    
    init(firebaseService: FirebaseService = FirebaseService()) {
         self.firebaseService = firebaseService
     }
    
    func login(email: String, password: String) {
           self.isLoading = true
           self.errorMessage = nil // Her yeni girişte hata mesajını temizle
           
           // Firebase ile giriş
           firebaseService.login(email: email, password: password) { result in
               DispatchQueue.main.async {
                   self.isLoading = false
                   switch result {
                   case .success(let user):
                       print("User ID: \(user.uid)")
                       self.isLoggedIn = true
                   case .failure(let error):
                       self.errorMessage = error.localizedDescription
                   }
               }
           }
       }
    
    func authenticateFaceId() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error:  &error){
            let reason = "We need unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    DispatchQueue.main.async {
                        self.isFaceIDUnlocked = true
                        self.isLoggedIn = true
                    }
                } else{
                    self.errorMessage = authenticationError?.localizedDescription
                }
            }
        } else{
            self.errorMessage = error?.localizedDescription
        }
        
    }
 
}



