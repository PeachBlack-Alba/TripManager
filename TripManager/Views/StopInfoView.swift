//
//  StopInfoView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation
import SwiftUI


struct StopInfoView: View {
    @ObservedObject var viewModel: MapViewModel

    var body: some View {
        VStack {
            if let stopInfo = viewModel.stopInfo {
                Text("Passenger: \(stopInfo.userName)")
                Text("Address: \(stopInfo.address)")
                Text("Time: \(formattedDate(stopInfo.stopTime))")
                Text("Paid: \(stopInfo.paid ? "Yes" : "No")")
                Text("Price: \(stopInfo.price)")
            } else if let error = viewModel.error {
                Text("Error: \(error)")
            }
        }
        .padding()
    }

    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = formatter.date(from: dateString) {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return dateString
    }
}
