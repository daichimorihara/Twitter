//
//  NewMessageView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/06.
//
import Kingfisher
import SwiftUI

struct NewMessageView: View {
    @ObservedObject var vm: NewMessageViewModel
    @Environment(\.dismiss) var dismiss
    
    let didSelectNewUser: (User) -> Void
    
    init(currentUser: User, didSelectNewUser: @escaping (User) -> Void) {
        self.vm = NewMessageViewModel(currentUser: currentUser)
        self.didSelectNewUser = didSelectNewUser
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.availableUsers) { user in
                    selectButton(user)
                }
            }
            .navigationTitle("New message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
    }
}

extension NewMessageView {
    func selectButton(_ user: User) -> some View {
        Button {
            didSelectNewUser(user)
            dismiss()
        } label: {
            HStack(spacing: 16) {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(user.fullname)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                
                Spacer()
        }
            .padding(.horizontal)
        }
    }
}


