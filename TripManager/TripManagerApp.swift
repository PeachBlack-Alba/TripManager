//
//  TripManagerApp.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import SwiftUI


import SwiftUI
import UserNotifications

@main
struct TripManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        updateBadgeCount()
        // LocalStorage.shared.clearOldData()
    }

    var body: some Scene {
        WindowGroup {
            TripListRouter.createTripListModule()
        }
    }

    private func updateBadgeCount() {
        do {
            let forms = try LocalStorage.shared.loadForms()
            UIApplication.shared.applicationIconBadgeNumber = forms.count
        } catch {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    self.checkNotificationSettings()
                }
            }
        }
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    private func checkNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                if settings.badgeSetting == .enabled {
                    print("Badge permissions are enabled.")
                } else {
                    print("Badge permissions are not enabled.")
                }
            case .denied, .notDetermined:
                print("Notification permissions are not granted.")
            @unknown default:
                break
            }
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        updateBadgeCount()
    }

    private func updateBadgeCount() {
        do {
            let forms = try LocalStorage.shared.loadForms()
            UIApplication.shared.applicationIconBadgeNumber = forms.count
        } catch {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}
