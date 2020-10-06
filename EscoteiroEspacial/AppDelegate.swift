//
//  AppDelegate.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
// swiftlint:disable line_length

import UIKit
import UserNotifications
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
   var apiT = ApiManager()
   let questionFile = RepositoryQuestion(filename: "question")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 2.0)
        
        apiT.planetsApi { (result) in
            switch result {
            case .success(let apiPlanets):
                self.questionFile.save(apiPlanets)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound]) {(granted, _ ) in
            if granted {
                print("User gave permissions for local notifications")
            }
        }

        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//        } catch {
//            print("AVAudioSessionCategoryPlayback not work")
//        }
//    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}
