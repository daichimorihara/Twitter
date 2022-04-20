
//
//  SideMenuViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/20.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case menulist
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .menulist: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .menulist: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
