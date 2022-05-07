//
//  ChatLogViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/06.
//

import Foundation

class ChatLogViewModel: ObservableObject {
    @Published var messages = [Message]()
    @Published var text = ""
    
    let friend: User?
    
    init(friend: User?) {
        self.friend = friend
        
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let friendId = friend?.id else { return }

        MessageService().fetchMessages(friendId: friendId) { messages in
            DispatchQueue.main.async {
                self.messages = messages
            }
            //self.messages = messages
        }
    }
    
    func sendMessage() {
        guard let friendId = friend?.id else { return }
        
        MessageService().sendMessage(friendId: friendId, text: text) {
            MessageService().persistRecentMessage(friendId: friendId, text: self.text) {
                self.text = ""
            }
            
        }
    }
}
