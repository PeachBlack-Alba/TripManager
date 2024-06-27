////
////  AppDelegate.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 24.06.24.
////
//
//import Foundation
//import SwiftUI
//import UserNotifications
//
//class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        updateBadge()
//    }
//
//    private func updateBadge() {
//            do {
//                let reports = try LocalStorage.shared.loadForms()
//                UIApplication.shared.applicationIconBadgeNumber = reports.count
//            } catch {
//                print("Error updating badge: \(error)")
//            }
//        }
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
//            if granted {
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//            }
//        }
//        UNUserNotificationCenter.current().delegate = self
//        return true
//    }
//}
