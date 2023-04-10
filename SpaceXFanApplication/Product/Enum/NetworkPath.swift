//
//  NetworkPath.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 12.05.2022.
//
import Foundation


enum NetworkPath: String {
    case rockets = "v3/rockets"

    

    func firebasePath() -> String {
        return "\(self.rawValue).json"
        return ""
    }
}
