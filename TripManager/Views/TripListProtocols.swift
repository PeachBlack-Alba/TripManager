//
//  TripListProtocols.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//

import Foundation
import UIKit 

protocol TripListViewProtocol: AnyObject {
    var presenter: TripListPresenterProtocol? { get set }
    func showTrips(_ trips: [Trip])
}

protocol TripListPresenterProtocol: AnyObject {
    var view: TripListViewProtocol? { get set }
    var interactor: TripListInteractorInputProtocol? { get set }
    var router: TripListRouterProtocol? { get set }
    func viewDidLoad()
}

protocol TripListInteractorInputProtocol: AnyObject {
    var presenter: TripListInteractorOutputProtocol? { get set }
    func fetchTrips()
}

protocol TripListInteractorOutputProtocol: AnyObject {
    func didFetchTrips(_ trips: [Trip])
    func didFailToFetchTrips(error: Error)
}

protocol TripListRouterProtocol: AnyObject {
    static func createTripListModule() -> UIViewController
}