//
//  MockData.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import FirebaseFirestore

struct MockData {
    static var location: DDGLocation {
        let newLocation = DDGLocation(
            name: "Example Location",
            description: "A wonderful place to visit",
            squareAsset: "example_square_asset_url",
            bannerAsset: "example_banner_asset_url",
            address: "123 Main Street",
            location: GeoPoint(latitude: 37.7749, longitude: -122.4194), // Сан-Франциско
            websiteURL: "https://example.com",
            phoneNumber: "+14155552671"
        )
        return newLocation
    }
    
    static var profile: DDGProfile {
        let newProfile = DDGProfile(
            firstName: "John",
            lastName: "Doe",
            avatar: "avatar_url",
            companyName: "Tech Corp",
            bio: "Software Developer",
            isCheckedIn: true
        )
        return newProfile
    }
}
