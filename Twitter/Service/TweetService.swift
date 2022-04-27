//
//  TweetService.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/25.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
//        let data = ["uid": uid,
//                    "caption": caption,
//                    "likes": 0,
//                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
//        Firestore.firestore().collection("tweets").document()
//            .setData(data) { error in
//                if let error = error {
//                    print("DEBUD: Failed to upload tweet with error \(error.localizedDescription)")
//                    return
//                }
//
//                completion(true)
//            }
        
        let doc = Firestore.firestore().collection("tweets").document()
        let data = Tweet(id: doc.documentID, caption: caption, timestamp: Timestamp(), uid: uid, likes: 0)
        do {
            try doc.setData(from: data)
            completion(true)
        } catch {
            print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
        }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets)
            }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    
    
    
    func likeTweet(tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        let likeRef = Firestore.firestore().collection("users").document(uid).collection("likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes + 1]) { _ in
                likeRef.document(tweetId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikeTweet(tweet: Tweet, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        let likeRef = Firestore.firestore().collection("users").document(uid).collection("likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes - 1]) { _ in
                likeRef.document(tweetId).delete { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikedTweet(tweet: Tweet, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        
        Firestore.firestore().collection("users")
                .document(uid)
                .collection("likes")
                .document(tweetId)
                .getDocument { snapshot, _ in
                    guard let snapshot = snapshot else { return }
                    completion(snapshot.exists)
                }
    }
    
    func fetchLikedTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        Firestore.firestore().collection("users").document(uid)
            .collection("likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                documents.forEach { doc in
                    let tweetId = doc.documentID
                    Firestore.firestore().collection("tweets")
                        .document(tweetId)
                        .getDocument { snapshot, _ in
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else { return }
                            tweets.append(tweet)
                        }
                }
                completion(tweets)
            }
    }
}
