//
//  RegisterView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 9.05.2022.
//

import SwiftUI





struct RegisterView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
        @State private var selectedColor = "Red"
    @Environment(\.dismiss) var dismiss
    @State var step: Int? = 1
    @State var userName = ""
    @State var userEmail = ""
    @State var userPassword = ""
    @State var userPhone = ""
    @State var showingModal = false
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
                Image("spaceXIOsBg")
                                .resizable()
                            .aspectRatio(contentMode: .fill)
                            
                            .edgesIgnoringSafeArea(.all)
               
                
                VStack(alignment: .leading){
                    HStack(spacing: 0){
                        if(step == 1){
                            CircleView(label: "1",borderColor: Color.green)
                            ExDivider()
                            CircleView(label: "2",borderColor: Color.gray)
                            ExDivider()
                            CircleView(label: "3",borderColor: Color.gray)
                            ExDivider()
                            CircleView(label: "4",borderColor: Color.gray)
                        }
                       
                        
                    }.padding(50)
                    
                    HStack {
                        Image("emailIcon").padding()
                        TextField("Enter Your Name", text:$userName).foregroundColor(Color.white)
                    }.background(Color.gray).cornerRadius(15)
                        .padding()
                    HStack {
                        Image("emailIcon").padding()
                        TextField("Enter Your E-mail", text:$userEmail).foregroundColor(Color.white)
                    }.background(Color.gray).cornerRadius(15)
                        .padding()
                    
                    HStack {
                        Image("passwordIcon").padding()
                        TextField("Enter Your Password", text:$userPassword).foregroundColor(Color.white)
                    }.background(Color.gray).cornerRadius(15)
                        .padding()
                    
                    HStack {
                        Image("passwordIcon").padding()
                        TextField("Enter Your Phone", text:$userPhone).foregroundColor(Color.white)
                    }.background(Color.gray).cornerRadius(15)
                        .padding()
                    
                    Button(action: {
                                        self.showingModal = true
                                    }) {
                                        Text("Show popup")
                                    }
                    
                    
                    
        }
                
                if $showingModal.wrappedValue {
                                // But it will not show unless this variable is true
                                
                                    Color.black.opacity(0.9)
                                        .edgesIgnoringSafeArea(.vertical)
                                    
                                    // This VStack is the popup
                                    VStack(spacing: 20) {
                                        Text("Popup")
                                            .bold().padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.orange)
                                            .foregroundColor(Color.white)
                                        Spacer()
                                        VStack {
                                                    Picker("Please choose a color", selection: $selectedColor) {
                                                        ForEach(colors, id: \.self) {
                                                            Text($0)
                                                        }
                                                    }.pickerStyle(WheelPickerStyle())
                                                    Text("You selected: \(selectedColor)")
                                                }
                                        HStack{
                                            Button(action: {
                                                self.showingModal = false
                                            }) {
                                                Text("Cancel")
                                            }.padding()
                                            Button(action: {
                                                self.showingModal = false
                                            }) {
                                                Text("Save")
                                            }.padding()
                                        }
                                        
                                    }
                                    .frame(width: 300, height: 400,alignment: .center)
                                    .background(Color.white)
                    .cornerRadius(20).shadow(radius: 20).padding(.top, 200)}
                
               }
            
           
        }.navigationBarItems(
                leading:
                    Text("Sign Up").foregroundColor(.white).font(.title),
                trailing:
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.white))
                
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
struct ExDivider: View {
    var color: Color = .gray
    var width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
struct CircleView: View {
   
    @State var label: String
    @State var borderColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(borderColor,lineWidth: 2)
                .foregroundColor(Color.black.opacity(0.0))
                .frame(width: 50, height: 50)
            Text(label).foregroundColor(borderColor)
        }
    }
}
