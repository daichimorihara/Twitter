//
//  FeedViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()       
    }
    
    func fetchTweets() {
        TweetService().fetchTweets { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                
                UserService().fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
