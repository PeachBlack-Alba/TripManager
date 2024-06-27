//
//  StopInfoProtocols.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 25.06.24.
//
//
//import Foundation
//import SwiftUI
//
//protocol StopInfoViewProtocol: AnyObject {
//    var presenter: StopInfoPresenterProtocol? { get set }
//    func showStopInfo(_ stop: StopInfo)
//    func showError(_ error: String)
//}
//
//protocol StopInfoPresenterProtocol: AnyObject {
//    var view: StopInfoViewProtocol? { get set }
//    var interactor: StopInfoInteractorInputProtocol? { get set }
//  //  var router: StopInfoRouterProtocol? { get set }
//    func fetchStopInfo(stopId: Int)
//}
//
//protocol StopInfoInteractorInputProtocol: AnyObject {
//    var presenter: StopInfoInteractorOutputProtocol? { get set }
//    func loadStopInfo(stopId: Int)
//}
//
//protocol StopInfoInteractorOutputProtocol: AnyObject {
//    func stopInfoFetched(_ stop: StopInfo)
//    func stopInfoFetchFailed(_ error: Error)
//}
//
//protocol StopInfoRouterProtocol: AnyObject {
//    static func createModule(stopId: Int) -> AnyView
//}
