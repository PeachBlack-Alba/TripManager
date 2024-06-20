//
//  Trip.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation

struct Trip: Codable {
    let id: Int
    let driverName: String
    let startTime: String
    let endTime: String
    let status: String
    let description: String
    let route: String
    let origin: Location
    let destination: Location
    let stops: [Stop]
}

struct Location: Codable {
    let address: String
    let point: Point
}

struct Point: Codable {
    let latitude: Double
    let longitude: Double
}

struct Stop: Codable {
    let id: Int
    let point: Point
}
