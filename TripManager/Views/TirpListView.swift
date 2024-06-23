////
////  TirpListView.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 23.06.24.
////
//
//import Foundation
//import SwiftUI
//import MapKit
//
//struct TripListView: View {
//    @ObservedObject var viewModel: TripListViewWrapper
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                MapView(viewModel: viewModel.mapViewModel)
//                    .frame(height: UIScreen.main.bounds.height / 2)
//
//                List(viewModel.trips.indices, id: \.self) { index in
//                    let trip = viewModel.trips[index]
//                    VStack(alignment: .leading) {
//                        Text(trip.description)
//                            .font(.headline)
//                        Text("Driver: \(trip.driverName)")
//                            .font(.subheadline)
//                        Text("Start: \(trip.startTime)")
//                            .font(.caption)
//                        Text("End: \(trip.endTime)")
//                            .font(.caption)
//                    }
//                    .onTapGesture {
//                        viewModel.presenter?.didSelectTrip(trip)
//                    }
//                }
//                .navigationBarTitle("Trips")
//                .onAppear {
//                    print("View: onAppear")
//                    viewModel.presenter?.viewDidLoad()
//                }
//            }
//        }
//    }
//}
//
//struct TripListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TripListRouter.createTripListModule()
//    }
//}
