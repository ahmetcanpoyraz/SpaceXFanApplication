//
//  BottomNavigationBarView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 11.05.2022.
//

import SwiftUI

struct BottomNavigationBarView: View {
    var body: some View {
        TabView {
            
            Text("Rockets Screen")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Rockets")
            }
                Text("Favourites Screen")
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourites")
                }
               
                Text("Upcoming Screen")
                    .tabItem {
                        Image(systemName: "mappin.circle.fill")
                        Text("Upcoming")
                }
        }.foregroundColor(.pink)
    }
}

struct BottomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBarView()
    }
}
