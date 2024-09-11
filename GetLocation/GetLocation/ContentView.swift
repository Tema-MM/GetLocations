//import SwiftUI
//import MapKit
//
//// 26.0910, longitude: 28.0855
//
//struct ContentView: View {
//    @StateObject private var locationManager = LocationManager()
//    @State private var region: MKCoordinateRegion
//    @State private var searchText = ""
//    @State private var landmarks: [Landmark] = []
//    @State private var suggestions: [Landmark] = []
//    @State private var route: MKRoute?
//    
//    init() {
//        _region = State(initialValue: MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: 26.0910, longitude: 28.0855),
//                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                ))
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                MKMapViewRepresentable(region: $region, landmarks: landmarks, route: route)
//                    .onChange(of: locationManager.location) { location in
//                        guard let location = location else { return }
//                        region.center = location.coordinate
//                    }
//                    .edgesIgnoringSafeArea(.all)
//                    .overlay(
//                        VStack {
//                            List {
//                                ForEach(suggestions) { suggestion in
//                                    NavigationLink(
//                                        destination: DetailView(landmark: suggestion, userLocation: locationManager.location, route: $route)
//                                    ) {
//                                        Text(suggestion.name)
//                                    }
//                                }
//                            }
//                            .background(Color.white)
//                            .opacity(searchText.isEmpty ? 0 : 1)
//                            .animation(.easeIn, value: searchText.isEmpty)
//                        }
//                    )
//                HStack{
//                    Button(action: {
//                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 0.8, longitudeDelta: region.span.longitudeDelta * 0.8)
//                            region.span = span
//                    }) {
//                        Image(systemName: "plus.circle")
//                    }
//                    
//                    Button(action: {
//                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta / 0.8, longitudeDelta: region.span.longitudeDelta / 0.8)
//                            region.span = span
//                    }) {
//                        Image(systemName: "minus.circle")
//                    }
//                }
//            }
//            .navigationTitle("Map Search")
//            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
//            .onChange(of: searchText) { newValue in
//                performSearch(query: newValue)
//            }
//        }
//    }
//
//    private func performSearch(query: String) {
//        guard !query.isEmpty else {
//            suggestions = []
//            return
//        }
//
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = query
//        request.region = region
//
//        let search = MKLocalSearch(request: request)
//        search.start { response, error in
//            guard let response = response else { return }
//
//            let mapItems = response.mapItems
//            self.landmarks = mapItems.map { Landmark(placemark: $0.placemark) }
//            self.suggestions = mapItems.map { Landmark(placemark: $0.placemark) }
//        }
//    }
//}
//

import SwiftUI
import MapKit

