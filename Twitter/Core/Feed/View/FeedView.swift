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
                Image(systemName: "pencil.and.outline")
                    .font(.system(size: 32))
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
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
