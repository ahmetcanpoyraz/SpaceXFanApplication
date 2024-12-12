//
//  Launch.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 12.12.2024.
//

import Foundation

struct Launch: Decodable, Identifiable {
    let id: String
    let name: String
    let date_utc: String
    let details: String?
    let links: LaunchLinks
    
    struct LaunchLinks: Decodable {
        let patch: Patch?
        
        struct Patch: Decodable {
            let small: String?
        }
    }
}
