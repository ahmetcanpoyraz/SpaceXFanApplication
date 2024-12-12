//
//  FavouritiesViewModel.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
class FavouritesViewModel: ObservableObject {
    @Published var rockets: [RocketModel] = []
    @Published var isLoading = false

    func fetchRockets() {
        print("")
    }
}
