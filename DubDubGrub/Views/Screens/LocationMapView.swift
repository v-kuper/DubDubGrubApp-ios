//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 10.12.24.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.4345, longitude: 30.9754),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region).ignoresSafeArea()
            
            VStack {
                LogoView().shadow(radius: 10)
                Spacer()
            }
        }
        .onAppear{
            FirestoreManager.getLocations { result in
                switch result {
                case .success(let locations):
                    print(locations)
                    for location in locations {
                                print("Локация: \(location.name), Адрес: \(location.address)")
                                print("Координаты: \(location.location.latitude), \(location.location.longitude)")
                            }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

struct LogoView: View {
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 70)
    }
}
