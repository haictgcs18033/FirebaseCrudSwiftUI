//
//  FirebaseCrudApp.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/06.
//

import SwiftUI
import FirebaseCore
class AppDelegate : NSObject , UIApplicationDelegate {
  func application ( _ application : UIApplication ,
                   didFinishLaunchingWithOptions launchOptions : [ UIApplication . LaunchOptionsKey : Any ]? = nil ) -> Bool {
    FirebaseApp.configure ( )

    return true
  }
}
@main
struct FirebaseCrudApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:UserClass.self)
    }
}
