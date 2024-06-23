//
//  MockNetworkService.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
@testable import TripManager

class MockNetworkService: NetworkService {
    var fetchTripsResult: Result<[Trip], Error>?

    override func fetchTrips(completion: @escaping (Result<[Trip], Error>) -> Void) {
        if let result = fetchTripsResult {
            completion(result)
        }
    }
}
