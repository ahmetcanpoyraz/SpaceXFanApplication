//
//  RocketService.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 12.12.2024.
//

import Foundation
import Alamofire

class RocketService {
    private let baseURL = "https://api.spacexdata.com/v4/rockets"
    
    func fetchRockets(completion: @escaping (Result<[RocketModel], Error>) -> Void) {
        AF.request(baseURL).responseDecodable(of: [RocketModel].self) { response in
            switch response.result {
            case .success(let rockets):
                completion(.success(rockets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
