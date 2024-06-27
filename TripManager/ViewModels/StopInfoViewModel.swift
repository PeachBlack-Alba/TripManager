////
////  StopInfoViewModel.swift
////  TripManager
////
////  Created by Alba Torres Rodriguez on 25.06.24.
////
//
//import Foundation
//
//
//class StopInfoViewModel: ObservableObject, StopInfoViewProtocol {
//    @Published var stop: StopInfo?
//    @Published var error: String?
//
//    var presenter: StopInfoPresenterProtocol?
//    var stopId: Int
//
//    init(presenter: StopInfoPresenterProtocol, stopId: Int) {
//        self.presenter = presenter
//        self.stopId = stopId
//    }
//
//    func onAppear() {
//        presenter?.fetchStopInfo(stopId: stopId)
//    }
//
//    func showStopInfo(_ stop: StopInfo) {
//        DispatchQueue.main.async {
//            self.stop = stop
//        }
//    }
//
//    func showError(_ error: String) {
//        DispatchQueue.main.async {
//            self.error = error
//        }
//    }
//}
