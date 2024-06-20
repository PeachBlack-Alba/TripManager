//
//  TripListViewWrapper.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import SwiftUI

class TripListViewWrapper: TripListViewProtocol, ObservableObject {
    var presenter: TripListPresenterProtocol?

    @Published var trips: [Trip] = []

    var contentView: some View {
        TripListView(viewModel: self)
    }

    func showTrips(_ trips: [Trip]) {
        print("ViewModel: showTrips - \(trips.count) trips")
        DispatchQueue.main.async {
            self.trips = trips
        }
    }
}

struct TripListView: View {
    @ObservedObject var viewModel: TripListViewWrapper

    var body: some View {
        NavigationView {
            List(viewModel.trips, id: \.id) { trip in
                VStack(alignment: .leading) {
                    Text(trip.description)
                        .font(.headline)
                    Text("Driver: \(trip.driverName)")
                        .font(.subheadline)
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

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListRouter.createTripListModule()
    }
}
