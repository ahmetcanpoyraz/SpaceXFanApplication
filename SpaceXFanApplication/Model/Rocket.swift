//
//  Rocket.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation

struct Rocket: Identifiable, Decodable {
    var id: String
    var name: String
    var description: String
    var flickr_images: [String]
}
