//
//  Trip.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation

struct Trip: Codable {
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

    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}

struct Stop: Codable {
    let id: Int?
    let point: Point?
}
