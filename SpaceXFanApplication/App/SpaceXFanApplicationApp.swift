//
//  SpaceXFanApplicationApp.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import SwiftUI
import FirebaseCore
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    //Simulator DeviceCheck'i desteklemiyor bu yüzden geliştirme sırasında App Check'in doğrulama işlemlerini devre dışı bırakıldı.
    #if DEBUG
    AppCheck.setAppCheckProviderFactory(AppCheckDebugProviderFactory())
    #endif

    return true
  }
}

@main
struct SpaceXFanApplicationApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
          
                LoginView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .environment(\.colorScheme, .dark)
                
        }
    }
}
