//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/25.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    func uploadTweet(withCaption caption: String) {
        TweetService().uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                // show error to user
            }
        }
    }
}
