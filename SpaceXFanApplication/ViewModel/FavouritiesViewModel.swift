//
//  FavouritiesViewModel.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
class FavouritesViewModel: ObservableObject {
    @Published var rockets: [Rocket] = []
    @Published var isLoading = false

    func fetchRockets() {
        rockets = [Rocket(id: "11", name: "asd", description: "asdasd", flickr_images: ["asdasdasd"]),Rocket(id: "12", name: "asd", description: "asdasd", flickr_images: ["asdasdasd"])]
    }
}
