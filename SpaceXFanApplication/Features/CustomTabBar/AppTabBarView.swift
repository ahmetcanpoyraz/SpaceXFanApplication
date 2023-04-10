//
//  AppTabBarView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 1.05.2022.
//
import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    
    @State private var selection: String = "rockets"
    @State private var tabSelection: TabBarItem = .rockets
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ZStack{
                Image("spaceXIOsBg")
                        .resizable()
                VStack(alignment:.center){
                    Text("asdasd").padding(.top,UIScreen.main.bounds.height*0.05)
                    ZStack{
                        RocketsView(viewModel: RocketsViewModel())
                    }.onAppear() {
                        UITableView.appearance().backgroundColor = UIColor.clear
                        UITableViewCell.appearance().backgroundColor = UIColor.clear
                    }
                    
                }
            }.preferredColorScheme(.dark)
            
            //.listStyle(.insetGrouped)
            .navigationTitle("ads")
            
            
                    
                
            .tabBarItem(tab: .rockets, selection: $tabSelection) .navigationBarHidden(true).navigationBarBackButtonHidden(true).foregroundColor(.white)
            
            FavoritesView()
                .tabBarItem(tab: .favorites, selection: $tabSelection)

            TestTabView(text: "3")
                .tabBarItem(tab: .upcoming, selection: $tabSelection)
            
            TestTabView(text: "4")
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.clear
                .tabItem {
                    Image("rocketIcon")
                    Text("Home")
                }
            Color.clear
                .tabItem {
                    Image( "rocketIcon")
                    Text("Favorites")
                }
            Color.clear
                .tabItem {
                    Image("rocketIcon")
                    Text("Upcoming")
                }
            Color.clear
                .tabItem {
                    Image(systemName: "rocketIcon")
                    Text("Profile")
                }
        }
    }
    
}

struct TestTabView: View {
    
    let text: String
    @State private var textFieldText: String = ""
    
    init(text: String) {
        self.text = text
        print("INIT" + text)
    }
    
    var body: some View {
        VStack {
            Text(text)
                .onAppear {
                    print("ONAPPEAR" + text)
            }
            TextField("Type something...", text: $textFieldText)
                .disableAutocorrection(true)
            
        }
    }
}
