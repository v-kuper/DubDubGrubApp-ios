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
