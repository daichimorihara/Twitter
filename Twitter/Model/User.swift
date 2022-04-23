//
//  User.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/22.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
    
}
