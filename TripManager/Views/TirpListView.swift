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
    @State private var showContactForm = false
    @State private var formCount = 0
    @State private var showAlert = false

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
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        print("Contact form button tapped")
                        self.showContactForm = true
                    }) {
                        Image(systemName: "exclamationmark.bubble")
                    }
                    BadgeView(count: formCount)
                })
                .onAppear {
                    print("View: onAppear")
                    viewModel.presenter?.viewDidLoad()
                    updateBadgeCount()
                }
                .sheet(isPresented: $showContactForm, onDismiss: {
                    updateBadgeCount()
                }) {
                    ContactFormRouter.createContactFormModule(isPresented: $showContactForm, onSave: {
                        showAlert = true
                        updateBadgeCount()
                    })
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Form Saved"),
                message: Text("Your form has been saved successfully."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func updateBadgeCount() {
        do {
            let forms = try LocalStorage.shared.loadForms()
            formCount = forms.count
            UIApplication.shared.applicationIconBadgeNumber = forms.count
        } catch {
            formCount = 0
            UIApplication.shared.applicationIconBadgeNumber = 0
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
