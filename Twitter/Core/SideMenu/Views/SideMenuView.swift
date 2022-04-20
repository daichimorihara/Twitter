//
//  SideMenuView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/20.
//

import SwiftUI

struct SideMenuView: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    Circle()
                        .frame(width: 48, height: 48)
                    
                    Text("Jack Dorsey")
                        .font(.headline)
                    
                    Text("@jack")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    UserStatsView()
                        .padding(.vertical, 3)
                }
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                    if option == .profile {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SideMenuRowView(vm: option)
                        }
                    } else if option == .logout {
                        Button {
                            print("Log out")
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
