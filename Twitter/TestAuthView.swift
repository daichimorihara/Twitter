//
//  TestAuthView.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/26.
//

import SwiftUI
import Firebase

struct TestAuthView: View {
    var body: some View {
        VStack {
            Button {
                testRegister()
            } label: {
                Text("Register")
            }
         
            Button {
                testUpdate()
            } label: {
                Text("Update")
            }

        }

    }
    
    func testRegister() {
        let tweet = Tweet(id: "yes2",
                          caption: "hey",
                          timestamp: Timestamp(),
                          uid: "yes2",
                          likes: 0)
        
        let doc = Firestore.firestore().collection("tests").document("test1")
        do {
            try doc.setData(from: tweet)
        } catch {
            
        }
    }
    
    func testUpdate() {
        let doc = Firestore.firestore().collection("tests").document("test1")

        doc.updateData(["weare": "dogs"])
    }
}

struct TestAuthView_Previews: PreviewProvider {
    static var previews: some View {
        TestAuthView()
    }
}
