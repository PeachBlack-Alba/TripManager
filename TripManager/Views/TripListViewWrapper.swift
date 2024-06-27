//
//  TripListViewWrapper.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import SwiftUI
import MapKit


class TripListViewWrapper: TripListViewProtocol, ObservableObject {
    var presenter: TripListPresenterProtocol?

    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip?
    @Published var showContactForm = false
    @Published var selectedStopId: IdentifiableInt?

    var mapViewModel: MapViewModel

    init() {
        self.mapViewModel = MapViewModel()
    }

    var contentView: some View {
        TripListView(viewModel: self)
    }

    func showTrips(_ trips: [Trip]) {
        print("ViewModel: showTrips - \(trips.count) trips")
        DispatchQueue.main.async {
            self.trips = trips
            if let firstTrip = trips.first {
                self.mapViewModel.updateRegion(for: firstTrip)
            }
        }
    }

    func showTripOnMap(_ trip: Trip) {
        DispatchQueue.main.async {
            self.selectedTrip = trip
            self.mapViewModel.updateRegion(for: trip)
            self.mapViewModel.updatePolyline(for: trip)
        }
    }

    func updateStopInfo(_ stopInfo: StopInfo) {
        DispatchQueue.main.async {
            self.mapViewModel.updateStopInfo(stopInfo: stopInfo)

            if let selectedTrip = self.selectedTrip {
                self.mapViewModel.updatePolyline(for: selectedTrip)
            } else {
                print("selectedTrip is nil")
            }
        }
    }
}
