//
//  MessagesViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/05.
//

import Foundation

class MessagesViewModel: ObservableObject {
    @Published var recentMessages = [RecentMessage]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        MessageService().fetchRecentMessages { messages in
            self.recentMessages = messages
        }
    }
}
