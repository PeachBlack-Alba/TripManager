import Foundation
import Polyline
import CoreLocation

struct Trip: Codable {
    let id: Int?
    let driverName: String
    let startTime: String
    let endTime: String
    let status: String
    let description: String
    let route: String
    let origin: Location
    let destination: Location
    let stops: [Stop]

    var decodedCoordinates: [CLLocationCoordinate2D]? {
        return decodePolyline(route)
    }
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
