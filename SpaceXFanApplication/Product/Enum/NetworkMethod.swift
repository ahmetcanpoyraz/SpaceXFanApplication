//
//  NetworkMethod.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 12.05.2022.
//

import Foundation
import Alamofire

enum NetworkMethod {
    case GET
    case POST


    func method() throws -> HTTPMethod {
        switch self {
        case .GET:
            return HTTPMethod.get
        case .POST:
            return HTTPMethod.post
        default:
            throw ProjectErrors.notFoundMethod
        }
    }
}
