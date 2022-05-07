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
    
    static var bottomId = "bottom"
    
    var body: some View {
        ZStack {
            mainMessages
            VStack {
                Spacer()
                bottomBar
            }
        }
        .navigationTitle(friend?.fullname ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: vm.fetchMessages)
    }
}

extension ChatLogView {
    var mainMessages: some View {
        ScrollViewReader { proxy in
            ScrollView {
                ForEach(vm.messages) { message in
                    ChatTextView(message: message)
                }
                HStack { Spacer() }
                    .frame(height: 50)
                    .id(Self.bottomId)
            }
            .onReceive(vm.$messages) { _ in
                withAnimation(.linear(duration: 0.1)) {
                    proxy.scrollTo(Self.bottomId, anchor: .bottom)
                }
            }
        }
    }
    
    var bottomBar: some View {
        HStack {
            Image(systemName: "photo.on.rectangle")
            ZStack {
                HStack {
                    Text("Start a message")
                        .foregroundColor(.gray)
                        .padding(.leading, 2)
                    Spacer()
                }
                TextEditor(text: $vm.text).opacity(vm.text.isEmpty ? 0.2 : 1)
            }
            .frame(height: 40)
            
            Button {
                vm.sendMessage()
            } label: {
                Text("Send")
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
        .padding(.horizontal, 3)
        .overlay(RoundedRectangle(cornerRadius: 0)
            .stroke(lineWidth: 1)
            .foregroundColor(.gray))
    }

}


