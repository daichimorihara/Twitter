//
//  RecentMessage.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/05.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import CoreImage
import SwiftUI

struct RecentMessage: Identifiable, Codable {
    @DocumentID var id: String?
    
    let fullname: String
    let username: String
    let text: String
    let profileImageUrl: String
    let email: String
    let timestamp: Timestamp
    
}
