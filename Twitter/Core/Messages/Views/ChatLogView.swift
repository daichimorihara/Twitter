//
//  ChatLogView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/04.
//

import SwiftUI

struct ChatLogView: View {
    @ObservedObject var vm: ChatLogViewModel
    let friend: User?
    
    init(friend: User?) {
        self.friend = friend
        vm = ChatLogViewModel(friend: friend)
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


