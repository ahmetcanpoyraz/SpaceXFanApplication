//
//  SpaceXFanApplicationApp.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 1.05.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

@main
struct SpaceXFanApplicationApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
    }
  }
}