//struct ContentView: View {
//    @StateObject private var locationManager = LocationManager()
//    @State private var region: MKCoordinateRegion
//    @State private var searchText = ""
//    @State private var landmarks: [Landmark] = []
//    @State private var suggestions: [Landmark] = []
//    @State private var route: MKRoute?
//    @State private var shouldRecenter = false
//    @State private var selectedCategory: String? = nil
//    @State private var selectedLandmark: Landmark?
//    
//    let categories = ["Doctors", "Hospitals", "Pharmacies", "Clinics"]
//
//    init() {
//        _region = State(initialValue: MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 26.0910, longitude: 28.0855),
//            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//        ))
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(categories, id: \.self) { category in
//                            Button(action: {
//                                selectedCategory = category
//                                performSearch(query: searchText)
//                            }) {
//                                Text(category)
//                                    .padding()
//                                    .background(selectedCategory == category ? Color.blue : Color.gray)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                .background(Color.white)
//
//                MKMapViewRepresentable(region: $region, landmarks: landmarks, route: route, onAnnotationSelected: { landmark in
//                    selectedLandmark = landmark
//                })
//                .onAppear {
//                    if let location = locationManager.location {
//                        region.center = location.coordinate
//                    }
//                }
//                .edgesIgnoringSafeArea(.all)
//                .overlay(
//                    VStack {
//                        List {
//                            ForEach(suggestions) { suggestion in
//                                NavigationLink(
//                                    destination: DetailView(landmark: suggestion, userLocation: locationManager.location, route: $route)
//                                ) {
//                                    Text(suggestion.name)
//                                }
//                            }
//                        }
//                        .background(Color.white)
//                        .opacity(searchText.isEmpty ? 0 : 1)
//                        .animation(.easeIn, value: searchText.isEmpty)
//                    }
//                )
//
//                HStack {
//                    Button(action: {
//                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 0.8, longitudeDelta: region.span.longitudeDelta * 0.8)
//                        region.span = span
//                    }) {
//                        Image(systemName: "plus.circle")
//                    }
//
//                    Button(action: {
//                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta / 0.8, longitudeDelta: region.span.longitudeDelta / 0.8)
//                        region.span = span
//                    }) {
//                        Image(systemName: "minus.circle")
//                    }
//
//                    Spacer()
//
//                    Button(action: {
//                        guard let location = locationManager.location else { return }
//                        region.center = location.coordinate
//                        shouldRecenter = false
//                    }) {
//                        Image(systemName: "location.fill")
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Map Search")
//            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
//            .onChange(of: searchText) { newValue in
//                performSearch(query: newValue)
//            }
//            .onChange(of: locationManager.location) { location in
//                guard let location = location else { return }
//                if shouldRecenter {
//                    region.center = location.coordinate
//                    shouldRecenter = false
//                }
//            }
//            .sheet(item: $selectedLandmark) { landmark in
//                LandmarkDetailView(landmark: landmark)
//            }
//        }
//    }
//
//    private func performSearch(query: String) {
//        var searchQuery = query
//        if let category = selectedCategory, !category.isEmpty {
//            searchQuery = "\(category) \(query)"
//        }
//
//        guard !searchQuery.isEmpty else {
//            suggestions = []
//            landmarks = []
//            return
//        }
//
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = searchQuery
//        request.region = region
//
//        let search = MKLocalSearch(request: request)
//        search.start { response, error in
//            guard let response = response else { return }
//
//            let mapItems = response.mapItems
//            self.landmarks = mapItems.map { Landmark(placemark: $0.placemark) }
//            self.suggestions = mapItems.map { Landmark(placemark: $0.placemark) }
//        }
//    }
//}


struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var region: MKCoordinateRegion
    @State private var searchText = ""
    @State private var landmarks: [Landmark] = []
    @State private var suggestions: [Landmark] = []
    @State private var route: MKRoute?
    @State private var shouldRecenter = false
    @State private var selectedCategory: String? = nil
    @State private var selectedLandmark: Landmark?
    
    let categories = ["Doctors", "Hospitals", "Pharmacies", "Clinics"]

    init() {
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 26.0910, longitude: 28.0855),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        NavigationView {
            VStack {
                // Category selection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                                performSearch(query: searchText)
                            }) {
                                Text(category)
                                    .padding()
                                    .background(selectedCategory == category ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                .background(Color.white)

                // Map View
                MKMapViewRepresentable(
                    region: $region,
                    landmarks: landmarks,
                    route: route,
                    onAnnotationSelected: { landmark in
                        selectedLandmark = landmark
                    }
                )
                .onAppear {
                    if let location = locationManager.location {
                        region.center = location.coordinate
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack {
                        List {
                            ForEach(suggestions) { suggestion in
                                NavigationLink(
                                    destination: DetailView(
                                        landmark: suggestion,
                                        userLocation: locationManager.location,
                                        route: $route
                                    )
                                ) {
                                    Text(suggestion.name)
                                }
                            }
                        }
                        .background(Color.white)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .animation(.easeIn, value: searchText.isEmpty)
                    }
                )

                // Zoom and Recenter Controls
                HStack {
                    Button(action: {
                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 0.8, longitudeDelta: region.span.longitudeDelta * 0.8)
                        region.span = span
                    }) {
                        Image(systemName: "plus.circle")
                    }

                    Button(action: {
                        let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta / 0.8, longitudeDelta: region.span.longitudeDelta / 0.8)
                        region.span = span
                    }) {
                        Image(systemName: "minus.circle")
                    }

                    Spacer()

                    Button(action: {
                        guard let location = locationManager.location else { return }
                        region.center = location.coordinate
                        shouldRecenter = false
                    }) {
                        Image(systemName: "location.fill")
                    }
                }
                .padding()
            }
            .navigationTitle("Map Search")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) { newValue in
                performSearch(query: newValue)
            }
            .onChange(of: locationManager.location) { location in
                guard let location = location else { return }
                if shouldRecenter {
                    region.center = location.coordinate
                    shouldRecenter = false
                }
            }
            .sheet(item: $selectedLandmark) { landmark in
                DetailView(
                    landmark: landmark,
                    userLocation: locationManager.location,
                    route: $route
                )
            }
        }
    }

    private func performSearch(query: String) {
        var searchQuery = query
        if let category = selectedCategory, !category.isEmpty {
            searchQuery = "\(category) \(query)"
        }

        guard !searchQuery.isEmpty else {
            suggestions = []
            landmarks = []
            return
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        request.region = region

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else { return }

            let mapItems = response.mapItems
            self.landmarks = mapItems.map { Landmark(mapItem: $0) }
            self.suggestions = mapItems.map { Landmark(mapItem: $0) }
        }
    }


}

