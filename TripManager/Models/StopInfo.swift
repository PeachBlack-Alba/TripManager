//
//  Stop.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//
// Stop.swift

import Foundation

struct StopInfo: Identifiable, Codable {
    var id: UUID = UUID()
    var price: Double
    var address: String
    var tripId: Int
    var paid: Bool
    var stopTime: String
    var userName: String
    var point: StopPoint

    enum CodingKeys: String, CodingKey {
        case price
        case address
        case tripId
        case paid
        case stopTime
        case userName
        case point
    }
}

struct StopPoint: Codable {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "_latitude"
        case longitude = "_longitude"
    }
}
