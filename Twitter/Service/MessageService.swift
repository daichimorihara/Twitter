//
//  MessageService.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/04.
//

import Foundation
import Firebase

struct MessageService {
    
    func fetchMessages(friendId: String, completion: @escaping([Message]) -> Void) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        var messages = [Message]()
        
        Firestore.firestore().collection("messages")
            .document(currentUserId)
            .collection(friendId)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                guard let snapshot = querySnapshot else {
                    print("Failed to fetch message \(error?.localizedDescription ?? "")")
                    return
                }
                snapshot.documentChanges.forEach { change in
                    if change.type == .added {
                        if let newMessage = try? change.document.data(as: Message.self) {
                            messages.append(newMessage)
                        }
                    }
                }
                completion(messages)
            }
    }
    
    func fetchRecentMessages(completion: @escaping ([RecentMessage]) -> Void) {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        var recentMessages = [RecentMessage]()
        
        Firestore.firestore().collection("recent")
            .document(currentUserId)
            .collection("messages")
            .addSnapshotListener { querySnapshot, error in
                if let snapshot = querySnapshot {
                    snapshot.documentChanges.forEach { change in
                        let docId = change.document.documentID
                        if let idx = recentMessages.firstIndex(where: { rm in rm.id == docId }) {
                            recentMessages.remove(at: idx)
                        }
                        if let rm = try? change.document.data(as: RecentMessage.self) {
                            recentMessages.insert(rm, at: 0)
                            completion(recentMessages)
                        }

                    }
                }
            }
        
    }
    
    func sendMessage(friendId: String, text: String, completion: @escaping() -> Void) {
        
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        if text.isEmpty {
            return
        }
        
        let document = Firestore.firestore().collection("messages")
            .document(currentUserId)
            .collection(friendId)
            .document()
        
        let data = Message(id: document.documentID,
                           fromId: currentUserId,
                           toId: friendId,
                           text: text,
                           timestamp: Timestamp())
        
        do {
            try document.setData(from: data)
        } catch {
            print(error.localizedDescription)
        }
        
        let friendDoc = Firestore.firestore().collection("messages")
            .document(friendId)
            .collection(currentUserId)
            .document()
        
        let friendData = Message(id: friendDoc.documentID,
                           fromId: currentUserId,
                           toId: friendId,
                           text: text,
                           timestamp: Timestamp())
        
        do {
            try friendDoc.setData(from: friendData)
        } catch {
            print(error.localizedDescription)
        }
        
        completion()
    }
    
    func persistRecentMessage(friendId: String, text: String, completion: @escaping() -> Void) {
        
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        let document = Firestore.firestore().collection("recent")
            .document(currentUserId)
            .collection("messages")
            .document(friendId)
        
        
        UserService().fetchUser(withUid: friendId) { user in
            
            let data = RecentMessage(id: document.documentID,
                                     fullname: user.fullname,
                                     username: user.username,
                                     text: text,
                                     profileImageUrl: user.profileImageUrl,
                                     email: user.email,
                                     timestamp: Timestamp())
            
            do {
                try document.setData(from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        let friendDoc = Firestore.firestore().collection("recent")
            .document(friendId)
            .collection("messages")
            .document(currentUserId)
        
        UserService().fetchUser(withUid: currentUserId) { user in
            
            let friendData = RecentMessage(id: friendDoc.documentID,
                                           fullname: user.fullname,
                                           username: user.username,
                                           text: text,
                                           profileImageUrl: user.profileImageUrl,
                                           email: user.email,
                                           timestamp: Timestamp())
            
            do {
                try friendDoc.setData(from: friendData)
            } catch {
                print(error.localizedDescription)
            }
        }
        completion()
    }
    
    
    
    
    
}
