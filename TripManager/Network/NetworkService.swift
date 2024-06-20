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
                let trips = try JSONDecoder().decode([Trip].self, from: data)
                completion(.success(trips))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
