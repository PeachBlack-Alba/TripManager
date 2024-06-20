//
//  MapViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import MapKit
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.3851, longitude: 2.1734),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    func updateRegion(for trip: Trip) {
        guard let firstStop = trip.stops.first?.point else { return }
        let center = CLLocationCoordinate2D(latitude: firstStop.latitude, longitude: firstStop.longitude)
        region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
}
