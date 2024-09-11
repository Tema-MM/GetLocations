//import SwiftUI
//import MapKit
//
//struct DetailView: View {
//    let landmark: Landmark
//    let userLocation: CLLocation?
//    @Binding var route: MKRoute?
//
//    @State private var travelTime: String = ""
//    @State private var distance: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text(landmark.name)
//                .font(.largeTitle)
//                .padding()
//
//            if let address = landmark.address {
//                Text("Address: \(address)")
//            }
//
//            if let phoneNumber = landmark.phoneNumber {
//                Text("Phone: \(phoneNumber)")
//            }
//
//            if let url = landmark.url {
//                Link("Website", destination: url)
//            }
//
//            if let category = landmark.category {
//                Text("Category: \(category)")
//            }
//
//            Text("Distance: \(distance)")
//            Text("Estimated travel time: \(travelTime)")
//
//            MKMapViewRepresentable(region: .constant(
//                MKCoordinateRegion(
//                    center: landmark.coordinate,
//                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                )
//            ), landmarks: [landmark], route: route)
//            .frame(height: 300)
//
//            Spacer()
//        }
//        .padding()
//        .onAppear {
//            calculateRoute()
//        }
//    }
//
//    private func calculateRoute() {
//        guard let userLocation = userLocation else { return }
//
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation.coordinate))
//        request.destination = MKMapItem(placemark: landmark.placemark)
//        request.transportType = .automobile
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let response = response, let route = response.routes.first else { return }
//
//            self.travelTime = String(format: "%.0f minutes", route.expectedTravelTime / 60)
//            self.distance = String(format: "%.1f km", route.distance / 1000)
//            self.route = route
//        }
//    }
//}
