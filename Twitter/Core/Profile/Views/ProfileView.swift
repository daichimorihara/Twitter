//
//  ProfileView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Jack Dorsey")
                        .font(.title2)
                        .bold()
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Text("@jack")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Your moms favorite villain")
                    .font(.subheadline
                    )
                    .padding(.vertical, 5)
                
                HStack(spacing: 24) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        
                        Text("Los Angels, CA")
                    }
                    
                    HStack {
                        Image(systemName: "link")
                        
                        Text("www.jackdorsey.com")
                    }
                }
                .font(.caption)
                .foregroundColor(.gray)
                
                HStack(spacing: 24) {
                    HStack(spacing: 4) {
                        Text("122")
                            .font(.subheadline)
                            .bold()
                        
                        Text("Following")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 4) {
                        Text("5.4M")
                            .font(.subheadline)
                            .bold()
                        
                        Text("Followes")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 5)
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                        
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)

            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth:0.75))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                
            }

        }
        .padding(.trailing)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
