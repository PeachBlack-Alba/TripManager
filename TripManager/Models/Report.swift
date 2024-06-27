//
//  ContactForm.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//
import Foundation

struct Report: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var surname: String
    var email: String
    var phone: String?
    var details: String
    var date: Date
}
