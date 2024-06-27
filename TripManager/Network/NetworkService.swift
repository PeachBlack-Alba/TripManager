//
//  NetworkService.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//


import Foundation

class NetworkService {
    static let shared = NetworkService()

    func fetchTrips(completion: @escaping (Result<[Trip], Error>) -> Void) {
        let url = URL(string: "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/trips.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print("JSON Response: \(json)")
                }
                var decodedTrips = try JSONDecoder().decode([Trip].self, from: data)
                for index in decodedTrips.indices {
                    decodedTrips[index].setId(index)
                }
                completion(.success(decodedTrips))
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func fetchStopInfo(completion: @escaping (Result<StopInfo, Error>) -> Void) {
        let url = URL(string: "https://sandbox-giravolta-static.s3.eu-west-1.amazonaws.com/tech-test/stops.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            do {
                let decodedStops = try JSONDecoder().decode(StopInfo.self, from: data)
                completion(.success(decodedStops))
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
