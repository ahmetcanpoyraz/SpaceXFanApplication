//
//  NetworkQuery.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 12.05.2022.
//

import Foundation


enum NetworkQuery: String {
    case orderBy = "orderBy"
    case limitToFirst = "limitToFirst"
    case startAt = "startAt"

    func value() -> String {
        switch self {
        case .limitToFirst:
            return "10"
        case .orderBy:
            return "\"code\""
        case .startAt:
            return ""
        }
    }
}
