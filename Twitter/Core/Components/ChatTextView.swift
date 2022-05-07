//
//  ChatTextView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/07.
//

import SwiftUI
import Firebase

struct ChatTextView: View {
    let message: Message
    
    var body: some View {
        if message.fromId == Auth.auth().currentUser?.uid {
            HStack {
                Spacer()
                
                Text(message.text)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
        } else {
            HStack {
                Text(message.text)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemGray))
                    .cornerRadius(8)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
        }
    }
}

struct ChatTextView_Previews: PreviewProvider {
    static var previews: some View {
        ChatTextView(message: Message(id: "", fromId: "", toId: "", text: "Hello", timestamp: Timestamp()))
    }
}
