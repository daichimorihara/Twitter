//
//  MessagesView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct MessagesView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var vm = MessagesViewModel()
    @State private var isShowingNewMessageView = false
    @State private var isShowingChatLogView = false
    @State private var friend: User?
    
    
    var body: some View {
        if let currentUser = authViewModel.currentUser {
            ZStack(alignment: .bottomTrailing) {
                NavigationLink("", isActive: $isShowingChatLogView) {
                    ChatLogView(friend: friend)
                }
                
                ScrollView {
                    LazyVStack {
                        chatWithFriend
                    }
                }
                newMessageButton
            }
            .fullScreenCover(isPresented: $isShowingNewMessageView) {
                NewMessageView(currentUser: currentUser, didSelectNewUser: { user in
                    self.friend = user
                    isShowingChatLogView.toggle()
                    
                })
            }
        }
    }
}

extension MessagesView {
    var chatWithFriend: some View {
        
        ForEach(vm.recentMessages) { rm in
            UserChatBoxView(recentMessage: rm)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.friend = User(id: rm.id,
                                       username: rm.username,
                                       fullname: rm.fullname,
                                       profileImageUrl: rm.profileImageUrl,
                                       email: rm.email)
                    
                    self.isShowingChatLogView.toggle()
                }
        }
    }
    
    var newMessageButton: some View {
        Button {
            self.isShowingNewMessageView.toggle()
        } label: {
            Image(systemName: "envelope.badge")
                .padding()
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
        }
    }
    
    
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
