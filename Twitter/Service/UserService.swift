//
//  UserService.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/22.
//

import FirebaseFirestoreSwift
import Firebase

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
}
