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
    }
}
