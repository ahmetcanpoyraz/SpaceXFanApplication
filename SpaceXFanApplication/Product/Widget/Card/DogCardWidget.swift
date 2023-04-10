////
////  DogCardWidget.swift
////  SpaceXFanApplication
////
////  Created by Ahmet can Poyraz on 12.05.2022.
////
//
//import SwiftUI
//import Kingfisher
//
//struct DogCardWidget: View {
//
//    let dog: Dog
//
//    var body: some View {
//        VStack {
//            KFImage(URL(string: dog.imageURL)).resizable().aspectRatio(contentMode: .fit).frame(height: 200, alignment: .center)
//            Spacer()
//            HStack {
//                VStack(alignment: .center, spacing: 5, content: {
//                    Text("Status Code").fontWeight(.light).font(.system(size: 10))
//                    Text("\(dog.code)").bold()
//                }) .onAppear() {
//                    UITableView.appearance().backgroundColor = UIColor.clear
//                    UITableViewCell.appearance().backgroundColor = UIColor.clear
//                }
//                Spacer()
//            }
//
//        }.fixedSize(horizontal: false, vertical: true)
//            .onAppear() {
//                UITableView.appearance().backgroundColor = UIColor.clear
//                UITableViewCell.appearance().backgroundColor = UIColor.clear}
//    }
//}
//
//struct DogCardWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        DogCardWidget(dog: Dog(code: 100, dogMockDescription: "Doggs", imageURL: "https://httpstatusdogs.com/img/100.jpg")).previewLayout(.sizeThatFits)
//    }
//}
