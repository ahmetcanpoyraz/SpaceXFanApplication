//
//  RocketService.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 12.12.2024.
//

import Foundation
import Alamofire

class SpaceXService {
    
    func fetchRockets(completion: @escaping (Result<[RocketModel], Error>) -> Void) {
        AF.request(APIConstants.shared.baseURL + APIConstants.shared.rockets ).responseDecodable(of: [RocketModel].self) { response in
            switch response.result {
            case .success(let rockets):
                completion(.success(rockets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUpcomingLaunches(completion: @escaping (Result<[Launch], Error>) -> Void) {
        AF.request(APIConstants.shared.baseURL + APIConstants.shared.upcomings, method: .get).responseDecodable(of: [Launch].self) { response in
              switch response.result {
              case .success(let launches):
                  completion(.success(launches))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
  }

