//
//  NetworkService.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 12.05.2022.
//

import Foundation
final class NetworkService {

    private static var _instance: NetworkService?

    public static var instance: NetworkService {
        get {
            if let instance = _instance {
                return instance
            } else {
                let _instance = NetworkService()
                self._instance = _instance
                return _instance
            }
        }
    }

    private init() { }

    private let baseUrl = "https://api.spacexdata.com/v3/rockets"

    lazy var manager: INetworkManager = {
        return NetworkManager(config: NetworkConfig(baseUrl: self.baseUrl))
    }()
}
