//
//  RocketDetail.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI


struct RocketDetailView : View{
    let rocket: RocketModel

       var body: some View {
           VStack {
             // Detaylar
               ZStack(alignment: .topTrailing){
                   if let url = URL(string: rocket.flickrImages.first ?? "") {
                       AsyncImage(url: url) { image in
                           image.resizable()
                               .scaledToFit()
                               .clipped()
                               .frame(height: 300)
                       } placeholder: {
                           ProgressView()
                               .frame(width: 300, height: 300)
                       }
                   }
                   Button(action: {
                       print("Favorite button tapped for \(rocket.name)")
                   }) {
                       Image(systemName: "heart")
                           .resizable()
                           .frame(width: 30, height: 30)
                           .foregroundColor(.red)
                           .padding()
                           
                   }
               }
             
               Text(rocket.name)
                   .font(.title2)
                   .padding()
               Text(rocket.description)
                   .font(.title2)
                   .padding()
               Text(rocket.company)
                   .font(.title2)
                   .padding()
               Text(rocket.country)
                   .font(.title2)
                   .padding()
               
           }
           .navigationTitle(rocket.name)
       }
   }



