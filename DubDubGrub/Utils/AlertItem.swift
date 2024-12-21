//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 21.12.24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - MapView Errors
    static let unableToGetLocations = AlertItem(
        title: Text("Location"),
        message: Text("Unable to retrive locationd at this time. \nPlease tr again."),
        dismissButton: .default(Text("OK"))
    )
}
