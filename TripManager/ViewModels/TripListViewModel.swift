//
//  TripListViewModel.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation

class TripListViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip?
    var mapViewModel: MapViewModel

    var presenter: TripListPresenterProtocol?

    init(mapViewModel: MapViewModel) {
        self.mapViewModel = mapViewModel
    }
}
