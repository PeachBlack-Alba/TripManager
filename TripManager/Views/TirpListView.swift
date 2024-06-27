//
//  TirpListView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation
import SwiftUI
import MapKit

struct TripListView: View {
    @ObservedObject var viewModel: TripListViewWrapper
    @State private var selectedStopId: IdentifiableInt?

    var body: some View {
        NavigationView {
            VStack {
                MapView(viewModel: viewModel.mapViewModel)
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .onTapGesture {
                        selectedStopId = nil
                    }

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
                    .padding()
                    .background(viewModel.selectedTrip?.id == trip.id ? Color.blue.opacity(0.3) : Color.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        viewModel.presenter?.didSelectTrip(trip)
                    }
                }
                .navigationBarTitle("Trips")
                .navigationBarItems(trailing: Button(action: {
                    viewModel.showContactForm = true
                }) {
                    Image(systemName: "exclamationmark.bubble")
                })
                .onAppear {
                    print("View: onAppear")
                    viewModel.presenter?.viewDidLoad()
                }
                .sheet(isPresented: $viewModel.showContactForm) {
                    ContactFormRouter.createContactFormModule(isPresented: $viewModel.showContactForm)
                }
            }
        }
    }
}

extension TripListView {
    private func showStopInfo(stopId: Int) {
        selectedStopId = IdentifiableInt(value: stopId)
    }
}

struct IdentifiableInt: Identifiable {
    let id = UUID()
    let value: Int
}
