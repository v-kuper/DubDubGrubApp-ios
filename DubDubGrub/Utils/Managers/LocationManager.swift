//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 22.12.24.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
