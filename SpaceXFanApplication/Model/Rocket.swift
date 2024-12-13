//
//  Rocket.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation


struct RocketModel: Codable, Identifiable {
    let flickrImages: [String]
    let name: String
    let country, company: String
    let description, id: String

    enum CodingKeys: String, CodingKey {

        case flickrImages = "flickr_images"
        case name
        case country, company, description, id
    }
}

