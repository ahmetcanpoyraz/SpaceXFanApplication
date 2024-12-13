//
//  FavouritiesView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct FavouritiesView: View {
    @EnvironmentObject var viewModel : FavouritesViewModel
    
    

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading favorites...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.rockets) { rocket in
                                HStack {
                                    NavigationLink(destination: RocketDetailView(rocket: rocket,favouritesViewModel: viewModel)) {
                                        VStack {
                                            Text(rocket.name)
                                                .font(.headline)
                                                .padding(.bottom, 5)
                                                .foregroundColor(.white)

                                            if let url = URL(string: rocket.flickrImages.first ?? "") {
                                                WebImage(url: url) { image in
                                                    image.resizable()
                                                        .scaledToFill()
                                                        .frame(width: 170, height: 170)
                                                        .clipped()
                                                } placeholder: {
                                                    ProgressView()
                                                        .frame(width: 170, height: 170)
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    }

                                    Spacer()

                                    Button(action: {
                                        viewModel.toggleFavorite(rocket: rocket)
                                    }) {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.red)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}




#Preview {
    FavouritiesView()
}
