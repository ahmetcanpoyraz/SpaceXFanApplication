import SwiftUI
import SDWebImageSwiftUI

struct RocketsView: View {
    @StateObject private var viewModel = RocketsViewModel()
    @EnvironmentObject var favouritesViewModel : FavouritesViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading rockets...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.rockets) { rocket in
                                HStack {
                                    NavigationLink(destination: RocketDetailView(rocket: rocket,favouritesViewModel: favouritesViewModel)) {
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
                                        favouritesViewModel.toggleFavorite(rocket: rocket)

                                    }) {
                                        Image(systemName: favouritesViewModel.rockets.contains(where: { $0.id == rocket.id }) ? "heart.fill" : "heart")
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
    RocketsView()
}