struct LandmarkDetailView: View {
    let landmark: Landmark

    var body: some View {
        VStack {
            Text(landmark.name)
                .font(.headline)
                .padding()

            Text("Coordinates: \(landmark.coordinate.latitude), \(landmark.coordinate.longitude)")
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct Landmark: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem

    var name: String {
        mapItem.name ?? "Unknown"
    }

    var coordinate: CLLocationCoordinate2D {
        mapItem.placemark.coordinate
    }

    var address: String {
        let addressLines = [
            mapItem.placemark.subThoroughfare,
            mapItem.placemark.thoroughfare,
            mapItem.placemark.locality,
            mapItem.placemark.administrativeArea,
            mapItem.placemark.postalCode
        ].compactMap { $0 }
        return addressLines.joined(separator: ", ")
    }

    var phoneNumber: String? {
        mapItem.phoneNumber
    }

    var url: URL? {
        mapItem.url
    }
    
    var category: String? {
        mapItem.pointOfInterestCategory?.rawValue
    }
}



struct DetailView: View {
    let landmark: Landmark
    let userLocation: CLLocation?
    @Binding var route: MKRoute?

    @State private var travelTime: String = ""
    @State private var distance: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(landmark.name)
                .font(.largeTitle)
                .padding()

            Text("Address: \(landmark.address)")
            
            if let phoneNumber = landmark.phoneNumber {
                Text("Phone: \(phoneNumber)")
            }

            if let url = landmark.url {
                Link("Website", destination: url)
            }

            if let category = landmark.category {
                Text("Category: \(category)")
            }

            Text("Distance: \(distance)")
            Text("Estimated travel time: \(travelTime)")

            MKMapViewRepresentable(region: .constant(
                MKCoordinateRegion(
                    center: landmark.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            ), landmarks: [landmark], route: route)
            .frame(height: 300)

            Spacer()
        }
        .padding()
        .onAppear {
            calculateRoute()
        }
    }

    private func calculateRoute() {
        guard let userLocation = userLocation else { return }

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation.coordinate))
        request.destination = landmark.mapItem
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response, let route = response.routes.first else { return }

            self.travelTime = String(format: "%.0f minutes", route.expectedTravelTime / 60)
            self.distance = String(format: "%.1f km", route.distance / 1000)
            self.route = route
        }
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MKMapViewRepresentable

    init(_ parent: MKMapViewRepresentable) {
        self.parent = parent
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MKPointAnnotation {
            let selectedLandmark = parent.landmarks.first { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }
            if let landmark = selectedLandmark {
                parent.onAnnotationSelected?(landmark)
            }
        }
    }
}


#Preview {
    ContentView()
}
