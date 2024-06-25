//
//  StopInfoView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

struct StopInfoView: View {
    @ObservedObject var viewModel: StopInfoViewModel

    var body: some View {
        VStack {
            if let stop = viewModel.stop {
                Text("Passenger: \(stop.userName)")
                Text("Address: \(stop.address)")
                Text("Time: \(formattedDate(stop.stopTime))")
                Text("Paid: \(stop.paid ? "Yes" : "No")")
                Text("Price: \(stop.price)")
            } else if let error = viewModel.error {
                Text("Error: \(error)")
            }
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
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
