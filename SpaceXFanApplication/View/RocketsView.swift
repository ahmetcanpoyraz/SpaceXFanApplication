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
                                               
                                            
                                            if let url = URL(string: "https://gratisography.com/wp-content/uploads/2024/10/gratisography-cool-cat-800x525.jpg") {
                                                AsyncImage(url: url) { image in
                                                    image.resizable()
                                                        .scaledToFill()
                                                        .frame(width: 150, height: 150)
                                                        .clipped()
                                                } placeholder: {
                                                    ProgressView()
                                                        .frame(width: 150, height: 150)
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
            .onAppear {
                viewModel.fetchRockets()
            }
        }
    }
}


#Preview {
    RocketsView()
}
