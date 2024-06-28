TripManager
===========

TripManager is an iOS application that allows users to see the trips for a bus on demand solution. This tool will be used by the operators of the service in order to see the trips available in the system. 

Table of Contents
-----------------

-   [Features](#features)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Project Structure](#project-structure)
-   [Dependencies](#dependencies)
-   [License](#license)

Features
--------

-   Display a list of trips with details such as driver name, start time, end time, and status.
-   Show trip routes on a map.
-   Display annotations for trip stops on the map.
-   Show detailed stop information, including passenger name and price.

Installation
------------

To install and run this project locally, follow these steps:

1.  **Clone the repository:**

    
    `git clone https://github.com/yourusername/TripManager.git
    cd TripManager`

2.  **Open the project:** Open `TripManager.xcodeproj` or `TripManager.xcworkspace` in Xcode.

3.  **Install dependencies:** Ensure you have Cocoapods installed, then run:


    `pod install`

4.  **Build and run the project:** Select the target device or simulator and press `Cmd + R` to build and run the project.

Usage
-----

1.  **View Trips:**

    -   Open the app to see a list of trips.
    -   Tap on a trip to view the route and stops on the map.
2.  **View Stop Information:**

    -   Tap on a stop annotation on the map to view detailed information about the stop.
    -   Detailed information includes passenger name and price.

Project Structure
-----------------

The project is structured as follows:

-   **Models:**

    -   `Trip.swift`: Defines the `Trip`, `Location`, `Point`, and `Stop` models.
    -   `StopInfo.swift`: Defines the `StopInfo` model.
-   **ViewModels:**

    -   `MapViewModel.swift`: Manages the map view, including fetching stop information and updating annotations.
-   **Views:**

    -   `MapView.swift`: A SwiftUI view for displaying the map and annotations.
    -   `TripListView.swift`: A SwiftUI view for displaying the list of trips.
-   **Networking:**

    -   `NetworkService.swift`: Handles fetching trip and stop information from the provided endpoints.
-   **Interactors:**

    -   `StopInfoInteractor.swift`: Handles the business logic for fetching stop information.
-   **Presenters:**

    -   `TripListPresenter.swift`: Handles the presentation logic for the trip list view.
-   **Protocols:**

    -   `StopInfoProtocols.swift`: Defines protocols for the stop information interactor and presenter.

Dependencies
------------

-   **MapKit**: Used for displaying maps and annotations.
-   **SwiftUI**: Used for building the user interface.

License
-------

This project is licensed under the MIT License. See the LICENSE file for details.
