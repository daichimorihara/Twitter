//
//  FeedView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                ForEach(1...20, id: \.self) { _ in
                    TweetRowView()
                        .padding(.horizontal)
                }
            }
            
            Button {
                print("new tweet view")
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
