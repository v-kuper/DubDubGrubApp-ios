//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 21.12.24.
//

import Foundation
import MapKit

final class LocationMapViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.4345, longitude: 30.9754),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @Published var locations: [DDGLocation] = []
    
    func getLocations() {
            FirestoreManager.getLocations { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let locations):
                        self.locations = locations
                    case .failure(_):
                        self.alertItem = AlertContext.unableToGetLocations
                    }
                }
            }
        }
}
