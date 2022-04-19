//
//  FeedView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/19.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            ForEach(1...20, id: \.self) { _ in
                TweetRowView()
                    .padding(.horizontal)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
