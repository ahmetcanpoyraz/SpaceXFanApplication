//
//  HomeView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0  // Seçili sekmeyi takip ediyoruz

    var body: some View {
        BackgroundView{
            VStack {
                        // SegmentedControl: Tabları üstte gösteriyoruz
                        Picker(selection: $selectedTab, label: Text("Tabs")) {
                            Text("Rockets").tag(0).font(.title2)
                            Text("Favourites").tag(1).font(.title2)
                            Text("Upcomings").tag(2).font(.title2)
                        }
                        .pickerStyle(SegmentedPickerStyle()) // SegmentedPicker style kullanıyoruz
                        .padding()  // Üst kısımdaki segmentlerin arasına padding ekliyoruz

                        // Seçilen sekmeye göre içerikleri gösteriyoruz
                        if selectedTab == 0 {
                            RocketsView()
                        } else if selectedTab == 1 {
                            FavouritiesView()
                        } else {
                            UpcomingsView()
                        }

                        Spacer() // Ekranı daha düzgün hale getirmek için alt kısma boşluk ekliyoruz
                    }
     
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    HomeView()
}
