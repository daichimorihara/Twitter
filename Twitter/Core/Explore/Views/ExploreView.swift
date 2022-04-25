//
//  ExploreView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var vm: ExploreViewModel
    
    init(currentUser: User) {
        self.vm = ExploreViewModel(currentUser: currentUser)
    }
    
    
    var body: some View {
        VStack {
            SearchView(text: $vm.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(vm.searchableUsers) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }


    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(currentUser: User(username: "emma",
                                      fullname: "Emma",
                                      profileImageUrl: "",
                                      email: "emma@gmail.com"))
    }
}
