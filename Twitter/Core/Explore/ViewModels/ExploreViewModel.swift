//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        self.fetchUsers()
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users.filter({ $0.id != currentUser.id })
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({ $0.id != currentUser.id &&
                ( $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery) )
            })
        }
    }
    
    func fetchUsers() {
        UserService().fetchUsers { users in
            self.users = users
        }
    }
    
}
