//  DDGProfile.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import FirebaseFirestore

struct DDGProfile: Codable {
    
    static let kFirstName   = "firstName"
    static let kLastName    = "lastName"
    static let kAvatar      = "avatar"
    static let kCompanyName = "companyName"
    static let kBio         = "bio"
    static let kIsCheckedIn = "isCheckedIn"
    
    @DocumentID var documentID: String?
    let firstName: String
    let lastName: String
    let avatar: String
    let companyName: String
    let bio: String
    let isCheckedIn: Bool
    
    // Инициализатор для работы с Firestore документами
    init(document: DocumentSnapshot) {
        let data = document.data() ?? [:]
        
        self.documentID  = document.documentID
        self.firstName   = data[DDGProfile.kFirstName] as? String ?? "N/A"
        self.lastName    = data[DDGProfile.kLastName] as? String ?? "N/A"
        self.avatar      = data[DDGProfile.kAvatar] as? String ?? "N/A"
        self.companyName = data[DDGProfile.kCompanyName] as? String ?? "N/A"
        self.bio         = data[DDGProfile.kBio] as? String ?? "N/A"
        self.isCheckedIn = data[DDGProfile.kIsCheckedIn] as? Bool ?? false
    }
    
    // Инициализатор для создания нового объекта вручную
    init(documentID: String? = nil, firstName: String, lastName: String, avatar: String, companyName: String, bio: String, isCheckedIn: Bool) {
        self.documentID = documentID
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.companyName = companyName
        self.bio = bio
        self.isCheckedIn = isCheckedIn
    }
}
