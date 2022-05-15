//
//  FavoritesView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 11.05.2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ZStack(alignment: .top) { // << made explicit alignment to top
               HStack { // << moved this up to ZStack
                   Text("Top Text")
                       .fontWeight(.light)
                       .multilineTextAlignment(.center)
                       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                       .font(.body)
               }
               .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
               VStack(spacing: 0) {

                   VStack {
                       Text("Sign in with Facebook")
                           .fontWeight(.light)
                           .font(.title)
                           .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                           .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                       Text("Sign in with Google")
                           .fontWeight(.light)
                           .font(.title)
                           .padding()
                           .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                   }
               }
               .foregroundColor(Color.black.opacity(0.7))
               .padding()
               .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
               .offset(x: 0, y: 0)

           }
           .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
           .background(Color.orange.opacity(0.2))
           .edgesIgnoringSafeArea(.all)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
