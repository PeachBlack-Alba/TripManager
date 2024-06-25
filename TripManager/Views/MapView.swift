//
//  MapView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 20.06.24.
//
import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel
    @Binding var selectedStopId: IdentifiableInt?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(viewModel.region, animated: true)

        uiView.removeOverlays(uiView.overlays)
        uiView.addOverlays(viewModel.polylines)

        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(viewModel.annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, selectedStopId: $selectedStopId)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        @Binding var selectedStopId: IdentifiableInt?

        init(_ parent: MapView, selectedStopId: Binding<IdentifiableInt?>) {
            self.parent = parent
            self._selectedStopId = selectedStopId
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "stop"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }

            if let stopAnnotation = annotation as? StopAnnotation {
                annotationView?.detailCalloutAccessoryView = createDetailView(for: stopAnnotation.stop)
            }

            return annotationView
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation as? StopAnnotation {
                selectedStopId = IdentifiableInt(value: annotation.stop.tripId)
            }
        }

        private func createDetailView(for stop: StopInfo) -> UIView {
            let detailView = UIStackView()
            detailView.axis = .vertical
            detailView.alignment = .leading

            let userNameLabel = UILabel()
            userNameLabel.text = "Passenger: \(stop.userName)"
            detailView.addArrangedSubview(userNameLabel)

            let timeLabel = UILabel()
            timeLabel.text = "Time: \(stop.stopTime)"
            detailView.addArrangedSubview(timeLabel)

            let addressLabel = UILabel()
            addressLabel.text = "Address: \(stop.address)"
            detailView.addArrangedSubview(addressLabel)

            let paidLabel = UILabel()
            paidLabel.text = "Paid: \(stop.paid ? "Yes" : "No")"
            detailView.addArrangedSubview(paidLabel)

            let priceLabel = UILabel()
            priceLabel.text = "Price: \(stop.price)"
            detailView.addArrangedSubview(priceLabel)

            return detailView
        }
    }
}

