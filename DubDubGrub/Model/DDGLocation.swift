//  DDGLocation.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import FirebaseFirestore

struct DDGLocation: Codable {
    
    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAddress = "address"
    static let kLocation = "location"
    static let kWebsiteURL = "websiteURL"
    static let kPhoneNumber = "phoneNumber"
    
    @DocumentID var documentID: String?  // ID документа в Firestore
    let name: String
    let description: String
    let squareAsset: String
    let bannerAsset: String
    let address: String
    let location: GeoPoint  // Тип GeoPoint для широты и долготы
    let websiteURL: String
    let phoneNumber: String
    
    // Инициализатор для работы с Firestore документами
    init(document: DocumentSnapshot) {
        let data = document.data() ?? [:]
        
        self.documentID = document.documentID
        self.name = data[DDGLocation.kName] as? String ?? "N/A"
        self.description = data[DDGLocation.kDescription] as? String ?? "N/A"
        self.squareAsset = data[DDGLocation.kSquareAsset] as? String ?? "N/A"
        self.bannerAsset = data[DDGLocation.kBannerAsset] as? String ?? "N/A"
        self.address = data[DDGLocation.kAddress] as? String ?? "N/A"
        self.websiteURL = data[DDGLocation.kWebsiteURL] as? String ?? "N/A"
        self.phoneNumber = data[DDGLocation.kPhoneNumber] as? String ?? "N/A"
        
        if let geoPoint = data[DDGLocation.kLocation] as? GeoPoint {
            self.location = geoPoint
        } else {
            self.location = GeoPoint(latitude: 0.0, longitude: 0.0) // Дефолтное значение
        }
    }
}
