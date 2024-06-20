//
//  MapView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel

    var body: some View {
        Map(coordinateRegion: $viewModel.region)
            .edgesIgnoringSafeArea(.all)
    }
}
