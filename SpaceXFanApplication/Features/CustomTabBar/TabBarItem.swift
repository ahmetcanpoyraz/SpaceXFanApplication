//
//  TabBarItem.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 1.05.2022.
//
import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case rockets, favorites, upcoming, profile
    
    var iconName: String {
        switch self {
        case .rockets: return "rocketIcon"
        case .favorites: return "favoriteIcon"
        case .upcoming: return "upcomingIcon"
        case .profile: return "profileIcon"
        }
    }
    
    var title: String {
        switch self {
        case .rockets: return "Rockets"
        case .favorites: return "Favorites"
        case .upcoming: return "Profile"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .rockets: return Color("green")
        case .favorites: return Color("green")
        case .upcoming: return Color("green")
        case .profile: return Color("green")
        }
    }
}
