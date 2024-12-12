//
//  RocketsViewModel.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation

class RocketsViewModel: ObservableObject {
    @Published var rockets: [RocketModel] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading = false
    private var hasFetchedData = false // Veri kontrolü


    private let rocketService = RocketService()
    
    init() {
           fetchRockets() // İlk başlatmada veriyi çek
       }

    
    func fetchRockets() {
        guard !hasFetchedData else { return } // Daha önce veriler yüklendiyse çık
           isLoading = true
           errorMessage = nil
           
           rocketService.fetchRockets { [weak self] result in
               DispatchQueue.main.async {
                   self?.isLoading = false
                   switch result {
                   case .success(let rockets):
                       self?.rockets = rockets
                       self?.hasFetchedData = true // Veri başarıyla yüklendi
                   case .failure(let error):
                       self?.errorMessage = error.localizedDescription
                   }
               }
           } 
       }
   }
