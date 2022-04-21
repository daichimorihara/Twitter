//
//  NewTweetView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/21.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        
                }

            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
                    
            }
            .padding(.horizontal)
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
