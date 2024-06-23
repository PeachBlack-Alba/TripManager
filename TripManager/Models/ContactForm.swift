//
//  ContactForm.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation

struct ContactForm: Codable, Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var email: String
    var phone: String
    var reportDate: Date
    var description: String
}
