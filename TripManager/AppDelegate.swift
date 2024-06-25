//
//  AppDelegate.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 24.06.24.
//

import Foundation
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidBecomeActive(_ application: UIApplication) {
        updateBadgeCount()
    }

    private func updateBadgeCount() {
        do {
            let forms = try LocalStorage.shared.loadForms()
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = forms.count
            }
        } catch {
            DispatchQueue.main.async {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
    }
}
