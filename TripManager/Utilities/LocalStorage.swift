//
//  LocalStorage.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 23.06.24.
//

import Foundation

class LocalStorage {
    static let shared = LocalStorage()

    private let formsKey = "savedForms"

    func saveForm(_ form: ContactForm) throws {
        var forms = try loadForms()
        forms.append(form)
        let data = try JSONEncoder().encode(forms)
        UserDefaults.standard.set(data, forKey: formsKey)
    }

    func loadForms() throws -> [ContactForm] {
        guard let data = UserDefaults.standard.data(forKey: formsKey) else {
            return []
        }
        return try JSONDecoder().decode([ContactForm].self, from: data)
    }
}
