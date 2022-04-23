//
//  ImageUploader.swift
//  Twitter
//
//  Created by Daichi Morihara on 2022/04/22.
//

import Firebase
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, uid: String, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
//        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(uid)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUD: Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, error in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
        
    }
}
