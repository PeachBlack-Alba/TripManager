//
//  TripListViewWrapper.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import SwiftUI
import MapKit
import SwiftUI

class TripListViewWrapper: TripListViewProtocol, ObservableObject {
    var presenter: TripListPresenterProtocol?

    @Published var trips: [Trip] = []
    @Published var selectedTrip: Trip?

    var mapViewModel = MapViewModel()

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
}


struct TripListView: View {
    @ObservedObject var viewModel: TripListViewWrapper

    var body: some View {
        NavigationView {
            VStack {
                MapView(viewModel: viewModel.mapViewModel)
                    .frame(height: UIScreen.main.bounds.height / 2)

                List(viewModel.trips.indices, id: \.self) { index in
                    let trip = viewModel.trips[index]
                    VStack(alignment: .leading) {
                        Text(trip.description)
                            .font(.headline)
                        Text("Driver: \(trip.driverName)")
                            .font(.subheadline)
                        Text("Start: \(trip.startTime)")
                            .font(.caption)
                        Text("End: \(trip.endTime)")
                            .font(.caption)
                    }
                    .onTapGesture {
                        viewModel.presenter?.didSelectTrip(trip)
                    }
                }
                .navigationBarTitle("Trips")
                .onAppear {
                    print("View: onAppear")
                    viewModel.presenter?.viewDidLoad()
                }
            }
        }
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListRouter.createTripListModule()
    }
}
