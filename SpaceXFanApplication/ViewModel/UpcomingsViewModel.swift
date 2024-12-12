//
//  UpcomingsViewModel.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation

class UpcomingsViewModel: ObservableObject {
    @Published var upcomingLaunches: [Launch] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var hasFetchedData = false // Veri kontrolü


    private let spaceXService = SpaceXService()

    init() {
        loadUpcomingLaunches() // İlk başlatmada veriyi çek
       }
        
        // upcoming launches'ları çeker
        func loadUpcomingLaunches() {
            guard !hasFetchedData else { return } // Daha önce veriler yüklendiyse çık
            self.isLoading = true
            self.errorMessage = nil
            
            spaceXService.fetchUpcomingLaunches { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let launches):
                        self.upcomingLaunches = launches
                        self.hasFetchedData = true // Veri başarıyla yüklendi
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
