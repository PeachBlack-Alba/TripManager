//
//  TripListProtocols.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import SwiftUI

protocol TripListViewProtocol: AnyObject {
    var presenter: TripListPresenterProtocol? { get set }
    func showTrips(_ trips: [Trip])
    func showTripOnMap(_ trip: Trip)
    func updateStopInfo(_ stopInfo: StopInfo)
}

protocol TripListPresenterProtocol: AnyObject {
    var view: TripListViewProtocol? { get set }
    var interactor: TripListInteractorInputProtocol? { get set }
    var router: TripListRouterProtocol? { get set }
    func viewDidLoad()
    func didSelectTrip(_ trip: Trip)
    func didSelectStop(_ stopId: Int)
}

protocol TripListInteractorInputProtocol: AnyObject {
    var presenter: TripListInteractorOutputProtocol? { get set }
    func fetchTrips()
    func fetchStopInfo()
}

protocol TripListInteractorOutputProtocol: AnyObject {
    func didFetchTrips(_ trips: [Trip])
    func didFailToFetchTrips(error: Error)
    func didFetchStopInfo(_ stopInfo: StopInfo)
}

protocol TripListRouterProtocol: AnyObject {
    static func createTripListModule() -> AnyView
}


