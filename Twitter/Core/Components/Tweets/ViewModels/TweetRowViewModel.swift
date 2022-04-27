//
//  TweetRowViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/25.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        TweetService().likeTweet(tweet: tweet) {
            self.tweet.didLike = true
            self.tweet.likes += 1
        }
    }
    
    func unlikeTweet() {
        TweetService().unlikeTweet(tweet: tweet) {
            self.tweet.didLike = false
            self.tweet.likes -= 1
        }
    }
    
    func checkIfUserLikedTweet() {
        TweetService().checkIfUserLikedTweet(tweet: tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
}
