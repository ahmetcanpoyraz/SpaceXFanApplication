//
//  ContentView.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 1.05.2022.
//

import SwiftUI
import Firebase

struct AuthView: View {
    
    
    let db = Firestore.firestore()
    @State var userEmail = ""
    @State var userPassword = ""
    @State var showAuthView = true
    
    
    var body: some View {
        
        NavigationView{
            
            if showAuthView{
                
           
        
        ZStack {
            
            
                        Image("loginBackground")
                .resizable()
            VStack(alignment: .center) {
                            Image("spaceXWhiteLogo")
                        
                            HStack {
                                Image("emailIcon").padding()
                                TextField("E-mail", text:$userEmail).foregroundColor(Color.white)
                            }.background(Color.gray).cornerRadius(15)
                                .padding()
                            
                            HStack {
                                Image("passwordIcon").padding()
                                TextField("Password", text:$userPassword).foregroundColor(Color.white)
                            }.background(Color.gray).cornerRadius(15)
                                .padding()
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Forgot Password").foregroundColor(.white)
                    }
                    Spacer()
                }.padding()
                
            
        
                
                HStack{
                    Button(action: {
                        
                        Auth.auth().signIn(withEmail: self.userEmail, password: self.userPassword){
                            (result,error) in
                            if error != nil {
                                print(error?.localizedDescription)
                            }else{
                               
                            }
                        }
                        
                    }){
                        Text("Login").foregroundColor(.white)
                    }.padding().frame(width: UIScreen.main.bounds.width * 0.5)
                   
                }.background(Color.gray).cornerRadius(35)
                    .padding()
                
                
                Text("Or").foregroundColor(.white)
                            
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Sign in with Apple").foregroundColor(.white)
                    }.padding().frame(width: UIScreen.main.bounds.width * 0.5)
                   
                }.background(Color.gray).cornerRadius(35)
                    .padding()
                            
                
                HStack{
                    Button(action: {
                        Auth.auth().createUser(withEmail: self.userEmail, password: self.userPassword){
                            (result,error) in if error != nil{
                                print(error?.localizedDescription)
                            }else{
                                
                                print("asdada")
                                var ref:DocumentReference? = nil
                                let myUserDictionary: [String : Any] = ["useremail" : self.userEmail,"useruidfromfirebase" : result!.user.uid]
                                ref = self.db.collection("Users").addDocument(data: myUserDictionary,completion: {(error)
                                    in if error != nil {
                                        
                                    }
                                })
                                
                                self.showAuthView = false
                            }
                        }
                    }){
                        Text("Sign Up").foregroundColor(.white)
                    }.padding().frame(width: UIScreen.main.bounds.width * 0.5)
                   
                }
                
                
                        
        }
    }.edgesIgnoringSafeArea(.all)
            }else{
                NavigationView{
                    Text("sada")
                }
              
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().previewDevice("iPhone 11")
    }
}
}

