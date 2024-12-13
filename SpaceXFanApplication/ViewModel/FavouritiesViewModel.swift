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
    private var hasFetchedData = false // Veri kontrolü

    func fetchRockets() {
        print(1)
        guard !hasFetchedData else { return } // Daha önce veriler yüklendiyse çık
        isLoading = true
        DispatchQueue.main.async {
            self.rockets = CoreDataManager.shared.fetchFavorites()
            self.isLoading = false
            self.hasFetchedData = true
            print(2)
        }
    }
    
    init() {
           fetchRockets() //
       }

    func toggleFavorite(rocket: RocketModel) {
        if rockets.contains(where: { $0.id == rocket.id }) {
            CoreDataManager.shared.removeRocketFromFavorites(rocket)
            rockets.removeAll { $0.id == rocket.id }
        } else {
            CoreDataManager.shared.addRocketToFavorites(rocket)
            rockets.append(rocket)
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.rockets = CoreDataManager.shared.fetchFavorites()
            self.isLoading = false
        }
    }
}
