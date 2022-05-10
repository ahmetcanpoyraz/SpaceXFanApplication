//
//  AuthViewModel.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 9.05.2022.
//

import Foundation
import Firebase

final class LoginViewModel: ObservableObject{
    
    let db = Firestore.firestore()
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var showAuthView = true
    
    
    func signIn(withEmail: String,password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password){
            (result,error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                
            }
        }
    }
    
    
    func createUser(withEmail: String,password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password){
            (result,error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                
            }
        }
    }
}
