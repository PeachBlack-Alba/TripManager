//
//  MapViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//


import MapKit
import SwiftUI


class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.3851, longitude: 2.1734),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    @Published var polylines: [MKPolyline] = []
    @Published var annotations: [MKPointAnnotation] = []

    func updateRegion(for trip: Trip) {
        guard let coordinates = trip.decodedCoordinates else { return }
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        let rect = polyline.boundingMapRect
        let region = MKCoordinateRegion(rect)
        self.region = region
    }

    func updatePolyline(for trip: Trip) {
        guard let coordinates = trip.decodedCoordinates else { return }
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        polylines = [polyline]
        updateAnnotations(for: trip)
        updateRegion(for: trip)
    }

    func updateAnnotations(for trip: Trip) {
        var newAnnotations: [MKPointAnnotation] = []
        let originAnnotation = MKPointAnnotation()
        originAnnotation.coordinate = CLLocationCoordinate2D(latitude: trip.origin.point.latitude, longitude: trip.origin.point.longitude)
        originAnnotation.title = "Start: \(trip.origin.address)"
        newAnnotations.append(originAnnotation)

        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = CLLocationCoordinate2D(latitude: trip.destination.point.latitude, longitude: trip.destination.point.longitude)
        destinationAnnotation.title = "End: \(trip.destination.address)"
        newAnnotations.append(destinationAnnotation)

        for stop in trip.stops {
            guard let stopPoint = stop.point else { continue }
          //  let stopAnnotation = StopAnnotation(stop: stop)
            let stopAnnotation = MKPointAnnotation()
            stopAnnotation.coordinate = CLLocationCoordinate2D(latitude: stopPoint.latitude, longitude: stopPoint.longitude)
            stopAnnotation.title = "Stop \(stop.id ?? 0)"
            newAnnotations.append(stopAnnotation)
        }
        annotations = newAnnotations
    }
}

class StopAnnotation: MKPointAnnotation {
    var stop: StopInfo

    init(stop: StopInfo) {
        self.stop = stop
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: stop.point.latitude, longitude: stop.point.longitude)
        self.title = "Stop \(stop.id)"
    }
}


