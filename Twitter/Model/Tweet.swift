//
//  Tweet.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Codable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
    
    var relativeTime: String {
        let date = timestamp.dateValue()
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

