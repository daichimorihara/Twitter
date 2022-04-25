//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    
    let user: User
    
    init(user: User) {
        self.user = user
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
}
