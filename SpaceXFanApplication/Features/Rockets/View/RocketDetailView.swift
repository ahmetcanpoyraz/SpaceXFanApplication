//
//  RocketDetailView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 14.05.2022.
//

import SwiftUI
import Kingfisher

struct RocketsDetailView: View {
    
    let rocket : Rocket
    
    var body: some View {
        NavigationView{
            VStack(content: {
                Spacer()
                Spacer()
                Spacer()
                Text("Code: \(rocket.rocketName)").font(.headline).foregroundColor(.white)
               // KFImage(URL(string: dog.imageURL)).resizable().aspectRatio(contentMode: .fit).frame(height: //200, alignment: .center)
                Text("Description:").font(.caption).foregroundColor(.white)
                Spacer().frame(height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
             //   Text(rocket.company)
                Spacer()
            }).edgesIgnoringSafeArea(.top).frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background((LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottom)))
        }
        
    }
}

struct RocketsDetailView_Previews: PreviewProvider {
    static var previews: some View {
      EmptyView()
    }
}
