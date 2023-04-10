//
//  RoceketCardWidget.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 14.05.2022.
//
import SwiftUI
import Kingfisher

struct RocketCardWidget: View {

    let rocket: Rocket

    var body: some View {
        VStack {
            //KFImage(URL(string: dog.imageURL)).resizable().aspectRatio(contentMode: .fit).frame(height: //200, alignment: .center)
            Spacer()
            HStack {
                VStack(alignment: .center, spacing: 5, content: {
                    Text("Status Code").fontWeight(.light).font(.system(size: 10))
                    Text("\(rocket.rocketName)").bold()
                  //  Text("asd \(rocket.firstStage?.burnTimeSEC ?? "asd")asd").bold()
                }) .onAppear() {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
                Spacer()
            }

        }.fixedSize(horizontal: false, vertical: true)
            .onAppear() {
              
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear}
    }
}

struct RocketCardWidget_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
