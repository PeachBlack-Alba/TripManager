//
//  TripManagerApp.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import SwiftUI

@main
struct TripManagerApp: App {
    init() {
        updateBadgeCount()
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
