//
//  UserChatBoxView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/05/05.
//

import SwiftUI
import Kingfisher
import Firebase

struct UserChatBoxView: View {
    let recentMessage: RecentMessage
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: recentMessage.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recentMessage.fullname)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("@\(recentMessage.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(recentMessage.text)
                    .foregroundColor(.gray)
                

            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        UserChatBoxView(recentMessage: RecentMessage(id: "",
                                                     fullname: "emma chamberlain",
                                                     username: "emma",
                                                     text: "hi",
                                                     profileImageUrl: "", email: "e@gmail.com",
                                                     timestamp: Timestamp()))
    }
}
