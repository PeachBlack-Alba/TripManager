//
//  ContactFormViewModelTests.swift
//  TripManagerTests
//
//  Created by Alba Torres Rodriguez on 27.06.24.
//

import Foundation
import XCTest
import Combine
@testable import TripManager

class ContactFormViewModelTests: XCTestCase {
    var viewModel: ContactFormViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = ContactFormViewModel(onSave: {})
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testValidateForm() {
        viewModel.name = "John"
        viewModel.surname = "Doe"
        viewModel.email = "john.doe@example.com"
        viewModel.details = "Some details"

        XCTAssertFalse(viewModel.saveDisabled, "Form should be valid")
    }

    func testSaveForm() {
        let expectation = XCTestExpectation(description: "Form saved")

        viewModel = ContactFormViewModel {
            expectation.fulfill()
        }

        viewModel.name = "John"
        viewModel.surname = "Doe"
        viewModel.email = "john.doe@example.com"
        viewModel.details = "Some details"
        viewModel.save()

        wait(for: [expectation], timeout: 1.0)
    }
}
