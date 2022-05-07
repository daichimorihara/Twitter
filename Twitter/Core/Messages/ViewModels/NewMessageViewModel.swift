//
//  NewMessageViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/06.
//

import Foundation

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        fetchUsers()
    }
    func fetchUsers() {
        UserService().fetchUsers { users in
            self.users = users
        }
    }
    
    var availableUsers: [User] {
        return users.filter({ $0.id != currentUser.id })
    }
}
