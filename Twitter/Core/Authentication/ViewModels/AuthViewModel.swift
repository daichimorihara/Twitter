//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/21.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    init() {
  //      self.userSession = nil
        
        
        self.userSession = Auth.auth().currentUser
        fetchUser()
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
                
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
//            let data = ["email": email,
//                        "username": username,
//                        "fullname": fullname,
//                        "uid": user.uid]
            let data = User(id: user.uid, username: username, fullname: fullname, profileImageUrl: "", email: email)
            
            
//            Firestore.firestore().collection("users")
//                .document(user.uid)
//                .setData(data) { _ in
//                    self.didAuthenticateUser = true
//                }
            let doc = Firestore.firestore().collection("users").document(user.uid)
                
            do {
                try doc.setData(from: data)
                self.didAuthenticateUser = true
            } catch {
                print("Failed to store user data into firestore: \(error.localizedDescription)")
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image, uid: uid) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }

                          
        }
        
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        UserService().fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    func signOut() {
        userSession = nil
        
        try? Auth.auth().signOut()
    }
}
