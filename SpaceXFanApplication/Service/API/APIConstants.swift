//
//  APIConstants.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation

struct APIConstants{
    static let shared = APIConstants()
        
    private init() {} // Singleton'ı dışarıdan başlatmayı engellemek için
    
    private let baseURL = "https://api.spacexdata.com/v4/rockets"
}
