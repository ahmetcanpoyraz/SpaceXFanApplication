//
//  RocketService.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 14.05.2022.
//

import Foundation

class RocketService {
    let service: INetworkManager

    init(service: NetworkService) {
        self.service = service.manager
    }
    func getAllRockets(onSucess: @escaping ([Rocket]) -> Void, onError: @escaping(BaseError) -> Void) {

        service.fetch(path: .rockets, paramaters: nil, method: .get, onSuccess: { (response: BaseResponse<[Rocket]>) in
            guard let rockets = response.model else {
                onError(BaseError(message: "Not Found"))
                return
            }
            onSucess(rockets)
            print("başarılı")
        }) { (error) in
            onError(error)
            print("asdasda")
        }
    }

    func getLimitRockets(rocket: Rocket, onSucess: @escaping ([Rocket]) -> Void, onError: @escaping(BaseError) -> Void) {
        service.fetch(path: .rockets, paramaters: [
            NetworkQuery.orderBy.rawValue: NetworkQuery.orderBy.value(),
            NetworkQuery.limitToFirst.rawValue: NetworkQuery.limitToFirst.value(),
            NetworkQuery.startAt.rawValue: "\(rocket.rocketID)"
        ], method: .get, onSuccess: { (response: BaseResponse<[Rocket]>) in
            guard let rockets = response.model else {
                onError(BaseError(message: "Not Found"))
                return
            }
            onSucess(rockets)
        }) { (error) in
            onError(error)
        }
    }
}
