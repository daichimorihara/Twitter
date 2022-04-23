//
//  FeedView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                ForEach(1...20, id: \.self) { _ in
                    TweetRowView()
                        .padding(.horizontal)
                }
            }
            
            Button {
                self.showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()

            }
        }
        .fullScreenCover(isPresented: $showNewTweetView) {
            NewTweetView()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
