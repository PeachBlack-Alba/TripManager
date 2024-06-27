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
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                //TODO: create a state for cancelled trips and change color
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
        
        
        private func createDetailView(for stopInfo: StopInfo) -> UIView {
            let detailView = UIStackView()
            detailView.axis = .vertical
            detailView.alignment = .leading
            
            let userNameLabel = UILabel()
            userNameLabel.text = "Passenger: \(stopInfo.userName)"
            detailView.addArrangedSubview(userNameLabel)
            
            let timeLabel = UILabel()
            timeLabel.text = "Time: \(stopInfo.stopTime)"
            detailView.addArrangedSubview(timeLabel)
            
            let addressLabel = UILabel()
            addressLabel.text = "Address: \(stopInfo.address)"
            detailView.addArrangedSubview(addressLabel)
            
            let paidLabel = UILabel()
            paidLabel.text = "Paid: \(stopInfo.paid ? "Yes" : "No")"
            detailView.addArrangedSubview(paidLabel)
            
            let priceLabel = UILabel()
            priceLabel.text = "Price: \(stopInfo.price)"
            detailView.addArrangedSubview(priceLabel)
            
            return detailView
        }
    }
}

