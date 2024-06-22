//
//  MockTripListRouter.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import SwiftUI
@testable import TripManager

class MockTripListRouter: TripListRouterProtocol {
    static func createTripListModule() -> AnyView {
        return AnyView(Text("Mock View"))
    }
}
