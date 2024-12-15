import FirebaseFirestore

struct DDGLocation {
    
    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAddress = "address"
    static let kLocation = "location"
    static let kWebsiteURL = "websiteURL"
    static let kPhoneNumber = "phoneNumber"
    
    let documentID: String
    let name: String
    let description: String
    let squareAsset: String
    let bannerAsset: String
    let address: String
    let location: GeoPoint
    let websiteURL: String
    let phoneNumber: String
    
    init(document: DocumentSnapshot) {
        self.documentID = document.documentID
        let data = document.data() ?? [:]
        
        self.name = data[DDGLocation.kName] as? String ?? "N/A"
        self.description = data[DDGLocation.kDescription] as? String ?? "N/A"
        self.squareAsset = data[DDGLocation.kSquareAsset] as? String ?? "N/A"
        self.bannerAsset = data[DDGLocation.kBannerAsset] as? String ?? "N/A"
        self.address = data[DDGLocation.kAddress] as? String ?? "N/A"
        self.websiteURL = data[DDGLocation.kWebsiteURL] as? String ?? "N/A"
        self.phoneNumber = data[DDGLocation.kPhoneNumber] as? String ?? "N/A"
        
        // Извлекаем GeoPoint для местоположения
        if let geoPoint = data[DDGLocation.kLocation] as? GeoPoint {
            self.location = geoPoint
        } else {
            // Если данные не доступны, устанавливаем дефолтное значение
            self.location = GeoPoint(latitude: 0.0, longitude: 0.0)
        }
    }
    
    // Функция для получения всех локаций
    static func fetchAllLocations(completion: @escaping ([DDGLocation]?, Error?) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("locations").getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            var locations: [DDGLocation] = []
            snapshot?.documents.forEach { document in
                let location = DDGLocation(document: document)
                locations.append(location)
            }
            
            completion(locations, nil)
        }
    }
    
    // Функция для добавления локации
    func saveLocation() {
        let db = Firestore.firestore()
        
        let locationData: [String: Any] = [
            DDGLocation.kName: self.name,
            DDGLocation.kDescription: self.description,
            DDGLocation.kSquareAsset: self.squareAsset,
            DDGLocation.kBannerAsset: self.bannerAsset,
            DDGLocation.kAddress: self.address,
            DDGLocation.kLocation: self.location, // Сохраняем GeoPoint
            DDGLocation.kWebsiteURL: self.websiteURL,
            DDGLocation.kPhoneNumber: self.phoneNumber
        ]
        
        // Добавление документа в коллекцию "locations"
        db.collection("locations").document(self.documentID).setData(locationData) { error in
            if let error = error {
                print("Ошибка при сохранении локации: \(error.localizedDescription)")
            } else {
                print("Локация сохранена успешно!")
            }
        }
    }
}
