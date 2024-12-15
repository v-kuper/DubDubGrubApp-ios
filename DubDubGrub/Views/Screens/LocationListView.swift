//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 10.12.24.
//

import SwiftUI

struct LocationListView: View {
    
    @State private var locations: [DDGLocation] = [MockData.location]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locations, id: \.documentID) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        LocationCell(location: location)
                    }
                }
            }
            .navigationTitle("Grub Spot")
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
