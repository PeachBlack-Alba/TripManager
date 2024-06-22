import XCTest
@testable import TripManager

class TripListViewModelTests: XCTestCase {
    var viewModel: TripListViewWrapper!
    var mockPresenter: MockTripListPresenter!

    override func setUp() {
        super.setUp()
        viewModel = TripListViewWrapper()
        mockPresenter = MockTripListPresenter()

        viewModel.presenter = mockPresenter
    }

    override func tearDown() {
        viewModel = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testShowTrips() {
        let trips = [Trip(driverName: "John Doe", startTime: "2022-01-01T00:00:00.000Z", endTime: "2022-01-01T01:00:00.000Z", status: "ongoing", description: "Test Trip", route: "test_route", origin: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), destination: Location(address: "Test Address", point: Point(latitude: 0.0, longitude: 0.0)), stops: [])]

        let expectation = XCTestExpectation(description: "Trips are shown")

        viewModel.showTrips(trips)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(self.viewModel.trips.count, 1, "Expected trips count to be 1")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
