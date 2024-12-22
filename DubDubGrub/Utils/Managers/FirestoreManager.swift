//
//  FirebaseFirestore.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import FirebaseFirestore

struct FirestoreManager {
    static func getLocations(completed: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let db = Firestore.firestore()
        db.collection(RecordType.location).getDocuments { snapshot, error in
            if let error = error {
                completed(.failure(error))
                return
            }
            
            guard let snapshot = snapshot else {
                completed(.success([])) // Если данных нет, возвращаем пустой массив
                return
            }
            
            do {
                let locations = try snapshot.documents.compactMap { document -> DDGLocation? in
                    return try document.data(as: DDGLocation.self)
                }
                completed(.success(locations))
            } catch {
                completed(.failure(error))
            }
        }
    }
}
