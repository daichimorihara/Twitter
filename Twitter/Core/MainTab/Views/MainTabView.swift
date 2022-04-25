//
//  MainTabView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State private var selectedTab: Tabs = .tag1
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tabs.tag1)
            
            if let user = vm.currentUser {
                ExploreView(currentUser: user)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(Tabs.tag2)
            }

            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(Tabs.tag3)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(Tabs.tag4)
        }
        .navigationTitle(selectedTab.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
