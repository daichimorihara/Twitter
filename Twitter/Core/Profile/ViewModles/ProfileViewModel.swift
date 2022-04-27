//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        fetchUserTweets()
        fetchLikedTweet()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets: return tweets
        case .replies: return tweets
        case .likes: return likedTweets
        }
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        TweetService().fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweet() {
        guard let uid = user.id else { return }
        TweetService().fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                UserService().fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
