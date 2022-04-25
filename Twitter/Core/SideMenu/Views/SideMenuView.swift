//
//  SideMenuView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/20.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading) {
                        
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)

                        
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        UserStatsView()
                            .padding(.vertical, 3)
                    }
                    
                    ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                        if option == .profile {
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                SideMenuRowView(vm: option)
                            }
                        } else if option == .logout {
                            Button {
                                authViewModel.signOut()
                            } label: {
                                SideMenuRowView(vm: option)
                            }

                        } else {
                            SideMenuRowView(vm: option)
                        }
                        


                    }
                    
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
