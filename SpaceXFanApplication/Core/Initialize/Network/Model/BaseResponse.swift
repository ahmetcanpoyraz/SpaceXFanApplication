//
//  BaseResponse.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 12.05.2022.
//

import Foundation
struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}
