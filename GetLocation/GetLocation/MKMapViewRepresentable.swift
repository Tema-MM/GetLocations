//import SwiftUI
//import MapKit

//struct MKMapViewRepresentable: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//    var landmarks: [Landmark]
//    var route: MKRoute?
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MKMapViewRepresentable
//
//        init(parent: MKMapViewRepresentable) {
//            self.parent = parent
//        }
//
//        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
//            parent.region = mapView.region
//        }
//
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            if let polyline = overlay as? MKPolyline {
//                let renderer = MKPolylineRenderer(polyline: polyline)
//                renderer.strokeColor = .blue
//                renderer.lineWidth = 4
//                return renderer
//            }
//            return MKOverlayRenderer(overlay: overlay)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        mapView.showsUserLocation = true
//        mapView.setRegion(region, animated: true)
//        return mapView
//    }
//
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//        mapView.setRegion(region, animated: true)
//        mapView.removeAnnotations(mapView.annotations)
//        let annotations = landmarks.map { landmark -> MKPointAnnotation in
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = landmark.coordinate
//            annotation.title = landmark.name
//            return annotation
//        }
//        mapView.addAnnotations(annotations)
//
//        if let route = route {
//            mapView.removeOverlays(mapView.overlays)
//            mapView.addOverlay(route.polyline)
//        }
//    }
//}

import SwiftUI
import MapKit

struct MKMapViewRepresentable: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var landmarks: [Landmark]
    var route: MKRoute?
    var onAnnotationSelected: ((Landmark) -> Void)?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations) // Clear existing annotations

        // Create annotations from landmarks
        let annotations = landmarks.map { landmark in
            let annotation = MKPointAnnotation()
            annotation.coordinate = landmark.coordinate
            annotation.title = landmark.name
            return annotation
        }
        uiView.addAnnotations(annotations)

        if let route = route {
            uiView.addOverlay(route.polyline)
        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MKMapViewRepresentable

        init(_ parent: MKMapViewRepresentable) {
            self.parent = parent
        }

        // When an annotation is selected, find the corresponding Landmark
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? MKPointAnnotation {
                if let selectedLandmark = parent.landmarks.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }) {
                    parent.onAnnotationSelected?(selectedLandmark)
                }
            }
        }

        // Adding the overlay (route) on the map
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let routePolyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(overlay: routePolyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
