//
//  FirebaseService.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 11.12.2024.
//

import Foundation
import FirebaseAuth

class FirebaseService {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                completion(.success(authResult.user))
            }
        }
    }
}
