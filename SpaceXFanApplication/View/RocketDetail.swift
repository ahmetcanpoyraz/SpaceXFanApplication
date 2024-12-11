//
//  RocketDetail.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI


struct RocketDetailView : View{
    let rocket: Rocket // Detayda gösterilecek roket
    
    
    var body: some View {
        Text("sdasd")
    }
}

#Preview{
    RocketDetailView(rocket: Rocket(id: "1", name: "1", description: "1", flickr_images: ["asd"]))
}
