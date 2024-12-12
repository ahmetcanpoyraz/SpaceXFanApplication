import SwiftUI

struct RocketsView: View {
    @StateObject private var viewModel = RocketsViewModel()

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
                                    NavigationLink(destination: RocketDetailView(rocket: rocket)) {
                                        VStack {
                                            Text(rocket.name)
                                                .font(.headline)
                                                .padding(.bottom, 5)
                                                .foregroundColor(.white)
                                               
                                            
                                            if let url = URL(string: rocket.flickrImages.first ?? "") {
                                                AsyncImage(url: url) { image in
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
                                        print("Favorite button tapped for \(rocket.name)")
                                    }) {
                                        Image(systemName: "heart")
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
