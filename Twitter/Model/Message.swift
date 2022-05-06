//
//  Message.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/04.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let text: String
    let timestamp: Timestamp
}
