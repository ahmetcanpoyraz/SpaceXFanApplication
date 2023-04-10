//
//  RocketsView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 11.05.2022.
//

import SwiftUI

struct RocketsView: View {
    @ObservedObject var viewModel: RocketsViewModel
    
    var body: some View {
        
      
            rocketListView().onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        
                   
           
        
        
       
            
        
    }

    fileprivate func rocketListView() -> some View {
        return VStack {
           
                List {
                    ForEach(viewModel.rocketList, id: \.id) { item in
                        self.rocketCard(item: item)
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                }.padding() .listStyle(.plain)
                
                if (viewModel.isLoading) {
                    loadindgView()
                }
                  
            
            
           
        }.onAppear() {
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
        }
    }


    fileprivate func loadindgView() -> some View {
        return GeometryReader { geometry in
            return IndicatorWidget().frame(
                width: geometry.size.width * 0.1,
                height: geometry.size.height * 0.1,
                                           alignment: .center).foregroundColor(.orange)
        }
    }



    func rocketCard(item: Rocket) -> some View {
        return NavigationLink(destination: RocketsDetailView(rocket: item)) {
            RocketCardWidget(rocket: item).onAppear {
               // self.viewModel.loadMoreContent(currentItem: item)
            } .navigationBarHidden(true)
                .navigationBarTitle("", displayMode: .inline)
        }.buttonStyle(PlainButtonStyle())
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear}.opacity(0.9).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .opacity(0.05)
                        .background(
                            Color.white.opacity(0.08)
                                .blur(radius: 10))
                )
    
    }


}

struct RocketsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsView(viewModel: RocketsViewModel())
    }
}

struct GlassMorphicCard: View{
    var body: some View{
        
    
    
    ZStack{
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .opacity(0.1)
            .background(
                Color.white.opacity(0.08)
                    .blur(radius: 10))
            .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(
                    .linearGradient(colors: [.purple,
                                             .purple.opacity(0.5),.clear,.clear,
                                             .blue], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2.5)
                .padding()
            )
            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
            .shadow(color: .black.opacity(0.1), radius: 0.1, x: 5, y: 5)
    }
    .frame(width: 200.0, height: 200.0)
    }

}







